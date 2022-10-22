
{*******************************************************}
{                                                       }
{ Ancestor unit for all import/export form units.       }
{                                                       }
{*******************************************************}

unit dbthiddn;

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
  ExtCtrls,
  Menus,
  DB,
  SqlExpr,
  DBClient,
  ADODB,
  IQMS.Common.WriteLogFile,
  IQMS.DBTrans.dbtdb,
  IQMS.DBTrans.dbttypes,
  IQMS.Common.WizardBase,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, uniMainMenu;

type
  { TWizardBtn }
  //TWizardBtn = ( wbPrior, wbNext, wbFinish );

  { TFrmDBTransHidden }
  TFrmDBTransHidden = class(TUniForm)
    PnlMain: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Bevel4: TUniPanel;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FLogging: Boolean;
    FLogFile: String;
    FErrorLogFile: String;
    FLogFileObject: TIQLogFile;
    FErrorLogFileObject: TIQLogFile;
    FFieldMap: TFieldMap;
    FImportIntoTargetTable: Boolean;
    FShowProgress: Boolean;
    FProgressMessage: String;
    FSuppressPrompts: Boolean;
    FOnProgress: TOnProgressEvent;
    FOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent;
    FOnProgressEvent: TOnProgressEvent;
    FTargetTableName: string;
    FFieldKeys: TFieldMap;
  protected
    { Protected declarations }
    FSQLConnection: TSQLConnection;
    FSourceDataSet: TDataSet;
    procedure RaiseError( S: String );
    procedure RaiseErrorMemo( AHeader, AError, ADetail: String );
    function DoProcessExec: Boolean; virtual; abstract; // either import or export
    procedure WriteToLog(AMsg: String);
    procedure WriteToErrorLog(AErrorMsg: String);
    function GetRecordCount: Integer; overload;
    function GetRecordCount(const ADataSet: TDataSet): Integer; overload;
    function ConfigSourceTable: Boolean; virtual; abstract;
    function BatchMoveDefaultToOracle: Boolean; virtual; abstract;
    function OpenSourceTable(AActive: Boolean = TRUE): Boolean; virtual; abstract;// attempts to open the source table
  public
    { Public declarations }
    //FFieldMap, FSelTargetFields, FSelSourceFields: TStringList; // set by a parent form, if applicable


    destructor Destroy; override;
    procedure DoButtonClick( AWizardButton: TWizardBtn ); virtual; // method for wizard buttons
    function Execute: Boolean;

    property SQLConnection: TSQLConnection read FSQLConnection write FSQLConnection;
    property SourceDataset: TDataSet read FSourceDataSet write FSourceDataSet;
    property Logging: Boolean read FLogging write FLogging;
    property LogFile: String read FLogFile write FLogFile;
    property ErrorLogFile: String read FErrorLogFile write FErrorLogFile;
    property FieldMap: TFieldMap read FFieldMap write FFieldMap;
    property FieldKeys: TFieldMap read FFieldKeys write FFieldKeys;
    property ShowProgress: Boolean read FShowProgress write FShowProgress;
    property ProgressMessage: String read FProgressMessage write FProgressMessage;
    property SuppressPrompts: Boolean read FSuppressPrompts write FSuppressPrompts;

    property OnProgress: TOnProgressEvent read FOnProgress write FOnProgress;

    // If True (and it usually is), the import will run when the user clicks
    // the "Finish" button.  This is only set to False where the import form
    // must disappear but remain connected to the external dataset.
    property ImportIntoTargetTable: Boolean read FImportIntoTargetTable write FImportIntoTargetTable;
    property TargetTableName: string read FTargetTableName write FTargetTableName;

    property OnProgressEvent: TOnProgressEvent read FOnProgressEvent
     write FOnProgressEvent;
    property OnCheckProgressAbortedEvent: TCheckProgressAbortedEvent
     read FOnCheckProgressAbortedEvent write FOnCheckProgressAbortedEvent;
  end;

type
  TDBTransForm = class of TFrmDBTransHidden;

const
  cBatchSize = 1000;

implementation

