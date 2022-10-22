unit IQMS.Common.RollbackManager;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,FireDAC.Phys;
//     db_dm;

type
  IRollbackManager = interface
    ['{EF536DE3-F23F-4B8A-B774-6973ED3F2635}']

    procedure Associate(IgnoreError: Boolean = False);
    procedure OnLine(ABringOnLine: Boolean);

    procedure ExecuteCommand(const ASQL: string;
      const AConnectionName: string);
    procedure ExecuteCommandFmt(const ASQL: string; const Args: array of const;
      const AConnectionName: string);
    procedure ExecuteCommandParam(const ASQL: string;
      const ParamsList: array of string;
      const ParamValues: array of Variant;
      const AConnectionName: string);

    procedure StartTransaction(AConnectionName: string);
    procedure CheckRollBack(AConnectionName: string);
    procedure Commit(AConnectionName: string);

    function InTransaction: Boolean;
  end;

  { TFDRollbackManager }
  TFDRollbackManager = class(TInterfacedObject, IRollbackManager)
  strict private
    FTableSpace: string;
    FSegmentName: string;
    FInitialSize: Integer;
    FNextSize: Integer;

    // support for ExecuteCommand
    FFDConnection: TFDConnection;
    FWasInTrans: Boolean;

    // support for EServer
    FDataBaseName: string;

    function CheckRBSOnLine: Boolean;
    function GetStatus: string;
    procedure CreateRBS;
    procedure DropRBS;
    procedure OpenRBS;
    procedure CloseRBS;

    function FindConnection(const AConnectionName: string = 'IQFD')
      : TFDConnection;
  public
    constructor Create(const ARBSName: string; ATabSpace: string = '';
      AInitSize: Integer = 100; ANextSize: Integer = 300;
      const AConnectionName: string = 'IQFD');
    destructor Destroy; override;
    procedure Associate(IgnoreError: Boolean = False);
    procedure OnLine(ABringOnLine: Boolean);

    // The following functions support ExecuteCommand and alike with RB implementation
    procedure ExecuteCommand(const ASQL: string;
      const AConnectionName: string = 'IQFD');
    procedure ExecuteCommandFmt(const ASQL: string; const Args: array of const;
      const AConnectionName: string = 'IQFD');
    procedure ExecuteCommandParam(const ASQL: string;
      const ParamsList: array of string;
      const ParamValues: array of Variant;
      const AConnectionName: string = 'IQFD');

    // The following funcitons support TDataSet edit/insert/delete w/RB implementation
    procedure StartTransaction(AConnectionName: string = 'IQFD');
    procedure CheckRollBack(AConnectionName: string = 'IQFD');
    procedure Commit(AConnectionName: string = 'IQFD');

    function InTransaction: Boolean;

    class procedure RemoveRollbackSegmentsOlderThan(ADays: Real;
      const AConnectionName: string = 'IQFD');
  published
    // Published declarations
    property FDConnection: TFDConnection read FFDConnection;
  end;

  (* The following functions support TDataSet edit/insert/delete w/RB implementation
    --------------------------------------------------------------------------------
    RB.StartTransaction;
    try
    {existing code}

    RB.Commit;
    except
    RB.CheckRollBack;

    {existing code}
    end;

  *)

implementation

uses
  Data.DB,
  IQMS.Common.DataLib, // ,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.ResStrings,
  IQMS.Common.PanelMsg;

{$REGION  'TFDRollbackManager' }

constructor TFDRollbackManager.Create(const ARBSName: string;
  ATabSpace: string; AInitSize: Integer; ANextSize: Integer;
  const AConnectionName: string);
var
  AFDCustomConnection: TFDCustomConnection;
