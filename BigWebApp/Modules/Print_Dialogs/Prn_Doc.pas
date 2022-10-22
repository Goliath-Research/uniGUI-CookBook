unit Prn_Doc;

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
  Data.DB,
  IQMS.Common.PanelMsg,
  Vcl.Buttons,
  Mask,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  IQMS.Common.PrintDialogsShare,
  IQMS.Common.UCRPE32,
  IQMS.WebVcl.FaxMan,
  IQMS.WebVcl.SoftEPlant,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  System.ImageList,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniImageList,
  uniTabControl,
  uniEdit,
  uniMemo,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel,
  uniPageControl, Vcl.ComCtrls, uniDBComboBox;

type
  { TFrmPrintDocsCustom }
  TFrmPrintDocsCustom = class(TUniForm)
    wwQryLookup: TFDQuery;
    SrcDocs: TDataSource;
    QryDocs: TFDQuery;
    SrcMain: TDataSource;
    QryMain: TFDQuery;
    QryDocsExt: TFDQuery;
    PageControl1: TUniPageControl;
    tabSelectionCriteria: TUniTabSheet;
    tabDestination: TUniTabSheet;
    pgctrDestination: TUniPageControl;
    tabScreen: TUniTabSheet;
    Label4: TUniLabel;
    tabPrinter: TUniTabSheet;
    tabFile: TUniTabSheet;
    tabEmail: TUniTabSheet;
    SaveDialog1: TSaveDialog;
    popmEmail: TUniPopupMenu;
    AddfromVendors1: TUniMenuItem;
    AddfromCustomers1: TUniMenuItem;
    PkEmailVendor: TIQWebHPick;
    PkEmailVendorVENDORNO: TStringField;
    PkEmailVendorCOMPANY: TStringField;
    PkEmailVendorLAST_NAME: TStringField;
    PkEmailVendorFIRST_NAME: TStringField;
    PkEmailVendorEMAIL: TStringField;
    PkEmailVendorCONTACT_PHONE_NUMBER: TStringField;
    PkEmailVendorADDR1: TStringField;
    PkEmailVendorADDR2: TStringField;
    PkEmailVendorCITY: TStringField;
    PkEmailVendorSTATE: TStringField;
    PkEmailVendorCOUNTRY: TStringField;
    PkEmailVendorZIP: TStringField;
    PkEmailVendorPHONE_NUMBER: TStringField;
    PkEMailCustomer: TIQWebHPick;
    PkEMailCustomerCUSTNO: TStringField;
    PkEMailCustomerCOMPANY: TStringField;
    PkEMailCustomerLAST_NAME: TStringField;
    PkEMailCustomerFIRST_NAME: TStringField;
    PkEMailCustomerEMAIL: TStringField;
    PkEMailCustomerCONTACT_PHONE_NUMBER: TStringField;
    PkEMailCustomerADDR1: TStringField;
    PkEMailCustomerADDR2: TStringField;
    PkEMailCustomerCITY: TStringField;
    PkEMailCustomerSTATE: TStringField;
    PkEMailCustomerCOUNTRY: TStringField;
    PkEMailCustomerZIP: TStringField;
    PkEMailCustomerPHONE_NUMBER: TStringField;
    Label3: TUniLabel;
    tabFax: TUniTabSheet;
    AddfromEmployees1: TUniMenuItem;
    PkEmployee: TIQWebHPick;
    PkEmployeeFIRST_NAME: TStringField;
    PkEmployeeLAST_NAME: TStringField;
    PkEmployeeEMAIL: TStringField;
    pnlButtons: TUniPanel;
    Splitter1: TUniSplitter;
    pnlButtonsRight: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    BtnProp: TUniButton;
    pnlFaxRight: TUniPanel;
    sbtnFax: TUniSpeedButton;
    sbtnFaxSetup: TUniSpeedButton;
    pnlFaxClient: TUniPanel;
    lviewFaxRecipients: TListView;
    pnlEmailRight: TUniPanel;
    sbtnAssignEmail: TUniSpeedButton;
    pnlEMailClient: TUniPanel;
    edEmailTo: TUniEdit;
    edSubject: TUniEdit;
    memoEmail: TUniMemo;
    cboxEMailFileType: TUniComboBox;
    pnlFileRight: TUniPanel;
    btnSaveFile: TUniSpeedButton;
    pnlFileClient: TUniPanel;
    edSaveFile: TUniEdit;
    cboxFileType: TUniComboBox;
    pnlCriteriaBottom: TUniPanel;
    lblPrinting: TUniLabel;
    edStatus: TUniEdit;
    pnlCriteriaTop: TUniPanel;
    Label1: TUniLabel;
    wwcombFrom: TUniDBLookupComboBox;
    pnlCriteriaRight: TUniPanel;
    Label2: TUniLabel;
    wwcombTo: TUniDBLookupComboBox;
    PnlDestFileLeft01: TUniPanel;
    Splitter2: TUniSplitter;
    Label6: TUniLabel;
    Label5: TUniLabel;
    PnlDestEMailLeft01: TUniPanel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Splitter3: TUniSplitter;
    PnlDestinationPCCarrier: TUniPanel;
    bvTopBuffer: TUniPanel;
    bvLeftBuffer: TUniPanel;
    bvRightBuffer: TUniPanel;
    bvBottomBuffer: TUniPanel;
    ImageList1: TUniImageList;
    Panel1: TUniPanel;
    TabControl1: TUniTabControl;
    SoftEPlant1: TIQWebSoftEPlant;
    PkEmailVendorTITLE: TStringField;
    PkEMailCustomerTITLE: TStringField;
    sbtnBoilerPlates: TUniSpeedButton;
    popmBoilerPlate: TUniPopupMenu;
    LoadfromBoilerPlate1: TUniMenuItem;
    N1: TUniMenuItem;
    ViewEditBoilerPlates1: TUniMenuItem;
    PkBoiler: TIQWebHPick;
    PkBoilerID: TBCDField;
    PkBoilerDESCRIP: TStringField;
    Label11: TUniLabel;
    EdAttachmentName: TUniEdit;
    SR: TIQWebSecurityRegister;
    lblOtherAttachments: TUniLabel;
    edOtherAttachments: TUniEdit;
    UserSignature1: TUniMenuItem;
    sbtnOtherAttachments: TUniSpeedButton;
    chkExcludeAttachedDocs: TUniCheckBox;
    ImageList2: TUniImageList;
    N2: TUniMenuItem;
    AddFromThisCustomer1: TUniMenuItem;
    AddFromThisVendor1: TUniMenuItem;
    AddFromThisEmployee1: TUniMenuItem;
    AddFromPickList1: TUniMenuItem;
    dsQryLookup: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnPropClick(Sender: TObject);
    procedure btnSaveFileClick(Sender: TObject);
    procedure AddfromVendors1Click(Sender: TObject);
    procedure sbtnAssignEmailClick(Sender: TObject);
    procedure sbtnFaxClick(Sender: TObject);
    procedure pgctrDestinationChange(Sender: TObject);
    procedure sbtnFaxSetupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure CheckLookupQueryOpen(Sender: TObject);
    procedure sbtnBoilerPlatesClick(Sender: TObject);
    procedure LoadfromBoilerPlate1Click(Sender: TObject);
    procedure ViewEditBoilerPlates1Click(Sender: TObject);
    procedure PkBoilerBeforeOpen(DataSet: TDataSet);
    procedure UserSignature1Click(Sender: TObject);
    procedure sbtnOtherAttachmentsClick(Sender: TObject);
    procedure PkEmailBeforeOpen(DataSet: TDataSet);
    procedure PkEmailIQAfterHPickCreate(Sender: TObject);
    procedure edSaveFileCustomDlg(Sender: TObject);
    procedure popmEmailPopup(Sender: TObject);
    procedure AddFromThisVendor1Click(Sender: TObject);
    procedure AddFromPickList1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cboxFileTypeCloseUp(Sender: TObject);
    procedure QryMainAfterScroll(DataSet: TDataSet);
    procedure UniFormDestroy(Sender: TObject);
  private type
    TFileNameElement = (feType, feNumber);
  private
    { Private declarations }
    HMsg: TPanelMesg;
    FFirstTimeFlag: Boolean;
    FOutputTo: TOutputTo;
    FCopies: Integer;
    FCollated: Boolean;
    FCrpeExportType: TCrExportType;
    FDNetExportType: TExportOptions;
    FStartPage: Integer;
    FStopPage: Integer;

    FDNetRepository: Variant;
    FRepositoryFiles: TStringList;

    FPickListShowInactiveRecords: Boolean;
    FThisArcusto_ID: Real;
    FThisVendor_ID: Real;
    FThisEmployee_ID: Real;
    FTouchScreen: Boolean;
    FUseDefaultPrinter: Boolean;
    FThisEPlant_ID: Real;

    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TDBRichEdit'
      procedure AssignDBRichEdit(ADBRichEdit: TDBRichEdit); }
    function GetPrintStatus: string;
    procedure SetPrintStatus(const AValue: string);
    procedure AddEMailFromPkList(APkList: TIQWebHPick);
    procedure AssignDestination(Crpe: TCrpe; CRDotNetObject: Variant);
    procedure GetDestination(var ADestination, ASpec: string);
    function GetDefaultReportOutputFileName(AReportName: string): string;
    function GetDefaultReportOutputFileName3(AReportName: string): string;
    function GetFileNameEx(QryDocsExt: TFDQuery; var AFileName: string)
      : Boolean;
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TDBRichEdit'
      function SaveBlobToFile(ADBRichEdit: TDBRichEdit;
      ADocumentDescription: string = ''): string; }
    procedure AddToRepDefLog(AStartTime: Real; AReportName: string);
    function PrintUsingDefaultAssociatedApplication(AFileName: AnsiString;
      AWaitForApplicationToFinish: Boolean = True): Boolean;
    procedure InitTempDocsPath;
    procedure AssignBoilerTextToMemo(AMemo: TUniMemo; ASubject: TUniEdit;
      ABoilerPlate_ID: Real);
    procedure CheckAddUserSignatureToEmailBody;
    procedure SetFilterPicklistInactiveRecords(Sender: TObject);
    procedure CheckAppendAutoEform(Sender: TObject; AReportName: string;
      ASelectionList: TStringList);
    procedure AssignFileNameBasedOnUserDefinedFormat(var AFileName: string);
    function MapFileNameFormatElementToData(AElement: string): string;
    function EliminateInvalidFileNameChars(S: string): string;
    function GetFileNameComplexElements(AElem: TFileNameElement): string;
    function AppendFileExt(AFileName: string): string;
    procedure AssignDestinationFileNameBackgroundColor;
    procedure SetThisArcusto_ID(const Value: Real);
    procedure SetThisEmployee_ID(const Value: Real);
    procedure SetThisVendor_ID(const Value: Real);
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    procedure IQNotifyMessage(var Msg: TMessage); message iq_Notify;
    procedure DeleteFilesInList(AList: TStringList);
    procedure DeleteTemporaryRepositoryFiles;
    function GetOutputTo: TOutputTo;
    procedure SetOutputTo(const Value: TOutputTo);
    function GetExportFileName: string;
    procedure SetExportFileName(const Value: string);
    procedure SetEmailAttachmentName(const Value: string);
    procedure SetEmailAttachmentType(const Value: TExportOptions);
    procedure SetEmailBodyText(const Value: string);
    procedure SetEmailRecipient(const Value: string);
    procedure SetEmailSubject(const Value: string);
    function GetEmailRecipient: string;
    function GetEmailAttachmentName: string;
    function GetEmailAttachmentType: TExportOptions;
    function GetEmailBodyText: string;
    function GetEmailSubject: string;
    function GetExcludeAttachedDocs: Boolean;
    procedure SetExcludeAttachedDocs(const Value: Boolean);
    procedure CheckAndFixFileTypeFileName;
    procedure LoadAttachedExternalDocs(var AExternalDocsList: TStringList);
    procedure SetToTxt(const Value: string);
    procedure SetFrom(const Value: string);
  protected
    FFaxMan: TFaxMan;
    FSendAutoEmailOnly: Boolean;
    FPrintOnlyNoEmail: Boolean;
    FSelectiveAutoEmail: Boolean;
    FEmailAttachmentList: TStringList;
    FTempDocsPath: string;
    FDefaultPrinterIndex: Integer;
    FCount: Integer;
    FExportFileNameBase: string;
    FExportFileName: string;
    FShowExportFile: Boolean;
    FEmailOtherAttachments: TStringList;
    FPrintFileNameFormatElementsUsed: string;
    FPrintSalesOrderReport: Boolean;
    FSilentPrintAutoEmail: Boolean;

    function AssignPrinterSettingsInternal(AComponent: TComponent;
      const AReportName: string; var ACopies: Integer; var ACollated: Boolean;
      var AStartPage: Integer; var AStopPage: Integer): Boolean; virtual;

    procedure AssignParams; virtual;
    function GetReportName(const AMfgType: string): string; virtual; abstract;

    function GetBeforeReport(const AMfgType: string): string; virtual; abstract;
    procedure AssignCriteria(SelectionList: TStringList); virtual;
    procedure ValidateRange; virtual;
    procedure SetPrintStatusVisible(AValue: Boolean);
    function ValidateReport: Boolean;
    function GetReportSubject: string; virtual;
    function GetTableNameForUpdatePrintCount: string; virtual;
    function GetPKFieldNameForUpdatePrintCount: string; virtual;
    procedure AfterReport;
    procedure ExecuteBeforeReport(ABeforeReport: string;
      QryMain: TFDQuery); virtual;

    procedure CheckPopulateFaxInfo;
    function SafeFieldAsStr(AFieldName, ADefaultValue: string): string;
    procedure UpdateFaxRecipients;
    procedure DoAfterCRWPrint(Sender: TObject; AReportName: string;
      ASelectionList, AExternalDocsList: TStringList;
      AFileName: string); virtual;
    function CheckIfEmailContactExists: Boolean; virtual;
    function CheckIfPrinted(ACount: Real; ADate, AUser: string)
      : Boolean; virtual;

    procedure CheckShowEPlant; virtual;
    procedure AssignEPlantDialogVisible(ALabel: TUniLabel;
      AwwDBComboDlg: TUniEdit);

    procedure AfterCreate; virtual;
    procedure ShowWarning; virtual;
    procedure AfterReport2; virtual;
    procedure AfterPrint; virtual;
    procedure SetTouchScreen(const Value: Boolean); virtual;
    procedure LoadFileTypeComboBox; virtual;
    function SelectedFileType_File: TExportOptions;
    function SelectedFileType_EmailAttachment: TExportOptions;
  public
    { Public declarations }
    /// <summary> Execute print action.  This is the same as clicking the
    /// OK button on the dialog box.
    /// </summary>
    procedure Print;

    property ReportName[const AMfgType: string]: string read GetReportName;
    property BeforeReport[const AMfgType: string]: string read GetBeforeReport;
    property PrintStatus: string read GetPrintStatus write SetPrintStatus;
    property ThisVendor_ID: Real read FThisVendor_ID write SetThisVendor_ID;
    property ThisArcusto_ID: Real read FThisArcusto_ID write SetThisArcusto_ID;
    property ThisEmployee_ID: Real read FThisEmployee_ID
      write SetThisEmployee_ID;
    property ThisEPlant_ID: Real read FThisEPlant_ID write FThisEPlant_ID;
    property TouchScreen: Boolean read FTouchScreen write SetTouchScreen;

    property OutputTo: TOutputTo read GetOutputTo write SetOutputTo;
    property ExportFileName: string read GetExportFileName
      write SetExportFileName;
    property EmailRecipient: string read GetEmailRecipient
      write SetEmailRecipient;
    property EmailSubject: string read GetEmailSubject write SetEmailSubject;
    property EmailBodyText: string read GetEmailBodyText write SetEmailBodyText;
    property EmailAttachmentName: string read GetEmailAttachmentName
      write SetEmailAttachmentName;
    property EmailAttachmentType: TExportOptions read GetEmailAttachmentType
      write SetEmailAttachmentType;
    property UseDefaultPrinter: Boolean read FUseDefaultPrinter
      write FUseDefaultPrinter;
    property PrintCopies: Integer read FCopies write FCopies;
    property PrintCollated: Boolean read FCollated write FCollated;
    property ExcludeAttachedDocs: Boolean read GetExcludeAttachedDocs
      write SetExcludeAttachedDocs;
    property ToTxt: string write SetToTxt;
    property From: string write SetFrom;

    class function GetReportNameEx(AReportFieldName: string;
      const Params: array of Variant): string; virtual;
    class procedure DoShow(AFrom, ATo: string;
      const ATouchScreen: Boolean = False);
    class procedure GetExternalDocsList(AFrom, ATo: string;
      var AExternalDocsList: TStringList);
  end;

