
{*******************************************************}
{                                                       }
{ This unit handles importing DBase files (.DB, .DBF)   }
{                                                       }
{*******************************************************}

unit dbtimpdb;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  dbthiddn,
  Menus,
  uniGUIApplication,
  ExtCtrls,
  DB,
  StdCtrls,
  DBClient,
  IQMS.WebVcl.DBExpress,
  ADODB,
  SqlExpr,
  IQMS.DBTrans.dbttypes,
  DBXOracle,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel, uniMainMenu, uniPanel;

type
  TFrmIQDBTransImportDBF = class(TFrmDBTransHidden)
    Label1: TUniLabel;
    lblDBFFileName: TUniLabel;
    TblSource: TADOTable;
    TblDestination: TIQWebDbxTable;
    ADOConnection1: TADOConnection;
    SQLConnection1: TSQLConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FProgressMessage: String;
    FDatabaseName: String;
    FTableType: TCustomTableType;
    function ConfigTargetTable: Boolean; // FALSE = error condition
    function ConfigSourceTable: Boolean; override;// FALSE = error condition
    function OpenSourceTable(AActive: Boolean = TRUE): Boolean; override;// attempts to open the source table
    function DoProcessExec: Boolean; override;
  public
    { Public declarations }
    constructor Create(
                       ADatabaseName: String;
                       ATargetTableName: String;
                       ATableType: TCustomTableType;
                       AImportIntoTargetTable: Boolean);

    function BatchMoveDefaultToOracle: Boolean; override;

    property SQLConnection;
    property Logging;
    property LogFile;
    property ErrorLogFile;

    property DatabaseName: String read FDatabaseName write FDatabaseName;
    property TargetTableName;
    property ImportIntoTargetTable;
    property TableType: TCustomTableType read FTableType write FTableType;
    property ProgressMessage: String read FProgressMessage write FProgressMessage;
    property ShowProgress;
    property OnProgressEvent;
    property OnCheckProgressAbortedEvent;

  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls,
  IQMS.Common.FileUtils,
  IQMS.DBTrans.dbtado,
  dbtbatmv,
  IQMS.DBTrans.dbtdbexp,
  IQMS.DBTrans.dbtshare,
  dbtemptables,
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.PanelMsg;

constructor TFrmIQDBTransImportDBF.Create(
  ADatabaseName: String; ATargetTableName: String; ATableType: TCustomTableType;
  AImportIntoTargetTable: Boolean);
begin
  inherited Create(uniGUIApplication.UniApplication);
  DatabaseName := ADatabaseName;
  TableType := ATableType;
  TargetTableName := ATargetTableName;
  ImportIntoTargetTable := AImportIntoTargetTable;

  if not FileExists(DatabaseName) then
     try
        IQError(Format(IQMS.DBTrans.dbtrscstr.cTXT0000026 {'Cannot find file, %s'}, [DatabaseName]));
     finally
        PostMessage(Handle, wm_Command, Exit1.Command, 0);   // Call "Exit"
     end
  else ConfigSourceTable;
end;

procedure TFrmIQDBTransImportDBF.FormShow(Sender: TObject);
begin
  inherited;
  // NOTE: This form should not be displayed
  File1.Visible := FALSE;
  Bevel4.Visible := FALSE;
  Height := 78; // set height of the form
end;

procedure TFrmIQDBTransImportDBF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OpenSourceTable(FALSE);
  FSourceDataSet := TblSource;

  inherited;

end;

function TFrmIQDBTransImportDBF.ConfigTargetTable: Boolean;
begin
  Result := False;
  try
     IQMS.DBTrans.dbtdbexp.DBX_ConfigureSQLConnection(SQLConnection1);
     TblDestination.SQLConnection := Self.SQLConnection1;
     if ImportIntoTargetTable then
       begin
        if (TargetTableName = '') then
           TargetTableName := GetTempTableName(SQLConnection); // dbtemptables;
        TblDestination.TableName := TargetTableName; // temporary Oracle table
       end;
     Result := True;
  except on E:Exception do
     // 'Encountered error configuring target dataset:'#13#13'%s'
     raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000192, [E.Message]);
  end;
end;

function TFrmIQDBTransImportDBF.ConfigSourceTable: Boolean;
begin
  // This method configures TblSource with the required database name,
  // table name and table type properties.  It also suggests some
  // initial parameters for the text file, which the user can of course
  // change.
  Result := TRUE; // default to a valid (TRUE) condition
  try
     // Validation
     if not FileExists(DatabaseName) then
        Exit;
     // Close source dataset before configuring it
     if TblSource.Active then TblSource.Close;

     if (TableType = dttParadox) then
        // Configure the ADO connection for Paradox
        IQMS.DBTrans.dbtado.ADO_ConfigureConnectionForParadox(ADOConnection1,
           ExtractFilePath(DatabaseName))
     else if (TableType = dttDBase) then
        // Configure the ADO connection for DBase
        IQMS.DBTrans.dbtado.ADO_ConfigureConnectionForDBF(ADOConnection1,
           ExtractFilePath(DatabaseName))
     else if (TableType = dttFoxPro) then
        // Configure the ADO connection for FoxPro
        IQMS.DBTrans.dbtado.ADO_ConfigureConnectionForVisualFoxPro(ADOConnection1,
           ExtractFilePath(DatabaseName))
     else
        raise Exception.Create('Invalid source table type.');

     // Set the table name
     if (TableType in [dttParadox, dttFoxPro]) then
        TblSource.TableName := IQMS.Common.FileUtils.FileNameNoExt(DatabaseName)
     else
        TblSource.TableName := ExtractFileName(DatabaseName);

     // Populate public variable
     FSourceDataSet         := TblSource;
     // Set label for progress feedback in case the form is displayed.
     lblDBFFileName.Caption := DatabaseName;
     lblDBFFileName.Update;
  except
    Result := FALSE;
  end;
