(* ************************************************************************
  Export data to a Microsoft Access file (.MDB, .MDE)
  ************************************************************************* *)

unit dbtexpm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  dbthiddn,
  DB,
  StdCtrls,
  Buttons,
  uniGUIApplication,
  ADODB,
  IQMS.Common.JumpConstants,
  ComCtrls,
  comobj,
  Variants,
  Menus,
  ExtCtrls, uniProgressBar, uniLabel, uniMainMenu, uniGUIBaseClasses,
  uniGUIClasses, uniPanel;

type
  { TFrmDBTransExportMDB }
  TFrmDBTransExportMDB = class(TFrmDBTransHidden)
    lblStatus: TUniLabel;
    ProgressBar: TUniProgressBar;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniFormShow(Sender: TObject);
    private
      { Private declarations }
      FCancel: Boolean;
      FDatabaseName: string;
      FTableName: string;
      FUserName: string;
      FPassword: string;
      FProgressMessage: string;
      function StartUp: Boolean;
      function DoProcessExec: Boolean; override; // main method to run export
      function DoImport: Boolean;
      procedure UpdateStatusText(S: string);
      procedure RaiseError(S: string);
      procedure RaiseErrorMemo(AHeader, AError, ADetail: string);
      function IsFileInUse(const AFileName: string): Boolean;
      function CheckProgressAborted: Boolean;
    public
      { Public declarations }
      constructor Create;

      property SQLConnection;
      property SourceDataset;
      property Logging;
      property LogFile;
      property ErrorLogFile;

      property TableName: string
        read FTableName
        write FTableName;
      property DatabaseName: string
        read FDatabaseName
        write FDatabaseName;
      property TargetTableName;
      property UserName: string
        read FUserName
        write FUserName;
      property Password: string
        read FPassword
        write FPassword;
      property ProgressMessage: string
        read FProgressMessage
        write FProgressMessage;

      property OnProgressEvent;
      property OnCheckProgressAbortedEvent;
  end;

const
  AIQMS_DSN_Name = 'IQMS Data Transfer';

var
  FrmDBTransExportMDB: TFrmDBTransExportMDB;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Registry,
  IQMS.Common.StringUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.DBTrans.dbtado,
  IQMS.DBTrans.dbtdsn,
  IQMS.DBTrans.dbtfields,
  IQMS.DBTrans.dbtshare,
  IQMS.DBTrans.dbttypes,
  IQMS.DBTrans.dbtrscstr;

constructor TFrmDBTransExportMDB.Create;
begin
  FCancel := False;
  inherited Create(uniGUIApplication.UniApplication);
  if not StartUp then
    begin
      ModalResult := mrCancel;
      SysUtils.Abort;
    end;
end;

function TFrmDBTransExportMDB.StartUp: Boolean;
begin
  // NOTE:  This method assumes that the public variables holding file
  // names have been assigned.

  // Check if ISAM dll exists
  IQMS.DBTrans.dbtado.CheckAccessISAMExists;

  // If the user has the database open or if the MS Word merge doc is opened,
  // then this error will fire.
  if FileExists(DatabaseName) and IsFileInUse(DatabaseName) then
    begin
      Result := False;
      // The Microsoft Access database is currently in use.
      // Please close the database and any documents connected
      // to the database before merging records.'
      RaiseError(IQMS.DBTrans.dbtrscstr.cTXT0000034);
    end
  else
    Result := True;

  // 07/20/2007 Ensure the progress bar displays correctly
  ProgressBar.Width := Self.ClientWidth - (ProgressBar.Left * 2);

end;

function TFrmDBTransExportMDB.DoProcessExec: Boolean;
begin
  Result := DoImport;

  if not Result then
    begin
      ModalResult := mrCancel;
      Exit;
    end
  else
    ModalResult := mrOk;

  // write to log file
  if Logging then
    WriteToLog
      (Format('Exported table, %s, to Microsoft Access database, %s (table, %s).',
      [TableName, DatabaseName, TargetTableName]))
end;