implementation

{$R *.DFM}

uses
  BoilSel,
  CommDlg,
  // WEB_CONVERT EditMemoStr,
  IQMS.Common.EmailUtils,
  // WEB_CONVERT FM_Params,
  IQMS.Common.BMP,
  IQMS.Common.Controls,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.FaxDialog,
  IQMS.Common.FileUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Web.MicrosoftExcel.Utils,
  IQMS.Web.MicrosoftWord.Utils,
  IQMS.Common.Print,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.RepDefVersions,
  IQMS.Common.Screen,
  IQMS.WebVcl.Search,
  // WEB_CONVERT IQSearchPickList,
  // WEB_CONVERT IQSecIns,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  // WEB_CONVERT mailto_pick,
  // WEB_CONVERT prn_filename_format,
  // WEB_CONVERT prn_other_attachments,
  IQMS.Qc_Doc.qc_doc_const,
  IQMS.Qc_Doc.qc_doc_dnet,
  IQMS.Qc_Doc.qc_doc_share,
  System.Math,
  System.Variants,
  // WEB_CONVERT touchscrn,
  Vcl.Printers,
  IQMS.WebVcl.ResourceStrings,
  Winapi.ShellAPI;

{ TFrmPrintDocsCustom }

class procedure TFrmPrintDocsCustom.DoShow(AFrom, ATo: string;
  const ATouchScreen: Boolean);
var
  LFrm: TFrmPrintDocsCustom;
begin
  LFrm := Self.Create(uniGUIApplication.UniApplication);
  LFrm.ToTxt := ATo;
  LFrm.From := AFrom;
  LFrm.TouchScreen := ATouchScreen;
  LFrm.Show;
end;

class procedure TFrmPrintDocsCustom.GetExternalDocsList(AFrom, ATo: string;
  var AExternalDocsList: TStringList);
var
  LFrm: TFrmPrintDocsCustom;
begin
  LFrm := Self.Create(uniGUIApplication.UniApplication);
  LFrm.ToTxt := ATo;
  LFrm.From := AFrom;
  LFrm.LoadAttachedExternalDocs(AExternalDocsList);
end;

procedure TFrmPrintDocsCustom.FormCreate(Sender: TObject);
begin
  FTouchScreen := False;

  FFaxMan := TFaxMan.Create;
  FStartPage := 0;
  FStopPage := 0;
  FThisArcusto_ID := 0;
  FThisVendor_ID := 0;
  FThisEmployee_ID := 0;
  FThisEPlant_ID := 0;
  FUseDefaultPrinter := False;
  FEmailAttachmentList := TStringList.Create;
  FEmailOtherAttachments := TStringList.Create;
  FRepositoryFiles := TStringList.Create;

  InitTempDocsPath;

  { TODO -oBantuK -cWEB_CONVERT : Incompatible types: 'TForm' and 'TFrmPrintDocsCustom'
    IQMS.Common.Controls.CenterForm(Self); }

  { TODO -oBantuK -cWEB_CONVERT :
    Undeclared identifier: 'LookupValue'
    Undeclared identifier: 'LookupValue'
    wwcombFrom.LookupValue := AFrom;
    wwcombTo.LookupValue := ATo; }

  { TODO -oBantuK -cWEB_CONVERT : Replaced with property.
    wwcombFrom.Text := From;
    wwcombTo.Text := ToTxt; }

  PageControl1.ActivePageIndex := 0;
  pgctrDestination.ActivePageIndex := 0;

  // internationalization
  FPrintFileNameFormatElementsUsed :=
    Format('%s;%s;%s;%s', [GetFileFormatElementName('type'),
    GetFileFormatElementName('number'), GetFileFormatElementName('date'),
    GetFileFormatElementName('company')]);
  AssignDestinationFileNameBackgroundColor;
  AfterCreate;

  DeleteTemporaryRepositoryFiles;

  // PostMessage(Handle, iq_AfterShowMessage, 0, 0);
  // 08-29-2012 fix display issue

  IQSetTablesActiveEx(True, Self, '');

  // 08/06/2015 See below
  LoadFileTypeComboBox;
  // with cboxEMailFileType do ItemIndex:= 4; // default to pdf 12-11-07

  IQMS.Common.Controls.AdjustPageControlToParent(pgctrDestination);

  CheckShowEPlant;

  CheckAddUserSignatureToEmailBody;

  // 09-05-201 use CRM standard picklist - keep these invisible for now just in case
  AddfromVendors1.Visible := False;
  AddfromEmployees1.Visible := False;
  AddfromCustomers1.Visible := False;

  BtnProp.Visible := SR.Visible['BtnProp'];
  BtnProp.Enabled := SR.Enabled['BtnProp'];
end;

procedure TFrmPrintDocsCustom.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, pnlButtons, PnlDestFileLeft01, PnlDestEMailLeft01,
    chkExcludeAttachedDocs]);
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'EnsureSecurityInspectorOnTopOf'
    EnsureSecurityInspectorOnTopOf(Self); }
  IQMS.Common.Controls.AdjustControlWidthToParentA(pnlFileClient, 2);
  IQMS.Common.Controls.AdjustControlWidthToParentA(pnlEMailClient, 2);
  { TODO -oBantuK -cWEB_CONVERT :  Incompatible types: 'TForm' and 'TFrmPrintDocsCustom'
    IQMS.Common.Controls.ResizeCheckBoxes(Self, pnlCriteriaTop); }
  if Width < Constraints.MinWidth then
    Width := Constraints.MinWidth;

  if Height < Constraints.MinHeight then
    Height := Constraints.MinHeight;

  PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmPrintDocsCustom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if not FTouchScreen then
    IQRegFormWrite(Self, [Self, pnlButtons, PnlDestFileLeft01,
      PnlDestEMailLeft01, chkExcludeAttachedDocs]);
end;

procedure TFrmPrintDocsCustom.IQAfterShowMessage(var Msg: TMessage);
begin
  // 08-29-2012 fix display issues - not sure what is causing it but akBottom alignment
  // for the following 3 labels kicks in only *after* the form is shown
  Label9.Top := cboxEMailFileType.Top + 4; { Attachment }
  Label11.Top := EdAttachmentName.Top + 4; { Attachment Name }
  lblOtherAttachments.Top := edOtherAttachments.Top + 4; { Othe Attachment }
end;

procedure TFrmPrintDocsCustom.LoadFileTypeComboBox;
begin
  // File
  LoadRepDefFileTypeCombo_PrnDlg(cboxFileType);
  // Email Attachment
  LoadRepDefFileTypeCombo_PrnDlg(cboxEMailFileType);
end;

procedure TFrmPrintDocsCustom.ValidateRange;
begin
  { TODO -oBantuK -cWEB_CONVERT : E2003 Undeclared identifier: 'DisplayValue'
    if wwcombFrom.DisplayValue > wwcombTo.DisplayValue then
    // 'Invalid range: ''From'' must not be greater than ''To'' (character based)'
    raise Exception.Create(IQMS.Common.ResStrings.cTXT0000209);
  }
end;

function TFrmPrintDocsCustom.GetReportSubject: string;
begin
  Result := IQMS.Common.ResStrings.cTXT0000210;
  // 'This report'  {Is used in ValidateReport. Overwritten in PO: PO# 123, SO - Sales Order# 123 etc }
end;

function TFrmPrintDocsCustom.ValidateReport: Boolean;
var
  AField: TField;
  ACount: Real;
  AUser: string;
  ADate: string;
begin
  Result := True;

  if FSilentPrintAutoEmail then
    Exit;

  with QryMain do
  begin
    AField := FindField('print_count');
    if (AField = nil) or (AField.asFloat = 0) then
      Exit;
    ACount := AField.asFloat;
    AUser := 'N/A';
    ADate := 'N/A';

    AField := FindField('print_last_user');
    if AField <> nil then
      AUser := AField.asString;

    AField := FindField('print_last_date');
    if AField <> nil then
      ADate := AField.asString;
    // '%s has been printed %.0f time(s)'#13#13'Last printed on %s by %s'#13#13'Abort printing?'
    if CheckIfPrinted(ACount, ADate, AUser) then
      Result := False;
  end;
end;

function TFrmPrintDocsCustom.CheckIfPrinted(ACount: Real;
  ADate, AUser: string): Boolean;
begin
  Result := IQWarningYN(Format(IQMS.Common.ResStrings.cTXT0000211,
    [GetReportSubject, ACount, ADate, AUser]));
end;

function TFrmPrintDocsCustom.GetTableNameForUpdatePrintCount: string;
begin
  Result := '';
end;

function TFrmPrintDocsCustom.GetPKFieldNameForUpdatePrintCount: string;
begin
  Result := 'ID';
end;

