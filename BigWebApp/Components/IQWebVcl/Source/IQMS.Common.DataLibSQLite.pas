{ -------------------------------------------------------------------------------
  Copyright: IQMS
  Name: DBF to SQLite converstion
  Desc: An utility class to convert DBF file to SQLite database file format.
  Crt By: BantuK
  Crt Dt: 30 Apr 2016
  Unit Path:
  Model Path:
  ------------------------------------------------------------------------------- }
unit IQMS.Common.DataLibSQLite;

interface

uses
  Data.DB,
  System.Classes,
  IQMS.Common.DMSqlite,
  System.SysUtils,
  Data.Win.ADODB,
  IQMS.Common.ProgressDialog;

type
  { TOnProgressEvent }
  TOnProgressEvent = procedure(const AMaxPos, ACurPos: Integer;
    const AMsgText: string) of object;
  { TCheckProgressAbortedEvent }
  TCheckProgressAbortedEvent = function: Boolean of object;

  TiqDbfToSqliteConverter = class(TObject)
  private
    FdmDbfToSqlite: Tsqlite_DM;
    FOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent;
    FOnProgressEvent: TOnProgressEvent;
    FShowProgress: Boolean;
    FStatusMessageLine: string;
    FProgressMessage: string;
    FPrgsDlg: TIQWebProgressDialog;
    FTotalCnt: Integer;
    FCurrentCnt: Integer;
    procedure CheckCreateProgressDialog(const AMax: Integer;
      const AMsgText: string);
    procedure CreateSQLiteDB(ASQLiteDB: string);
    procedure CopyTableSchemaFrom(ADataset: TDataset; ATableNm: string);
    function CopyDataFrom(ASrc: TDataset; ASQLiteTblNm: string): Boolean;
    procedure LoadDBFFileIntoDataset(ADBFfile: string);
    function InternalConvert(ADBFfile: TDataset; ASQLiteDB: string;
      ASQLiteTblNm: string): Boolean;
    procedure StepProgress;
    function CheckProgressAbortedEvent: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function Convert(ADBFfile: string; ASQLiteDB: string;
      ASQLiteTblNm: string): Boolean;
    function ConvertDataSet(ADBFfile: TDataset; ASQLiteDB: string;
      ASQLiteTblNm: string): Boolean;
    property OnProgressEvent: TOnProgressEvent read FOnProgressEvent
      write FOnProgressEvent;
    property OnCheckProgressAbortedEvent: TCheckProgressAbortedEvent
      read FOnCheckProgressAbortedEvent write FOnCheckProgressAbortedEvent;
    property ShowProgress: Boolean read FShowProgress write FShowProgress;
    property ProgressMessage: string read FProgressMessage
      write FProgressMessage;
    property StatusMessageLine: string read FStatusMessageLine
      write FStatusMessageLine;
  end;

function ConverDbfToSQLite: Boolean;

const
  CMD_SWTCH_IF = 'if'; // input file name DBF
  CMD_SWTCH_OF = 'of'; // output file name SQLite3
  CMD_SWTCH_TN = 'tn'; // table name for SQLite DB.

implementation

uses
  IQMS.Common.Numbers,
  IQMS.DBTrans.dbtrscstr,
  Vcl.Forms,
  System.Math;

{ ****************************************************************************** }
function ConverDbfToSQLite: Boolean;
var
  LDbfFile: string;
  LSQLite: string;
  LSQLiteTblNm: string;
  LCnvrtr: TiqDbfToSqliteConverter;
begin
  Assert(FindCmdLineSwitch(CMD_SWTCH_IF, LDbfFile),
                           'Input switch "' + CMD_SWTCH_IF + '" does not exist.');


  Assert(FindCmdLineSwitch(CMD_SWTCH_OF, LSQLite),
                           'Output switch "' + CMD_SWTCH_IF + '" does not exist.');

  Assert(FindCmdLineSwitch(CMD_SWTCH_TN, LSQLiteTblNm),
                           'Table name switch "' + CMD_SWTCH_TN + '" does not exist.');

  Assert(FileExists(LDbfFile),
         'File does not exist at "' + LDbfFile + '".');

  Assert(ForceDirectories(ExtractFileDir(LSQLite)),
         'Unable to create directory "' +
         ExtractFileDir(LSQLite) + '".');

  Assert(Trim(LSQLiteTblNm) <> '', 'Table name cannot be empty.');

  LCnvrtr := TiqDbfToSqliteConverter.Create;
  try
    Result := LCnvrtr.Convert(LDbfFile, LSQLite, LSQLiteTblNm);
  finally
    LCnvrtr.Free;
  end;
end;

{ TiqDbfToSqliteConverter }
{ ****************************************************************************** }
procedure TiqDbfToSqliteConverter.CheckCreateProgressDialog(const AMax: Integer;
  const AMsgText: string);
