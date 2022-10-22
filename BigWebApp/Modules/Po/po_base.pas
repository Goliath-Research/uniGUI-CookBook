unit po_base;

interface

Uses
  Winapi.Windows, 
  Winapi.Messages, 
  System.SysUtils, 
  System.Classes, 
  System.Variants, 
  Vcl.Graphics, 
  Vcl.Controls, 
  Vcl.Forms, 
  Vcl.Dialogs, 
  PO_DM, 
  Vcl.Menus, 
  Vcl.Buttons, 
  Data.DB, 
  wwdblook, 
  Vcl.Wwdbigrd, 
  Vcl.Wwdbgrid, 
  wwriched, 
  Vcl.Wwdatsrc,
  Vcl.wwdbedit, 
  Vcl.Wwdotdot, 
  Vcl.Wwdbcomb, 
  wwdbdatetimepicker,
  IQMS.Common.StringUtils,
//  IQUsrMsg,
//  IQBookMark,
//  IQDocums,
//  IQUsrLbl,
//  IQSearch,
//  DropBtn,
//  QueryNavigator,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  IQMS.Common.JumpConstants,
  IQMS.Common.UOM,
//  IQMS.CostSource.Intf,
//  IQMS.CostSource.Manager,
//  IQMS.CostSource.Types,
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
//  uniTabSheet,
  uniSplitter,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniScrollBox,
  uniMainMenu,
  uniPanel,
  uniPageControl,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniDBNavigator,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniDBEdit,
  uniComboBox,
  uniDBComboBox,
  uniCheckBox,
  IQMS.Common.DataLib,
  uniDBCheckBox, IQMS.WebVcl.HPick, Vcl.ExtCtrls, IQMS.WebVcl.UserDefinedLabel,
  IQUniGrid, uniGUIFrame, uniDateTimePicker, uniDBDateTimePicker,
  IQMS.WebVcl.DropDownButton, IQMS.WebVcl.BookMark, Vcl.DBCtrls,
  IQMS.WebVcl.QueryNavigator;