procedure TFrmPrintDocsCustom.AfterReport;
begin
  if GetTableNameForUpdatePrintCount > '' then
    with QryMain do
      ExecuteCommandFmt('update %s set print_count = NVL(print_count,0) + 1, ' +
        '              print_last_user = ''%s'',             ' +
        '              print_last_date = to_date(''%s'', ''MM/DD/RRRR HH24:MI:SS'') '
        + '        where ID = %f', [GetTableNameForUpdatePrintCount,
        { Orders, PO, arprepost, shipments }
        SecurityManager.UserName, FormatDateTime('mm/dd/yyyy hh:nn:ss', Now),
        FieldByName(GetPKFieldNameForUpdatePrintCount).asFloat]);
  { Normally - ID. For WO - workorder_id }
end;

procedure TFrmPrintDocsCustom.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrintDocsCustom.btnOKClick(Sender: TObject);
begin
  // Execute print.  See below.
  Print;
end;

procedure TFrmPrintDocsCustom.Print;
const
  WAIT_FOR_APPLICATION_TO_FINISH = True;
var
  SelectionList: TStringList;
  // WEB_CONVERT ADBRichEdit: TDBRichEdit;
  AReportName: string;
  ABeforeReport: string;
  AFileName: string;
  AStartTime: TDateTime;
  ADocIsPrinted: Boolean;
  AOnlyEMail: Boolean;
  ATempFilesList: TStringList;
begin
  // Initialize or reset these variables
  FExportFileNameBase := '';
  FExportFileName := '';
  FShowExportFile := False;

  AssignParams; { Assign From/To and Open 3 Queries }
  ValidateRange;
  FFirstTimeFlag := True;

  CheckAndFixFileTypeFileName;

  // WEB_CONVERT ADBRichEdit := TDBRichEdit.Create(Self);
  try
    // WEB_CONVERT AssignDBRichEdit(ADBRichEdit);
    SelectionList := TStringList.Create;
    try
      ATempFilesList := TStringList.Create;
      try
        SetPrintStatusVisible(True);
        try
          if QryMain.Bof and QryMain.Eof then
            ShowWarning;
          // 'No records found based on entered criteria.  Please check From and To values.';

          FCount := 0;
          while not QryMain.Eof do
          begin
            FCount := FCount + 1;
            AOnlyEMail := (FSelectiveAutoEmail and CheckIfEmailContactExists);
            FEmailAttachmentList.Clear;
            AssignCriteria(SelectionList);
            AReportName := ReportName[QryMain.FieldByName('mfg_type').asString];
            ABeforeReport := BeforeReport[QryMain.FieldByName('mfg_type')
              .asString];

            if not ValidateReport() then
            begin
              QryMain.Next;
              CONTINUE;
            end;

            if Trim(ABeforeReport) <> '' then
            begin
              HMsg := hPleaseWait
                (Format(IQMS.Common.ResStrings.cTXT0000213 { 'Running %s...' } ,
                [ABeforeReport]));
              try
                // ExecuteCommandFmt('begin CRW_BEFORE_EXEC.%s(%s); end;', [ABeforeReport, QryMain.Fields[ 0 ].asString]);
                ExecuteBeforeReport(ABeforeReport, QryMain);
              finally
                HMsg.Free;
              end;
            end;

            PrintStatus :=
              Format(IQMS.Common.ResStrings.
              cTXT0000214 { 'Report - %s [%s = %s]' } ,
              [AReportName, QryMain.Fields[0].FieldName,
              QryMain.Fields[0].asString]);

            // print report
            AStartTime := Now;
            if not AOnlyEMail and not FSendAutoEmailOnly then
            begin
              EnsureSoftEPlantExists;
              try
                // If overriding the logged-in EPlant ID, set the value here.
                if FThisEPlant_ID > 0 then
                  SoftEPlant1.EPlant_ID := FloatToStr(ThisEPlant_ID);
                AssignSoftEPlant(SoftEPlant1);
                PrintDefaultReportExC(AReportName, SelectionList, Self,
                  AssignDestination);
              finally
                ReleaseSoftEPlant;
              end;
            end;
            AddToRepDefLog(AStartTime, AReportName);

            Application.ProcessMessages;

            { 12-11-2007 used for auto_eform }

            if AOnlyEMail or (not FPrintOnlyNoEmail and not FSelectiveAutoEmail)
            then
              CheckAppendAutoEform(Self, AReportName, SelectionList);

            { internal docs }
            if not AOnlyEMail and not FSendAutoEmailOnly and
              not chkExcludeAttachedDocs.Checked then
              while not QryDocs.Eof do
              begin
                PrintStatus :=
                  Format(IQMS.Common.ResStrings.
                  cTXT0000215 { 'Internal Document - %s' } ,
                  [QryDocs.FieldByName('descrip').asString]);
                case FOutputTo of
                  otPrinter:
                    begin
                      { TODO -oBantuK -cWEB_CONVERT : There is no equivalent component for RichEdit
                        ADBRichEdit.Print(QryDocs.FieldByName('descrip')
                        .asString); }
                    end;
                  otFax:
                    begin
                      // WEB_CONVERT AFileName := SaveBlobToFile(ADBRichEdit);
                      FFaxMan.AddAttachment(AFileName,
                        True { move on submit. default is copy } );
                    end;
                  otEmail:
                    begin
                      { TODO -oBantuK -cWEB_CONVERT : Function defination is commented out so commenting out the calling.
                        AFileName := SaveBlobToFile(ADBRichEdit,
                        QryDocs.FieldByName('descrip').asString);
                        FEmailAttachmentList.Add(AFileName); }
                      ATempFilesList.Add(AFileName);
                      { 04-23-2013 keep track of temp files to be deleted }
                    end;
                end;
                Application.ProcessMessages;
                QryDocs.Next;
              end;

            { process external docs }
            if not AOnlyEMail and not FSendAutoEmailOnly and
              not chkExcludeAttachedDocs.Checked then
              try
                { make it default Winapi.Windows printer }
                if (FOutputTo = otPrinter) then
                  IQMS.Common.Miscellaneous.ChangeWindowsDefaultPrinter
                    (Printer.Printers[Printer.PrinterIndex]);

                while not QryDocsExt.Eof do
                begin
                  if GetFileNameEx(QryDocsExt, AFileName) then
                  begin
                    PrintStatus :=
                      Format(IQMS.Common.ResStrings.
                      cTXT0000216 { 'External Document - %s' } ,
                      [QryDocsExt.FieldByName('filename').asString]);

                    case FOutputTo of
                      otPrinter:
                        begin
                          // IQShellExecute( AFileName, 'print' );     {IQMS.WebVcl.DocumentsExternal.pas}
                          ADocIsPrinted := False;

                          { try COM servers first }
                          // 06-28-2012 Document Print With - .txt file is printing to Word instead of Notepad- CRM# 648876 - take .txt out
                          if StrInList(ExtractFileExt(AFileName),
                            ['.doc', '.rtf', '.docx']) then
                            ADocIsPrinted :=
                              IQMS.Web.MicrosoftWord.Utils.PrintMSWordDoc
                              (AFileName)

                          else if StrInList(ExtractFileExt(AFileName),
                            ['.xls', '.xlsx']) then
                            ADocIsPrinted :=
                              IQMS.Web.MicrosoftExcel.Utils.
                              PrintExcelSpreadSheet(AFileName)

                          else if IQMS.Common.StringUtils.StrInList
                            (ExtractFileExt(AFileName),
                            ['.pdf', '.tiff', '.tif']) then
                            ADocIsPrinted :=
                              PrintUsingDefaultAssociatedApplication(AFileName,
                              not WAIT_FOR_APPLICATION_TO_FINISH);

                          { if not doc or xls type OR printing failed - go for the default }
                          if not ADocIsPrinted then
                            PrintUsingDefaultAssociatedApplication(AFileName);

                          Application.ProcessMessages;

                          IQMS.Common.Miscellaneous.
                            EnsureZeroJobsInPrintQueue();
                          // Sleep(15000);                             {Sometimes ShellExecute cannot print 2 docs back to back too fast}
                        end;

                      otFax:
                        begin
                          FFaxMan.AddAttachment(AFileName);
                        end;

                      otEmail:
                        begin
                          FEmailAttachmentList.Add(AFileName);
                        end;
                    end;

                  end;
                  QryDocsExt.Next;
                end;
              finally
                { restore default Winapi.Windows printer }
                if (FOutputTo = otPrinter) then
                  ChangeWindowsDefaultPrinter
                    (Printer.Printers[FDefaultPrinterIndex]);
              end;

            { process specific output }
            case FOutputTo of
              otEmail:
                begin
                  AFileName := GetDefaultReportOutputFileName3(AReportName);
                  FEmailAttachmentList.Insert(0, AFileName);
                  ATempFilesList.Add(AFileName);
                  { keep track of temp files to be deleted }

                  { 03-03-2011 add other attachments }
                  FEmailAttachmentList.AddStrings(FEmailOtherAttachments);

                  IQMS.Common.EmailUtils.IQSendMailA(edEmailTo.Text,
                    // ARecipient (string)
                    edSubject.Text, // ASubject (string)
                    memoEmail.Lines.Text, // ABodyText (string)
                    FEmailAttachmentList, // AAttachments (TStringList)
                    True); // Send Now

                  DeleteFilesInList(ATempFilesList);
                end;

              otFax:
                FFaxMan.SubmitXML; { IQFaxMan }
            end;

            AfterReport;
            AfterReport2;

            // 02/24/2016 If a file was exported, and it is a PDF,
            // then display the file
            if FShowExportFile and (FExportFileName > '') and
              FileExists(FExportFileName) then
              ExecuteProgram(FExportFileName);

            QryMain.Next;
          end;

        finally
          SetPrintStatusVisible(False);
        end;
      finally
        ATempFilesList.Free;
      end;
    finally
      SelectionList.Free;
    end;
  finally
    // WEB_CONVERT ADBRichEdit.Free;
  end;

  AfterPrint;

  if FOutputTo <> otWindow then
  begin
    if not FPrintSalesOrderReport then
      Close;
  end;
end;

(* TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TDBRichEdit'
  function TFrmPrintDocsCustom.SaveBlobToFile(ADBRichEdit: TDBRichEdit;
  ADocumentDescription: string = ''): string;
  var
  ABlobField: TBlobField;
  AFileName: string;

  function DeriveFileNameFrom(S: string): string;
  begin
  S := StrTran(StrTran(StrTran(StrTran(StrTran(S, '.', '_'), '\', '_'), ':',
  '_'), ' ', '_'), '''', '_');
  Result := S;
  end;

  begin
  AFileName := GetRandomName();
  if ADocumentDescription > '' then
  AFileName := DeriveFileNameFrom(ADocumentDescription) + ' ' + AFileName;

  ABlobField := ADBRichEdit.DataSource.DataSet.FieldByName('DOC_BLOB')
  as TBlobField;
  if FieldIsImage(ABlobField) then { IQMS.Common.BMP.pas }
  Result := FTempDocsPath + ChangeFileExt(AFileName, '.bmp') { IQMS.Common.Miscellaneous.pas }
  else
  Result := FTempDocsPath + ChangeFileExt(AFileName, '.doc');

  ABlobField.SaveToFile(Result);
  end;
*)

procedure TFrmPrintDocsCustom.AssignDestination(Crpe: TCrpe;
  CRDotNetObject: Variant);
var
  AReportName: string;
begin
  // Initialize variables
  AReportName := ReportName[QryMain.FieldByName('mfg_type').asString];

  // First, before assigning any Crystal settings, get the output type
  // based on the tab sheet.
  if pgctrDestination.ActivePage = tabScreen then
    FOutputTo := otWindow
  else if pgctrDestination.ActivePage = tabPrinter then
    FOutputTo := otPrinter
  else if pgctrDestination.ActivePage = tabFile then
    FOutputTo := otExport
  else if pgctrDestination.ActivePage = tabEmail then
    FOutputTo := otEmail
  else if pgctrDestination.ActivePage = tabFax then
    FOutputTo := otFax
  else
    FOutputTo := otNone;

  // Show the "Printer" dialog first, in case the IQMS_PDF_Printer is
  // selected.
  // 08/10/2015 If UseDefaultPrinter, then this dialog relies on
  // PrintCopies and PrintCollated already to be populated.
  if (FOutputTo = otPrinter) and not UseDefaultPrinter and FFirstTimeFlag then
  begin
    if not AssignPrinterSettingsInternal(Self,
      ExtractFileName(GetReportPathName(Crpe, CRDotNetObject)), FCopies,
      FCollated, FStartPage, FStopPage) then
      System.SysUtils.Abort;
  end;

  // If the user has chosen the IQMS_PDF_Printer, set the output type to export.
  if (FOutputTo in [otPrinter]) and
    (CompareText(IQMS.Common.Print.IQMS_PDF_Printer,
    Printer.Printers[Printer.PrinterIndex]) = 0) then
    FOutputTo := otExport;

  // Get the "base" file name.  The base filename is used in case of
  // looping, in which more than one file is generated.
  if (FOutputTo = otExport) and FFirstTimeFlag then
  begin
    // User-defined file name
    if pgctrDestination.ActivePage = tabFile then
      FExportFileNameBase := Trim(edSaveFile.Text)
      // All other cases:  a PDF will be generated.
    else
      // FExportFileNameBase := ChangeFileExt(AReportName, '.pdf');
      // Prompt the user for the PDF file name
      with TSaveDialog.Create(nil) do
        try
          DefaultExt := '.pdf';
          FileName := ChangeFileExt(AReportName, '.pdf');
          // IQMS.Common.ResStrings.cTXT0000498 = 'PDF File (*.pdf)';
          Filter := IQMS.Common.ResStrings.cTXT0000498;
          // If the user selects or sets a file name, then we use
          // it; otherwise, we must abort printing because an
          // error will be raised by the Nova driver.
          if Execute then
            FExportFileNameBase := FileName
          else
            System.SysUtils.Abort;
        finally
          Free;
        end;
    // Initialize to the base file name.  This may be changed below.
    FExportFileName := FExportFileNameBase;
  end;

  // Based on the export type, populate the Crystal settings.
  case FOutputTo of
    otWindow:
      begin
        SetDestinationToScreen(Crpe, CRDotNetObject);
      end;
    otPrinter:
      begin
        SetDestinationToPrinter(Crpe, CRDotNetObject);
        AssignPrintOptionNumCopies(Crpe, CRDotNetObject, FCopies);
        AssignPrintOptionCollated(Crpe, CRDotNetObject, FCollated);
        AssignPrintOptionPrintRange(Crpe, CRDotNetObject, FStartPage,
          FStopPage);
      end;
    otExport:
      begin
        // Depending on how many times the loop has arrived here,
        // ensure the file name is unique by appending a number.
        FExportFileName := Trim(FExportFileNameBase);
        if (FExportFileName > '') and (FCount > 1) then
          FExportFileName := System.SysUtils.IncludeTrailingPathDelimiter
            (ExtractFilePath(FExportFileName)) + Format('%s (%d)%s',
            [IQMS.Common.FileUtils.FileNameNoExt(FExportFileName), FCount,
            ExtractFileExt(FExportFileName)]);

        // if user did not enter the file name then attempt to
        // determine the filename based on user defined format
        // (type, number, date, company)
        if Trim(FExportFileName) = '' then
          AssignFileNameBasedOnUserDefinedFormat(FExportFileName);

        // Set flag to show the file when done
        FShowExportFile := True;

        // IQMS.Common.ResStrings.cTXT0000416 = 'Undefined filename - operation aborted'
        IQAssert(FExportFileName > '', IQMS.Common.ResStrings.cTXT0000416);

        { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmRepDef'
          SetDestinationToFile(Crpe, CRDotNetObject, cboxFileType,
          TFrmRepDef.DefaultToMasterPath(FExportFileName)); }{ IQRepDefVersions.pas }

        // Pass rpt object to retreive Export type into relative ExportType field
        // Declared in IQRepDefVersions.pas
        AssignExportType(Crpe, CRDotNetObject, FCrpeExportType,
          FDNetExportType);
      end;
    otEmail:
      begin
        // Email is required
        IQAssert(Trim(edEmailTo.Text) > '', IQMS.Common.ResStrings.cTXT0000217);

        { TODO -oBantuK -cWEB_CONVERT : Incompatible types: 'TComboBox' and 'TUniComboBox'
          AssignTargetFileType(Crpe, CRDotNetObject, cboxEMailFileType); }

        // Pass rpt object to retreive Export type into relative ExportType field
        AssignExportType(Crpe, CRDotNetObject, FCrpeExportType,
          FDNetExportType);

        { TODO -oBantuK -cWEB_CONVERT : Incompatible types: 'TComboBox' and 'TUniComboBox'
          SetDestinationToEmail(
          Crpe,
          CRDotNetObject,
          cboxEMailFileType,
          GetDefaultReportOutputFileName(
          GetReportPathName2(Crpe, CRDotNetObject, EdAttachmentName.Text)));
        }
      end;
    otFax:
      begin
        SetDestinationToFax(Crpe, CRDotNetObject, FFaxMan.ReportTempFileName);
      end
  else
    Exit;
  end;

  FFirstTimeFlag := False;
end;

procedure TFrmPrintDocsCustom.GetDestination(var ADestination, ASpec: string);
begin
  case FOutputTo of
    otWindow:
      begin
        ADestination := 'Screen';
        ASpec := '';
      end;

    otPrinter:
      begin
        ADestination := 'Printer';
        ASpec := Printer.Printers[Printer.PrinterIndex];
      end;

    otExport:
      begin
        ADestination := 'File';
        { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmRepDef'
          ASpec := TFrmRepDef.DefaultToMasterPath(edSaveFile.Text); }
      end;

    otEmail:
      begin
        ADestination := 'EMail';
        ASpec := Trim(edEmailTo.Text);
      end;

    otFax:
      begin
        ADestination := 'Fax';
        ASpec := FFaxMan.FRecipients.Text;
      end;
  end;
end;

function TFrmPrintDocsCustom.GetDefaultReportOutputFileName
  (AReportName: string): string;
begin
  Result := IQGetLocalHomePath + ChangeFileExt(ExtractFileName(AReportName),
    ExportFileTypeExt[FDNetExportType]);
end;

function TFrmPrintDocsCustom.GetDefaultReportOutputFileName3
  (AReportName: string): string;
var
  AFileName: string;
begin
  AFileName := ExtractFileName(AReportName);
  if FOutputTo = otEmail then
  begin
    if EdAttachmentName.Text <> '' then
      AFileName := EdAttachmentName.Text;
  end;
  Result := IQGetLocalHomePath + ChangeFileExt(AFileName,
    ExportFileTypeExt[FDNetExportType]);
end;

procedure TFrmPrintDocsCustom.SetPrintStatusVisible(AValue: Boolean);
begin
  if not AValue then
  begin
    edStatus.Text := '';
    edStatus.Update;
  end;
end;

function TFrmPrintDocsCustom.GetPrintStatus: string;
begin
  Result := edStatus.Text;
end;

procedure TFrmPrintDocsCustom.SetPrintStatus(const AValue: string);
begin
  if AValue <> edStatus.Text then
  begin
    edStatus.Text := AValue;
    edStatus.Update;
  end;
end;

{ TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TDBRichEdit'
  procedure TFrmPrintDocsCustom.AssignDBRichEdit(ADBRichEdit: TDBRichEdit);
  begin
  with ADBRichEdit do
  begin
  Parent := Self;
  Visible := False;
  DataSource := SrcDocs;
  if SrcDocs.DataSet.FindField('DOC_BLOB') <> nil then
  DataField := 'DOC_BLOB';
  end;
  end;
}

procedure TFrmPrintDocsCustom.AssignCriteria(SelectionList: TStringList);
begin
end;

procedure TFrmPrintDocsCustom.AssignParams;
begin
  FDefaultPrinterIndex := IQMS.Common.Miscellaneous.FPrinterIndexOnStartUp;

  QryMain.Close;
  if Assigned(QryMain.Params.FindParam('param1')) then
    QryMain.ParamByName('param1').DataType := ftString;
  if Assigned(QryMain.Params.FindParam('param2')) then
    QryMain.ParamByName('param2').DataType := ftString;
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DisplayValue'
    AssignQueryParamValue(QryMain, 'param1', wwcombFrom.DisplayValue);
    AssignQueryParamValue(QryMain, 'param2', wwcombTo.DisplayValue); }

  QryMain.Open;

  // These queries will get open in QryMain.AfterScroll
  // ReOpen(QryDocs);
  // ReOpen(QryDocsExt);
end;

procedure TFrmPrintDocsCustom.BtnPropClick(Sender: TObject);
begin
  //
end;

procedure TFrmPrintDocsCustom.btnSaveFileClick(Sender: TObject);
var
  ASelFileType, o: TExportOptions;
  AFilterIndex, I: Integer;
begin
  // Get the selected file type
  with SaveDialog1 do
  begin
    // Set the initial directory to the local home
    if InitialDir = '' then
      InitialDir := IQGetLocalHomePath;
    // Get the selected file type (on this form)
    ASelFileType := SelectedFileType_File;
    // Populate the dialog filter
    SaveDialog1.Filter := '';
    AFilterIndex := 0;
    for o in PrintDlgFileTypes do
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
      // Change the file extension for the selected file type.
      if FilterIndex > 0 then
      begin
        // Initialize
        I := -1;
        // Loop the array
        for o in PrintDlgFileTypes do
        begin
          // Increment the index
          Inc(I);
          // Compare indexes
          if I = FilterIndex - 1 then
          begin
            // Set the variable for the file type
            ASelFileType := o;
            // Done looping
            Break;
          end;
        end;
        // Change the file extension
        edSaveFile.Text := ChangeFileExt(FileName,
          ExportFileTypeExt[ASelFileType]);
        // Set the type in the combo box
        SetSelectedExportOption(cboxFileType, ASelFileType);
      end
      /// If all else fails, just set the file name
      else
        edSaveFile.Text := FileName;
    end;
    InitialDir := GetCurrentDir;
  end;
end;

procedure TFrmPrintDocsCustom.CheckAndFixFileTypeFileName;
begin
  if (pgctrDestination.ActivePage = tabFile) and (edSaveFile.Text > '') then
    edSaveFile.Text := ChangeFileExt(edSaveFile.Text,
      ExportFileTypeExt[SelectedFileType_File]);
end;

procedure TFrmPrintDocsCustom.cboxFileTypeCloseUp(Sender: TObject);
begin
  CheckAndFixFileTypeFileName;
end;

procedure TFrmPrintDocsCustom.AddfromVendors1Click(Sender: TObject);
begin
  // These properties are assigned on menu popup (every time) -
  // ensure regular picklists are not confined to this Vendor/Customer/Employee
  ThisArcusto_ID := 0;
  ThisVendor_ID := 0;
  ThisEmployee_ID := 0;
end;

procedure TFrmPrintDocsCustom.AddEMailFromPkList(APkList: TIQWebHPick);
var
  I: Integer;
  AEMail: string;
  ABlankEMailCount: Integer;
begin
  ABlankEMailCount := 0;
  FPickListShowInactiveRecords := False;

  with APkList do
    if ExecuteEx('EMAIL') then
    begin
      for I := 0 to ResultList.Count - 1 do
      begin
        AEMail := Trim(ResultList[I]);
        if AEMail > '' then
        begin
          if edEmailTo.Text = '' then
            edEmailTo.Text := AEMail
          else
            edEmailTo.Text := edEmailTo.Text + ';' + AEMail;
        end
        else
          Inc(ABlankEMailCount);
      end;

      // 'The system has identified and skipped blank email addresses (%d).
      if ABlankEMailCount > 0 then
        IQConfirm(Format(IQMS.Common.ResStrings.cTXT0000386,
          [ABlankEMailCount]));
    end;
end;

procedure TFrmPrintDocsCustom.sbtnAssignEmailClick(Sender: TObject);
var
  P: TPoint;
begin
  with sbtnAssignEmail do
  begin
    P.y := Height;
    P.x := Left;
    P := pnlEmailRight.ClientToScreen(P);
    popmEmail.Popup(P.x, P.y);
  end;
end;

function TFrmPrintDocsCustom.GetFileNameEx(QryDocsExt: TFDQuery;
  var AFileName: string): Boolean;
var
  A: Variant;
  AStatus: string;
  AKeep_Revisions: string;
  AExternal_Doc_ID: Real;
  ARevision_Path: string;
  ADeactive_Date: TDateTime;
  ADescrip: string;
  AType: string;
  AAlias: string;
  APassword: string;
  ADoc_Repository_ID: Real;
  ADoc_Revision_ID: Real;
  AConvertToPDFDisplay: Boolean;

  function _GetPdfFileName(AFileName: string): string;
  begin
    Result := ChangeFileExt(AFileName, '.PDF');
  end;

  function IsRepositoryKind: Boolean;
  begin
    Result := (CompareText(AType, 'Repository') = 0);
  end;

  procedure SaveRepositoryToLocalFile(var AFileName: string;
    APrev_Doc_Revision_ID: Real);
  var
    ADoc_Repository_ID: Real;
    APath: string;
  begin
    ADoc_Repository_ID := SelectValueByID('doc_repository_id', 'doc_revision',
      APrev_Doc_Revision_ID);

    if ADoc_Repository_ID = 0 then
      raise Exception.Create('Repository record ID is not assigned');

    if not EstablishRepositoryAccess(FDNetRepository, AAlias, CharXOR(APassword))
    then { qc_doc_share.pas }
      Abort;

    { store the repository file in a temp folder c:\iqwin\temp\arik\123.txt }
    if (SecurityManager <> nil) then
      APath := Format('%s\temp\%s\repository',
        [ExcludeTrailingBackslash(IQGetLocalHomePath),
        SecurityManager.UserName])
    else
      APath := Format('%s\temp\repository',
        [ExcludeTrailingBackslash(IQGetLocalHomePath)]);

    if not ForceDirectories(APath) then
      raise Exception.CreateFmt
        ('Unable to create temp repository docs folder ''%s''', [APath]);

    AFileName := APath + '\' + AFileName;

    if not DNET_SaveToFile(FDNetRepository, ADoc_Repository_ID, AFileName)
    then { qc_doc_dnet.pas }
      raise Exception.Create
        ('Unable to save a blob repository record to a temp file');

    if FRepositoryFiles.IndexOf(AFileName) = -1 then
      FRepositoryFiles.Add(AFileName);
  end;

  function FindPreviousVerFullFileName(var APrevFileName: string): Boolean;
  var
    APrev_Doc_Revision_ID: Real;
  begin
    Result := False;

    { Previous revison }
    APrev_Doc_Revision_ID := SelectValueFmtAsFloat
      ('select max(id) from doc_revision where external_doc_id = %f and hist = ''Y''',
      [AExternal_Doc_ID]);
    if APrev_Doc_Revision_ID = 0 then
      Exit;

    { File name }
    APrevFileName := SelectValueByID('filename', 'doc_revision',
      APrev_Doc_Revision_ID);
    if APrevFileName > '' then
    begin
      if IsRepositoryKind() then
        SaveRepositoryToLocalFile(APrevFileName, APrev_Doc_Revision_ID)
      else
        APrevFileName := IncludeTrailingBackslash(ARevision_Path) +
          ExtractFileName(APrevFileName);
    end;

    Result := True;
  end;

  function _CheckUseConvertPDFRedirectFileName(AOriginalFileName
    : string): string;
  begin
    Result := AOriginalFileName;
    if AConvertToPDFDisplay and FileExists(_GetPdfFileName(AOriginalFileName))
    then
      Result := _GetPdfFileName(AOriginalFileName);
  end;

begin
  ADeactive_Date := 0;
  Result := False;

  with QryDocsExt do
  begin
    IQAssert(Assigned(FindField('lib_path')),
      IQMS.Common.ResStrings.
      cTXT0000218 { 'Unable to process external documents.  Library path is undefined [Prn_Doc].' } );
    IQAssert(Assigned(FindField('filename')),
      IQMS.Common.ResStrings.
      cTXT0000218 { 'Unable to process external documents.  Filename is undefined [Prn_Doc].' } );

    { Secured lib }
    A := SelectValueArrayFmt
      ('select doc.status,                               '#13 +
      '       lib.keep_revisions,                       '#13 +
      '       doc.id as external_doc_id,                '#13 +
      '       lib.revision_path,                        '#13 +
      '       rev.deactive_date,                        '#13 +
      '       doc.descrip,                              '#13 +
      '       lib.type,                                 '#13 +
      '       lib.repository_alias,                     '#13 +
      '       lib.repository_data,                      '#13 +
      '       rev.doc_repository_id,                    '#13 +
      '       rev.id,                                   '#13 +
      '       rev.filename,                             '#13 +
      '       convert_to_pdf_display                    '#13 +
      '  from doc_library lib,                          '#13 +
      '       external_doc doc,                         '#13 +
      '       doc_revision rev                          '#13 +
      ' where NVL(lib.path, ''~'') = nvl(''%s'', ''~'') '#13 +
      '   and doc.doc_library_id = lib.id               '#13 +
      '   and rev.external_doc_id = doc.id              '#13 +
      '   and NVL(rev.hist, ''N'') = ''N''              '#13 +
      '   and rev.filename = ''%s''                     ',
      [StrTran(FieldByName('lib_path').asString, '''', ''''''),
      StrTran(FieldByName('filename').asString, '''', '''''')]);
    if VarArrayDimCount(A) = 0 then
      Exit;

    AStatus := A[0];
    AKeep_Revisions := A[1];
    AExternal_Doc_ID := A[2];
    ARevision_Path := A[3];
    if not VarIsNull(A[4]) then
      ADeactive_Date := A[4];
    ADescrip := A[5];

    AType := A[6];
    AAlias := A[7];
    APassword := A[8];
    ADoc_Repository_ID := A[9];
    ADoc_Revision_ID := A[10];
    AConvertToPDFDisplay := A[12] = 'Y';

    { Default lib }
    if (FieldByName('lib_path').asString = '') and not IsRepositoryKind then
    begin
      AFileName := FieldByName('filename').asString;
      AFileName := _CheckUseConvertPDFRedirectFileName(AFileName);
      Result := True;
      Exit;
    end;

    { if expired exit out }
    if (ADeactive_Date > 0) and
      (ADeactive_Date < SelectValueAsFloat('select sysdate from dual')) then
    begin
      if not IsConsole then
        IQWarning(Format(IQMS.Common.ResStrings.cTXT0000320, [A[5]]));
      { 'The attached document ''%s'' is not available - it is expired and requires review.' }
      Exit;
    end;

    if (AStatus = QC_DOC_PENDING) or (AStatus = QC_DOC_AUTHORIZED) or
      (AStatus = QC_DOC_CHECKED_OUT) then
    begin
      if AKeep_Revisions <> 'Y' then
        Exit;

      if (ARevision_Path = '') and not IsRepositoryKind then
        Exit;

      if not FindPreviousVerFullFileName(AFileName) then
        Exit;

      AFileName := _CheckUseConvertPDFRedirectFileName(AFileName);

      Result := True;
      Exit;
    end;

    { all others }
    if IsRepositoryKind() then
    begin
      AFileName := ExtractFileName(FieldByName('filename').asString);
      SaveRepositoryToLocalFile(AFileName, ADoc_Revision_ID)
    end
    else
    begin
      AFileName := IncludeTrailingBackslash(FieldByName('lib_path').asString) +
        ExtractFileName(FieldByName('filename').asString);
      AFileName := _CheckUseConvertPDFRedirectFileName(AFileName);
    end;

    Result := True;
  end;
end;

class function TFrmPrintDocsCustom.GetReportNameEx(AReportFieldName: string;
  const Params: array of Variant): string;
{ Params is array of pairs: 'ship_to', 123, 'arcusto', 4567 etc where 1 - table name, 2 - its id field value }
var
  I: Integer;
  N: Integer;
  ATableName: string;
  AID: Real;
begin
  I := 0;
  N := High(Params);

  { go down the hirarchy: check ship_to, then arcusto. if not found reserve to iqsys }
  while I < N do
  begin
    { Params[ I ] - name of the table, Params[ I + 1 ] - ID value }
    ATableName := Params[I];
    AID := Params[I + 1];
    // Byron:  do not internationalize.  Developer use only.
    IQAssert(ATableName > '',
      'Invalid parameter in call to function GetReportNameEx - table name is missing');
    if AID > 0 then
    begin
      Result := SelectValueFmtAsString('select %s from %s where id = %f',
        [AReportFieldName, ATableName, AID]);
      if Result > '' then
        Exit;
    end;

    Inc(I, 2);
  end;

  { if we made so far then no specific report was assigned - go to iqsys }
  if TableFieldExists('iqsys', AReportFieldName) then
    Result := SelectValueFmtAsString('select %s from iqsys', [AReportFieldName])
  else if TableFieldExists('iqsys2', AReportFieldName) then
    Result := SelectValueFmtAsString('select %s from iqsys2',
      [AReportFieldName]);
end;

procedure TFrmPrintDocsCustom.sbtnFaxClick(Sender: TObject);
begin
  if GetFaxDialog(FFaxMan) then { IQFaxDlg }
    UpdateFaxRecipients;
end;

procedure TFrmPrintDocsCustom.UniFormDestroy(Sender: TObject);
var
  I: Integer;
begin
  FFaxMan.Free;
  FEmailAttachmentList.Free;
  FEmailOtherAttachments.Free;

  CheckFreeDNetCOM(FDNetRepository);

  { delete repository temp files }
  if Assigned(FRepositoryFiles) and (FRepositoryFiles <> nil) then
  begin
    // for I:= 0 to FRepositoryFiles.Count - 1 do DeleteFile( FRepositoryFiles[ I ] );
    FRepositoryFiles.Free;
  end;

  inherited;
end;

procedure TFrmPrintDocsCustom.UpdateFaxRecipients;
var
  I: Integer;
begin
  lviewFaxRecipients.Items.Clear;
  for I := 0 to FFaxMan.FRecipients.Count - 1 do
    with lviewFaxRecipients.Items.Add do
    begin
      Caption := GetToken(FFaxMan.FRecipients[I], #9, 1);
      SubItems.Add(GetToken(FFaxMan.FRecipients[I], #9, 2));
      SubItems.Add(GetToken(FFaxMan.FRecipients[I], #9, 3));
    end;
end;

procedure TFrmPrintDocsCustom.pgctrDestinationChange(Sender: TObject);
var
  I: Integer;
begin
  if (pgctrDestination.ActivePage = tabFax) and
    (lviewFaxRecipients.Items.Count = 0) then
  begin
    QryMain.Close;
    // Both use wwcombFrom value
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DisplayValue'
      AssignQueryParamValue(QryMain, 'param1', wwcombFrom.DisplayValue);
      AssignQueryParamValue(QryMain, 'param2', wwcombFrom.DisplayValue); }
    QryMain.Open;
    CheckPopulateFaxInfo;
  end;
end;

procedure TFrmPrintDocsCustom.CheckPopulateFaxInfo;
begin
  with QryMain do
    if (FFaxMan.FRecipients.Count = 0) and
      ((SafeFieldAsStr('attn', '') > '') or (SafeFieldAsStr('company', '') > '')
      or (SafeFieldAsStr('fax_number', '') > '')) then
    begin
      FFaxMan.AddRecipient(SafeFieldAsStr('attn', ' '),
        SafeFieldAsStr('company', ' '), SafeFieldAsStr('fax_number', ' '));
      UpdateFaxRecipients;
    end;
end;

function TFrmPrintDocsCustom.SafeFieldAsStr(AFieldName, ADefaultValue
  : string): string;
begin
  with QryMain do
  begin
    if FindField(AFieldName) <> nil then
      Result := FieldByName(AFieldName).asString
    else
      Result := ADefaultValue;
  end;
end;

procedure TFrmPrintDocsCustom.sbtnFaxSetupClick(Sender: TObject);
begin
  // WEB_CONVERT AssignPollingParams; { FM_Params.pas }
end;

function TFrmPrintDocsCustom.AssignPrinterSettingsInternal
  (AComponent: TComponent; const AReportName: string; var ACopies: Integer;
  var ACollated: Boolean; var AStartPage: Integer;
  var AStopPage: Integer): Boolean;
begin
  { Virtual method to allow TFrmPrintDocsTicketShippingLabel class override ACopies }
  Result := AssignPrinterSettings(AComponent, AReportName, ACopies, ACollated,
    AStartPage, AStopPage);
end;

procedure TFrmPrintDocsCustom.ExecuteBeforeReport(ABeforeReport: string;
  QryMain: TFDQuery);
begin
  ExecuteCommandFmt('begin CRW_BEFORE_EXEC.%s(%s); end;',
    [ABeforeReport, QryMain.Fields[0].asString]);
end;

procedure TFrmPrintDocsCustom.AddToRepDefLog(AStartTime: Real;
  AReportName: string);
var
  ADestination: string;
  ASpec: string;
begin
  ADestination := '';
  ASpec := '';
  GetDestination(ADestination, ASpec);
  if ASpec > '' then
    ADestination := Format('%s: %s', [ADestination, ASpec]);

  InternalWriteToRepdefLog(AReportName, SecurityManager.UserName, ADestination,
    AStartTime); { pas }
end;

function TFrmPrintDocsCustom.PrintUsingDefaultAssociatedApplication
  (AFileName: AnsiString; AWaitForApplicationToFinish: Boolean = True): Boolean;
label
  Finish;
var
  ShellExecuteInfo: TShellExecuteInfoA;
begin
  Result := False;

  if not FileExists(AFileName) then
    Exit;

  // init
  FillChar(ShellExecuteInfo, SizeOf(TShellExecuteInfoA), 0);
  with ShellExecuteInfo do
  begin
    cbSize := SizeOf(TShellExecuteInfoA);
    Wnd := Application.Handle;
    // Application.MainForm.Handle; reference to Application.MainForm will hang UP IQRF
    lpFile := PAnsiChar(AFileName);
    lpVerb := 'print';
    nShow := SW_SHOWDEFAULT;
    fMask := SEE_MASK_NOCLOSEPROCESS;
  end;

  // launch
  if not ShellExecuteExA(@ShellExecuteInfo) then
    raise Exception.CreateFmt
      ('Failure attempting to call ShellExecuteExA. Error Code = %d',
      [GetLastError]);

  if ShellExecuteInfo.hProcess = 0 then
    goto Finish;

  if AWaitForApplicationToFinish then
  begin
    WaitForSingleObject(ShellExecuteInfo.hProcess, INFINITE);
    CloseHandle(ShellExecuteInfo.hProcess);
  end;

  Result := True;

Finish:
  { wait extra 5 seconds for the system to print submitted doc }
  Application.ProcessMessages;
  Sleep(5000);
end;

procedure TFrmPrintDocsCustom.DoAfterCRWPrint(Sender: TObject;
  AReportName: string; ASelectionList, AExternalDocsList: TStringList;
  AFileName: string);
begin
end;

procedure TFrmPrintDocsCustom.edSaveFileCustomDlg(Sender: TObject);
begin
  // define printed filename format

  (* TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmPrnFileNameFormat' }
    TFrmPrnFileNameFormat.DoShowModal(Self, UpperCase(Self.ClassName),
    FPrintFileNameFormatElementsUsed { type;number;date;company } ); *)

  // prn_filename_format.pas
  AssignDestinationFileNameBackgroundColor;
end;

procedure TFrmPrintDocsCustom.TabControl1Change(Sender: TObject);
var
  APrevIndex: Integer;
begin
  Application.ProcessMessages;

  APrevIndex := pgctrDestination.ActivePageIndex;
  pgctrDestination.ActivePageIndex := TabControl1.TabIndex;

  if (APrevIndex <> pgctrDestination.ActivePageIndex) and
    Assigned(pgctrDestination.OnChange) then
    pgctrDestination.OnChange(pgctrDestination);
end;

procedure TFrmPrintDocsCustom.CheckLookupQueryOpen(Sender: TObject);
var
  AMsg: TPanelMesg;
begin
  if wwQryLookup.Active then
    Exit;
  // IQMS.Common.ResStrings.cTXT0000137 = 'Accessing database (%s) ...'
  AMsg := hPleaseWait(Format(IQMS.Common.ResStrings.cTXT0000137,
    [wwQryLookup.Name]));
  try
    wwQryLookup.Open;
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'DisplayValue'
      wwcombFrom.LookupValue := wwcombFrom.DisplayValue;
      wwcombTo.LookupValue := wwcombTo.DisplayValue; }
  finally
    AMsg.Free;
  end;
end;

procedure TFrmPrintDocsCustom.InitTempDocsPath;
begin
  FTempDocsPath := IncludeTrailingBackslash(IQGetLocalHomePath) +
    'Temp\emailed_docs\';
  if not ForceDirectories(FTempDocsPath) then
    IQWarning(Format('Unable to create temp sent docs folder ''%s''',
      [FTempDocsPath]));

  DeleteFilesOlderThan(FTempDocsPath + '*.*', 2); { IQMS.Common.FileUtils.pas }
  if FDNetExportType <> dtNoFormat then
    DeleteFilesOlderThan(IQGetLocalHomePath + '*' + ExportFileTypeExt
      [FDNetExportType], 3 { days } ); // C:\p4\iqwin\*.doc
end;

function TFrmPrintDocsCustom.CheckIfEmailContactExists: Boolean;
begin
  Result := True;
end;

procedure TFrmPrintDocsCustom.CheckShowEPlant;
begin
  { overriden in OE, ACK, BOL, PS }
end;

procedure TFrmPrintDocsCustom.AssignEPlantDialogVisible(ALabel: TUniLabel;
  AwwDBComboDlg: TUniEdit);
begin
  if not (SecurityManager <> nil) then
  begin
    ALabel.Visible := False;
    AwwDBComboDlg.Visible := False;
    Exit;
  end;

  ALabel.Visible := SecurityManager.EPlantsExist;
  AwwDBComboDlg.Visible := ALabel.Visible;
  if not ALabel.Visible then
    Exit;

  // WEB_CONVERT AwwDBComboDlg.ShowButton := SecurityManager.EPlant_ID_AsFloat = 0;

  if SoftEPlant1.EPlant_ID <> 'NULL' then
    AwwDBComboDlg.Text := SoftEPlant1.EPlant_ID
  else
    AwwDBComboDlg.Text := '';
end;

procedure TFrmPrintDocsCustom.sbtnBoilerPlatesClick(Sender: TObject);
var
  P: TPoint;
begin
  with sbtnBoilerPlates do
  begin
    P.y := Top + Height;
    P.x := Left;
    P := pnlEmailRight.ClientToScreen(P);
    popmBoilerPlate.Popup(P.x, P.y);
  end;
end;

procedure TFrmPrintDocsCustom.LoadfromBoilerPlate1Click(Sender: TObject);
begin
  with PkBoiler do
    if Execute then
      AssignBoilerTextToMemo(memoEmail, edSubject, GetValue('ID'));
end;

procedure TFrmPrintDocsCustom.ViewEditBoilerPlates1Click(Sender: TObject);
var
  ABoiler_ID: Real;
begin
  if DoViewSelectBoilerPlate(Self.ClassName, ABoiler_ID) then // BoilSel.pas
    AssignBoilerTextToMemo(memoEmail, edSubject, ABoiler_ID);
end;

procedure TFrmPrintDocsCustom.PkBoilerBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'type', ClassName);
end;

procedure TFrmPrintDocsCustom.PkEmailIQAfterHPickCreate(Sender: TObject);
var
  ABitmap: TBitmap;
begin
  { TODO -oBantuK -cWEB_CONVERT : compile time errors
    if not (Sender is TFrmIQSearchPickList) then // IQSearchPickList.pas
    Exit;

    with Sender as TFrmIQSearchPickList do
    begin
    // glyph
    ABitmap := TBitmap.Create;
    try
    ImageList2.GetBitmap(0, ABitmap);
    IQSearch1.UserBtn1Glyph := ABitmap;
    finally
    ABitmap.Free;
    end;

    // event and other properties
    IQSearch1.UserBtn1OnClick := SetFilterPicklistInactiveRecords;
    IQSearch1.UserBtn1Hint := IQMS.WebVcl.ResourceStrings.cTXT0000045;
    // 'Showing active only.'#13'Click to toggle.'
    IQSearch1.UserBtn1.AllowAllUp := True;
    IQSearch1.UserBtn1.GroupIndex := 1;
    end;
  }
end;

procedure TFrmPrintDocsCustom.AssignBoilerTextToMemo(AMemo: TUniMemo;
  ASubject: TUniEdit; ABoilerPlate_ID: Real);
var
  ABoilerText: string;
begin
  ABoilerText := SelectValueFmtAsString
    ('select text from boiler_plate where id = %f', [ABoilerPlate_ID]);

  if AMemo.Text > '' then
    ABoilerText := ABoilerText + #13#10;

  AMemo.Text := ABoilerText + AMemo.Text;
  if Trim(ASubject.Text) = '' then
    ASubject.Text := SelectValueFmtAsString
      ('select descrip from boiler_plate where id = %f', [ABoilerPlate_ID]);
end;

procedure TFrmPrintDocsCustom.UserSignature1Click(Sender: TObject);
var
  S: string;
begin
  if SelectValueFmtAsFloat
    ('select 1 from s_user_general where RTrim(user_name) = ''%s''',
    [SecurityManager.UserName]) = 0 then
    ExecuteCommandFmt('insert into s_user_general (user_name) values (''%s'')',
      [SecurityManager.UserName]);

  S := SelectValueFmtAsString
    ('select email_signature from s_user_general where RTrim(user_name) = ''%s''',
    [SecurityManager.UserName]);

  (* TODO -oBantuK -cWEB_CONVERT :  E2003 Undeclared identifier: 'DoEditMemoStr'
    if DoEditMemoStr(Self, S, 2000, 'User Signature') then { EditMemoStr.pas }
    begin
    ExecuteCommandFmt(
    'update s_user_general set email_signature = ''%s'' where RTrim(user_name) = ''%s''',
    [FixStr(Trim(S)), SecurityManager.UserName]);

    // if memoEmail.Lines.Count = 0 then
    CheckAddUserSignatureToEmailBody();
    end;
  *)
end;

procedure TFrmPrintDocsCustom.CheckAddUserSignatureToEmailBody();
var
  S: string;
begin
  S := Trim(SelectValueFmtAsString
    ('select email_signature from s_user_general where RTrim(user_name) = ''%s''',
    [SecurityManager.UserName]));
  if S = '' then
    Exit;

  S := IQMS.Common.StringUtils.StrTran(S, #13#10, #13);
  S := IQMS.Common.StringUtils.StrTran(S, #10#10, #13);

  if (memoEmail.Lines.Count = 0) or
    IQConfirmYN('Add signature to the email body?') then
    memoEmail.Lines.Text := memoEmail.Lines.Text + #13 + S;
end;

procedure TFrmPrintDocsCustom.sbtnOtherAttachmentsClick(Sender: TObject);
var
  I: Integer;
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmPrnOtherAttachments'
    if TFrmPrnOtherAttachments.DoShowModal(Self, FEmailOtherAttachments) then
    // prn_other_attachments.pas
    begin
    edOtherAttachments.Text := '';
    for I := 0 to FEmailOtherAttachments.Count - 1 do
    begin
    if I > 0 then
    edOtherAttachments.Text := edOtherAttachments.Text + '; ';

    edOtherAttachments.Text := edOtherAttachments.Text +
    ExtractFileName(FEmailOtherAttachments[I]);
    end;
    end;
  }
end;

procedure TFrmPrintDocsCustom.AfterCreate;
begin
  // provided by descendant
end;

procedure TFrmPrintDocsCustom.ShowWarning;
begin
  IQWarning(IQMS.Common.ResStrings.cTXT0000212);
end;

function TFrmPrintDocsCustom.SelectedFileType_EmailAttachment: TExportOptions;
begin
  Result := GetSelectedExportOption(cboxEMailFileType);
end;

function TFrmPrintDocsCustom.SelectedFileType_File: TExportOptions;
begin
  Result := GetSelectedExportOption(cboxFileType);
end;

procedure TFrmPrintDocsCustom.SetFilterPicklistInactiveRecords(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TIQUniGridControl'
    if not (Sender is TUniSpeedButton) or
    not (TUniSpeedButton(Sender).Owner is TIQUniGridControl) then
    Exit;

    // keep up the flag
    FPickListShowInactiveRecords := (Sender as TUniSpeedButton).Down;

    // hint
    if TUniSpeedButton(Sender).Down then
    // 'Showing inactive only.'#13'Click to toggle.'
    TUniSpeedButton(Sender).Hint := IQMS.WebVcl.ResourceStrings.cTXT0000044
    else
    // 'Showing active only.'#13'Click to toggle.'
    TUniSpeedButton(Sender).Hint := IQMS.WebVcl.ResourceStrings.cTXT0000045;

    // refresh dataset
    TIQUniGridControl(TUniSpeedButton(Sender).Owner).wwDBGrid.DataSource.DataSet.Close;
    TIQUniGridControl(TUniSpeedButton(Sender).Owner).wwDBGrid.DataSource.DataSet.Open;
  }
end;

procedure TFrmPrintDocsCustom.SetFrom(const Value: string);
begin
  wwcombFrom.Text := Value;
end;

procedure TFrmPrintDocsCustom.PkEmailBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'pk_hide',
    IQMS.Common.StringUtils.BoolToYN(FPickListShowInactiveRecords));
  AssignQueryParamValue(DataSet, 'this_employee_id', ThisEmployee_ID);
  AssignQueryParamValue(DataSet, 'this_arcusto_id', ThisArcusto_ID);
  AssignQueryParamValue(DataSet, 'this_vendor_id', ThisVendor_ID);
end;

procedure TFrmPrintDocsCustom.LoadAttachedExternalDocs(var AExternalDocsList
  : TStringList);
var
  AExternalDoc_ID: Int64;
  AAuto_EForm: Boolean;
begin
  if Assigned(AExternalDocsList) then
  begin
    if not QryMain.Active then
    begin
      AssignParams;
      QryMainAfterScroll(QryMain);
    end;
    // if not QryDocs.Active then
    // QryDocs.Open;
    // if not QryDocsExt.Active then
    // QryDocsExt.Open;

    if (QryDocsExt.FindField('doc_used_id') <> nil) then
    begin
      QryDocsExt.First;
      while not QryDocsExt.Eof do
      begin
        with TFDQuery.Create(nil) do
          try
            Connection := UniMainModule.FDConnection1;
            SQL.Add('SELECT external_doc_id,');
            SQL.Add('       auto_eform');
            SQL.Add('  FROM doc_used');
            SQL.Add(Format(' WHERE id = %d',
              [QryDocsExt.FieldByName('doc_used_id').AsLargeInt]));
            Open;
            AExternalDoc_ID := Fields[0].AsLargeInt;
            AAuto_EForm := Fields[1].asString = 'Y';
            if AAuto_EForm and (AExternalDoc_ID > 0) then
              AExternalDocsList.Add(FloatToStr(AExternalDoc_ID));
          finally
            Free;
          end;
        QryDocsExt.Next;
      end;
      QryDocsExt.First;
    end;
  end;
end;

procedure TFrmPrintDocsCustom.CheckAppendAutoEform(Sender: TObject;
  AReportName: string; ASelectionList: TStringList);
var
  AExternalDocsList: TStringList;
  AExternalDoc_ID: Real;
  AAuto_EForm: Boolean;
  A: Variant;
  AFileName: string;

  { procedure LoadAttachedExternalDocs;
    begin

    if QryDocsExt.FindField('doc_used_id') = nil then
    Exit;

    QryDocsExt.First;
    while not QryDocsExt.Eof do
    begin
    A := SelectValueArrayFmt(
    'select external_doc_id, auto_eform from doc_used where id = %f',
    [QryDocsExt.FieldByName('doc_used_id').asFloat]);
    if VarArrayDimCount(A) > 0 then
    begin
    AExternalDoc_ID := A[0];
    AAuto_EForm := A[1] = 'Y';
    end;

    if AAuto_EForm and (AExternalDoc_ID > 0) then
    AExternalDocsList.Add(FloatToStr(AExternalDoc_ID));

    QryDocsExt.Next;
    end;
    QryDocsExt.First;
    end; }

begin
  AFileName := '';
  AExternalDocsList := TStringList.Create;
  try
    if not chkExcludeAttachedDocs.Checked then
      LoadAttachedExternalDocs(AExternalDocsList);

    if edSaveFile.Text = '' then
      AssignFileNameBasedOnUserDefinedFormat(AFileName);

    DoAfterCRWPrint(Sender, AReportName, ASelectionList, AExternalDocsList,
      AFileName);
  finally
    AExternalDocsList.Free;
  end;
end;

procedure TFrmPrintDocsCustom.AssignDestinationFileNameBackgroundColor;
var
  AIsUserDefined: Boolean;
begin
  AIsUserDefined := SelectValueFmtAsFloat
    ('select 1 from filename_format a, filename_format_element b ' +
    'where upper(a.source) = ''%s'' and a.id = b.filename_format_id and rownum < 2',
    [UpperCase(Self.ClassName)]) = 1;
  if AIsUserDefined then
  begin
    edSaveFile.Color := clInfoBk;
    // IQMS.Common.ResStrings.cTXT0000418 =
    // 'User defined file name formatting is found.'#13
    // 'Click the button to review the formatting...'
    edSaveFile.Hint := IQMS.Common.ResStrings.cTXT0000418;
  end
  else
  begin
    edSaveFile.Color := clWindow;
    // IQMS.Common.ResStrings.cTXT0000419 =
    // 'Click the button to specify file name formatting or enter
    // the file name directly'
    edSaveFile.Hint := IQMS.Common.ResStrings.cTXT0000419;
  end;
end;

procedure TFrmPrintDocsCustom.AssignFileNameBasedOnUserDefinedFormat
  (var AFileName: string);
var
  AList: TStringList;
  AFormat_ID: Real;
  ASeparator: string;
  A: Variant;
  I: Integer;
  S: string;
begin
  // check anything is defined
  A := SelectValueArrayFmt
    ('select id, rtrim(separator) from filename_format where upper(source) = ''%s''',
    [UpperCase(Self.ClassName)]);
  if VarArrayDimCount(A) = 0 then
    Exit;

  AFormat_ID := A[0];
  ASeparator := DefaultToString(A[1], '-');

  AList := TStringList.Create;
  try
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmPrnFileNameFormat'
      TFrmPrnFileNameFormat.LoadSelectedElements(AList, AFormat_ID); }
    // prn_filename_format.pas

    for I := 0 to AList.Count - 1 do
    begin
      S := EliminateInvalidFileNameChars
        (MapFileNameFormatElementToData(AList[I]));
      if S > '' then
      begin
        if I = 0 then
          AFileName := S
        else
          AFileName := AFileName + ASeparator + S;
      end;
    end;

    if AFileName > '' then
      AFileName := AppendFileExt(AFileName);
  finally
    AList.Free;
  end;
end;

function TFrmPrintDocsCustom.AppendFileExt(AFileName: string): string;
begin
  Result := '';
  if AFileName > '' then
    Result := AFileName + ExportFileTypeExt[SelectedFileType_File];
  { case cboxFileType.ItemIndex of
    0: AFileName:= AFileName + '.doc';
    1: AFileName:= AFileName + '.rtf';
    2: AFileName:= AFileName + '.txt';
    3: AFileName:= AFileName + '.txt';
    4: AFileName:= AFileName + '.pdf';
    5: AFileName:= AFileName + '.xls';
    6: AFileName:= AFileName + '.htm';
    else
    AFileName:= AFileName + '.rtf';
    end;
    Result:= AFileName;
  }
end;

function TFrmPrintDocsCustom.MapFileNameFormatElementToData
  (AElement: string): string;
begin
  if AElement = GetFileFormatElementName('date') then
    Result := IQMS.Common.StringUtils.StrTran(DateToStr(Date), '/', '-')

  else if AElement = GetFileFormatElementName('company') then
    Result := SelectValueAsString('select company from iqsys')

  else if AElement = GetFileFormatElementName('type') then
    Result := GetFileNameComplexElements(feType)

  else if AElement = GetFileFormatElementName('number') then
    Result := GetFileNameComplexElements(feNumber);
end;

function TFrmPrintDocsCustom.EliminateInvalidFileNameChars(S: string): string;
var
  I: Integer;
begin
  Result := Trim(S);
  for I := 1 to Length(S) do
    if Pos(S[I], '\/*?''"|') > 0 then
      Result[I] := ' ';
end;

function TFrmPrintDocsCustom.GetFileNameComplexElements
  (AElem: TFileNameElement): string;
var
  AID: Real;
begin
  Result := '';
  AID := QryMain.FieldByName(GetPKFieldNameForUpdatePrintCount()).asFloat;
  // Normally - ID. For WO - workorder_id

  if CompareText(Self.ClassName, 'TFrmPrintBOL') = 0 then
    case AElem of
      feType:
        Result := 'BOL';
      feNumber:
        Result := SelectValueByID('packslipno', 'shipments', AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintBOLHeader') = 0 then
    case AElem of
      feType:
        Result := 'BOL';
      feNumber:
        Result := SelectValueByID('bolno', 'bol', AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsOE_Ack') = 0 then
    case AElem of
      feType:
        Result := 'ACK';
      feNumber:
        Result := SelectValueByID('orderno', 'orders', AID)
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsPS') = 0 then
    case AElem of
      feType:
        Result := 'PS';
      feNumber:
        Result := SelectValueByID('packslipno', 'shipments', AID)
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsARPost') = 0 then
    case AElem of
      feType:
        Result := 'INVOICE';
      feNumber:
        Result := SelectValueByID('invoice_no', 'arprepost', AID)
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsARPrepost') = 0 then
    case AElem of
      feType:
        Result := 'INVOICE';
      feNumber:
        Result := SelectValueByID('invoice_no', 'arinvoice', AID)
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsCS') = 0 then
    case AElem of
      feType:
        Result := 'CS';
      feNumber:
        Result := SelectValueByID('custno', 'arcusto', AID)
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsJobShop') = 0 then
    case AElem of
      feType:
        Result := 'JS';
      feNumber:
        Result := SelectValueByID('projectno', 'jobshop_rfq', AID)
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsCRMQuote') = 0 then
    case AElem of
      feType:
        Result := 'QUOTE';
      feNumber:
        Result := SelectValueByID('rfq', 'crm_quote', AID)
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsAssy1Traveler') = 0 then
    case AElem of
      feType:
        Result := 'WO';
      feNumber:
        Result := FloatToStr(AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsBOM') = 0 then
    case AElem of
      feType:
        Result := 'BOM';
      feNumber:
        Result := SelectValueByID('mfgno', 'standard', AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintCoC') = 0 then
    case AElem of
      feType:
        Result := 'COC';
      feNumber:
        Result := SelectValueFmtAsString
          ('SELECT b.packslipno                   '#13 +
          '  FROM shipment_dtl a, shipments b    '#13 +
          ' WHERE b.id = a.shipments_id AND      '#13 +
          '       a.id = %.0f                    ', [AID]);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsCRMService') = 0 then
    case AElem of
      feType:
        Result := 'WARRANTY';
      feNumber:
        Result := FloatToStr(AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsFABTraveler') = 0 then
    case AElem of
      feType:
        Result := 'TRAVELER';
      feNumber:
        Result := SelectValueByID('lotno', 'fab_lot', AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsKanban') = 0 then
    case AElem of
      feType:
        Result := 'KANBAN';
      feNumber:
        Result := SelectValueByID('cardno', 'kb_card', AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintBOL_Manual') = 0 then
    case AElem of
      feType:
        Result := 'BOL';
      feNumber:
        Result := SelectValueByID('packslipno', 'manual_packslip', AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintMRB_WO') = 0 then
    case AElem of
      feType:
        Result := 'WO';
      feNumber:
        Result := SelectValueByID('mrb_workorderno', 'wf_deviation_item', AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsPMWO') = 0 then
    case AElem of
      feType:
        Result := 'WO';
      feNumber:
        Result := FloatToStr(AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsPSManual') = 0 then
    case AElem of
      feType:
        Result := 'PS';
      feNumber:
        Result := SelectValueByID('packslipno', 'manual_packslip', AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsReceive') = 0 then
    case AElem of
      feType:
        Result := 'RECEIVE';
      feNumber:
        Result := QryMain.FieldByName('receiptno').asString;
    end

  else if CompareText(Self.ClassName, 'TFrmPrintRR_WO') = 0 then
    case AElem of
      feType:
        Result := 'WO';
      feNumber:
        Result := SelectValueFmtAsString
          ('select rma.rmano from rma_detail d, rma where d.id = %f and d.rma_id = rma.id',
          [AID]);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsStaging') = 0 then
    case AElem of
      feType:
        Result := 'STAGING';
      feNumber:
        Result := '';
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsTicket') = 0 then
    case AElem of
      feType:
        Result := 'PKTICKET';
      feNumber:
        Result := FloatToStr(AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsTooling') = 0 then
    case AElem of
      feType:
        Result := 'TOOLING';
      feNumber:
        Result := SelectValueByID('rfq', 'v_tool_rfq', AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintWO') = 0 then
    case AElem of
      feType:
        Result := 'WO';
      feNumber:
        Result := FloatToStr(AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsOE') = 0 then
    case AElem of
      feType:
        Result := 'OE';
      feNumber:
        Result := SelectValueByID('orderno', 'orders', AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintDocsPO') = 0 then
    case AElem of
      feType:
        Result := 'PO';
      feNumber:
        Result := SelectValueByID('pono', 'po', AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintWorkOrderFromShopData') = 0 then
    case AElem of
      feType:
        Result := 'WO';
      feNumber:
        Result := FloatToStr(AID);
    end

  else if CompareText(Self.ClassName, 'TFrmPrintTranAcct') = 0 then
    case AElem of
      feType:
        Result := 'TRANACCT';
      feNumber:
        Result := '';
    end

  else if CompareText(Self.ClassName, 'TFrmPrnVendRfq') = 0 then
    case AElem of
      feType:
        Result := 'VENDOR-RFQ';
      feNumber:
        Result := SelectValueByID('descrip', 'vendor_rfq_hdr', AID);
    end

  else
    case AElem of
      feType:
        Result := '';
      feNumber:
        Result := '';
    end
end;

procedure TFrmPrintDocsCustom.SetThisArcusto_ID(const Value: Real);
begin
  FThisArcusto_ID := Value;
end;

procedure TFrmPrintDocsCustom.SetThisEmployee_ID(const Value: Real);
begin
  FThisEmployee_ID := Value;
end;

procedure TFrmPrintDocsCustom.SetThisVendor_ID(const Value: Real);
begin
  FThisVendor_ID := Value;
end;

procedure TFrmPrintDocsCustom.SetToTxt(const Value: string);
begin
  wwcombTo.Text := Value;
end;

procedure TFrmPrintDocsCustom.SetTouchScreen(const Value: Boolean);
const
  c_gap_between: Integer = 2;
var
  I: Integer;

  procedure _SetModalBtns(ABtnWidth, ABtnHeight: Integer);
  var
    I, x, gap: Integer;
  begin
    if FTouchScreen then
      gap := c_gap_between * 2
    else
      gap := c_gap_between;
    x := 0;
    pnlButtons.Height := ABtnHeight + (gap * 2);
    for I := 0 to pnlButtonsRight.ControlCount - 1 do
      if (pnlButtonsRight.Controls[I] is TUniButton) then
      begin
        TUniButton(pnlButtonsRight.Controls[I]).Width := ABtnWidth;
        TUniButton(pnlButtonsRight.Controls[I]).Height := ABtnHeight;
        Inc(x, ABtnWidth + gap);
      end;
    IQMS.Common.Controls.AlignControlsFromLeftA(pnlButtonsRight, 0, gap, gap);
    pnlButtonsRight.Width := x + gap;
  end;

  procedure _SetSpeedBtnSize(ASpeedButton: TUniSpeedButton; ASize: Integer);
  begin
    ASpeedButton.Width := ASize;
    ASpeedButton.Height := ASize;
  end;

  procedure _AlignEmailTabControls;
  var
    I, x, gap: Integer;
  begin
    if FTouchScreen then
    begin
      gap := c_gap_between * 2;
      _SetSpeedBtnSize(sbtnAssignEmail, 25);
      _SetSpeedBtnSize(sbtnBoilerPlates, 25);
      _SetSpeedBtnSize(sbtnOtherAttachments, 25);
      pnlEmailRight.Width := 30;
    end
    else
    begin
      gap := c_gap_between;
      _SetSpeedBtnSize(sbtnAssignEmail, 22);
      _SetSpeedBtnSize(sbtnBoilerPlates, 22);
      _SetSpeedBtnSize(sbtnOtherAttachments, 22);
      pnlEmailRight.Width := 25;
    end;
    // Get the ideal height for the TMemo, which is aligned to Client
    // This tries to avoid a situation where, after stacking, the last
    // control is hidden and cannot be accessed by resizing.
    x := 0;
    for I := 0 to pnlEMailClient.ControlCount - 1 do
      if (pnlEMailClient.Controls[I] is TUniEdit) or
        (pnlEMailClient.Controls[I] is TUniComboBox) then
        Inc(x, pnlEMailClient.Controls[I].Height + gap);
    // Add an additional top and bottom buffer
    Inc(x, gap * 2);
    // Set the memo height
    memoEmail.Height := pnlEMailClient.ClientHeight - x;

    // Stack up the controls so that the spacing is even
    IQMS.Common.Controls.StackUpControlsA(c_gap_between, c_gap_between,
      [edEmailTo, edSubject, memoEmail, cboxEMailFileType, EdAttachmentName,
      edOtherAttachments]);

    // Center the labels on the Email tab on their focus control
    x := 0;
    for I := 0 to PnlDestEMailLeft01.ControlCount - 1 do
      if (PnlDestEMailLeft01.Controls[I] is TUniLabel) then
      begin
        TUniLabel(PnlDestEMailLeft01.Controls[I]).Left := 8;
        { TODO -oBantuK -cWEB_CONVERT : E2003 Undeclared identifier: 'TCustomEdit'
          IQMS.Common.Controls.CenterLabel(
          TCustomEdit(TUniLabel(PnlDestEMailLeft01.Controls[I]).FocusControl),
          TUniLabel(PnlDestEMailLeft01.Controls[I])); }
        x := Max(x, TUniLabel(PnlDestEMailLeft01.Controls[I]).Width);
      end;
    // Ensure resizing won't be necessary
    PnlDestEMailLeft01.Width := x + 8 + gap;

    // Speedbuttons on the right side
    sbtnAssignEmail.Top := edEmailTo.Top;
    sbtnBoilerPlates.Top := memoEmail.Top;
    sbtnOtherAttachments.Top := edOtherAttachments.Top;
  end;

begin
  { TODO -oBantuK -cWEB_CONVERT : Too many compile time errors
    if FTouchScreen <> Value then
    begin
    FTouchScreen := Value;
    if FTouchScreen then
    begin
    touchscrn.ApplyTouchscreenFont(Self);
    PageControl1.Style := tsButtons;
    PageControl1.TabHeight := 40;
    PageControl1.TabWidth := 220;
    pgctrDestination.TabHeight := 40;
    pgctrDestination.TabWidth := 120;
    wwcombFrom.ButtonWidth := 40;
    wwcombTo.ButtonWidth := 40;
    TabControl1.TabHeight := 40;
    TabControl1.TabWidth := 120;
    TUniPanel(TabControl1.Parent).Height := TabControl1.TabHeight +
    c_gap_between;
    _AlignEmailTabControls;
    Self.Width := 600;
    Self.Height := 500;
    _SetModalBtns(120, 40);
    end
    else
    begin
    IQMS.Common.Screen.ApplySystemFont(Self);
    PageControl1.Style := tsTabs;
    PageControl1.TabHeight := 0;
    PageControl1.TabWidth := 0;
    pgctrDestination.TabHeight := 0;
    pgctrDestination.TabWidth := 0;
    wwcombFrom.ButtonWidth := 0;
    wwcombTo.ButtonWidth := 0;
    TabControl1.TabHeight := 25;
    TabControl1.TabWidth := 0;
    TUniPanel(TabControl1.Parent).Height := TabControl1.TabHeight +
    c_gap_between;
    pnlButtons.Height := 35;
    BtnProp.Width := 97;
    BtnProp.Height := 25;
    btnOK.Width := 97;
    btnOK.Height := 25;
    btnCancel.Width := 97;
    btnCancel.Height := 25;
    _SetModalBtns(97, 25);
    _AlignEmailTabControls;
    IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
    end
    end;

    IQMS.Common.Controls.ResizeCheckBoxes(Self, pnlCriteriaTop);

    // Set pick list property
    touchscrn.ApplyPickListTouchscreenProperty(Self, FTouchScreen);
  }
end;

procedure TFrmPrintDocsCustom.popmEmailPopup(Sender: TObject);
begin
  AddFromThisCustomer1.Visible := (ThisArcusto_ID > 0);
  AddFromThisVendor1.Visible := (ThisVendor_ID > 0);
  AddFromThisEmployee1.Visible := (ThisEmployee_ID > 0);

  N2.Visible := AddFromThisCustomer1.Visible or AddFromThisVendor1.Visible or
    AddFromThisEmployee1.Visible;

  { is anything assigned }
  if not N2.Visible then
  begin
    PostMessage(Handle, iq_Notify, 1, 0);
    // go directly to standard CRM picklist
    Abort;
  end;

  { Adjust caption of the menu }
  if ThisArcusto_ID > 0 then
    AddFromThisCustomer1.Caption :=
      Format(IQMS.Common.ResStrings.cTXT0000420 { 'Add from %s' } ,
      [SelectValueByID('rtrim(custno)', 'arcusto', ThisArcusto_ID)]);

  if ThisVendor_ID > 0 then
    AddFromThisVendor1.Caption :=
      Format(IQMS.Common.ResStrings.cTXT0000420 { 'Add from %s' } ,
      [SelectValueByID('rtrim(vendorno)', 'vendor', ThisVendor_ID)]);

  if ThisEmployee_ID > 0 then
    AddFromThisEmployee1.Caption :=
      Format(IQMS.Common.ResStrings.cTXT0000420 { 'Add from %s' } ,
      [SelectValueByID('rtrim(empno)', 'pr_emp', ThisEmployee_ID)]);
end;

procedure TFrmPrintDocsCustom.AddFromPickList1Click(Sender: TObject);
var
  S: string;
begin
  // These properties are assigned on menu popup (every time) -
  // ensure regular picklists are not confined to this Vendor/Customer/Employee
  ThisArcusto_ID := 0;
  ThisVendor_ID := 0;
  ThisEmployee_ID := 0;

  { 09-05-2012 switch to standard CRM pickist }
  S := edEmailTo.Text;
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'mailto_pick'
    if mailto_pick.GetMailToString(Self, S) then // in mailto_pick.pas
    edEmailTo.Text := S; }
end;

procedure TFrmPrintDocsCustom.AddFromThisVendor1Click(Sender: TObject);
begin
  if Sender = AddFromThisVendor1 then
    AddEMailFromPkList(PkEmailVendor)
  else if Sender = AddFromThisCustomer1 then
    AddEMailFromPkList(PkEMailCustomer)
  else if Sender = AddFromThisEmployee1 then
    AddEMailFromPkList(PkEmployee);
end;

procedure TFrmPrintDocsCustom.IQNotifyMessage(var Msg: TMessage);
begin
  case Msg.WParam of
    1:
      AddFromPickList1Click(nil);
  end;
end;

procedure TFrmPrintDocsCustom.AfterReport2;
begin
  // provided by descendant
end;

procedure TFrmPrintDocsCustom.AfterPrint;
begin
  // provided by descendant
end;

procedure TFrmPrintDocsCustom.DeleteFilesInList(AList: TStringList);
var
  I: Integer;
begin
  for I := 0 to AList.Count - 1 do
    DeleteFile(AList[I]);
end;

procedure TFrmPrintDocsCustom.DeleteTemporaryRepositoryFiles;
var
  APath: string;
begin
  if (SecurityManager <> nil) then
    APath := Format('%s\temp\%s\repository',
      [ExcludeTrailingBackslash(IQGetLocalHomePath), SecurityManager.UserName])
  else
    APath := Format('%s\temp\repository',
      [ExcludeTrailingBackslash(IQGetLocalHomePath)]);

  DeleteFilesOlderThan(APath + '*.pdf', 1); { IQMS.Common.FileUtils.pas }
end;

function TFrmPrintDocsCustom.GetOutputTo: TOutputTo;
begin
  // TOutputTo = ( otNone, otWindow, otPrinter, otExport, otEmail, otFax );
  case pgctrDestination.ActivePageIndex of
    0:
      Result := otPrinter;
    1:
      Result := otWindow;
    2:
      Result := otExport;
    3:
      Result := otEmail;
    4:
      Result := otFax;
  end;
end;

procedure TFrmPrintDocsCustom.SetOutputTo(const Value: TOutputTo);
begin
  case Value of
    otPrinter:
      pgctrDestination.ActivePageIndex := 0;
    otWindow:
      pgctrDestination.ActivePageIndex := 1;
    otExport:
      pgctrDestination.ActivePageIndex := 2;
    otEmail:
      pgctrDestination.ActivePageIndex := 3;
    otFax:
      pgctrDestination.ActivePageIndex := 4;
  end;
end;

function TFrmPrintDocsCustom.GetExportFileName: string;
begin
  Result := edSaveFile.Text;
end;

procedure TFrmPrintDocsCustom.SetExportFileName(const Value: string);
var
  o: TExportOptions;
begin
  edSaveFile.Text := Value;
  // Set the appropriate file type, based on the extension
  for o in PrintDlgFileTypes do
    if (CompareText(ExtractFileExt(Value), ExportFileTypeExt[o]) = 0) then
    begin
      SetSelectedExportOption(cboxFileType, o);
      Break;
    end;
end;

function TFrmPrintDocsCustom.GetEmailRecipient: string;
begin
  Result := edEmailTo.Text;
end;

procedure TFrmPrintDocsCustom.SetEmailRecipient(const Value: string);
begin
  edEmailTo.Text := Value;
end;

function TFrmPrintDocsCustom.GetEmailSubject: string;
begin
  Result := edSubject.Text;
end;

procedure TFrmPrintDocsCustom.SetEmailSubject(const Value: string);
begin
  edSubject.Text := Value;
end;

function TFrmPrintDocsCustom.GetEmailBodyText: string;
begin
  Result := memoEmail.Text;
end;

procedure TFrmPrintDocsCustom.SetEmailBodyText(const Value: string);
begin
  memoEmail.Text := Value;
end;

function TFrmPrintDocsCustom.GetEmailAttachmentName: string;
begin
  Result := EdAttachmentName.Text;
end;

procedure TFrmPrintDocsCustom.SetEmailAttachmentName(const Value: string);
begin
  EdAttachmentName.Text := Value;
end;

function TFrmPrintDocsCustom.GetEmailAttachmentType: TExportOptions;
begin
  Result := GetSelectedExportOption(cboxEMailFileType);
end;

procedure TFrmPrintDocsCustom.SetEmailAttachmentType
  (const Value: TExportOptions);
begin
  SetSelectedExportOption(cboxEMailFileType, Value);
end;

function TFrmPrintDocsCustom.GetExcludeAttachedDocs: Boolean;
begin
  Result := chkExcludeAttachedDocs.Checked;
end;

procedure TFrmPrintDocsCustom.SetExcludeAttachedDocs(const Value: Boolean);
begin
  chkExcludeAttachedDocs.Checked := Value;
end;

procedure TFrmPrintDocsCustom.QryMainAfterScroll(DataSet: TDataSet);
var
  AList: TStringList;

  procedure _AssignParamsValuesOpen(AChildQuery, AMasterQuery: TFDQuery);
  var
    I: Integer;
    AParamName: string;
  begin
    AList.Clear;
    AChildQuery.Close;

    LoadQueryDistinctParamNames(AChildQuery, AList);

    for I := 0 to AList.Count - 1 do
    begin
      AParamName := AList[I];
      if AMasterQuery.FindField(AParamName) <> nil then
        AssignQueryParamValue(AChildQuery, AParamName,
          AMasterQuery.FieldByName(AParamName).Value);
    end;

    { EIQ-13607 PIT at  Standard : "-306 Command text must not be empty" error is
      thrown while clicking on "Print Prepost Report"  icon.
      IF there is no query in SQL then do not try to open as it will raise error. }
    if Trim(AChildQuery.SQL.Text) = '' then
    begin
      Exit;
    end;

    AChildQuery.Open;
  end;

begin
  AList := TStringList.Create;
  try
    _AssignParamsValuesOpen(QryDocs, QryMain);
    _AssignParamsValuesOpen(QryDocsExt, QryMain);
  finally
    AList.Free;
  end;
end;

end.