begin
  if ShowProgress then
  begin
    // create and initialize the progress dialog
      (*UG_rem_AMB*)
    FPrgsDlg := TIQWebProgressDialog.Create(Application); // iqprogressdlg.pas
    with FPrgsDlg do
    begin
      MinProgress := 0;
      MaxProgress := AMax;
      Caption := cTXT0000058; // 'Export'
      Execute;
      // FPrgsDlg.CancelBtn.OnClick := DoCancelBtnClick;
      Status1 := AMsgText;
      Status2 := '';
    end;
  end;

  if Assigned(FOnProgressEvent) then
    FOnProgressEvent(AMax, 0, AMsgText);
end;

{ ****************************************************************************** }
function TiqDbfToSqliteConverter.CheckProgressAbortedEvent: Boolean;
begin
  Result := FALSE;
    (*UG_rem_AMB*)
  if Assigned(FPrgsDlg) then
    Result := FPrgsDlg.CheckProgressAborted
  else if Assigned(FOnCheckProgressAbortedEvent) then
    Result := FOnCheckProgressAbortedEvent;
end;

function TiqDbfToSqliteConverter.Convert(ADBFfile: string; ASQLiteDB: string;
  ASQLiteTblNm: string): Boolean;
begin
  Result:= False;
  Assert(Trim(ADBFfile) <> '' , 'Empty argument supplied in ADBFile.');
  Assert(Trim(ASQLiteDB) <> '' , 'Empty argument supplied in ASQLiteDB.');
  Assert(Trim(ASQLiteTblNm) <> '', 'Empty argument supplied in ASQLiteTblNm.');

  { Load supplied DBF file into dataset. }
  LoadDBFFileIntoDataset(ADBFfile);

  { Do internal conversion to SQLite3 }
    (*UG_rem_AMB*)
  InternalConvert(FdmDbfToSqlite.DBFDataset, ASQLiteDB, ASQLiteTblNm);

  Result := true;
end;

{ ****************************************************************************** }
function TiqDbfToSqliteConverter.ConvertDataSet(ADBFfile: TDataset;
  ASQLiteDB: string; ASQLiteTblNm: string): Boolean;
begin
  Result := InternalConvert(ADBFfile, ASQLiteDB, ASQLiteTblNm);
end;

{ ****************************************************************************** }
function TiqDbfToSqliteConverter.CopyDataFrom(ASrc: TDataset;
  ASQLiteTblNm: string): Boolean;
var
  i: Integer;
begin
  Result := FALSE;
  Assert(ASrc <> nil, 'Unassigned argument supplied in ASrc.');
  Assert(Trim(ASQLiteTblNm) <> '' , 'Empty argument supplied in ASQLiteTblNm.');
     (*UG_rem_AMB*)
  FdmDbfToSqlite.tblSQLite.Close;
  FdmDbfToSqlite.tblSQLite.CachedUpdates := true;
  FdmDbfToSqlite.tblSQLite.Active := true;

  FTotalCnt := ASrc.RecordCount;
  FCurrentCnt := 0;

  { create and initialize the progress dialog }
  if ShowProgress then
  begin
   (*UG_rem_AMB*)
    FProgressMessage := sIIf(StatusMessageLine = '',
      Format(cTXT0000063 { 'Exporting %s' } , [ASQLiteTblNm]),
      StatusMessageLine);

    CheckCreateProgressDialog(FTotalCnt, FProgressMessage);
  end;

  try
    ASrc.First;
    while not ASrc.Eof do
    begin
      (*UG_rem_AMB*)
      FdmDbfToSqlite.tblSQLite.Insert;

      if Assigned(OnProgressEvent) then
        OnProgressEvent(FTotalCnt, FCurrentCnt, FProgressMessage);

      for i := 0 to ASrc.FieldCount - 1 do
      begin
        (*UG_rem_AMB*)
        FdmDbfToSqlite.tblSQLite.Fields[i].Value := ASrc.Fields[i].Value;
      end;

      if CheckProgressAbortedEvent then
      begin
        Exit;
      end;

      if Assigned(OnCheckProgressAbortedEvent) and OnCheckProgressAbortedEvent
      then
      begin
        Exit;
      end;

      ASrc.Next;

      // Step the progress bar
      StepProgress;
    end;
  finally
    (*UG_rem_AMB*)
    if (FPrgsDlg <> nil) and Assigned(FPrgsDlg) then
      FreeAndNil(FPrgsDlg);
  end;
      (*UG_rem_AMB*)
  FdmDbfToSqlite.tblSQLite.ApplyUpdates;
  FdmDbfToSqlite.tblSQLite.CommitUpdates;
  Result := TRUE;
end;

{ ****************************************************************************** }
procedure TiqDbfToSqliteConverter.CopyTableSchemaFrom(ADataset: TDataset;
  ATableNm: string);