type
  TFrmPoBase = class(TUniFrame)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    New1: TUniMenuItem;
    Delete1: TUniMenuItem;
    Archive1: TUniMenuItem;
    Search1: TUniMenuItem;
    N1: TUniMenuItem;
    AddItem1: TUniMenuItem;
    DeleteItem1: TUniMenuItem;
    N2: TUniMenuItem;
    Exit1: TUniMenuItem;
    Options1: TUniMenuItem;
    VendorList1: TUniMenuItem;
    ShipViaList1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PopupMenu1: TUniPopupMenu;
    Copy1: TUniMenuItem;
    Paste1: TUniMenuItem;
    Copy2: TUniMenuItem;
    Paste2: TUniMenuItem;
    N6: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetUp1: TUniMenuItem;
    Panel1: TUniPanel;
    SBSearchPurch: TUniSpeedButton;
    SBGridView: TUniSpeedButton;
    SearchbyLineItem1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    N3: TUniMenuItem;
    N4: TUniMenuItem;
    PriceBreaks1: TUniMenuItem;
    SrcPriceBreaks: TDataSource;
    TblPriceBreaks: TFDTable;
    N5: TUniMenuItem;
    JumptoInventory1: TUniMenuItem;
    JumptoPOReceipts1: TUniMenuItem;
    SBPrint: TUniSpeedButton;
    N7: TUniMenuItem;
    PoReport1: TUniMenuItem;
    N8: TUniMenuItem;
    ViewArchivedPOs1: TUniMenuItem;
    N9: TUniMenuItem;
    TaxCodes1: TUniMenuItem;
    TermsMaintenance1: TUniMenuItem;
    PkBoiler: TIQWebHPick;
    PkBoilerID: TFloatField;
    PkBoilerDESCRIP: TStringField;
    N10: TUniMenuItem;
    VersionControl1: TUniMenuItem;
    N11: TUniMenuItem;
    CostSource1: TUniMenuItem;
    ProjectManager1: TUniMenuItem;
    N12: TUniMenuItem;
    UnassignCostSource1: TUniMenuItem;
    sbtnNotApprovedList: TUniSpeedButton;
    PreventativeMaintenance1: TUniMenuItem;
    ArchiveclosedPOs1: TUniMenuItem;
    AssignDetailEPlant1: TUniMenuItem;
    RepeatLine1: TUniMenuItem;
    SBView: TUniSpeedButton;
    RepeatLine2: TUniMenuItem;
    Contents1: TUniMenuItem;
    FormView1: TUniMenuItem;
    ToggleFormGridView1: TUniMenuItem;
    BoilerPlates1: TUniMenuItem;
    LoadfromBoilerPlate1: TUniMenuItem;
    ViewEditBoilerPlates1: TUniMenuItem;
    SaveasBoilerPlate1: TUniMenuItem;
    PopupMenu2: TUniPopupMenu;
    TracePO1: TUniMenuItem;
    TraceDetail1: TUniMenuItem;
    ShowpayablesforthisPO1: TUniMenuItem;
    N13: TUniMenuItem;
    Recalculatereceivedreleases1: TUniMenuItem;
    N14: TUniMenuItem;
    GenerateReleases1: TUniMenuItem;
    CopyReleases1: TUniMenuItem;
    PasteReleases1: TUniMenuItem;
    JobShop1: TUniMenuItem;
    N15: TUniMenuItem;
    ReceiptInformation1: TUniMenuItem;
    N16: TUniMenuItem;
    AddFromInventory1: TUniMenuItem;
    AddMiscellaneousItem1: TUniMenuItem;
    AddFromAKA1: TUniMenuItem;
    ShowCARsECOs1: TUniMenuItem;
    popmChangeStatus: TUniPopupMenu;
    ApprovePO1: TUniMenuItem;
    DenyPO1: TUniMenuItem;
    RevertToNotApproved1: TUniMenuItem;
    PVendor: TUniPopupMenu;
    PRemitTo: TUniPopupMenu;
    PShipTo: TUniPopupMenu;
    EditVendor1: TUniMenuItem;
    EditRemitTo1: TUniMenuItem;
    EditShipTo1: TUniMenuItem;
    MultiselectDetail1: TUniMenuItem;
    FixedAssets1: TUniMenuItem;
    QryBreaks: TFDQuery;
    ShowReleasesActivity1: TUniMenuItem;
    pgctrlPO: TUniPageControl;
    TabPO: TUniTabSheet;
    Panel6: TUniPanel;
    PCMain: TUniPageControl;
    TabGrid: TUniTabSheet;
    wwGridHeader: TIQUniGridControl;
    TabForm: TUniTabSheet;
    Panel23: TUniPanel;
    Splitter8: TUniSplitter;
    PnlHeader04: TUniPanel;
    ScrollBox1: TUniScrollBox;
    Panel13: TUniPanel;
    sbtApprove: TUniSpeedButton;
    wwDBComboPOType: TUniDBLookupComboBox;
    dbeApprovedBy: TUniDBEdit;
    wwDBComboDlgBuyer: TUniEdit;
    DBConfirmTo: TUniDBEdit;
    wwdblookPR_Emp: TUniDBLookupComboBox;
    dbchkAllowWorkflow: TUniDBCheckBox;
    PnlApprovalLeft: TUniPanel;
    Label19: TUniLabel;
    lblApprovedBy: TUniLabel;
    Label15: TUniLabel;
    Label16: TUniLabel;
    Label18: TUniLabel;
    Label23: TUniLabel;
    PnlHeader: TUniPanel;
    PnlHeaderFields: TUniPanel;
    Splitter5: TUniSplitter;
    Splitter3: TUniSplitter;
    PnlHeader01: TUniPanel;
    Splitter7: TUniSplitter;
    PnlHeaderLeft01: TUniPanel;
    Label1: TUniLabel;
    Label10: TUniLabel;
    Label7: TUniLabel;
    Label11: TUniLabel;
    Label17: TUniLabel;
    Label22: TUniLabel;
    Panel21: TUniPanel;
    dbPoNo: TUniDBEdit;
    wwComboVendor: TUniDBEdit;
    wwComboRemit: TUniDBLookupComboBox;
    wwComboShip: TUniDBLookupComboBox;
    wwArcusto: TUniDBEdit;
    cmbVendorContact: TUniDBLookupComboBox;
    PnlHeader02: TUniPanel;
    Splitter4: TUniSplitter;
    PnlHeaderLeft02: TUniPanel;
    Label4: TUniLabel;
    Label3: TUniLabel;
    Label9: TUniLabel;
    Label8: TUniLabel;
    Panel17: TUniPanel;
    DBUserId: TUniDBEdit;
    wwComboTerms: TUniDBLookupComboBox;
    dbFob: TUniDBLookupComboBox;
    wwComboFreight: TUniDBLookupComboBox;
    PnlHeader03: TUniPanel;
    Splitter6: TUniSplitter;
    PnlHeaderLeft03: TUniPanel;
    Label2: TUniLabel;
    LblCurrency: TUniLabel;
    Label6: TUniLabel;
    Label20: TUniLabel;
    SBTaxBreakdown: TUniSpeedButton;
    Panel18: TUniPanel;
    wwPoDate: TUniDBDateTimePicker;
    wwComboTaxCodes: TUniDBLookupComboBox;
    dbePlant: TUniDBEdit;
    DBcurrency: TUniDBEdit;
    PnlComment: TUniPanel;
    PnlNoteLabel: TUniPanel;
    lblNote: TUniLabel;
    Panel26: TUniPanel;
    DBComment1: TUniDBEdit;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    Panel12: TUniPanel;
    GridDetail: TIQUniGridControl;
    Panel5: TUniPanel;
    btnCurrency1: TUniSpeedButton;
    sbtnSeachPODetail: TUniSpeedButton;
    sbFg: TUniSpeedButton;
    sbMisc: TUniSpeedButton;
    sbAka: TUniSpeedButton;
    Panel2: TUniPanel;
    Splitter10: TUniSplitter;
    PnlTotals: TUniPanel;
    PnlForeignCurrency: TUniPanel;
    btnCurrency2: TUniSpeedButton;
    PnlTotalsInner: TUniPanel;
    Splitter9: TUniSplitter;
    Panel15: TUniPanel;
    DBSubTotal: TUniDBEdit;
    DBTotalTax: TUniDBEdit;
    DBTotal: TUniDBEdit;
    PnlTotalsLeft: TUniPanel;
    Label12: TUniLabel;
    Label13: TUniLabel;
    Label14: TUniLabel;
    Panel10: TUniPanel;
    Bevel2: TUniPanel;
    Panel11: TUniPanel;
    Label21: TUniLabel;
    sbtnRecalc: TUniSpeedButton;
    sbHide: TUniSpeedButton;
    edTotRel: TUniEdit;
    Panel8: TUniPanel;
    GridReleases: TIQUniGridControl;
    Splitter2: TUniSplitter;
    SBScan: TUniSpeedButton;
    JumptoDropShipSO1: TUniMenuItem;
    DropShipReporting1: TUniMenuItem;
    Panel3: TUniPanel;
    SBSearchVend: TUniSpeedButton;
    SBSearchRemitTo: TUniSpeedButton;
    SBSearchShipTo: TUniSpeedButton;
    IQUserDefLblPopUpMenu: TUniPopupMenu;
    DefineLabelText1: TUniMenuItem;
    IQUserDefLabelOnGrid: TIQWebUserDefLabel;
    ManualReceivedQuantityAdjustment1: TUniMenuItem;
    ApprovalTemplates1: TUniMenuItem;
    ApproversTeam1: TUniMenuItem;
    PnlCarrier: TUniPanel;
    bvTopBuffer: TUniPanel;
    bvRightBuffer: TUniPanel;
    bvBottomBuffer: TUniPanel;
    JumptoVendor1: TUniMenuItem;
    POTypesMaintenance1: TUniMenuItem;
    ClonePO1: TUniMenuItem;
    ClosePO1: TUniMenuItem;
    PopupUserDefLabel: TUniPopupMenu;
    MenuItem1: TUniMenuItem;
    sbtnContact1: TUniSpeedButton;
    MarkAllReleasesAcknowledged1: TUniMenuItem;
    N17: TUniMenuItem;
    UpdateGLAccount1: TUniMenuItem;
    UpdateUnitPrice1: TUniMenuItem;
    IQUserDefLabelOnGrid2: TIQWebUserDefLabel;
    IQUserDefLabelOnGrid3: TIQWebUserDefLabel;
    FilterPORequisitionsByUserID1: TUniMenuItem;
    sbHideDetails: TUniSpeedButton;
    SBSearchCustomer: TUniSpeedButton;
    bvLeftBuffer: TUniPanel;
    N18: TUniMenuItem;
    AssignAcctviapicklist1: TUniMenuItem;
    PkGlAcct: TIQWebHPick;
    PkGlAcctID: TBCDField;
    PkGlAcctACCT: TStringField;
    PkGlAcctDESCRIP: TStringField;
    PkGlAcctTYPE: TStringField;
    PkGlAcctEPLANT_ID: TBCDField;
    POMiscellaneousItemsMaintenance1: TUniMenuItem;
    PkMisc: TIQWebHPick;
    PkMiscID: TFloatField;
    PkMiscMISC_ITEM: TStringField;
    PkMiscMISC_ITEMNO: TStringField;
    PkMiscUNIT_PRICE: TFloatField;
    PkMiscGLACCT_ID_INV: TFloatField;
    PkMiscUNIT: TStringField;
    PkMiscACCT: TStringField;
    PkMiscVENDORNO: TStringField;
    PkMiscVENDOR: TStringField;
    PkMiscQUAN: TFloatField;
    PkMiscEPLANT_ID: TFloatField;
    BatchDropShipReporting1: TUniMenuItem;
    QryEserverAct: TFDQuery;
    SrcEserverAct: TDataSource;
    QryEserverPO: TFDQuery;
    SrcEserverPO: TDataSource;
    QryEserverActTYPE: TStringField;
    QryEserverActDESCRIPTION: TStringField;
    QryEserverActTRANSACTION_SET_CODE: TStringField;
    QryEserverActUNIQUE_ID: TStringField;
    QryEserverActAUTO_UPDATE_PO: TStringField;
    QryEserverPOPONO: TStringField;
    PopupMenuBudgetComp: TUniPopupMenu;
    Single1: TUniMenuItem;
    All1: TUniMenuItem;
    dbInvoiceOnHold: TUniDBCheckBox;
    Label5: TUniLabel;
    Label24: TUniLabel;
    DBOnHoldReason: TUniEdit;
    wwMemoDialog1: TwwMemoDialog;
    PnlGeneralInner_VendorClient: TUniPanel;
    EditMiscellaneousItem1: TUniMenuItem;
    PkMiscMISC_NOTE: TStringField;
    FOB1: TUniMenuItem;
    pnlApprovalLeftTop1: TUniPanel;
    pnlApprovalClientTop1: TUniPanel;
    pnlApprovalLeftTop2: TUniPanel;
    pnlApprovalClientTop2: TUniPanel;
    pnlApprovalLeftTop3: TUniPanel;
    lblWorkflowTemplate: TUniLabel;
    pnlApprovalClientTop3: TUniPanel;
    dbchkWorkflowStarted: TUniDBCheckBox;
    N19: TUniMenuItem;
    ClearTax1: TUniMenuItem;
    QryEserverActUPDATE_BLANKET_QTY: TStringField;
    popmWorkflows: TUniPopupMenu;
    Workflows1: TUniMenuItem;
    RewindResetWorkflowApprovalProcess1: TUniMenuItem;
    QryEserverActACTION_ID: TBCDField;
    QryEserverActDAYS_SCOPE: TBCDField;
    QryEserverActMON_ACT_DETAIL_ID: TBCDField;
    QryEserverActMON_VENDOR_EDI_ID: TBCDField;
    QryEserverActACT_MON_ID: TBCDField;
    QryEserverActVENDOR_ID: TBCDField;
    QryEserverPOPO_ID: TBCDField;
    QryEserverPOID: TBCDField;
    TblPriceBreaksARINVT_ID: TBCDField;
    TblPriceBreaksID: TBCDField;
    TblPriceBreaksQUAN: TBCDField;
    TblPriceBreaksQPRICE: TFMTBCDField;
    TblPriceBreaksPRICE_DATE: TDateTimeField;
    TblPriceBreaksEFFECT_DATE: TDateTimeField;
    TblPriceBreaksDEACTIVE_DATE: TDateTimeField;
    TblPriceBreaksBUYING: TStringField;
    sbtnMarkAllReleasesAcknowledged1: TUniSpeedButton;
    PnlToolbarDetailStandardBtns: TUniPanel;
    Bevel3: TUniPanel;
    Bevel4: TUniPanel;
    Panel22: TUniPanel;
    sbtnMultiSelectAddInventory: TUniSpeedButton;
    pnlLeft: TUniPanel;
    sbtnCheckAddress: TUniSpeedButton;
    SBCalcTax: TUniSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SBGridViewClick(Sender: TObject);
    procedure SBSearchVendClick(Sender: TObject);
    procedure SBSearchRemitToClick(Sender: TObject);
    procedure SBSearchPurchClick(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure GridHeaderEditButtonClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetUp1Click(Sender: TObject);
    procedure ShipViaList1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure AddItem1Click(Sender: TObject);
    procedure DeleteItem1Click(Sender: TObject);
    procedure SearchbyLineItem1Click(Sender: TObject);
    procedure Archive1Click(Sender: TObject);
//    procedure GridDetailCalcCellColors(Sender: TObject; Field: TField;
//      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
//      ABrush: TBrush);
    procedure PriceBreaks1Click(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure SBSearchShipToClick(Sender: TObject);
    procedure JumptoPOReceipts1Click(Sender: TObject);
    procedure SBPrintClick(Sender: TObject);
    procedure NavDetailBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure ViewArchivedPOs1Click(Sender: TObject);
    procedure TaxCodes1Click(Sender: TObject);
    procedure TermsMaintenance1Click(Sender: TObject);
    procedure btnCurrency1Click(Sender: TObject);
    procedure btnCurrency2Click(Sender: TObject);
    procedure ViewSelectBoilerPlate1Click(Sender: TObject);
    procedure SaveAsBoilerPlate1Click(Sender: TObject);
    procedure LoadfromBoilerPlate1Click(Sender: TObject);
    procedure wwDBComboUOMDropDown(Sender: TObject);
    procedure cbCurrencyDropDown(Sender: TObject);
    procedure VersionControl1Click(Sender: TObject);
    //procedure PopupMenu1Popup(Sender: TObject);
    procedure ApprovePO(Sender: TObject);
    procedure sbtnNotApprovedListClick(Sender: TObject);
    procedure ArchiveclosedPOs1Click(Sender: TObject);
    procedure sbtnAssignEPlantClick(Sender: TObject);
    procedure AssignDetailEPlant1Click(Sender: TObject);
    procedure RepeatLine1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnSeachPODetailClick(Sender: TObject);
    procedure FormView1Click(Sender: TObject);
    procedure LimitLookupToVendor(Sender: TObject);
    procedure UnLimitLookupToVendor(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
//    procedure wwGridHeaderCalcCellColors(Sender: TObject; Field: TField;
 //     State: TGridDrawState; Highlight: Boolean; AFont: TFont;
//      ABrush: TBrush);
    procedure dbPoNoEnter(Sender: TObject);
    procedure TracePO1Click(Sender: TObject);
    procedure TraceDetail1Click(Sender: TObject);
    procedure ShowpayablesforthisPO1Click(Sender: TObject);
//    procedure GridReleasesCalcCellColors(Sender: TObject;
 //     Field: TField; State: TGridDrawState; Highlight: Boolean;
 //     AFont: TFont; ABrush: TBrush);
    procedure GridDetailMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridReleasesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GridReleasesDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure NavReleasesBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure sbtnRecalcClick(Sender: TObject);
    //procedure GenerateReleases1Click(Sender: TObject);
    procedure CopyReleases1Click(Sender: TObject);
    procedure PasteReleases1Click(Sender: TObject);
    procedure wwdblookPR_EmpDropDown(Sender: TObject);
    procedure wwdblookPR_EmpCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure ReceiptInformation1Click(Sender: TObject);
    procedure sbMiscClick(Sender: TObject);
    procedure AddFromInventory1Click(Sender: TObject);
    procedure AddMiscellaneousItem1Click(Sender: TObject);
    procedure AddFromAKA1Click(Sender: TObject);
    procedure DBItemnoCustomDlg(Sender: TObject);
    procedure ShowCARsECOs1Click(Sender: TObject);
    procedure wwDBComboDlgBuyerCustomDlg(Sender: TObject);
    procedure sbtApproveClick(Sender: TObject);
    procedure RevertToNotApproved1Click(Sender: TObject);
    procedure DenyPO1Click(Sender: TObject);
    procedure popmChangeStatusPopup(Sender: TObject);
    procedure EditVendor1Click(Sender: TObject);
    procedure EditRemitTo1Click(Sender: TObject);
    procedure EditShipTo1Click(Sender: TObject);
    procedure PnlHeaderLeft01Resize(Sender: TObject);
    procedure sbHideClick(Sender: TObject);
    procedure MultiselectDetail1Click(Sender: TObject);
    procedure cmbVendorContactDropDown(Sender: TObject);
    procedure SBTaxBreakdownClick(Sender: TObject);
    procedure ShowReleasesActivity1Click(Sender: TObject);
    procedure SBScanClick(Sender: TObject);
    procedure JumptoDropShipSO1Click(Sender: TObject);
    procedure DropShipReporting1Click(Sender: TObject);
    procedure IQUserDefLblPopUpMenuPopup(Sender: TObject);
    procedure GridReleasesTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure sbtnWorkflowsClick(Sender: TObject);
    procedure ManualReceivedQuantityAdjustment1Click(Sender: TObject);
    procedure ApprovalTemplates1Click(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure ApproversTeam1Click(Sender: TObject);
    procedure JumptoVendor1Click(Sender: TObject);
    procedure POTypesMaintenance1Click(Sender: TObject);
    procedure Panel21Resize(Sender: TObject);
    procedure PnlHeader04Resize(Sender: TObject);
    procedure pgctrlPOChange(Sender: TObject);
    procedure ClonePO1Click(Sender: TObject);
    procedure wwDBComboDlgPODetailCommentCustomDlg(Sender: TObject);
    procedure GridDetailTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure IQUserDefLabelPoDetailCUser1GetOwnerName(Sender: TObject;
      var AOwnerName: String);
    procedure ClosePO1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure sbtnContact1Click(Sender: TObject);
    procedure MarkAllReleasesAcknowledged1Click(Sender: TObject);
    procedure UpdateGLAccount1Click(Sender: TObject);
    procedure UpdateUnitPrice1Click(Sender: TObject);
    procedure wwComboFreightBeforeDropDown(Sender: TObject);
    procedure wwComboFreightCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FilterPORequisitionsByUserID1Click(Sender: TObject);
    procedure sbHideDetailsClick(Sender: TObject);
    procedure SBBudgetComp1Click(Sender: TObject);
    procedure SBSearchCustomerClick(Sender: TObject);
    procedure NavHeaderBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure AssignAcctviapicklist1Click(Sender: TObject);
    procedure POMiscellaneousItemsMaintenance1Click(Sender: TObject);
    procedure PkMiscIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure sbFreightClick(Sender: TObject);
    procedure BatchDropShipReporting1Click(Sender: TObject);
//    procedure IQSearch1CalcCellColors(Sender: TObject; Field: TField;
//     State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
//    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
//      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure QryEserverPOAfterScroll(DataSet: TDataSet);
    procedure QryEserverPOBeforeInsert(DataSet: TDataSet);
    procedure QryEserverActAfterScroll(DataSet: TDataSet);
    procedure SBBudgetCompClick(Sender: TObject);
    procedure All1Click(Sender: TObject);
    procedure DBOnHoldReasonCustomDlg(Sender: TObject);
    procedure EditMiscellaneousItem1Click(Sender: TObject);
    procedure FOB1Click(Sender: TObject);
    procedure dbchkWorkflowStartedClick(Sender: TObject);
    procedure DbTaxCodeCustomDlg(Sender: TObject);
    procedure ClearTax1Click(Sender: TObject);
    procedure RewindResetWorkflowApprovalProcess1Click(Sender: TObject);
    procedure QryEserverPOUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
    procedure SRAfterApply(Sender: TObject);
    procedure wwGlAcctCustomDlg(Sender: TObject);
    procedure wwDBcomboDivisionCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbVendorContactBeforeDropDown(Sender: TObject);
    procedure cmbVendorContactCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbtnMultiSelectAddInventoryClick(Sender: TObject);
    procedure sbtnCheckAddressClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SBCalcTaxClick(Sender: TObject);
    procedure wwGlAcctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBcomboDivisionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
  private
    { Private declarations }
//    FCostSourceManager: ICostSourceManager;

    // procedure CheckPO_CheckStdCost(AId:Real);
    //procedure UpdateSalesPriceThisItemAllPOs( AParam: TPOPriceUpdateParam );
    //procedure UpdateSalesPriceAllItemsAllPOs( AParam: TPOPriceUpdateParam );
    procedure ResetTaxCode(AVendor_ID, aPOId: Real; ATaxCodeField:TField);
    procedure ResetTaxable(Arinvt_ID: Real; ATaxableField:TField);
    procedure AssignPODetailDivisionBasedOnShipTo(AShipTo_ID: Real);
    procedure AssignUnitPriceEx(const AQuantity: Real; const AArinvtID,
      AArinvtVendorsID: Int64; const AUOM: string; var APricePer1000,
      AUnitPrice, AStdCost: Real);
//    procedure AddPODetail(const APOID, AArinvtID: Int64;
//      var APODetailID: Int64);
    procedure SetTaxButton;
 //   procedure DoAssignCostSource(const ACostSourceMenuType: TCostSourceMenuType;
 //     var AHandled: Boolean);
    procedure DoUnAssignCostSource(var AHandled: Boolean);
 //   procedure ProcessCostSource(const ACostSourceMenuType: TCostSourceMenuType);
  protected
    gId:Real;
    gMisc_Item:String;
    gMisc_Itemno:String;
    gArinvtId:Real;
    gTotQty:Real;
    gUnitPrice:Real;
    gReqDate:TDateTime;
    gCmtLine:String;
    gClosed:String;
    gTaxable:String;
    gAcctId:Real;
    gUOM: string;
    //fHint:TNotifyEvent;
    //FSaveOnShowHint: TShowHintEvent;
    FMultiCurrency:Boolean;
    FPo_Detail_ID: Real;

    FCopy_Detail_ID: Real;
    FUpdateUnitPrice :boolean;

    procedure TblPoDetailFilterRecord(DataSet: TDataSet;  var Accept: Boolean);
    procedure TblPoDetailAfterInsert(DataSet: TDataSet);
    procedure SrcPoDetailDataChange(Sender: TObject; Field: TField);
    procedure TblPoDetailTOTAL_QTY_ORDChange(Sender: TField);
    procedure TblPoDetailUNIT_PRICEChange(Sender: TField);

    procedure AssignRemitTo(nId:Real);

    procedure CheckPriceBreaksCaption;
    procedure Startup( AMode: Integer = 0 );  // 0 - normal, 1 - suspend opening po, po_detail, po_releases for performance gain and only open them after picklist
    procedure SetCriteriaExpression( List:TStringList; cStr:String );

//    function InsertDetailRecord( AArinvtID, AQty, ADivision_ID: Real; ADate:TDateTime = 0): Real; //overload;
//    function InsertDetailRecord( APoItem: TPOItem; AQty: Real; ADate:TDateTime = 0): Real; overload;
//    function InsertDetailRecord_Ex(APOItem: TPOItem; ArinvtVendorsID:Real = 0 ): Real;
    procedure InsertReleaseRecord( APo_Detail_ID, AQty: Real; ADate: TDateTime );
    procedure AssignMirrorValueTo( AField:TField; AValue:Real );
    procedure CheckMinOrderQty( Qty_Ord: Real; const cTable, cIdField: string; nId: Real; Act_UOM, Std_UOM: string; AArinvt_ID: Real  );
    procedure CheckMultiCurrency;
//    procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure AssignVendorID( AVendor_ID, ATerms_ID: Real );
    function Get_PO_Limit_Text: string;
    procedure ValidateArchive;
    procedure AssignSequence;
    procedure AssignTaxable;
    procedure IQNotifyInsertMessage( var Msg: TMessage ); message iq_Notify;
    procedure IQRefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;
//    procedure DoPasteReleases( APO_Detail_ID_Trg, APO_Detail_ID_Src: Real; AOverwrite: Boolean );
    //procedure GenerateReleasesFromInput( ARelInputCargo: TRelInputCargo; APO_Detail_ID: Real );
    function Get_GLAcct_ID_Exp_FromVendor( AVendor_ID: Real ): Int64;

    procedure SelectFromPkArinvt;
    procedure AppendMultiFromArinvt;
    procedure AppendMultiFromAka;
    procedure SelectfromPkAkA;
   // procedure SelectFromFreeForm;
    procedure CheckUnitPriceOnInsert(AkaId:Real = 0);

    procedure EnableMultiSelect( AEnabled: Boolean );
//    procedure DoMultipleCostSource(AType: IQMS.CostSource.Types.TCostSourceMenuType);
//    procedure CheckClearCostSourceGLAcctInv(AType: IQMS.CostSource.Types.TCostSourceMenuType);

    function Update_Approved( AValue: string ): Boolean;
    function IsNonInventoryItem: Boolean; overload;
    function IsNonInventoryItem(const AArinvtID: Int64): Boolean; overload;

    procedure UpdateUserLabelColumnTitle(const AFieldName, ATitleText: string; ADataSet: TDataSet = nil; ADBGrid: TIQUniGridControl = nil );
    procedure AssignAfterInsertValues;
    procedure ShowAsPurchaseOrder;
    procedure ShowAsRequisition;
    procedure UpdatePriceThisPO;
    function Get_SignOffStuff: string;
    procedure CheckPoVMIDelete;

    //procedure DoOnPoChanged(APoChanges: TPO_Changes);
  public
    { Public declarations }
    DM: TDM_PO;
    //fPOPriceBreaks:TFrmPoPriceBreaks;
    FormIsLoaded : Boolean;
    FormIsCreated: Boolean;
    FIsStartupInvoked: Boolean;
    FOldPONO:String;
    //FRelInputCargo: TRelInputCargo;
    FwwBlanketQtyIsChanging: Boolean;
    FAssigningCostSource:boolean;
    FDisableFilteringByUserid: Boolean;
    FRefreshPODerails:boolean;
    FIsWorkflowTemplateBased: Boolean;
    function IsFilterByUserID: Boolean;
    //procedure CheckMultipleOf(AQry: TDataSet; var ARelInputCargo: TRelInputCargo );
    procedure AssignPOCostSource( APODetailID, AToolTaskElementID: Real;
                                  ACostSourceString: String );

    constructor CreateJump(AOwner:TComponent; StartOnID:Real );
    constructor CreateJumpHeader(AOwner:TComponent; APO_ID:Real );
    constructor CreateNew(AOwner:TComponent);
    // constructor CreateNewPoWithArinvtId(AOwner:TComponent; AID, AQty:Real; ADate:TDateTime; AVendor_ID, ADivision_ID: Real );
    // constructor CreateNewPoItemWithArinvtId(AOwner:TComponent; AID, AQty:Real; ADate:TDateTime; AVendor_ID, ADivision_ID: Real );

    constructor CreateNewPoWithReleases( AOwner:TComponent; AVendor_ID: Real; APOItems: TList; ArinvtVendorsID:Real = 0  );
//    constructor CreateNewPoItemWithReleases( AOwner:TComponent; APO_ID: Real; APOItem: TPOItem );

    procedure UpdateReleasesFooter( ATotal: Real = -999999 );
    //procedure AddDetailRecord(APO_ID: Real; APOItem: TPOItem);
    procedure UpdatePriceThisItem( AQty: Real = 0 );

    {requisition}
    function IsRequisitionClass: Boolean;
    // procedure AssignPOTableFilter( Dataset: TDataSet );
    // procedure AssignPOPickListFilter( Dataset: TDataSet );
    procedure CheckIsDisp_po_id_as_requisition;virtual;
    procedure AssignUnitPrice(AQtyPO: Real = -1);
    function LocatePO(const APO_ID: Real; ARefresh: Boolean = False): Boolean;
    function ShowAllMainRecords: Boolean;
  end;

  const
    cTXT0000001 = 'PO not found.  Cannot create new record';
   cTXT0000002 = 'PO Status: Not Approved.'#13'Click to Approve or Deny.';
   cTXT0000003 = 'PO Status: Denied.'#13'Click to Approve or Revert to Unapproved.';
   cTXT0000004 = 'PO Status: Approved.'#13'Click to Unapprove or Deny.';
   cTXT0000005 = 'Tax Components:';
   cTXT0000006 = 'Record was not archived';
   cTXT0000007 = 'Record archived successfully';
   cTXT0000008 = 'Some items are not closed.  Cannot archive.';
   cTXT0000009 = 'Archive PO # %s?';
   cTXT0000010 = 'The Note field exceeded 2000 characters and has been truncated.';
   cTXT0000011 = 'Miscellaneous Item - No price breaks';
   cTXT0000012 = 'Price List for Item %s, Revision %s';
   cTXT0000013 = 'Blanket Quantity has changed. Update the Unit Price?';
   cTXT0000014 = 'Multiple rows are selected.  Do you wish to unassign the cost source for all the selected records?';

   cTXT0000015 = 'User Name: %s';
   cTXT0000016 = 'PO Total : %m';
   cTXT0000017 = 'PO Cost Limits:';
   cTXT0000018 = 'Raw Material: %m ';
   cTXT0000019 = 'Capital: %m';
   cTXT0000020 = 'Expense: %m';
   cTXT0000021 = 'Cost increase: Not Authorized';

   cTXT0000022 = 'Cannot change EPlant. PO Detail Item and Inventory Item must have the same EPlant.';
   cTXT0000023 = 'Please post changes before repeating.';
   cTXT0000024 = 'Form View';
   cTXT0000025 = 'Updating PO Receipts.  Please wait...';
   cTXT0000026 = 'Attempt to re-evaluate PO Receipts against PO Releases failed because of the following error:';
   cTXT0000027 = 'Failed to change the status to %s.'#13#13'%s';
   cTXT0000028 = 'Releases received in full are hidden.'#13'Click to show.';
   cTXT0000029 = 'Hide releases received in full.';

   cTXT0000030 = 'Multiple rows are selected.  Do you wish to reassign the cost source of the selected records?';
   cTXT0000031 = 'Compressing tables, please wait...';
   cTXT0000032 = 'Update %s column title';
   cTXT0000033 = 'Nothing to Adjust';
   cTXT0000034 = 'Invalid Qty.';
   cTXT0000035 = 'Check to display Purchase Orders for %s';
   cTXT0000036 = 'Check to display Purchase Orders below limit for %s';
   cTXT0000037 = 'User ID: %s';
   cTXT0000038 = 'Mode: %s';
   cTXT0000039 = 'Click to view hierarchical tree of users who can be approved by %s';
   cTXT0000040 = 'Evaluation completed.';
   cTXT0000041 = 'This option clears PO Rejection so that the next time ' +
    'Evaluate Workflow runs it will be resubmitted for approval.'#13#13 +
    'Are you sure you want to continue?';
   cTXT0000042 = 'If this option is checked, once PO Workflow is rejected and ' +
    'restarted, the entire Workflow process will be re-applied in full.'#13#13 +
    'Are you sure you want to activate this setting?';
   cTXT0000043 = 'This option ensures that once PO Workflow is rejected and ' +
    'restarted, the entire Workflow process will be re-applied in full.'#13#13 +
    'The setting is currently on. Are you sure you want to turn off this setting?';
   cTXT0000044 = 'Purchase Order # %s';
   cTXT0000045 = 'Accessing Purchase Orders.  Please wait.';
   cTXT0000046 = 'Vendor Filter is off.  Click to turn on.';
   cTXT0000047 = 'Vendor Filter is on. Click to turn off.';
   cTXT0000048 = 'Vendor not found.';
   cTXT0000049 = 'Purchase Order cloned successfully.'#13 +
    'One or more items were not found in Inventory and could not be cloned.'#13 +
    'New Purchase Order #:  %s';
   cTXT0000050 = 'Purchase Order cloned successfully.'#13 +
    'New Purchase Order #:  %s';
   cTXT0000051 = 'Purchase Order could not be cloned.';
   cTXT0000052 = 'Do you wish to UnArchive selected POs?';
   cTXT0000053 = 'Processing.  Please wait.';
   cTXT0000054 = 'Process Complete.';
   cTXT0000055 = 'Invalid Starting Year.  Cannot continue.';
   cTXT0000056 = 'Please select an Inventory item.  Cannot continue.';
   cTXT0000057 = 'Please select a Vendor.  Cannot continue.';
   cTXT0000058 = 'GL Account requires entry of a Cost Source.';
   cTXT0000059 = 'Unit price has changed.  Update uninvoiced receipts?';
   cTXT0000060 = 'Standard Cost is not assigned.';
   cTXT0000061 = 'Purchase Order %s for %s (Vendor # %s)';
   cTXT0000062 = 'Requisition %s for %s (Vendor # %s)';
   cTXT0000063 = 'Unit Price is greater than Standard Item Price. Continue?';
   cTXT0000064 = 'Unit Price is greater than Standard Item Price.';
   cTXT0000065 = 'Unable to locate requisition %d.  The first available ' +
     'record has been selected.';
   cTXT0000066 = 'Items marked Closed are hidden.';
   cTXT0000067 = 'Press to hide Items marked Closed.';
   cTXT0000068 = 'Reviewer: ';
   cTXT0000069 = 'Authorizer: ';
   cTXT0000070 = 'Sign Off Date: ';
   cTXT0000071 = 'Sign Off Notes: ';
   cTXT0000072 = 'PO Status: Denied.';
   cTXT0000073 = 'Click to Approve or Deny.';
   cTXT0000074 = 'PO Status: ';
   cTXT0000075 = 'Click to Deny or Revert to Unapproved.';
   cTXT0000076 = 'Click to Approve or Revert to Unapproved.';
   cTXT0000077 = 'Buyer is not assigned - operation aborted';
   cTXT0000078 = 'Cannot delete a received item - operation aborted';
   cTXT0000079 = 'Warning!'#13'Release received in full or Release partially received.'#13#13'Are you sure you want to continue?';
   cTXT0000080 = 'This is a full or partial received release - operation aborted per user instruction.';
   cTXT0000081 = 'Enable Workflow?';
   cTXT0000082 = 'Are you sure you want to delete Purchase Order # %s?';
   cTXT0000083 = 'Transaction location plan needs to be recalculated';
   cTXT0000084 = 'System parameters prevent modifying a closed PO line. Check with your DBA.';
   cTXT0000085 = 'Not Approved.';
   cTXT0000086 = 'Standard Cost is not assigned. Do you wish to Continue?';
   cTXT0000087 = 'Use for customer supplied materials.';
   cTXT0000088 = 'PO Item %s Information';
   cTXT0000089 = 'Approved';
   cTXT0000090 = 'Status';
   cTXT0000091 = 'PO# %s status is ''%s''.'#13#13 +
     'About to attempt to approve the PO.';
   cTXT0000092 = 'This is a drop ship PO associated with a sales order # %s.'#13+
     'Direct PO modifications or receipts are not allowed.'#13+
     'Changes must be made to the associated sales order.';
   cTXT0000093 = 'This is a drop ship PO associated with a sales order # %s.'#13 +
     'Modifications should be made to the associated sales order.'#13#13+
     'Are you sure you want to continue?';
   cTXT0000094 = 'Misc. Item';
   cTXT0000095 = 'PO # %s status is ''%s''.'#13#13 +
     'About to attempt to approve the PO.';
   cTXT0000096 = 'No PO Workflow exists.  Operation aborted.';
   cTXT0000097 = 'Is this a purchase order revision?';
   cTXT0000098 = 'The total quantity of the releases (%.4f) for %s is greater ' +
     'than the blanket quantity (%.4f).  This may affect PO approval.  What ' +
     'do you want to do?';
   cTXT0000099 = 'A release must be attached to a PO line';
   cTXT0000100 = 'Over receipt on purchase order message';
   cTXT0000101 = 'Please enter a Request Date.';
   cTXT0000102 = 'Please enter a Promise Date.';
   cTXT0000103 = 'Release quantity must be greater than 0.00.';
   cTXT0000104 = 'A Shipping address has not been assigned to the Purchase Order.';
   cTXT0000105 = 'Please enter a PO number.';
   cTXT0000106 = 'This PO number %s already exists in the history table.  ' +
     'Please enter a different PO number.';
   cTXT0000107 = 'Unable to locate requested record [ID = %.0f].';
   cTXT0000108 = 'Originated under EPlant, %s.';
   cTXT0000109 = 'Jump to PO Workflow';
   cTXT0000110 = 'The selected quantity (%f %s) is less than the minimum ' +
     'quantity (%f %s) in the Quantity/Price breaks table (%s).';
   cTXT0000111 = 'No PO Workflow exists for PO # %s.';
   cTXT0000112 = 'No PO Workflow exists for %s.';
   cTXT0000113 = 'Unknown PO Status: %s';
   cTXT0000114 = 'Requisition #';
   cTXT0000115 = 'PO #';
   cTXT0000116 = 'This option will update the unit price for the selected ' +
     'item on all purchase orders.'#13#13'Do you wish to continue?';
   cTXT0000117 = 'This option will update the unit price for all items on ' +
     'all purchase orders.'#13#13'Do you wish to continue?';
   cTXT0000118 = 'Delete the current record?';
   cTXT0000119 = 'Are you sure you want to rewind/reset the Workflow ' +
     'approval process?';
   cTXT0000120 = 'Unable to archive the PO because the total VMI Received ' +
     'Quantity is greater than total Quantity Received. Please see the ' +
     'Receipt Information in order to determine the necessary corrections.';
   cTXT0000121 = 'Requisition # %.0f';
   cTXT0000122 = 'PO # %s';
   cTXT0000123 = 'PO # %s %s';
   cTXT0000124 = 'Row cannot be left blank.';
   cTXT0000125 = 'Please select a GL Account.';
   cTXT0000126 = 'Receipts have been created for this PO line item. Changing ' +
    'the Item # is not permitted.';
   cTXT0000127 = 'Start Date is less than Lead Time.'#13#13'Is this correct?';
   cTXT0000128 =  'Multiselect is unavailable for miscellaneous items.  ' +
    'Please use the "insert" button.';
   cTXT0000129 = 'There is no template based Workflow associated with %s.';
   cTXT0000130 = 'None of the team members assigned to this Workflow have a PO Limit greater or equal '+
     'to this requisition amount. '#13#13+
     'Please include a team member with a PO Limit sufficient to approve this requisition.';
   cTXT0000131 = 'Please check your date value.';
   cTXT0000132 = 'Changes have been made since taxes were last calculated. Recalculate now?';
   cTXT0000133 = 'PO not found.  Please check your EPlant filter.';
   cTXT0000134 = 'Processing PO header rec # %d';
   cTXT0000135 = 'Failed to Archive PO ID = %s'#13 +
    'System is currently busy compressing a table and rebuilding ' +
    'associated indexes.  Please wait and try again later.'#13#13'%s';
   cTXT0000136 = 'Failed to Archive PO # = %s'#13'%s';
   cTXT0000137 = 'Marking purchased orders.  Please wait ...';
   cTXT0000138 = 'Finished marking purchase orders.'#13#13'Number of records marked: %d.';
   cTXT0000139 = 'About to archive and delete %d purchased order(s). Please confirm to continue.';

implementation

{$R *.DFM}

uses
  //ArPrepTax,
  //auto_save_man,
  //BoilSel,
  //Car_Eco_Chk,
  //CAR_ECO_Exist,
  //ConfUnitPrice,
  //Debug_SQL,
  //EditMemoStr,
  //Fob,
  //FreeForm,
  //IFreight,
  //InactiveInvItemChk,
  //Inv_Misc,
  //IQApps,
  //IQAttachedDocumentsCoordinator,
  //iqctrl,
  //IqCursor,
  //IQHelpHk,
  //IqMesg,
  //IqMisc,
  //IQMS.Dates,
  //IQNLS,
  IQMS.Common.Numbers,
  //IQRegFrm,
  //IqSecMan,
 // IQSeq,
//  IqString,
  IQMS.Common.ResStrings;
//  IQUoM;
  //jumpdispatcher,
  //MCFrmBas,
  //MCPoDet,
  //MCPoTot,
  //McShare,
  //oe_rscstr,
  //PanelMsg,
  //Paste_Rel_OE,
  //Paste_Rel_PO,
  //PEdRemt,
  //PO_Chk,
  //PO_ChkAP,
  //po_clone,
  //po_const,
  //po_dropship_report,
  //po_dropship_report_batch,
  //PO_Form,
  //Po_Hist,
  //po_rscstr,
  //po_type,
  //PO_UOM,
  //PO_Ver,
  //po_wf_main,
  //po_wf_team,
  //po_wf_template,
  //POArch,
  //pomain,
  //POManAdj,
  //POPay,
  //PORelAct,
  //POVRec,
  //Prn_PO,
  //qc_docmaint,
  //qc_share,
  //Rep_Releases,
  //secure_confirm_close_po,
  //SetPlant,
  //shipman_address_edit,
  //Avalara,
  //Sys_Comp,
  //Sys_Share,
  //TaxMain,
  //Terms,
  //TR_Base,
  //Vendor,
  //VStatChk;


procedure TFrmPoBase.UniFrameCreate(Sender: TObject);
var
  b: boolean;
begin
  DM:= TDM_PO.Create(self);
  DM.FPORevHasBeenIncremented:= False;

  //DM.OnPOChanged := DoOnPOChanged;

  // Startup;  // 01-27-2009 moved below the picklist for performance reasons
  try
    //if not FDisableFilteringByUserid then
     //  FilterPORequisitionsByUserID1.Checked:= IQRegBooleanScalarRead( Self, 'FilterPORequisitionsByUserID', b ) and b;
//    sbSearchPurchClick( NIL );

    StartUp( 0 ); // 1 - suspend opening tables
    FormIsLoaded:= TRUE;
  except
    on E:EAbort do
    begin
//      IQBookMark1.CancelMRUUpdate:= TRUE;
//      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
    end;
  end;
  FormIsCreated:= TRUE;

  FormCreate(Sender);
end;

procedure TFrmPoBase.UniFrameDestroy(Sender: TObject);
var
  AWFDoNotShowChecked : boolean;
  AModalResult : TModalResult;
  AMessageText : string;
  AShowDialog : boolean;
begin
 AWFDoNotShowChecked := FALSE;
 //TAutoSaveManager.Create(self).Execute;  // auto_save_man.pas

 DM.CheckIncrementVer( DM.QryPOID.asFloat );

 //EIQ-2923 Purchase Orders - prompt user to Enable Workflow - Wilbert {Non Template based}
// if ( SR.Visible['dbchkAllowWorkflow'] ) and
//    ( SelectValueFmtAsFloat('select count(*) from po_detail where po_id = %f', [DM.QryPOID.asFloat]) > 0) and
//    ( not PO_Share.IsPOWorkflowTemplateBased ) and
//    ( DM.QryPOWORKFLOW_ENABLED.asString <> 'Y' ) then
// begin
//   TIQRegForm.ReadDialogCheckBox( 'Non_Template_WF_Check_Enabled',
//                                  AWFDoNotShowChecked,
//                                  AModalResult,
//                                  AMessageText,
//                                  AShowDialog,
//                                  mrOK );
//
//   if not AWFDoNotShowChecked then
//     if (IqMesg.IQConfirmYNWithSecurity( po_rscstr.cTXT0000081, //Enable Workflow?
//                                        'Non_Template_WF Check_Enabled',
//                                         TRUE)) then
//       ExecuteCommandFmt('update PO set WORKFLOW_ENABLED = ''Y'' where id = %f', [DM.QryPOID.asFloat]);
// end;


 // RestoreForm( Self ); // iqctrl
// IQRegFormWrite( self, [self, Panel6, GridDetail, GridReleases,
//                        PnlHeader01, PnlHeader02, PnlHeader03, PnlHeader04,
//                        PnlHeaderLeft01, PnlHeaderLeft02, PnlHeaderLeft03,
//                        PnlTotalsLeft, PnlTotals, Panel4, PnlUDLeft01, Panel9,
//                        sbFg, sbMisc, sbAka ]);

 //IQRegBooleanScalarWrite( Self, 'MultiSelect', MultiselectDetail1.Checked );

 //if (PCMain.ActivePage = TabGrid) then
  //  IQRegFormWrite( self, [ wwGridHeader ]);

 //IQRegBooleanScalarWrite( Self, 'FilterPORequisitionsByUserID', FilterPORequisitionsByUserID1.Checked);

 Application.OnShowHint:= NIL;
end;

constructor TFrmPoBase.CreateNew(AOwner: TComponent);
begin
  FDisableFilteringByUserID:= TRUE;
  DM:= TDM_PO.Create(self);
  inherited Create( AOwner );
  DM.Name:= '';
  Startup(1);
  FormIsLoaded:= TRUE;
  FormIsCreated:= TRUE;
  if not DM.QryPO.Active then
    DM.QryPO.Open;
  DM.QryPO.Insert;
  DM.QryPO.Post;
  DM.EnsureTablesOpen;
end;

constructor TFrmPoBase.CreateJump(AOwner:TComponent; StartOnID:Real );
var
  nId:Real;
begin
  FDisableFilteringByUserID:= TRUE;
  DM:= TDM_PO.Create(self);
  inherited Create( AOwner );
  DM.Name:= '';
  Startup(1);
  nId := SelectValueFmtAsFloat(
    'select po_id from po_detail where id = %f', [StartOnID]);
  FormIsLoaded:= TRUE;
  DM.wwQryPr_Emp.Close;
  if LocatePO(nId) then
     begin
       if not DM.TblPoDetail.Active then
         DM.TblPoDetail.Open;
       DM.TblPoDetail.Locate('ID', StartOnID, []);
     end
  else if nID > 0 then
     // po_rscstr.cTXT0000107 =
     // 'Unable to locate requested record [ID = %.0f].';
     //IQWarning(Format(po_rscstr.cTXT0000107, [ nID ]));
  // Ensures the datasets are open
  DM.EnsureTablesOpen;
  // Ensures the calculated fields also display after the form is shown
  PostMessage( self.Handle, iq_RefreshDataSets, 0, 0 );
  FormIsCreated:= TRUE;
end;


constructor TFrmPoBase.CreateJumpHeader(AOwner:TComponent; APO_ID:Real );
begin
  FDisableFilteringByUserID:= TRUE;
  DM:= TDM_PO.Create(self);
  inherited Create( AOwner );
  DM.Name:= '';
  Startup(1);
  FormIsLoaded:= TRUE;
  if not LocatePO(APO_ID) and (APO_ID > 0) then
     // po_rscstr.cTXT0000107 =
     // 'Unable to locate requested record [ID = %.0f].';
     //IQWarning(Format(po_rscstr.cTXT0000107, [ APO_ID ]));
  DM.EnsureTablesOpen;
  FormIsCreated:= TRUE;
end;

constructor TFrmPoBase.CreateNewPoWithReleases(AOwner:TComponent;
  AVendor_ID: Real; APOItems: TList; ArinvtVendorsID:Real = 0  );
var
  nVendorId, nRemitToId, nTermsId: Real;
  I : Integer;
  APo_ID: Real;
begin
  FDisableFilteringByUserID:= TRUE;
  DM:= TDM_PO.Create(self);
  inherited Create( AOwner );
  DM.Name:= '';
  Startup(1);
  Application.ProcessMessages;
  FormIsLoaded:= TRUE;
  if not DM.QryPO.Active then
    DM.QryPO.Open;
  with DM.QryPO do
  begin
    DM.QryPO.AfterInsert:= NIL;
    try
      if AVendor_ID = 0 then
         Insert
      else
         try
           SBSearchVend.OnClick := NIL;
           Insert;
           AssignVendorID( AVendor_ID, 0 {terms_id} );
         finally
           SBSearchVend.OnClick := SBSearchVendClick;
         end;
      DM.AssignDefaults;
    finally
      DM.QryPO.AfterInsert:= DM.QryPOAfterInsert;
    end;

    APo_ID:= DM.QryPOID.asFloat;
    Post;
//    NavHeader.AssignMainID( APo_ID );
  end;

  DM.EnsureTablesOpen;

  Application.ProcessMessages;

//  for I:= 0 to APOItems.Count - 1 do
//    pomain.gNewDtlId:= InsertDetailRecord_Ex( TPOItem(APOItems[ I ]), ArinvtVendorsID );  {Detail and Releases}

  FormIsCreated:= TRUE;
  PostMessage( self.Handle, iq_RefreshDataSets, 0, 0 )
end;

//constructor TFrmPoBase.CreateNewPoItemWithReleases( AOwner:TComponent;
//  APO_ID: Real; APOItem: TPOItem );
//var
//  ABlanketQty: Real;
//begin
//  FDisableFilteringByUserID:= TRUE;
//  DM:= TDM_PO.Create(self);
//  inherited Create( AOwner );
//  DM.Name:= '';
//  Startup(1);
//  FormIsLoaded:= TRUE;
//
//  AddDetailRecord( APO_ID, APOItem );
//  DM.EnsureTablesOpen;
//  FormIsCreated:= TRUE;
//  PostMessage( self.Handle, iq_RefreshDataSets, 0, 0 );
//end;

procedure TFrmPoBase.FormCreate(Sender: TObject);
begin
  // 05/23/2013 Update labels before calling IQRegFormRead() below.
//  UpdateUserLabelColumnTitle( 'USER_DATE', IQUserDefLabelOnGrid.Caption );
//  UpdateUserLabelColumnTitle( 'USER_DATE2', IQUserDefLabelOnGrid2.Caption );
//  UpdateUserLabelColumnTitle( 'USER_DATE3', IQUserDefLabelOnGrid3.Caption );
//  UpdateUserLabelColumnTitle( 'CUSER1', IQUserDefLabelPoDetailCUser1.Caption, DM.TblPodetail, GridDetail );
//  UpdateUserLabelColumnTitle( 'CUSER2', IQUserDefLabelPoDetailCUser2.Caption, DM.TblPodetail, GridDetail );
//  UpdateUserLabelColumnTitle( 'CUSER3', IQUserDefLabelPoDetailCUser3.Caption, DM.TblPodetail, GridDetail );


  //iqctrl.AdjustPageControlToParent(PCMain);
  pgctrlPO.ActivePageIndex:= 0;
  CheckVistaAdjustSize( [wwComboVendor, dbPoNo, cmbVendorContact, wwComboRemit,
   wwComboShip, wwArcusto, DBComment1]);
  //TabEserver.TabVisible := SecurityManager.IsModuleLicensed(IQAppsNames[apEServer]);

 { FCostSourceManager := TCostSourceManager.Create(
    Self,
    CostSource1,
    GridDetail.DataSource,
    TCostSourceOwnerType.PurchaseOrders,
    [TCostSourceMenuType.ProjectManagerProject,
    TCostSourceMenuType.MRO,
    TCostSourceMenuType.JobShop,
    TCostSourceMenuType.FixedAssets,
    TCostSourceMenuType.UnassignCostSource]);
  // Since the grid supports multi-select, these methods must be
  // intercepted.
  TCostSourceManager(FCostSourceManager).OnAssignCostSource := DoAssignCostSource;
  TCostSourceManager(FCostSourceManager).OnUnAssignCostSource := DoUnAssignCostSource;
  }
end;

procedure TFrmPoBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Debug_SQL.CheckShowDebugSQL(Self, Key, Shift);
end;

procedure TFrmPoBase.FormClose(Sender: TObject; var Action: TCloseAction);
var
  AWFDoNotShowChecked : boolean;
  AModalResult : TModalResult;
  AMessageText : string;
  AShowDialog : boolean;
begin
 AWFDoNotShowChecked := FALSE;
 //TAutoSaveManager.Create(self).Execute;  // auto_save_man.pas

 DM.CheckIncrementVer( DM.QryPOID.asFloat );

 //EIQ-2923 Purchase Orders - prompt user to Enable Workflow - Wilbert {Non Template based}
// if ( SR.Visible['dbchkAllowWorkflow'] ) and
//    ( SelectValueFmtAsFloat('select count(*) from po_detail where po_id = %f', [DM.QryPOID.asFloat]) > 0) and
//    ( not PO_Share.IsPOWorkflowTemplateBased ) and
//    ( DM.QryPOWORKFLOW_ENABLED.asString <> 'Y' ) then
// begin
//   TIQRegForm.ReadDialogCheckBox( 'Non_Template_WF_Check_Enabled',
//                                  AWFDoNotShowChecked,
//                                  AModalResult,
//                                  AMessageText,
//                                  AShowDialog,
//                                  mrOK );
//
//   if not AWFDoNotShowChecked then
//     if (IqMesg.IQConfirmYNWithSecurity( po_rscstr.cTXT0000081, //Enable Workflow?
//                                        'Non_Template_WF Check_Enabled',
//                                         TRUE)) then
//       ExecuteCommandFmt('update PO set WORKFLOW_ENABLED = ''Y'' where id = %f', [DM.QryPOID.asFloat]);
// end;


 // RestoreForm( Self ); // iqctrl
// IQRegFormWrite( self, [self, Panel6, GridDetail, GridReleases,
//                        PnlHeader01, PnlHeader02, PnlHeader03, PnlHeader04,
//                        PnlHeaderLeft01, PnlHeaderLeft02, PnlHeaderLeft03,
//                        PnlTotalsLeft, PnlTotals, Panel4, PnlUDLeft01, Panel9,
//                        sbFg, sbMisc, sbAka ]);

 //IQRegBooleanScalarWrite( Self, 'MultiSelect', MultiselectDetail1.Checked );

 //if (PCMain.ActivePage = TabGrid) then
  //  IQRegFormWrite( self, [ wwGridHeader ]);

 //IQRegBooleanScalarWrite( Self, 'FilterPORequisitionsByUserID', FilterPORequisitionsByUserID1.Checked);

 Application.OnShowHint:= NIL;
 Action  := caFree;
end;

procedure TFrmPoBase.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := DM.CheckTaxCalculated;
end;

procedure TFrmPoBase.FormShow(Sender: TObject);
var
  b: Boolean;
begin
  // 08/07/2014 Moved restore from Registry to FormShow (Byron).
//  IQRegFormRead( self, [self, Panel6, GridDetail, GridReleases,
//                        PnlHeader01, PnlHeader02, PnlHeader03, PnlHeader04,
//                        PnlHeaderLeft01, PnlHeaderLeft02, PnlHeaderLeft03,
//                        PnlTotalsLeft, PnlTotals, Panel4, PnlUDLeft01, Panel9,
//                        sbFg, sbMisc, sbAka]);
  b := FALSE;
  //IQRegBooleanScalarRead( Self, 'MultiSelect', b );
  MultiselectDetail1.Checked:= b;
  EnableMultiSelect( MultiselectDetail1.Checked );   // enforce grid multiselect based on checked state
// iqctrl.AutoSizeNavBar(NavHeader);
// iqctrl.AutoSizeNavBar(NavDetail);
// iqctrl.AutoSizeNavBar(NavReleases);
// iqctrl.AdjustRightAlignedControlsToParent(PnlGeneralInner_VendorClient);
end;

procedure TFrmPoBase.FormActivate(Sender: TObject);
begin
 // Application.OnShowHint:= DoOnShowHint;
  //IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmPO{HTM} );  {IQHelpHk.pas}
end;

function TFrmPoBase.LocatePO(const APO_ID: Real; ARefresh: Boolean): Boolean;
begin
  // Post datasets first, before attempting to navigate
  if (DM.QryPO.State in [dsEdit,dsInsert]) then
    DM.QryPO.Post;
  if (DM.TblPODetail.State in [dsEdit,dsInsert]) then
   DM.TblPODetail.Post;
  if (DM.QryPOReleases.State in [dsEdit,dsInsert]) then
   DM.QryPOReleases.Post;

  try
    DM.QryPO.DisableControls;
    if ARefresh then
      DM.QryPO.Close;
    if not DM.QryPO.Active then
      DM.QryPO.Open;
    if PCMain.ActivePage = TabGrid then
      Result := DM.QryPO.Locate('ID', Trunc(APO_ID), [])
    else
      begin
//        NavHeader.MainID := Trunc(APO_ID);
//        Result := NavHeader.MainID = APO_ID;
        if Result then
        begin
          ReOpen(DM.QryPO);
          // The actual dataset ID may not exist
          Result :=  DM.QryPOID.AsLargeInt = Trunc(APO_ID);
        end;
      end;
  finally
    DM.QryPO.EnableControls;
  end;
end;

//procedure TFrmPoBase.AddDetailRecord( APO_ID: Real; APOItem: TPOItem );
//begin
//  {Header}
//  if not DM.QryPO.Active then
//    DM.QryPO.Open;
//
//  if (DM.QryPOID.asFloat <> APO_ID) and not LocatePO(APO_ID) then  // avoid locating if we already on the record to not trigger Is This PO Revision question
//  begin
//    // 06/06/2016 (Byron, EIQ-12829) Raise helpful message, if EPlant
//    // could be the issue.
//    if (SecurityManager.EPlant_ID_AsInteger > 0) and
//     (SecurityManager.EPlant_ID_AsInteger <>
//      SelectValueFmtAsInt64(
//      'select eplant_id from po where id = %.0f',
//      [APO_ID])) then
//      // po_rscstr.cTXT0000133 = 'PO not found.  Please check your EPlant filter.';
//      IQWarning(po_rscstr.cTXT0000133)
//    else
//      IQWarning(po_rscstr.cTXT0000001 {'PO not found, cannot create new record'} );
//    PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
//    EXIT;
//  end;
//
//  {Detail and Releases}
//  pomain.gNewDtlId:= InsertDetailRecord_Ex( APOItem );
//end;


//function TFrmPoBase.InsertDetailRecord_Ex(APOItem: TPOItem; ArinvtVendorsID:Real = 0 ): Real;
//var
//  I          : Integer;
//  ABlanketQty: Real;
//  AIsFound   : Boolean;
//  APO_Uom    : string;
//  AArinvt_UOM: string;
//  ASkip1     : Boolean;
//  ASkip2     : Boolean;
//  AThisArinvtVendors_ID: Real;
//
//  procedure AdjustUomFactor( AUom1, AUom2: string; AArinvt_ID: Real );
//  var
//    AFactor: Real;
//    J      : Integer;
//  begin
//    AFactor:= IQConvertUOM( 1,                {qty      }
//                            AUom1,            {from uom }
//                            AUom2,            {to uom   }
//                            AArinvt_ID );     {arinvt_id}
//     with APOItem do
//       for J:= 0 to FPOReleases.Count - 1 do with TPORelease( FPOReleases[ J ]) do
//           FQty:= FQty * AFactor;
//
//     APOItem.FTotal_Ord_Qty:= APOItem.FTotal_Ord_Qty * AFactor;
//  end;
//
//  function _ArinvtVendorHasItem( AArinvt_Vendors_ID, AArinvt_ID: Real ): Boolean;
//  begin
//    Result:= SelectValueFmtAsFloat('select arinvt_id from arinvt_vendors where id = %f', [ AArinvt_Vendors_ID ]) = AArinvt_ID;
//  end;
//
//begin
//  with APOItem do
//  begin
//    ABlanketQty:= 0;
//
//    // 06/06/2016 (Byron, EIQ-12829) Ensure datasets are open at this point.
//    if not DM.TblPoDetail.Active then
//      DM.TblPoDetail.Open;
//
//    {PO Detail}
//    if (FCost_Object_Source > '') and (FCost_Object_ID > 0) then
//       AIsFound:= DM.TblPoDetail.Locate('arinvt_id;cost_object_source;cost_object_id',
//                                        VarArrayOf( [ FArinvt_ID, FCost_Object_Source, FCost_Object_ID ]),
//                                        [])
//    else if FIsDropShip then  {force adding po_detail when is drop ship}
//       AIsFound:= FALSE
//
//    else if FDivision_ID > 0 then
//       AIsFound:= DM.TblPoDetail.Locate('arinvt_id;division_id',
//                                        VarArrayOf( [ FArinvt_ID, FDivision_ID ]),
//                                        [])
//    else
//       AIsFound:= DM.TblPoDetail.Locate('arinvt_id',
//                                        FArinvt_ID,
//                                        []);
//    {PO_Detail_ID}
//    if AIsFound then
//       begin
//          Result:= DM.TblPoDetailID.asFloat;
//
//          AdjustUomFactor( DM.TblPoDetailArinvt_Unit.asString,
//                           DM.TblPoDetailUNIT.asString,
//                           DM.TblPoDetailARINVT_ID.asFloat );
//       end
//    else
//       begin
//          AArinvt_UOM:= SelectValueByID( 'unit', 'arinvt', FArinvt_ID );
//          APO_Uom:= SelectValueFmtAsString('select uom from arinvt_uom_conv where arinvt_id = %f and NVL(default_po, ''N'') = ''Y''', [ FArinvt_ID ]);
//          if APO_Uom = '' then
//             APO_Uom:= AArinvt_UOM;
//
//          AdjustUomFactor( AArinvt_UOM, APO_Uom, FArinvt_ID );
//
//          {Blanket}
//          if  APOItem.FTotal_Ord_Qty > 0 then
//              ABlanketQty:= APOItem.FTotal_Ord_Qty
//          else
//              for I:= 0 to FPOReleases.Count - 1 do with TPORelease( FPOReleases[ I ]) do
//                  ABlanketQty:= ABlanketQty + FQty;
//
//          Result:= InsertDetailRecord( APoItem, ABlanketQty );
//
//          AThisArinvtVendors_ID:= APOItem.FArinvt_Vendors_ID;
//          if AThisArinvtVendors_ID = 0 then
//             AThisArinvtVendors_ID:= ArinvtVendorsID; {Passed Parameter}
//
//          if (AThisArinvtVendors_ID <> 0) and _ArinvtVendorHasItem( AThisArinvtVendors_ID, FArinvt_ID ) then
//          begin
//            ExecuteCommandFmt(
//              'update po_detail set arinvt_vendors_id = %f where id = %f',
//              [AThisArinvtVendors_ID, Result]);
//            Reopen(DM.TblPoDetail);
//            DM.TblPoDetail.Locate('ID', Result, []);
//
//            ASkip1:= DM.SkipCheckMinMax;
//            ASkip2:= DM.SkipCheckUnitPrice;
//            DM.SkipCheckMinMax   := True;
//            DM.SkipCheckUnitPrice:= True;
//            try
//              DM.TblPoDetail.Edit;
//              AssignUnitPrice;
//              DM.TblPoDetail.Post;
//            finally
//              DM.SkipCheckMinMax   := ASkip1;
//              DM.SkipCheckUnitPrice:= ASkip2;
//            end;
//          end;
//       end;
//
//    {Releases}
//    for I:= 0 to FPOReleases.Count - 1 do with TPORelease( FPOReleases[ I ]) do
//      if (FReqDate > 0) and (FQty > 0) then
//         InsertReleaseRecord( Result, FQty, FReqDate );
//  end;
//end;

//function TFrmPoBase.InsertDetailRecord( AArinvtID, AQty:Real; ADivision_ID: Real; ADate:TDateTime = 0): Real;
//var
//  APOItem: TPOItem;
//begin
//  APOItem:= TPOItem.Create;
//  with APOItem do
//  try
//    FArinvt_ID  := AArinvtID;
//    FDivision_ID:= ADivision_ID;
//    Result:= InsertDetailRecord( APoItem, AQty, ADate );
//  finally
//    Free;
//  end;
//end;


//function TFrmPoBase.InsertDetailRecord( APoItem: TPOItem; AQty: Real; ADate:TDateTime = 0): Real;
//var
//  nMaxSeq: Integer;
//  nGlAcctId, nStdPrice:Real;
//  A   :  Variant;
//  AUnit: string;
//  AUom:  String;
//begin
//  Result:= 0;  {Initialize}
//
//  {if division eplant does not match logged eplant - nullify division_id}
//  APOItem.EnsureDivisionEPlantOfItemMatch;
//
//  try
//    DM.TblPoDetail.AfterInsert := nil;
//    DM.SkipCheckMinMax:= APoItem.FIsDropShip;
//
//    nMaxSeq := SelectValueFmtAsInteger(
//      'Select Max(seq) as seq from po_detail where po_id = %f',
//      [DM.QryPOID.asFloat]) + 1;
//    A:= SelectValueArrayFmt(
//      'select NVL(acct_id_inv,0), NVL(std_price,0), NVL(unit, ''EACH'') from arinvt where id = %f',
//      [APoItem.FArinvt_ID]);
//    if VarArrayDimCount( A ) > 0 then
//    begin
//      nGlAcctId:= A[ 0 ];
//      nStdPrice:= A[ 1 ];
//      AUnit    := A[ 2 ];
//    end;
//
//    AUom := SelectValueFmtAsString(
//      'select uom from arinvt_uom_conv where arinvt_id = %f and NVL(default_po, ''N'') = ''Y''',
//      [APoItem.FArinvt_ID]);
//
//    if AUom <> '' then
//      AUnit := AUom;
//
//    DM.SkipDropShipCheck:= APoItem.FIsDropShip;
//
//    if not DM.TblPoDetail.Active then
//      DM.TblPoDetail.Open;
//    DM.TblPoDetail.Insert;
//    AssignTaxable;
//    {Assign ID to return value}
//
//    {Assign values to new record fields}
//    DM.TblPoDetailSEQ.asInteger        := nMaxSeq;
//    DM.TblPoDetailCLOSED.asString      := 'N';
//    if APoItem.FDivision_ID > 0 then
//       DM.TblPoDetailDIVISION_ID.asFloat:= APoItem.FDivision_ID;
//    DM.TblPoDetailARINVT_ID.asFloat    := APoItem.FArinvt_ID;
//    ResetTaxable(DM.TblPoDetailARINVT_ID.asFloat, DM.TblPoDetailTAXABLE);
//
//
//    DM.TblPoDetailUNIT_PRICE.asFloat := nStdPrice;
//    // Unit must assigned before QTY because it is referenced in AssignUnitPrice (see below)
//    DM.TblPoDetailUNIT.asString := AUnit;
//    // OnChange of the 'TOTAL_QTY_ORD' calls AssignUnitPrice
//    DM.TblPoDetailTOTAL_QTY_ORD.asFloat := AQty;
//
//    {Sep 5,01}
//    nGlAcctId:= Get_GLAcct_ID_Exp_FromVendor( DM.QryPOVENDOR_ID.asFloat );
//
//    if nGlAcctId > 0 then
//      DM.TblPoDetailGLACCT_ID_INV.asFloat := nGlAcctId;
//
//    if APoItem.FCost_Object_Source > '' then
//    begin
//       DM.TblPoDetailCOST_OBJECT_SOURCE.asString:= APoItem.FCost_Object_Source;
//       DM.TblPoDetailCOST_OBJECT_ID.asFloat     := APoItem.FCost_Object_ID;
//    end;
//
//    DM.TblPoDetailUOM_FACTOR.asFloat:= IQToNativeUomFactor(
//      AUnit,                             // AFromUOM
//      DM.TblPoDetailARINVT_ID.asFloat,   // AArinvt_ID
//      TRUE );                            // AIgnoreError
//
//    if APoItem.FConsolidateDivReq then
//       AssignPODetailDivisionBasedOnShipTo( DM.QryPOSHIP_TO_ID.asFloat );
//
//    DM.TblPoDetail.Post;
//    Result:= DM.TblPoDetailID.AsFloat;
//
//    if (ADate > 0) and (AQty > 0) then
//       InsertReleaseRecord( Result, AQty, ADate );
//
//  finally
//    DM.ReportChanges([pocLINEITEMS_ADDED]);
//
//    DM.TblPoDetail.AfterInsert := TblPoDetailAfterInsert;
//    DM.SkipCheckMinMax:= FALSE;
//  end;
//end;


procedure TFrmPoBase.InsertReleaseRecord( APo_Detail_ID, AQty: Real; ADate: TDateTime );
begin
  if not DM.QryPOReleases.Active then
    DM.QryPOReleases.Open;
  DM.QryPOReleases.Append;
  DM.QryPOReleasesPO_DETAIL_ID.asFloat   := APo_Detail_ID;
  DM.QryPOReleasesREQUEST_DATE.asDateTime:= ADate;
  DM.QryPOReleasesPROMISE_DATE.asDateTime:= ADate;
  DM.QryPOReleasesQUAN.asFloat           := AQty;
  DM.QryPOReleases.Post;
end;

procedure TFrmPoBase.CheckIsDisp_po_id_as_requisition;
begin
  // provided by descendent class
end;


procedure TFrmPoBase.AssignPODetailDivisionBasedOnShipTo( AShipTo_ID: Real );
var
  ADivision_ID: Real;
begin
  ADivision_ID:= SelectValueFmtAsFloat('select division_id from company where id = %f', [ AShipTo_ID ]);
  if ADivision_ID = 0 then
     EXIT;

  if not (DM.TblPoDetail.State in [dsEdit, dsInsert]) then
     DM.TblPoDetail.Edit;
  DM.TblPoDetailDIVISION_ID.asFloat:= ADivision_ID;
end;

procedure TFrmPoBase.Startup( AMode: Integer = 0  );  // 0 - normal, 1 - suspend opening po, po_detail, po_releases for performance gain and only open them after picklist
var
  AType:Integer;
  b: Boolean;
begin
  try
    CheckIsDisp_po_id_as_requisition;

    FormIsLoaded:= FALSE;

    // suspend opening the tables  - do it after picklist
    if AMode = 1 then
       DM.SuspendOpeningTables;

    //FIsWorkflowTemplateBased:= PO_Share.IsPOWorkflowTemplateBased;

    IQSetTablesActiveEx( TRUE, DM, cTXT0000045 {'Accessing Purchase Orders.  Please wait.'} );
    IQSetTablesActiveEx( TRUE, self, cTXT0000045 {'Accessing Purchase Orders.  Please wait.'} );
    sbMiscClick(sbFg);
    gId := 0;
    wwGridHeader.DataSource:= NIL;
    PCMain.ActivePage := TabForm;
    DM.TblPoDetail.AfterInsert := TblPoDetailAfterInsert;
    DM.TblPoDetail.OnFilterRecord := TblPoDetailFilterRecord;
    DM.SrcPoDetail.OnDataChange := SrcPoDetailDataChange;
    DM.TblPoDetailTOTAL_QTY_ORD.OnChange := TblPoDetailTOTAL_QTY_ORDChange;
    DM.TblPoDetailUNIT_PRICE.OnChange := TblPoDetailUNIT_PRICEChange;

    //gridDetail.Cursor := crJump;
    FMultiCurrency := SelectValueAsString('select multicurrency from iqsys') = 'Y';
    CheckMultiCurrency;

    {Set ShowCARsECOs1.Visible}
//    if not SecurityManager.SetVisibleIfLicensed( NIL, ShowCARsECOs1, NIL, IQAppsNames[ apIQCar ], SR ) then
//       SecurityManager.SetVisibleIfLicensed( NIL, ShowCARsECOs1, NIL, IQAppsNames[ apIQEco ], SR );

    {July-14-2005 if Security Inspector toggled visible to true undo it here otherwise the drop down will float in the middle of grid!}
//    wwGlAcct.Visible:= FALSE;

//    with GridDetail.ColumnByName('division_name') do DisplayLabel:= CheckReplaceDivisionCaption(DisplayLabel);   {sys_share}
//    with wwDBcomboDivision do CheckReplaceDivisionOfWWSelected( Selected );

    // Enable Workflow for non-template based workflows
    Label23.Visible:= not FIsWorkflowTemplateBased;
    //dbchkAllowWorkflow.Visible:= SR.Visible['dbchkAllowWorkflow'] and not FIsWorkflowTemplateBased;
    // non template based
    pnlApprovalLeftTop2.Visible  := not FIsWorkflowTemplateBased;
    pnlApprovalClientTop2.Visible:= not FIsWorkflowTemplateBased;
    // template based
    pnlApprovalLeftTop3.Visible  := FIsWorkflowTemplateBased;
    pnlApprovalClientTop3.Visible:= FIsWorkflowTemplateBased;

    DM.QryWFHeader.Active:= FIsWorkflowTemplateBased;

    //TAttachedDocumentsCoordinator.Create( self ).RegisterDocuments( TabPONotes,  [ IQDocs1, IQExtDoc1, IQEMailCorrespondence1 ]);  // IQAttachedDocumentsCoordinator.pas

//    DBItemno.visible := false;
//    wwDBComboDlgPODetailComment.visible := false;
    AType := 0;

//    if IQRegIntegerScalarRead( self, 'PO_HIDE_CLOSED_DETAILS', AType ) then
//    begin
//      if AType = 0 then
//        sbHideDetails.Down := false
//      else
//        sbHideDetails.Down := true;
//    end
//    else
      sbHideDetails.Down := false;

    sbHideDetailsClick(nil);
  finally
    FIsStartupInvoked:= TRUE;
  end;
end;

procedure TFrmPoBase.CheckMultiCurrency;
begin
  LblCurrency.Visible  := FMultiCurrency;
  dbCurrency.Visible   := FMultiCurrency;
  btnCurrency1.Visible := FMultiCurrency;
  btnCurrency2.Visible := FMultiCurrency;
end;

procedure TFrmPoBase.TblPoDetailAfterInsert(DataSet: TDataSet);
var
  aFMiscItem:boolean;
begin
  aFMiscItem := false;
  AssignTaxable;

  if sbFg.Down then
     SelectFromPkArinvt
  else if sbAka.Down then
     SelectfromPkAkA
  else
  begin
     aFMiscItem := true;
     //SelectFromFreeForm;
  end;

  AssignAfterInsertValues;

  if aFMiscItem then
    begin
      if (DM.TblPoDetail.State in [dsEdit,dsInsert]) then
        DM.TblPoDetail.Post;
      DM.TblPoDetail.Refresh;
      GridDetail.SetFocus;
   // GridDetail.SetActiveField('ItemNumber');
    end;

  //DM.ReportChanges([pocLINEITEMS_ADDED]);
end;

procedure TFrmPoBase.AssignAfterInsertValues;
var
  AGlAcctId:Real;
  AEplantId:Real;
  ADivId:Real;
begin
  AGlAcctId:= Get_GLAcct_ID_Exp_FromVendor( DM.QryPOVENDOR_ID.asFloat );
  if (AGlAcctId <> 0) and  (DM.TblPoDetailGLACCT_ID_INV.asFloat = 0) then
    DM.TblPoDetailGLACCT_ID_INV.asFloat := AGlAcctId;

  ResetTaxable(DM.TblPoDetailARINVT_ID.asFloat, DM.TblPoDetailTAXABLE);

 // if Empty(DM.TblPoDetailMISC_ITEM.asString) and
 //   (DM.TblPoDetailARINVT_ID.asFloat = 0) and Empty(DM.TblPoDetailCMTLINE.asString) then
    begin
      DM.TblPoDetail.Delete;
      System.SysUtils.Abort;
    end;
  if IsNonInventoryItem then
    DM.TblPoDetailDONT_POST_PPV.asString := 'Y'
  else
    DM.TblPoDetailDONT_POST_PPV.asString := 'N';

  ADivId := SelectValueFmtAsFloat(
    'select division_id from company where id = %.0f',
    [DM.QryPOSHIP_TO_ID.asFloat]);
  if ADivId <> 0 then
    DM.TblPoDetailDIVISION_ID.asFloat := ADivId;

  AssignSequence;
  AssignUnitPrice;
end;

function TFrmPoBase.IsNonInventoryItem(const AArinvtID: Int64): Boolean;
var
  ACount: Integer;
  ANonMaterial, ADontPostNonInventory: Boolean;
begin
  ACount := SelectValueFmtAsInteger(
    'SELECT COUNT(id) FROM arinvt_elements WHERE arinvt_id = %d',
    [AArinvtID]);
  ANonMaterial := SelectValueFmtAsString(
    'SELECT NVL(non_material, ''N'') FROM arinvt WHERE id = %d',
    [AArinvtID]) = 'Y';
  ADontPostNonInventory := SelectValueAsString(
    'SELECT NVL(post_non_inventory, ''N'') FROM iqsys WHERE ROWNUM < 2') = 'N';
  // Evaluate
  Result := ((ACount = 0) or ANonMaterial or (AArinvtID = 0)) and
    ADontPostNonInventory;
end;

function TFrmPoBase.IsNonInventoryItem: Boolean;
//var
//  ACount: Integer;
//  ANonMaterial:Boolean;
//  AMiscItem:boolean;
//  ADontPostNonInventory:Boolean;
begin
  Result:= IsNonInventoryItem(DM.TblPoDetailARINVT_ID.AsLargeInt);
{  ACount := SelectValueFmtAsInteger(
    'select count(id) from arinvt_elements where arinvt_id = %f',
    [DM.TblPoDetailARINVT_ID.asFloat]);
  ANonMaterial := SelectValueFmtAsString(
    'select NVL(non_material, ''N'') from arinvt where id = %f',
    [DM.TblPoDetailARINVT_ID.asFloat]) = 'Y';
  AMiscItem := DM.TblPoDetailMISC_ITEM.asString <> '';
  ADontPostNonInventory := SelectValueAsString(
    'select NVL(post_non_inventory, ''N'') from iqsys where rownum < 2') = 'N';
  if ((ACount = 0) or ANonMaterial or AMiscItem) and ADontPostNonInventory then
    Result := True; }
end;

function TFrmPoBase.Get_GLAcct_ID_Exp_FromVendor(AVendor_ID: Real): Int64;
begin
  Result:= SelectValueFmtAsInt64(
    'select glacct_id_exp from vendor where id = %.0f',
    [AVendor_ID]);
//  if (Result > 0) and SecurityManager.EPlantsExist and (SecurityManager.EPlant_ID <> 'NULL') then
//    Result:= SelectValueFmtAsInt64(
//      'select plugins.get_glacct_no_name(%d, %.0f) from dual',
//      [Result, StrToFloat(SecurityManager.EPlant_ID)]);
end;

//procedure TFrmPoBase.DoOnPoChanged(APoChanges: TPO_Changes);
//var
//  ChangesRequireReApproval: boolean;
//begin
//  SetTaxButton;
//
//  // If this PO is new or is not approved, it is not necessary to reapprove it.
//  if DM.IsNewPO or not ApprovePO1.Enabled then
//    Exit;
//
//  ChangesRequireReApproval :=
//    ((pocUNITPRICE_HIGHER  in APoChanges) and GetPO_RAR_UNITPRICE_HIGHER ) or
//    ((pocUNITPRICE_LOWER   in APoChanges) and GetPO_RAR_UNITPRICE_LOWER  ) or
//    ((pocUNITQTY_HIGHER    in APoChanges) and GetPO_RAR_UNITQTY_HIGHER   ) or
//    ((pocUNITQTY_LOWER     in APoChanges) and GetPO_RAR_UNITQTY_LOWER    ) or
//    ((pocLINEITEMS_ADDED   in APoChanges) and GetPO_RAR_LINEITEMS_ADDED  ) or
//    ((pocLINEITEMS_DELETED in APoChanges) and GetPO_RAR_LINEITEMS_DELETED) or
//    ((pocRELEASES_ADDED    in APoChanges) and GetPO_RAR_RELEASES_ADDED   ) or
//    ((pocRELEASES_DELETED  in APoChanges) and GetPO_RAR_RELEASES_DELETED ) or
//    ((pocGL_ACCT_CHANGED   in APoChanges) and GetPO_RAR_GL_ACCT_CHANGED  ) or
//    ((pocTERMS_CHANGED     in APoChanges) and GetPO_RAR_TERMS_CHANGED    );
//
//  if ChangesRequireReApproval and not (IsRequisitionClass and DM.CanAutoApprovePO) then
//      DM.CheckExistsResetPOWorkflow(DM.QryPOID.Value);
//
//end;

//procedure TFrmPoBase.DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
//var
//  S: string;
//  AStr1:String;
//  A: Variant;
//begin
//  with HintInfo do
//  begin
//    if HintControl = wwComboVendor then //with DM.QryPO do
//       begin
//         ReshowTimeout:= 6000;
//         with TFDQuery.Create(nil) do
//         try
//           Connection := db_dm.FDConnection;
//           SQL.Add('SELECT a.company,');
//           SQL.Add('       a.addr1,');
//           SQL.Add('       a.addr2,');
//           SQL.Add('       a.addr3,');
//           SQL.Add('       a.city,');
//           SQL.Add('       a.state,');
//           SQL.Add('       a.zip,');
//           SQL.Add('       a.country,');
//           if DM.QryPOVENDOR_CONTACT_ID.AsFloat > 0 then
//             begin
//               SQL.Add('       misc.format_name2(b.first_name,');
//               SQL.Add('                         b.last_name) AS contact_name,');
//               SQL.Add('       b.phone_number,');
//               SQL.Add('       b.ext,');
//               SQL.Add('       b.fax_number');
//               SQL.Add('  FROM v_vendor a, vendor_contact b');
//               SQL.Add(' WHERE b.vendor_id(+) = a.id AND');
//               SQL.Add(Format('       a.id = %.0f AND',[DM.QryPOVENDOR_ID.AsFloat]));
//               SQL.Add(Format('       b.id = %.0f AND', [DM.QryPOVENDOR_CONTACT_ID.AsFloat]));
//             end
//           else
//             begin
//               SQL.Add('       NULL AS contact_name,');
//               SQL.Add('       a.phone_number,');
//               SQL.Add('       NULL AS ext,');
//               SQL.Add('       a.fax_number');
//               SQL.Add('  FROM v_vendor a');
//               SQL.Add(Format(' WHERE a.id = %.0f AND',[DM.QryPOVENDOR_ID.AsFloat]));
//             end;
//           SQL.Add('       ROWNUM < 2');
//           Open;
//           if not (Bof and Eof) then
//             begin
//               HintStr := ConcatAddressB(
//                 FieldByName('contact_name').asString,
//                 FieldByName('company').asString,
//                 FieldByName('addr1').asString,
//                 FieldByName('addr2').asString,
//                 FieldByName('addr3').asString,
//                 FieldByName('city').asString,
//                 FieldByName('state').asString,
//                 FieldByName('zip').asString,
//                 FieldByName('country').asString,
//                 FieldByName('phone_number').asString,
//                 FieldByName('ext').asString,
//                 FieldByName('fax_number').asString,
//                 '',
//                 '',
//                 '');
//             end;
//         finally
//           Free;
//         end;
//       end
//
//    else if HintControl = wwComboRemit then
//       begin
//         ReshowTimeout:= 6000;
//         with TFDQuery.Create(nil) do
//         try
//           Connection := db_dm.FDConnection;
//           SQL.Add('SELECT attn,');
//           SQL.Add('       addr1,');
//           SQL.Add('       addr2,');
//           SQL.Add('       addr3,');
//           SQL.Add('       city,');
//           SQL.Add('       state,');
//           SQL.Add('       zip,');
//           SQL.Add('       country');
//           SQL.Add('  FROM remit_to');
//           SQL.Add(Format(' WHERE id = %.0f',[DM.QryPOREMIT_TO_ID.AsFloat]));
//           Open;
//           if not (Bof and Eof) then
//             begin
//               HintStr := ConcatAddressA(
//                 '',
//                 FieldByName('attn').asString,
//                 FieldByName('addr1').asString,
//                 FieldByName('addr2').asString,
//                 FieldByName('addr3').asString,
//                 FieldByName('city').asString,
//                 FieldByName('state').asString,
//                 FieldByName('zip').asString,
//                 FieldByName('country').asString);
//             end;
//         finally
//           Free;
//         end;
//       end
//
//    else if (HintControl = wwComboShip) then
//      begin
//         with TFDQuery.Create(nil) do
//         try
//           Connection := db_dm.FDConnection;
//           SQL.Add('SELECT company,');
//           SQL.Add('       address1,');
//           SQL.Add('       address2,');
//           SQL.Add('       address3,');
//           SQL.Add('       city,');
//           SQL.Add('       state,');
//           SQL.Add('       zip,');
//           SQL.Add('       country');
//           SQL.Add('  FROM company');
//           SQL.Add(Format(' WHERE id = %.0f',[DM.QryPOSHIP_TO_ID.AsFloat]));
//           Open;
//           if not (Bof and Eof) then
//             begin
//               HintStr := ConcatAddressA(
//                 '',
//                 FieldByName('company').asString,
//                 FieldByName('address1').asString,
//                 FieldByName('address2').asString,
//                 FieldByName('address3').asString,
//                 FieldByName('city').asString,
//                 FieldByName('state').asString,
//                 FieldByName('zip').asString,
//                 FieldByName('country').asString);
//             end;
//         finally
//           Free;
//         end;
//      end
//
//    else if HintControl = dbPoNo then with DM.QryPO do
//       begin
//         HintStr:= '';
//         if SecurityManager.EPlantsExist then
//           // po_rscstr.cTXT0000108 = 'Originated under EPlant, %s.';
//           HintStr:= Format(
//             po_rscstr.cTXT0000108 + #13,
//             [SelectValueFmtAsString(
//               'select name || '' ['' || id || '']'' from eplant where id = %f',
//               [FieldByName('eplant_id').asFloat])]);
//       end
//
//    else if HintControl = dbeApprovedBy then
//         HintStr:= Get_PO_Limit_Text
//
//    else if HintControl = sbtApprove then
//       begin
//         if PO_Share.IsPOWorkflowTemplateBased then
//         begin
//            // po_rscstr.cTXT0000109 = 'Jump to PO Workflow'
//            HintStr:= po_rscstr.cTXT0000109;
//            HintStr:= HintStr + #13#13 + Get_SignOffStuff;
//         end
//         else if PO_Share.POStatusNotApproved(DM.QryPOAPPROVED_BY.asString) or
//           (DM.QryPOAPPROVED_BY.asString = '') then
//             HintStr:= Get_SignOffStuff
//         else if PO_Share.POStatusDenied(DM.QryPOAPPROVED_BY.asString) then
//         begin
//             HintStr:= Get_SignOffStuff;
//         end
//         else
//             HintStr:= Get_SignOffStuff;
//         HintStr:= HintStr + #13#13 + Get_PO_Limit_Text;
//       end
//
//    else if HintControl = DBTotalTax then
//    begin
//       ReshowTimeout:= 6000;
//       HintStr:= po_rscstr.cTXT0000005; // 'Tax Components:';
//       DM.QryBreakDownTaxes.Close;
//       DM.QryBreakDownTaxes.Open;
//       while not DM.QryBreakDownTaxes.Eof do
//       begin
//         HintStr:= HintStr + #13 +
//           Format('%s (%f%%) : %m',
//             [DM.QryBreakDownTaxesDESCRIP.asString,
//              DM.QryBreakDownTaxesTAX_RATE.asFloat,
//              DM.QryBreakDownTaxesTAX_AMOUNT.asCurrency]);
//         DM.QryBreakDownTaxes.Next;
//       end;
//    end
//
//    else if (HintControl = dbFob) then
//       begin
//         HintStr := dbFob.Text;
//       end
//
//    else if (HintControl = wwArcusto) or (HintControl = Label17) then
//       begin
//         A := SelectValueArrayFmt(
//           'SELECT company, addr1, addr2, addr3, city, ' +
//           'state, zip, country, phone_number FROM arcusto WHERE id = %.0f',
//           [DM.QryPOARCUSTO_ID.AsFloat]);
//         // po_rscstr.cTXT0000087 = 'Use for customer supplied materials.';
//         if System.Variants.VarArrayDimCount(A) > 0 then
//            HintStr := po_rscstr.cTXT0000087 + #13#13 +
//              ConcatAddressB(
//              '',
//              System.Variants.VarToStr(A[0]),  // Company
//              System.Variants.VarToStr(A[1]),  // Address1
//              System.Variants.VarToStr(A[2]),  // Address2
//              System.Variants.VarToStr(A[3]),  // Address3
//              System.Variants.VarToStr(A[4]),  // City
//              System.Variants.VarToStr(A[5]),  // State
//              System.Variants.VarToStr(A[6]),  // Zip
//              System.Variants.VarToStr(A[7]),  // Country
//              System.Variants.VarToStr(A[8]), // Telephone
//              '', '', '', '', '')  // Ext, Fax, CellTelephone, EMail, URL
//         else
//           HintStr := po_rscstr.cTXT0000087;
//       end;
//  end;
//end;

function TFrmPoBase.Get_SignOffStuff: string;
var
  AData: Variant;
  AText: TStringList;
  AStr1:String;
begin
  // po_rscstr.cTXT0000089 = 'Approved'
  if CompareText(lblApprovedBy.Caption, cTXT0000089) = 0 then
    // po_rscstr.cTXT0000069 = 'Authorizer: ';
    AStr1 := cTXT0000069
  else
    // po_rscstr.cTXT0000068 = 'Reviewer: ';
    AStr1 := cTXT0000068;

  AText:= TStringList.Create;
  try
     // po_rscstr.cTXT0000089 = 'Approved'
    if CompareText(lblApprovedBy.Caption, cTXT0000089) = 0 then
      // po_rscstr.cTXT0000074 = 'PO Status: ';
      AText.Add(cTXT0000074 + lblApprovedBy.Caption)
//    else if not PO_Share.IsPOWorkflowTemplateBased and
//      (PO_Share.POStatusNotApproved(DM.QryPOAPPROVED_BY.asString) or
//      (DM.QryPOAPPROVED_BY.asString = '')) then
//      AText.Add(po_rscstr.cTXT0000074 + po_rscstr.cTXT0000085 {'Not Approved.})
    else
      AText.Add(cTXT0000074 + DM.QryPOAPPROVED_BY.asString);

    AData := SelectValueArrayFmt('SELECT signoff_userid, ' +
      'TO_CHAR(signoff_date, ''MM/DD/RRRR  HH:MI:SS AM'') AS signoff_date, ' +
      'signoff_text FROM po WHERE id = %.0f',
      [DM.QryPOID.asFloat]);

    if System.Variants.VarArrayDimCount(AData) > 0 then
      begin
        if System.Variants.VarToStr(AData[0]) <> '' then
          AText.Add(AStr1 + System.Variants.VarToStr(AData[0]));
        if System.Variants.VarToStr(AData[1]) <> '' then
          AText.Add(cTXT0000070 + System.Variants.VarToStr(AData[1]));
        if System.Variants.VarToStr(AData[2]) <> '' then
          AText.Add(cTXT0000071 + System.Variants.VarToStr(AData[2]) + #13);
     end;

     // po_rscstr.cTXT0000089 = 'Approved'
     if CompareText(lblApprovedBy.Caption, cTXT0000089) = 0 then
       AText.Add(cTXT0000075)
//     else if PO_Share.POStatusDenied(DM.QryPOAPPROVED_BY.asString) then
//       AText.Add(po_rscstr.cTXT0000076)
     else
       AText.Add(cTXT0000073);

     Result := AText.Text;
  finally
     FreeAndNil(AText);
  end;
end;


procedure TFrmPoBase.SBGridViewClick(Sender: TObject);
var
  ACurrentID: Int64;
  //AMsg: TPanelMesg;
begin
  // 1.) Show the form view
  if (PCMain.ActivePage = TabGrid) or (Sender = NIL) then
    begin
      // Save the grid
      //IQRegFormWrite( self, [ wwGridHeader ]);
      // Disconnect and close the "grid view" dataset
      wwGridHeader.DataSource:= NIL;
      // Refresh the dataset in order to force the params to be applied,
      // and limit the records to just one row.
      RefreshDataSetByID(Dm.QryPO);
      // Finally, show the form
      PCMain.ActivePage:= TabForm;
    end
  // 2.) Show the grid view
  else
    begin
      //AMsg := hPleaseWait('');
      try
        ACurrentID := DM.QryPOID.AsLargeInt;
        // Disable controls
        DM.QryPO.DisableControls;
        try
          // Hide the grid temporarily
          wwGridHeader.Visible := False;
          try
            // Close the dataset
            DM.QryPO.Close;
            // Connect the grid to the datasource
            wwGridHeader.DataSource:= DM.SrcPO;
            // Show the grid view
            PCMain.ActivePage:= TabGrid;
            // Open the dataset and locate the current record
            LocatePO(ACurrentID);
            // Apply security
            //wwGridHeader.ColumnByName('PONO').ReadOnly:= not SR.ReadWrite['dbPoNo'];
            // Restore the grid from the Registry
            //IQRegFormRead( self, [ wwGridHeader ]);
          finally
            // Enable controls
            DM.QryPO.EnableControls;
          end;
        finally
          // Show the grid
          wwGridHeader.Visible := True;
        end;
      finally
       // FreeAndNil(AMsg);
      end;
    end;
end;

procedure TFrmPoBase.sbSearchVendClick(Sender: TObject);
var
  AID, ATermsID: LargeInt;
begin
  if DM.PkVendors.Execute then
    begin
      AID := System.Variants.VarAsType(DM.PkVendors.GetValue('ID'), varInt64);
      ATermsID := System.Variants.VarAsType(DM.PkVendors.GetValue('TERMS_ID'), varInt64);
      if AID <> DM.QryPOVENDOR_ID.AsLargeInt then
        AssignVendorID(AID, ATermsID);
    end
  else
    System.SysUtils.Abort;
end;

procedure TFrmPoBase.AssignVendorID( AVendor_ID, ATerms_ID: Real );
var
  nID: Real;
  AVendorContactId:Real;
begin
  if not (DM.QryPO.State in [dsEdit, dsInsert]) then
     DM.QryPO.Edit;

  DM.QryPOVENDOR_ID.asFloat := AVendor_ID;
  DM.QryPOVENDOR_COMPANY.AsString := SelectValueFmtAsString(
    'SELECT company FROM vendor WHERE id = %.0f', [AVendor_ID]);
  ResetTaxCode(AVendor_ID, DM.QryPOID.asFloat, DM.QryPOTAX_CODE_ID);

  AVendorContactId := SelectValueFmtAsFloat(
    'select id from VENDOR_CONTACT where DEFAULT_USE = ''Y'' and ' +
    'vendor_id = %.0f', [DM.QryPOVENDOR_ID.asFloat]);
  if AVendorContactId <> 0 then
    begin
      DM.QryPOVENDOR_CONTACT_ID.asFloat := AVendorContactId;
      DM.QryVendorContact.Close;
      DM.QryVendorContact.Open;
    end;

  if ATerms_ID = 0 then
     ATerms_ID:= SelectValueFmtAsFloat(
       'select terms_id from vendor where id = %f', [AVendor_ID]);

  if ATerms_ID <> 0 then
    DM.QryPOTERMS_ID.asFloat:= ATerms_ID;

  AssignRemitTo( AVendor_ID );

//  AssignEPlantCurrency(DM.QryPO, DM.QryPOCURRENCY_ID, 'VENDOR',
//    DM.QryPOVENDOR_ID.asFloat);
end;

procedure TFrmPoBase.AssignRemitTo(nId:Real);
var
  nRemitToId :Real;
begin
  nRemitToId := SelectValueFmtAsFloat(
    'select id from remit_to where vendor_id = %f and ' +
    'default_remit_to = ''Y''', [ nId ]);
  if nRemitToId = 0 then
    nRemitToId := SelectValueFmtAsFloat(
      'select min(id) from remit_to where vendor_id = %f', [nId]);
  if nRemitToId <> 0 then
    DM.QryPOREMIT_TO_ID.asFloat := nRemitToId;
end;

procedure TFrmPoBase.SBSearchRemitToClick(Sender: TObject);
var
  AID: LargeInt;
begin
//  with DM.PkRemitTo do
//    begin
//      SQL.Clear;
//      SQL.Add(IQFormat('Select id, ' +
//                     'vendor_id, ' +
//                     'attn, ' +
//                     'addr1, ' +
//                     'addr2, ' +
//                     'city, ' +
//                     'state, ' +
//                     'zip  ' +
//                     'from remit_to ' +
//                     'where vendor_id = %.0f',
//                     [DM.QryPOVENDOR_ID.asFloat]));
//      if Execute then
//        begin
//          AID := System.Variants.VarAsType(DM.PkRemitTo.GetValue('ID'), varInt64);
//          if (DM.QryPOREMIT_TO_ID.asFloat <> AID) then
//            begin
//              if not (DM.QryPO.State in [dsEdit, dsInsert]) then
//                DM.QryPO.Edit;
//              DM.QryPOREMIT_TO_ID.asFloat := AID;
//            end;
//        end;
//    end;
end;

procedure TFrmPoBase.SBSearchPurchClick(Sender: TObject);
var
  Pk: TIQWebHPick;
begin

  if not DM.CheckTaxCalculated then
    Exit;

  CheckIsDisp_po_id_as_requisition;
  if IsRequisitionClass then
     Pk:= DM.PkRequisition
  else
     Pk:= DM.PKPOrders;

  // Associated QueryNavigator
//  Pk.AssociatedQueryNavigator := Self.NavHeader;

  with Pk do
    if Execute then
       begin
         // 01-27-9009
         // picklist is called during create constructor and before all tables are open.
         // Use PostMessage to allow the StartUp to be called and then locate the desired record.
         // Note we test GetValue('ID') > 0 to avoid posting request to locate record when OnIQModify was activated and we are about to insert a new record.
         if System.Variants.VarAsType(GetValue('ID'), varInt64) > 0 then
            PostMessage( self.Handle, iq_Notify, 1,
              System.Variants.VarAsType(GetValue('ID'), varInt64));
       end
    else
       ABORT;
end;

procedure TFrmPoBase.New1Click(Sender: TObject);
begin
  DM.EnsureTablesOpen;
//  NavHeader.BtnClick(nbInsert);
end;

procedure TFrmPoBase.Delete1Click(Sender: TObject);
begin
//  NavHeader.BtnClick(nbDelete);
end;

procedure TFrmPoBase.GridHeaderEditButtonClick(Sender: TObject);
begin
//  if wwGridHeader.SelectedField.FieldName = 'Vendor'  then
//     if SR.Enabled['SBSearchVend'] and SR.Visible['SBSearchVend'] then
//        SBSearchVend.Click
//     else if SR.Enabled['SBSearchRemitTo'] and SR.Visible['SBSearchRemitTo'] then
//        SBSearchRemitTo.Click;
end;

procedure TFrmPoBase.About1Click(Sender: TObject);
begin
  //IQAbout1.Execute;
end;

procedure TFrmPoBase.Print1Click(Sender: TObject);
begin
//  IQRepDef1.Execute;
end;

procedure TFrmPoBase.PrinterSetUp1Click(Sender: TObject);
begin
//  PrinterSetupDialog1.Execute;
end;

procedure TFrmPoBase.ShipViaList1Click(Sender: TObject);
begin
//  DoEditFreight(self);
//  DM.QryFreight.Close;
//  DM.QryFreight.Open;
//  DM.QryPO.Refresh;
end;

procedure TFrmPoBase.Copy1Click(Sender: TObject);
begin
  gId        := DM.TblPoDetailID.asFloat;
  gMisc_Item := DM.TblPoDetailMISC_ITEM.asString;
  gMisc_ItemNo := DM.TblPoDetailMISC_ITEMNO.asString;
  gArinvtId  := DM.TblPoDetailARINVT_ID.AsFloat;
  gTotQty    := DM.TblPoDetailTOTAL_QTY_ORD.AsFloat;
  gUnitPrice := DM.TblPoDetailUNIT_PRICE.AsFloat;
  gReqDate   := DM.TblPoDetailREQ_DATE.asDateTime;
  gCmtLine   := DM.TblPoDetailCMTLINE.asString;
  gClosed    := DM.TblPoDetailCLOSED.asString;
  gTaxable   := DM.TblPoDetailTAXABLE.asString;
  gAcctId    := DM.TblPoDetailGLACCT_ID_INV.AsFloat;
  gUOM       := DM.TblPoDetailUNIT.AsString;
end;

procedure TFrmPoBase.Paste1Click(Sender: TObject);
begin
  if gId = 0 then
    Exit;
  if not (DM.TblPoDetail.State in [dsEdit, dsInsert]) then
    DM.TblPoDetail.Edit;
  if Trim(gUOM) > '' then
    DM.TblPoDetailUNIT.AsString := gUOM;

  if gArinvtId <> 0 then
    begin
      DM.TblPoDetailARINVT_ID.AsFloat := gArinvtId;
      DM.TblPoDetailMISC_ITEM.asString := '';
      DM.TblPoDetailMISC_ITEMNO.asString := '';
    end;

  if DM.TblPoDetailARINVT_ID.AsFloat = 0 then
    begin
      DM.TblPoDetailMISC_ITEM.asString := gMisc_Item;
      DM.TblPoDetailMISC_ITEMNO.asString := gMisc_ItemNo;
    end;
  DM.TblPoDetailTOTAL_QTY_ORD.AsFloat := gTotQty;
  DM.TblPoDetailUNIT_PRICE.AsFloat := gUnitPrice;
  if gReqDate <> 0 then
    DM.TblPoDetailREQ_DATE.asDateTime := gReqDate;
  DM.TblPoDetailCMTLINE.asString := gCmtLine;
  DM.TblPoDetailCLOSED.asString := gClosed;
  DM.TblPoDetailTAXABLE.asString := gTaxable;
  if gAcctId <> 0 then
    DM.TblPoDetailGLACCT_ID_INV.AsFloat := gAcctId;
end;

procedure TFrmPoBase.AddItem1Click(Sender: TObject);
begin
  //NavDetail.BtnClick(nbInsert);
end;

procedure TFrmPoBase.DeleteItem1Click(Sender: TObject);
begin
 // NavDetail.BtnClick(nbDelete);
end;

procedure TFrmPoBase.SearchbyLineItem1Click(Sender: TObject);
begin
  with DM.PkLineItems do
    if Execute then
      begin
        if LocatePO(System.Variants.VarAsType(GetValue('ID'), varInt64)) then
          DM.TblPoDetail.Locate('ID',
            System.Variants.VarAsType(GetValue('PO_DETAIL_ID'), varInt64), []);
      end;
end;

procedure TFrmPoBase.Archive1Click(Sender: TObject);
var
  APOID: Int64;
begin
//  ValidateArchive;
//  DM.QryPO.CheckBrowseMode;
//
//  db_dm.FDConnection.StartTransaction;
//  try
//    APOID := DM.QryPOID.AsLargeInt;
//
//    // 07/01/2016 (Byron, EIQ-13033) Moved archiving to back end.
//    DM.ArchivePO(APOID);
//
//    db_dm.FDConnection.Commit;
//
//    NavHeader.BtnClick(nbPrior);
//    if NavHeader.MainID = APOID then
//      NavHeader.BtnClick(nbNext);
//
//    NavHeader.BtnClick(nbRefresh);
//
//  finally
//    if db_dm.FDConnection.InTransaction then
//      begin
//        db_dm.FDConnection.RollBack;
//        ShowMessage(po_rscstr.cTXT0000006 {'Record was not archived'});
//      end
//    else
//      // po_rscstr.cTXT0000007 = 'Record archived successfully'
//      IQInformation( po_rscstr.cTXT0000007);
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TFrmPoBase.ValidateArchive;
begin
  CheckPoVMIDelete;

  if SelectValueFmtAsFloat(
    'select count(id) from po_detail where Closed = ''N'' and po_id = %f',
    [DM.QryPOID.asFloat]) <> 0 then
    // po_rscstr.cTXT0000008 =
    // 'Some items are not closed.  Cannot archive.'
    raise Exception.Create(cTXT0000008);

  //CheckPOReceived_UnInvoiced( DM.QryPOID.asFloat );  {PO_ChkAP.pas}

//  if not IQConfirmYN(Format( po_rscstr.cTXT0000009 {''Archive PO # %s?'}, [ DM.QryPOPONO.asString ])) then
//     ABORT;
end;

{procedure TFrmPoBase.GridDetailCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
  ACount:Real;
begin
  if Highlight then EXIT;

  if (DM.TblPoDetailDROP_SHIP_ORD_DETAIL_ID.asFLoat = 0) then
     begin
       if StrInList( UpperCase(Field.FieldName), ['SEQ',
                                                  'TOTAL_QTY_ORD',
                                                  'UNIT_PRICE',
                                                  'PRICE_PER_1000',
                                                  'REQ_DATE',
                                                  'PROMISE_DATE',
                                                  'CMTLINE',
                                                  'ITEMNUMBER',
                                                  'UNIT',
                                                  'DIVISION_NAME',
                                                  'TAXCODE',
                                                  'GLACCT',
                                                  'REF_CODE_DESCRIP',
                                                  'CUSER1',
                                                  'CUSER2',
                                                  'CUSER3' ]) then
          ABrush.Color:= clWindow
     end

  else
     begin
       if StrInList( UpperCase(Field.FieldName), [ 'UNIT_PRICE',
                                                   'PRICE_PER_1000',
                                                   'CMTLINE',
                                                   'UNIT',
                                                   'CLOSED',
                                                   'TAXCODE',
                                                   'TAXABLE',
                                                   'REF_CODE_DESCRIP',
                                                   'GLACCT',
                                                   'GLACCT_ID_INV',
                                                   'CUSER1',
                                                   'CUSER2',
                                                   'CUSER3' ]) then

          ABrush.Color:= clWindow
       else
          ABrush.Color:= clMoneyGreen
     end;


   if (UpperCase(Field.FieldName) = 'GLACCT') then
   begin
     ACount := SelectValueFmtAsFloat(
       'select count(id) from po_releases where po_detail_id = %f and ' +
       'NVL(budget_state, ''*'') = ''C''', [DM.TblPoDetailID.asFloat]);
     if Acount <> 0 then
       ABrush.Color := clYellow;

     ACount := SelectValueFmtAsFloat(
       'select count(id) from po_releases where po_detail_id = %f and ' +
       'NVL(budget_state, ''*'') = ''O''', [DM.TblPoDetailID.asFloat]);
     if Acount <> 0 then
       ABrush.Color := clRed;
   end;

   if (DM.TblPoDetail.State = dsBrowse)
     and (DM.TblPoDetail.FieldByName('ARINVT_ID').asFloat = 0)
     and (CompareText(Field.FieldName, 'ITEMNUMBER') = 0)
     and not DM.TblPoDetail.Eof then
    ABrush.Color:= clAqua;
end;
}

procedure TFrmPoBase.PriceBreaks1Click(Sender: TObject);
begin
//  begin
//    if fPOPriceBreaks <> nil then
//       fPOPriceBreaks.Close
//    else
//    begin
//      fPOPriceBreaks := TFrmPoPriceBreaks.Create(self);
//      CheckPriceBreaksCaption;
//      fPOPriceBreaks.Show;
//    end;
//  end;
end;

procedure TFrmPoBase.SrcPoDetailDataChange(Sender: TObject; Field: TField);
var
  ev: TDataChangeEvent;
begin
  if not Showing then
    Exit;

  CheckPriceBreaksCaption;

  if (Sender = DM.SrcPoDetail) and (DM.TblPoDetail.State in [dsEdit, dsInsert])
     and ((Field = DM.TblPoDetailPRICE_PER_1000) or (Field = DM.TblPoDetailUNIT_PRICE)) then
  try
     if Field = DM.TblPoDetailPRICE_PER_1000 then
        AssignMirrorValueTo( DM.TblPoDetailUNIT_PRICE, DM.TblPoDetailPRICE_PER_1000.asFloat / 1000 )
     else
        AssignMirrorValueTo( DM.TblPoDetailPRICE_PER_1000, DM.TblPoDetailUNIT_PRICE.asFloat * 1000 )
  except
     AssignMirrorValueTo( DM.TblPoDetailUNIT_PRICE, 0     );
     AssignMirrorValueTo( DM.TblPoDetailPRICE_PER_1000, 0 );
     raise;
  end;

  if (Sender = DM.SrcPoDetail) and (DM.TblPoDetail.State in [dsEdit, dsInsert])
     and ( (Field = DM.TblPoDetailCMTLINE) and ( Length( DM.TblPoDetailCMTLINE.asString ) > 2000 )) then
  try
    ev := DM.SrcPoDetail.OnDataChange;
    DM.SrcPoDetail.OnDataChange:= NIL;
    DM.TblPoDetailCMTLINE.asString:= Copy( DM.TblPoDetailCMTLINE.asString, 1, 2000 );
    //IQWarning(po_rscstr.cTXT0000010 {'The Note field exceeded 2000 characters and has been truncated.'});
  finally
    DM.SrcPoDetail.OnDataChange:= ev;
  end;

  if DM.TblPoDetail.State <> dsInactive then
  begin
    if (DM.TblPoDetail.State = dsBrowse) or (DM.TblPoDetailID.asFloat <> FPo_Detail_ID) then
       UpdateReleasesFooter;
    FPo_Detail_ID:= DM.TblPoDetailID.asFloat;

    {hide or surface ItemNumber ellipsys btn}
 //   DBItemno.ShowButton:= (DM.TblPODetailQTY_RECEIVED.asFloat = 0);
  end;

  DM.PostMCMessage;
end;

procedure TFrmPoBase.AssignMirrorValueTo( AField:TField; AValue:Real );
var
  ADataChange: TDataChangeEvent;
begin
  with DM.SrcPoDetail do
  try
    ADataChange := OnDataChange;
    OnDataChange:= NIL;
    AField.AsFloat:= AValue;
  finally
    OnDataChange:= ADataChange;
   // GridDetail.InvalidateCurrentRow;
  end;
end;

procedure TFrmPoBase.CheckPriceBreaksCaption;
begin
//  if not (DM.TblPoDetail.State in [dsBrowse]) or
//    (fPOPriceBreaks = nil) then
//    Exit;
//
//  if DM.TblPoDetailARINVT_ID.asFloat = 0 then
//    // po_rscstr.cTXT0000011 = 'Miscellaneous Item - No price breaks'
//    fPOPriceBreaks.Caption := po_rscstr.cTXT0000011
//  else
//    // po_rscstr.cTXT0000012 = 'Price List for Item %s, Revision %s'
//    fPOPriceBreaks.caption := Format(po_rscstr.cTXT0000012,
//      [DM.TblPoDetailITEMNUMBER.asString, DM.TblPoDetailREV.asString]);
end;

procedure TFrmPoBase.JumptoInventory1Click(Sender: TObject);
begin
  //IQJump1.Execute;
end;

procedure TFrmPoBase.SBSearchShipToClick(Sender: TObject);
var
  AShipToID: LargeInt;
  nTaxCodeId: Real;
begin
  if DM.PkShipTo.Execute then
    begin
      AShipToID := System.Variants.VarAsType(DM.PkShipTo.GetValue('ID'), varInt64);
      if AShipToID <> DM.QryPOCOMPANY_ID.AsLargeInt then
        begin
          if not (DM.QryPO.State in [dsEdit, dsInsert]) then
            DM.QryPO.Edit;
          DM.QryPOCOMPANY_ID.asFloat := AShipToID;
          DM.QryPOSHIP_TO_ID.asFloat := AShipToID;
       // wwComboShip.Text := DM.wwQryShipCOMPANY.asString;
          DM.wwQryShip.Locate('ID', DM.QryPOSHIP_TO_ID.asFloat, []);
          nTaxCodeId := SelectValueFmtAsFloat(
            'select tax_code_id from company where id = %f',
            [DM.QryPOCOMPANY_ID.asFloat]);
          if (nTaxCodeId <> 0) and (DM.QryPOTAX_CODE_ID.asFloat = 0) then
            DM.QryPOTAX_CODE_ID.asFloat := nTaxCodeId;
          DM.QryPO.Post;
        end;
    end;
end;

procedure TFrmPoBase.JumptoPOReceipts1Click(Sender: TObject);
begin
  //IQJumptoPOReceipts.Execute;
end;

procedure TFrmPoBase.SBPrintClick(Sender: TObject);
begin
//  CheckPONotApproved( DM.QryPOID.asFloat, [po_const.c_po_not_approved,
//    po_const.c_po_denied]);
//  try
//    DM.CheckIncrementVer( DM.QryPOID.asFloat );
//    DoPrintPO( DM.QryPOPONO.asString, DM.QryPOPONO.asString );  {Prn_PO.pas}
//  finally
//    DM.QryPOAfterScroll(nil);
//  end;
end;

procedure TFrmPoBase.SetCriteriaExpression( List:TStringList; cStr:String );
begin
  List.Clear;
  List.Add(cStr);
end;

procedure TFrmPoBase.NavDetailBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
    if (DM.QryPO.State in [dsEdit, dsInsert]) then
      DM.QryPO.Post;
    Application.ProcessMessages;
    DM.tblPODetail.Append;
    Abort;
  end;
end;

procedure TFrmPoBase.NavHeaderBeforeAction(Sender: TObject;  Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
//    IQAssert( SelectValueFmtAsFloat(
//      'select r.id from po_receipts r, po_detail d where r.po_detail_id = d.id and d.po_id = %f and rownum < 2',
//      [DM.QryPOID.asFloat]) = 0,
//      po_rscstr.cTXT0000078 {'Cannot delete a received item - operation aborted'});
//    CheckPoVMIDelete;
  end;


  IQCheckRefresh(Sender, Button);
  // 10/02/2014 Remmed by request (Byron).
  // EIQ-4454 Purchase Orders - remove status exception and add a
  // better message when deleting PO Nicomatic CRM 1069852
  // if Button = nbDelete then
  //   CheckPOBeforeDelete(DM.QryPOID.asFloat); {POCheckBeforeDelete.pas}

  // 10/02/2014 Added delete prompt (Byron).
  // EIQ-4454 Purchase Orders - remove status exception and add a
  // better message when deleting PO Nicomatic CRM 1069852
  // po_rscstr.cTXT0000082 = 'Are you sure you want to delete Purchase Order # %s?';
  IQCheckDelete(Sender, Button, Format(cTXT0000082,
    [DM.QryPOPONO.AsString]));

  if (Button in [nbFirst, nbPrior, nbNext, nbLast]) then
    if not DM.CheckTaxCalculated then
      Abort;
end;

procedure TFrmPoBase.ViewArchivedPOs1Click(Sender: TObject);
begin
//  DM.QryPO.CheckBrowseMode;
//  DoPOHist(self);  {in Po_Hist.pas}
end;

procedure TFrmPoBase.TaxCodes1Click(Sender: TObject);
begin
//  DoTaxCode( self ); {TaxMain.pas}
//  //DM.TblTaxCodes.Refresh;
//  Reopen(DM.wwQryTaxCodes);
end;

procedure TFrmPoBase.TermsMaintenance1Click(Sender: TObject);
begin
//  DoTerms( self, NIL );    {in Terms.pas}
//  DM.QryTerms.Close;
//  DM.QryTerms.Open;
end;

procedure TFrmPoBase.AssignUnitPriceEx(const AQuantity: Real;
  const AArinvtID, AArinvtVendorsID: Int64; const AUOM: string;
  var APricePer1000, AUnitPrice, AStdCost: Real);
type
  TPriceKind = (pkAKA, pkArinvt, pkDefault, pkOutSource);
var
  APriceKind: TPriceKind;
  AAkaID, APriceFieldID, AUseCurrencyID, AUsePOCurrencyID: Int64;
  ARate, AMinQty, APriceBreak: Real;
  APriceFieldName, APriceTableName, APer1000Table, AArinvtUnit: string;
  AIsAKA, AMultiCurrencyEnabled: Boolean;

  function _ActivePriceBreaksExist( APriceKind : TPriceKind ) : Boolean;
  begin
    (*EIQ-10893 Purchase Order - pricing hierarchy not followed when Inactive Date used � Internal AMB 02-23-16*)
    Result:= False;
    case APriceKind of
      pkAKA:       //ARINVT_VENDORS_BREAKS
        begin
          Result:= 1 =
            SelectValueFmtasInteger(
            'select 1 from arinvt_vendors_breaks '+
            ' where arinvt_vendors_id = %d '+
            '   and sysdate between nvl(effect_date, sysdate - 36500 ) '+
            '                   and nvl(deactive_date, sysdate + 36500 )',
            [ AAkaID  ]);
        end;
      pkArinvt:    //ARINVT_BREAKS
        begin
          Result:= 1 =
            SelectValueFmtasInteger(
            'select 1 from ARINVT_BREAKS '+
            ' where arinvt_id = %d '+
            '   and ( currency_id = %d OR 1 = 1 ) '+
            '   and nvl(buying, ''N'') = ''Y'' '+
            '   and sysdate between nvl(effect_date, sysdate - 36500 ) '+
            '                   and nvl(deactive_date, sysdate + 36500 )',
            [ AArinvtID, DM.QryPOCURRENCY_ID.asLargeInt  ]);
        end;
      pkOutSource: //PARTNO_QTY_BREAKS
        begin
          Result:= 1 =
            SelectValueFmtasInteger(
            'select 1 from PARTNO_QTY_BREAKS b, partno p, arinvt a '+
            ' where a.id = %d and p.arinvt_id = a.id and p.standard_id = '+
            '       a.standard_id and b.partno_id = p.id '+
            '   and sysdate between nvl(b.effect_date, sysdate - 36500 ) '+
            '                   and nvl(b.deactive_date, sysdate + 36500 )',
            [ AArinvtID  ]);
        end;
    end;
  end;
begin
  // Initialization
  AUsePOCurrencyID := 0;
  APricePer1000 := 0;
  AUnitPrice := 0;
  AStdCost := 0;

  // Validation
  if AArinvtID = 0 then
    EXIT;

  // Inventory UOM
  AArinvtUnit := SelectValueFmtAsString(
    'SELECT unit FROM arinvt WHERE id = %d', [AArinvtID]);

  // Std_Cost is used in V_VENDOR_ANALYSIS. Keep it in Inventory Native uom
  AStdCost := SelectValueFmtAsFloat(
    'SELECT std_cost FROM arinvt WHERE id = %d', [AArinvtID]);

  // Populate variable for re-use
  AMultiCurrencyEnabled := SelectValueAsString(
    'SELECT multicurrency FROM iqsys') = 'Y';

  // FX Rate
  ARate := 1;
  if AMultiCurrencyEnabled then
    if DM.QryPOCURRENCY_ID.asFloat <> 0 then
      ARate := SelectValueFmtAsFloat(
        'SELECT spot_rate FROM currency WHERE id = %d',
        [DM.QryPOCURRENCY_ID.AsLargeInt]);
  if ARate = 0 then
    ARate := 1;

  // Determine Unit Price Source - Arinvt or AKA
  AAkaID := AArinvtVendorsID;
  if AAkaID = 0 then
    AAkaID := SelectValueFmtAsInt64(
      'SELECT id FROM arinvt_vendors WHERE vendor_id = %d AND ' +
      'arinvt_id = %d ORDER BY seq',
      [DM.QryPOVENDOR_ID.AsLargeInt, AArinvtID]);

  // AKA
  if (AAkaID > 0) and
    (SelectValueFmtAsInt64(
    'SELECT arinvt_vendors_id FROM arinvt_vendors_breaks ' +
    'WHERE arinvt_vendors_id = %d',
    [AAkaID]) <> 0) and
    _ActivePriceBreaksExist( pkAKA ) then
    begin
      AUseCurrencyID := SelectValueFmtAsInt64(
        'SELECT currency_id FROM arinvt_vendors WHERE id = %d',
        [AAkaID]);
//      if AUseCurrencyID = 0 then
//        AUseCurrencyID := Trunc(McShare.GetEplantNativeCurrencyID);

      if SelectValueFmtAsString(
        'SELECT curr_code FROM currency WHERE id = %d', [AUseCurrencyID]) =
        SelectValueFmtAsString(
        'SELECT curr_code FROM currency WHERE id = %d',
        [DM.QryPOCURRENCY_ID.AsLargeInt]) then
        ARate := 1;

      APriceKind := pkAKA;
      APriceFieldID := AAkaID;
      APriceFieldName := 'ARINVT_VENDORS_ID';
      APriceTableName := 'ARINVT_VENDORS_BREAKS';
      APer1000Table := 'ARINVT_VENDORS';
    end
    { Outsource }
  else if ( SelectValueFmtAsFloat(
    'SELECT b.partno_id FROM partno_qty_breaks b, partno p, arinvt a ' +
    'WHERE a.id = %d AND p.arinvt_id = a.id AND p.standard_id = ' +
    'a.standard_id AND b.partno_id = p.id',
    [AArinvtID]) > 0 ) and
    _ActivePriceBreaksExist( pkOutSource ) then
    begin
      APriceKind := pkOutSource;
      APriceFieldID := SelectValueFmtAsInt64(
        'SELECT p.id FROM partno p, arinvt a WHERE a.id = %d AND ' +
        'p.arinvt_id = a.id AND p.standard_id = a.standard_id',
        [AArinvtID]);
      APriceFieldName := 'PARTNO_ID';
      APriceTableName := 'PARTNO_QTY_BREAKS';
      APer1000Table := 'ARINVT'
    end
    { Normal breaks }
  else if ( SelectValueFmtAsInt64(
    'SELECT arinvt_id FROM arinvt_breaks WHERE arinvt_id = %d ' +
    'AND NVL(buying, ''N'') = ''Y''',
    [AArinvtID]) > 0 ) and
    _ActivePriceBreaksExist( pkArinvt ) then
    begin
      if AMultiCurrencyEnabled then
        begin
          if SelectValueFmtAsInt64(
            'SELECT id                                                   '#13 +
            '  FROM arinvt_breaks                                        '#13 +
            ' WHERE arinvt_id = %d AND                                   '#13 +
            '       currency_id = %d AND                                 '#13 +
            '       NVL(buying, ''N'') = ''Y'' AND                       '#13 +
            '       SYSDATE BETWEEN NVL(effect_date, SYSDATE - 36500)    '#13 +
            '                   AND  NVL(deactive_date, SYSDATE + 36500) ',
            [AArinvtID, DM.QryPOCURRENCY_ID.AsLargeInt]) > 0 then
            begin
              ARate := 1;
              AUsePOCurrencyID := DM.QryPOCURRENCY_ID.AsLargeInt;
            end
          else
            AUsePOCurrencyID := 0;
        end;
      APriceKind := pkArinvt;
      APriceFieldID := AArinvtID;
      APriceFieldName := 'ARINVT_ID';
      APriceTableName := 'ARINVT_BREAKS';
      APer1000Table := 'ARINVT'
    end
  else
    { Std cost - default }
    begin
      APriceKind := pkDefault;
      APriceFieldID := AArinvtID;
      APer1000Table := 'ARINVT';
    end;

  case APriceKind of
    pkAKA, pkArinvt, pkOutSource:
      begin
        APriceBreak := GetPriceBreakUOM(AQuantity, // AQty
          APriceFieldID, // AFK_ID_Value
          APriceFieldName, // AFK_ID_FieldName
          APriceTableName, // ATableName
          AUOM, // Act_UOM
          DM.TblPoDetailArinvt_Unit.asString, // Std_UOM
          AArinvtID, 'Y', AUsePOCurrencyID);
        if not FUpdateUnitPrice then
          CheckMinOrderQty(AQuantity, // Qty_Ord
            APriceTableName, // APriceTableName
            APriceFieldName, // APriceFieldName
            APriceFieldID, // APriceFieldID
            AUOM, // Act_UOM
            AArinvtUnit, // Std_UOM
            AArinvtID); // Arinvt_ID
      end;
    pkDefault:
      begin
        APriceBreak := IQConvertUOM(
          SelectValueFmtAsFloat(
          'SELECT std_price FROM arinvt WHERE id = %d', [APriceFieldID]),
          AUOM, // AFromOM
          AArinvtUnit, // AToUOM
          AArinvtID);
      end;
  end;

  // Assign spot rate
  APriceBreak := APriceBreak / ARate;

  // Assign price values based on price break
  AUnitPrice := APriceBreak;
  APricePer1000 := APriceBreak * 1000;

  // If price breaks are per 1000, modify values
  if SelectValueFmtAsString(
    'SELECT price_per_1000 FROM %s WHERE id = %d',
    [APer1000Table, APriceFieldID]) = 'Y' then
  begin
    APricePer1000 := APriceBreak;
    AUnitPrice := APriceBreak / 1000;
  end;
end;

procedure TFrmPoBase.AssignUnitPrice(AQtyPO:Real = -1);
var
  APricePer1000, AUnitPrice, AStdCost: Real;
begin
  // 10/08/2015 (Byron, EIQ-8991)

  if (DM.TblPoDetailMISC_ITEM.asString <> '') and  (DM.TblPoDetailUNIT_PRICE.asFloat <> 0) then
    exit;


  AssignUnitPriceEx(
    {IQMS.Common.Numbers.fIIf(AQtyPO > 0,} AQtyPO, {DM.TblPoDetailTotal_Qty_Ord.AsFloat),}
    DM.TblPoDetailARINVT_ID.AsLargeInt,
    DM.TblPoDetailARINVT_VENDORS_ID.AsLargeInt,
    DM.TblPoDetailUNIT.AsString,
    {var} APricePer1000, AUnitPrice, AStdCost);

  if APricePer1000 > 0 then
     DM.TblPoDetailPrice_Per_1000.asFloat:= APricePer1000;
  DM.TblPoDetailUnit_Price.Value    := AUnitPrice;
  DM.TblPoDetailSTD_COST.asFloat:= AStdCost;
end;

(*
procedure TFrmPoBase.AssignUnitPrice(AQtyPO:Real = -1);
type
  TPriceKind = ( pkAKA, pkArinvt, pkDefault, pkOutSource );
var
  nAkaId       : Real;
  nId          : Real;
  cIdField     : String;
  cTable       : String;
  nMinQty      : Real;
  APriceBreak  : Real;
  IsAKA        : Boolean;
  PriceKind    : TPriceKind;
  APer1000Table: string;
  ARate        : Real;
  AcurrId      : Real;
  APOCurrId    : Real;
  AQty         : Real;
begin
  APOCurrId := 0;
  if DM.TblPoDetailARINVT_ID.asFloat = 0 then
     EXIT;

  if AQtyPO > 0 then
    AQty := AQtyPO
  else
    AQty := DM.TblPoDetailTotal_Qty_Ord.asFloat;

  {FX Rate}
  ARate := 1;
  if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
     if DM.QryPOCURRENCY_ID.asFloat <> 0 then
       ARate := SelectValueFmtAsFloat(
       'select spot_rate from currency where id = %f',
       [DM.QryPOCURRENCY_ID.asFloat]);
  if ARate = 0 then
    ARate := 1;

  {Determine Unit Price Source - Arinvt or AKA}
  nAkaID := DM.TblPoDetailARINVT_VENDORS_ID.asFloat;
  if nAkaID = 0 then
    nAkaID := SelectValueFmtAsFloat(
      'select id from arinvt_vendors where vendor_id = %f and arinvt_id = %f order by seq',
      [DM.QryPOVENDOR_ID.asFloat, DM.TblPoDetailARINVT_ID.asFloat ]);

  {Aka}
  if (nAkaId <> 0) and
    (SelectValueFmtAsFloat(
    'select ARINVT_VENDORS_ID from ARINVT_VENDORS_BREAKS where ARINVT_VENDORS_ID = %f',
    [nAkaId]) <> 0) then
  begin
     AcurrId := SelectValueFmtAsFloat(
       'select currency_id from arinvt_vendors where id = %f',
       [nAkaId]);
     if AcurrId = 0 then
       AcurrId := GetEplantNativeCurrencyId; {in McShare.pas}

     if SelectValueFmtAsString('select curr_code from currency where id = %f', [AcurrId]) =
        SelectValueFmtAsString('select curr_code from currency where id = %f',
        [DM.QryPOCURRENCY_ID.asFloat]) then
        ARate := 1;

     PriceKind    := pkAKA;
     nId          := nAkaID;
     cIdField     := 'ARINVT_VENDORS_ID';
     cTable       := 'ARINVT_VENDORS_BREAKS';
     APer1000Table:= 'ARINVT_VENDORS';
  end
  {Outsource}
  else if SelectValueFmtAsFloat(
    'select b.partno_id from partno_qty_breaks b, partno p, arinvt a ' +
    'where a.id = %f and p.arinvt_id = a.id and p.standard_id = ' +
    'a.standard_id and b.partno_id = p.id',
    [DM.TblPoDetailARINVT_ID.asFloat]) > 0 then
  begin
    PriceKind     := pkOutSource;
    nID           := SelectValueFmtAsFloat(
      'select p.id from partno p, arinvt a where a.id = %f and ' +
      'p.arinvt_id = a.id and p.standard_id = a.standard_id',
      [DM.TblPoDetailARINVT_ID.asFloat]);
    cIdField      := 'PARTNO_ID';
    cTable        := 'PARTNO_QTY_BREAKS';
    APer1000Table := 'ARINVT'
  end
  {Normal breaks}
  else if SelectValueFmtAsFloat(
    'select arinvt_id from arinvt_breaks where arinvt_id = %f ' +
    'and NVL(buying, ''N'') = ''Y''',
    [DM.TblPoDetailARINVT_ID.asFloat]) > 0 then
  begin
     if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
     begin
       if SelectValueFmtAsFloat(
         'select id from arinvt_breaks where arinvt_id = %f and currency_id = %f and NVL(buying, ''N'') = ''Y'' ' +
         'and sysdate between NVL(effect_date, sysdate - 36500) and NVL(deactive_date, sysdate + 36500)',
         [DM.TblPoDetailARINVT_ID.asFloat, DM.QryPOCURRENCY_ID.asFloat]) <> 0 then
       begin
         ARate := 1;
         APOCurrId := DM.QryPOCURRENCY_ID.asFloat;
       end
       else
         APOCurrId := 0;
     end;
     PriceKind    := pkARINVT;
     nId          := DM.TblPoDetailArinvt_ID.asFloat;
     cIdField     := 'ARINVT_ID';
     cTable       := 'ARINVT_BREAKS';
     APer1000Table:= 'ARINVT'
  end
  else
  {Std cost - defau;t}
  begin
    PriceKind     := pkDefault;
    nID           := DM.TblPoDetailArinvt_ID.asFloat;
    APer1000Table := 'ARINVT';
  end;

  case PriceKind of
    pkAKA, pkArinvt, pkOutSource:
       begin
         APriceBreak:= GetPriceBreakUOM( AQty,  // AQty
                                         nID,                                  // AFK_ID_Value
                                         cIDField,                             // AFK_ID_FieldName
                                         cTable,                               // ATableName
                                         DM.TblPoDetailUNIT.asString,          // Act_UOM
                                         DM.TblPoDetailArinvt_Unit.asString,   // Std_UOM
                                         DM.TblPoDetailArinvt_ID.asFloat, 'Y', APOCurrId);
         if not FUpdateUnitPrice then
           CheckMinOrderQty( AQty,  // Qty_Ord
                             cTable,                               // cTable
                             cIDField,                             // cIdField
                             nId,                                  // nId
                             DM.TblPoDetailUNIT.asString,          // Act_UOM
                             DM.TblPoDetailArinvt_Unit.asString,   // Std_UOM
                             DM.TblPoDetailArinvt_ID.asFloat );    // Arinvt_ID
       end;
    pkDefault:
       begin
         APriceBreak:= IQConvertUOM( SelectValueFmtAsFloat('select std_price from arinvt where id = %f', [ nID ]),
                                     DM.TblPoDetailUNIT.asString,         // AFromOM
                                     DM.TblPoDetailArinvt_Unit.asString,  // AToUOM
                                     DM.TblPoDetailArinvt_ID.asFloat );
       end;
  end;

  if SelectValueFmtAsString('select price_per_1000 from %s where id = %f', [ APer1000Table, nID ]) = 'Y' then
     DM.TblPoDetailPrice_Per_1000.asFloat:= APriceBreak
  else
     DM.TblPoDetailUnit_Price.asFloat    := APriceBreak;

  {Unit_Price}
  DM.TblPoDetailUnit_Price.asFloat:= DM.TblPoDetailUnit_Price.asFloat/ARate;

  {Std_Cost is used in V_VENDOR_ANALYSIS. Keep it in Inventory Native uom}
  DM.TblPoDetailSTD_COST.asFloat:= DM.TblPoDetailSTD_COST_ARINVT.asFloat;
end;
*)

procedure TFrmPoBase.CheckMinOrderQty( Qty_Ord: Real; const cTable, cIdField: string; nId: Real; Act_UOM, Std_UOM: string; AArinvt_ID: Real );
var
  nMinQty: Real;
  AQty   : Real;
begin
  if Qty_Ord = 0 then
     EXIT;

  AQty:= Trunc( IQConvertUOM( Qty_Ord, Act_UOM, Std_UOM, AArinvt_ID ) * 100)/100;  {IQProc}

  nMinQty := SelectValueFmtAsFloat('select min(quan) from %s where %s = %f ' +
                       'and sysdate between NVL(effect_date, sysdate - 36500) and NVL(deactive_date, sysdate + 36500)',
                       [cTable, cIdField, nId]);

  if AQty < nMinQty then
    // po_rscstr.cTXT0000110 =
    // 'The selected quantity (%f %s) is less than the minimum ' +
    // 'quantity (%f %s) in the Quantity/Price breaks table (%s).';
//    IQWarning( Format(po_rscstr.cTXT0000110,
//    [Qty_Ord, Act_UOM, nMinQty, Std_UOM, cTable]));
end;

procedure TFrmPoBase.TblPoDetailUNIT_PRICEChange(Sender: TField);
var
  AConfirm:Integer;
  ACount:Real;
begin
    if FUpdateUnitPrice then
      DM.TblPoDetailUNIT_PRICE.OnChange := nil;

  if DM.TblPoDetail.state in [dsInsert] then exit;
  ACount := SelectValueFmtAsFloat('select count(id) from po_receipts where po_detail_id = %f ' +
               ' and id not in (select po_receipts_id from apprepost_detail where po_detail_id = %f)' +
               ' and id not in (select po_receipts_id from apinvoice_detail where po_detail_id = %f)',
  [DM.TblPoDetailID.asFloat, DM.TblPoDetailID.asFloat, DM.TblPoDetailID.asFloat]);


  if ACount = 0 then exit;

  if (DM.TblPoDetail.State = dsEdit) then
//         and (DM.TblPoDetailUNIT_PRICE.asFloat > 0) then
  begin
//   AConfirm := IQDialogChkEx( TFrmConfUnitPrice,
//                              po_rscstr.cTXT0000059,
//                              'PO_ConfirmUnitPriceChange' );

   if AConfirm <> 1 then
     Exit;

     ExecuteCommandFmt('update po_receipts set unit_price = %.6f where id in ' +
               ' (select id from po_receipts where po_detail_id = %f ' +
               ' and id not in (select po_receipts_id from apprepost_detail where po_detail_id = %f)' +
               ' and id not in (select po_receipts_id from apinvoice_detail where po_detail_id = %f))',
               [DM.TblPoDetailUNIT_PRICE.asFloat,
                DM.TblPoDetailID.asFloat,
                DM.TblPoDetailID.asFloat,
                DM.TblPoDetailID.asFloat]);
  end;
end;


procedure TFrmPoBase.TblPoDetailTOTAL_QTY_ORDChange(Sender: TField);
var
  AExecuteOnChange: Boolean;
begin
  {Feb-15-2005 - work around IP4000 bug }
//  if Assigned( FindFormByClassName( 'TFrmPOFormView' )) then
//     AExecuteOnChange:= TRUE
//  else
     begin
       AExecuteOnChange       := not FwwBlanketQtyIsChanging;
       FwwBlanketQtyIsChanging:= not FwwBlanketQtyIsChanging;
     end;

  if not AExecuteOnChange then
     EXIT;

  // po_rscstr.cTXT0000013 =
  // 'Blanket Quantity has changed. Update the Unit Price?'
//  if ((DM.TblPoDetail.State = dsInsert) or (DM.TblPoDetail.State = dsEdit)) and
//    (DM.TblPoDetailARINVT_ID.AsInteger > 0) and
//    (DM.TblPoDetailTOTAL_QTY_ORD.asFloat > 0) and
//    IQConfirmYNChk( po_rscstr.cTXT0000013,
//    'PO_Change_Unit_Price_On_Qty_Change') then
//   AssignUnitPrice;
end;

procedure TFrmPoBase.btnCurrency1Click(Sender: TObject);
begin
//  DOMCFormDisplay(self,
//                 DM.QryPOCURRENCY_ID.asFloat,
//                 DM.TblPoDetail,
//                 TFrmMCFormBasicClass( TFrmMCPODetails )); {in MCFrmBas.pas}
end;

procedure TFrmPoBase.btnCurrency2Click(Sender: TObject);
begin
//  DOMCFormDisplay(self,
//                 DM.QryPOCURRENCY_ID.asFloat,
//                 DM.ViewPoTotal,
//                 TFrmMCFormBasicClass( TFrmMCPOTotals )); {in MCFrmBas.pas}
end;

procedure TFrmPoBase.ViewSelectBoilerPlate1Click(Sender: TObject);
var
  ABoiler_ID:Real;
begin
//  if DoViewSelectBoilerPlate( 'PO', ABoiler_ID ) then {BoilSel.pas}
//     AssignTextToField(  DM.TblPoDetailCMTLINE, ABoiler_ID );  {BoilSel.pas}
end;

procedure TFrmPoBase.SaveAsBoilerPlate1Click(Sender: TObject);
begin
  DM.TblPoDetail.CheckBrowseMode;
  //SaveToBoilerPlate( StrTran(DM.TblPoDetailCMTLINE.asString, #13#10, #13), 'PO' ); {BoilSel.pas}
end;


procedure TFrmPoBase.LoadfromBoilerPlate1Click(Sender: TObject);
var
  ID: Real;
begin
  with PkBoiler do
//    if Execute then
//       AssignTextToField( DM.TblPoDetailCMTLINE, GetValue( 'ID' ));  {BoilSel.pas}
    //with DM.TblPoDetail do
    //begin
    //  ID:= GetValue( 'ID');
    //  Edit;
    //  DM.TblPoDetailCMTLINE.asString:= SelectValueFmtAsString('select text from boiler_plate where id = %f', [ ID ]);
    //end;
end;

procedure TFrmPoBase.wwDBComboUOMDropDown(Sender: TObject);
begin
  with Sender as TwwDBComboBox do
  begin
    //LoadUOM( Items, DM.TblPoDetailARINVT_ID.asFloat );  {Inv_Misc.pas}
    //GetPO_UOM( Sender as TwwDBComboBox );               {PO_UOM.pas }
    ABORT;
    //Perform( CB_SHOWDROPDOWN, 0, 0 );     {Closeup the drop down box}
  end;
end;

procedure TFrmPoBase.cbCurrencyDropDown(Sender: TObject);
begin
  DM.TblPoDetail.CheckBrowseMode;
//  if cbCurrency.ReadOnly then
//    raise Exception.Create('This PO has details, cannot edit currency');
end;

procedure TFrmPoBase.VersionControl1Click(Sender: TObject);
begin
//  DoShowPOVerControl(self);  {PO_Ver.pas}
end;

//procedure TFrmPoBase.PopupMenu1Popup(Sender: TObject);
//begin
//  {Same menu is assigned to the PO_Main and PO_Form }
//  FormView1.Caption:= sIIf( TPopupMenu(sender).PopupComponent = GridDetail, 'Form View', 'Table View');
//
//  {Releases Copy/Paste}
//  CopyReleases1.Enabled := DM.TblPODetailID.asFloat > 0;
//  PasteReleases1.Enabled:= (FCopy_Detail_ID > 0) and
//                           SR.Enabled['PasteReleases1'] and
//                           (SelectValueFmtAsFloat('select 1 from po_releases where po_detail_id = %f', [ FCopy_Detail_ID ]) = 1);
//
//  JumptoDropShipSO1.Enabled:= (SelectValueFmtAsFloat('select drop_ship_ord_detail_id from po_detail where id = %f', [ DM.TblPODetailID.asFloat ]) > 0)
//                              and SR.Enabled['JumptoDropShipSO1'];
//  DropShipReporting1.Enabled:= (SelectValueFmtAsFloat('select drop_ship_ord_detail_id from po_detail where id = %f', [ DM.TblPODetailID.asFloat ]) > 0)
//                              and SR.Enabled['DropShipReporting1'];
//  BatchDropShipReporting1.Enabled:= (SelectValueFmtAsFloat('select drop_ship_ord_detail_id from po_detail where id = %f', [ DM.TblPODetailID.asFloat ]) > 0)
//                              and SR.Enabled['BatchDropShipReporting1'];
//  EditMiscellaneousItem1.Enabled := SR.Enabled['EditMiscellaneousItem1'] and
//   (DM.TblPoDetailARINVT_ID.AsInteger = 0);
//end;

function TFrmPoBase.Get_PO_Limit_Text: string;
var
  A         : Variant;
  ATypeName : string;
  ALimit    : Real;
  ANoCostInc: Boolean;
  AText: TStringList;
begin
  // AMat:= 0; ACap:= 0; AExp:= 0;
  // A:= SelectValueArrayFmt( 'select po_limit, po_cap_limit, po_exp_limit, po_cant_incr_cost from s_user_general where user_name = ''%s''', [ SecurityManager.UserName ]);

  ATypeName:= DM.QryPOPO_TYPE.asString;
//  A:= SelectValueArrayFmt(
//    'select t.name, p.limit from s_user_po_type p, po_type t ' +
//    'where p.user_name = ''%s'' and p.po_type_id = t.id and t.name = ''%s''',
//    [ SecurityManager.UserName, FixStr( DM.QryPOPO_TYPE.asString ) ]);
  if VarArrayDimCount( A ) > 0 then
      ALimit:= A[ 1 ];

//  ANoCostInc:= 'Y' = SelectValueFmtAsString(
//    'select po_cant_incr_cost from s_user_general where user_name = ''%s''',
//    [SecurityManager.UserName]);

  AText:= TStringList.Create;
  try
    // AText.Add(Format(        po_rscstr.cTXT0000015 { 'User Name: %s' },     [SecurityManager.UserName] ));
     AText.Add(Format(        cTXT0000016 { 'PO Total : %m' },     [DM.ViewPoTotalTOTAL_AFTER_TAX.AsFloat] ));
     AText.Add(               cTXT0000017 { 'PO Cost Limits:' } );
     AText.Add(Format( '  %s: %m', [ ATypeName, ALimit ] ));
     if ANoCostInc then
        AText.Add(cTXT0000021 { 'Cost increase: Not Authorized' });
     Result := AText.Text;
  finally
     FreeAndNil(AText);
  end;
end;

procedure TFrmPoBase.sbtnNotApprovedListClick(Sender: TObject);
begin
  // DoShowUnApprovedPOs( self ); {PoNotApp.pas}
 // DoIQJumpApprovePO( Application );  // jumpdispatcher.pas
end;

procedure TFrmPoBase.FOB1Click(Sender: TObject);
begin
//  DoFob(self, DM.QryFob);  {in Fob.pas}
end;

procedure TFrmPoBase.ArchiveclosedPOs1Click(Sender: TObject);
begin
//  if TFrmPOArcive.DoShowModal(Self) then
//    PostMessage(Handle, iq_RefreshDataSets, 1, 0);
  // if DoArchiveClosedPo(self) then  {in POArch.pas}
  //  DM.QryPO.Refresh;
end;

procedure TFrmPoBase.sbtnAssignEPlantClick(Sender: TObject);
begin
  //DoChangePlantID( self, DM.QryPO );
end;

procedure TFrmPoBase.AssignDetailEPlant1Click(Sender: TObject);
begin
  if (DM.TblPODetailARINVT_ID.asFloat <> 0) and
    (DM.TblPODetailARINVTEPLANT_ID.AsFloat <> 0) then
    // 'Cannot change EPlant. PO Detail Item and Inventory Item must have the same EPlant.';
    raise Exception.Create(cTXT0000022);
  //DoChangePlantID( self, DM.TblPODetail );  {SetPlant.pas}
end;

procedure TFrmPoBase.RepeatLine1Click(Sender: TObject);
begin
//  with DM.TblPodetail do
//  try
//    AfterInsert := nil;
//    if not (State in [dsBrowse]) then
//      raise Exception.Create(po_rscstr.cTXT0000023 {'Please post changes before repeating.'});
//    Copy1Click(nil);
//    Append;
//    AssignSequence;
//    AssignTaxable;
//    Paste1Click(nil);
//    AssignUnitPrice;
//    DM.TblPodetail.Refresh;
//    DM.TblPodetail.Last;
//  finally
//    AfterInsert := TblPoDetailAfterInsert;
//  end;
end;

procedure TFrmPoBase.AssignSequence;
begin
  DM.TblPoDetailSEQ.asInteger := SelectValueFmtAsInteger(
    'SELECT MAX(seq) AS seq FROM po_detail ' +
    'WHERE po_id = %.0f',
    [DM.QryPOID.asFloat]) + 1;
end;

procedure TFrmPoBase.AssignTaxable;
begin
  DM.TblPoDetailCLOSED.asString := 'N';
  if DM.QryPO.FieldByName('TAX_CODE_ID').asFloat <> 0 then
    DM.TblPoDetailTAXABLE.asString := 'Y'
  else
    DM.TblPoDetailTAXABLE.asString := 'N';
end;


procedure TFrmPoBase.Contents1Click(Sender: TObject);
begin
  //IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmPoBase.sbtnSeachPODetailClick(Sender: TObject);
begin
  with DM.PkPO_Detail do
    if Execute then
       DM.TblPODetail.Locate('ID', GetValue('po_detail_id'), [])
end;

procedure TFrmPoBase.FormView1Click(Sender: TObject);
begin
  {Same menu is assigned to the POMain and PO_Form }
 // if CompareText(StrTran(FormView1.Caption, '&', ''), po_rscstr.cTXT0000024 {'Form View'}) = 0 then
     //DoPO_Form( self )     {PO_Form.pas}
 // else
     self.BringToFront;    {Surface main form}
end;

procedure TFrmPoBase.LimitLookupToVendor(Sender: TObject);
begin
  with Sender as TwwDBLookupCombo, LookupTable do
  begin
    //Filter  := IQFormat( 'VENDOR_ID = %.0f', [ DM.QryPOVENDOR_ID.asFloat ]);
    Filtered:= TRUE;
  end;
end;

procedure TFrmPoBase.UnLimitLookupToVendor(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  LookupTable.Filtered:= FALSE;
end;

{procedure TFrmPoBase.wwGridHeaderCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if not Highlight and
     StrInList( Field.FieldName, [ 'PONO',
                                   'PO_DATE',
                                   'Vendor',
                                   'RemitTo',
                                   'FOB',
                                   'Freight',
                                   'Terms',
                                   'TaxCodeDesc']) then
     ABrush.Color := clWindow;

end;
  }

procedure TFrmPoBase.IQNotifyInsertMessage( var Msg: TMessage );
begin
  case Msg.WParam of
    0:   if FormIsLoaded then
         try
//           NavHeader.AssignMainID(DM.QryPOID.AsFloat);
           if PCMain.ActivePage = TabForm then
              dbPoNo.SetFocus;
         except
           {dbPoNo is invisible - walk away}
         end;

    1:   {came from PO PickList}
         if (DM.QryPOID.asFloat > 0) and (DM.QryPOID.asFloat = Msg.LParam ) then
         begin
           PostMessage( self.Handle, iq_RefreshDataSets, 0, 0 );
           if not DM.QryPOReleases.Active then
             DM.QryPOReleases.Open;
         end
         else if Msg.LParam > 0 then
            begin
               // 02/25/2015 Close employee dataset for speed
               DM.wwQryPr_Emp.Close;
               if not LocatePO(Msg.LParam) then
                 // po_rscstr.cTXT0000065 =
                 // 'Unable to locate requisition %d.  The first available ' +
                 // 'record has been selected.';
                 //IQInformation( Format(po_rscstr.cTXT0000065, [ Msg.LParam ]));
               DM.EnsureTablesOpen;
            end;
  end;
  SetTaxButton;
end;

procedure TFrmPoBase.IQRefreshDataSets( var Msg: TMessage );
begin
  // Gets called from PO_Hist after we restore a PO, sales order
  // for drop ship details, drop ship reporting
  DM.QryPO.Refresh;
  DM.TblPoDetail.Refresh;
end;

procedure TFrmPoBase.AssignPOCostSource( APODetailID, AToolTaskElementID: Real;
                                     ACostSourceString: String );
begin
  if ( AToolTaskElementID > 0 ) and
     ( IsFoundFmt( 'select id from po_detail where id = %f', [ APODetailID ]  )) then
     try
          ExecuteCommandFmt( 'update po_detail set cost_object_source = ''%s'', ' +
                     'cost_object_id = %f where id = %f',
                     [ ACostSourceString, AToolTaskElementID, APODetailID ] );
     except ABORT;
     end;
end;

procedure TFrmPoBase.dbPoNoEnter(Sender: TObject);
begin
  FOldPONO := dbPoNo.Text;
end;

procedure TFrmPoBase.TracePO1Click(Sender: TObject);
begin
 //DoShowTrace( self, 'PO', DM.QryPOID.asFloat );                {TR_Base.pas}
end;

procedure TFrmPoBase.TraceDetail1Click(Sender: TObject);
begin
 //DoShowTrace( self, 'PO_DETAIL', DM.TblPoDetailID.asFloat );   {TR_Base.pas}
end;

procedure TFrmPoBase.ShowpayablesforthisPO1Click(Sender: TObject);
begin
  //DoShowPoPaybles(Self, DM.QryPOID.AsLargeInt); {in POPay.pas}
end;

procedure TFrmPoBase.UpdateReleasesFooter( ATotal: Real = -999999 );
var
  ASum: Real;
begin
  {if ATotal is passed in like in POReleases after post then take it, otherwise - recalc}
  if ATotal = -999999 then
     ASum:= DM.GetReleasesQuanTotal( DM.TblPoDetailID.asFloat )
  else
     ASum:= ATotal;

  with edTotRel do
  begin
     Text:= FormatFloat(' ###,###,##0.##', ASum );
  end;
end;

{procedure TFrmPoBase.GridReleasesCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Highlight then
     // with DM.QryPOReleases do
     begin
       if DM.QryPOReleases.State = dsInsert then // DM.QryPOReleasesID.AsFloat = 0 then
          begin
            ABrush.Color:= clPurple;
            AFont.Color := clWhite;
          end
       else if (DM.QryPOReleasesQUAN.AsFloat > 0) and
         (DM.QryPOReleasesLEFT_TO_RECV.AsFloat = 0) then
          begin
             ABrush.Color := clLime;
             AFont.Color := clBlack;
          end
       else if (DM.QryPOReleasesLEFT_TO_RECV.AsFloat < DM.QryPOReleasesQUAN.AsFloat) and
         (DM.QryPOReleasesLEFT_TO_RECV.AsFloat > 0) then
          begin
            ABrush.Color:= clYellow;
            AFont.Color := clBlack;
          end
       else
          begin
            ABrush.Color:= clPurple;
            AFont.Color := clWhite;
          end;

       if (UpperCase(Field.FieldName) = 'REQUEST_DATE') then
       begin
         if DM.QryPOReleasesBUDGET_STATE.AsString = 'O' then
         begin
           ABrush.Color := clRed;
           AFont.Color := clBlack;
         end
         else if DM.QryPOReleasesBUDGET_STATE.AsString = 'C' then
         begin
           ABrush.Color := clYellow;
           AFont.Color := clBlack;
         end
       end;
     end;
end;}

procedure TFrmPoBase.GridDetailMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 // if (Button = mbLeft) and (GridDetail.GetActiveField = DM.TblPODetailTOTAL_QTY_ORD) and
   //  (DM.TblPODetailTOTAL_QTY_ORD.Value > 0) then
  //begin
    if GridDetail.DataSource.DataSet.State in [dsInsert, dsEdit] then
      GridDetail.DataSource.DataSet.Post;

    GridDetail.BeginDrag( FALSE );
    EXIT;
//  end;
end;

procedure TFrmPoBase.GridReleasesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= Source = GridDetail;
end;

procedure TFrmPoBase.GridReleasesDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  ADate: TDateTime;
begin
  with DM do
  begin
    ADate := Date();
    GetReleaseDatesUsingLeadTime(ADate);

    QryPOReleases.Append;
    QryPOReleasesQUAN.asFloat           := TblPODetailTOTAL_QTY_ORD.AsFloat;
    QryPOReleasesREQUEST_DATE.asDateTime:= ADate;
    QryPOReleasesPROMISE_DATE.asDateTime:= ADate;
    QryPOReleases.Post;
  end;
end;

procedure TFrmPoBase.NavReleasesBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  {since we can't refresh QryReleases lets do it manually}
  with DM do
    if Button = nbRefresh then
       begin
         RefreshDataSetByID( QryPOReleases );
         System.SysUtils.ABORT;
       end
    else if Button = nbInsert then
       begin
         QryPOReleases.Append;  {Append at the bottom}
         System.SysUtils.ABORT;
       end;
end;

procedure TFrmPoBase.sbtnRecalcClick(Sender: TObject);
//var
//  HMsg : TPanelMesg;
begin
//  try
//    HMsg:= hPleaseWait( po_rscstr.cTXT0000025 {'Updating PO Receipts.  Please wait...'} );
//    try
//       ExecuteCommandFmt(
//         'begin po_misc.assign_releases_to_receipts( %.0f ); end;',
//         [ DM.TblPoDetailID.asFloat ]);
//    except on E:Exception do
//       // 'Attempt to re-evaluate PO Receipts against PO Releases failed because of the following error:'
//       IQWarning( po_rscstr.cTXT0000026 + #13 + E.Message );
//    end;
//    Reopen( DM.QryPOReleases )
//  finally
//    HMsg.Free;
//  end;
end;


//procedure TFrmPoBase.GenerateReleases1Click(Sender: TObject);
//var
//  ALeadDays: integer;
//begin
//  DM.TblPODetail.CheckBrowseMode;
//
//  TDM_PO.CheckPODetailIsDropShip( DM.TblPODetailID.asFloat );
//
//  if GetSwitch( 'PO_RELEASE_USE_LEAD_TIME', 'IQSYS2' ) = 'Y' then
//    ALeadDays := SelectValueByID('lead_days', 'arinvt', DM.TblPODetailARINVT_ID.asFloat)
//  else
//    ALeadDays := 0;
//
//  FRelInputCargo.LeadDays := ALeadDays;
//
//  if (DM.TblPODetailID.asFloat > 0) and
//    DoReleasesDialog( self, FRelInputCargo ) then  {PoRel_Dlg.pas}
//  begin
//    {current item}
//    if not FRelInputCargo.AllItems then
//    begin
//      GenerateReleasesFromInput( FRelInputCargo, DM.TblPODetailID.asFloat );
//      EXIT;
//    end;
//
//    {all items}
//    DM.TblPODetail.First;
//    while not DM.TblPODetail.Eof do
//    begin
//      GenerateReleasesFromInput( FRelInputCargo, DM.TblPODetailID.asFloat );
//      DM.TblPODetail.Next;
//    end;
//  end;
//end;

procedure TFrmPoBase.CopyReleases1Click(Sender: TObject);
begin
  DM.TblPODetail.CheckBrowseMode;
  TDM_PO.CheckPODetailIsDropShip( DM.TblPODetailID.asFloat );
  FCopy_Detail_ID:= DM.TblPODetailID.asFloat;
end;

procedure TFrmPoBase.PasteReleases1Click(Sender: TObject);
begin
  DM.TblPODetail.CheckBrowseMode;
  TDM_PO.CheckPODetailIsDropShip( DM.TblPODetailID.asFloat );
  //case DoGetPasteReleasesMode_PO( self, FCopy_Detail_ID ) of  { Paste_Rel_OE}
   // pmCancel   : ;
   // pmAppend   : DoPasteReleases( DM.TblPODetailID.asFloat, FCopy_Detail_ID, FALSE );
   // pmOverwrite: DoPasteReleases( DM.TblPODetailID.asFloat, FCopy_Detail_ID, TRUE  );
  //end;
end;

//procedure TFrmPoBase.DoPasteReleases( APO_Detail_ID_Trg, APO_Detail_ID_Src: Real; AOverwrite: Boolean );
//begin
//  if AOverwrite and (APO_Detail_ID_Trg = APO_Detail_ID_Src) then
//     EXIT;
//
//  try
//    db_dm.FDConnection.StartTransaction;
//
//    if AOverwrite then
//       ExecuteCommandFmt(
//         'delete from po_releases where po_detail_id = %f',
//         [ APO_Detail_ID_Trg ]);
//
//    ExecuteCommandFmt(
//      'insert into po_releases( po_detail_id, quan, promise_date, request_date) '+
//      'select %f, quan, promise_date, request_date from po_releases where po_detail_id = %f',
//      [ APO_Detail_ID_Trg, APO_Detail_ID_Src ]);
//
//    db_dm.FDConnection.Commit;
//
//    DM.QryPOReleasesAfterPost( DM.QryPOReleases );
//  finally
//    if db_dm.FDConnection.InTransaction then
//      db_dm.FDConnection.RollBack;
//  end;
//end;

//procedure TFrmPoBase.GenerateReleasesFromInput( ARelInputCargo: TRelInputCargo; APO_Detail_ID: Real );
//var
//  I    : Integer;
//  ADate: TDateTime;
//  // AUseLeadTime: Boolean;
//  AForecast:String;
//  AVendor_ID, AArinvt_ID, AArinvt_Vendors_ID, AEplant_ID: Real;
//  releaseDates: TReleases;
//begin
//  with ARelInputCargo do
//  try
//    db_dm.FDConnection.StartTransaction;
//    if Forecast then
//      AForecast := 'Y'
//    else
//      AForecast := 'N';
//
//    if UseBlanket then
//       Qty_Per:= SelectValueByID('total_qty_ord', 'po_detail', APO_Detail_ID) / Count;
//
//    //CheckMultipleOf(nil, ARelInputCargo);
//
//    if Overwrite then
//       ExecuteCommandFmt('delete from po_releases where po_detail_id = %f', [ APO_Detail_ID ]);
//
//    ADate:= Start_Date;
//
//    // 06/12/2014
////    DM.GetReleaseDatesUsingLeadTime(ADate);
//
//    //for I:= 0 to Count - 1 do
//    releaseDates := ARelInputCargo.RepInterval.GetReleases(ADate, Count);
//    for ADate in releaseDates do
//      begin
//        ExecuteCommandFmt(
//          'insert into po_releases( po_detail_id, quan, promise_date, request_date, orig_quan, forecast) '+
//          ' values ( %f, %.4f, to_date(''%s'', ''mm/dd/yyyy''), to_date(''%s'', ''mm/dd/yyyy''), %.4f, ''%s'')',
//          [APO_Detail_ID,
//           Qty_Per,
//           FormatDateTime( 'mm/dd/yyyy', ADate ),
//           FormatDateTime( 'mm/dd/yyyy', ADate ),
//           Qty_Per,
//           AForecast]);
//         //ADate := ADate + Interval;
//      end;
//
//    db_dm.FDConnection.Commit;
//
//    DM.QryPOReleasesAfterInsert( DM.QryPOReleases );
//    DM.QryPOReleasesAfterPost  ( DM.QryPOReleases );
//  finally
//    if db_dm.FDConnection.InTransaction then
//       db_dm.FDConnection.RollBack;
//  end;
//end;

procedure TFrmPoBase.wwdblookPR_EmpDropDown(Sender: TObject);
begin
  (Sender as TwwDBLookupCombo).LookupTable.Filter:= 'PK_HIDE = NULL or PK_HIDE = ''N''';
  (Sender as TwwDBLookupCombo).LookupTable.Filtered := True;
  (Sender as TwwDBLookupCombo).LookupTable.Locate('ID', DM.QryPOPR_EMP_ID_RQSTNR.asFloat, []);
end;

procedure TFrmPoBase.wwdblookPR_EmpCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  LookupTable.Filter:= '';
end;

procedure TFrmPoBase.wwGlAcctCustomDlg(Sender: TObject);
begin
 IQPickAndReplace(DM.TblPoDetailGLACCT_ID_INV, DM.PkAcct, 'ID');
end;

procedure TFrmPoBase.wwGlAcctKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_DELETE, VK_BACK] then
  begin
    DM.TblPoDetail.Edit;
    DM.TblPoDetailDIVISION_ID.Clear;
    Key:= 0;
  end;
end;

procedure TFrmPoBase.ReceiptInformation1Click(Sender: TObject);
begin
  //DoViewPOReceipts( self, DM.SrcPoDetail, DM.TblPoDetailID.asFloat ); {in POVRec.pas}
end;

procedure TFrmPoBase.sbMiscClick(Sender: TObject);
begin
//  AddFromInventory1.Checked     := sbFg.Down;
//  AddMiscellaneousItem1.Checked := sbMisc.Down;
//  AddFromAKA1.Checked  := sbAka.Down;
end;

procedure TFrmPoBase.AddFromInventory1Click(Sender: TObject);
begin
//  sbFg.Down := True;
//  sbMiscClick(sbFG);
end;

procedure TFrmPoBase.AddMiscellaneousItem1Click(Sender: TObject);
begin
//  sbMisc.Down := True;
//  sbMiscClick(sbMisc);
end;

procedure TFrmPoBase.AddFromAKA1Click(Sender: TObject);
begin
//  sbAka.Down := True;
//  sbMiscClick(sbAka);
end;

{
10/09/2015 See PO_Share.CheckArinvtStdCostAssigned
procedure TFrmPoBase.CheckPO_CheckStdCost(AId:Real);
var
  AConfirm:integer;
begin
  if  (SelectValueAsString('select NVL(STD_COST_POSTING, ''N'') from iqsys where rownum < 2') = 'Y')
  and (SelectValueFmtAsFloat('select count(arinvt_id) from arinvt_elements where arinvt_id = %f', [Aid]) = 0)
  and (SelectValueFmtAsString('select NVL(non_material, ''N'') from arinvt where id = %f', [Aid]) = 'N')
  // po_rscstr.cTXT0000086 =
  // 'Standard Cost is not assigned. Do you wish to Continue?';
  and not IQConfirmYNWithSecurity(po_rscstr.cTXT0000086,
                                 'PO_CheckStdCost', False) then
    // po_rscstr.cTXT0000060 = 'Standard Cost is not assigned.';
    raise Exception.Create(po_rscstr.cTXT0000060);
end;}

procedure TFrmPoBase.AppendMultiFromArinvt;
var
  AArinvtID, APODetailID: Int64;
  i: Integer;
begin
  // Post parent dataset
  if (DM.QryPO.State in [dsEdit,dsInsert]) then
    DM.QryPO.Post;

  // Post detail
  if (DM.TblPODetail.State in [dsEdit,dsInsert]) then
   DM.TblPODetail.Post;

  // 10/09/2015 Show the multi-select pick list.
  // NOTE:  This is a copy of PkArinvt.
  with DM.PkArInvtEx do
    try
      if ExecuteEx('id') then
        begin
          DM.TblPODetail.DisableControls;
          try
            // Check selection.  Raise standard errors.
            for i := 0 to ResultList.Count - 1 do
              begin
                AArinvtID := StrToInt64(ResultList[i]);
                //CheckInventoryItemInactive(AArinvtID);
                //PO_Share.CheckArinvtStdCostAssigned(AArinvtID);
                // CAR & ECO
                //CheckCAR_ECO_Exists(AArinvtID);   {Car_Eco_Chk.pas}
              end;

            // Loop results, and add inventory items to the order detail
            for i := 0 to ResultList.Count - 1 do
              begin
                AArinvtID := StrToInt64(ResultList[i]);

                // Add the PO Detail
//                AddPODetail(DM.QryPOID.AsLargeInt, AArinvtID,
//                  {var} APODetailID);
              end;

            // Final System.Actions, after everything is done
            DM.TblPODetail.Refresh;
            DM.TblPODetail.Locate('ID', APODetailID, []);
            DM.TblPoDetailAfterPost(DM.TblPoDetail);
          finally
            DM.TblPODetail.EnableControls;
          end;
        end;
    finally
      System.SysUtils.Abort;
    end;
end;

procedure TFrmPoBase.AppendMultiFromAka;
var
  AAkaID, AArinvtID, APODetailID: Int64;
  AUnitPrice: Real;
  APickList: TIQWebHPick;
  i: Integer;
begin
  // Post parent dataset
  if (DM.QryPO.State in [dsEdit,dsInsert]) then
    DM.QryPO.Post;

  // Post detail
  if (DM.TblPODetail.State in [dsEdit,dsInsert]) then
   DM.TblPODetail.Post;

  if (SelectValueAsString(
    'SELECT NVL(show_oem_item_nbr, ''N'') FROM iqsys2 WHERE ROWNUM < 2') = 'Y') then
    APickList := DM.PkAkaOEM
  else
    APickList := DM.PkAka;

  with APickList do
    try
      if ExecuteEx('id') then
        begin
          DM.TblPODetail.DisableControls;
          try
            // Loop results, and add items to the order detail
            for i := 0 to ResultList.Count - 1 do
              begin
                AAkaID := StrToInt64(ResultList[i]);
                AArinvtID := SelectValueFmtAsInt64(
                  'SELECT arinvt_id FROM arinvt_vendors WHERE id = %d',
                  [AAkaID]);
                // Add the PO Detail
//                AddPODetail(DM.QryPOID.AsLargeInt, AArinvtID,
//                  {var} APODetailID);

//                AUnitPrice :=
//                  GetPriceBreak( 0,
//                                 AAkaID,
//                                 'ARINVT_VENDORS_ID',
//                                 'ARINVT_VENDORS_BREAKS',
//                                 'Y',
//                                 DM.QryPOCURRENCY_ID.asFloat,
//                                 IQMS.Dates.IQOracleAdjustedDateTime);
                if AUnitPrice = 0 then
                  AUnitPrice:=
                    SelectValueFmtAsFloat(
                    'SELECT std_price FROM arinvt WHERE id = %d',
                      [AArinvtID]);

                ExecuteCommandFmt(
                 'UPDATE po_detail                    '#13 +
                 '   SET arinvt_vendors_id = %d,      '#13 +
                 '       unit_price = %.6f,           '#13 +
                 '       price_per_1000  = %.6f       '#13 +
                 ' WHERE id = %d                      ',
                 [AAkaID, AUnitPrice, AUnitPrice * 1000, APODetailID]);
              end;

            // Final System.Actions, after everything is done
            DM.TblPODetail.Refresh;
            DM.TblPODetail.Locate('ID', APODetailID, []);
            DM.TblPoDetailAfterPost(DM.TblPoDetail);
          finally
            DM.TblPODetail.EnableControls;
          end;
        end;
    finally
      System.SysUtils.Abort;
    end;
end;

//procedure TFrmPoBase.AddPODetail(const APOID, AArinvtID: Int64;
//  var APODetailID: Int64);
//var
//  AUnitPrice, APricePer1000, AStdCost: Real;
//  AAKAID, AGLACCT_ID, AGLACCT_ID_INV, AEPlantID, AVendorID, AShipToID,
//  ADivisionID, ARefCodeID, ATaxCodeID, APOCurrencyID: Int64;
//  i, ASeq: Integer;
//  ANonTaxablePO, ANonMaterial, ADontPostPPV: string;
//  AData: Variant;
//  AUOM:  String;
//begin
//  // Initialize var params
//  APODetailID := 0;
//  AGLACCT_ID_INV := 0;
//  AEPlantID := 0;
//  ANonMaterial := 'N';
//
//  // Get PO Information
//  with TFDQuery.Create(nil) do
//  try
//    Connection := db_dm.FDConnection;
//    SQL.Add('SELECT currency_id,');
//    SQL.Add('       vendor_id,');
//    SQL.Add('       ship_to_id,');
//    SQL.Add('       (SELECT division_id');
//    SQL.Add('          FROM company');
//    SQL.Add('         WHERE id = ship_to_id)');
//    SQL.Add('          AS division_id,');
//    SQL.Add('       tax_code_id');
//    SQL.Add('  FROM po');
//    SQL.Add(Format(' WHERE id = %d',[APOID]));
//    Open;
//    if (Bof and Eof) then
//      Exit;
//    APOCurrencyID := Fields[0].AsLargeInt;
//    AVendorID := Fields[1].AsLargeInt;
//    AShipToID := Fields[2].AsLargeInt;
//    ADivisionID := Fields[3].AsLargeInt;
//    ATaxCodeID := Fields[4].AsLargeInt;
//  finally
//    Free;
//  end;
//
//  // Get Inventory information
//  with TFDQuery.Create(nil) do
//  try
//    Connection := db_dm.FDConnection;
//    SQL.Add(       'SELECT acct_id_inv,                        ');
//    SQL.Add(       '       eplant_id,                          ');
//    SQL.Add(       '       NVL(non_material, ''N''),           ');
//    SQL.Add(       '       NVL(nontaxable_po, ''N'')           ');
//    SQL.Add(       '  FROM arinvt                              ');
//    SQL.Add(Format(' WHERE id = %d                             ',[AArinvtID]));
//    Open;
//    if (Bof and Eof) then
//      Exit;
//    AGLACCT_ID_INV := Fields[0].AsLargeInt;
//    AEPlantID := Fields[1].AsLargeInt;
//    ANonMaterial := Fields[2].AsString;
//    ANonTaxablePO := Fields[3].AsString;
//    // Check and adjust the GL Account ID values
//    AGLACCT_ID := Get_GLAcct_ID_Exp_FromVendor(AVendorID);
//    if (AGLACCT_ID > 0) and  (AGLACCT_ID_INV = 0) then
//      AGLACCT_ID_INV := AGLACCT_ID;
//    // If this GL Account requires a cost source, then clear it because
//    // no cost source is being applied at this point.
//    if PO_Share.GLAccountRequiresCostSource(AGLACCT_ID_INV) then
//      AGLACCT_ID_INV := 0;
//    ADontPostPPV := IQMS.Common.Numbers.sIIf(IsNonInventoryItem(AArinvtID),'Y','N');
//  finally
//    Free;
//  end;
//
//  // Get the next PO_DETAIL.ID
//  APODetailID := GetNextID('po_detail');
//  // Get then next sequence number in the detail
//  ASeq := SelectValueFmtAsInteger(
//    'SELECT MAX(seq) FROM po_detail WHERE po_id = %d',
//    [DM.QryPOID.AsLargeInt]) + 1;
//  // Initialize the AKA.ID, if available
//  AAKAID := SelectValueFmtAsInt64(
//    'SELECT id FROM arinvt_vendors WHERE arinvt_id = %d AND vendor_id = %d',
//    [AArinvtID, DM.QryPOVENDOR_ID.AsLargeInt]);
//  // Get the first available UOM: arinvt_vendors->arinvt->arinvt_uom_conv
//  AUOM := SelectValueFmtAsString(
//    'SELECT COALESCE((SELECT uom                                '#13 +
//    '                   FROM arinvt_vendors                     '#13 +
//    '                  WHERE id = %d),                          '#13 +
//    '                (SELECT unit                               '#13 +
//    '                   FROM arinvt                             '#13 +
//    '                  WHERE id = %d),                          '#13 +
//    '                (SELECT uom                                '#13 +
//    '                   FROM arinvt_uom_conv                    '#13 +
//    '                  WHERE arinvt_id = %d AND                  '#13 +
//    '                        NVL(default_po, ''N'') = ''Y''))   '#13 +
//    '          AS uom                                           '#13 +
//    '  FROM DUAL                                                ',
//    [AAKAID, AArinvtID, AArinvtID]);
//
//  AUnitPrice := GetPriceBreak(
//    0,
//    AArinvtID,
//    'ARINVT_ID',
//    'ARINVT_BREAKS',
//    'N',
//    APOCurrencyID);
//  if AUnitPrice = 0 then
//    AUnitPrice := SelectValueFmtAsFloat(
//     'SELECT std_price FROM arinvt WHERE id = %d',
//     [AArinvtID]);
//
//  // Get default pricing
//  AssignUnitPriceEx(0, AArinvtID, AAKAID, AUOM,
//    {var} APricePer1000, AUnitPrice, AStdCost);
//
//  ExecuteCommandParam(
//    'INSERT INTO po_detail(id,                                  '#13 +
//    '                      po_id,                               '#13 +
//    '                      seq,                                 '#13 +
//    '                      arinvt_id,                           '#13 +
//    '                      total_qty_ord,                       '#13 +
//    '                      unit_price,                          '#13 +
//    // '                      req_date,                            '#13 +
//    // '                      promise_date,                        '#13 +
//    '                      glacct_id_inv,                       '#13 +
//    '                      closed,                              '#13 +
//    '                      taxable,                             '#13 +
//    '                      price_per_1000,                      '#13 +
//    '                      unit,                                '#13 +
//    '                      std_cost,                            '#13 +
//    '                      dont_post_ppv,                       '#13 +
//    '                      eplant_id,                           '#13 +
//    '                      division_id,                         '#13 +
//    '                      ref_code_id,                         '#13 +
//    '                      uom_factor,                          '#13 +
//    '                      arinvt_vendors_id,                   '#13 +
//    '                      tax_code_id)                         '#13 +
//    '    VALUES (:ID,                                           '#13 +
//    '            :PO_ID,                                        '#13 +
//    '            :SEQ,                                          '#13 +
//    '            :ARINVT_ID,                                    '#13 +
//    '            :TOTAL_QTY_ORD,                                '#13 +
//    '            :UNIT_PRICE,                                   '#13 +
//    // '            :REQ_DATE,                                     '#13 +
//    // '            :PROMISE_DATE,                                 '#13 +
//    '            :GLACCT_ID_INV,                                '#13 +
//    '            :CLOSED,                                       '#13 +
//    '            :TAXABLE,                                      '#13 +
//    '            :PRICE_PER_1000,                               '#13 +
//    '            :UNIT,                                         '#13 +
//    '            :STD_COST,                                     '#13 +
//    '            :DONT_POST_PPV,                                '#13 +
//    '            :EPLANT_ID,                                    '#13 +
//    '            :DIVISION_ID,                                  '#13 +
//    '            :REF_CODE_ID,                                  '#13 +
//    '            :UOM_FACTOR,                                   '#13 +
//    '            :ARINVT_VENDORS_ID,                            '#13 +
//    '            :TAX_CODE_ID)                                  ',
//    ['ID;INT64',
//     'PO_ID;INT64',
//     'SEQ;INT',
//     'ARINVT_ID;INT64',
//     'TOTAL_QTY_ORD;FLOAT',
//     'UNIT_PRICE;FLOAT',
//     // 'REQ_DATE;DATE',
//     // 'PROMISE_DATE;DATE',
//     'GLACCT_ID_INV;INT64',
//     'CLOSED',
//     'TAXABLE',
//     'PRICE_PER_1000',
//     'UNIT',
//     'STD_COST;FLOAT',
//     'DONT_POST_PPV',
//     'EPLANT_ID;INT64',
//     'DIVISION_ID;INT64',
//     'REF_CODE_ID;INT64',
//     'UOM_FACTOR;FLOAT',
//     'ARINVT_VENDORS_ID;INT64',
//     'TAX_CODE_ID;INT64'],
//    [APODetailID,
//     APOID,
//     ASeq,
//     AArinvtID,
//     0, //TOTAL_QTY_ORD
//     AUnitPrice, // UNIT_PRICE
//     // REQ_DATE
//     // PROMISE_DATE
//     IQMS.Common.Numbers.NullIfZero(AGLACCT_ID_INV), // GLACCT_ID_INV
//     'N', // CLOSED
//     IQMS.Common.Numbers.sIIf((ANonTaxablePO = 'Y') or (ATaxCodeID = 0), 'N', 'Y'), // TAXABLE
//     IQMS.Common.Numbers.NullIfZero(APricePer1000), // PRICE_PER_1000
//     AUOM, // UNIT
//     IQMS.Common.Numbers.NullIfZero(AStdCost), // STD_COST
//     ADontPostPPV, // DONT_POST_PPV
//     IQMS.Common.Numbers.NullIfZero(AEPlantID), // EPLANT_ID
//     IQMS.Common.Numbers.NullIfZero(ADivisionID), // DIVISION_ID
//     IQMS.Common.Numbers.NullIfZero(ARefCodeID), // REF_CODE_ID
//     1, // UOM_FACTOR
//     IQMS.Common.Numbers.NullIfZero(AAKAID), // ARINVT_VENDORS_ID
//     IQMS.Common.Numbers.NullIfZero(ATaxCodeID)// TAX_CODE_ID
//     ]);
//end;

procedure TFrmPoBase.SelectFromPkArinvt;
var
  AId, AkaId:Real;
begin
  with DM.PkArInvt do
  if Execute then
  begin
    AId := GetValue('ID');
    //CheckInventoryItemInactive( AID );  // InactiveInvItemChk.pas
    //PO_Share.CheckArinvtStdCostAssigned(AId);
    DM.TblPoDetail.Edit;
    DM.TblPoDetailMISC_ITEM.asString := '';
    DM.TblPoDetailMISC_ITEMNO.asString := '';
    DM.TblPoDetailARINVT_ID.asFloat := AId;

    ResetTaxable(DM.TblPoDetailARINVT_ID.asFloat,  DM.TblPoDetailTAXABLE);

    DM.TblPoDetailARINVT_VENDORS_ID.Clear;
    AkaId := SelectValueFmtAsFloat(
      'select id from ARINVT_VENDORS where arinvt_id = %f and vendor_id = %f',
      [aId, DM.QryPOVENDOR_ID.asFloat]);

    if AkaId <> 0 then
      DM.TblPoDetailARINVT_VENDORS_ID.asFloat := AkaId;

    DM.TblPoDetailUNIT_PRICE.asFloat :=
      GetPriceBreak( DM.TblPoDetailTOTAL_QTY_ORD.AsFloat,
                     DM.TblPoDetailARINVT_ID.AsFloat,
                     'ARINVT_ID',
                     'ARINVT_BREAKS', 'N', DM.QryPOCURRENCY_ID.asFloat);
    if DM.TblPoDetailUNIT_PRICE.asFloat = 0 then
//       DM.TblPoDetailUNIT_PRICE.asFloat:=
//         SelectValueAsFloat( IQFormat('select std_price from arinvt where id = %f',
//           [ DM.TblPoDetailARINVT_ID.asFloat ]));
    CheckUnitPriceOnInsert(AkaId);
    AssignUnitPrice;
  end;
end;

procedure TFrmPoBase.SelectfromPkAkA;
var
  cSql:String;
  AId, ArinvtId:Real;
  APk: TIQWebHpick;
  AUnitPrice:Real;
begin
  if (SelectValueAsString('select nvl(SHOW_OEM_ITEM_NBR, ''N'') from iqsys2 where rownum < 2') = 'Y') then
    APk := DM.PkAkaOEM
  else
    APk := DM.PkAka;
  with APk do
  begin
    if Execute then
    begin
      AId := GetValue('ID');
      ArinvtId := SelectValueFmtAsFloat('select arinvt_id from arinvt_vendors where id = %f', [AId]);
      //PO_Share.CheckArinvtStdCostAssigned(ArinvtId);
      DM.TblPoDetail.Edit;
      DM.TblPoDetailMISC_ITEM.asString := '';
      DM.TblPoDetailMISC_ITEMNO.asString := '';
      DM.TblPoDetailARINVT_VENDORS_ID.asFloat := AId;
      DM.TblPoDetailARINVT_ID.asFloat := ArinvtId;

      ResetTaxable(DM.TblPoDetailARINVT_ID.asFloat,  DM.TblPoDetailTAXABLE);

      DM.TblPoDetailUNIT_PRICE.asFloat :=
        GetPriceBreak( DM.TblPoDetailTOTAL_QTY_ORD.asFloat,
                       DM.TblPoDetailARINVT_ID.asFloat,
                       'ARINVT_ID',
                       'ARINVT_BREAKS', 'N', DM.QryPOCURRENCY_ID.asFloat);
      if DM.TblPoDetailUNIT_PRICE.asFloat = 0 then
      begin
        AUnitPrice := SelectValueFmtAsFloat('select std_price from arinvt where id = %f', [ DM.TblPoDetailARINVT_ID.asFloat ]);
        DM.TblPoDetailUNIT_PRICE.Value := AUnitPrice;
      end;
      CheckUnitPriceOnInsert(AId);
      AssignUnitPrice;
    end;
  end;
end;

//procedure TFrmPoBase.SelectFromFreeForm;
//var
//  NewString: string;
//  ClickedOK: Boolean;
//  cDescrip : string;
//  cItemNo  : string;
//  nQty     : Real;
//  nPrice   : Real;
//  nArInvtId: Real;
//  AUnit    : string;
//  AState   : TDataSetState;
//  AId      : Real;
//  AQry     : TFDQuery;
//begin
//    if not (DM.TblPoDetail.State in [dsEdit, dsInsert]) then
//      DM.TblPoDetail.Edit;
//    cDescrip  := DM.TblPoDetailMISC_ITEM.asString;
//    // po_rscstr.cTXT0000094 = 'Misc. Item';
//    cItemNo   := Nz(DM.TblPoDetailMISC_ITEMNO.asString, po_rscstr.cTXT0000094);
//    nQty      := DM.TblPoDetailTOTAL_QTY_ORD.asFloat;
//    nPrice    := DM.TblPoDetailUNIT_PRICE.asFloat;
//    nArInvtId := DM.TblPoDetailARINVT_ID.asFloat;
//    AUnit     := DM.TblPoDetailUNIT.asString;
//
//    DM.TblPoDetailMISC_ITEM.asString:= DM.TblPoDetailDisp_Descript.asString;
//
//    if DM.TblPoDetailTOTAL_QTY_ORD.asFloat = 0 then
//      DM.TblPoDetailTOTAL_QTY_ORD.asFloat := 1;
//
//    AState := DM.TblPoDetail.state;
//    try
//      DM.TblPoDetailTOTAL_QTY_ORD.OnChange := nil;
//      with PkMisc do
//      if Execute then
//      begin
//        AId := GetValue('ID');
//        ClickedOK := (AId <> 0);
//      end
//      else
//        ClickedOK := false;
//    finally
//      DM.TblPoDetailTOTAL_QTY_ORD.OnChange := TblPoDetailTOTAL_QTY_ORDChange;
//      Screen.Cursor := crDefault;
//    end;
//
//    if (AState = dsEdit) and (nQty <> DM.TblPoDetailTOTAL_QTY_ORD.asFloat) then
//      TblPoDetailTOTAL_QTY_ORDChange(nil);
//
//    if ClickedOK then
//       begin
//         DM.TblPoDetail.Edit;
//         DM.TblPoDetailARINVT_ID.Clear;
//         AQry := TFDQuery.Create(nil);
//         try
//           AQry.Connection := db_dm.FDConnection;
//           AQry.SQL.Add('SELECT misc_item,');
//           AQry.SQL.Add('       misc_itemno,');
//           AQry.SQL.Add('       unit_price,');
//           AQry.SQL.Add('       glacct_id_inv,');
//           AQry.SQL.Add('       unit,');
//           AQry.SQL.Add('       quan,');
//           AQry.SQL.Add('       note');
//           AQry.SQL.Add('  FROM c_po_misc');
//           AQry.SQL.Add(Format(' WHERE id = %.0f',[AId]));
//           AQry.Open;
//           if not (AQry.Eof and AQry.Bof) then
//           begin
//             DM.TblPoDetailMISC_ITEM.asString    := AQry.FieldByName('misc_item').asString;
//             DM.TblPoDetailMISC_ITEMNO.asString  := AQry.FieldByName('misc_itemno').asString;
//             DM.TblPoDetailUNIT_PRICE.asFloat    := AQry.FieldByName('unit_price').asFloat;
//             DM.TblPoDetailC_PO_MISC_ID.asFloat  := AId;
//             DM.TblPoDetailUNIT.asString         := AQry.FieldByName('unit').asString;
//             DM.TblPoDetailMISC_NOTE.AsString    := AQry.FieldByName('note').asString;
//             if AQry.FieldByName('glacct_id_inv').asFloat <> 0 then
//               DM.TblPoDetailGLACCT_ID_INV.asFloat := AQry.FieldByName('glacct_id_inv').asFloat;
//             if AQry.FieldByName('quan').asFloat <> 0 then
//               DM.TblPoDetailTOTAL_QTY_ORD.asFloat := AQry.FieldByName('quan').asFloat;
//           end;
//         finally
//           AQry.Free;
//         end;
//       end
//    else
//      begin
//        DM.TblPoDetail.Edit;
//        DM.TblPoDetailMISC_ITEM.asString := cDescrip;
//        DM.TblPoDetailMISC_ITEMNO.asString := cItemNo;
//        if (nQty <> DM.TblPoDetailTOTAL_QTY_ORD.asFloat) then
//          DM.TblPoDetailTOTAL_QTY_ORD.asFloat := nQty;
//        DM.TblPoDetailUNIT_PRICE.asFloat := nPrice;
//        if nArInvtId > 0 then
//           DM.TblPoDetailARINVT_ID.asFloat := nArInvtId
//        else
//           DM.TblPoDetailARINVT_ID.Clear;
//        DM.TblPoDetailUNIT.asString:= AUnit;
//      end;
//end;

procedure TFrmPoBase.CheckUnitPriceOnInsert(AkaId:Real = 0);
var
  A : Variant;
  AUom, AAkaUom:  String;
begin
  if DM.TblPoDetailARINVT_ID.asFloat <> 0 then
  begin
    AAkaUom := SelectValueFmtAsString(
      'select uom from arinvt_vendors where id = %f', [AkaId]);

    A:= SelectValueArrayFmt(
      'select NVL(acct_id_inv,0), NVL(unit, ''EACH''), eplant_id from arinvt where id = %f',
      [DM.TblPoDetailARINVT_ID.asFloat]);
    if VarArrayDimCount( A ) > 0 then
    begin
      if A[ 0 ] > 0 then
         DM.TblPoDetailGLACCT_ID_INV.asFloat:= A[ 0 ];

      if AAkaUom <> '' then
        DM.TblPoDetailUNIT.asString:= AAkaUom
      else
        DM.TblPoDetailUNIT.asString:= A[ 1 ];
      if A[ 2 ] > 0 then
         DM.TblPoDetailEPLANT_ID.asFloat:= A[ 2 ];
    end;

    if AAkaUom = '' then
      AUom := SelectValueFmtAsString(
        'select uom from arinvt_uom_conv where arinvt_id = %f and NVL(default_po, ''N'') = ''Y''',
        [DM.TblPoDetailARINVT_ID.asFloat]);

    if AUom <> '' then
      DM.TblPoDetailUNIT.asString:= AUom;

    DM.TblPoDetailUOM_FACTOR.asFloat :=
      IQToNativeUomFactor(
        DM.TblPoDetailUNIT.asString, // AFromUOM
        DM.TblPoDetailARINVT_ID.asFloat, // AArinvt_ID
        TRUE ); // AIgnoreError

   // DM.TblPoDetailDONT_POST_PPV.asString:= IIf(DM.TblPoDetailNon_Material.asString = 'Y', 'Y', 'N' );
  end;
end;


procedure TFrmPoBase.DBItemnoCustomDlg(Sender: TObject);
begin
  {Showbutton is false when we have receipts against this PO (see OnDataChange), no picklist is allowed - prevent user from alt-down to get the picklist}
 // if not DBItemno.ShowButton then EXIT;
  try
    DM.TblPoDetail.AfterInsert := nil;

    if sbFg.Down then
       SelectFromPkArinvt
    else if sbAka.Down then
       SelectfromPkAkA
    else
       //SelectfromFreeForm;
    if DM.TblPoDetail.State in [dsInsert]  then
    begin
     AssignTaxable;
     AssignAfterInsertValues;
    end;

  finally
    DM.TblPoDetail.AfterInsert := TblPoDetailAfterInsert;
  end;
end;

procedure TFrmPoBase.ShowCARsECOs1Click(Sender: TObject);
begin
  //ShowCAR_ECO_Exist( self, DM.TblPoDetailARINVT_ID.asFloat ); {CAR_ECO_Exist.pas}
end;

procedure TFrmPoBase.wwDBcomboDivisionCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
//  iqctrl.UpdateDBLookupComboDisplay(TwwDBLookupCombo(Sender),
//    LookupTable, FillTable, Modified, 'DIVISION_ID', 'ID', 'Division_Name',
//    'NAME');
end;

procedure TFrmPoBase.wwDBcomboDivisionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_DELETE, VK_BACK] then
  begin
    DM.TblPoDetail.Edit;
    DM.TblPoDetailDIVISION_ID.Clear;
    Key:= 0;
  end;
end;

procedure TFrmPoBase.wwDBComboDlgBuyerCustomDlg(Sender: TObject);
begin
  with DM.PkBuyer do
    if Execute then
    begin
       DM.QryPO.Edit;
       DM.QryPOBUYERID.asString:= GetValue('USER_NAME');
    end;
end;


procedure TFrmPoBase.sbtApproveClick(Sender: TObject);
var
  P: TPoint;
  AWF_Header_ID: Real;
  S: string;
begin
//  if PO_Share.IsPOWorkflowTemplateBased then
//  begin
//    if (TFrmPOWorkflowMain.GetExistingWorkflowOf( DM.QryPOID.asFloat ) = 0) and
//      StrInList( Trim(DM.QryPOAPPROVED_BY.asString), [po_const.c_po_not_approved, '']) then
//    begin
//      if not DM.ApprovedByCanChange( S ) then
//         DM.CheckExistsResetPOWorkflow( DM.QryPOID.asFloat )
//      else if not IsRequisitionClass then
//         begin
//           DM.AssignApprovedBy( DM.QryPOID.asFloat );
//           DM.CheckExistsDeletePOWorkflow( DM.QryPOID.asFloat );
//           EXIT;
//         end;
//    end;
//
//    if not IsRequisitionClass then
//      // po_rscstr.cTXT0000111 = 'No PO Workflow exists for PO # %s.';
//       IQAssert( TFrmPOWorkflowMain.GetExistingWorkflowOf( DM.QryPOID.asFloat ) > 0,
//         Format(po_rscstr.cTXT0000111, [DM.QryPOPONO.asString]))
//    else
//      // po_rscstr.cTXT0000112 = 'No PO Workflow exists for %s.';
//       IQAssert( TFrmPOWorkflowMain.GetExistingWorkflowOf( DM.QryPOID.asFloat ) > 0,
//         Format(po_rscstr.cTXT0000112,
//         [po_share.get_po_requisition_title(DM.QryPOID.asFloat)]));
//
//    AWF_Header_ID:= TFrmPOWorkflowMain.EnsurePOWorkflowExists( self, DM.QryPOID.asFloat );    {po_wf_main.pas}
//    TFrmPOWorkflowMain.DoShow( self, AWF_Header_ID); {po_wf_main.pas}
//    EXIT;
//  end;

  P.x:= sbtApprove.Left;
  P.y:= sbtApprove.Top + sbtApprove.Height - 1;
  P:= ScrollBox1.ClientToScreen( P );
  popmChangeStatus.Popup( P.x, P.Y );
end;

procedure TFrmPoBase.popmChangeStatusPopup(Sender: TObject);
begin
//  ApprovePO1.Enabled:=
//    StrInList( DM.QryPOAPPROVED_BY.asString,
//    ['', po_const.c_po_not_approved, po_const.c_po_denied]) and
//    SR.Enabled['ApprovePO1'];
//
//  DenyPO1.Enabled :=
//    not PO_Share.POStatusDenied(DM.QryPOAPPROVED_BY.asString) and
//    SR.Enabled['DenyPO1'];
//
//  RevertToNotApproved1.Enabled:=
//    not PO_Share.POStatusNotApproved(DM.QryPOAPPROVED_BY.asString) and
//    SR.Enabled['RevertToNotApproved1'];
end;


procedure TFrmPoBase.ApprovePO(Sender: TObject);
begin
 //Update_Approved(po_const.c_po_approved);
end;

procedure TFrmPoBase.DenyPO1Click(Sender: TObject);
begin
  //Update_Approved(po_const.c_po_denied);
end;

procedure TFrmPoBase.RevertToNotApproved1Click(Sender: TObject);
begin
  //Update_Approved(po_const.c_po_not_approved);
end;

function TFrmPoBase.Update_Approved( AValue: string ): Boolean;
var
  S: string;
begin
  DM.QryPO.CheckBrowseMode;
  Result:= DM.IsCurrentlyApproved or DM.ApprovedByCanChange( S );
  if Result then
  begin
//    if CompareText(AValue, po_const.c_po_approved) = 0 then
//       begin
//         ExecuteCommandFmt(
//           'update po set approved_by = ''%s'', signoff_userid = ' +
//           'misc.getusername, signoff_email_sent = NULL, signoff_date = ' +
//           'sysdate, signoff_text = NULL, signoff_userid_agree = ''%s'' ' +
//           'where id = %f', [ S, S, DM.QryPOID.asFloat ]);
//         //po_share.CheckExecuteAutoEFormPO( DM.QryPOID.asFloat );
//       end
//    else if (CompareText(AValue, po_const.c_po_not_approved) = 0) or
//      (CompareText(AValue, po_const.c_po_denied) = 0) then
//       ExecuteCommandFmt( 'update po set approved_by = ''%s'', ' +
//       'signoff_userid = NULL, signoff_email_sent = NULL, signoff_date = ' +
//       'NULL, signoff_text = NULL, signoff_userid_agree = NULL where id = %f',
//       [AValue, DM.QryPOID.asFloat])
//    else
//       // po_rscstr.cTXT0000113 = 'Unknown PO Status: %s';
//       raise Exception.CreateFmt(po_rscstr.cTXT0000113, [ AValue ]);

    DM.QryPO.Refresh;

    EXIT;
  end;
  //po_rscstr.cTXT0000027 =
  // 'Failed to change the status to %s.'#13#13'%s'
  //IQWarning( Format(po_rscstr.cTXT0000027, [ AValue, Get_PO_Limit_Text ]));
end;


procedure TFrmPoBase.EditVendor1Click(Sender: TObject);
var
  nId :Real;
begin
//  try
//    nId := DoGetVendor(DM.QryPOVENDOR_ID.asFloat);
//    if nId = 0 then
//      EXIT;
//    RefreshDataSetByID(DM.QryPO);
//    if nId <> DM.QryPOVENDOR_ID.asFloat then
//      begin
//        if not (DM.QryPO.State in [dsEdit, dsInsert]) then
//          DM.QryPO.Edit;
//        DM.QryPOVENDOR_ID.asFloat := nId;
//        AssignRemitTo(DM.QryPOVENDOR_ID.asFloat);
//      end;
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TFrmPoBase.EditMiscellaneousItem1Click(Sender: TObject);
//var
//  AItem: TFrmFreeFormItem;
begin
  // 05/22/2014
  // EIQ-3177 SER# 05529 - Add back a quick means to update a Misc item on a purchase order line
//  if (DM.TblPoDetail.State in [dsEdit,dsInsert]) then
//    DM.TblPoDetail.Post;
//  AItem.Source := fscPO;
//  AItem.ID := DM.TblPoDetailID.AsInteger;
//  AItem.Itemno := DM.TblPoDetailItemNumber.AsString;
//  AItem.Descrip := DM.TblPoDetailDisp_Descript.AsString;
//  AItem.Quantity := DM.TblPoDetailTOTAL_QTY_ORD.AsFloat;
//  AItem.Price := DM.TblPoDetailUNIT_PRICE.AsFloat;
//  AItem.UOM := DM.TblPoDetailUNIT.AsString;
//  AItem.GLAccountID := SelectValueFmtAsFloat(
//    'SELECT glacct_id_inv FROM po_detail WHERE id = %d',
//    [DM.TblPoDetailID.AsInteger]);
//  AItem.Note := DM.TblPoDetailMISC_NOTE.AsString;
//  AItem.c_po_misc_id := DM.TblPoDetailC_PO_MISC_ID.AsInteger;
//
//  if FreeForm.EditMiscItemData(Self, fscPO, AItem) then
//    begin
//      if not (DM.TblPoDetail.State in [dsEdit,dsInsert]) then
//        DM.TblPoDetail.Edit;
//      DM.TblPoDetailMISC_ITEMNO.AsString := AItem.Itemno;
//      DM.TblPoDetailMISC_ITEM.AsString := AItem.Descrip;
//      DM.TblPoDetailTOTAL_QTY_ORD.AsFloat := AItem.Quantity;
//      DM.TblPoDetailUNIT_PRICE.AsFloat := AItem.Price;
//      DM.TblPoDetailUNIT.AsString := AItem.UOM;
//      if Trunc(AItem.GLAccountID) <> 0 then
//        DM.TblPoDetailGLACCT_ID_INV.AsInteger := Trunc(AItem.GLAccountID);
//      DM.TblPoDetailMISC_NOTE.AsString := AItem.Note;
//      DM.TblPoDetail.Post;
//    end;
end;

procedure TFrmPoBase.EditRemitTo1Click(Sender: TObject);
var
  nId:Real;
begin
  try
    //nId := DoRemitTo(DM.QryPOVENDOR_ID.asFloat,
    //DM.QryPOREMIT_TO_ID.asFloat);
    if nID = 0 then
      EXIT;
    ReOpen( DM.wwQryRemit );
    RefreshDataSetByID(DM.QryPO);
    if nId <> DM.QryPOREMIT_TO_ID.asFloat then
      begin
        if not (DM.QryPO.State in [dsEdit, dsInsert]) then
          DM.QryPO.Edit;
        DM.QryPOREMIT_TO_ID.asFloat := nId;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPoBase.EditShipTo1Click(Sender: TObject);
var
  nId:Real;
  nTaxCodeId:Real;
begin
  try
      //nId := DoEditCompany(DM.QryPOSHIP_TO_ID.asFloat, self);   {in Sys_Comp.pas}
      if nId = 0 then
        Exit;
      ReOpen( DM.wwQryShip );
      RefreshDataSetByID(DM.QryPO);
      if nId <> DM.QryPOCOMPANY_ID.asFloat then
      begin
        if not (DM.QryPO.State in [dsEdit, dsInsert]) then
          DM.QryPO.Edit;
        DM.QryPOCOMPANY_ID.asFloat := nId;
        DM.QryPOSHIP_TO_ID.asFloat := nId;
        DM.wwQryShip.Locate('ID', nId, []);
     //   wwComboShip.Text := DM.wwQryShipCOMPANY.asString;
        if SelectValueFmtAsString(
          'select NVL(taxable, ''N'') from vendor where id = %f',
          [DM.QryPOVENDOR_ID.asFloat]) = 'Y' then
        begin
          nTaxCodeId := SelectValueFmtAsFloat(
            'select tax_code_id from company where id = %f',
            [DM.QryPOCOMPANY_ID.asFloat]);
          if (nTaxCodeId <> 0) and (DM.QryPOTAX_CODE_ID.asFloat = 0) then
            DM.QryPOTAX_CODE_ID.asFloat := nTaxCodeId;
       end;
        DM.QryPO.Post;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPoBase.PnlHeaderLeft01Resize(Sender: TObject);
begin
     PnlNoteLabel.Width := PnlHeaderLeft01.Width;
end;

procedure TFrmPoBase.POMiscellaneousItemsMaintenance1Click(Sender: TObject);
begin
//  DoFreeFormItems(self, fscPO); {FreeForm.pas}
end;

procedure TFrmPoBase.sbHideClick(Sender: TObject);
const
  cFILTER_STR = 'and exists '+
                { left to receive }
                '( select 1 from  c_po_releases x            '+
                '   where x.id = po_releases.id              '+
                '     and greatest(0, x.quan - nvl(recv_quan,0)) > 0 )';

begin
//  if sbHide.Down then
//    begin
//      // 'Releases received in full are hidden.' + #13 + 'Click to show.';
//      sbHide.Hint := po_rscstr.cTXT0000028;
//      with DM.QryPOReleases do
//      begin
//        Close;
//        Sql.Text := StrTran(Sql.Text, ' -- do not remove this line', ' ' + cFILTER_STR + ' -- do not remove this line');
//        Open;
//      end;
//      IQRegIntegerScalarWrite( self, 'PO_HIDE_RELEASES', 1);
//    end
//  else
//    begin
//      sbHide.Hint := po_rscstr.cTXT0000029; // 'Hide releases received in full.';
//      with DM.QryPOReleases do
//      begin
//        Close;
//        Sql.Text := StrTran(Sql.Text, ' ' + cFILTER_STR , '');
//        Open;
//      end;
//      IQRegIntegerScalarWrite( self, 'PO_HIDE_RELEASES', 0);
//    end;
end;


procedure TFrmPoBase.MultiselectDetail1Click(Sender: TObject);
begin
//  Application.ProcessMessages;
//  MultiselectDetail1.Checked:= not MultiselectDetail1.Checked;
//  EnableMultiSelect( MultiselectDetail1.Checked );
end;

procedure TFrmPoBase.EnableMultiSelect(AEnabled: Boolean);
var
  I: Integer;
begin
  with GridDetail do
     if not AEnabled then
        begin
         // Options:= Options - [ dgMultiSelect ];
         // UnselectAll;
        end
     else
       // Options:= Options + [ dgMultiSelect ];
end;

{procedure TFrmPoBase.DoAssignCostSource(
  const ACostSourceMenuType: TCostSourceMenuType; var AHandled: Boolean);
begin
  AHandled := True;
  ProcessCostSource(ACostSourceMenuType);
end;}

procedure TFrmPoBase.DoUnAssignCostSource(var AHandled: Boolean);
begin
  AHandled := True;
 // ProcessCostSource(TCostSourceMenuType.UnassignCostSource);
end;

{procedure TFrmPoBase.ProcessCostSource(
  const ACostSourceMenuType: TCostSourceMenuType);
begin
  FAssigningCostSource := True;
  try
    // If there are multiple items selected, prompt user to determine if he wants to
    // update the selected rows with the same cost source information.
    if GridDetail.SelectedList.Count > 1 then
       begin
         // 'Multiple rows are selected.  Do you wish to reassign the cost source of the selected records?'
//         if IQConfirmYN( po_rscstr.cTXT0000030 ) then // IQMesg
//           DoMultipleCostSource(ACostSourceMenuType);
       end
    else
      // User just wants to work with the currently selected item
      TCostSourceManager.EditCostSource(
        ACostSourceMenuType,
        TCostSourceOwnerType.PurchaseOrders,
        GridDetail.DataSource,
        False);
    //
    CheckClearCostSourceGLAcctInv(ACostSourceMenuType);
  finally
    FAssigningCostSource := false;
  end;
end; }

{procedure TFrmPoBase.CheckClearCostSourceGLAcctInv(
  AType: IQMS.CostSource.Types.TCostSourceMenuType);
begin
  if (AType in [TCostSourceMenuType.MRO, TCostSourceMenuType.JobShop,
    TCostSourceMenuType.FixedAssets]) then
  begin
    if DM.TblPoDetailGLACCT_ID_INV.AsFloat <> 0 then
      if (SelectValueFmtAsString(
        'select NVL(COST_SOURCE_RQD, ''N'') from glacct where id = %f',
        [DM.TblPoDetailGLACCT_ID_INV.AsFloat]) = 'Y') and
        (DM.TblPoDetailCOST_OBJECT_SOURCE.AsString  = '') then
      begin
        DM.TblPoDetail.Edit;
        DM.TblPoDetailGLACCT_ID_INV.Clear;
        DM.TblPoDetail.Post;
        // po_rscstr.cTXT0000058 =
        // 'GL Account requires entry of a Cost Source.';
        raise Exception.Create(cTXT0000058);
      end;
  end;
end;}

{procedure TFrmPoBase.DoMultipleCostSource(AType: IQMS.CostSource.Types.TCostSourceMenuType);
var
  i : Integer;
  ACostObjectId: Int64;
  ACostObjectSource: string;
  AID: Int64; // original id selected
begin
  ACostObjectId := 0;
  ACostObjectSource := CostSourceString[AType];
//  if (AType <> TCostSourceMenuType.UnassignCostSource) and
//   not TCostSourceDataModule.PromptCostSource(AType, ACostObjectId) then
//    System.SysUtils.Abort;
   AID := DM.TblPoDetailID.AsLargeInt;

     with GridDetail, GridDetail.DataSource.Dataset do
       try
          DisableControls;
          // Cycle selected rows and update the dataset according to the corresponding ID
          for i:= 0 to SelectedList.Count-1 do
              begin
                GotoBookmark( SelectedList.Items[i] );
                Freebookmark( SelectedList.Items[i] );
            if (AType = TCostSourceMenuType.UnassignCostSource) then
              ExecuteCommandFmt(
                'update po_detail set cost_object_source = null, ' +
                'cost_object_id = null ' +
                'where id = %d',
                [DM.TblPoDetailID.AsLargeInt])
            else
              ExecuteCommandFmt(
                'update po_detail set cost_object_source = ''%s'', ' +
                'cost_object_id = decode( %d, 0, null, %d ) ' +
                'where id = %d',
                [ACostObjectSource, ACostObjectID, ACostObjectID,
                DM.TblPoDetailID.AsLargeInt]);
              end;
          SelectedList.Clear;
          DM.TblPoDetail.Refresh;

          // Get the original selected record
          DM.TblPoDetail.Locate( 'ID', AID, [] );
       finally
          EnableControls;
       end;
end;}

procedure TFrmPoBase.cmbVendorContactBeforeDropDown(Sender: TObject);
begin
  Reopen(DM.QryVendorContact);
  DM.QryVendorContact.Filter := IQEPlantFilterExpr(True);
  DM.QryVendorContact.Filtered := True;
end;

procedure TFrmPoBase.cmbVendorContactCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  DM.QryVendorContact.Filtered := False;
  Reopen(DM.QryVendorContact);
end;

procedure TFrmPoBase.cmbVendorContactDropDown(Sender: TObject);
begin
     // Post changes to ensure a vendor_id
    with DM.QryPO do
      if not (State in [dsEdit, dsInsert]) then
         Edit;
     ReOpen(DM.QryVendorContact);
end;

//procedure TFrmPoBase.CheckMultipleOf(AQry: TDataSet; var ARelInputCargo: TRelInputCargo );
//var
//  AmultipleOf:Real;
//  ASuggestedQty:Real;
//  AQty:Real;
//  AMod:Real;
//begin
//  AmultipleOf := SelectValueFmtAsFloat(
//    'SELECT po_multiple FROM arinvt_vendors WHERE arinvt_id = %d AND ' +
//    'vendor_id = %d', [DM.TblPoDetailARINVT_ID.AsLargeInt,
//    DM.QryPOVENDOR_ID.AsLargeInt]);
//
//  if AmultipleOf = 0 then
//    AmultipleOf := SelectValueFmtAsFloat(
//      'select po_multiple from arinvt where id = %f',
//      [DM.TblPoDetailARINVT_ID.asFloat]);
//  if AmultipleOf = 0 then Exit;
//
//  if AQry <> nil then
//     AQty := DM.QryPOReleasesQUAN.asFloat
//  else
//     AQty := ARelInputCargo.Qty_Per;
//
//  AQty:= self.DM.CheckConvertQty( DM.TblPoDetailARINVT_ID.asFloat,
//                                  AQty,
//                                  DM.TblPoDetailUNIT.asString,
//                                  DM.TblPoDetailArinvt_Unit.asString );
//  AMod := Frac(AQty/AmultipleOf);
//
//  if AMod <> 0 then
//  begin
//    ASuggestedQty := (Trunc(AQty / AmultipleOf) + 1 ) * AmultipleOf;
//
//
////  'The release quantity, %f, does not conform to the container (multiples of) release quantity, %d,' +
//// 'for Inventory item, %s.'#13'Would you like to change it to the suggested quantity of, %f?'
//
//    if IQConfirmYN(Format(oe_rscstr.cTXT0000038,
//                          [AQty,
//                           AmultipleOf,
//                           DM.TblPoDetailItemNumber.asString,
//                           ASuggestedQty])) then
//    begin
//      // convert back to PO UOM
//      ASuggestedQty:= self.DM.CheckConvertQty( DM.TblPoDetailARINVT_ID.asFloat,
//                                               ASuggestedQty,
//                                               DM.TblPoDetailArinvt_Unit.asString,
//                                               DM.TblPoDetailUNIT.asString );
//      if AQry <> nil then
//      begin
//        DM.QryPOReleasesORIG_QUAN.asFloat:= DM.QryPOReleasesQUAN.asFloat;
//        DM.QryPOReleasesQUAN.asFloat  := ASuggestedQty;
//      end
//      else
//        ARelInputCargo.Qty_Per := ASuggestedQty;
//    end;
//  end;
//end;


procedure TFrmPoBase.SBTaxBreakdownClick(Sender: TObject);
begin
  //DoPOTaxBreakDown(self, 0, DM.QryPOID.asFloat); {in ArPrepTax.pas}
  ReOpen(DM.ViewPoTotal);
  RefreshDatasetById(DM.TblPoDetail);
end;

procedure TFrmPoBase.ShowReleasesActivity1Click(Sender: TObject);
begin
  if (SelectValueAsFloat(
    'select c.id from tr_col c, tr_tab b ' +
    'where c.col_name = ''ID'' and c.tr_tab_id = b.id ' +
    'and b.table_name = ''PO_RELEASES''') = 0)
    or
    (SelectValueAsFloat(
    'select c.id from tr_col c, tr_tab b ' +
    'where c.col_name = ''PO_DETAIL_ID'' and c.tr_tab_id = b.id ' +
    'and b.table_name = ''PO_RELEASES''') = 0)
    or
    (SelectValueAsFloat(
    'select c.id from tr_col c, tr_tab b ' +
    'where c.col_name = ''PROMISE_DATE'' and c.tr_tab_id = b.id ' +
    'and b.table_name = ''PO_RELEASES''') = 0) then
    raise Exception.Create(
      'Please review the tracing settings for table ''PO_RELEASES'', '+
      'they must include tracing on both ''ID'', ''PO_DETAIL_ID'' and ''PROMISE_DATE'' fields');

  //DoShowPOReleasesActivity( self, DM.TblPoDetailID.asFloat ); {PORelAct.pas}
end;

procedure TFrmPoBase.sbFreightClick(Sender: TObject);
begin
  with DM.PkFreight do
  if Execute then
  begin
    if not (DM.QryPO.State in [dsInsert, dsEdit]) then DM.QryPO.Edit;
    DM.QryPOFREIGHT_ID.asFloat := GetValue('ID');
  end;
end;

procedure TFrmPoBase.SBScanClick(Sender: TObject);
var
  A: Variant;
begin
//  A:= VarArrayOf([ 'PO' ]);
//  if TFrmQCDocMaintSilent.DoScanAppendNew( DM.QryPOID.asInteger, A) then  // qc_docmaint.pas
//  begin
//    IqExtDoc1.ExtNav.BtnClick(nbRefresh);
//  end;
end;

procedure TFrmPoBase.JumptoDropShipSO1Click(Sender: TObject);
begin
  //JumpDirect( iq_JumpToSalesOrderDetail, Trunc( SelectValueFmtAsFloat('select drop_ship_ord_detail_id from po_detail where id = %f', [ DM.TblPODetailID.asFloat ]))); {IQJump.pas}
end;

procedure TFrmPoBase.DropShipReporting1Click(Sender: TObject);
begin
  //if TFrmPODropShipReport.DoShowModal( self, DM.TblPODetailID.asFloat ) then {po_dropship_report.pas}
  //   PostMessage( self.Handle, iq_RefreshDataSets, 0, 0 )
end;

procedure TFrmPoBase.IQUserDefLblPopUpMenuPopup(Sender: TObject);
begin
  // po_rscstr.cTXT0000032 =
  // 'Update %s column title'
  DefineLabelText1.Caption:= Format( cTXT0000032,
    [IQUserDefLabelOnGrid.Caption]);
end;

procedure TFrmPoBase.GridReleasesTitleButtonClick(Sender: TObject;  AFieldName: String);
begin
  if AFieldName = 'USER_DATE' then
  begin
    IQUserDefLabelOnGrid.Execute;
    UpdateUserLabelColumnTitle( 'USER_DATE', IQUserDefLabelOnGrid.Caption );
  end;
  if AFieldName = 'USER_DATE2' then
  begin
    IQUserDefLabelOnGrid2.Execute;
    UpdateUserLabelColumnTitle( 'USER_DATE2', IQUserDefLabelOnGrid2.Caption );
  end;
  if AFieldName = 'USER_DATE3' then
  begin
    IQUserDefLabelOnGrid3.Execute;
    UpdateUserLabelColumnTitle( 'USER_DATE3', IQUserDefLabelOnGrid3.Caption );
  end;
end;

procedure TFrmPoBase.UpdateUserLabelColumnTitle(const AFieldName,
  ATitleText: string; ADataSet: TDataSet = nil; ADBGrid: TIQUniGridControl = nil );
begin
  if ADataSet = nil then
     ADataSet:= DM.QryPOReleases;

  ADataSet.FieldByName(AFieldName).DisplayLabel := ATitleText;
end;


procedure TFrmPoBase.sbtnWorkflowsClick(Sender: TObject);
begin
//  CheckLaunchPendingWorkflowsListViaURL( 'PO' );
end;

procedure TFrmPoBase.ManualReceivedQuantityAdjustment1Click(Sender: TObject);
var
  Aqty_received:Real;
begin
//  if DM.TblPoDetailID.asFloat = 0 then exit;
//  if DoManualReceivedQuantityAdjustment(self, DM.TblPoDetailID.asFloat,
//    DM.TblPoDetailItemNumber.asString) then   {in POManAdj.pas}
//  begin
//    sbtnRecalcClick(nil);
{
    Aqty_received := SelectValueFmtAsFloat(
      'select NVL(sum(NVL(qty_received, 0)), 0) from ' +
      ' po_receipts where po_releases_id = %f ' +
      ' and receiptno = ''CUM RECEIPT ADJUSTMENT'' ' +
      ' and posted = ''Y'' ',
      [DM.QryPOReleasesID.asFloat]);

    ExecuteCommandFmt(
      'update c_po_releases set cum_recv_quan = NVL(cum_recv_quan, 0) + %f, ' +
      ' cum_quan = NVL(cum_quan, 0) + %f, ' +
      ' recv_quan = NVL(recv_quan, 0) + %f ' +
      ' where id = %f',
      [Aqty_received, Aqty_received, Aqty_received,
        DM.QryPOReleasesID.asFloat]);
}
//  end;
end;

procedure TFrmPoBase.ApprovalTemplates1Click(Sender: TObject);
begin
//  TTFrmWFPOTemplate.DoShow; {po_wf_template.pas}
end;

procedure TFrmPoBase.File1Click(Sender: TObject);
begin
  //ApprovalTemplates1.Visible:= SR.Visible['ApprovalTemplates1'] and PO_Share.IsPOWorkflowTemplateBased;
  //ApproversTeam1.Visible:= SR.Visible['ApproversTeam1'] and PO_Share.IsPOWorkflowTemplateBased;
end;

procedure TFrmPoBase.FilterPORequisitionsByUserID1Click(Sender: TObject);
begin
//  if Sender is TMenuItem then
//     TMenuItem(Sender).Checked:= not TMenuItem(Sender).Checked;
//
//  RefreshDataSetByID( DM.QryPO );
end;

procedure TFrmPoBase.ApproversTeam1Click(Sender: TObject);
begin
//  TFrmPOWorkflowTeam.DoShow( self );  // po_wf_team.pas
end;

function TFrmPoBase.IsRequisitionClass: Boolean;
begin
   Result:= CompareText( self.ClassName, 'TFrmPoRequisition' ) = 0;
end;
{
procedure TFrmPoBase.AssignPOTableFilter( Dataset: TDataSet );

  procedure CheckAddToFilter(S : string );
  begin
    if DataSet.Filter > '' then
       DataSet.Filter:= DataSet.Filter + ' AND ';
    DataSet.Filter:= DataSet.Filter + S;
  end;

begin
  IQAssignEPlantFilter( DataSet );

  // if this is requisition - include only not_approved
  if IsRequisitionClass then
     CheckAddToFilter( ' (APPROVED_BY is NULL or APPROVED_BY = ''Not Approved'' or APPROVED_BY = ''Denied'') ');

  if IsFilterByUserID() then
     CheckAddToFilter( Format(' (USERID = ''%s'') ', [ SecurityManager.UserName ]));
end;
}

{procedure TFrmPoBase.AssignPOPickListFilter(Dataset: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('requisition_only').Value := IIf( IsRequisitionClass, 1, 0);
  if TFDQuery(DataSet).Params.FindParam('filter_by_user') <> nil then
     TFDQuery(DataSet).ParamByName('filter_by_user').Value := fIIf( IsFilterByUserID, 1, 0 );
  if TFDQuery(DataSet).Params.FindParam('userid') <> nil then
     TFDQuery(DataSet).ParamByName('userid').asString:= SecurityManager.UserName;
end;}

procedure TFrmPoBase.ShowAsRequisition;
begin
  DM.PkRequisition.FieldByName('PONO').Visible := false;
  DM.PkRequisition.FieldByName('ID').Visible := true;

//  if SR.ReadWrite['DBPoNo'] then
//    dbPoNo.ReadOnly := true;
  dbPoNo.Color    := clBtnFace;
  dbPoNo.ShowHint := False;
  dbPoNo.DataField := 'ID';
  DM.QryPOPONO.Visible := false;
  DM.QryPOID.Visible := true;
  DM.QryPOID.readonly := true;

  // po_rscstr.cTXT0000114 = 'Requisition #';
  Label1.Caption  := cTXT0000114;
end;

procedure TFrmPoBase.ShowAsPurchaseOrder;
begin
  DM.PkRequisition.FieldByName('PONO').Visible := true;
  DM.PkRequisition.FieldByName('ID').Visible := false;

//  if SR.ReadWrite['DBPoNo'] then
//    dbPoNo.ReadOnly := false;
  dbPoNo.Color    := clWindow;
  dbPoNo.ShowHint := True;
  dbPoNo.DataField := 'PONO';
  DM.QryPOPONO.Visible := true;
  DM.QryPOID.Visible := false;
  DM.QryPOID.readonly := false;
  // po_rscstr.cTXT0000115 = 'PO #';
  Label1.Caption  := cTXT0000115;
end;


procedure TFrmPoBase.JumptoVendor1Click(Sender: TObject);
begin
  //DoJumpToVendor(self, DM.QryPOVENDOR_ID.asFloat);
end;

procedure TFrmPoBase.POTypesMaintenance1Click(Sender: TObject);
begin
//  TFrmPO_Type.DoShow( self );  // po_type.pas
end;


procedure TFrmPoBase.Panel21Resize(Sender: TObject);
begin
  //RefreshComponents([wwComboVendor, cmbVendorContact, wwComboRemit, wwComboShip, wwArcusto], 0, SR);
end;

procedure TFrmPoBase.PnlHeader04Resize(Sender: TObject);
begin
  //RefreshComponents([wwDBComboPOType, wwDBComboDlgBuyer, wwdblookPR_Emp], 0, SR);
end;

procedure TFrmPoBase.pgctrlPOChange(Sender: TObject);
begin
//  if pgctrlPO.ActivePage = TabPONotes then
//  begin
//    if not IqDocs1.Active then
//       IQDocs1.Active := True;
//  end
//  else if pgctrlPO.ActivePage = TabEserver then
//  begin
//    if not QryEserverAct.active then QryEserverAct.Open;
//    if not QryEserverPO.active then QryEserverPO.Open;
//  end;
end;

procedure TFrmPoBase.ClonePO1Click(Sender: TObject);
var
  ANewPoNo: string;
  ANewPo_ID: Real;
  ACount:Real;
  APO_BUYER_VALIDATION:String;
  Apo_buyer:String;
  ABuyerID:String;

//  procedure _CheckPopupPOInfo;
//  begin
//    po_share.PopupPOInfo( DM.QryPOVENDOR_ID.asFloat );
//
//    with DM.TblPODetail do
//    begin
//      Reopen(DM.TblPODetail);
//      while not Eof do
//      begin
//        po_share.PopupItemInfo( DM.TblPoDetailARINVT_ID.asFloat, DM.QryPOVENDOR_ID.asFloat, DM.TblPoDetailARINVT_VENDORS_ID.asFloat );
//        Next;
//      end;
//      First;
//    end;
//  end;


begin
//  DM.QryPO.CheckBrowseMode;
//  if DM.QryPOID.asFloat = 0 then
//     EXIT;
//
//  CheckVendStatusFor( DM.QryPOVENDOR_ID.asFloat, ['Not Approved', 'Not Active'] );  {in VStatChk.pas}
//
//  APO_BUYER_VALIDATION := SelectValueAsString(
//    'select NVL(PO_BUYER_VALIDATION, ''N'') from iqsys2 where rownum < 2');
//
//  Apo_buyer  := SelectValueAsString(
//    'select NVL(po_buyer, ''N'') from s_user_general where user_name = misc.getusername');
//
//  if (APO_BUYER_VALIDATION = 'Y') and (Apo_buyer = 'N') then
//  begin
//    with DM.PkBuyer do
//      if Execute then
//        ABuyerID:= GetValue('USER_NAME')
//      else
//        Exit;
//  end;
//
//
//  ANewPo_ID:= GetNextID('po');
//  ANewPoNo := GetEPlantNextSequenceNumberB( SecurityManager.EPlant_ID, 'PO', 'S_PONO' );  // IQSeq.pas
//  if not TFrmPO_Clone.DoShowModal( self, ANewPoNo ) then      // po_clone.pas
//  begin
//    Record_Skipped_Seq('PO', 'PO', 'PONO', ANewPoNo, '', SKIP_SEQ_CANCEL);
//    Exit;
//  end;
//
//  ACount := SelectValueFmtAsFloat(
//    'select count(p.id)         ' +
//    '  from po_detail p,        ' +
//    '       glacct a            ' +
//    ' where p.GLACCT_ID_INV = a.id     ' +
//    '   and (NVL(a.PK_HIDE, ''N'') = ''Y'' or NVL(a.AP_HIDE, ''N'') = ''Y'')  ' +
//    '   and p.po_id = %.0f',
//    [DM.QryPOID.asFloat]);
//
//
//  if ACount <> 0 then
//  begin
//    IQInformation('GL Account is not valid.  Please choose a valid GL Account');
//    ExecuteCommandFmt('begin po_misc.clone_po( %f, %f, ''%s'', ''Y''); end;', [ DM.QryPOID.asFloat, ANewPo_ID, ANewPoNo ]);
//  end
//  else
//  begin
//    ExecuteCommandFmt(
//      'begin po_misc.clone_po( %f, %f, ''%s'', ''N''); end;',
//      [DM.QryPOID.asFloat, ANewPo_ID, ANewPoNo]);
//  end;
//
//  if (APO_BUYER_VALIDATION = 'Y') and (Apo_buyer = 'N') then
//  begin
//    ExecuteCommandFmt(
//      'update po set buyerid = ''%s'' where id = %.0f',
//      [ABuyerID, ANewPo_ID]);
//  end;
//
//  if ((APO_BUYER_VALIDATION = 'N') and (Apo_buyer = 'N')) or (Apo_buyer = 'Y')  then
//  begin
//    ExecuteCommandFmt(
//      'update po set buyerid = misc.getusername where id = %.0f',
//      [ANewPo_ID]);
//  end;
//
//  Reopen( DM.QryPO );
//  if LocatePO(ANewPo_ID) then
//    begin
//      DM.TblPoDetail.Refresh;
//      Reopen(DM.QryPOReleases);
//     _CheckPopupPOInfo;
//    end;
end;

procedure TFrmPoBase.wwDBComboDlgPODetailCommentCustomDlg(Sender: TObject);
var
  S: string;
begin
  S:= DM.TblPoDetailCMTLINE.asString;
//  if DoEditMemoStr( self, S, 2000, DM.TblPoDetailCMTLINE.DisplayLabel ) then    {EditMemoStr.pas}
//  begin
//    DM.TblPoDetail.Edit;
//    DM.TblPoDetailCMTLINE.asString:= S;
//  end;
end;

procedure TFrmPoBase.GridDetailTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  if AFieldName = 'CUSER1' then
  begin
//    IQUserDefLabelPoDetailCUser1.Execute;
//    UpdateUserLabelColumnTitle( 'CUSER1', IQUserDefLabelPoDetailCUser1.Caption, DM.TblPodetail, GridDetail );
  end
  else if AFieldName = 'CUSER2' then
  begin
//    IQUserDefLabelPoDetailCUser2.Execute;
//    UpdateUserLabelColumnTitle( 'CUSER2', IQUserDefLabelPoDetailCUser2.Caption, DM.TblPodetail, GridDetail );
  end
  else if AFieldName = 'CUSER3' then
  begin
//    IQUserDefLabelPoDetailCUser3.Execute;
//    UpdateUserLabelColumnTitle( 'CUSER3', IQUserDefLabelPoDetailCUser3.Caption, DM.TblPodetail, GridDetail );
  end;
end;

procedure TFrmPoBase.IQUserDefLabelPoDetailCUser1GetOwnerName(
  Sender: TObject; var AOwnerName: String);
begin
  AOwnerName:= 'FrmPoBase';
end;

procedure TFrmPoBase.ClosePO1Click(Sender: TObject);
begin
//  if DM.QryPOID.asFloat = 0 then
//     ABORT;
//
//  if TFrmSecuredConfirmClosePO.DoShowModal() <> mrYes then  // secure_confirm_close_po.pas
//     ABORT;
//
//  ExecuteCommandFmt(
//    'update po_detail set closed = ''Y'' where po_id = %.0f',
//    [DM.QryPOID.asFloat]);
//  PostMessage( self.Handle, iq_RefreshDataSets, 0, 0 )
end;

procedure TFrmPoBase.MenuItem1Click(Sender: TObject);
begin
 // (PopupUserDefLabel.PopupComponent as TIQUserDefLabel).Execute;
end;

procedure TFrmPoBase.sbtnCheckAddressClick(Sender: TObject);
begin
//  if (DM.QryPO.State in [dsEdit, dsInsert]) then
//    DM.QryPO.Post;
//
//  if CheckPackingSlipAddress(Self, DM.QryPOSHIP_TO_ID.AsFloat, 'COMPANY', rfNone, true, false) then
//    iqmesg.IQConfirm('Ship To Address Validated.');
//
//  if CheckPackingSlipAddress(Self, DM.QryPOREMIT_TO_ID.AsFloat, 'REMIT_TO', rfNone, true, false) then // shipman_address_edit
//    iqmesg.IQConfirm('Remit To Address Validated.');
//
//  RefreshDatasetByID(DM.wwQryShip);
//  RefreshDatasetByID(DM.wwQryRemit);
end;

procedure TFrmPoBase.sbtnContact1Click(Sender: TObject);
begin
  with DM do
    IQPickAndReplace( QryPOVENDOR_CONTACT_ID, PkContact, 'ID' );
end;

procedure TFrmPoBase.sbtnMultiSelectAddInventoryClick(Sender: TObject);
begin
  // EIQ-8991
//  if sbMisc.Down then
//    // po_rscstr.cTXT0000128 =
//    // 'Multiselect is unavailable for miscellaneous items.  ' +
//    // 'Please use the "insert" button.';
//    raise Exception.Create(po_rscstr.cTXT0000128);
//
//  if sbAka.Down then
//    // 11/19/2015 (Byron, EIQ-8991)
//    AppendMultiFromAka
//  else
//    // 10/16/2015 (Byron, EIQ-8991)
//    AppendMultiFromArinvt;
end;

procedure TFrmPoBase.MarkAllReleasesAcknowledged1Click(Sender: TObject);
begin
//  ExecuteCommandFmt(
//    'update po_releases set ack = ''Y'' where po_detail_id in ' +
//    '(select id from po_detail where po_id = %.0f)',
//    [DM.QryPOID.asFloat]);
//  ExecuteCommandFmt('begin po_misc.mark_all_releases_acknowledged( %d ); end;', [ DM.QryPOID.asInteger ]);
//  DM.QryPOReleases.Close;
//  DM.QryPOReleases.Open;
end;

procedure TFrmPoBase.UpdateGLAccount1Click(Sender: TObject);
var
  AId, AId2:Real;
  i:Integer;
begin
  if DM.PkAcct.Execute then
  begin
    AId := DM.PkAcct.GetValue('ID');
     with GridDetail, GridDetail.DataSource.Dataset do
     try
        AId2 := DM.TblPoDetailID.asFloat;
        DisableControls;
        // Cycle selected rows and update the dataset according to the corresponding ID
       { for i:= 0 to SelectedList.Count-1 do
        begin
           GotoBookmark( SelectedList.Items[i] );
           Freebookmark( SelectedList.Items[i] );
           ExecuteCommandFmt(
             'update po_detail set glacct_id_inv = %f where id = %f',
             [AId, DM.TblPoDetailID.AsFloat]);
        end;
        SelectedList.Clear;
        }
        DM.TblPoDetail.Refresh;
        // Get the original selected record
        DM.TblPoDetail.Locate( 'ID', AID2, [] );
     finally
        EnableControls;
     end;
  end;
end;

procedure TFrmPoBase.UpdateUnitPrice1Click(Sender: TObject);
//var
  //AParam: TPOPriceUpdateParam;
begin
  if (DM.TblPoDetailTOTAL_QTY_ORD.asFloat = 0) or (DM.TblPoDetailARINVT_ID.asFloat = 0) then
     EXIT;

//  AParam.Arinvt_ID:= DM.TblPoDetailARINVT_ID.asFloat;
//
//  if not TFrmPOSelectPriceUpdate.DoShowModal( self, AParam ) then
//     EXIT;

  // TPOPriceUpdateMode = (POpumNone, POpumThisItem, POpumThisOrder,
  // POpumThisItemAllOrders, POpumAllItemsAllOrders );
//  case AParam.UpdateMode of
//    POpumThisItem         : UpdatePriceThisItem();
//    POpumThisPO        : UpdatePriceThisPO();
    //  po_rscstr.cTXT0000116 =
    // 'This option will update the unit price for the selected ' +
    // 'item on all purchase orders.'#13#13'Do you wish to continue?';
//    POpumThisItemAllPOs: if IQConfirmYN(po_rscstr.cTXT0000116) then
//                             UpdateSalesPriceThisItemAllPOs( AParam );
    //  po_rscstr.cTXT0000117 =
    // 'This option will update the unit price for all items on ' +
    // 'all purchase orders.'#13#13'Do you wish to continue?';
//    POpumAllItemsAllPOs: if IQConfirmYN(po_rscstr.cTXT0000117) then
//                             UpdateSalesPriceAllItemsAllPOs( AParam );
  //end;
end;

procedure TFrmPoBase.UpdatePriceThisItem( AQty: Real = 0 );
var
  AThisQty: Real;
begin
  AThisQty:= {fIIf( AQty = 0, DM.TblPoDetailTotal_Qty_Ord.asFloat,} AQty {)};
  DM.TblPoDetail.Edit;
  FUpdateUnitPrice := true;
  AssignUnitPrice( AThisQty );
  FUpdateUnitPrice := false;
  DM.TblPoDetailUNIT_PRICE.OnChange := TblPoDetailUNIT_PRICEChange;
  DM.TblPoDetail.Post;
end;


procedure TFrmPoBase.UpdatePriceThisPO;
begin
  with DM, TblPoDetail do
  begin
    First;
    while not Eof do
    begin
      if (DM.TblPoDetailTotal_Qty_Ord.asFloat > 0) and (DM.TblPoDetailARINVT_ID.asFloat > 0) then
      begin
        Edit;
        FUpdateUnitPrice := true;
        AssignUnitPrice( DM.TblPoDetailTotal_Qty_Ord.asFloat );
        FUpdateUnitPrice := false;
        DM.TblPoDetailUNIT_PRICE.OnChange := TblPoDetailUNIT_PRICEChange;
        Post;
      end;

      Next;
    end;
  end;
end;

//procedure TFrmPoBase.UpdateSalesPriceThisItemAllPOs( AParam: TPOPriceUpdateParam );
//var
//  APoId, APoDetailId:Real;
//  hMsg: TPanelMesg;
//  ASkip:Boolean;
//begin
//  APoId := DM.QryPOID.asFloat;
//  APoDetailId:= DM.TblPoDetailId.asFloat;
//  hMsg:= hPleaseWait('');
//  try
//    ASkip := DM.SkipCheckMinMax;
//    DM.SkipCheckMinMax:= true;
//    DM.FDoNotCheckVendorStatus := true;
//
//    DM.QryPOReleases.Datasource := nil;
//    DM.QryPO.BeforeScroll := nil;
//    DM.QryPO.First;
////    DM.QryPO.DisableControls;
//    DM.TblPODetail.DisableControls;
//    while not DM.QryPO.Eof do
//    begin
//      DM.TblPoDetail.First;
//      while not DM.TblPoDetail.eof do
//      begin
//        if ((AParam.Arinvt_ID <> 0) and (DM.TblPoDetailARinvt_ID.asFloat = AParam.Arinvt_ID) and (DM.TblPoDetailTotal_Qty_Ord.asFloat > 0)) or
//           ((AParam.Arinvt_ID = 0) and (DM.TblPoDetailARinvt_ID.asFloat <> 0) and (DM.TblPoDetailTotal_Qty_Ord.asFloat > 0)) then
//        begin
//          DM.TblPoDetail.Edit;
//          FUpdateUnitPrice := true;
//          AssignUnitPrice( DM.TblPoDetailTotal_Qty_Ord.asFloat );
//          FUpdateUnitPrice := false;
//          DM.TblPoDetail.Post;
//        end;
//        DM.TblPoDetail.Next;
//      end;
//      DM.QryPO.Next;
//    end;
//  finally
//    DM.TblPoDetailUNIT_PRICE.OnChange := TblPoDetailUNIT_PRICEChange;
//    DM.QryPOReleases.Datasource := DM.SrcPoDetail;
//    DM.QryPO.BeforeScroll := DM.QryPOBeforeScroll;
//    hMsg.Free;
////    DM.QryPO.EnableControls;
//    DM.TblPODetail.EnableControls;
//    DM.SkipCheckMinMax:= ASkip;
//    DM.FDoNotCheckVendorStatus := false;
//  end;
//  if LocatePO(APoId) then
//    DM.TblPODetail.Locate('ID', APoDetailId, []);
//end;

//procedure TFrmPoBase.UpdateSalesPriceAllItemsAllPOs( AParam: TPOPriceUpdateParam );
//begin
//  AParam.Arinvt_ID:= 0;
//  UpdateSalesPriceThisItemAllPOs( AParam );
//end;

procedure TFrmPoBase.wwComboFreightBeforeDropDown(Sender: TObject);
begin
  // 08/03/2011 Filter PK_HIDE field
  FilterInactive(DM.QryFreight, True);
end;

procedure TFrmPoBase.wwComboFreightCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  // 08/03/2011 Remove PK_HIDE filter
  FilterInactive(DM.QryFreight, False);
end;

function TFrmPoBase.IsFilterByUserID: Boolean;
begin
  Result := False;
  if Showing then
    Result:= FilterPORequisitionsByUserID1.Checked;
end;

procedure TFrmPoBase.TblPoDetailFilterRecord(DataSet: TDataSet;  var Accept: Boolean);
begin
  Accept := true;
  if Assigned(sbHideDetails) and (sbHideDetails <> nil) then
    if sbHideDetails.Down and (DM.TblPoDetailCLOSED.asString = 'Y') then
      Accept := false;
end;

procedure TFrmPoBase.sbHideDetailsClick(Sender: TObject);
begin
//  if sbHideDetails.Down then
//  begin
//    sbHideDetails.Hint := po_rscstr.cTXT0000066;
//    IQRegIntegerScalarWrite( self, 'PO_HIDE_CLOSED_DETAILS', 1)
//  end
//  else
//  begin
//    IQRegIntegerScalarWrite( self, 'PO_HIDE_CLOSED_DETAILS', 0);
//    sbHideDetails.Hint := po_rscstr.cTXT0000067;
//  end;
//
//  // 05/05/2016 (Byron, EIQ-11895) Only refresh if this form is
//  // already showing to the user because it can cause a significant
//  // speed issue -- as much as 4 or 5 seconds.  If this is called at
//  // startup, no worries; the detail dataset will be opened.
//  if Showing and DM.TblPoDetail.Active then
//  begin
//    DM.TblPoDetail.Close;
//    DM.TblPoDetail.Open;
//  end;
end;

procedure TFrmPoBase.SBBudgetComp1Click(Sender: TObject);
begin
  ExecuteCommandFmt(
    'begin po_budget_comp.Calculate_Budget_Comp(%f); end;',
    [DM.TblPoDetailID.asFloat]);
  DM.QryPOReleases.Close;
  DM.QryPOReleases.Open;
  DM.TblPoDetail.Refresh;
end;

procedure TFrmPoBase.SBSearchCustomerClick(Sender: TObject);
begin
  if DM.PkArcusto.Execute then
    begin
       if DM.PkArcusto.GetValue('ID') <> DM.QryPOARCUSTO_ID.asFloat then
       begin
         if not (DM.QryPO.State in [dsEdit, dsInsert]) then
           DM.QryPO.Edit;
         DM.QryPOARCUSTO_ID.asFloat := System.Variants.VarAsType(DM.PkArcusto.GetValue('ID'), varInt64);
         DM.QryPOARCUSTO_CUSTNO.AsString := System.Variants.VarToStr(DM.PkArcusto.GetValue('CUSTNO'));
       end;
    end
    else Abort;
end;

procedure TFrmPoBase.AssignAcctviapicklist1Click(Sender: TObject);
begin
  if PKGlAcct.Execute then
  begin
    if not (DM.TblPoDetail.State in [dsEdit, dsInsert]) then DM.TblPoDetail.Edit;
    DM.TblPoDetailGLACCT_ID_INV.asFloat :=  PKGlAcct.GetValue('ID');
  end;
end;

procedure TFrmPoBase.PkMiscIQModify(Sender: TObject; var Action: TModalResult;
  var ResultValue: Variant);
begin
//  if not SR.HasInsertRights(NavDetail) then
//    Exit;
  //Action := FreeForm.SelectNewFreeFormItem(Self, fscPO, ResultValue);
end;

procedure TFrmPoBase.ResetTaxCode(AVendor_ID, aPOId: Real; ATaxCodeField:TField);
var
  ATax_code_id_new:Real;
  ATax_code_id_old:Real;
  ACount:Real;
begin
  ATax_code_id_old := SelectValueFmtAsFloat(
    'select tax_code_id from po where id = %f', [aPOId]);
  ATax_code_id_new := 0;
  if SelectValueByID('taxable', 'vendor',  AVendor_ID) = 'Y' then
     ATax_code_id_new := SelectValueFmtAsFloat(
     'select tax_code_id from vendor where id = %f', [AVendor_ID]);
  FRefreshPODerails := false;

//  if ATax_code_id_old = ATax_code_id_new then exit;

  ExecuteCommandFmt(
    'update po_detail set closed = ''N'' where po_id = %f', [aPOId]);
  if ATax_code_id_new = 0 then
  begin
    ATaxCodeField.Clear;
    ExecuteCommandFmt(
      'update po_detail set taxable = ''N'' where po_id = %f', [aPOId]);
  end
  else
  begin
    ATaxCodeField.asFloat := ATax_code_id_new;
    ExecuteCommandFmt(
      'update po_detail set taxable = ''Y'' where po_id = %f', [aPOId]);
  end;
  ACount := SelectValueFmtAsFloat(
    'select count(id) from po_detail where po_id = %f', [aPOId]);
  if ACount = 0 then exit;
  FRefreshPODerails := true;

end;

procedure TFrmPoBase.ResetTaxable(Arinvt_ID: Real; ATaxableField:TField);
begin
  if SelectValueFmtAsString(
    'select NVL(nontaxable_po, ''N'') from arinvt where id = %.0f',
    [Arinvt_ID]) = 'Y' then
    ATaxableField.asString    := 'N';
end;

procedure TFrmPoBase.BatchDropShipReporting1Click(Sender: TObject);
begin
  //TFrmPODropShipReportBatch.DoShow( self, DM.QryPOID.asFloat );  // po_dropship_report_batch.pas
end;

{procedure TFrmPoBase.IQSearch1CalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
  AId:Real;
  procedure AssignColor(ABack, AFront: TColor);
  begin
    ABrush.Color:= ABack;
    AFont.Color := AFront;
  end;
begin
  AssignColor(clWhite, clBlack);
  AId := SelectValueFmtAsFloat(
    'select p.id from MON_VENDOR_EDI_PO p, mon_vendor_edi v ' +
    ' where p.po_id = %.0f and p.mon_vendor_edi_id = v.id and v.id = %.0f',
    [DM.QryPOID.asFloat, QryEserverActMON_VENDOR_EDI_ID.asFloat]);
  if aId <> 0 then if (not Highlight) then
    AssignColor(clYellow, clBlack)

end;
 }

procedure TFrmPoBase.DBNavigator1BeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId:Real;
begin
  if QryEserverActMON_ACT_DETAIL_ID.asFloat = 0 then Abort;
  if Button = nbDelete then
  begin
    if (QryEserverPOPO_ID.asFloat = DM.QryPOID.asFloat) then
    begin
      // po_rscstr.cTXT0000118 = 'Delete the current record?';
//      if IqConfirmYN(po_rscstr.cTXT0000118) then
//      begin
//        ExecuteCommandFmt(
//          'delete from MON_VENDOR_EDI_PO where id = %.0f',
//          [QryEserverPOID.asFloat]);
//        QryEserverPO.Close;
//        QryEserverPO.Open;
//        //IqSearch1.wwDbGrid.Refresh;
//        QryEserverPOAfterScroll(nil);
//      end;
    end;
    Abort;
  end
  else if Button = nbInsert then
  begin
    AId := SelectValueFmtAsFloat(
      'select p.id from MON_VENDOR_EDI_PO p where p.po_id = %f',
      [DM.QryPOID.asFloat]);
    if AId = 0 then
    begin
      ExecuteCommandFmt(
        'insert into MON_VENDOR_EDI_PO (po_id, mon_vendor_edi_id) values (%f, %f)',
        [DM.QryPOID.asFloat, QryEserverActMON_VENDOR_EDI_ID.asFloat]);
      QryEserverPO.Close;
      QryEserverPO.Open;
      //IqSearch1.wwDbGrid.Refresh;
      QryEserverPOAfterScroll(nil);
    end;
    Abort;
  end;

end;

procedure TFrmPoBase.QryEserverActAfterScroll(DataSet: TDataSet);
begin
  QryEserverPOAfterScroll(nil);
end;

procedure TFrmPoBase.QryEserverPOAfterScroll(DataSet: TDataSet);
var
  AId:Real;
begin
  AId := SelectValueFmtAsFloat(
    'select p.id from MON_VENDOR_EDI_PO p where p.po_id = %f',
    [DM.QryPOID.asFloat]);

  if aId = 0 then
    //DBNavigator1.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast, nbInsert]
  else
  begin
//    if (QryEserverPOPO_ID.asFloat = DM.QryPOID.asFloat) then
//      DBNavigator1.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast, nbDelete]
//    else
//      DBNavigator1.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast];
  end;
  //iqctrl.AutoSizeNavBar(DBNavigator1);
end;

procedure TFrmPoBase.QryEserverPOBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrmPoBase.QryEserverPOUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  // To fool the cached update
end;

{procedure TFrmPoBase.wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
  AId:Real;
  procedure AssignColor(ABack, AFront: TColor);
  begin
    ABrush.Color:= ABack;
    AFont.Color := AFront;
  end;
begin
  AssignColor(clWhite, clBlack);
  if (QryEserverPOPO_ID.asFloat = DM.QryPOID.asFloat) then
    AssignColor(clYellow, clBlack)
end;}

procedure TFrmPoBase.SBBudgetCompClick(Sender: TObject);
begin
//  ExecuteCommandFmt(
//    'begin po_budget_comp.Calculate_Budget_Comp(%f); end;',
//    [DM.TblPoDetailID.asFloat]);
//  DM.QryPOReleases.Close;
//  DM.QryPOReleases.Open;
//  DM.TblPoDetail.Refresh;
end;

procedure TFrmPoBase.SBCalcTaxClick(Sender: TObject);
begin
 // DM.GetTaxes;
end;

procedure TFrmPoBase.SetTaxButton;
begin
//  SBTaxBreakdown.Visible := (not Avalara.AvalaraEnabled(DM.QryPOEPLANT_ID.AsFloat)) or
//   (SelectValueFmtAsString('select nvl(tax_calculated, ''N'') from po where id = %.0f', [DM.QryPOID.AsFloat]) = 'Y');
//  SBCalcTax.Visible := not SBTaxBreakdown.Visible;
end;

procedure TFrmPoBase.All1Click(Sender: TObject);
var
  AQry:TFDQuery;
begin
//  AQry := TFDQuery.Create(nil);
//  try
//    AQry.Connection := db_dm.FDConnection;
//    AQry.SQL.Add(IqFormat('select id from po_detail where po_id = %f',
//      [DM.QryPOID.asFloat]));
//    AQry.Open;
//    while not AQry.Eof do
//    begin
//      ExecuteCommandFmt(
//        'begin po_budget_comp.Calculate_Budget_Comp(%f); end;',
//        [AQry.FieldByName('ID').asFloat]);
//      AQry.Next;
//    end;
//  finally
//    AQry.Free;
//  end;
//  DM.QryPOReleases.Close;
//  DM.QryPOReleases.Open;
//  DM.TblPoDetail.Refresh;
end;

procedure TFrmPoBase.DBOnHoldReasonCustomDlg(Sender: TObject);
begin
  wwMemoDialog1.Execute;
end;

procedure TFrmPoBase.dbchkWorkflowStartedClick(Sender: TObject);
begin
  if DM.QryWFHeader.State = dsEdit then
  begin
    DM.QryWFHeaderIS_STARTED.asString:= IQMS.Common.StringUtils.BoolToYN( TDBCheckBox(Sender).Checked );
    DM.QryWFHeader.Post;
  end;
end;


procedure TFrmPoBase.DbTaxCodeCustomDlg(Sender: TObject);
begin
  with DM.PkTaxCode do
  if execute then
  begin
    if not (DM.TblPodetail.State in [dsEdit, dsInsert]) then DM.TblPodetail.Edit;
    DM.TblPoDetailTAX_CODE_ID.asFloat := System.Variants.VarAsType(GetValue('ID'), varInt64);
    DM.TblPoDetailTaxCode.asString := SelectValueFmtAsString(
      'select tax_code from tax_codes where id = %f',
      [DM.TblPoDetailTAX_CODE_ID.asFloat]);
    DM.ViewPoTotal.Close;
    DM.ViewPoTotal.Open;
  end;
end;

procedure TFrmPoBase.ClearTax1Click(Sender: TObject);
begin
  if not (DM.TblPodetail.State in [dsEdit, dsInsert]) then DM.TblPodetail.Edit;
  DM.TblPoDetailTAX_CODE_ID.Clear;
  DM.TblPoDetailTaxCode.Clear;
  DM.ViewPoTotal.Close;
  DM.ViewPoTotal.Open;
end;

procedure TFrmPoBase.RewindResetWorkflowApprovalProcess1Click(Sender: TObject);
begin
  // po_rscstr.cTXT0000119 =
  // 'Are you sure you want to rewind/reset the Workflow ' +
  //   'approval process?';
//  if IQMesg.IQConfirmYNWithSecurity(
//    po_rscstr.cTXT0000119,
//    'FrmPoBaseRewindResetWorkflow',
//    True ) then
//    DM.CheckExistsResetPOWorkflow( DM.QryPOID.asFloat );
end;

procedure TFrmPoBase.SRAfterApply(Sender: TObject);
begin
//  wwDBComboUOM.Visible :=False;
//  wwDBcomboDivision.Visible :=False;
//  DBItemno.Visible :=False;
//  dbRefCode.Visible :=False;
//  wwGlAcct.Visible :=False;
//  wwDBComboDlgPODetailComment.Visible :=False;
//  DbTaxCode.Visible :=False;
//  wwComboGridVendor.Visible :=False;
//  wwComboGridRemit.Visible :=False;
//  wwComboGridTerms.Visible :=False;
//  wwComboGridFreight.Visible :=False;
//  wwComboGridFOB.Visible :=False;
//  wwComboGridTaxes.Visible :=False;
end;

function TFrmPoBase.ShowAllMainRecords: Boolean;
begin
  Result := PCMain.ActivePage = TabGrid;
end;


procedure TFrmPoBase.CheckPoVMIDelete;
var
  AQry:TFDQuery;
  a_vmi_qty_received : Real;
  a_consumed_vmi_qty : Real;
begin
//  AQry := TFDQuery.Create(nil);
//  try
//   AQry.Connection := db_dm.FDConnection;
//   AQry.Sql.Add(IqFormat('select id from po_detail where po_id = %f', [DM.QryPOID.asFloat]));
//   AQry.Open;
//   while not AQry.Eof do
//   begin
//
//     a_vmi_qty_received := SelectValueFmtAsFloat('select NVL(sum(NVL(vmi_qty_received, 0)), 0) from po_receipts where po_detail_id = %f',
//     [AQry.FieldByName('id').asFloat]);
//
//     a_consumed_vmi_qty := SelectValueFmtAsFloat('select NVL(sum(NVL(qty_received, 0)), 0) from po_receipts  where po_detail_id = %f ' +
//                                    ' and NVL(vmi_consumption, ''N'') = ''Y''', [AQry.FieldByName('id').asFloat]);
//
//     if (a_vmi_qty_received <> 0) and (a_consumed_vmi_qty > a_vmi_qty_received) then
//       // po_rscstr.cTXT0000120 =
//       // 'Unable to archive the PO because the total VMI Received ' +
//       // 'Quantity is greater than total Quantity Received. Please see the ' +
//       // 'Receipt Information in order to determine the necessary corrections.';
//       raise Exception.Create(po_rscstr.cTXT0000120);
//     AQry.Next;
//   end;
//  finally
//    AQry.Free;
//  end;

end;

end.