begin
  AFDCustomConnection := FDManager.FindConnection(AConnectionName);
  if Assigned(AFDCustomConnection) and AFDCustomConnection.Connected then
  begin
    FFDConnection := TFDConnection(AFDCustomConnection);
    FDataBaseName := FFDConnection.ConnectionName;

    RemoveRollbackSegmentsOlderThan(1, FDataBaseName);

    ATabSpace := SelectValueFmtAsString(
      'SELECT tablespace_name FROM dba_tablespaces WHERE tablespace_name = ''%s''',
      [ATabSpace],
      FDataBaseName);
    if ATabSpace = '' then
      ATabSpace := SelectValueAsString(
        'SELECT tablespace_name FROM dba_tablespaces WHERE tablespace_name = ''RBS''',
        FDataBaseName);
    if ATabSpace = '' then
      ATabSpace := SelectValueAsString(
        'SELECT tablespace_name FROM dba_tablespaces WHERE tablespace_name = ''ROLLBACK_DATA''',
        FDataBaseName);
    if ATabSpace = '' then
      ATabSpace := SelectValueAsString(
        'SELECT tablespace_name FROM dba_tablespaces WHERE tablespace_name = ''TEMP''',
        FDataBaseName);

    if ATabSpace > '' then
    begin
      FTableSpace := ATabSpace;
      FInitialSize := AInitSize;
      FNextSize := ANextSize;

      // RB_PAYROLL_1234$121302 - represents rollback created for PAYROLL,
      // unique ID = 1234, Date = 12/13/2002
      FSegmentName := Format('%s_%d$%s',
        [UpperCase(ARBSName),
        Trunc(GetNextSequenceNumber('IQ_RB_SEQUENCE')),
        FormatDateTime('MMDDYY', Date)]);

      with TFDQuery.Create(nil) do
        try
          try
            Connection := FFDConnection;
            SQL.Add('SELECT tablespace_name,');
            SQL.Add('       init_size,');
            SQL.Add('       next_ext');
            SQL.Add('  FROM iq_rollback');
            SQL.Add(' WHERE UPPER(segment_name) = :segment_name');
            with ParamByName('segment_name') do
            begin
              DataType := ftString;
              ParamType := ptInput;
              AsString := UpperCase(ARBSName);
            end;
            Open;
            if not (Eof and Bof) then
            begin
              if FieldByName('tablespace_name').AsString > '' then
                FTableSpace := UpperCase(FieldByName('tablespace_name')
                  .AsString);
              if FieldByName('init_size').asInteger > 0 then
                FInitialSize := FieldByName('init_size').asInteger;
              if FieldByName('next_ext').asInteger > 0 then
                FNextSize := FieldByName('next_ext').asInteger;
            end;
          except
          end;
        finally
          Free;
        end;

      OpenRBS;
    end;
  end;
end;

class procedure TFDRollbackManager.RemoveRollbackSegmentsOlderThan
  (ADays: Real; const AConnectionName: string);
var
  AConnection: TFDCustomConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName);
  if Assigned(AConnection) and AConnection.Connected then
    // Rollback segment name looks like: RB_PAYROLL_1234$121302.
    // Note the $. 6 last chars represent the date it was created
    with TFDQuery.Create(nil) do
      try
        Connection := AConnection;
        SQL.Add('SELECT segment_date,');
        SQL.Add('       segment_name,');
        SQL.Add('       status');
        SQL.Add('  FROM (SELECT TO_DATE(SUBSTR(segment_name,');
        SQL.Add('                              -6,');
        SQL.Add('                              6),');
        SQL.Add('                       ''MMDDYY'')');
        SQL.Add('                  segment_date,');
        SQL.Add('               segment_name,');
        SQL.Add('               status');
        SQL.Add('          FROM dba_rollback_segs');
        SQL.Add('         WHERE INSTR(segment_name,');
        SQL.Add('                     ''$'') > 0 AND');
        SQL.Add('               SUBSTR(RTRIM(segment_name),');
        SQL.Add('                      INSTR(RTRIM(segment_name),');
        SQL.Add('                            ''$'')) > '''')');
        SQL.Add(' WHERE segment_date <= SYSDATE - :days');
        with ParamByName('days') do
        begin
          DataType := ftFloat;
          ParamType := ptInput;
          AsFloat := ADays;
        end;
        Open;
        while not Eof do
        begin
          try
            // Put OFFLINE
            if CompareText(FieldByName('status').AsString, 'ONLINE') = 0 then
              IQMS.Common.DataLib.ExecuteCommandFmt(
                'ALTER ROLLBACK SEGMENT %s OFFLINE',
                [FieldByName('segment_name').AsString],
                AConnectionName);

            // Drop it
            IQMS.Common.DataLib.ExecuteCommandFmt(
              'DROP ROLLBACK SEGMENT %s',
              [FieldByName('segment_name').AsString],
              AConnectionName);
          except
            // supress exceptions
          end;

          Next;
        end;
      finally
        Free;
      end;
end;

destructor TFDRollbackManager.Destroy;
begin
  CloseRBS;
  inherited;
end;

procedure TFDRollbackManager.CloseRBS;
var
  AStatus: string;
begin
  try
    AStatus := GetStatus();
    if CompareText(AStatus, 'ONLINE') = 0 then
      OnLine(False);
    if AStatus > '' then
      DropRBS;
  except
    on E: Exception do
      try
        // IQMS.Common.ResourceStrings.cTXT0000163 =
        // 'Error executing procedure, CloseRBS: %s'
        IQWarning(Format(
          IQMS.Common.ResStrings.cTXT0000163, [E.Message]));
      except
      end;
  end;
end;

procedure TFDRollbackManager.DropRBS;
var
  Msg: TPanelMesg;
begin
  if FSegmentName > '' then
  begin
    // IQMS.Common.ResourceStrings.cTXT0000164 =
    // 'Terminating RB Segment, %s...'
    Msg := hPleaseWait(Format(IQMS.Common.ResStrings.cTXT0000164, [FSegmentName]));
    try
      try
        IQMS.Common.DataLib.ExecuteCommandFmt(
          'DROP PUBLIC ROLLBACK SEGMENT %s',
          [FSegmentName],
          FDataBaseName);
      finally
        FreeAndNil(Msg);
      end;
    except
      on E: Exception do
        // // 'Error executing procedure, DropRBS: %s'
        raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000165, [E.Message]);
    end;
  end;
end;

procedure TFDRollbackManager.OpenRBS;
begin
  try
    if not CheckRBSOnLine then
    begin
      CreateRBS;
      OnLine(True);
    end;
  except
    on E: Exception do
      // 'Error executing procedure ''OpenRBS'': %s'
      raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000166, [E.Message]);
  end;
end;

function TFDRollbackManager.GetStatus: string;
begin
  Result := '';
  if (FTableSpace > '') and (FSegmentName > '') then
    Result := SelectValueFmtAsString(
      'SELECT status FROM dba_rollback_segs WHERE segment_name = ''%s'' AND tablespace_name = ''%s''',
      [FSegmentName, FTableSpace],
      FDataBaseName);