var
  i: Integer;
  AField: TField;

  procedure L_CopyFieldDefToSQLiteTable(AName: string; aType: TDataType;
    ASize: Integer; AIsRqrd: Boolean);
  var
    LFldSz: Integer;
  begin
    LFldSz := 0;
    if ((aType = ftString) or (aType = ftWideString)) then
    begin
      ASize:= Min(ASize, 4000);
    end;

    case aType of
      ftString, ftWideString, ftBytes, ftVarBytes:
        LFldSz := ASize;
    end;
      (*UG_rem_AMB*)
    FdmDbfToSqlite.tblSQLite.FieldDefs.Add(AName, aType, LFldSz, AIsRqrd);
  end;

begin
  Assert(ADataset <> nil, 'Unassigned argument supplied in ADataset.');
  Assert(ATableNm <> '', 'Empty argument supplied in ATableNm.');

  // SQLite Table name should be same as .DBF file name
    (*UG_rem_AMB*)
  FdmDbfToSqlite.tblSQLite.TableName := ATableNm;

  { Loop through the field in source dataset and copy them to SQLite table. }
  for i := 0 to ADataset.FieldCount - 1 do
  begin
    AField := ADataset.Fields[i];
    if AField <> nil then
    begin
      L_CopyFieldDefToSQLiteTable(AField.FieldName, AField.DataType,
      AField.DataSize, AField.Required);
    end;
  end;
    (*UG_rem_AMB*)
  FdmDbfToSqlite.tblSQLite.CreateDataSet;
end;

{ ****************************************************************************** }
constructor TiqDbfToSqliteConverter.Create;
begin
  inherited;

  FShowProgress := FALSE;
  FProgressMessage := '';
  FStatusMessageLine := '';
    (*UG_rem_AMB*)
  FdmDbfToSqlite := Tsqlite_DM.Create(nil);
end;

{ ****************************************************************************** }
procedure TiqDbfToSqliteConverter.CreateSQLiteDB(ASQLiteDB: string);
begin
  Assert(Trim(ASQLiteDB) <> '', 'Empty argument supplied in ASQLiteDB.');
  (*UG_rem_AMB*)
  FdmDbfToSqlite.FDConnToSQLiteDB.Params.Values['Database'] := ASQLiteDB;
  FdmDbfToSqlite.FDConnToSQLiteDB.Connected := true;
end;

{ ****************************************************************************** }
destructor TiqDbfToSqliteConverter.Destroy;
begin
  (*UG_rem_AMB*)
  FreeAndNil(FdmDbfToSqlite);
  inherited;
end;

{ ****************************************************************************** }
function TiqDbfToSqliteConverter.InternalConvert(ADBFfile: TDataset;
  ASQLiteDB: string; ASQLiteTblNm: string): Boolean;
begin
  Result:= False;
  Assert(ADBFfile <> nil, 'Unassigned argument supplied in ADBFfile.');
  Assert(Trim(ASQLiteDB) <> '', 'Empty argument supplied in ASQLiteDB.');
  Assert(Trim(ASQLiteTblNm) <> '', 'Empty argument supplied in ASQLiteTblNm.');

  { Create SQLite DB. }
  CreateSQLiteDB(ASQLiteDB);

  { Create a table on the DB. }
  CopyTableSchemaFrom(ADBFfile, ASQLiteTblNm);

  { Copy data from DBF to SQLite. }
  Result := CopyDataFrom(ADBFfile, ASQLiteTblNm);
end;

{ ****************************************************************************** }
procedure TiqDbfToSqliteConverter.LoadDBFFileIntoDataset(ADBFfile: string);
var
  LDBFileNm: string;

  procedure L_SetConnectionDetails;
  var
    LDbfFileLoc: string;
  begin
    LDbfFileLoc := ExtractFileDir(ADBFfile);
      (*UG_rem_AMB*)
    with FdmDbfToSqlite.ConnToDbfFile do
    begin
      LoginPrompt := FALSE;
      ConnectionString := Format('Provider=Microsoft.JET.OLEDB.4.0;' +
                                 'Data Source=%s;Extended Properties' +
                                 '=dBase IV;', [LDbfFileLoc]);
    end;
  end;

begin
  Assert(Trim(ADBFfile) <> '' , 'Empty argument supplied in ADBFile.');

  L_SetConnectionDetails;

  { Activate connection. }
    (*UG_rem_AMB*)
  FdmDbfToSqlite.ConnToDbfFile.Connected := true;

  { Make SQL query using the name of the dbf file to load all records into DS. }
  LDBFileNm := ExtractFileName(ADBFfile);
  FdmDbfToSqlite.DBFDataset.CommandText := Format('select * from %s', [ LDBFileNm ]);
  FdmDbfToSqlite.DBFDataset.Open;
end;

{ ****************************************************************************** }
procedure TiqDbfToSqliteConverter.StepProgress;
begin
  Inc(FCurrentCnt);
    (*UG_rem_AMB*)
  if Assigned(FPrgsDlg) then
    FPrgsDlg.Position := FCurrentCnt;

  if Assigned(FOnProgressEvent) then
    FOnProgressEvent(FTotalCnt, FCurrentCnt, FProgressMessage);
end;

end.
