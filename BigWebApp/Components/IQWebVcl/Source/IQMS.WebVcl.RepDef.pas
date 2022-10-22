unit IQMS.WebVcl.RepDef;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Data.DB,
  uniToolBar,
  IQMS.Common.DataConst,
  IQMS.Common.UCRPE32,
  IQMS.Common.Registry,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  Vcl.Printers,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  IQMS.Common.PanelMsg,
  IQMS.WebVcl.FaxDialog,
  IQMS.WebVcl.FaxMan,
  IQMS.Common.EmailUtils,
  IQMS.Common.PrintDialogsShare,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Param,
  FireDAC.Phys,
//  FireDAC.Comp.DataMove,
  Data.Win.ADODB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniImageList,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.VCLUI.Wait, Vcl.ComCtrls, Vcl.StdCtrls,
//  vcl.Wwkeycb,
  IQUniGrid,
  uniGUIFrame;

{....$DEFINE DEBUG_ON}

type
  TOnBeforeSendEmail = procedure( Sender: TObject;
                                  AParams: TIQSendEmailParams;  // declared in EMailUtils {AEMail_To, AEMail_Subject, AEMail_Body}
                                  AEMail_AttachedFileName: string;
                                  var ASendEmail: Boolean ) of object;
  TOnGetUserCriteriaExpression = procedure( Sender: TObject; AList: TStringList ) of object;

  // Method pointer for updating stored procedure, as executed in OnBeforePrint
  TOnBeforeExecuteStoredProc = procedure(Sender: TObject; AStoredProc: TFDStoredProc) of object;

  TIQWebRepDef = class(TComponent)
  private
    { Private declarations }
    FApp_ID:string;
    FWebUse: Boolean;   {help security inspector to determine the security code}
    FTouchScreen: Boolean;
    FIsMyAlertsMode: Boolean;
    FOnBeforeExecuteStoredProc: TOnBeforeExecuteStoredProc;
    procedure SetIsMyAlertsMode(const Value: Boolean);
  protected
    { Protected declarations }
    FOnGetUserCriteriaExpression: TOnGetUserCriteriaExpression;
    FDBFTableName: string;
  public
    { Public declarations }
    Params: TFDParams;  {For BeforeExec procedure}
    constructor Create( AOwner:TComponent ); override;
    destructor Destroy; override;
    procedure Execute;
    function ExecuteModal: Boolean;
    //function AddToParams( AName: string; AValue: Variant; ADataType: TFieldType ): Integer;
    property IsMyAlertsMode: Boolean read FIsMyAlertsMode write SetIsMyAlertsMode;

    procedure ClearParams;
    procedure AddParam(const AParamName: string; const ADataType: TFieldType;
      AParamValue: Variant);

  published
    { Published declarations }
    property App_ID : string read FApp_ID write FApp_ID;
    property WebUse: Boolean read FWebUse write FWebUse;
    property TouchScreen: Boolean read FTouchScreen write FTouchScreen;
    property OnGetUserCriteriaExpression: TOnGetUserCriteriaExpression read FOnGetUserCriteriaExpression write FOnGetUserCriteriaExpression;
    property OnBeforeExecuteStoredProc: TOnBeforeExecuteStoredProc read FOnBeforeExecuteStoredProc write FOnBeforeExecuteStoredProc;
  end;

type
  TDataType = (dtChar, dtVarchar2, dtNumber, dtBlob, dtDate, dtOther);

type
  TColInfo = record
     DataType     : TDataType;
     DataLength   : Integer;
     DataDecimal  : Integer;
     TableName    : string;
     FieldName    : string;
  end;