function TFrmDBTransExportMDB.DoImport: Boolean;
var
  AFieldList: TStringList;

  // ----------------------------------------------------------------------------
{IFDEF UNICODE}
//  function _FixStr(const AStringIN: AnsiString; const AMaxLength: Integer)
//    : AnsiString;
{ELSE}
  function _FixStr(const AStringIN: string; const AMaxLength: Integer): string;
{ENDIF}
  begin
    Result := AStringIN;
    // these strange characters cause big problems
    Result := StrTran(Result, '`', ''''); // in IQMS.Common.StringUtils.pas
    Result := StrTran(Result, '´', ''''); // in IQMS.Common.StringUtils.pas
    Result := FixStr(Result);
    if (AMaxLength > 0) then
      Result := Copy(Result, 1, AMaxLength);
  end;
// ----------------------------------------------------------------------------
{IFDEF UNICODE}
//  function _GetMSAccessFieldText(AField: TField): AnsiString;
{ELSE}
  function _GetMSAccessFieldText(AField: TField): string;
{ENDIF}
  begin
    if AField.IsNull then
      Result := 'NULL' // return the word NULL, not in quotes
    else
      // NOTE:  Because of Internation number formats, we return all data
      // (text and numeric) as a string.  Microsoft Word uses numbers,
      // formatted as text, without any visual differences to the
      // merge data.
      case AField.DataType of
        ftString, ftFixedChar, ftWideString, ftMemo, ftFmtMemo:
          Result := Format('''%s''', [_FixStr(AField.AsString, AField.Size)]);
        // nested, see above
        ftSmallint, ftInteger, ftWord, ftBytes, ftVarBytes:
          Result := Format('''%s''', [AField.AsString]);
        // IntToStr(AField.AsInteger);
        ftFloat, ftCurrency, ftAutoInc, ftLargeint, ftBCD, ftFmtBCD:
          Result := Format('''%s''', [AField.AsString]);
        // FloatToStr(AField.AsFloat);
        ftDate, ftTime, ftDateTime, ftTimeStamp:
          begin
            if AField.AsDateTime <= 1 then
              Result := 'NULL' // return the word NULL, not in quotes
            else
              begin
                Result := FormatDateTime('c', AField.AsDateTime);
                Result := Format('''%s''', [Result]); // wrap in quotes
              end;
          end;
      end;
  end;
// ----------------------------------------------------------------------------
{IFDEF UNICODE}
//  procedure _GetFields(const ADataSet: TDataSet; var AFieldNames: AnsiString);
{ELSE}
  procedure _GetFields(const ADataSet: TDataSet; var AFieldNames: string);
{ENDIF}
  var
    i: Integer;
  begin
    for i := 0 to ADataSet.FieldCount - 1 do
      if ADataSet.Fields[i].Visible then
        begin
          if not IsJetReservedWord(ADataSet.Fields[i].FieldName) then
            AFieldList.Add(ADataSet.Fields[i].FieldName);
        end;
    AFieldNames := AFieldList.CommaText;
    AFieldNames := StrTran(AFieldNames, '"', '');
  end;
// ----------------------------------------------------------------------------
{IFDEF UNICODE}
//  procedure _GetData(const ADataSet: TDataSet; var AFieldData: AnsiString);
{ELSE}
  procedure _GetData(const ADataSet: TDataSet; var AFieldData: string);
{ENDIF}
  var
    i: Integer;
    ADataList: TStringList;
  begin
    try
      ADataList := TStringList.Create;
      // Get the field names
      for i := 0 to AFieldList.Count - 1 do
        ADataList.Add(_GetMSAccessFieldText
          (ADataSet.FieldByName(AFieldList.Strings[i])));
      AFieldData := ADataList.CommaText;
      AFieldData := StrTran(AFieldData, '"', '');
    finally
      if Assigned(ADataList) then
        FreeAndNil(ADataList);
    end;
  end;
// ----------------------------------------------------------------------------
{IFDEF UNICODE}
//  procedure _DropAccessTable(ATableName, AConnectionString: AnsiString);
{ELSE}
  procedure _DropAccessTable(ATableName, AConnectionString: string);
{ENDIF}
  begin
    with TADOCommand.Create(Self) do
      try
        // Insert the new table
        ConnectionString := AConnectionString;
        Prepared := True;
        CommandText := (Format('drop table %s', [ATableName]));
        try
          Execute;
        except // intentional suppress, because table may not exist
        end;
      finally
        Free;
      end;
  end;

// ----------------------------------------------------------------------------
var
{IFDEF UNICODE}
//  ATmpDSNName, AConnectionString, ACommandText, AFields, AData, ASQL,
//    AProgressMessage: AnsiString;
{ELSE}
  ATmpDSNName, AConnectionString, ACommandText, AFields, AData, ASQL,
    AProgressMessage: string;
{ENDIF}
  ADefinition: TStringList;
  AMax, ACount: Integer;
begin

  { NOTE:  DO NOT USE A PARAMETERIZED QUERY WITH JET SQL.
    For string fields, a parameterized query only works for fields
    255 characters or less.  It will not work for Memo fields. }

  try
    Result := False;
    AFieldList := TStringList.Create;
    AMax := 0;
    ACount := 0;

    // Does the user expect to update the database, but no SQL is provided?
    // If so, then inform user of error condition
    if (SourceDataset = nil) then
      begin
        // 'Application Error:  Source dataset not supplied.'
        RaiseError(IQMS.DBTrans.dbtrscstr.cTXT0000045);
        SysUtils.Abort;
      end;

    // IQMS.DBTrans.dbtrscstr.cTXT0000050 = 'Creating Microsoft Access database...'
    UpdateStatusText(IQMS.DBTrans.dbtrscstr.cTXT0000050);
    if Assigned(OnProgressEvent) then
      // IQMS.DBTrans.dbtrscstr.cTXT0000050 = 'Creating Microsoft Access database...'
      OnProgressEvent(AMax, 0, IQMS.DBTrans.dbtrscstr.cTXT0000050);

    try
      IQMS.DBTrans.dbtdsn.CreateMSAccessMDB(DatabaseName);
    except
      on E: Exception do
        begin
          RaiseErrorMemo(
            // 'Connection Error'
            IQMS.DBTrans.dbtrscstr.cTXT0000082,
            // 'Could not create DSN:'#13'%s'
            Format(IQMS.DBTrans.dbtrscstr.cTXT0000195, [E.Message]), '');
          SysUtils.Abort;
        end;
    end;

    try
      // IQMS.DBTrans.dbtrscstr.cTXT0000160 = 'Accessing data.  Please wait...'
      UpdateStatusText(IQMS.DBTrans.dbtrscstr.cTXT0000160);
      if Assigned(OnProgressEvent) then
        // IQMS.DBTrans.dbtrscstr.cTXT0000160 = 'Accessing data.  Please wait...'
        OnProgressEvent(AMax, 0, IQMS.DBTrans.dbtrscstr.cTXT0000160);
      ProgressBar.Position := 0;
      ProgressBar.Visible := True;

      // Maximum number of records.  This is used for the progress bar.
      if not SourceDataset.Active then
        SourceDataset.Open;

      AMax := GetRecordCount; // in dbthiddn.pas
      if (AMax = 0) and (IQMS.Common.DataLib.TableExists(TableName)) then
        AMax := SelectValueFmtAsInt64('SELECT COUNT(*) FROM %s', [TableName]);

      if AMax <= 0 then
        begin
          // 'There are no records to export.  Operation aborted.'
          RaiseError(IQMS.DBTrans.dbtrscstr.cTXT0000069);
          SysUtils.Abort;
        end
      else if (AMax >= 1000000000 { a billion } ) then
        // the max progress bar position is 2147483647
        begin
          // 'There are an excessive number of records selected for processing.  Operation aborted.'
          RaiseError(IQMS.DBTrans.dbtrscstr.cTXT0000067);
          SysUtils.Abort;
        end
      else if (AMax >= 2000) and
      // '%d records will be exported.  Do you want to continue?'
        (IQConfirmYN(Format(IQMS.DBTrans.dbtrscstr.cTXT0000068, [AMax])) = False) then
        begin
          ModalResult := mrCancel;
          SysUtils.Abort;
        end;

      ProgressBar.Max := AMax;

      if Assigned(OnProgressEvent) then
        OnProgressEvent(AMax, 0, lblStatus.Caption);

      ADefinition := TStringList.Create;
      // Will hold the DDL script for the new Access table
      IQMS.DBTrans.dbtshare.GetJetCreateTableSQL(SourceDataset, TargetTableName,
        ADefinition);

      if UserName = '' then
        UserName := 'Admin';

      // 12/14/2010 Use library function to obtain connection string.
      AConnectionString := IQMS.DBTrans.dbtado.ADO_ConnectionStringForMSAccess(DatabaseName,
        UserName, Password);

      // Ensure database exists
      if (DatabaseName = '') then
        raise Exception.Create
          ('Application Error: Microsoft Access database name not provided.');

      if not FileExists(DatabaseName) then
        raise Exception.CreateFmt('Cannot find file, %s.', [DatabaseName]);

      with TADOCommand.Create(nil) do // Create the ADO command object
        try
          // User has cancelled process
          if CheckProgressAborted then
            begin
              ModalResult := mrCancel;
              SysUtils.Abort;
            end;

          // Insert the new table
          ConnectionString := AConnectionString; // apply the connection string
          Prepared := True; // prepare it first
          _DropAccessTable(TargetTableName, AConnectionString);
          // drop the old table, if it exists
          ACommandText := ADefinition.Text; // used in debugging
          CommandText := ACommandText; // apply the CREATE TABLE SQL

          // User has cancelled process
          if CheckProgressAborted then
            begin
              ModalResult := mrCancel;
              SysUtils.Abort;
            end;

          Execute; // create an empty table in MS Access

          // User has cancelled process
          if CheckProgressAborted then
            begin
              ModalResult := mrCancel;
              SysUtils.Abort;
            end;

          // Open the temporary Oracle view to see the data
          if not SourceDataset.Active then
            SourceDataset.Open;
          SourceDataset.First; // first record of the dataset

          _GetFields(SourceDataset, AFields);
          ASQL := Format('INSERT INTO %s (%s) VALUES ',
            [TargetTableName, AFields]) + '(%s)';

          if ProgressMessage > '' then
            AProgressMessage := ProgressMessage
          else
            // 'Exporting to table, %s...'
            AProgressMessage := Format(IQMS.DBTrans.dbtrscstr.cTXT0000161,
              [TargetTableName]);
          UpdateStatusText(AProgressMessage);
          if Assigned(OnProgressEvent) then
            OnProgressEvent(AMax, 0, AProgressMessage);
          Application.ProcessMessages;

          // Now, cycle the view's data, and append the data to the new
          // MS Access table.
          while not SourceDataset.EOF do
            begin
              // Get the lists of field names and their data
              _GetData(SourceDataset, AData);

              // Modify the SQL
              ACommandText := Format(ASQL, [AData]);
              CommandText := ACommandText;

              // User has cancelled process
              if CheckProgressAborted then
                begin
                  ModalResult := mrCancel;
                  SysUtils.Abort;
                end;

              // Append the data
              Execute;

              Inc(ACount);

              // Visual cues
              ProgressBar.Position:=ProgressBar.Position+1;
              if Assigned(OnProgressEvent) then
                OnProgressEvent(AMax, ACount, AProgressMessage);
              Update;
              // Application.ProcessMessages;

              SourceDataset.Next; // go to the next record in the Oracle view
            end;

          Result := True;

        finally
          Free; // free the TADOQuery object
        end;
    finally
      // Free the list
      if Assigned(ADefinition) then
        FreeAndNil(ADefinition);
      if Assigned(AFieldList) then
        FreeAndNil(AFieldList);

      // Visual cues
      ProgressBar.Visible := False;
      if Assigned(OnProgressEvent) then
        // IQMS.DBTrans.dbtrscstr.cTXT0000206 = 'Done.'
        OnProgressEvent(ACount, 0, IQMS.DBTrans.dbtrscstr.cTXT0000206);
      Update;
    end;
  except
    on E: Exception do
      begin
        Result := False;
        if E.ClassType <> EAbort then
          // 'Export Execution Error'
          RaiseErrorMemo(IQMS.DBTrans.dbtrscstr.cTXT0000081, E.Message,
            'Last Command:'#13 + ACommandText);
      end;
  end;
end;

procedure TFrmDBTransExportMDB.UniFormShow(Sender: TObject);
begin
  inherited;
  // 03/10/2010 Check ShowProgress.  If Application.ProcessMessages is called,
  // then this method will execute, and DoProcessExec will be executed twice.
  if ShowProgress then
    DoProcessExec;
end;

procedure TFrmDBTransExportMDB.UpdateStatusText(S: string);
begin
  lblStatus.Caption := S; // update the message text
  lblStatus.Update;
  Update; // update form display, not just label
end;

procedure TFrmDBTransExportMDB.RaiseError(S: string);
begin
  IQError(S);
  ModalResult := mrCancel;
end;

procedure TFrmDBTransExportMDB.RaiseErrorMemo(AHeader, AError, ADetail: string);
begin
  try
    ShowIQErrorMessage(AHeader, AError, ADetail); // IQMS.Common.ErrorDialog.pas
  finally
    ModalResult := mrCancel;
  end;
end;

function TFrmDBTransExportMDB.IsFileInUse(const AFileName: string): Boolean;
var
  HFileRes: HFILE;
begin
  Result := False;
  HFileRes := CreateFile(PChar(AFileName), GENERIC_READ or GENERIC_WRITE, 0,
    nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
end;

procedure TFrmDBTransExportMDB.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      // IQMS.DBTrans.dbtrscstr.cTXT0000038 = 'Abort export?'
      if IQConfirmYN(IQMS.DBTrans.dbtrscstr.cTXT0000038) then
        begin
          FCancel := True;
          Key := 0;
        end;
    end;
end;

function TFrmDBTransExportMDB.CheckProgressAborted: Boolean;
begin
  Application.ProcessMessages;
  Result := FCancel;
  if not Result and Assigned(OnCheckProgressAbortedEvent) then
    Result := OnCheckProgressAbortedEvent;
end;

end.