end;

function TFrmIQDBTransImportDBF.BatchMoveDefaultToOracle: Boolean;
begin
  // We do not display this form, but retrieve default settings and begin
  // to import.
  Result := OpenSourceTable(TRUE); // attempt to open the source table
  if Result then
     Result := DoProcessExec;
end;

function TFrmIQDBTransImportDBF.OpenSourceTable(AActive: Boolean): Boolean;
var
   hMsg: TPanelMesg;
begin
  hMsg := NIL;
  try
     try
        if ShowProgress and not Assigned(OnProgressEvent) then
           hMsg := hPleaseWait('');
        if Assigned(OnProgressEvent) then
           begin
             //'Accessing database.  Please wait.'
             OnProgressEvent(0,0,IQMS.DBTrans.dbtrscstr.cTXT0000207);
             Application.ProcessMessages;
           end;
        TblSource.DisableControls;
        if TblSource.Active then TblSource.Close;
        if AActive then TblSource.Open;
        Result := CheckValidFields(TblSource);
     finally
        TblSource.EnableControls;
        if Assigned(hMsg) then FreeAndNil(hMsg);
     end;
  except on E:Exception do
     begin
       Result := FALSE;
       if AActive = TRUE then
          // 'Could not access data file:  %s'
          IQError(Format(IQMS.DBTrans.dbtrscstr.cTXT0000193, [E.Message]));
     end;
  end;
end;

function TFrmIQDBTransImportDBF.DoProcessExec: Boolean;
var
   AIQBatchMode: TIQBatchMode;
   AMap: TStringList;
begin
  // Initialize
  Result := False;

  if not FileExists(DatabaseName) then
     // 'Please specify a source data file to import.'
     raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000194);

  try
     // Setting the table to ReadOnly and removing possible cached updates
     // increases the chances of a successful import.  If the table has cached
     // updates, then BatchMove will abort.
     // Must close dataset before setting to read only and removing cached updates
     if TblSource.Active then TblSource.Close;
     //DeleteSchemaFiles; // IQMS.DBTrans.dbtshare.pas; deletes only Borland schema files (*.SCF and *.INI)
     ConfigTargetTable;
     ConfigSourceTable;

     // Assign unique destination table name
     if ImportIntoTargetTable then
        AIQBatchMode := iqbmCopy
     else
        AIQBatchMode := iqbmAppend;
     AMap := TStringList.Create;
     try
       FieldMap.AssignStrings({var} AMap);
       // Execute batch move (declared in dbtbatmv.pas)
       Result := dbtbatmv.BatchImport(
                  TblSource,                          // ASource (TCustomADODataSet)
                  TblDestination,                     // ATarget (TDbxCustomDataSet)
                  TargetTableName,                    // ATableName
                  AIQBatchMode,                       // AIQBatchMode (TIQBatchMode)
                  Self.ShowProgress,                  // AShowProgress
                  AMap,                               // AFieldMap (TStringList)
                  ProgressMessage,                    // AImportMsg1
                  '',                                 // AImportMsg2
                  LogFile,                            // ALogFile
                  ErrorLogFile,                       // AErrorLogFile
                  Self.OnProgressEvent,               // AOnProgressEvent: TOnProgressEvent;
                  Self.OnCheckProgressAbortedEvent);  // AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent
     finally
       FreeAndNil(AMap);
     end;

     
     // We close the application to prevent the user from click the back button
     // or from running another import for this session.
     Close;                 // close form, since process is done
     ModalResult := mrOk;   // close this COM executable to release cursor to the BDE
                            // NOTE: if we don't release connection to BDE, then an error
                            //       may occur if user tries to import another file during
                            //       this session:  ORA-00904: invalid column name.
  except on E:Exception do
    try
       {if (E is EDBEngineError) then
          begin
             with (E as EDBEngineError) do
                // Invalid field name.  ORA-00904: Invalid column name.
                if Errors[ErrorCount - 1].NativeError = 904 then
                   // 'Could not open source dataset.'
                   IQError(IQMS.DBTrans.dbtrscstr.cTXT0000046)
                else
                   // 'Could not open source dataset:'#13'%s'
                   IQError(Format(IQMS.DBTrans.dbtrscstr.cTXT0000047, [E.Message]));
          end
       else} IQError(E.Message);
    finally
       ModalResult := mrCancel;
    end;
  end;
end;

end.