type
  TFrmRepDef = class(TUniForm)
    PopupMenu1: TUniPopupMenu;
    AddReport1: TUniMenuItem;
    Remove1: TUniMenuItem;
    Edit1: TUniMenuItem;
    OpenDialog1: TOpenDialog;
    SrcRepDef: TDataSource;
    Info1: TUniMenuItem;
    RepDef: TFDTable;
    RepDefAPP_ID: TStringField;
    RepDefDESCRIP: TStringField;
    dbfREPDEF: TADOTable;
    RepDef_Criteria: TFDTable;
    SrcRepDef_Criteria: TDataSource;
    RepDefREPNAME: TStringField;
    RepDefCURR_REC_COL_NAME: TStringField;
    RepDefCRW_MATCH_COL_NAME: TStringField;
    RepDefBEFORE_PRINT: TStringField;
    RepDef_CriteriaAPP_ID: TStringField;
    RepDef_CriteriaREPNAME: TStringField;
    RepDef_CriteriaSEQ: TBCDField;
    RepDef_CriteriaCRW_COL_NAME: TStringField;
    RepDef_CriteriaDESCRIP: TStringField;
    RepDef_CriteriaRANGE_START: TStringField;
    RepDef_CriteriaRANGE_END: TStringField;
    RepDef_CriteriaUNARY_OPERATOR: TStringField;
    RepDef_CriteriaBINARY_OPERATOR: TStringField;
    Panel2: TUniPanel;
    QryColInfo: TFDQuery;
    pnlGrid: TUniPanel;
    pnlButtons: TUniPanel;
    Panel3: TUniPanel;
    btnPrint: TUniBitBtn;
    btnCurrent: TUniBitBtn;
    btnExit: TUniBitBtn;
    SaveDialog1: TSaveDialog;
    SrcRepDefFormulas: TDataSource;
    RepDef_Formulas: TFDTable;
    RepDef_FormulasAPP_ID: TStringField;
    RepDef_FormulasREPNAME: TStringField;
    RepDef_FormulasSEQ: TBCDField;
    RepDef_FormulasLABEL_TEXT: TStringField;
    RepDef_FormulasFORM_NAME: TStringField;
    RepDef_FormulasFORM_TYPE: TStringField;
    RepDef_FormulasFORM_VALUE: TStringField;
    btnSetUp: TUniBitBtn;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    dbgParams: TUniDBGrid;
    PnlFilterToolbar: TUniPanel;
    sbtnClear: TUniSpeedButton;
    RepDefNUM_COPIES: TBCDField;
    Splitter1: TUniSplitter;
    RepDefCOLLATE: TStringField;
    RepDef_FormulasFUNC_NAME: TStringField;
    N1: TUniMenuItem;
    About1: TUniMenuItem;
    popmEmail: TUniPopupMenu;
    AddfromVendors1: TUniMenuItem;
    AddfromCustomers1: TUniMenuItem;
    SrcRepDef_EMail: TDataSource;
    RepDef_EMail: TFDTable;
    RepDef_EMailAPP_ID: TStringField;
    RepDef_EMailREPNAME: TStringField;
    RepDef_EMailEMAIL_TO: TStringField;
    RepDef_EMailEMAIL_SUBJECT: TStringField;
    RepDef_EMailEMAIL_BODY: TStringField;
    RepDef_CriteriaINCLUDE_NULLS: TStringField;
    N2: TUniMenuItem;
    ShowAllReports1: TUniMenuItem;
    dbgReports: TIQUniGridControl;
    RepDefHIDDEN: TStringField;
    PnlToolbarMain: TUniPanel;
    NavMain: TUniDBNavigator;
    sbtnUnHideAll: TUniSpeedButton;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    AddfromEmployees1: TUniMenuItem;
    RepDefEDIT_DATE: TDateTimeField;
    RepDefSTORED_PROCEDURE: TStringField;
    ViewReportCatalog1: TUniMenuItem;
    pnlCarrier: TUniPanel;
    RepDef_Cat: TFDTable;
    ReportsExecutionLog1: TUniMenuItem;
    RepDefLANGUAGE_CODE: TBCDField;
    PnlDestBtns: TUniPanel;
    PnlDestCarrier: TUniPanel;
    pgctrDestination: TUniPageControl;
    tabScreen: TUniTabSheet;
    Label4: TUniLabel;
    tabPrinter: TUniTabSheet;
    Label1: TUniLabel;
    DBEdit1: TUniDBEdit;
    DBCheckBox1: TUniDBCheckBox;
    tabFile: TUniTabSheet;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlDestFileLeft01: TUniPanel;
    Label3: TUniLabel;
    Label2: TUniLabel;
    PnlClient02: TUniPanel;
    pnpFileRight: TUniPanel;
    btnSaveFile: TUniSpeedButton;
    PnlDestFileCtrls: TUniPanel;
    cboxFileType: TUniComboBox;
    tabEmail: TUniTabSheet;
    tabFax: TUniTabSheet;
    pnlFaxRight: TUniPanel;
    sbtnFax: TUniSpeedButton;
    sbtnFaxSetup: TUniSpeedButton;
    lviewFaxRecipients: TListView;
    sbtnDest_Screen: TUniSpeedButton;
    sbtnDest_Printer: TUniSpeedButton;
    sbtnDest_File: TUniSpeedButton;
    sbtnDest_EMail: TUniSpeedButton;
    sbtnDest_Fax: TUniSpeedButton;
    ReportEditor1: TUniMenuItem;
    pnlReportSearch: TUniPanel;
    RepDefMFGTYPE: TStringField;
    NavParams: TUniDBNavigator;
    Clone1: TUniMenuItem;
    RepDefFILE_NAME: TStringField;
    edSaveFile: TUniDBEdit;
    QryCriteriaPkList: TFDQuery;
    QryCriteriaPkListCOLUMN_NAME: TStringField;
    QryCriteriaPkListCAPTION: TStringField;
    QryCriteriaPkListWIDTH: TBCDField;
    RepDefDISABLE_PRINT: TStringField;
    RepDef_EMailEMAIL_BCC: TStringField;
    RepDef_EMailEMAIL_SENDER: TStringField;
    ScrollBoxEmail: TUniScrollBox;
    Splitter3: TUniSplitter;
    PnlDestEMailClient01: TUniPanel;
    sbtnAssignEmail: TUniSpeedButton;
    DBNavigator1: TUniDBNavigator;
    dbeEMailSubject: TUniDBEdit;
    cboxEMailFileType: TUniComboBox;
    EdAttachmentName: TUniEdit;
    dbeBCC: TUniDBEdit;
    PnlDestEMailLeft01: TUniPanel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label10: TUniLabel;
    sbtnAssignEmailBcc: TUniSpeedButton;
    PrintDialog1: TPrintDialog;
    ImageList1: TUniImageList;
    memoEmailTo: TUniDBMemo;
    memoEmail: TUniDBMemo;
    RepDef_CriteriaLIKE_OPERATOR: TStringField;
    RepDefReportOwner: TStringField;
    sbtnSelectCriteria: TUniSpeedButton;
    sbtnSaveCriteria: TUniSpeedButton;
    bvlCruteriaTool: TUniPanel;
    lblSender: TUniLabel;
    dbeEMailSender: TUniDBEdit;
    sbtnAssignEMailSender: TUniSpeedButton;
    ADOConnection1: TADOConnection;
    chkOpenFileUponSaving: TUniCheckBox;
    SQLiteRepDef: TFDTable;
    SQLiteConnection: TFDConnection;
    procedure AddReport1Click(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure SrcRepDefDataChange(Sender: TObject; Field: TField);
    procedure btnPrintClick(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCurrentClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SrcRepDef_CriteriaDataChange(Sender: TObject; Field: TField);
    procedure RepDef_CriteriaBeforeInsert(DataSet: TDataSet);
    procedure btnSaveFileClick(Sender: TObject);
    procedure DestinationClick(Sender: TObject);
    procedure edSaveFileChange(Sender: TObject);
    procedure RepDef_CriteriaUNARY_OPERATORValidate(Sender: TField);
    procedure RepDef_CriteriaBINARY_OPERATORValidate(Sender: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSetUpClick(Sender: TObject);
    procedure sbtnClearClick(Sender: TObject);
    procedure dbgReports1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgReports1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgReports1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure RepDefFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure RepDefAfterPost(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure sbtnAssignEmailClick(Sender: TObject);
    procedure AddfromVendors1Click(Sender: TObject);
    procedure RepDef_FormulasFORM_VALUESetText(Sender: TField;
      const Text: String);
    procedure RepDef_FormulasFORM_TYPESetText(Sender: TField;
      const Text: String);
    procedure ShowAllReports1Click(Sender: TObject);
    procedure sbtnUnHideAllClick(Sender: TObject);
    procedure sbtnFaxClick(Sender: TObject);
    procedure pgctrDestinationChange(Sender: TObject);
    procedure SrcRepDef_EMailDataChange(Sender: TObject; Field: TField);
    procedure sbtnFaxSetupClick(Sender: TObject);
    procedure dbgReportsDblClick(Sender: TObject);
    procedure PrintCurrentRecord(ACurrentLinkExpression: string = '');
    procedure Splitter1Moved(Sender: TObject);
    procedure ViewReportCatalog1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ReportsExecutionLog1Click(Sender: TObject);
    procedure DoDestBtnClick(Sender: TObject);
    procedure tabEmailShow(Sender: TObject);
    procedure ReportEditor1Click(Sender: TObject);
    procedure wwIncrementalSearchReportNameKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbgParamsEditButtonClick(Sender: TObject);
    procedure Clone1Click(Sender: TObject);
    procedure RepDefBeforePost(DataSet: TDataSet);
    procedure PkEmailIQAfterHPickCreate(Sender: TObject);
    procedure PkEmailBeforeOpen(DataSet: TDataSet);
    procedure RepDefBeforeDelete(DataSet: TDataSet);
    procedure RepDef_CriteriaBeforePost(DataSet: TDataSet);

  (*IQAlert or DCOM print methods to break down execution into distinct parts, meant to be used together.
    IQMS.WebVcl.RepDefVersions.DoExecuteReport is called between before and after to be perform the actual execution*)
    procedure ExecBeforePrint(Sender: TObject);
    procedure ExecAfterPrint(Sender: TObject);
    procedure DCOMPrintFinalization(Sender: TObject);
    procedure RepDefCalcFields(DataSet: TDataSet);
    procedure sbtnSaveCriteriaClick(Sender: TObject);
    procedure sbtnSelectCriteriaClick(Sender: TObject);
    procedure PkSelectionCriteriaBeforeOpen(DataSet: TDataSet);
    procedure PkSelectionCriteriaUserBtn1Click(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure cboxFileTypeCloseUp(Sender: TObject);
    procedure sbtnAssignEMailSenderClick(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure dbgParamsDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);

  private
    { Private declarations }
    FApp_ID:string;
    FFaxMan: TFaxMan;
    FOnBeforeSendEMail: TOnBeforeSendEmail;

    FUserLanguageCode: Real;
    FIsAnythingPrinted: Boolean;

    FPrintRange: TPrintRange;
    FPageStart : Integer;
    FPageStop  : Integer;

    FPickListShowInactiveRecords: Boolean;

    FDeletedReportSecurityRepDef: TSecurityRepDef;

    //IQAlert or DCOM print object to be used by parts then freed from calling thread
    FHMsg : TPanelMesg;
    FDCOMStartTime : Real;
    FDCOMEmailAttachedFile : string;
    FFilterSelectionCriteriaPickListByUser: Boolean;

    FShowExportFile: Boolean;
    FShowFaxDestination: Boolean;
    FShowScreenDestination: Boolean;

    FDatabaseName: string;
    FOnBeforeExecuteStoredProc: TOnBeforeExecuteStoredProc;

    function GetRepName:string;
    function GetServerName:string;
    function GetUID:string;
    function GetPassword:string;
    function GetCurrentLinkExpression :string;
    function GetCurrentLinkField      :TField;
    function GetColInfo( ColumnName:string ):TColInfo;
    procedure SetCriteriaExpression( ACrpe:TCrpe );
    procedure AssignReportTitle;
    procedure GetUserCriteriaExpression( List: TStringList );
    procedure DoBeforePrint( ProcName: string );
    procedure GetFormulasValues;
    procedure AssignFormulasValues;
    function GetIQRepDefParams: TFDParams;
    procedure ExecuteReport;
    procedure AddEMailFromPkList( APkList: TIQWebHPick ; AFieldName: string = 'EMAIL_TO'; ASingleResult: boolean = false );
    procedure Populate_Tables;
    procedure CheckTablesNameInUserCriteria;
    procedure SeTedureParameterValues;
    procedure EnsureRepdef_CatExistsFor(AApp_ID: string);
    procedure AssignGridColumns(AShowAll: Boolean);
    procedure HandleExceptionLocally(AMsg: String);
    procedure CreateUserFriendlyPromptFor(ARangeField: TField);
    procedure PopupCalendarPrompt(ARangeField: TField);
    procedure PopupPicklistPrompt(ARangeField: TField);
    function TableHasColumn(ATableName, AColumnName: string): Boolean;
    procedure ValidateReportName(AName: string);
    function IsStoredProcedure( AFileName: string; AValidateParams: Boolean = TRUE ): Char;
    function UseEmbeddedHTML( AComboBox: TUniComboBox ): Boolean;
    procedure AppendFileContentToString(var AText: string; AFileName: string);
    procedure SetFilterPicklistInactiveRecords(Sender: TObject);
    procedure UpgradeRepDef_Repository(const FileName: string);
    procedure EnsureReportExistsInRepository(ARepName: string);
    procedure SetShowFaxDestination(const Value: Boolean);
    procedure SetShowScreenDestination(const Value: Boolean);
    procedure CheckShowFirstAvailableDestination;
    function GetOutputTo: TOutputTo;
    procedure SetOutputTo(const Value: TOutputTo);
    function GetAttachmentFileType: TExportOptions;
    function GetExportFileType: TExportOptions;
    procedure SetAttachmentFileType(const Value: TExportOptions);
    procedure SetExportFileType(const Value: TExportOptions);
    procedure LoadDBFFile(AFileName: string);
    procedure LoadSQLiteFile(AFileName, ATableName: string);
  protected
    FIsTouchscreen: Boolean;
    FDBFTableName: string;
    function GetEnsureFormulaIndexExists( AFormulaName: string ): Integer;
    function IsCalledFromIQAlert: Boolean;
    procedure SetDestination; virtual;
    procedure GetDestination( var ADestination, ASpec: string ); virtual;
    procedure SetConnect; virtual;
    procedure EnableBtns;
    procedure UpgradeRepDef( const FileName: string; DestTable: TFDTable; const AIndexFieldNames, AExcludeColumns: string ); virtual;
    procedure CopyRepDefFrom( const AApp_ID, ARepName : string );
    procedure CheckUserNameFormula;
    procedure CheckExcludeProjType;
    procedure AssignRepDefFormulas;
//    procedure SaveReportFormulasTo( var AFormulas: TCrpeFormulas );
    procedure CheckUserEPlantID( Crpe1:TCrpe; CRDotNetObject:Variant ); virtual;
    procedure ClearCRW;
    procedure ApplyVerifyDataBase;
    procedure HandleOpenRepDefError( E: Exception ); virtual;
    procedure DoSetCRWPrinter; virtual;


    procedure StorePrinterInRegistry;
    procedure RestorePrinterFromRegistry;

    procedure AddToRepDefLog(AStartTime: Real);
    procedure LoadFileTypeComboBox; virtual;
  public
    { Public declarations }
    CRDotNetObject: Variant;
    Crpe1 : TCrpe;

    FDCOMDebugStr : string;


    constructor Create(AOwner:TComponent; const AApp_ID:string);
    destructor Destroy; override;

    class function DefaultToMasterPath( AFileName: string ): string;
    class function GetPath:string; virtual;



    procedure OpenRepDef;
    procedure CheckUpgrade;

    property App_ID : string read FApp_ID write FApp_ID;
    // TODO -oGabriel -cBDE: What do we need to do with this property, need to verify conversion here
    property DatabaseName : string read FDatabaseName write FDatabaseName stored False;
    property RepName:string read GetRepName;
    property Path   :string read GetPath;
    property ServerName:string read GetServerName;
    property UID:string read GetUID;
    property Password:string read GetPassword;
    property CurrentLinkExpression : string read GetCurrentLinkExpression;
    property CurrentLinkField : TField read GetCurrentLinkField;
    property ColInfo[ ColumnName:string ]:TColInfo read GetColInfo;
    property IQRepDefParams: TFDParams read GetIQRepDefParams;
    property OnBeforeSendEMail: TOnBeforeSendEmail read FOnBeforeSendEMail write FOnBeforeSendEMail;
    property IsAnythingPrinted: Boolean read FIsAnythingPrinted write FIsAnythingPrinted;
    property FilterSelectionCriteriaPickListByUser: Boolean read FFilterSelectionCriteriaPickListByUser write FFilterSelectionCriteriaPickListByUser;

    property OutputTo: TOutputTo read GetOutputTo write SetOutputTo;

    property ExportFileType: TExportOptions read GetExportFileType write SetExportFileType;
    property AttachmentFileType: TExportOptions read GetAttachmentFileType write SetAttachmentFileType;

    property ShowFaxDestination: Boolean read FShowFaxDestination write SetShowFaxDestination;
    property ShowScreenDestination: Boolean read FShowScreenDestination write SetShowScreenDestination;

    property OnBeforeExecuteStoredProc: TOnBeforeExecuteStoredProc read FOnBeforeExecuteStoredProc write FOnBeforeExecuteStoredProc;

    function CRWtoDateStr( Text: string ): string;
    class procedure Clone_RepDef_Report( ASrc_App_ID, ATrg_App_ID, ASrcRepName: string; ATrgRepName: string = '' );
  end;

  TFrmRepDefClass = class of TFrmRepDef;


implementation

{$R *.DFM}

uses
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.RepDefEdit,
  IQMS.Common.DataLib,
  IQMS.WebVcl.Repdeffr,
  IQMS.Common.Print,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Numbers,
  IQMS.WebVcl.RepDefRemove,
  IQMS.WebVcl.ResourceStrings,
  IQMS.Common.DateDlg,
//  FM_Params,
//  IQSecIns,
//  touchscrn,
//  IQRepDef_TouchScreen,
//  mailto_pick,
  System.Variants,
  IQMS.WebVcl.RepDefVersions,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.RepDefLog,
  IQMS.Common.Controls,
  IQMS.Common.ResStrings,
  System.StrUtils,
  IQMS.WebVcl.UserDefinedLabel,
  IQMS.WebVcl.SearchPickList,
  IQMS.WebVcl.Search,
  IQMS.Common.FileUtils,
  IQMS.Common.InputQuery,
  IQMS.Common.Boolean,
  IQMS.DBTrans.dbtado,
  IQMS.DBTrans.dbtfields,
  IQMS.Common.ApplicationSet;

{TIQWebRepDef}
constructor TIQWebRepDef.Create( AOwner:TComponent );
begin
  inherited Create( AOwner );
  App_ID:= Owner.Name;
  Params:= TFDParams.Create;
  WebUse:= FALSE;
end;

destructor TIQWebRepDef.Destroy;
begin
  Params.Free;
  inherited;
end;

procedure TIQWebRepDef.Execute;
var
  AReference: TFrmRepDefClass;
begin
  if not TouchScreen then
     AReference:= TFrmRepDefClass( TFrmRepDef );

   {HA-Depends
  else
     AReference:= TFrmRepDefClass( TFrmRepDefTouchScreen );  // IQRepDef_TouchScreen.pas
   }
  with AReference.Create(self, App_ID) do
  begin
    OnBeforeExecuteStoredProc := Self.OnBeforeExecuteStoredProc;
    CheckUpgrade;
    if TouchScreen then
       ShowModal
    else
       Show;
  end;
end;

function TIQWebRepDef.ExecuteModal: Boolean;
begin
  with TfrmRepDef.Create(self, App_ID) do
  try
    ShowModal;
  finally
    Release;
  end;
end;

procedure TIQWebRepDef.SetIsMyAlertsMode(const Value: Boolean);
begin
  FIsMyAlertsMode := Value;
end;

procedure TIQWebRepDef.AddParam(const AParamName: string;
  const ADataType: TFieldType; AParamValue: Variant);
begin
  if not System.Variants.VarIsEmpty(AParamValue) then
    Self.Params.CreateParam(ADataType, AParamName, ptInput).
      Value := AParamValue
  else
    Self.Params.CreateParam(ADataType, AParamName, ptInput);
end;

procedure TIQWebRepDef.ClearParams;
begin
  if Assigned(Self.Params) then
    Self.Params.Clear;
end;


{ TFrmRepDef }
constructor TfrmRepDef.Create(AOwner:TComponent; const AApp_ID:string);
begin
  App_ID:= AApp_ID;
  FilterSelectionCriteriaPickListByUser:= TRUE;

  EnsureRepdef_CatExistsFor( App_ID );

  inherited Create( AOwner );

  PageControl1.ActivePageIndex    := 0;
  pgctrDestination.ActivePageIndex:= 0;

  FFaxMan:= TFaxMan.Create;

  if (SecurityManager <> nil) then
     FUserLanguageCode:= SelectValueFmtAsFloat('select language_code from s_user_general where user_name = ''%s''', [ SecurityManager.UserName ]);

  FPrintRange:= prAllPages;

//  TIQWebUserDefLabel.AssignFieldDisplayLabel( PkEmailVendorCUSER1, 'IQWIN32.EXE', 'FrmVendor', 'IQUserDefLabel4');
//  TIQWebUserDefLabel.AssignFieldDisplayLabel( PkEmailVendorCUSER2, 'IQWIN32.EXE', 'FrmVendor', 'IQUserDefLabel5');

  Caption:= Format( IQMS.WebVcl.ResourceStrings.cTXT0000150 {'Registered Reports (ID: %s)'}, [App_ID]);
end;

procedure TfrmRepDef.FormCreate(Sender: TObject);
begin
  LoadFileTypeComboBox;
  FormStyle:= fsNormal;
  pnlButtons.Top:= pnlGrid.Top + pnlGrid.Height + 100;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlDestFileCtrls);
  IQMS.Common.Controls.AdjustPageControlToParent(pgctrDestination);

  // set the value
  FIsTouchscreen := False;
  if (Owner is TIQWebRepDef) then
     FIsTouchscreen := TIQWebRepDef(Owner).TouchScreen;

end;

procedure TfrmRepDef.FormShow(Sender: TObject);
begin
  if not IQMS.Common.ApplicationSet.IsTouchScreen then
  IQRegFormRead( self, [ self, dbgReports, pnlGrid, dbgParams, cboxFileType,
   PnlDestFileLeft01, PnlDestEMailLeft01, chkOpenFileUponSaving ]);
  {HA-Depends
  EnsureSecurityInspectorOnTopOf( self ); {IQSecIns.pas}
  OpenRepDef;
  DestinationClick(NIL);

  CheckVistaAdjustSize([ cboxFileType, edSaveFile, memoEMailTo, dbeEMailSubject, memoEmail, cboxEMailFileType, dbeBCC, EdAttachmentName ]);
  edSaveFile.width := cboxFileType.width;

  FormResize(NIL);

end;

destructor TFrmRepDef.Destroy;
begin
  FFaxMan.Free;
  inherited;
end;

procedure TfrmRepDef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if RepDef.Active and (RepDef.State in [dsEdit, dsInsert]) then
    RepDef.Post;
//  RepDef.CheckBrowseMode;
  {make sure only Description is visible otherwise both Description and Hidden will be back during next IQRegFormRead}
  AssignGridColumns( FALSE );
  if not IQMS.Common.ApplicationSet.IsTouchScreen then
  IQRegFormWrite( self, [ self, dbgReports, pnlGrid, dbgParams, cboxFileType,
   PnlDestFileLeft01, PnlDestEMailLeft01, chkOpenFileUponSaving ]);
  Action:= caFree;
end;

procedure TfrmRepDef.FormResize(Sender: TObject);
begin
  // Jan-17-06 - replaced with grids dgProportionalColResize option
  // with dbgReports do
  //   if not ShowAllReports1.Checked then
  //      ColWidthsPixels[ 0 ]:= ClientWidth
  //   else
  //      begin
  //         if Fields[ 0 ].FieldName = 'DESCRIP' then
  //            ColWidthsPixels[ 0 ]:= ClientWidth - ColWidths[ 1 ] - 2
  //         else
  //            ColWidthsPixels[ 1 ]:= ClientWidth - ColWidths[ 0 ] - 2
  //      end;
end;

procedure TfrmRepDef.OpenRepDef;
begin
//  if (MainModule.FDConnection <> nil) then
  try
    RepDef.ConnectionName := cnstFDConnectionName;
    RepDef_Criteria.ConnectionName := cnstFDConnectionName;
    RepDef_Formulas.ConnectionName := cnstFDConnectionName;
    RepDef_EMail.ConnectionName := cnstFDConnectionName;
    RepDef.Open;
    RepDef.SetRange( [App_ID], [App_ID] );
    RepDef_Criteria.Open;
    RepDef_Formulas.Open;
    RepDef_EMail.Open;
  except on E:Exception do
    HandleOpenRepDefError( E );
  end;
end;

procedure TfrmRepDef.HandleOpenRepDefError( E: Exception );
begin
  Caption:=  IQMS.WebVcl.ResourceStrings.cTXT0000151; // 'Registered Reports - Database is Unavailable'
end;

procedure TfrmRepDef.EnableBtns;
var
  AValue   : Boolean;
  DestValid: Boolean;
begin
  with RepDef do
    AValue:= not( Eof and Bof );

//  Remove1.Enabled:= AValue and SR.Enabled['Remove1'];
//  Edit1.Enabled  := AValue and SR.Enabled['Edit1'];

  DestValid:= TRUE;

  if pgctrDestination.ActivePage = tabFile then
     DestValid:= edSaveFile.Text <> ''
  else if pgctrDestination.ActivePage = tabEMail then
     DestValid:= RepDef_EMailEMAIL_TO.asString > ''
  else if pgctrDestination.ActivePage = tabFax then
     DestValid:= FFaxMan.FRecipients.Count > 0;

//  btnPrint.Enabled  := AValue and DestValid and SR.Enabled['btnPrint'];
//  btnCurrent.Enabled:= AValue and (CurrentLinkExpression <> '') and DestValid and SR.Enabled['btnCurrent'];
//  sbtnClear.Enabled := not (RepDef_Criteria.Eof and RepDef_Criteria.Bof) and SR.Enabled['sbtnClear'];
//  sbtnSaveCriteria.Enabled := not (RepDef_Criteria.Eof and RepDef_Criteria.Bof) and SR.Enabled['sbtnSaveCriteria'];

  // 10-13-2010
  if btnCurrent.Enabled and btnPrint.Enabled and (RepDefDISABLE_PRINT.asString = 'Y') then
     btnPrint.Enabled:= FALSE;
end;

procedure TfrmRepDef.SetCriteriaExpression( ACrpe:TCrpe );
var
  List2: TStringList;
begin
  List2:= TStringList.Create;
  try
    {Get user defined selection criteria expression stored in RepDef_Criteria}
    GetUserCriteriaExpression( List2 );

    {if no user criteria found - exit}
    if List2.Count = 0 then
       EXIT;

    AppendSelectionFormula( ACrpe, CRDotNetObject,  List2 );
  finally
    List2.Free;
  end;
end;

procedure TfrmRepDef.AssignReportTitle;
var
  List: TStringList;
begin
  List:= TStringList.Create;
  try
    {Get user defined selection criteria expression stored in RepDef_Criteria}
    GetUserCriteriaExpression( List );
    SetReportTitle( Crpe1, CRDotNetObject, List.Text ); { IQMS.WebVcl.RepDefVersions.pas }
  finally
    List.Free;
  end;
end;

procedure TfrmRepDef.GetUserCriteriaExpression( List: TStringList );
var
  sStart : string;
  sEnd   : string;
  sUOper : string;
  sBOper : string;
  sNulls : string;
  S1,S2  : string;
  ColName: string;
  Column : TColInfo;
  Year,Month,Day : Word;
  AUseLike: Boolean;
begin
  List.Clear;

  with RepDef_Criteria do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      S1     := '';
      S2     := '';
      sStart := FieldByName('RANGE_START').asString;
      sEnd   := FieldByName('RANGE_END').asString;
      sUOper := UpperCase( FieldByName('UNARY_OPERATOR').asString );
      sBOper := UpperCase(FieldByName('BINARY_OPERATOR').asString);
      sNulls := FieldByName('INCLUDE_NULLS').asString;
      ColName:= FieldByName('CRW_COL_NAME').asString;
      AUseLike:= FieldByName('LIKE_OPERATOR').asString = 'Y';

      Column := ColInfo[ ColName ];

      if not Empty(sStart) then
        case Column.DataType of
          dtNumber:
            begin
              if AUseLike then
                 S1:= Format( 'ToText({%s}) LIKE ''%s''', [ ColName, StringReplace( sStart, '%', '*', [rfReplaceAll, rfIgnoreCase]) ])
              else
                 S1:= Format( '{%s} >= %s', [ColName, sStart] );

              if sNulls = 'Y' then
                 S1:= Format( '( IsNull({%s}) or %s )', [ ColName, S1 ]);
            end;

          dtVarChar2:
            begin
              if AUseLike then
                 S1:= Format( '{%s} LIKE ''%s''', [ ColName, StringReplace( sStart, '%', '*', [rfReplaceAll, rfIgnoreCase]) ])
              else
                 S1:= Format( '{%s} >= ''%s''', [ColName, sStart] );

              if sNulls = 'Y' then
                 S1:= Format( '( IsNull({%s}) or %s )', [ ColName, S1 ])
            end;

          dtChar:
            begin
              //jason - 05-24-06 - do not user crystal trim functions here - they cause severe memory leak
              if AUseLike then
                 S1:= Format( '({%s}) LIKE ''%s''', [ ColName, StringReplace( sStart, '%', '*', [rfReplaceAll, rfIgnoreCase]) ])
              else
                 S1:= Format( '({%s}) >= ''%s''', [ColName, sStart] );

              if sNulls = 'Y' then
                 S1:= Format( '( IsNull({%s}) or %s )', [ ColName, S1 ]);
            end;

          dtDate:
            begin
              DecodeDate(  StrToDate(sStart), Year, Month, Day );
              if sNulls = 'Y' then
                // S1:= Format( '( IsNull({%s}) or DTSToDate({%s}) >= Date(%d, %d, %d) )', [ ColName, ColName, Year, Month, Day] )
                // S1:= Format( '( IsNull({%s}) or {%s} >= Date(%d, %d, %d) )', [ ColName, ColName, Year, Month, Day] )
                S1:= Format( '( IsNull({%s}) or CDate({%s}) >= Date(%d, %d, %d) )', [ ColName, ColName, Year, Month, Day] )
              else
                // S1:= Format( 'DTSToDate({%s}) >= Date(%d, %d, %d)', [ ColName, Year, Month, Day ] );
                // S1:= Format( '{%s} >= Date(%d, %d, %d)', [ ColName, Year, Month, Day ] );
                S1:= Format( 'CDate({%s}) >= Date(%d, %d, %d)', [ ColName, Year, Month, Day ] );
            end;
        else
          begin
            if sNulls = 'Y' then
              S1:= Format( '( IsNull({%s}) or {%s} >= %s )', [ColName, ColName, sStart] )
            else
              S1:= Format( '{%s} >= %s', [ColName, sStart] );
          end
        end;

      if not Empty(sEnd) then
        case Column.DataType of
          dtVarChar2:
            begin
              if sNulls = 'Y' then
                S2:= Format( '( IsNull({%s}) or {%s} <= ''%s'' )', [ColName, ColName, sEnd] )
              else
                S2:= Format( '{%s} <= ''%s'' ', [ColName, sEnd] );
            end;
          dtChar:
            begin
              //jason - 05-24-06 - do not user crystal trim functions here - they cause severe memory leak
              if sNulls = 'Y' then
                S2:= Format( '( IsNull({%s}) or ({%s}) <= ''%s'' )', [ColName, ColName, sEnd] )
              else
                S2:= Format( '({%s}) <= ''%s'' ', [ColName, sEnd] );
            end;
          dtDate:
            begin
              DecodeDate(  StrToDate(sEnd), Year, Month, Day );
              if sNulls = 'Y' then
                // S2:= Format( '( IsNull({%s}) or DTSToDate({%s}) <= Date( %d, %d, %d) )', [ColName, ColName, Year, Month, Day] )
                // S2:= Format( '( IsNull({%s}) or {%s} <= Date( %d, %d, %d) )', [ColName, ColName, Year, Month, Day] )
                S2:= Format( '( IsNull({%s}) or CDate({%s}) <= Date( %d, %d, %d) )', [ColName, ColName, Year, Month, Day] )
              else
                // S2:= Format( 'DTSToDate({%s}) <= Date( %d, %d, %d)', [ColName, Year, Month, Day  ] );
                // S2:= Format( '{%s} <= Date( %d, %d, %d)', [ColName, Year, Month, Day  ] );
                S2:= Format( 'CDate({%s}) <= Date( %d, %d, %d)', [ColName, Year, Month, Day  ] );
            end;
        else
          begin
            if sNulls = 'Y' then
              S2:= Format( '( IsNull({%s}) or {%s} <= %s )', [ColName, ColName, sEnd] )
            else
              S2:= Format( '{%s} <= %s', [ColName, sEnd] );
          end;
        end;

      if not Empty(S1) or not Empty(S2) then
      begin
        if not Empty(S1) and not Empty(S2) then
          S1:= Format( '( %s and %s )', [S1, S2] )
        else if not Empty(S1) and Empty(S2) then
          S1:= Format( '( %s )', [S1] )
        else if Empty(S1) and not Empty(S2) then
          S1:= Format( '( %s )', [S2] );

        if sUOper = 'NOT' then
          S1:= Format( '%s %s', [sUOper, S1]);

        if  Pos(sBOper, 'AND~OR') > 0 then
          S1:= Format( '%s %s ', [S1, sBOper]);

        List.Add( S1 );
      end;

      Next;
    end; {while}
  finally
    EnableControls;
  end; {with RepDef_Criteria}

  {Fix Trailing AND or OR}
  if List.Count > 0 then
  begin
    S1:= List[ List.Count - 1 ];
    if Trim(Copy(S1, Length(S1)-4, 4)) = 'AND' then
      S1:= Copy(S1, 1, Length(S1)-4);
    if Trim(Copy(S1, Length(S1)-3, 3)) = 'OR' then
      S1:= Copy(S1, 1, Length(S1)-3);
    List[ List.Count - 1 ]:= S1;
  end;

  // 03-31-2010
  if (self.Owner is TIQWebRepDef) and Assigned( TIQWebRepDef(self.Owner).OnGetUserCriteriaExpression ) then
     TIQWebRepDef(self.Owner).OnGetUserCriteriaExpression( self, List );
end;


procedure TfrmRepDef.SeTedureParameterValues;
var
  sValue : string;
  sParam : string;
  ColName: string;
  Column : TColInfo;
  Year,Month,Day : Word;

  Procedure FormatDateForCrystal;
  begin
    if not Empty(sValue) then
      DecodeDate(  StrToDate(sValue), Year, Month, Day )
    else
      begin
        if Pos( 'BEGIN', Uppercase( sParam ) ) <> 0 then
          begin   // if the begin date is left blank, change it tp 1/1/1989
            Year := 1989;
            Month := 01;
            Day := 01;
          end
        else
          begin   // if the end date is left blank, change it tp today's date + 100 years
            DecodeDate(  Date, Year, Month, Day );
            Year := Year + 100;
          end;
      end;
    sValue := Format( '%d,%d,%d 00:00:00', [Year, Month, Day] );
  end;

begin
  with RepDef_Criteria do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      // retrieve parameter data
      sValue := FieldByName('RANGE_START').asString;
      sParam := FieldByName('DESCRIP').asString;
      ColName:= FieldByName('CRW_COL_NAME').asString;
      Column := ColInfo[ ColName ];

      if Column.DataType = dtDate then
        FormatDateForCrystal;

      // set the parameters in Crystal
      if not Empty( sValue ) then
        SetParam( Crpe1, CRDotNetObject, sParam, sValue ) { IQMS.WebVcl.RepDefVersions.pas }
      else
        if (Pos( '_NUM_', Uppercase( sParam ) ) <> 0) or (Pos( 'EPLANT_ID', Uppercase( sParam ) ) <> 0) then
          SetParam( Crpe1, CRDotNetObject, sParam, '-1' ); { IQMS.WebVcl.RepDefVersions.pas }

      Next;
    end; {while}
  finally
    EnableControls;
  end; {with RepDef_Criteria}
end;

function TfrmRepDef.GetCurrentLinkExpression:string;
var
  Field:TField;
  Year, Month, Day:Word;
begin
  Result:= '';
  Field:= CurrentLinkField;
  if Field = NIL then
    Exit;
  if IQMS.DBTrans.dbtfields.IsStringFieldType(Field.DataType) then
    Result:= Format('{%s} = ''%s''', [ RepDef.FieldByName('CRW_MATCH_COL_NAME').asString, Field.AsString ])
  else if IQMS.DBTrans.dbtfields.IsIntegerFieldType(Field.DataType) or
    IQMS.DBTrans.dbtfields.IsFloatFieldType(Field.DataType) then
    Result:= Format('{%s} = %s',     [ RepDef.FieldByName('CRW_MATCH_COL_NAME').asString, Field.AsString ])
  else if IQMS.DBTrans.dbtfields.IsDateTimeFieldType(Field.DataType) then
      begin
        DecodeDate( Field.AsDateTime, Year, Month, Day );
        Result:= Format( 'CDate({%s}) = Date(%d, %d, %d)', [ RepDef.FieldByName('CRW_MATCH_COL_NAME').asString, Year, Month, Day ] );
      end;
end;

function TfrmRepDef.GetCurrentLinkField:TField;
var
  LinkTableName:string;
  LinkFieldName:string;
  TableNameMatching: Boolean;
  S:string;

  function SameOwnerOf( ADataSet: TDataSet ): Boolean;
  var
    AIQRepDefOwner: TComponent;
    ADataSetOwner : TComponent;
  begin
    {Normally a form that owns IQRepDef}
    AIQRepDefOwner:= self.Owner.Owner;

    {Try finding the same owner that owns IQRepdef that owns the table directly or via a datamodule}
    ADataSetOwner:= ADataSet.Owner;
    while Assigned( ADataSetOwner ) do
    begin
      if ADataSetOwner = AIQRepDefOwner then
      begin
        Result:= TRUE;
        EXIT;
      end;
      ADataSetOwner:= ADataSetOwner.Owner;
    end;

    Result:= FALSE;
  end;

  function InternalGetCurrentLinkField( AOwnersHasToMatch: Boolean ): TField;
  var
    I:Integer;
  begin
    Result:= NIL;
    with FDManager.FindConnection(cnstFDConnectionName) as TFDConnection do
      for I:= 0 to DatasetCount - 1 do
      begin
        if (DataSets[ I ] is TFDTable) then
           TableNameMatching:= (StrTran(TFDTable(DataSets[ I ]).TableName, 'IQMS.', '') = LinkTableName)
        else if (DataSets[ I ] is TFDQuery) then
           TableNameMatching:= (CompareText( TFDQuery(DataSets[ I ]).Name, LinkTableName ) = 0)
        else
           TableNameMatching:= FALSE;

        if TableNameMatching and ( not AOwnersHasToMatch or SameOwnerOf( DataSets[ I ] )) then
        begin
          Result:= DataSets[ I ].FindField( LinkFieldName );
          EXIT;
        end
      end;
  end;

begin
  Result:= NIL;
  S:= Repdef.FieldByName('CURR_REC_COL_NAME').asString;
  LinkTableName:= Copy( S, 1, Pos( '.', S )-1 );
  LinkFieldName:= Copy( S, Pos( '.', S )+1, Length(S));
  if (LinkTableName = '') or (LinkFieldName = '') then
    EXIT;

  {for compatability concerns first try finding the field having IQRepdef and Table owners match}
  Result:= InternalGetCurrentLinkField( TRUE {AOwnersHasToMatch} );
  if Result <> nil then
     EXIT;

  {if for some reason we couldn't find the field then fall back to what we used to do}
  Result:= InternalGetCurrentLinkField( FALSE {AOwnersHasToMatch} );
end;

function TfrmRepDef.GetColInfo( ColumnName:string ):TColInfo;
var
  S        : string;
begin
  Result.TableName:= Copy( ColumnName, 1, Pos( '.', ColumnName )-1 );
  Result.FieldName:= Copy( ColumnName, Pos( '.', ColumnName )+1, Length(ColumnName));
  with QryColInfo do
  try
     Close;
     ParamByName('table_name').asString := Result.TableName;
     ParamByName('column_name').asString:= Result.FieldName;
     Open;

     S:= FieldByName('data_type').asString;
     if S = 'CHAR' then
        Result.DataType := dtChar
     else if S = 'VARCHAR2' then
        Result.DataType := dtVarchar2
     else if S = 'NUMBER' then
        Result.DataType := dtNumber
     else if S = 'DATE' then
        Result.DataType := dtDate
     else if S = 'LONG' then
        Result.DataType := dtBlob
     else
        Result.DataType := dtOther;

     if Result.DataType = dtChar then
       Result.DataLength := FieldByName('data_length').asInteger
     else
       Result.DataLength := FieldByName('data_precision').asInteger;

     Result.DataDecimal:= FieldByName('data_scale').asInteger;
  finally
     Close;
  end;
end;

function TfrmRepDef.GetRepName:string;
begin
  with RepDef do Result:= FieldByName('REPNAME').asString;
end;

class function TfrmRepDef.GetPath:string;
begin
  Result:= IQMS.Common.Miscellaneous.IQGetReportsPath;
{  with TIQIQMS.Common.Registry.Create do
  try
    RootKey:= HKEY_LOCAL_MACHINE;
    if OpenKey('\Software\IQMS\IQWin32', FALSE) then
      if ValueExists( 'REPORTS' ) then
        Result:= StrTran( ReadString( 'REPORTS' ) + '\', '\\', '\');
  finally
    Free;
  end; }
end;

function TfrmRepDef.GetServerName:string;
begin
  // Must equal the Oracle SID.
  Result := IQMS.Common.Miscellaneous.IQGetServerName;
end;

function TfrmRepDef.GetUID:string;
begin
  // Must always be the IQMS user.
  Result := IQMS.Common.Miscellaneous.IQGetUID;
end;

function TfrmRepDef.GetPassword:string;
begin
  // Must always be the IQMS password.
  Result := IQMS.Common.Miscellaneous.IQGetPassword;
end;

procedure TfrmRepDef.ValidateReportName( AName: string );
var
  ABad: array of string;
  I,J : Integer;
  S   : string;
begin
  if AName = '' then
     EXIT;

  ABad:= VarArrayOf([ '`', '~', ',', '!', '@', '#', '%', '^', '&', '*', '(', ')', '+', '-', '=', '/', '?', '>', '<', '|', '\', '"', '''', '$' ]);
  for I:= 0 to High( ABad ) do
    if Pos( ABad[ I ], AName ) > 0 then
    begin
       S:= '';
       for J:= 0 to High( ABad ) do S:= S + ABad[ J ] + ' ';
       // 'Invalid character found in the file name.'#13#13 +
       // 'The following characters are not supported: '#13'%s'
       raise Exception.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000152, [ S ]);
    end;

  IQAssert( Length(AName) <= 50, IQMS.WebVcl.ResourceStrings.cTXT0000332 {'Report name cannot exceed 30 chars.'});
end;


function TfrmRepDef.IsStoredProcedure( AFileName: string; AValidateParams: Boolean = TRUE ): Char;
var
  DNetRpt: Variant;
  ACrpe  : TCrpe;
  CW     : Word;
begin
  CheckDisableFPUExceptions( CW );
  try
    CheckCreateReportObject( ACrpe, DNetRpt, self );

    SetReportName( ACrpe, DNetRpt, AFileName );
    Result:= 'N';

    SetReportConnection( ACrpe, DNetRpt, self.ServerName, self.UID, self.Password );

    CheckConfigureDNetRpt( DNetRpt );

    if ParamExists( ACrpe, DNetRpt, 'CRW_CURSOR' ) then
      Result := 'Y';

    if Result = 'N' then
      EXIT;

    if AValidateParams and not ValidStoredProcedureParams( ACrpe, DNetRpt ) then  { IQMS.WebVcl.RepDefVersions.pas }
      { 'This report is based on a Stored Procedure, but the input parameters are incorrectly named.  Correct the Procedure & Report before attempting to add this report.' }
      raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000303 );
  finally
    CheckFreeCRDotNetObject( DNetRpt );
    CheckRestoreFPU( CW );
    CheckFreeCRPEObject( ACrpe );
  end;
end;

procedure TFrmRepDef.LoadFileTypeComboBox;
begin
  // File
  IQMS.Common.PrintDialogsShare.LoadRepDefFileTypeCombo_PrnDlg(cboxFileType);
  // Email Attachment
  IQMS.Common.PrintDialogsShare.LoadRepDefFileTypeCombo_PrnDlg(cboxEMailFileType);
end;

procedure TfrmRepDef.AddReport1Click(Sender: TObject);
var
  sDescrip:string;
  FilePath:string;
begin
  with OpenDialog1 do
  begin
    InitialDir:= Path;
    if Execute then
    begin
      FilePath:= UpperCase( StrTran(ExtractFileDir( FileName ) + '\', '\\', '\'));
      if FilePath <> UpperCase(Path) then
        { 'Cannot proceed.  Please copy this report into the EnterpriseIQ subdirectory, %s.'; }
        raise Exception.Create( Format(IQMS.WebVcl.ResourceStrings.cTXT0000145, [Path]));
      try
        sDescrip:= ExtractFileName( FileName );
        ValidateReportName( sDescrip );
        RepDef.Insert;
        RepDefAPP_ID.asString := App_ID;
        RepDefREPNAME.asString:= sDescrip;
        RepDefDESCRIP.asString:= sDescrip;

        { this is where we set the Stored_Procedure column }
        RepDefStored_Procedure.asString:= IsStoredProcedure( FilePath + sDescrip );

        { post and check if filter kicked out newly added report }
        RepDef.Post;

        EnsureReportExistsInRepository( sDescrip );

        if CompareText( RepDefREPNAME.asString, sDescrip ) = 0 then
           Edit1Click(Sender);
      except
        Application.ShowException( Exception(ExceptObject) );
        Repdef.Cancel;
      end;
    end;  {if execute}
  end;  {with OpenDialog1}
end;

procedure TfrmRepDef.Edit1Click(Sender: TObject);
begin
  with TRepDefEdit.Create(self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmRepDef.SrcRepDefDataChange(Sender: TObject; Field: TField);

  procedure _SetColumnVisible(const AColumnName: string; AVisible: Boolean);
  var
    AColumn: TUniBaseDBGridColumn;
  begin
    // Get the column
    AColumn := IQMS.Common.Controls.IQColumnByName(dbgParams, AColumnName);
    // If the column exists, set visibility
    if (AColumn <> nil) then
      AColumn.Visible := AVisible;
  end;

  procedure _SetColumnCaption(const AColumnName: string; ACaption: string);
  var
    AColumn: TUniBaseDBGridColumn;
  begin
    // Get the column
    AColumn := IQMS.Common.Controls.IQColumnByName(dbgParams, AColumnName);
    // If the column exists, set visibility
    if (AColumn <> nil) then
      AColumn.Title.Caption := ACaption;
  end;

begin
  EnableBtns;

  // 06/07/2013 Use the nested method.  Prevents AV if TColumn is null. (Byron)
  _SetColumnVisible('LIKE_OPERATOR', RepDefSTORED_PROCEDURE.asString <> 'Y');
  _SetColumnVisible('RANGE_END', RepDefSTORED_PROCEDURE.asString <> 'Y');
  _SetColumnVisible('BINARY_OPERATOR', RepDefSTORED_PROCEDURE.asString <> 'Y');
  _SetColumnVisible('INCLUDE_NULLS', RepDefSTORED_PROCEDURE.asString <> 'Y');

//  IQMS.Common.Controls.IQColumnByName(dbgParams, 'LIKE_OPERATOR').Visible  := RepDefSTORED_PROCEDURE.asString <> 'Y';
//  IQMS.Common.Controls.IQColumnByName(dbgParams, 'RANGE_END').Visible      := RepDefSTORED_PROCEDURE.asString <> 'Y';
//  IQMS.Common.Controls.IQColumnByName(dbgParams, 'BINARY_OPERATOR').Visible:= RepDefSTORED_PROCEDURE.asString <> 'Y';
//  IQMS.Common.Controls.IQColumnByName(dbgParams, 'INCLUDE_NULLS').Visible  := RepDefSTORED_PROCEDURE.asString <> 'Y';

  // 06/07/2013 Use the nested method.  Prevents AV if TColumn is null. (Byron)
  if RepDefSTORED_PROCEDURE.asString = 'Y' then
    // IQMS.WebVcl.ResourceStrings.cTXT0000304 = 'Value'
    _SetColumnCaption('RANGE_START', IQMS.WebVcl.ResourceStrings.cTXT0000304)
    // IQMS.Common.Controls.IQColumnByName(dbgParams, 'RANGE_START').Title.Caption:= IQMS.WebVcl.ResourceStrings.cTXT0000304 // 'Value';
  else
    // IQMS.WebVcl.ResourceStrings.cTXT0000305 = 'From'
    _SetColumnCaption('RANGE_START', IQMS.WebVcl.ResourceStrings.cTXT0000305)
//     IQMS.Common.Controls.IQColumnByName(dbgParams, 'RANGE_START').Title.Caption:= IQMS.WebVcl.ResourceStrings.cTXT0000305; // 'From';
end;

procedure TfrmRepDef.btnPrintClick(Sender: TObject);
var
  HMsg    : TPanelMesg;
  DebugStr: string;

  // added for .net CRXI
  CW: Word;
begin
  // commented on Oct-09-03 - caused problems when printing web_direct through CGI.
  // if dbgReports.GetActiveField <> RepDefDESCRIP then
  //    EXIT;

  //EIQ-959 Reports - printing to different file formats IQRep: Error exporting report
  if pgCtrDestination.ActivePage = tabFile then
  IQAssert((edSaveFile.Text <> ''), IQMS.WebVcl.ResourceStrings.cTXT0000417); //File Name cannot be blank.  Please revise.

  if RepName <> '' then
    try
      CheckDisableFPUExceptions( CW );
      try
        DebugStr:= 'Disp User Message';
        HMsg:= hPleaseWait( IQMS.WebVcl.ResourceStrings.cTXT0000153 {'Creating report.  Please wait...'} );
        try
          DebugStr:= 'CheckBrowseMode';
          Repdef_Criteria.CheckBrowseMode;
          Repdef_EMail.CheckBrowseMode;
          FIsAnythingPrinted:= FALSE;

          DebugStr:= 'Check Before Print';
          if RepDefBEFORE_PRINT.AsString <> '' then
            DoBeforePrint( RepDefBEFORE_PRINT.AsString );

          DebugStr:= 'Creating Report Object. Unable to locate EnterpriseIQ Crystal Reports components. Please reinstall the EnterpriseIQ client.';
          CheckCreateReportObject( Crpe1, CRDotNetObject, self );
          try
            DebugStr:= 'Assign Path and RepName';
            SetReportName( Crpe1, CRDotNetObject, Path + RepName );

            DebugStr:= 'Connect';
            SetConnect;                                               { Set connect info FOR EVERY TABLE including subreports }

            DebugStr:= 'Check Configure .NET Report';
            CheckConfigureDNetRpt( CRDotNetObject );

            // section added for stored procedure-based reports
            if RepDefStored_Procedure.asString = 'Y' then
              begin
                DebugStr:= 'Set Crystal Prompts to FALSE';
                CheckSuppressCrpePrompts( Crpe1 );

                DebugStr:= 'Set Stored Procedure Report Parameter Values';
                SeTedureParameterValues;

                DebugStr:= 'Set Stored Procedure Report EPLANT_ID';   { IQMS.WebVcl.RepDefVersions.pas }
                SetParam( Crpe1, CRDotNetObject, 'v_eplant_id', Format('%s', [ sIIf( SecurityManager.EPlant_ID = 'NULL', '0', SecurityManager.EPlant_ID )]) );
              end
            else
              begin
                DebugStr:= 'Set Criteria Expression';
                SetCriteriaExpression( Crpe1 );  //Only passing crpe.selection.formula, .net codes handles its selection formula
              end;

            DebugStr:= 'Set Destination';
            SetDestination;

            DebugStr:= 'Set Report Title';
            AssignReportTitle;

            if Assigned( HMsg ) then
              HMsg.Hide;
            Application.ProcessMessages;

            DebugStr:= 'Get Formulas Values';
            GetFormulasValues;

            if Assigned( HMsg ) then
              HMsg.Show;
            Application.ProcessMessages;

            DebugStr:= 'Set Printer';
            DoSetCRWPrinter;

            DebugStr:= 'Check Copies';
            if RepDefNUM_COPIES.asInteger > 1 then
               AssignPrintOptionNumCopies( Crpe1, CRDotNetObject, RepDefNUM_COPIES.asInteger );

            DebugStr:= 'Check Collate';
            if RepDefCOLLATE.asString = 'Y' then
               AssignPrintOptionCollated( Crpe1, CRDotNetObject, TRUE  )    // Collated
            else if RepDefCOLLATE.asString = 'N' then
               AssignPrintOptionCollated( Crpe1, CRDotNetObject, FALSE )    // UnCollated
            else
               AssignPrintOptionCollated( Crpe1, CRDotNetObject, TRUE  );   // DefaultCollation;

            DebugStr:= 'Check Print Range';
            if FPrintRange = prPageNums then
               AssignPrintOptionPrintRange( Crpe1, CRDotNetObject, FPageStart, FPageStop );

            DebugStr:= 'Apply VerifyDataBase';
            ApplyVerifyDataBase;                                                        { Force VerifyDataBase including subreports }

            DebugStr:= 'Check TablesName In UserCriteria';
            if RepDefStored_Procedure.asString <> 'Y' then
               CheckTablesNameInUserCriteria;

            if IsCalledFromIQAlert or IsConsole then // web and iqalert cannot prompt for parameters. dNet handles this in iqrep.dll.
              AssertWebCrpeParamPromptsNotExist( Crpe1, 'Reports that prompt for parameters are not supported by this application.' );

            DebugStr:= 'Disable .NET Parameter Prompt';
            DisableDNetParamPrompts( CRDotNetObject, IsCalledFromIQAlert or IsConsole );

            if Assigned( HMsg ) then
               HMsg.Mesg:= 'Verifying DB and Executing Report ...';

            DebugStr:= 'Execute Report';
            ExecuteReport;

            FIsAnythingPrinted:= IQMS.WebVcl.RepDefVersions.IsAnythingPrinted( Crpe1, CRDotNetObject );

            if FShowExportFile and FileExists(IQMS.WebVcl.RepDefVersions.GetExportFilePath( Crpe1, CRDotNetObject )) then
              IQMS.Common.Miscellaneous.ExecuteProgram(IQMS.WebVcl.RepDefVersions.GetExportFilePath( Crpe1, CRDotNetObject ));

          finally
            CheckFreeCRDotNetObject( CRDotNetObject );
            ClearCRW;
            CheckFreeNonToWindowOutputCrpe( Crpe1 );
          end;
        finally
          HMsg.Free;
        end;
      finally
        CheckRestoreFPU( CW );
      end;
    except on E: Exception do
        HandleExceptionLocally(Format('%s (Repdef Action: %s)', [ E.Message, DebugStr ]));
        //raise Exception.CreateFmt('%s (Repdef Action: %s)', [ E.Message, DebugStr ]);
    end;
end;

procedure TFrmRepDef.DoSetCRWPrinter;
begin
  if IsCalledFromIQAlert then
     RestorePrinterFromRegistry;

  SetCRWPrinter( Crpe1, CRDotNetObject ); {IQMS.Common.Print.pas}
end;

procedure TFrmRepDef.ApplyVerifyDataBase;
begin
  CheckApplyVerifyDatabase( Crpe1, CRDotNetObject ); { IQMS.WebVcl.RepDefVersions.pas }
end;

procedure TFrmRepDef.ClearCRW;
begin
  ClearCrpeReportName( Crpe1 );

  {restore default printer}
  if IsCalledFromIQAlert then
     Printer.PrinterIndex:= -1;
end;

procedure TFrmRepDef.SetConnect;
begin
  SetReportConnection( Crpe1, CRDotNetObject,
                       self.ServerName,
                       self.UID,
                       self.Password,
                       SecurityManager.EPlant_ID_AsFloat );
end;

procedure TfrmRepDef.SetDestination;
var
  AFileName: string;

  function _GetReportFileName : string;
  var
    AExeName : string;
  begin
    AExeName:= ExtractFileName(Application.ExeName);
    //MyReport_Name.rpt
    Result:= ExtractFileName( GetReportPathName2( Crpe1, CRDotNetObject, EdAttachmentName.Text ));

    //MyReport_Name.pdf
    Result:= ChangeFileExt( Result, GetDefaultFileTypeExt( Crpe1, CRDotNetObject ));

    //For IQAlert & Eserver , ensure unique report name MyReport_Name_####.pdf -- EIQ-3799 MPC Remote debugging AV AB 11-05-14
    if ( EdAttachmentName.Text = '' ) and ( (UpperCase(AExeName) = 'IQALERT.EXE') or (UpperCase(AExeName) = 'ESERVER.EXE' ))  then
      Result:= Format( '%s.%s', [ IQMS.Common.StringUtils.StrBeforeDot( Result ) + Format('_%s', [ IntToStr(Random(10000)) ]), //MyReport_Name_####
                                  IQMS.Common.StringUtils.StrAfterDot ( Result ) ]); //pdf

  end;

begin
  FShowExportFile := False;

  if pgctrDestination.ActivePage = tabScreen then
    SetDestinationToScreen( Crpe1, CRDotNetObject ) { IQMS.WebVcl.RepDefVersions.pas }

  else if pgctrDestination.ActivePage = tabPrinter then
    begin
      if CompareText(IQMS.Common.Print.IQMS_PDF_Printer, Printer.Printers[Printer.PrinterIndex]) = 0 then
        begin
          SetDestinationToPDF(Crpe1, CRDotNetObject, IQGetLocalHomePath +
            _GetReportFileName);
          FShowExportFile := True;
        end
      else
        SetDestinationToPrinter( Crpe1, CRDotNetObject ); { IQMS.WebVcl.RepDefVersions.pas }
    end

  else if pgctrDestination.ActivePage = tabFile then
    begin
      AFileName :=  DefaultToMasterPath(edSaveFile.Text);
      AFileName := ChangeFileExt(AFileName, ExportFileTypeExt[ExportFileType]);
      SetDestinationToFile( Crpe1, CRDotNetObject,
                            cboxFileType,
                            AFileName); { IQMS.WebVcl.RepDefVersions.pas }
      FShowExportFile:= chkOpenFileUponSaving.Checked;
     end

  else if pgctrDestination.ActivePage = tabEMail then
    begin
      // need to call assign TargetFileType first so we can populate exportoptions.filetype or selectedExportFormatType below.
      AssignTargetFileType( Crpe1, CRDotNetObject, cboxEMailFileType );

      SetDestinationToEmail( Crpe1, CRDotNetObject,
                             cboxEMailFileType,
                             IQGetLocalHomePath +
                             _GetReportFileName );
    end
  else if pgctrDestination.ActivePage = tabFax then
    SetDestinationToFax( Crpe1, CRDotNetObject, FFaxMan.ReportTempFileName ); { IQMS.WebVcl.RepDefVersions.pas }
end;

procedure TfrmRepDef.GetDestination( var ADestination, ASpec: string );
begin
  if pgctrDestination.ActivePage = tabScreen then
     begin
       ADestination:= 'Screen';
       ASpec:= '';
     end

  else if pgctrDestination.ActivePage = tabPrinter then
     begin
       ADestination:= 'Printer';
       ASpec:= Printer.Printers[ Printer.PrinterIndex ];
     end

  else if pgctrDestination.ActivePage = tabFile then
     begin
       ADestination:= 'File';
       ASpec:= DefaultToMasterPath( edSaveFile.Text );
     end

  else if pgctrDestination.ActivePage = tabEMail then
     begin
       ADestination:= 'EMail';
       ASpec:= RepDef_EMailEMAIL_TO.asString;
     end

  else if pgctrDestination.ActivePage = tabFax then
     begin
       ADestination:= 'Fax';
       ASpec:= FFaxMan.FRecipients.Text;
     end
end;

function TfrmRepDef.UseEmbeddedHTML( AComboBox: TUniComboBox ): Boolean;
var
  ASelType: TExportOptions;
begin
  ASelType := TExportOptions(0);
  if Assigned(AComboBox) then
    begin
      if AComboBox.ItemIndex = -1 then
        Exit;
      if Assigned(AComboBox.Items.Objects[AComboBox.ItemIndex]) then
      ASelType := TPrintDlgFileTypeCargo(AComboBox.Items.
        Objects[AComboBox.ItemIndex]).FileType;
    end;
  Result := ASelType = dtHTML40;
end;

procedure TFrmRepDef.ExecAfterPrint(Sender: TObject);
var
  ASendEmail: Boolean;
  AStartTime: Real;
  AAttachments: TStringList;
  AParams: TIQSendEmailParams;
  AEmailBody: string;
  APath: string;
begin
(*IQAlert or DCOM print methods to break down execution into distinct parts
  Similar to btnPrintClick, but only contains actions that occur AFTER
  DoExecuteReport( Crpe1, CRDotNetObject ); in ExecuteReport method****)

  FIsAnythingPrinted:= IQMS.WebVcl.RepDefVersions.IsAnythingPrinted( Crpe1, CRDotNetObject );
  AddToRepDefLog( FDCOMStartTime );

  CheckShowDNetForm( CRDotNetObject ); { IQMS.WebVcl.RepDefVersions.pas }

  if pgctrDestination.ActivePage = tabEMail then
     begin
       ASendEmail:= TRUE;
       AEmailBody:= RepDef_EMailEMAIL_BODY.asString;
       if UseEmbeddedHTML( cboxEMailFileType ) then
          AppendFileContentToString( AEmailBody, IQMS.WebVcl.RepDefVersions.GetExportFilePath( Crpe1, CRDotNetObject ));

       if Assigned( FOnBeforeSendEMail ) and FileExists(FDCOMEmailAttachedFile) then
       begin
          InitSendEmailParams(AParams);
          AParams.Recipients   := RepDef_EMailEMAIL_TO.asString;        // ARecipient (String)
          AParams.Subject      := RepDef_EMailEMAIL_SUBJECT.asString;   // ASubject (String)
          AParams.BodyText     := AEmailBody;
          AParams.HTMLContent  := UseEmbeddedHTML( cboxEMailFileType ); // AHTML (Boolean)
          AParams.ShowStatus   := True;                                 // AShowStatus (Boolean)
          AParams.SendNow      := True;
          AParams.Method       := IQMS.Common.EmailUtils.emWindows;
          AParams.SenderName   := RepDef_EMailEMAIL_SENDER.asString;  // Sender email address
          AParams.SenderAddress:= RepDef_EMailEMAIL_SENDER.asString;  // Sender email address
          AParams.BlindCopy    := RepDef_EMailEMAIL_BCC.asString;     // BCC

          FOnBeforeSendEMail( self,
                              AParams,
                              GetExportFilePath( Crpe1, CRDotNetObject),  { IQMS.WebVcl.RepDefVersions.pas }
                              ASendEmail );
       end;

       {Mar-22-2002 lets switch to modal email sending so IQAlert will be happy}
       {Dec-12-2003 - make sending email conditional - used in IQAlert (IQAlert sends email inside thread)}
       if ASendEmail and FileExists(FDCOMEmailAttachedFile) then
       try
          AAttachments := TStringList.Create;
          AAttachments.Add(IQMS.WebVcl.RepDefVersions.GetExportFilePath( Crpe1, CRDotNetObject));

          // 03-22-2011
          InitSendEmailParams(AParams);
          AParams.Recipients   := RepDef_EMailEMAIL_TO.asString;      // ARecipient (String)
          AParams.Subject      := RepDef_EMailEMAIL_SUBJECT.asString; // ASubject (String)
          AParams.BodyText     := AEmailBody;                         // ABodyText (String)
          AParams.HTMLContent  := UseEmbeddedHTML(cboxEMailFileType); // AHTML (Boolean)
          AParams.ShowStatus   := True;                               // AShowStatus (Boolean)
          AParams.SendNow      := True;
          AParams.SenderName   := RepDef_EMailEMAIL_SENDER.asString;  // Sender email address
          AParams.SenderAddress:= RepDef_EMailEMAIL_SENDER.asString;  // Sender email address
          AParams.BlindCopy    := RepDef_EMailEMAIL_BCC.asString;     // BCC

          IQMS.Common.EmailUtils.IQSendMail(AParams, AAttachments);
       finally
          if Assigned(AAttachments) then
             FreeAndNil(AAttachments);
          DeleteFile( FDCOMEmailAttachedFile );
       end;
     end
  else if pgctrDestination.ActivePage = tabFax then
     FFaxMan.SubmitXML;  {IQFaxMan}
end;

procedure TFrmRepDef.ExecBeforePrint(Sender: TObject);
(*IQAlert or DCOM print methods to break down execution into distinct parts
 Similar to btnPrintClick, but only contains actions that occur before ExecuteReport in btnPrintClick*)
var
  APath : string;
begin
  // commented on Oct-09-03 - caused problems when printing web_direct through CGI.
  // if dbgReports.GetActiveField <> RepDefDESCRIP then
  //    EXIT;

  //EIQ-959 Reports - printing to different file formats IQRep: Error exporting report
  if pgCtrDestination.ActivePage = tabFile then
  IQAssert((edSaveFile.Text <> ''), IQMS.WebVcl.ResourceStrings.cTXT0000417); //File Name cannot be blank.  Please revise.

  if RepName <> '' then
  begin
      FDCOMDebugStr:= 'Disp User Message';
      FHMsg:= hPleaseWait( IQMS.WebVcl.ResourceStrings.cTXT0000153 {'Creating report.  Please wait...'} );

      FDCOMDebugStr:= 'CheckBrowseMode';
      Repdef_Criteria.CheckBrowseMode;
      Repdef_EMail.CheckBrowseMode;
      FIsAnythingPrinted:= FALSE;

      FDCOMDebugStr:= 'Check Before Print';
      if RepDefBEFORE_PRINT.AsString <> '' then
        DoBeforePrint( RepDefBEFORE_PRINT.AsString );

      FDCOMDebugStr:= 'Creating Report Object. Unable to locate EnterpriseIQ Crystal Reports components. Please reinstall the EnterpriseIQ client.';
      CheckCreateReportObject( Crpe1, CRDotNetObject, self );

      FDCOMDebugStr:= 'Assign Path and RepName';
      SetReportName( Crpe1, CRDotNetObject, Path + RepName );

      FDCOMDebugStr:= 'Connect';
      SetConnect;                                               { Set connect info FOR EVERY TABLE including subreports }

      FDCOMDebugStr:= 'Check Configure .NET Report';
      CheckConfigureDNetRpt( CRDotNetObject );

      // section added for stored procedure-based reports
      if RepDefStored_Procedure.asString = 'Y' then
        begin
          FDCOMDebugStr:= 'Set Crystal Prompts to FALSE';
          CheckSuppressCrpePrompts( Crpe1 );

          FDCOMDebugStr:= 'Set Stored Procedure Report Parameter Values';
          SeTedureParameterValues;

          FDCOMDebugStr:= 'Set Stored Procedure Report EPLANT_ID';   { IQMS.WebVcl.RepDefVersions.pas }
          SetParam( Crpe1, CRDotNetObject, 'v_eplant_id', Format('%s', [ sIIf( SecurityManager.EPlant_ID = 'NULL', '0', SecurityManager.EPlant_ID )]) );
        end
      else
        begin
          FDCOMDebugStr:= 'Set Criteria Expression';
          SetCriteriaExpression( Crpe1 );  //Only passing crpe.selection.formula, .net codes handles its selection formula
        end;

      FDCOMDebugStr:= 'Set Destination';
      SetDestination;

      FDCOMDebugStr:= 'Set Report Title';
      AssignReportTitle;

      if Assigned( FHMsg ) then
        FHMsg.Hide;
      Application.ProcessMessages;

      FDCOMDebugStr:= 'Get Formulas Values';
      GetFormulasValues;

      if Assigned( FHMsg ) then
        FHMsg.Show;
      Application.ProcessMessages;

      FDCOMDebugStr:= 'Set Printer';
      DoSetCRWPrinter;

      FDCOMDebugStr:= 'Check Copies';
      if RepDefNUM_COPIES.asInteger > 1 then
         AssignPrintOptionNumCopies( Crpe1, CRDotNetObject, RepDefNUM_COPIES.asInteger );

      FDCOMDebugStr:= 'Check Collate';
      if RepDefCOLLATE.asString = 'Y' then
         AssignPrintOptionCollated( Crpe1, CRDotNetObject, TRUE  )    // Collated
      else if RepDefCOLLATE.asString = 'N' then
         AssignPrintOptionCollated( Crpe1, CRDotNetObject, FALSE )    // UnCollated
      else
         AssignPrintOptionCollated( Crpe1, CRDotNetObject, TRUE  );   // DefaultCollation;

      FDCOMDebugStr:= 'Check Print Range';
      if FPrintRange = prPageNums then
         AssignPrintOptionPrintRange( Crpe1, CRDotNetObject, FPageStart, FPageStop );

      FDCOMDebugStr:= 'Apply VerifyDataBase';
      ApplyVerifyDataBase;                                                        { Force VerifyDataBase including subreports }

      FDCOMDebugStr:= 'Check TablesName In UserCriteria';
      if RepDefStored_Procedure.asString <> 'Y' then
         CheckTablesNameInUserCriteria;

      if IsCalledFromIQAlert or IsConsole then // web and iqalert cannot prompt for parameters. dNet handles this in iqrep.dll.
        AssertWebCrpeParamPromptsNotExist( Crpe1, 'Reports that prompt for parameters are not supported by this application.' );

      FDCOMDebugStr:= 'Disable .NET Parameter Prompt';
      DisableDNetParamPrompts( CRDotNetObject, IsCalledFromIQAlert or IsConsole );

      if Assigned( FHMsg ) then
         FHMsg.Mesg:= 'Verifying DB and Executing Report ...';

      (****actions before DoExecuteReport( Crpe1, CRDotNetObject ); in ExecuteReport method****)
      if pgctrDestination.ActivePage = tabEMail then
      begin
        FDCOMEmailAttachedFile:= GetExportFilePath( Crpe1, CRDotNetObject);
        if FileExists(FDCOMEmailAttachedFile) then
          DeleteFile(FDCOMEmailAttachedFile);

        APath:= IncludeTrailingBackslash(ExtractFilePath( FDCOMEmailAttachedFile ));
        DeleteFilesOlderThan( APath + '*' + ExtractFileExt(FDCOMEmailAttachedFile), 3 );  {IQMS.Common.FileUtils.pas}
      end;
      FDCOMStartTime:= Now; //passed to ExecAfterPrint
      (****end of actions before DoExecuteReport( Crpe1, CRDotNetObject ); in ExecuteReport method****)
  end;

end;

procedure TfrmRepDef.ExecuteReport;
var
  ASendEmail: Boolean;
  AStartTime: Real;
  AFile: String;
  AAttachments: TStringList;
  AParams: TIQSendEmailParams;
  AEmailBody: string;
  APath: string;
begin
  if pgctrDestination.ActivePage = tabEMail then
  begin
    AFile:= GetExportFilePath( Crpe1, CRDotNetObject);
    if FileExists(AFile) then
      DeleteFile(AFile);

    APath:= IncludeTrailingBackslash(ExtractFilePath( AFile ));
    DeleteFilesOlderThan( APath + '*' + ExtractFileExt(AFile), 3 );  {IQMS.Common.FileUtils.pas}
  end;

  AStartTime:= Now;
  DoExecuteReport( Crpe1, CRDotNetObject );  { IQMS.WebVcl.RepDefVersions.pas }
  AddToRepDefLog( AStartTime );

  CheckShowDNetForm( CRDotNetObject ); { IQMS.WebVcl.RepDefVersions.pas }

  if pgctrDestination.ActivePage = tabEMail then
     begin
       ASendEmail:= TRUE;
       AEmailBody:= RepDef_EMailEMAIL_BODY.asString;
       if UseEmbeddedHTML( cboxEMailFileType ) then
          AppendFileContentToString( AEmailBody, IQMS.WebVcl.RepDefVersions.GetExportFilePath( Crpe1, CRDotNetObject ));

       if Assigned( FOnBeforeSendEMail ) and FileExists(AFile) then
       begin
          InitSendEmailParams(AParams);
          AParams.Recipients   := RepDef_EMailEMAIL_TO.asString;        // ARecipient (String)
          AParams.Subject      := RepDef_EMailEMAIL_SUBJECT.asString;   // ASubject (String)
          AParams.BodyText     := AEmailBody;
          AParams.HTMLContent  := UseEmbeddedHTML( cboxEMailFileType ); // AHTML (Boolean)
          AParams.ShowStatus   := True;                                 // AShowStatus (Boolean)
          AParams.SendNow      := True;
          AParams.Method       := IQMS.Common.EmailUtils.emWindows;
          AParams.SenderName   := RepDef_EMailEMAIL_SENDER.asString;  // Sender email address
          AParams.SenderAddress:= RepDef_EMailEMAIL_SENDER.asString;  // Sender email address
          AParams.BlindCopy    := RepDef_EMailEMAIL_BCC.asString;     // BCC

          FOnBeforeSendEMail( self,
                              AParams,
                              GetExportFilePath( Crpe1, CRDotNetObject),  { IQMS.WebVcl.RepDefVersions.pas }
                              ASendEmail );
       end;

       {Mar-22-2002 lets switch to modal email sending so IQAlert will be happy}
       {Dec-12-2003 - make sending email conditional - used in IQAlert (IQAlert sends email inside thread)}
       if ASendEmail and FileExists(AFile) then
       try
          AAttachments := TStringList.Create;
          AAttachments.Add(IQMS.WebVcl.RepDefVersions.GetExportFilePath( Crpe1, CRDotNetObject));

          // 03-22-2011
          InitSendEmailParams(AParams);
          AParams.Recipients   := RepDef_EMailEMAIL_TO.asString;      // ARecipient (String)
          AParams.Subject      := RepDef_EMailEMAIL_SUBJECT.asString; // ASubject (String)
          AParams.BodyText     := AEmailBody;                         // ABodyText (String)
          AParams.HTMLContent  := UseEmbeddedHTML(cboxEMailFileType); // AHTML (Boolean)
          AParams.ShowStatus   := True;                               // AShowStatus (Boolean)
          AParams.SendNow      := True;
          AParams.SenderName   := RepDef_EMailEMAIL_SENDER.asString;  // Sender email address
          AParams.SenderAddress:= RepDef_EMailEMAIL_SENDER.asString;  // Sender email address
          AParams.BlindCopy    := RepDef_EMailEMAIL_BCC.asString;     // BCC

          IQMS.Common.EmailUtils.IQSendMail(AParams, AAttachments);
       finally
          if Assigned(AAttachments) then
             FreeAndNil(AAttachments);
          DeleteFile( AFile );
       end;
     end
  else if pgctrDestination.ActivePage = tabFax then
     FFaxMan.SubmitXML;  {IQFaxMan}
end;

procedure TfrmRepDef.AppendFileContentToString( var AText: string; AFileName: string );
begin
  AText:= ReadFileIntoStr( AFileName );
end;


procedure TFrmRepDef.DCOMPrintFinalization(Sender: TObject);
begin
//IQAlert or DCOM print methods to break down execution into distinct parts
  CheckFreeCRDotNetObject( CRDotNetObject );
  //CheckRestoreFPU( FDCOMCW ); done in Mon_Thrd.pas instead
  FHMsg.Free;
  ClearCRW;
  CheckFreeNonToWindowOutputCrpe( Crpe1 );
end;

class function TfrmRepDef.DefaultToMasterPath( AFileName: string ): string;
begin
  if ExtractFileName( AFileName ) = AFileName then
     Result:= GetPath + AFileName
  else
     Result:= AFileName;
end;

function TfrmRepDef.GetIQRepDefParams: TFDParams;
begin
  Result:= TIQWebRepDef(self.Owner).Params;
end;

procedure TfrmRepDef.DoBeforePrint( ProcName: string );
var
  hMsg  : TPanelMesg;
  AsProc: TFDStoredProc;

      // Jun-9-06 - Jason
      // This was added bc the TFDStoredProc methods Prepare and CopyParams dont
      // derive the params for you in D7 at runtime. You have to create the params
      // if creating TFDStoredProc at runtime. If the list continues to grow we could
      // look into adding a procedure/function to derive the parameters via usage
      // of the oracle procedure "dbms_describe.decribe_procedure"
      procedure CheckAddParams( AProc: TFDStoredProc );
      begin
        with AProc do
        begin
          if (Pos('FIX_AR_ROUNDING',               StoredProcName) > 0) or
             (Pos('POPULATE_C_APPREPOST_REPORT',   StoredProcName) > 0) or
             (Pos('POPULATE_C_ARPREPOST_REPORT',   StoredProcName) > 0) or
             (Pos('POPULATE_C_FA_FORECAST_REPORT', StoredProcName) > 0) or
             (Pos('POP_C_GLACCT_TRIAL_BAL_AS_OF', StoredProcName) > 0) or
             (Pos('POPULATE_C_ARINVT_AS_OF',       StoredProcName) > 0) or
             (Pos('POPULATE_C_ARINVT_AS_OF_TR_DT', StoredProcName) > 0) then
            Params.CreateParam( ftString, 'V_USERID', ptInput)

          else if  Pos('POPULATE_OVERLAY_LABELS', StoredProcName) > 0 then
            Params.CreateParam( ftFloat, 'V_PS_TICKET_ID', ptInput)

          else if  Pos('REPOPULATE_FRL_TABLES', StoredProcName) > 0 then
            Params.CreateParam( ftString, 'V_INCL_EPLANT', ptInput)

          else if  Pos('UPDATE_PO_DETAIL_RELEASES', StoredProcName) > 0 then
          begin
            Params.CreateParam( ftFloat, 'V_PO_DETAIL_ID', ptInput);
            Params.CreateParam( ftFloat, 'V_CUMM_RECEIVED', ptInput);
          end

          else if (Pos('UPDATE_RELEASES_RECEIVED_CRW', StoredProcName) > 0) or
                  (Pos('UPDATE_RELEASES_SHIPPED_CRW', StoredProcName) > 0)  then
            Params.CreateParam( ftFloat, 'V_ID', ptInput);

          if (Pos('POPULATE_C_ARINVT_AS_OF', StoredProcName ) > 0) or
             (Pos('POPULATE_C_ARINVT_AS_OF_TR_DT', StoredProcName ) > 0) or
             (Pos('POP_C_GLACCT_TRIAL_BAL_AS_OF', StoredProcName) > 0) then
            Params.CreateParam( ftDateTime, 'V_DATE', ptInput); // already added V_USERID above


          if (Pos('POPULATE_C_RANGE_HOURS', StoredProcName) > 0) then
          begin
            Params.CreateParam( ftDateTime, 'V_DATE_START', ptInput);
            Params.CreateParam( ftDateTime, 'V_DATE_END',   ptInput);
            Params.CreateParam( ftString,   'V_USERID',     ptInput);
          end;
        end;
      end; // CheckAddParams

      procedure AssignParamValues(AProc: TFDStoredProc);
      var
        ADate: TDateTime;
        I    : Integer;
        P    : TFDParam;
      begin
        with AProc do     // Transfer Parameters from IQRepDef to the stored proc
        for I:= 0 to ParamCount - 1 do
        begin
          try
            // param passed via repdef component?
            P:= IQRepDefParams.ParamByName( Params[ I ].Name );
          except
            try
              ADate:= Now;
              // need to prompt for a date?

              // POP_C_GLACCT_TRIAL_BAL_AS_OF
              if (Pos( ProcName,         'POP_C_GLACCT_TRIAL_BAL_AS_OF' ) > 0) and
                 (Pos( Params[ I ].Name, 'V_DATE'                  ) > 0) and
                 (GetDateDialog( ADate )                                ) then // Prompt date - DateDlg.pas
                Params[ I ].Value:= ADate;

              // POPULATE_C_ARINVT_AS_OF
              if (CompareText( ProcName, 'POPULATE_C_ARINVT_AS_OF' ) = 0) and
                 (Pos( Params[ I ].Name, 'V_DATE'                  ) > 0) and
                 (GetDateDialog( ADate )                                ) then // Prompt date - DateDlg.pas
                Params[ I ].Value:= ADate;

              // POPULATE_C_ARINVT_AS_OF_TR_DT
              if (CompareText( ProcName, 'POPULATE_C_ARINVT_AS_OF_TR_DT' ) = 0) and
                 (Pos( Params[ I ].Name, 'V_DATE'                  ) > 0) and
                 (GetDateDialog( ADate )                                ) then // Prompt date - DateDlg.pas
                Params[ I ].Value:= ADate;

              // POPULATE_C_RANGE_HOURS
              if (Pos( ProcName, 'POPULATE_C_RANGE_HOURS' ) > 0) and
                 (Pos( Params[ I ].Name, 'V_DATE_START'   ) > 0) and
                 (GetDateDialog( ADate, IQMS.WebVcl.ResourceStrings.cTXT0000325 {'Start Date'} )) then // Prompt date - DateDlg.pas
                Params[ I ].Value:= Trunc(ADate);

              if (Pos( ProcName, 'POPULATE_C_RANGE_HOURS' ) > 0) and
                 (Pos( Params[ I ].Name, 'V_DATE_END'     ) > 0) and
                 (GetDateDialog( ADate, IQMS.WebVcl.ResourceStrings.cTXT0000326 {'End Date'} )) then // Prompt date - DateDlg.pas
                Params[ I ].Value:= Trunc(ADate);

              if (Pos( ProcName, 'POPULATE_C_RANGE_HOURS' ) > 0) and
                 (Pos( Params[ I ].Name, 'V_USERID'       ) > 0) then
                Params[ I ].Value:= SecurityManager.UserName;

            except on E:Exception do
              begin
                // 'Unable to prompt for date value. '#13+'%s'
                HandleExceptionLocally(Format(IQMS.WebVcl.ResourceStrings.cTXT0000324, [ E.Message ]));
                //raise Exception.CreateFmt(IQMS.WebVcl.ResourceStrings.cTXT0000324, [ E.Message ]);
              end;
            end;

            // try next param b/c this param could have default value specified in its signature
            Continue;
          end;

          if Assigned( P ) and ( P.ParamType in [ptInput, ptInputOutput] ) then
            Params[ I ].Value:= P.Value;
        end;

      end; // AssignParamValues

begin
  if UpperCase(ProcName) = 'POPULATE_TABLES' then
    Populate_Tables

  else begin
    AsProc:= TFDStoredProc.Create(application);
    with AsProc do
      try
        ConnectionName  := cnstFDConnectionName;
        StoredProcName := 'IQMS.CRW_BEFORE_EXEC.' + UpperCase(ProcName);
        Prepare;
        // 06/15/2016 (Byron) Remmed this because it is no longer necessary
        // CheckAddParams( AsProc ); // local proc

        AssignParamValues( AsProc ); // local proc

        // 06/15/2016 (Byron, EIQ-10530 SER# 08273) Added new event to support
        // updating the stored procedure params before it is executed.
        // Note:  To add a new procedure for OnBeforePrint, you will need to
        // add it to package, CRW_BEFORE_EXEC, so that it is listed.  Once
        // that is done, you will need to assign the parameter on the calling
        // form.  See RD_Main_Base.pas for an example.
        if Assigned(FOnBeforeExecuteStoredProc) then
          FOnBeforeExecuteStoredProc(Self, AsProc);

        hMsg:= hPleaseWait(Format(  IQMS.WebVcl.ResourceStrings.cTXT0000154 {'Executing %s ...'}, [ ProcName ]));
        try
          ExecProc;
        finally
          hMsg.Free;
        end;

      finally
        Free;
      end;

  end;
end;

procedure TFrmRepDef.PkEmailIQAfterHPickCreate(Sender: TObject);
var
  ABitmap: TBitmap;
begin
  if not(Sender is TFrmIQSearchPickList) then  // IQMS.WebVcl.SearchPickList.pas
     EXIT;

  with Sender as TFrmIQSearchPickList do
  begin
    // glyph
    ABitmap:= TBitmap.Create;
    try
      ImageList1.GetBitmap(0, ABitmap);
//      IQSearch1.btnCaseSensitive.:= ABitmap;
    finally
      ABitmap.Free;
    end;

    // event and other properties
    IQSearch1.btnCaseSensitive.OnClick    := SetFilterPicklistInactiveRecords;
    IQSearch1.btnCaseSensitive.Caption       := IQMS.WebVcl.ResourceStrings.cTXT0000045; // 'Showing active only.'#13'Click to toggle.'
//    IQSearch1.UserBtn1.AllowAllUp:= TRUE;
//    IQSearch1.UserBtn1.GroupIndex:= 1;
  end;
end;


procedure TfrmRepDef.Populate_Tables;
var
  I, J:Integer;
  ADataSet:TdataSet;
begin
  for I:= 0 to IQRepDefParams.Count - 1 do
  begin
    if I mod 2 = 0 then
    with TFDTable.Create(Application) do
    try
      ConnectionName  := cnstFDConnectionName;
      TableName := IQRepDefParams.Items[ I ].AsString;
      Open;
      if FindField('USERID') <> nil then
        ExecuteCommandFmt('delete from %s where userid = ''%s''', [TableName, SecurityManager.UserName]);
      Close;
      Open;
      ADataSet:= TDataSet(Pointer(IQRepDefParams.Items[ I  + 1].AsInteger));
      ADataSet.Open;
      ADataSet.First;
      while not ADataSet.Eof do
      begin
        Insert;
        for j := 0 to ADataSet.FieldCount - 1 do
          FieldByname(ADataSet.Fields[j].FieldName).Value:= ADataSet.Fields[j].Value;
        if FindField('USERID') <> nil then
          FieldByName('USERID').asString := SecurityManager.UserName;
        if FindField('ID') <> nil then
          if FieldByName('ID').asFloat = 0 then
            FieldByName('ID').asFloat := GetNextID(TableName);
        Post;
        ADataSet.Next;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmRepDef.btnCurrentClick(Sender: TObject);
begin
  //EIQ-959 Reports - printing to different file formats IQRep: Error exporting report
  if pgCtrDestination.ActivePage = tabFile then
  IQAssert((edSaveFile.Text <> ''), IQMS.WebVcl.ResourceStrings.cTXT0000417); //File Name cannot be blank.  Please revise.
  PrintCurrentRecord( CurrentLinkExpression );
end;

procedure TfrmRepDef.PrintCurrentRecord(ACurrentLinkExpression: string = '');
var
  CW: Word;
begin
  if RepName <> '' then //with Crpe1 do
  begin
    CheckDisableFPUExceptions( CW );
    try
      FIsAnythingPrinted:= FALSE;

      CheckCreateReportObject( Crpe1, CRDotNetObject, self );

      SetReportName( Crpe1, CRDotNetObject, Path + RepName ); { IQMS.WebVcl.RepDefVersions.pas }

      SetConnect;

      CheckConfigureDNetRpt( CRDotNetObject );

      SetSelectionFormula( Crpe1, CRDotNetObject, ACurrentLinkExpression );  { IQMS.WebVcl.RepDefVersions.pas }

      SetDestination;

      GetFormulasValues;

      DoSetCRWPrinter;

      if RepDefNUM_COPIES.asInteger > 1 then
         AssignPrintOptionNumCopies( Crpe1, CRDotNetObject, RepDefNUM_COPIES.asInteger );

      if FPrintRange = prPageNums then
         AssignPrintOptionPrintRange( Crpe1, CRDotNetObject, FPageStart, FPageStop );

      if RepDefCOLLATE.asString = 'Y' then
         AssignPrintOptionCollated( Crpe1, CRDotNetObject, TRUE  )    // Collated
      else if RepDefCOLLATE.asString = 'N' then
         AssignPrintOptionCollated( Crpe1, CRDotNetObject, FALSE )    // UnCollated
      else
         AssignPrintOptionCollated( Crpe1, CRDotNetObject, TRUE  );   // DefaultCollation;

      ApplyVerifyDataBase;

      if IsCalledFromIQAlert or IsConsole then // web and iqalert cannot prompt for parameters. dNet handles this in iqrep.dll.
        AssertWebCrpeParamPromptsNotExist( Crpe1, 'Reports that prompt for parameters are not supported by this application.' );

      DisableDNetParamPrompts( CRDotNetObject, IsCalledFromIQAlert or IsConsole );

      ExecuteReport;

      FIsAnythingPrinted:= IQMS.WebVcl.RepDefVersions.IsAnythingPrinted( Crpe1, CRDotNetObject );
    finally
      CheckFreeCRDotNetObject( CRDotNetObject );
      CheckRestoreFPU( CW );
      ClearCRW;
      CheckFreeNonToWindowOutputCrpe( Crpe1 );
    end;
  end;
end;

procedure TfrmRepDef.Info1Click(Sender: TObject);
begin
  {'Parent App ID   : %s'+#10#13+
   'Report File Name: %s'}
//  if FIsTouchscreen then
//     touchscrn.TouchScreen_Msg_Information(Format(IQMS.WebVcl.ResourceStrings.cTXT0000155, [ App_ID, Path + RepName ] ))
//  else
     IQInformation( Format(IQMS.WebVcl.ResourceStrings.cTXT0000155, [ App_ID, Path + RepName ] ));
end;

procedure TfrmRepDef.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRepDef.LoadDBFFile(AFileName: string);
begin
  if (AFileName = '') or not FileExists(AFileName) {or not Showing} then
    Exit;
  FDBFTableName := ExtractFileName(AFileName);
  IQMS.DBTrans.dbtado.ADO_ConfigureConnectionForDBF(ADOConnection1, ExtractFilePath(AFileName));
  if dbfREPDEF.Active then
    dbfREPDEF.Close;
//  dbfREPDEF.SQL.Clear;
//  dbfREPDEF.SQL.Add(Format('SELECT * FROM %s', [FDBFTableName]));
  dbfREPDEF.TableName := FDBFTableName;
  ADOConnection1.Connected := True;
  dbfREPDEF.Open;
end;

procedure TfrmRepDef.LoadSQLiteFile(AFileName, ATableName: string);
begin
  AFileName := Trim(AFileName);
  Assert(AFileName = EmptyStr, 'File name cannot be empty.');
  Assert(not FileExists(AFileName), 'File not found: ' + AFileName);

  FDBFTableName := ATableName;
  SQLiteConnection.Connected := False;
  IQMS.DBTrans.dbtado.ConfigureConnectionForSQLite(SQLiteConnection, AFileName);

  if SQLiteRepDef.Active then
    SQLiteRepDef.Close;

  SQLiteRepDef.TableName := FDBFTableName;

  if not SQLiteConnection.Connected then
    SQLiteConnection.Connected := True;

  SQLiteRepDef.Open;
end;

procedure TfrmRepDef.CheckUpgrade;
var
  RepDef_Exists :Boolean;
  RepDefCr_Exists:Boolean;
  RepDefFr_Exists:Boolean;
  RepDefCat_Exists:Boolean;
  AResult: Boolean;
begin
  RepDef_Exists   := FileExists( Path + 'RepDef.SQLite3'  );
  RepDefCr_Exists := FileExists( Path + 'RepDefCr.SQLite3');
  RepDefFr_Exists := FileExists( Path + 'RepDefFr.SQLite3');
  RepDefCat_Exists:= FileExists( Path + 'RepDef_Cat.SQLite3');

  AResult := False;

  if (RepDef_Exists or RepDefCr_Exists or RepDefFr_Exists or RepDefCat_Exists) then
     begin
       // 'You must upgrade your list of Registered Reports. Would you like to do it now?'
//       if FIsTouchscreen then
//          AResult := touchscrn.TouchScreen_Msg_ConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000156)
//       else
          AResult := IQConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000156)
     end;

  if AResult then
  begin
    if RepDef_Exists then
    begin
      UpgradeRepDef_Repository( Path + 'RepDef.SQLite3' );
      UpgradeRepDef( Path + 'RepDef.SQLite3', RepDef, 'APP_ID;REPNAME', ';HIDDEN;EDIT_DATE;' );
    end;
    if RepDefCr_Exists then
      UpgradeRepDef( Path + 'RepDefCr.SQLite3', RepDef_Criteria, 'APP_ID;REPNAME;SEQ', '' );
    if RepDefFr_Exists then
      UpgradeRepDef( Path + 'RepDefFr.SQLite3', RepDef_Formulas, 'APP_ID;REPNAME;SEQ', '' );
    if RepDefCat_Exists then
      UpgradeRepDef( Path + 'RepDef_Cat.SQLite3', RepDef_Cat,    'APP_ID', '' );
  end;
end;

procedure TfrmRepDef.UpgradeRepDef( const FileName: string; DestTable: TFDTable; const AIndexFieldNames, AExcludeColumns: string );
var
  OK          : Boolean;
  AOldIndex   : string;
  AOldFiltered: Boolean;
  hMsg        : TPanelMesg;

  procedure AssignMappings;
  var
    S          : string;
    AColumnName: string;
    AMatchFound: Boolean;
  begin
//    BatchMove1.Mappings.Clear;
    if AExcludeColumns = '' then
       EXIT;

    S:= DestTable.TableName;
    if Pos('IQMS.', S) > 0 then S:= Copy( S, 6, 255 );

    with TFDQuery.Create(nil) do
    try
      ConnectionName := cnstFDConnectionName;
      SQL.Add(Format('select column_name from all_tab_columns where owner = ''IQMS'' and table_name = ''%s'' order by column_id', [ S ]));
      Open;
      while not Eof do
      begin
        AColumnName:= FieldByName('column_name').asString;

        if Pos( ';' + AColumnName + ';', AExcludeColumns ) = 0 then
        begin
           AMatchFound:= SQLiteRepDef.FindField( AColumnName ) <> nil;
           if not AMatchFound then
           begin
             AColumnName:= Copy(AColumnName, 1, 10);
             AMatchFound:= SQLiteRepDef.FindField( AColumnName ) <> nil;
           end;

           if AMatchFound then
//             BatchMove1.Mappings.Add( Format('%s=%s', [ FieldByName('column_name').asString, AColumnName ]))
           else
              // 'Unable to locate field %s or %s in the DBF file. The field is going to be skipped.'
              IQWarning(Format( IQMS.WebVcl.ResourceStrings.cTXT0000157, [ FieldByName('column_name').asString, AColumnName ]))
        end;

        Next;
      end;
    finally
      Free;
    end;
  end;

begin
  with SQLiteRepDef do
  try
    HMsg:= hPleaseWait( Format( IQMS.WebVcl.ResourceStrings.cTXT0000158 {'Importing %s.  Please wait...'}, [ DestTable.TableName ]));
    try
      OK:= FALSE;
      Screen.Cursor:= crHourGlass;

      DestTable.ConnectionName := cnstFDConnectionName;

      {Prepare Target}
      AOldIndex:= DestTable.IndexFieldNames;
      DestTable.IndexFieldNames:= AIndexFieldNames;

      AOldFiltered      := DestTable.Filtered;
      DestTable.Filtered:= FALSE;
//      BatchMove1.Destination:= DestTable;

      {BatchMove settings}
      LoadSQLiteFile(FileName, DestTable.TableName);

      {Assign BatchMove mappings after we opened source dbf so we can verify that the columns exists in src and trg}
      AssignMappings;

      {Actual Copy! This IS cool. Yeh... if index is right...}
//      BatchMove1.Execute;

      OK:= TRUE;
    except on E:Exception do
      begin
        // '%s.'#13#13' Upgrade failed on %s. You will be able to proceed now ' +
        // 'and upgrade Registered Reports next time you click on Reports.'
        IQWarning( Format( IQMS.WebVcl.ResourceStrings.cTXT0000159, [E.Message, FileName ]));
        System.SysUtils.ABORT;
      end;
    end;
  finally
    Screen.Cursor:= crDefault;
    DestTable.IndexFieldNames:= AOldIndex;
    DestTable.Filtered:= AOldFiltered;
    SQLiteRepDef.Close;
    SQLiteConnection.Close;
    HMsg.Free;
    if OK and not DeleteFile( FileName ) then
       // 'Unable to Delete (Imported - OK) File %s.
       // Please check your access rights and/or file''s ReadOnly property'
       ShowMessage(Format(IQMS.WebVcl.ResourceStrings.cTXT0000160, [FileName]))
  end;
end;

procedure TfrmRepDef.UpgradeRepDef_Repository( const FileName: string );
var
  hMsg : TPanelMesg;
  AList: TStringList;
  I: Integer;
begin
  with SQLiteRepDef do
  try
    AList:= TStringList.Create;
    HMsg:= hPleaseWait( Format( IQMS.WebVcl.ResourceStrings.cTXT0000158 {'Importing %s.  Please wait...'}, [ 'Repdef_Repository' ]));
    try
      Screen.Cursor:= crHourGlass;

      AList.Sorted:= True;
      AList.Duplicates:= dupIgnore;

      {Open SQLiteRepDef Excluseivly}
      LoadSQLiteFile(FileName, 'RepDef');
      while not Eof do
      begin
        AList.Add( FieldByName('repname').asString);
        Next;
      end;

      ExecuteCommand('delete from repdef_repository where owner = ''IQMS''');

      for i:= 0 to AList.Count - 1 do
      begin
        if SelectValueFmtAsFloat('select count(*) from repdef_repository where repname = ''%s''',
                     [ FixStr(AList[I])]
                     ) = 0 then
           ExecuteCommandParam( 'insert into repdef_repository '+
                        '     ( repname, owner  )      '+
                        'values                        '+
                        '     (:repname, ''IQMS'' )    ',
                        [ 'REPNAME' ],
                        [ AList[I]  ]
                        )
        else
           ExecuteCommandParam( 'update repdef_repository  '+
                        '   set owner = ''IQMS''   '+
                        ' where repname = :repname ',
                        [ 'REPNAME' ],
                        [ AList[I]  ]
                        )
      end;


    except on E:Exception do
      begin
        // '%s.'#13#13' Upgrade failed on %s. You will be able to proceed now ' +
        // 'and upgrade Registered Reports next time you click on Reports.'
        IQWarning( Format( IQMS.WebVcl.ResourceStrings.cTXT0000159, [E.Message, FileName ]));
        System.SysUtils.ABORT;
      end;
    end;
  finally
    Screen.Cursor:= crDefault;
    SQLiteRepDef.Close;
    AList.Free;
    HMsg.Free;
  end;
end;


procedure TfrmRepDef.SrcRepDef_CriteriaDataChange(Sender: TObject; Field: TField);
var
  GridColor: TColor;
begin
  with RepDef_Criteria do
    if State = dsBrowse then
    begin
      if Eof and Bof then
        GridColor:= clBtnFace
      else
        GridColor:= clWindow;

      {Colors}
      if dbgParams.Color <> GridColor then
         dbgParams.Color:= GridColor;
    end;

  if Field = RepDef_CriteriaLIKE_OPERATOR then
     RepDef_CriteriaRANGE_END.ReadOnly:= RepDef_CriteriaLIKE_OPERATOR.asString = 'Y';
end;

procedure TfrmRepDef.RepDef_CriteriaBeforeInsert(DataSet: TDataSet);
begin
  System.SysUtils.ABORT;
end;

procedure TFrmRepDef.RepDef_CriteriaBeforePost(DataSet: TDataSet);
var
  RO: Boolean;
begin
  // 12/16/2014 Set field upper case.  Moved from RepDef_CriteriaBINARY_OPERATORValidate().
  RepDef_CriteriaBINARY_OPERATOR.AsString:= UpperCase(Trim(RepDef_CriteriaBINARY_OPERATOR.AsString));
  if (RepDef_CriteriaLIKE_OPERATOR.asString = 'Y') and (RepDef_CriteriaRANGE_END.asString > '') then
  try
    RO:= DataSet.FieldByName('RANGE_END').ReadOnly;
    DataSet.FieldByName('RANGE_END').ReadOnly:= FALSE;
    DataSet.FieldByName('RANGE_END').Clear;
  finally
    DataSet.FieldByName('RANGE_END').ReadOnly:= RO;
  end;
end;

procedure TfrmRepDef.btnSaveFileClick(Sender: TObject);
var
  ASelFileType, o: TExportOptions;
  AFilterIndex, i: Integer;
begin
  // Get the selected file type
  with SaveDialog1 do
  begin
    // Set the initial directory to the local home
    if InitialDir = '' then
       InitialDir:= IQGetLocalHomePath;
    // Get the selected file type (on this form)
    ASelFileType := ExportFileType;
    // Populate the dialog filter
    SaveDialog1.Filter := '';
    AFilterIndex := 0;
    for o in RepDefDlgFileTypes do
      begin
        Inc(AFilterIndex);
        SaveDialog1.Filter := SaveDialog1.Filter +
          ExportFileTypeCommonDialogFilter[o];
        if o = ASelFileType then
          FilterIndex := AFilterIndex;
      end;
    // Set the default extension for the selected file type
    DefaultExt := ExportFileTypeExt[ASelFileType];
    // Show the dialog; prompt for file name.
    if Execute then
      begin
        // Put the dataset in Edit mode
        if not (RepDef.State in [dsEdit, dsInsert]) then
          RepDef.Edit;
        // Change the file extension for the selected file type.
        if FilterIndex > 0 then
          begin
            // Initialize
            i := -1;
            // Loop the array
            for o in RepDefDlgFileTypes do
              begin
                // Increment the index
                Inc(i);
                // Compare indexes
                if i = FilterIndex - 1 then
                  begin
                    // Set the variable for the file type
                    ASelFileType := o;
                    // Done looping
                    Break;
                  end;
              end;
            // Change the file extension
            edSaveFile.Text:= ChangeFileExt(FileName,
              ExportFileTypeExt[ASelFileType]);
            // Set the type in the combo box
            SetSelectedExportOption(cboxFileType, ASelFileType);
          end
        /// If all else fails, just set the file name
        else edSaveFile.Text := FileName;
      end;
    InitialDir:= GetCurrentDir;
  end;
end;

procedure TfrmRepDef.DestinationClick(Sender: TObject);
begin
  EnableBtns;
end;

procedure TfrmRepDef.edSaveFileChange(Sender: TObject);
begin
  EnableBtns;
end;

procedure TfrmRepDef.RepDef_CriteriaUNARY_OPERATORValidate(Sender: TField);
var
  S:string;
begin
  S:= Sender.asString;
  if not ( (S = '=') or (S = 'NOT')) then
    //raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000161 {'Please enter valid unary operator: ''='', ''NOT'' '} );
    //'Please enter valid unary operator: ''='', ''NOT'' '
    HandleExceptionLocally(IQMS.WebVcl.ResourceStrings.cTXT0000161);
end;

procedure TfrmRepDef.RepDef_CriteriaBINARY_OPERATORValidate(Sender: TField);
var
  S:string;
begin
  S:= UpperCase(Trim(Sender.asString));
  if not ( (S = 'OR') or (S = 'AND')) then
     //raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000162 {'Please enter valid binary operator: ''OR'', ''AND'' '} );
     //'Please enter valid binary operator: ''OR'', ''AND'' '
     HandleExceptionLocally(IQMS.WebVcl.ResourceStrings.cTXT0000162);
end;

procedure TfrmRepDef.HandleExceptionLocally(AMsg: String);
begin
//  if FIsTouchscreen then
//     touchscrn.TouchScreen_Msg_Error(AMsg)
//  else
     raise Exception.Create(AMsg);
end;

procedure TfrmRepDef.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Key = VK_RETURN) and (ActiveControl = dbgParams) then      { it is a TUniDBGrid }
//    with TUniDBGrid(ActiveControl) do
//      if Selectedindex = (Columns.Count - 1) then             { increment the field }
//      begin
//         DataSource.DataSet.Next;
//         if DataSource.DataSet.Eof then
//            SelectNext(Screen.ActiveControl, TRUE, TRUE)
//         else
//            Selectedindex:= 2;
//      end
//      else
//         SelectedIndex:= SelectedIndex + 1
end;

procedure TfrmRepDef.GetFormulasValues;
begin
    AssignRepDefFormulas;                 {assign from rep_def}
    CheckUserNameFormula;                 {passs user name if required}
    CheckExcludeProjType;                 {check if exclude project type}
    CheckUserEPlantID( Crpe1, CRDotNetObject );  {passs PlantID if required}
end;


{  // this method is not currently being used.
procedure TFrmRepDef.SaveReportFormulasTo( var AFormulas: TCrpeFormulas );
var
  I: Integer;
  J: Integer;
begin
  AFormulas.Clear;
  for I:= 0 to (Crpe1.Formulas.Count - 1) do
  begin
    AFormulas.Names.Add( Crpe1.Formulas[ I ].Name );
    AFormulas[ I ].Formula.Text:= Crpe1.Formulas[ I ].Formula.Text;
  end;
end;
}

procedure TFrmRepDef.AssignRepDefFormulas;
begin
  with RepDef_Formulas do
  try
    Filter  := 'FUNC_NAME <> ''REP_DEF_USER_NAME'' and FUNC_NAME <> ''REP_DEF_PROJECT_SECURITY'' or FUNC_NAME = NULL';
    Filtered:= TRUE;
    First;

    if not (Eof and Bof) then
       with TFrmRepDefFormulasDataEntry.Create( RepDef_Formulas) do  {RepDefFr.pas}
       try
         if ShowModal = mrOK then
            AssignFormulasValues
         else
            System.SysUtils.ABORT;
       finally
         Free;
       end;
  finally
    Filtered:= FALSE;
    First;
  end;
end;

function TFrmRepDef.GetEnsureFormulaIndexExists( AFormulaName: string ): Integer;
begin
  Result:= CheckEnsureFormulaIndexExists( Crpe1, CRDotNetObject, AFormulaName ); { IQMS.WebVcl.RepDefVersions.pas }
end;

procedure TFrmRepDef.AssignFormulasValues;
var
  I:Integer;
begin
  ClearCrpeFormulas( Crpe1 ); { IQMS.WebVcl.RepDefVersions.pas }
  with RepDef_Formulas do
  try
    Filter  := 'FUNC_NAME <> ''REP_DEF_USER_NAME'' and FUNC_NAME <> ''REP_DEF_PROJECT_SECURITY'' or FUNC_NAME = NULL';
    Filtered:= TRUE;
    First;
    while not Eof do
    begin
      I:= GetEnsureFormulaIndexExists( RepDef_FormulasFORM_NAME.asString );

      if RepDef_FormulasFORM_TYPE.asString = 'CHAR' then
        SetFormulaText( Crpe1, CRDotNetObject,               {Report objects}                   { IQMS.WebVcl.RepDefVersions.pas }
                        I,                                   {index of report formula for Crpe1}
                       //RepDef_FormulasFORM_NAME.asString,   {name of report formula for .Net }
                        Format('''%s''', [ RepDef_FormulasFORM_VALUE.asString ] ) )

      else if RepDef_FormulasFORM_TYPE.asString = 'NUMBER' then
        SetFormulaText( Crpe1, CRDotNetObject,               {Report objects}                   { IQMS.WebVcl.RepDefVersions.pas }
                        I,                                   {index of report formula for Crpe1}
                        //RepDef_FormulasFORM_NAME.asString,   {name of report formula for .Net }
                        RepDef_FormulasFORM_VALUE.asString )

      else if RepDef_FormulasFORM_TYPE.asString = 'DATE'  then
        SetFormulaText( Crpe1, CRDotNetObject,               {Report objects}                   { IQMS.WebVcl.RepDefVersions.pas }
                        I,                                   {index of report formula for Crpe1}
                        //RepDef_FormulasFORM_NAME.asString,   {name of report formula for .Net }
                        IQGetCRWDate( StrToDate( RepDef_FormulasFORM_VALUE.asString )));

      Next;
    end;
  finally
    Filtered:= FALSE;
    First;
  end;
end;


procedure TFrmRepDef.CheckUserNameFormula;
var
  I: Integer;
begin
  with RepDef_Formulas do
  try
    Filter  := 'FUNC_NAME = ''REP_DEF_USER_NAME''';
    Filtered:= TRUE;
    Refresh;

    if (FieldByName('form_name').asString > '') and (SecurityManager <> nil) then
    begin
       I:= GetEnsureFormulaIndexExists( FieldByName('form_name').asString );
       SetFormulaText( Crpe1, CRDotNetObject,               {Report objects}                   { IQMS.WebVcl.RepDefVersions.pas }
                       I,                                   {index of report formula for Crpe1}
                       //RepDef_FormulasFORM_NAME.asString,   {name of report formula for .Net }
                       Format('''%s''', [ SecurityManager.UserName ]) );
    end;
  finally
    Filtered:= FALSE;
    First;
  end;
end;

procedure TFrmRepDef.CheckExcludeProjType;
var
  AProjExists: Real;
  I: Integer;
  AExcludeProjecType,
  AResult: String;
begin
  with RepDef_Formulas do
  try
    Filter  := 'FUNC_NAME = ''REP_DEF_PROJECT_SECURITY''';
    Filtered:= TRUE;
    Refresh;

    AExcludeProjecType:= 'N';
    AProjExists:= 0;

    AExcludeProjecType:= SelectValueFmtAsString('select nvl(exclude_project_type, ''N'') from s_user_general where user_name = ''%s''',
                                                [ SecurityManager.UserName ]);

    AProjExists:= SelectValueFmtAsFloat('select 1 from s_user_project_type where user_name = ''%s''',
                                        [ SecurityManager.UserName ]);

    if AExcludeProjecType = 'Y' then
      AResult:= 'Y'
    else if (AExcludeProjecType = 'N') and (AProjExists > 0) then
      AResult:= 'N'
    else
      AResult:= 'A';

    if (FieldByName('form_name').asString > '') and (SecurityManager <> nil) then
    begin
       I:= GetEnsureFormulaIndexExists( FieldByName('form_name').asString );
       SetFormulaText( Crpe1, CRDotNetObject,               {Report objects}                   { IQMS.WebVcl.RepDefVersions.pas }
                       I,                                   {index of report formula for Crpe1}
                       //RepDef_FormulasFORM_NAME.asString,   {name of report formula for .Net }
                       '''' + AResult + '''' );
    end;
  finally
    Filtered:= FALSE;
    First;
  end;
end;

procedure TFrmRepDef.CheckUserEPlantID( Crpe1:TCrpe; CRDotNetObject:Variant );
var
  I: Integer;
  Year, Month, Day: Word;
begin
  I:= GetFormulasIndexOf( Crpe1, CRDotNetObject, 'USER_EPLANT_ID' );
  if I > -1 then
  begin
    I:= CheckEnsureFormulaIndexExists( Crpe1, CRDotNetObject, 'USER_EPLANT_ID' );
    SetFormulaText( Crpe1, CRDotNetObject,               {Report objects}                   { IQMS.WebVcl.RepDefVersions.pas }
                    I,                                   {index of report formula for Crpe1}
                    //,   {name of report formula for .Net }
                    Format('%s', [ sIIf( SecurityManager.EPlant_ID = 'NULL', '0', SecurityManager.EPlant_ID )]) );
  end;

  I:= GetFormulasIndexOf( Crpe1, CRDotNetObject, 'EPLANT_INCLUDE_NOT_ASSIGN' );
  if I > -1 then
  begin
    I:= GetEnsureFormulaIndexExists( 'EPLANT_INCLUDE_NOT_ASSIGN' );
    SetFormulaText( Crpe1, CRDotNetObject,               {Report objects}                   { IQMS.WebVcl.RepDefVersions.pas }
                    I,                                   {index of report formula for Crpe1}
                    //,   {name of report formula for .Net }
                    Format('%s', [ sIIf( SecurityManager.EPlant_Include_Nulls, '''Y''', '''N''' )]) );
  end;

  I:= GetFormulasIndexOf( Crpe1, CRDotNetObject, 'IQMS_CURRENT_DATE' );
  if I > -1 then
  begin
    I:= GetEnsureFormulaIndexExists( 'IQMS_CURRENT_DATE' );
    DecodeDate( Date, Year, Month, Day );
    SetFormulaText( Crpe1, CRDotNetObject,               {Report objects}                   { IQMS.WebVcl.RepDefVersions.pas }
                    I,                                   {index of report formula for Crpe1}
                    //,   {name of report formula for .Net }
                    Format('Date(%d,%d,%d)', [ Year, Month, Day ]) );
  end;

  I:= GetFormulasIndexOf( Crpe1, CRDotNetObject, 'USERNAME_PROC_COST_LOT_SUM' );
  if I > -1 then
  begin
    I:= CheckEnsureFormulaIndexExists( Crpe1, CRDotNetObject, 'USERNAME_PROC_COST_LOT_SUM' );
    SetFormulaText( Crpe1, CRDotNetObject,               {Report objects}                   { IQMS.WebVcl.RepDefVersions.pas }
                    I,                                   {index of report formula for Crpe1}
                    //,   {name of report formula for .Net }
                    Format('%s_LOT_SUM', [ SecurityManager.UserName ]));
  end;

end;

procedure TfrmRepDef.btnSetUpClick(Sender: TObject);
var
   AResult: Boolean;
begin
  if IsCalledFromIQAlert and (RepDefREPNAME.asString <> '') then
     RestorePrinterFromRegistry;

  // display touchscreen version of PrinterSetup
//  if FIsTouchscreen then
//     AResult := touchscrn.TouchScreen_PrinterSetup
  // display standard version of PrinterSetup
//  else
     // with TPrintDialog.Create(self) do
     with PrintDialog1 do
     begin
       MaxPage:= 999;
       Options:= [poPageNums];
       Collate:= RepDefCOLLATE.asString = 'Y';
       Copies := RepDefNUM_COPIES.asInteger;

       AResult:= Execute;

       if AResult then
       begin
          FPrintRange:= PrintRange;
          case FPrintRange of
            prAllPages:
               begin
                 FPageStart:= 0;
                 FPageStop := 0;
               end;
            prSelection:
               begin
                 // not supported
                 FPageStart:= 0;
                 FPageStop := 0;
               end;
            prPageNums:
               begin
                 FPageStart:= FromPage;
                 FPageStop := ToPage;
               end;
          end;
       end;
     end;

  if AResult and IsCalledFromIQAlert and (RepDefREPNAME.asString <> '') then
     StorePrinterInRegistry;

end;

procedure TFrmRepDef.cboxFileTypeCloseUp(Sender: TObject);
var
  AFileName: string;
begin
  if (edSaveFile.Text > '') then
    begin
      AFileName :=  DefaultToMasterPath(edSaveFile.Text);
      AFileName := ChangeFileExt(AFileName, ExportFileTypeExt[ExportFileType]);
      if not (RepDef.State in [dsEdit, dsInsert]) then
        RepDef.Edit;
      RepDefFILE_NAME.AsString := AFileName;
      edSaveFile.Text := AFileName;
      RepDef.Post;
    end;
end;

procedure TfrmRepDef.sbtnClearClick(Sender: TObject);
var
   AResult: Boolean;
begin
//  if FIsTouchscreen then
     // 'Are you sure you want to clear Selection Criteria?'
//     AResult := touchscrn.TouchScreen_Msg_WarningYN( IQMS.WebVcl.ResourceStrings.cTXT0000163)
//  else
     AResult := IQWarningYN( IQMS.WebVcl.ResourceStrings.cTXT0000163);

  if AResult then
  begin
     RepDef_Criteria.CheckBrowseMode;
     ExecuteCommand( Format('update repdef_criteria set RANGE_START = NULL, RANGE_END = NULL'+
                    ' where APP_ID = ''%s'' and REPNAME = ''%s'' ' ,
                    [RepDefAPP_ID.AsString, RepDefREPNAME.asString]));
     RepDef_Criteria.Refresh;
  end;
end;

procedure TfrmRepDef.dbgReports1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Shift = [ ssLeft ]) and not( RepDef.Eof and RepDef.Bof ) then
     dbgReports.BeginDrag( FALSE );
end;

procedure TfrmRepDef.dbgReports1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:=( Sender is TIQUniGridControl ) and ( Source is TIQUniGridControl ) and
          ( Sender = dbgReports ) and (( Source as TIQUniGridControl).Name = 'dbgReports' )
          and ( Sender <> Source );
end;

procedure TfrmRepDef.dbgReports1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  with Source as TIQUniGridControl, DataSource, DataSet do
    CopyRepDefFrom( FieldByName('APP_ID').asString, FieldByName('REPNAME').asString );
end;

procedure TfrmRepDef.CopyRepDefFrom( const AApp_ID, ARepName : string );
begin
   TFrmRepDef.Clone_RepDef_Report( AApp_ID, App_ID, ARepName );

   RepDef.Refresh;
   RepDef.Locate( 'APP_ID;REPNAME', VarArrayOf([ App_ID, ARepName ]), [] );
end;


class procedure TfrmRepDef.Clone_RepDef_Report( ASrc_App_ID, ATrg_App_ID, ASrcRepName: string; ATrgRepName: string = '' );
begin
   if ATrgRepName = '' then
      ATrgRepName:= ASrcRepName;

   ExecuteCommandFmt('insert into repdef (app_id, repname, descrip, curr_rec_col_name, crw_match_col_name, before_print, language_code )' +
             'select ''%s'', ''%s'', descrip, curr_rec_col_name, crw_match_col_name, before_print, language_code '+
             '  from repdef where app_id = ''%s'' and repname = ''%s''', [ ATrg_App_ID, ATrgRepName, ASrc_App_ID, ASrcRepName ]);

   ExecuteCommandFmt('insert into repdef_criteria '+
             '(app_id, repname, seq, crw_col_name, descrip, range_start, range_end, unary_operator, binary_operator, like_operator) '+
             ' select ''%s'', ''%s'', seq, crw_col_name, descrip, range_start, range_end, unary_operator, binary_operator, like_operator '+
             '  from repdef_criteria where app_id = ''%s'' and repname = ''%s''', [ ATrg_App_ID, ATrgRepName, ASrc_App_ID, ASrcRepName ]);

   ExecuteCommandFmt('insert into repdef_formulas '+
             '(app_id, repname, seq, label_text, form_name, form_type, form_value, func_name) '+
             ' select ''%s'', ''%s'', seq, label_text, form_name, form_type, form_value, func_name '+
             '  from repdef_formulas where app_id = ''%s'' and repname = ''%s''', [ ATrg_App_ID, ATrgRepName, ASrc_App_ID, ASrcRepName ]);

   ExecuteCommandFmt('insert into repdef_email '+
             '(app_id, repname, email_to, email_subject, email_body, email_sender, email_bcc) '+
             'select ''%s'', ''%s'', email_to, email_subject, email_body, email_sender, email_bcc '+
             '  from repdef_email where app_id = ''%s'' and repname = ''%s''', [ ATrg_App_ID, ATrgRepName, ASrc_App_ID, ASrcRepName ]);
end;

procedure TfrmRepDef.RepDefFilterRecord(DataSet: TDataSet; var Accept: Boolean);

  function CheckSecurity: Boolean;
  var
    I: Integer;
    AIsMyAlertsMode: Boolean;
  begin
    Result:= (SecurityManager <> nil) and SecurityManager.IsUserDBA;
    if Result then
       EXIT;

    AIsMyAlertsMode:= (self.Owner is TIQWebRepDef) and (self.Owner as TIQWebRepDef).IsMyAlertsMode;

    Result:= ((CompareText( ExtractFileName( Application.ExeName ), 'IQALERT.EXE' ) = 0)
              or
              (CompareText( ExtractFileName( Application.ExeName ), 'ESERVER.EXE' ) = 0)
              or
              AIsMyAlertsMode)
             and
             (Copy(App_ID, 1, 5) = 'ALRT-')
             and
             ( (CompareText( SecurityManager.UserName, 'RTBOX' ) = 0)
               or
               AIsMyAlertsMode);

    if Result then
       EXIT;

//    with SR do
//    begin
//      {Look for this report among TSecurityRepDef objects }
//      I:= SecurityItems.IndexOf( DeriveComponentNameFrom( RepDefREPNAME.asString ));
//      if (I >= 0) and Assigned(SecurityItems.Objects[ I ]) then with TSecurityCargo( SecurityItems.Objects[ I ]) do
//         Result:= SVisible;
//    end;
  end;

  function CheckHidden: Boolean;
  begin
    if ShowAllReports1.Checked then
       Result:= TRUE
    else
       Result:= RepDefHIDDEN.asString <> 'Y';
  end;

  function CheckLanguage: Boolean;
  begin
    Result:= (RepDefLANGUAGE_CODE.asFloat = 0)
             or
             (FUserLanguageCode > 0) and (RepDefLANGUAGE_CODE.asFloat = FUserLanguageCode);
    if Result then
       EXIT;

    if (SecurityManager <> nil) and (CompareText(SecurityManager.UserName, 'IQMS') = 0) then
       Result:= TRUE;
  end;

  function CheckMfgtypeFilter: Boolean;
  begin
    Result:=   (RTrim(RepDefMFGTYPE.asString) = '' )
             or
               ShowAllReports1.Checked
             or
               (SelectValueFmtAsFloat('select 1 from mfgtype where rtrim(mfgtype) = ''%s''', [ RTrim(RepDefMFGTYPE.asString) ]) = 1);
  end;

begin
  Accept:= CheckSecurity and CheckHidden and CheckLanguage and CheckMfgtypeFilter;
end;

procedure TfrmRepDef.RepDefAfterPost(DataSet: TDataSet);
var
  AComponent: TComponent;
begin
  // refresh TSecurityRepDef components associated with the reports
//  SR.Refresh;

  // when removing report from the menu we need to free associated TSecurityRepDef component
  if Assigned(FDeletedReportSecurityRepDef) then
    FreeAndNil( FDeletedReportSecurityRepDef );

  // to allow the filter to kick out added illegaly report
  DataSet.Refresh;
end;

procedure TfrmRepDef.About1Click(Sender: TObject);
begin
//  IQAbout1.Execute;
end;

procedure TfrmRepDef.sbtnAssignEmailClick(Sender: TObject);
var
  AFieldName: string;
  S: string;
begin
  if Sender = sbtnAssignEmail then
     AFieldName:= 'EMAIL_TO'
  else
     AFieldName:= 'EMAIL_BCC';

  S:= ReplaceStr( ReplaceStr( memoEmailTo.Lines.Text, #13, ''), #10, ''); // RepDef_EMail.FieldByName(AFieldName).asString;
//  if mailto_pick.GetMailToString( self, S ) then // in mailto_pick.pas
//    begin
//      RepDef_EMail.Edit;
//      RepDef_EMail.FieldByName(AFieldName).asString:= ReplaceStr( ReplaceStr( S, #13, ''), #10, '');
//    end;

  // AddFromVendors1.Tag  := IIf( Sender = sbtnAssignEmail, 0, 1 );
  // AddFromCustomers1.Tag:= IIf( Sender = sbtnAssignEmail, 0, 1 );
  // AddFromEmployees1.Tag:= IIf( Sender = sbtnAssignEmail, 0, 1 );
  //
  // with sbtnAssignEmail do
  //    begin
  //      P.y:= Height;
  //      P.x:= Left;
  //      P:= tabEMail.ClientToScreen( P );
  //      popmEMail.Popup( P.X, P.Y );
  //    end;
end;

procedure TFrmRepDef.sbtnAssignEMailSenderClick(Sender: TObject);
var
  P : TPoint;
begin
  AddFromVendors1.Tag   := 2;
  AddFromCustomers1.Tag := 2;
  AddFromEmployees1.Tag := 2;

  with sbtnAssignEmail do
    begin
      P.y:= Height;
      P.x:= Left;
      P:= tabEMail.ClientToScreen( P );

      popmEMail.Popup( P.X, P.Y );
    end;
end;

procedure TfrmRepDef.AddfromVendors1Click(Sender: TObject);
var
  AFieldName: string;
  ASingleResult: boolean;
begin
  case TUniMenuItem(Sender).Tag of
    0 :
      begin
        AFieldName    := 'EMAIL_TO';
        ASingleResult := false;
      end;
    1 :
begin
        AFieldName    := 'EMAIL_BCC';
        ASingleResult := false;
      end;
    2 :
      begin
        AFieldName    := 'EMAIL_SENDER';
        ASingleResult := true;
      end;
  end;

//  if Sender = AddfromVendors1        then AddEMailFromPkList( PkEmailVendor  , AFieldName, ASingleResult )
//  else if Sender = AddfromCustomers1 then AddEMailFromPkList( PkEMailCustomer, AFieldName, ASingleResult )
//  else if Sender = AddfromEmployees1 then AddEMailFromPkList( PkEmployee     , AFieldName, ASingleResult );
end;

procedure TfrmRepDef.AddEMailFromPkList( APkList: TIQWebHPick; AFieldName: string = 'EMAIL_TO'; ASingleResult: boolean = false );
var
  I: Integer;
  AEMail: string;
  ABlankEMailCount: Integer;
begin
  ABlankEMailCount:= 0;
  FPickListShowInactiveRecords:= FALSE;

  with APkList do
  begin
    OnFilterRecord:= nil;
    if ExecuteEx('EMAIL') then
    begin
      for I:= 0 to ResultList.Count - 1 do
      begin
        AEMail:= Trim(ResultList[ I ]);
        if AEMail > '' then
           begin
             RepDef_EMail.Edit;

             if ASingleResult then
               begin
                 RepDef_EMail.FieldByName(AFieldName).asString:= AEMail;

                 Exit;
               end
             else
               if RepDef_EMail.FieldByName(AFieldName).asString = '' then
                  RepDef_EMail.FieldByName(AFieldName).asString:= AEMail
               else
                  RepDef_EMail.FieldByName(AFieldName).asString:= RepDef_EMail.FieldByName(AFieldName).asString + ';' + AEMail;
           end
        else
           Inc( ABlankEMailCount );
      end;

      if ABlankEMailCount > 0 then
         IQConfirm( Format( IQMS.Common.ResStrings.cTXT0000386, [ ABlankEMailCount ])); {'The system has identified and skipped blank email addresses (%d).}
    end;
  end;
end;

procedure TfrmRepDef.RepDef_FormulasFORM_TYPESetText(Sender: TField;
  const Text: String);
begin
  Sender.asString:= UpperCase( Trim( Text ));
end;

procedure TfrmRepDef.RepDef_FormulasFORM_VALUESetText(Sender: TField;  const Text: String);
begin
  if RepDef_FormulasFORM_TYPE.asString = 'DATE' then
     Sender.asString:= CRWtoDateStr( Text )
  else
     Sender.asString:= Text
end;

function TfrmRepDef.CRWtoDateStr( Text: string ): string;
var
  Y,M,D: Word;
  ADate: TDateTime;
begin
  Result:= Text;

  {Empty Date}
  if Text = '' then
     EXIT;

  {Valid Date}
  try
    StrToDate( Text );
    EXIT;
  except
  end;

  {Get rid of any blanks}
  while (Pos( ' ', Text ) > 0) and (Text > '') do
    Text:= StrTran( Text, ' ', '' );

  { Date(2000,2,2) - old style }
  if CompareText( 'Date(', Copy( Text, 1, 5 )) = 0 then
  begin
     Text:= Copy( Text, 6, Length( Text ) - 1 - 5 );  { 2000,2,2 }

     Y:= StrToInt( GetToken( Text, ',', 1 ));         { YY }
     M:= StrToInt( GetToken( Text, ',', 2 ));         { MM }
     D:= StrToInt( GetToken( Text, ',', 3 ));         { DD }

     ADate:= EncodeDate(Y, M, D);

     // Result:= Format( '%s/%s/%s', [ GetToken( Text, ',', 2 ), { MM }
     //                                GetToken( Text, ',', 3 ), { DD }
     //                                GetToken( Text, ',', 1 )  { YY } ]);

     Result:= DateToStr( ADate );
     EXIT;
  end;

  {Invalid Date Format}
  Result:= '';
end;

procedure TFrmRepDef.ShowAllReports1Click(Sender: TObject);
begin
  ShowAllReports1.Checked:= not ShowAllReports1.Checked;

  AssignGridColumns( ShowAllReports1.Checked );

  {refresh to kick off the filter}
  RepDef.Refresh;
end;


procedure TFrmRepDef.AssignGridColumns( AShowAll: Boolean );
const cCHKBOX_WIDTH = 9;
var
  W: Integer;
begin
  with dbgReports.DBGrid do
  begin
    W:= ClientWidth;

    if AShowAll then
       begin
         Options:= [ dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit ];
         Columns.Clear;

         with Columns.Add do
          begin
            FieldName:='DESCRIP';
            Title.Caption:=IQMS.WebVcl.ResourceStrings.cTXT0000165;
            Width:=W;
          end;

         with Columns.Add do
          begin
            FieldName:='HIDDEN';
            Title.Caption:=IQMS.WebVcl.ResourceStrings.cTXT0000166;
            Width:=cCHKBOX_WIDTH;
          end;

//         Selected.Text:= Format('DESCRIP'#9'%d'#9 + IQMS.WebVcl.ResourceStrings.cTXT0000165 {'Report Description'} + #9'T'#13'HIDDEN'#9'%d'#9 + IQMS.WebVcl.ResourceStrings.cTXT0000166 {'Hidden'} + #9'F', [ W, cCHKBOX_WIDTH ]);
//         ControlType.Text:= 'HIDDEN;CheckBox;Y;N';
         PnlToolbarMain.Visible:= TRUE;
         PnlToolbarMain.Top:= 0;
       end
    else
       begin
         Options:= [ dgColumnResize, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit ];
         Columns.Clear;

         with Columns.Add do
          begin
            FieldName:='DESCRIP';
            Title.Caption:=IQMS.WebVcl.ResourceStrings.cTXT0000165;
            Width:=W;
          end;
//         Selected.Text:= Format('DESCRIP'#9'%d'#9 + IQMS.WebVcl.ResourceStrings.cTXT0000165 {'Report Description'} + #9'T', [ W ]);
//         ControlType.Clear;
         PnlToolbarMain.Visible:= FALSE;
       end;

    {Assign dgProportionalColResize separately or D7 throws ListIndex when PnlToolbarMain.Visible:= FALSE}
//    Options:= Options + [ dgProportionalColResize ];

//    ApplySelected;

//    if AShowAll then
//       ColWidthsPixels[ 0 ]:= W - ColWidthsPixels[ 1 ] - 2
//    else
//       ColWidthsPixels[ 0 ]:= W;
  end;
end;

procedure TFrmRepDef.sbtnUnHideAllClick(Sender: TObject);
begin
  // 'This option clears ''Hidden'' flag for ALL the reports on this menu. Continue?'
  if not IQConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000167 ) then
     EXIT;

  with Repdef do
  begin
    First;
    while not Eof do
    begin
      if RepDefHIDDEN.asString = 'Y' then
      begin
        Edit;
        RepDefHIDDEN.asString:= 'N';
        Post;
      end;
      Next;
    end;
    First;
  end;
end;

procedure TfrmRepDef.Remove1Click(Sender: TObject);
var
  AAction: string;
  AIsSecInsOwner: Boolean;
begin
  // IQWarningYN('Are you sure you want to remove report definition from the list?') then
  with RepDef do
  begin
    if (Eof and Bof) then
       EXIT;

    {hide security inpector if it is owner of the repdef }
//    AIsSecInsOwner:= IsSecurityInspectorInParentListOf( self );
//    try
//      if AIsSecInsOwner then SecurityInspector.Hide;
//      {Confirm: remove or hide}
//      if not RepDefRemoveDialog( self, AAction ) then     // IQRepDefRemove
//         EXIT;
//    finally
//      if AIsSecInsOwner then SecurityInspector.Show;
//    end;

    if AAction = 'REMOVE' then
       Delete
    else if AAction = 'HIDE' then
       begin
         Edit;
         RepDefHIDDEN.asString:= 'Y';
         Post;
         RepDef.Refresh;
       end;
  end;
end;


procedure TFrmRepDef.sbtnFaxClick(Sender: TObject);
var
  I: Integer;
begin
  if GetFaxDialog( FFaxMan ) then
  begin
    lviewFaxRecipients.Items.Clear;

    for I:= 0 to FFaxMan.FRecipients.Count - 1 do
    with lviewFaxRecipients.Items.Add do
    begin
       Caption:= GetToken( FFaxMan.FRecipients[ I ], #9, 1 );
       SubItems.Add( GetToken( FFaxMan.FRecipients[ I ], #9, 2 ));
       SubItems.Add( GetToken( FFaxMan.FRecipients[ I ], #9, 3 ));
    end;

    EnableBtns;
  end;
end;


procedure TFrmRepDef.pgctrDestinationChange(Sender: TObject);
begin
  EnableBtns;
end;

procedure TFrmRepDef.SrcRepDef_EMailDataChange(Sender: TObject;
  Field: TField);
begin
  EnableBtns;
end;

procedure TFrmRepDef.sbtnFaxSetupClick(Sender: TObject);
begin
//  AssignPollingParams;  {FM_Params.pas}
end;

procedure TFrmRepDef.CheckTablesNameInUserCriteria;
var
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    {Get user defined selection criteria expression stored in RepDef_Criteria}
    GetUserCriteriaExpression( AList );

    {Check table names used in user defined selection criteria}
    CheckSelectionFormulaAgainstReportTables( Crpe1, CRDotNetObject, AList );   { IQMS.WebVcl.RepDefVersions.pas }
  finally
    AList.Free;
  end;
end;

function TFrmRepDef.IsCalledFromIQAlert: Boolean;
begin
  Result:= CompareText( Copy( App_ID, 1, 5 ), 'ALRT-' ) = 0;
end;

procedure TFrmRepDef.StorePrinterInRegistry;
var
  APrinter: string;
begin
  APrinter := Printer.Printers[ Printer.PrinterIndex ];
  if RPos(' on ', APrinter) <> 0 then
     APrinter:= Copy( APrinter, 1, RPos(' on ', APrinter) - 1);
  IQRegStringScalarWrite ( Application, Format('%s_%s_PRINTER', [ App_ID, RepDefREPNAME.asString ]), APrinter);
end;

procedure TFrmRepDef.RestorePrinterFromRegistry;
var
  APrinter: string;
begin
  IQRegStringScalarRead( Application, Format('%s_%s_PRINTER', [ App_ID, RepDefREPNAME.asString ]), APrinter );

  if APrinter > '' then
    // 09-06-06 Jason - this causes invalid printer errors Printer.SetPrinter( PChar(APrinter), PChar(''), PChar(''), 0);
    IQSetPrinter( APrinter );
end;


procedure TFrmRepDef.dbgReportsDblClick(Sender: TObject);
begin
//  if dbgReports.DBGrid.GetActiveField <> RepDefDESCRIP then
//     EXIT;

  {10-21-2005 Infopower throws AV when printed to screen and hit any key on the keyboard}
  // btnPrint.SetFocus;
  // btnPrint.Click;

  {11-27-2008 Once the report (.NET only) displays mouse over to the report and left click on the displayed data -> the screen pops back
              to the reports menu as if you want to select another report. Clicking on the Print button works fine.
              Let's try imitating Print button click}
  PostMessage( btnPrint.Handle, BM_CLICK, 0 ,0 );
end;

procedure TFrmRepDef.Splitter1Moved(Sender: TObject);
begin
  {Ensure buttons panel is always at the bottom}
  pnlGrid.Top  := 0;
  Splitter1.Top:= 0;
end;

procedure TFrmRepDef.SRAfterApply(Sender: TObject);
begin
//  IQMS.Common.Controls.AutoSizeNavBar(NavParams);
end;

procedure TFrmRepDef.EnsureRepdef_CatExistsFor( AApp_ID: string );
begin
  if SelectValueFmtAsFloat('select 1 from repdef_cat where app_id = ''%s'' ', [ AApp_ID ]) = 0 then
     ExecuteCommandFmt('insert into repdef_cat( app_id, descrip ) values( ''%s'', ''%s'' )', [  AApp_ID, AApp_ID ]);
end;


procedure TFrmRepDef.ViewReportCatalog1Click(Sender: TObject);
var
  AFileName: string;
begin
  if RepName = '' then
     EXIT;

  AFileName:= ChangeFileExt( Path + RepName, '.pdf' );
  IQAssert( FileExists(AFileName), Format( IQMS.WebVcl.ResourceStrings.cTXT0000314, [ AFileName ])); // 'Missing file %s - unable to continue.';

  IQShellExecute( AFileName );
end;

procedure TFrmRepDef.FormDestroy(Sender: TObject);
begin
  CheckFreeCRPEObject(Crpe1);
  CheckFreeCRDotNetObject(CRDotNetObject);
end;

procedure TFrmRepDef.AddToRepDefLog( AStartTime: Real );
var
  ADestination: string;
  ASpec       : string;
begin
  ADestination:= ''; ASpec:= '';
  GetDestination( ADestination, ASpec );
  if ASpec > '' then
     ADestination:= Format( '%s: %s', [ ADestination, ASpec ]);

  InternalWriteToRepdefLog( RepName, SecurityManager.UserName, ADestination, AStartTime );  {IQMS.Common.PrintDialogsShare.pas}
end;


procedure TFrmRepDef.ReportsExecutionLog1Click(Sender: TObject);
begin
  TFrmRepDefLog.DoShow( RepName ); {repdef_log.pas}
end;



procedure TFrmRepDef.DoDestBtnClick(Sender: TObject);
begin
  if TComponent(Sender) is TUniSpeedButton then
     if TUniSpeedButton(Sender).Tag > 0 then
        pgctrDestination.ActivePageIndex := TUniSpeedButton(Sender).Tag - 10;
end;

procedure TFrmRepDef.tabEmailShow(Sender: TObject);
begin
  IQSetParentBackground([PnlDestEMailClient01], True); // IQMS.Common.Controls.pas
end;

procedure TFrmRepDef.ReportEditor1Click(Sender: TObject);
var
  AReportName: string;
begin
  if RepDef.Eof and RepDef.Bof then
     EXIT;

  AReportName:= IncludeTrailingBackslash(Path) + RepName;
  IQAssert( FileExists( AReportName ), Format( IQMS.WebVcl.ResourceStrings.cTXT0000076, [ AReportName ])); //  'File %s not found';

  IQMS.Common.Miscellaneous.ExecuteProgram( AReportName, SW_SHOWNORMAL, '');
end;

procedure TFrmRepDef.wwIncrementalSearchReportNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [ VK_DOWN, VK_UP, VK_PRIOR, VK_NEXT, VK_RETURN ] then
     dbgReports.SetFocus
end;

procedure TFrmRepDef.dbgParamsDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
   if (Column.Field = RepDef_CriteriaRANGE_END) and (RepDef_CriteriaLIKE_OPERATOR.asString = 'Y') then
  begin

//     if gdSelected in State then
//        begin
//          (Sender as TUniDBGrid).Canvas.Brush.Color:= clGray;
//          (Sender as TUniDBGrid).Canvas.Font.Color := clWhite;
//        end
//     else
        begin
          Attribs.Color:= clBtnFace;
          Attribs.Font.Color := clBlack;
        end;

//     (Sender as TUniDBGrid).DefaultDrawColumnCell( Rect, DataCol, Column, State );
  end;
end;

procedure TFrmRepDef.dbgParamsEditButtonClick(Sender: TObject);
begin
  if Sender is TUniDBGrid then with Sender as TUniDBGrid do
  begin
//    if Assigned( SelectedField ) and StrInList( SelectedField.FieldName, ['RANGE_START', 'RANGE_END']) and not DataSource.DataSet.FieldByName(SelectedField.FieldName).ReadOnly then
//       CreateUserFriendlyPromptFor( SelectedField );
       // PickAndReplace( DM.PkVendor, 'Vendor_ID', 'ID' );
  end;
end;

procedure TFrmRepDef.CreateUserFriendlyPromptFor( ARangeField: TField );
begin
  if RepDef_Criteria.FieldByName('CRW_COL_NAME').asString = '' then
     EXIT;

  if ColInfo[ RepDef_Criteria.FieldByName('CRW_COL_NAME').asString ].DataType = dtDate then
     PopupCalendarPrompt( ARangeField )
  else
     PopupPicklistPrompt( ARangeField )
end;

procedure TFrmRepDef.PopupCalendarPrompt( ARangeField: TField );
var
  ADate: TDateTime;
begin
  try
    ADate:= ARangeField.asDateTime;
    if ADate = 0 then
       ADate:= Date()
  except
    ADate:= Date()
  end;

  if GetDateDialog( ADate ) then
  begin
    RepDef_Criteria.Edit;
    ARangeField.asString:= DateToStr( ADate );
  end;
end;

procedure TFrmRepDef.PopupPicklistPrompt( ARangeField: TField );
var
  AColInfo: TColInfo;
  S: string;
  I: Integer;
  AField: TField;
begin
  if RepDef.Eof and RepDef.Bof then EXIT;

  AColInfo:= ColInfo[ RepDef_Criteria.FieldByName('CRW_COL_NAME').asString ];

//  with PkLookup do
//  begin
//    Close;
//    // SkipRestoreRegistry:= TRUE;
//    RegistryPathExtension:= Format('%s\%s',                                                                   // keep picklist settings per report, field
//                                   [ SR.DeriveComponentNameFrom( RepDefREPNAME.asString ),
//                                     NZ( RepDef_Criteria.FieldByName('CRW_COL_NAME').asString, 'Default') ]); // "Default" is just a precaution - there always should be table.fieldname assigned to CRW_COL_NAME
//
//    PkLookup.Fields.Clear;
//
//    // field name
//    InsertStringsBetweenKeyWords( SQL,
//                                  AColInfo.FieldName,
//                                  '_START_FIELD_NAME_',
//                                  '_END_FIELD_NAME_' );
//
//    // optional field name
//    S:= '';
//    Reopen(QryCriteriaPkList);
//    while not QryCriteriaPkList.Eof do
//    begin
//      S:=  S + #13 + Format(', %s', [ QryCriteriaPkListCOLUMN_NAME.asString ]);
//      QryCriteriaPkList.Next;
//    end;
//    InsertStringsBetweenKeyWords( SQL,
//                                  S,
//                                  '_START_OPTIONAL_FIELD_NAME_',
//                                  '_END_OPTIONAL_FIELD_NAME_' );
//
//    // table name
//    InsertStringsBetweenKeyWords( SQL,
//                                  AColInfo.TableName,
//                                  '_START_TABLE_NAME_',
//                                  '_END_TABLE_NAME_' );
//
//    // clear where
//    InsertStringsBetweenKeyWords( SQL,
//                                  ' 1 < 0 ',
//                                  '_START_WHERE_CLAUSE_',
//                                  '_END_WHERE_CLAUSE_' );
//    FieldDefs.Update;
//
//    // add where
//    InsertStringsBetweenKeyWords( SQL,
//                                  sIIf( TableHasColumn( AColInfo.TableName, 'EPLANT_ID' ), 'misc.eplant_filter_include_nulls(eplant_id) = 1', '1 = 1'),
//                                  '_START_WHERE_CLAUSE_',
//                                  '_END_WHERE_CLAUSE_' );
//
//    // columns - caption and widths
//    for I:= 0 to FieldDefs.Count - 1 do
//    begin
//      AField:= FieldDefs[ I ].CreateField( PkLookup );
//
//      if CompareText(AField.FieldName, 'lookup_value' ) = 0 then
//         begin
//            AField.DisplayLabel:= 'Value';
//            AField.DisplayWidth:= AField.Size;
//         end
//
//      else if QryCriteriaPkList.Locate('column_name', AField.FieldName, []) and (QryCriteriaPkListWIDTH.asFloat > 0) then
//         begin
//           AField.DisplayWidth:= QryCriteriaPkListWIDTH.asInteger;
//           AField.DisplayLabel:= QryCriteriaPkListCAPTION.asString
//         end;
//    end;
//
//    Title:= NZ( RepDef_Criteria.FieldByName('CRW_COL_NAME').asString, 'Select from PickList');
//
//    if Execute then
//    begin
//      RepDef_Criteria.Edit;
//      ARangeField.asString:= GetValue('lookup_value');
//    end;
//  end;
end;

function TFrmRepDef.TableHasColumn( ATableName, AColumnName: string ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from user_tab_columns where table_name = ''%s'' and column_name = ''%s''',
                     [ UpperCase(Trim(ATableName)),
                       UpperCase(Trim(AColumnName))]) = 1;
end;


procedure TFrmRepDef.Clone1Click(Sender: TObject);
var
  AFilePath  : string;
  AReportName: string;
begin
  RepDef.CheckBrowseMode;
  if RepDef.Eof and RepDef.Bof then
     EXIT;

  with OpenDialog1 do
  begin
    InitialDir:= Path;
    if Execute then
    begin
      {validate path}
      AFilePath:= UpperCase( StrTran(ExtractFileDir( FileName ) + '\', '\\', '\'));
      IQAssert( AFilePath = UpperCase(Path), Format(IQMS.WebVcl.ResourceStrings.cTXT0000145, [ Path ]));  { 'Cannot proceed.  Please copy this report into the EnterpriseIQ subdirectory, %s.'; }

      {validate name}
      AReportName:= ExtractFileName( FileName );
      ValidateReportName( AReportName );

      {clone}
      TFrmRepDef.Clone_RepDef_Report( RepDefAPP_ID.asString, RepDefAPP_ID.asString, RepDefREPNAME.asString, AReportName );

      RepDef.Refresh;
      RepDef.Locate( 'APP_ID;REPNAME', VarArrayOf([ App_ID, AReportName ]), []);

      {allow them to change the descrip}
      Edit1Click( nil );
    end;
  end;
end;

procedure TFrmRepDef.RepDefBeforeDelete(DataSet: TDataSet);
begin
  // find component to be freed in after post
//  FDeletedReportSecurityRepDef:= self.FindComponent( SR.DeriveComponentNameFrom( RepDefREPNAME.asString )) as TSecurityRepDef;
end;

procedure TFrmRepDef.RepDefBeforePost(DataSet: TDataSet);
var
  ADir:String;
begin
  if RepDefFILE_NAME.asString <> '' then
  begin
    ADir :=ExtractFileDir(RepDefFILE_NAME.asString);
    if not DirectoryExists(ADir) then
      raise exception.create(Format('%s - Invalid Folder', [ADir]));
  end;
end;

procedure TFrmRepDef.SetFilterPicklistInactiveRecords( Sender: TObject );
begin
  if not (Sender is TUniSpeedButton) or not (TUniSpeedButton(Sender).Owner is TIQUniGridControl) then
     EXIT;

  // keep up the flag
  FPickListShowInactiveRecords:= (Sender as TUniSpeedButton).Down;

  // hint
  if TUniSpeedButton(Sender).Down then
     TUniSpeedButton(Sender).Hint:= IQMS.WebVcl.ResourceStrings.cTXT0000044 // 'Showing inactive only.'#13'Click to toggle.'
  else
     TUniSpeedButton(Sender).Hint:= IQMS.WebVcl.ResourceStrings.cTXT0000045; // 'Showing active only.'#13'Click to toggle.'

  // refresh dataset
  TIQUniGridControl( TUniSpeedButton(Sender).Owner ).DBGrid.DataSource.DataSet.Close;
  TIQUniGridControl( TUniSpeedButton(Sender).Owner ).DBGrid.DataSource.DataSet.Open;
end;

procedure TFrmRepDef.PkEmailBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'pk_hide', TIQBoolean.AsYN(FPickListShowInactiveRecords));
end;

procedure TFrmRepDef.RepDefCalcFields(DataSet: TDataSet);
begin
  RepDefReportOwner.asString:= SelectValueFmtAsString('select owner from repdef_repository where repname = ''%s''', [ Repdef.FieldByName('repname').asString]);
end;

procedure TFrmRepDef.EnsureReportExistsInRepository( ARepName: string );
begin
  if SelectValueFmtAsFloat('select count(*) from repdef_repository where repname = ''%s''', [ ARepName ]) > 0 then
     EXIT;

  ExecuteCommandParam( 'insert into repdef_repository '+
               '     ( repname  )             '+
               'values                        '+
               '     (:repname )              ',
               [ 'REPNAME' ],
               [ ARepName  ]);
end;


procedure TFrmRepDef.sbtnSaveCriteriaClick(Sender: TObject);
var
  S: string;
begin
  if RepDef_Criteria.Eof and RepDef_Criteria.Bof then
     EXIT;

  // if not IQConfirmYN( IQMS.WebVcl.ResourceStrings.cTXT0000476 {'Save selection criteria?'} ) then
  //    EXIT;

  if not IQInputQuery( IQMS.WebVcl.ResourceStrings.cTXT0000477 {'Selection criteria description'}, IQMS.WebVcl.ResourceStrings.cTXT0000478 {'Enter description'}, S) then
     EXIT;

  IQAssert( Trim(S) > '', IQMS.WebVcl.ResourceStrings.cTXT0000480); {'Selection criteria description must be entered - operation aborted.'}

  ExecuteCommandFmt('declare                                         '+
            '  v_app_id  varchar2(30) ::= ''%s'';            '+
            '  v_repname varchar2(30) ::= ''%s'';            '+
            '  v_descrip varchar2(250)::= ''%s'';            '+
            '  v_userid  varchar2(35) ::= ''%s'';            '+
            'begin                                           '+
            '  repdef_misc.save_repdef_criteria( v_app_id,   '+
            '                                    v_repname,  '+
            '                                    v_descrip,  '+
            '                                    v_userid ); '+
            'end;                                            ',
            [ RepDefAPP_ID.asString,
              FixStr(RepDefREPNAME.asString),
              FixStr(S),
              SecurityManager.UserName ]);
end;

procedure TFrmRepDef.PkSelectionCriteriaBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'app_id', RepDefAPP_ID.AsString);
  AssignQueryParamValue(DataSet, 'repname', RepDefREPNAME.AsString);
  if FilterSelectionCriteriaPickListByUser then
    AssignQueryParamValue(DataSet, 'userid', SecurityManager.UserName)
  else
    ClearQueryParamValue(DataSet, 'userid');
  end;


procedure TFrmRepDef.sbtnSelectCriteriaClick(Sender: TObject);
begin
//  with PkSelectionCriteria do
//    if Execute then
//    begin
//       ExecuteCommandFmt('declare                                         '+
//                 '  v_app_id  varchar2(30)::= ''%s'';             '+
//                 '  v_repname varchar2(30)::= ''%s'';             '+
//                 '  v_repdef_criteria_hdr_id number::= %f;        '+
//                 'begin                                           '+
//                 '  repdef_misc.load_repdef_criteria( v_app_id,   '+
//                 '                                    v_repname,  '+
//                 '                                    v_repdef_criteria_hdr_id ); '+
//                 'end;                                            ',
//                 [ RepDefAPP_ID.asString,
//                   FixStr(RepDefREPNAME.asString),
//                   DtoF(GetValue('id')) ]);
//       Reopen(RepDef_Criteria);
//    end;
end;


procedure TFrmRepDef.PkSelectionCriteriaUserBtn1Click(Sender: TObject; var Action: TModalResult; var ResultValue: Variant);
var
   ID: Real;
begin
   Action:= mrNone;

   ID:= TIQWebHPick(Sender).GetValue('id');
   if ID = 0 then
      EXIT;

   if not IQConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000479) then  {'Are you sure you want to remove this selection criteria?'}
   begin
     Action:= mrIgnore;
     EXIT;
   end;

   // the picklist will get refreshed automatically because Action = mrNone, See IQHPickBase procedure sbtnUser1Click
   ExecuteCommandFmt('delete from repdef_criteria_hdr where id = %f', [ ID ]);
end;

procedure TFrmRepDef.SetShowFaxDestination(const Value: Boolean);
begin
  FShowFaxDestination := Value;
  sbtnDest_Fax.Visible := Value;
  CheckShowFirstAvailableDestination;
end;

procedure TFrmRepDef.SetShowScreenDestination(const Value: Boolean);
begin
  FShowScreenDestination := Value;
  sbtnDest_Screen.Visible := Value;
  CheckShowFirstAvailableDestination;
end;

procedure TFrmRepDef.CheckShowFirstAvailableDestination;
var
  APageIndex: Integer;
begin
  if not FShowFaxDestination then
    APageIndex := 0;

  if not FShowScreenDestination then
    APageIndex := 1;

  case APageIndex of
   0:
    begin
      sbtnDest_Screen.Down := True;
      sbtnDest_Screen.Click;
    end;
   1:
    begin
      sbtnDest_Printer.Down := True;
      sbtnDest_Printer.Click;
    end;
  end;
end;

function TFrmRepDef.GetOutputTo: TOutputTo;
begin
  //   TOutputTo = ( otNone, otWindow, otPrinter, otExport, otEmail, otFax );
  case pgctrDestination.ActivePageIndex of
   0: Result := otWindow;
   1: Result := otPrinter;
   2: Result := otExport;
   3: Result := otEmail;
   4: Result := otFax;
  end;
end;

procedure TFrmRepDef.SetOutputTo(const Value: TOutputTo);
begin
  case Value of
   otWindow:
     begin
       sbtnDest_Screen.Click;
       sbtnDest_Screen.Down:= True;
     end;
   otPrinter:
     begin
       sbtnDest_Printer.Click;
       sbtnDest_Printer.Down:= True;
     end;
   otExport:
     begin
       sbtnDest_File.Click;
       sbtnDest_File.Down:= True;
     end;
   otEmail:
     begin
       sbtnDest_EMail.Click;
       sbtnDest_EMail.Down:= True;
     end;
   otFax:
     begin
       sbtnDest_Fax.Click;
       sbtnDest_Fax.Down:= True;
     end;
  end;
end;

function TFrmRepDef.GetExportFileType: TExportOptions;
begin
  Result := IQMS.Common.PrintDialogsShare.GetSelectedExportOption(cboxFileType);
end;

procedure TFrmRepDef.SetExportFileType(const Value: TExportOptions);
begin
  IQMS.Common.PrintDialogsShare.SetSelectedExportOption(cboxFileType, Value);
end;

function TFrmRepDef.GetAttachmentFileType: TExportOptions;
begin
  Result := IQMS.Common.PrintDialogsShare.GetSelectedExportOption(cboxEMailFileType);
end;

procedure TFrmRepDef.SetAttachmentFileType(const Value: TExportOptions);
begin
  IQMS.Common.PrintDialogsShare.SetSelectedExportOption(cboxEMailFileType, Value);
end;

end.