end;

function TFDRollbackManager.CheckRBSOnLine: Boolean;
var
  S: string;
begin
  S := GetStatus();

  Result := CompareText(S, 'ONLINE') = 0;

  if CompareText(S, 'OFFLINE') = 0 then
    DropRBS;
end;

procedure TFDRollbackManager.CreateRBS;
var
  Msg: TPanelMesg;
  AErrorDetail: string;
begin
  if (FSegmentName > '') and (FTableSpace > '') then
    // IQMS.Common.ResourceStrings.cTXT0000167 =
    // 'Creating RB Segment, %s...'
    try
      AErrorDetail := Format(
        'SEGMENT = %s'#13 +
        'TABLESPACE = %s'#13 +
        'INITIAL = %dk'#13 +
        'NEXT = %dk',
        [FSegmentName,
        FTableSpace,
        FInitialSize,
        FNextSize]);

      Msg := hPleaseWait(Format(IQMS.Common.ResStrings.cTXT0000167, [FSegmentName]));
      try
        IQMS.Common.DataLib.ExecuteCommandFmt(
          'CREATE PUBLIC ROLLBACK SEGMENT %s   ' +
          '                    TABLESPACE %s   ' +
          '             STORAGE ( INITIAL %dk  ' +
          '                          NEXT %dk  ' +
          '                    MINEXTENTS 121  ' +
          '                    MAXEXTENTS 121 )',
          [FSegmentName,
          FTableSpace,
          FInitialSize,
          FNextSize],
          FDataBaseName);
      finally
        FreeAndNil(Msg);
      end;
    except
      on E: Exception do
        // 'Error executing procedure, CreateRBS:  %s'
        raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000168 + #13#13 +
          AErrorDetail,
          [E.Message]);
    end;
end;

procedure TFDRollbackManager.OnLine(ABringOnLine: Boolean);
var
  ACurrentlyOnLine: Boolean;
begin
  if FSegmentName > '' then
    try
      ACurrentlyOnLine := CompareText('ONLINE', GetStatus) = 0;

      if not ACurrentlyOnLine and ABringOnLine then
        IQMS.Common.DataLib.ExecuteCommandFmt(
          'ALTER ROLLBACK SEGMENT %s ONLINE',
          [FSegmentName],
          FDataBaseName)
      else
        if ACurrentlyOnLine and not ABringOnLine then
      begin
        ExecuteCommand('commit', FDataBaseName);
        IQMS.Common.DataLib.ExecuteCommandFmt(
          'ALTER ROLLBACK SEGMENT %s OFFLINE',
          [FSegmentName],
          FDataBaseName);
      end;
    except
      on E: Exception do
        // 'Error executing procedure, OnLine: %s'
        raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000169, [E.Message]);
    end;