{$R *.DFM}

uses
  IQMS.DBTrans.dbtshare,
  IQMS.Common.Controls,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Dialogs;

procedure TFrmDBTransHidden.FormCreate(Sender: TObject);
begin
  FSQLConnection := NIL;
  FErrorLogFileObject := NIL;
  FLogFileObject := NIL;
  FFieldMap := TFieldMap.Create(Self); // IQMS.DBTrans.dbtdb.pas
  FFieldKeys := TFieldMap.Create(Self); // IQMS.DBTrans.dbtdb.pas
  FShowProgress := True;
  FOnProgress := NIL;
end;

procedure TFrmDBTransHidden.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ImportIntoTargetTable then // dbttypes
     Action := caFree
  else
     Action := caHide;
end;

destructor TFrmDBTransHidden.Destroy;
begin
  if Assigned(FErrorLogFileObject) then FreeAndNil(FErrorLogFileObject);
  if Assigned(FLogFileObject) then FreeAndNil(FLogFileObject);
  
  inherited Destroy;
end;

function TFrmDBTransHidden.Execute: Boolean;
begin
  Result := DoProcessExec;
end;

procedure TFrmDBTransHidden.DoButtonClick(AWizardButton: TWizardBtn);
begin
    //
end;

procedure TFrmDBTransHidden.Exit1Click(Sender: TObject);
begin
     Close;
end;

procedure TFrmDBTransHidden.RaiseError(S: String);
begin
     IQError( S );
     ModalResult := mrCancel;
end;

procedure TFrmDBTransHidden.RaiseErrorMemo( AHeader, AError, ADetail: String);
begin
     ShowIQErrorMessage( AHeader, AError, ADetail );
     ModalResult := mrCancel;
end;

procedure TFrmDBTransHidden.WriteToErrorLog(AErrorMsg: String);
begin
  if Trim(ErrorLogFile) = '' then Exit;

  if not Assigned(FErrorLogFileObject) then
     begin
       FErrorLogFileObject:= TIQLogFile.Create(ErrorLogFile);
       FErrorLogFileObject.ProcessBatch := True;
       FErrorLogFileObject.BatchSize := cBatchSize;
     end;

  FErrorLogFileObject.Write(AErrorMsg);

end;

procedure TFrmDBTransHidden.WriteToLog(AMsg: String);
begin
  if Trim(LogFile) = '' then Exit;

  if not Assigned(FLogFileObject) then
     begin
       FLogFileObject:= TIQLogFile.Create(LogFile);
       FLogFileObject.ProcessBatch := True;
       FLogFileObject.BatchSize := cBatchSize;
     end;

  FLogFileObject.Write(AMsg); 

end;

function TFrmDBTransHidden.GetRecordCount: Integer;
begin
  Result := GetRecordCount(SourceDataset);
end;

function TFrmDBTransHidden.GetRecordCount(const ADataSet: TDataSet): Integer;
begin
  Result := IQMS.DBTrans.dbtshare.GetRecordCount(ADataSet);
(*  Result := 0;
  
  if not Assigned(ADataSet) then
     Exit;

  try
     if not ADataSet.Active then ADataSet.Open;
     
     if (ADataSet is TSQLTable) then
        Result := dbtdbexp.DBX_GetRecordCount(TSQLTable(ADataSet))
     
     else if (ADataSet is TSQLQuery) then
        Result := dbtdbexp.DBX_GetRecordCount(TSQLQuery(ADataSet))
     
     else if (ADataSet is TADOTable) then
        Result := dbtado.ADO_GetRecordCount(TADOTable(ADataSet))
     
     else if (ADataSet is TADOQuery) then
        Result := dbtado.ADO_GetRecordCount(TADOQuery(ADataSet))

     else if (ADataSet is TDbxQuery) then
        Result := TDbxQuery(ADataSet).RecordCount
     
     else if (ADataSet is TDbxTable) then
        Result := TDbxTable(ADataSet).RecordCount
     
     else Result := ADataSet.RecordCount;
  except
     Result := 0;
  end; *)
end;

end.