end;

procedure TFDRollbackManager.Associate(IgnoreError: Boolean);
begin
  if FSegmentName > '' then
    try
      IQMS.Common.DataLib.ExecuteCommandFmt(
        'SET TRANSACTION USE ROLLBACK SEGMENT %s',
        [FSegmentName],
        FDataBaseName);
    except
      on E: Exception do
        if not IgnoreError then
        begin
          // 'Unable to associate the current transaction with the RB name, %s.'#13#13'%s';
          // cannot display anything under thread execution (eserver)
          raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000170,
            [FSegmentName, E.Message]);
        end;
    end;
end;

function TFDRollbackManager.FindConnection(const AConnectionName: string)
  : TFDConnection;
var
  AConnection: TFDCustomConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName);
  if Assigned(AConnection) and (AConnection is TFDConnection) then
    Result := TFDConnection(AConnection)
  else if not Assigned(AConnection) then
    // IQMS.Common.ResourceStrings.cTXT0000171 = 'Unable to find database, %s'
    raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000171,
      [AConnectionName]);
end;

// The following functions support ExecuteCommand and alike with RB implementation
procedure TFDRollbackManager.ExecuteCommand(const ASQL: string;
  const AConnectionName: string);
begin
  FFDConnection := FindConnection(AConnectionName);
  FWasInTrans := FFDConnection.InTransaction;
  try
    // Start tarnsaction if needed
    if not FWasInTrans then
    begin
      FFDConnection.StartTransaction;
      // Associate with the RB
      Associate;
    end;

    // Run SQL
    try
      // Full namespace must be used or recursion will occur.
      ExecuteCommand(ASQL, AConnectionName);
    except
      on E: Exception do
        raise Exception.CreateFmt('%s. '#13#13' SQL: '#13'%s',
          [E.Message, ASQL]);
    end;

    if not FWasInTrans then
      FFDConnection.Commit;

  finally
    if FFDConnection.InTransaction and not FWasInTrans then
      FFDConnection.RollBack;
  end;
end;

procedure TFDRollbackManager.ExecuteCommandFmt(const ASQL: string;
  const Args: array of const; const AConnectionName: string);
begin
  self.ExecuteCommand(IQFormat(ASQL, Args), AConnectionName);
end;

procedure TFDRollbackManager.ExecuteCommandParam(const ASQL: string;
  const ParamsList: array of string; const ParamValues: array of Variant;
  const AConnectionName: string);
begin
  if high(ParamsList) <> high(ParamValues) then
    raise Exception.Create
      ('Application Error: Params and Values do not match.');

  FFDConnection := FindConnection(AConnectionName);
  FWasInTrans := FFDConnection.InTransaction;
  try
    // Start tarnsaction if needed
    if not FWasInTrans then
    begin
      FFDConnection.StartTransaction;
      // Associate with the RB
      Associate;
    end;

    // Run SQL!
    try
      ExecuteCommandParam(ASQL, ParamsList, ParamValues, AConnectionName);
    except
      on E: Exception do
        raise Exception.CreateFmt('%s. '#13#13' SQL: '#13'%s',
          [E.Message, ASQL]);
    end;

    if not FWasInTrans then
      FFDConnection.Commit;

  finally
    if FFDConnection.InTransaction and not FWasInTrans then
      FFDConnection.RollBack;
  end;

end;

procedure TFDRollbackManager.StartTransaction(AConnectionName: string);
begin
  FFDConnection := FindConnection(AConnectionName);
  if not FFDConnection.InTransaction then
    FFDConnection.StartTransaction;

  self.Associate;
end;

procedure TFDRollbackManager.Commit(AConnectionName: string);
begin
  FFDConnection := FindConnection(AConnectionName);

  if FFDConnection.InTransaction then
    FFDConnection.Commit;
end;

procedure TFDRollbackManager.CheckRollBack(AConnectionName: string);
begin
  FFDConnection := FindConnection(AConnectionName);

  if FFDConnection.InTransaction then
    FFDConnection.RollBack;
end;

function TFDRollbackManager.InTransaction: Boolean;
begin
  Result := FFDConnection.InTransaction;
end;

{$ENDREGION  'TFDRollbackManager' }

end.
