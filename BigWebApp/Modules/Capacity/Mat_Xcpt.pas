unit Mat_Xcpt;

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
  Vcl.DBGrids,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.Jump,
  IQMS.Common.JumpConstants,
//  IQMS.Common.UserMessages,
  IQMS.WebVcl.Hpick,
//  Vcl.Buttons,
  Vcl.Wwkeycb,
//  Vcl.Wwdatsrc,
  InvtClas,
//  Mask,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SoftEPlant,
  PO_Share,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TFrmMatException = class(TUniForm)
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SrcXcptDtl: TDataSource;
    SrcWO: TDataSource;
    SrcOrders: TDataSource;
    QryXcptDtl: TFDQuery;
    QryWO: TFDQuery;
    QryOrders: TFDQuery;
    QryXcptDtlARINVT_ID: TBCDField;
    QryXcptDtlQTY: TFMTBCDField;
    QryXcptDtlMUST_ARRIVE: TDateTimeField;
    QryXcptDtlMUST_ORDER: TDateTimeField;
    QryXcptDtlVENDOR_ID: TBCDField;
    QryXcptDtlVENDORNO: TStringField;
    QryWOWORKORDER_ID: TBCDField;
    QryWOPROD_DATE: TDateTimeField;
    QryWOTOT_MAT_QTY: TFMTBCDField;
    QryOrdersWORKORDER_ID: TBCDField;
    QryOrdersREL_DATE: TDateTimeField;
    QryOrdersREL_QUAN: TBCDField;
    QryOrdersORDERNO: TStringField;
    QryOrdersPONO: TStringField;
    QryOrdersITEMNO: TStringField;
    QryOrdersDESCRIP: TStringField;
    QryOrdersCUSTNO: TStringField;
    QryXcptDtlCOMPANY: TStringField;
    IQRepDef1: TIQWebRepDef;
    IQAbout1: TIQWebAbout;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PopupMenu1: TUniPopupMenu;
    PopupMenu2: TUniPopupMenu;
    PopupMenu3: TUniPopupMenu;
    JumptoInventory1: TUniMenuItem;
    JumptoWO1: TUniMenuItem;
    JumptoSalesOrder1: TUniMenuItem;
    JumptoInventory2: TUniMenuItem;
    IQJumpInv1: TIQWebJump;
    IQJumpWO: TIQWebJump;
    IQJumpInv2: TIQWebJump;
    IQJumpOE: TIQWebJump;
    QryOrdersARINVT_ID: TBCDField;
    QryOrdersORDERS_ID: TBCDField;
    PageControl1: TUniPageControl;
    shExceptions: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    Panel3: TUniPanel;
    Splitter2: TUniSplitter;
    Splitter3: TUniSplitter;
    pnlXcptDtl: TUniPanel;
    pnlWO: TUniPanel;
    gridWO: TUniDBGrid;
    gridOrders: TUniDBGrid;
    pnlItems: TUniPanel;
    Splitter1: TUniSplitter;
    SrcMatReqItems: TDataSource;
    QryMatReqItems: TFDQuery;
    QryMatReqItemsARINVT_ID: TBCDField;
    QryMatReqItemsITEMNO: TStringField;
    QryMatReqItemsCLASS: TStringField;
    QryMatReqItemsDESCRIP: TStringField;
    SrcPastDuePOs: TDataSource;
    QryPastDuePOs: TFDQuery;
    pnlReqMat: TUniPanel;
    Splitter4: TUniSplitter;
    QryPastDuePOsPO_ID: TBCDField;
    QryPastDuePOsPONO: TStringField;
    QryPastDuePOsVENDOR_ID: TBCDField;
    QryPastDuePOsPO_DATE: TDateTimeField;
    QryPastDuePOsCOMPANY: TStringField;
    QryPastDuePOsDETAIL_ID: TBCDField;
    QryPastDuePOsMISC_ITEM: TStringField;
    PopupMenu4: TUniPopupMenu;
    IQJumpInv3: TIQWebJump;
    JumptoInventory3: TUniMenuItem;
    PopupMenu5: TUniPopupMenu;
    IQJumpPO1: TIQWebJump;
    JumptoPO1: TUniMenuItem;
    popmXcptDtl: TUniPopupMenu;
    AddtoPO1: TUniMenuItem;
    PKPOrders: TIQWebHPick;
    PKPOrdersPONO: TStringField;
    PKPOrdersPO_DATE: TDateTimeField;
    PKPOrdersCOMPANY: TStringField;
    PKPOrdersID: TBCDField;
    PKPOrdersVENDOR_ID: TBCDField;
    PKPOrdersTOTAL_ORDERED: TBCDField;
    PKPOrdersREQUIRED_DATE: TDateTimeField;
    PKPOrdersPROMISED_DATE: TDateTimeField;
    PkItems: TIQWebHPick;
    PkItemsARINVT_ID: TBCDField;
    PkItemsCLASS: TStringField;
    PkItemsITEMNO: TStringField;
    PkItemsREV: TStringField;
    PkItemsDESCRIP: TStringField;
    QryPastDuePOsQTY_RECEIVED: TFMTBCDField;
    QryPastDuePOsLEFT_TO_RECEIVE: TFMTBCDField;
    PKPOrdersPO_DETAIL_ID: TBCDField;
    shBelowMin: TUniTabSheet;
    SrcBelowMin: TDataSource;
    QryBelowMin: TFDQuery;
    QryBelowMinARINVT_ID: TBCDField;
    QryBelowMinCLASS: TStringField;
    QryBelowMinITEMNO: TStringField;
    QryBelowMinREV: TStringField;
    QryBelowMinDESCRIP: TStringField;
    QryBelowMinONHAND: TFMTBCDField;
    QryBelowMinSAFETY_STOCK: TFMTBCDField;
    QryBelowMinMIN_ORDER_QTY: TFMTBCDField;
    QryBelowMinMAX_ORDER_QTY: TFMTBCDField;
    QryBelowMinARINVT_UNIT: TStringField;
    QryBelowMinUOM: TStringField;
    popmBelowMin: TUniPopupMenu;
    IQJumpInv: TIQWebJump;
    JumptoInventory4: TUniMenuItem;
    AddtoPO2: TUniMenuItem;
    shExist_Ideal: TUniTabSheet;
    SrcV_Exist_Ideal: TDataSource;
    QryV_Exist_Ideal: TFDQuery;
    wwSrcExist_Ideal_Items: TDataSource;
    wwQryExist_Ideal_Items: TFDQuery;
    wwQryExist_Ideal_ItemsARINVT_ID: TBCDField;
    wwQryExist_Ideal_ItemsCLASS: TStringField;
    wwQryExist_Ideal_ItemsITEMNO: TStringField;
    wwQryExist_Ideal_ItemsREV: TStringField;
    wwQryExist_Ideal_ItemsDESCRIP: TStringField;
    wwQryExist_Ideal_ItemsUNIT: TStringField;
    pnlExist_Ideal_Items: TUniPanel;
    Splitter5: TUniSplitter;
    wwQryExist_Ideal_ItemsONHAND: TFMTBCDField;
    Panel4: TUniPanel;
    QryV_Exist_IdealARINVT_ID: TBCDField;
    QryV_Exist_IdealIDEAL_QTY: TFMTBCDField;
    QryV_Exist_IdealMUST_ARRIVE: TDateTimeField;
    QryV_Exist_IdealPO_QTY: TFMTBCDField;
    QryV_Exist_IdealACTION: TStringField;
    wwQryExist_Ideal_ItemsUOM: TStringField;
    N1: TUniMenuItem;
    recalculate1: TUniMenuItem;
    wwQryExist_Ideal_ItemsSTANDARD_ID: TBCDField;
    wwSrcXcpItems: TDataSource;
    wwQryXcpItems: TFDQuery;
    wwQryXcpItemsARINVT_ID: TBCDField;
    wwQryXcpItemsCLASS: TStringField;
    wwQryXcpItemsITEMNO: TStringField;
    wwQryXcpItemsDESCRIP: TStringField;
    wwQryXcpItemsREV: TStringField;
    wwQryXcpItemsONHAND: TFMTBCDField;
    wwQryXcpItemsSTANDARD_ID: TBCDField;
    wwQryXcpItemsARINVT_UNIT: TStringField;
    wwQryXcpItemsUOM: TStringField;
    N2: TUniMenuItem;
    sbtnClassFilter: TUniSpeedButton;
    AddtoPOvendor1: TUniMenuItem;
    N3: TUniMenuItem;
    AddtoPOvendor2: TUniMenuItem;
    PkPoOfVendors: TIQWebHPick;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    StringField2: TStringField;
    FloatField1: TBCDField;
    FloatField2: TBCDField;
    FloatField3: TBCDField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    FloatField4: TBCDField;
    PkPoOfVendorsCLASS: TStringField;
    PkPoOfVendorsITEMNO: TStringField;
    PkPoOfVendorsDESCRIP: TStringField;
    QryV_Exist_IdealPONO: TStringField;
    QryV_Exist_IdealSEQ: TBCDField;
    QryV_Exist_IdealTOTAL_QTY_ORD: TFMTBCDField;
    QryV_Exist_IdealVENDOR_COMPANY: TStringField;
    QryV_Exist_IdealDETAIL_ID: TBCDField;
    pnlExistPO: TUniPanel;
    Label1: TUniLabel;
    DBEdit1: TUniDBEdit;
    Label3: TUniLabel;
    DBEdit2: TUniDBEdit;
    Label4: TUniLabel;
    DBEdit3: TUniDBEdit;
    Label5: TUniLabel;
    DBEdit4: TUniDBEdit;
    srchIdealVsExist: TIQUniGridControl;
    QryV_Exist_IdealPROMISE_DATE: TDateTimeField;
    Contents1: TUniMenuItem;
    SoftEPlant1: TIQWebSoftEPlant;
    wwQryXcpItemsEPLANT_ID: TBCDField;
    sbtnEplantView: TUniSpeedButton;
    QryMatReqItemsEPLANT_ID: TBCDField;
    QryBelowMinEPLANT_ID: TBCDField;
    wwQryExist_Ideal_ItemsEPLANT_ID: TBCDField;
    wwQryXcpItemsDIVISION_ID: TFMTBCDField;
    wwQryXcpItemsDIVISION_NAME: TStringField;
    QryXcptDtlDIVISION_ID: TBCDField;
    QryMatReqItemsDIVISION_ID: TBCDField;
    QryMatReqItemsONHAND: TFMTBCDField;
    QryMatReqItemsDIVISION_NAME: TStringField;
    QryBelowMinDIVISION_ID: TFMTBCDField;
    QryBelowMinDIVISION_NAME: TStringField;
    wwQryExist_Ideal_ItemsDIVISION_ID: TFMTBCDField;
    wwQryExist_Ideal_ItemsDIVISION_NAME: TStringField;
    StatusBar1: TUniStatusBar;
    QryMatReqItemsSTANDARD_ID: TBCDField;
    QryBelowMinSTANDARD_ID: TBCDField;
    QryV_Exist_IdealDIVISION_ID: TFMTBCDField;
    PKPOrdersDIVISION_ID: TBCDField;
    PkPoOfVendorsDIVISION_ID: TBCDField;
    wwQryXcpItemsQTY: TFMTBCDField;
    sbtnRecalc: TUniSpeedButton;
    QryXcptDtlPO_DETAIL_ID: TBCDField;
    shapeYellow: TUniPanel;
    QryXcptDtlSHOULD_ARRIVE: TDateTimeField;
    QryV_Exist_IdealSHOULD_ARRIVE: TDateTimeField;
    wwQryXcpItemsLEFT_TO_ORDER: TFMTBCDField;
    DRPDemand1: TUniMenuItem;
    gridXcptDtl: TIQUniGridControl;
    gridExist_Ideal: TIQUniGridControl;
    PKPOrdersRELEASE_QTY: TBCDField;
    PkPoOfVendorsRELEASE_QTY: TBCDField;
    QryPastDuePOsBLANKET_QTY: TFMTBCDField;
    QryPastDuePOsTOTAL_RELEASES: TFMTBCDField;
    QryPastDuePOsSEQ: TBCDField;
    Panel5: TUniPanel;
    gridPastDuePOs: TUniDBGrid;
    SrcPOReleasesOverDue: TDataSource;
    QryPOReleasesOverDue: TFDQuery;
    QryPOReleasesOverDueID: TBCDField;
    QryPOReleasesOverDueSEQ: TBCDField;
    QryPOReleasesOverDueQUAN: TFMTBCDField;
    QryPOReleasesOverDueREQUEST_DATE: TDateTimeField;
    QryPOReleasesOverDuePROMISE_DATE: TDateTimeField;
    Splitter6: TUniSplitter;
    wwGrdPOReleasesOverDue: TIQUniGridControl;
    wwQryXcpItemsOVERSIZE_FLAG: TFMTBCDField;
    shapePurple: TUniPanel;
    QryWOORIGIN: TStringField;
    Shape6: TUniPanel;
    wwQryXcpItemsCOST_OBJECT_SOURCE: TStringField;
    wwQryXcpItemsCOST_OBJECT_ID: TBCDField;
    QryXcptDtlCOST_OBJECT_SOURCE: TStringField;
    QryXcptDtlCOST_OBJECT_ID: TFMTBCDField;
    wwQryExist_Ideal_ItemsCOST_OBJECT: TStringField;
    wwQryExist_Ideal_ItemsCOST_OBJECT_SOURCE: TStringField;
    wwQryExist_Ideal_ItemsCOST_OBJECT_ID: TFMTBCDField;
    QryV_Exist_IdealCOST_OBJECT_SOURCE: TStringField;
    QryV_Exist_IdealCOST_OBJECT_ID: TFMTBCDField;
    wwQryXcpItemsCOST_OBJECT: TStringField;
    srchXcpItems: TIQUniGridControl;
    sbtnEval: TUniSpeedButton;
    wwQryXcpItemsBUYER_CODE_ID: TBCDField;
    wwQryXcpItemsBUYER_CODE: TStringField;
    QryMatReqItemsBUYER_CODE_ID: TBCDField;
    QryMatReqItemsBUYER_CODE: TStringField;
    QryBelowMinBUYER_CODE_ID: TBCDField;
    QryBelowMinBUYER_CODE: TStringField;
    wwQryExist_Ideal_ItemsBUYER_CODE_ID: TBCDField;
    wwQryExist_Ideal_ItemsBUYER_CODE: TStringField;
    QryPastDuePOsUNIT: TStringField;
    IQSearchBelowMin: TIQUniGridControl;
    QryBelowMinVENDORNO: TStringField;
    QryBelowMinCOMPANY: TStringField;
    QryBelowMinON_ORDER: TFMTBCDField;
    QryBelowMinPO_REQUIRED: TStringField;
    ShowPOs1: TUniMenuItem;
    QryPOReleasesOverDueLeft_To_Recv: TFloatField;
    QryXcptDtlORIGIN: TStringField;
    N4: TUniMenuItem;
    JumptoPO2: TUniMenuItem;
    QryV_Exist_IdealPO_QTY_INV_UOM: TFMTBCDField;
    QryV_Exist_IdealTOTAL_QTY_ORD_INV_UOM: TFMTBCDField;
    QryWOHARD_ALLOC_QTY: TFMTBCDField;
    Panel2: TUniPanel;
    Label7: TUniLabel;
    wwQryXcpItemsVENDOR_ID: TFMTBCDField;
    wwQryXcpItemsVENDORNO: TStringField;
    wwQryXcpItemsCOMPANY: TStringField;
    AddBatchToPOByVendor: TUniMenuItem;
    PkPoByVendor: TIQWebHPick;
    StringField3: TStringField;
    DateTimeField4: TDateTimeField;
    StringField4: TStringField;
    FloatField5: TBCDField;
    FloatField6: TBCDField;
    FloatField7: TBCDField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    FloatField8: TBCDField;
    FloatField9: TBCDField;
    FloatField10: TBCDField;
    AlternateItem1: TUniMenuItem;
    QryWOALTERNATE_ARINVT_ID: TBCDField;
    QryWOAlternateItemNo: TStringField;
    SR: TIQWebSecurityRegister;
    QryPOReleasesOverDueQTY_LEFT_TO_RECV: TFMTBCDField;
    PkArinvtVendor: TIQWebHPick;
    PkArinvtVendorID: TBCDField;
    PkArinvtVendorVENDOR_ID: TBCDField;
    PkArinvtVendorSEQ: TBCDField;
    PkArinvtVendorVEND_ITEMNO: TStringField;
    PkArinvtVendorVEND_DESCRIP: TStringField;
    PkArinvtVendorVEND_REV: TStringField;
    PkArinvtVendorVENDORNO: TStringField;
    PkArinvtVendorCOMPANY: TStringField;
    wwQryXcpItemsDESCRIP2: TStringField;
    QryOrdersREV: TStringField;
    QryOrdersDESCRIP2: TStringField;
    QryMatReqItemsDESCRIP2: TStringField;
    QryMatReqItemsREV: TStringField;
    QryBelowMinDESCRIP2: TStringField;
    wwQryExist_Ideal_ItemsDESCRIP2: TStringField;
    ReceivingDays1: TUniMenuItem;
    VendorRFQ1: TUniMenuItem;
    QryXcptDtlVENDOR_RECEIVE: TDateTimeField;
    JumpToMPS1: TUniMenuItem;
    wwQryXcpItemsMPS: TStringField;
    pnlIdealExistTop: TUniPanel;
    lblFilterSuggestedAction: TUniLabel;
    edSuggestedActionFilter: TUniEdit;
    sbtnSuggestedActionFilter: TUniSpeedButton;
    wwQryXcpItemsLEAD_DAYS: TFMTBCDField;
    QryMatReqItemsLEAD_DAYS: TBCDField;
    QryBelowMinLEAD_DAYS: TBCDField;
    wwQryExist_Ideal_ItemsLEAD_DAYS: TBCDField;
    JumpToPoHistory1: TUniMenuItem;
    PkVendor: TIQWebHPick;
    PkVendorVENDORNO: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField11: TBCDField;
    PkVendorPK_HIDE: TStringField;
    QryBelowMinHARD_ALLOC: TFMTBCDField;
    JumpToInventoryAvailability1: TUniMenuItem;
    IQJumpAvail: TIQWebJump;
    JumpToInventoryLocationsTransactions1: TUniMenuItem;
    QryV_Exist_IdealPO_RELEASES_SEQ: TStringField;
    QryOrdersCOMPANY: TStringField;
    wwQryXcpItemsVMI: TFMTBCDField;
    srchPastDuePO: TIQUniGridControl;
    IQJumpInv4: TIQWebJump;
    popmPastDuePO: TUniPopupMenu;
    MenuItem1: TUniMenuItem;
    QryWOOpDesc: TStringField;
    QryWOPTOPER_ID: TBCDField;
    QryWOOpNo: TStringField;
    shOutsourceBelowMin: TUniTabSheet;
    SrcOutsourceBelowMin: TDataSource;
    QryOutsourceBelowMin: TFDQuery;
    srchOutsourceBelowMin: TIQUniGridControl;
    QryOutsourceBelowMinID: TBCDField;
    QryOutsourceBelowMinARINVT_ID: TBCDField;
    QryOutsourceBelowMinVENDOR_ID: TBCDField;
    QryOutsourceBelowMinCLASS: TStringField;
    QryOutsourceBelowMinITEMNO: TStringField;
    QryOutsourceBelowMinREV: TStringField;
    QryOutsourceBelowMinDESCRIP: TStringField;
    QryOutsourceBelowMinDESCRIP2: TStringField;
    QryOutsourceBelowMinVENDORNO: TStringField;
    QryOutsourceBelowMinCOMPANY: TStringField;
    QryOutsourceBelowMinONHAND_IN_TRANSIT: TFMTBCDField;
    QryOutsourceBelowMinSHIP_ORDER_QTY: TFMTBCDField;
    QryOutsourceBelowMinSAFETY_STOCK: TBCDField;
    QryOutsourceBelowMinMIN_ORDER_QTY: TBCDField;
    QryOutsourceBelowMinMAX_ORDER_QTY: TBCDField;
    QryOutsourceBelowMinUNIT: TStringField;
    QryOutsourceBelowMinBUYER_CODE_ID: TBCDField;
    QryOutsourceBelowMinBUYER_CODE: TStringField;
    popmOutsrcBelowMin: TUniPopupMenu;
    JumpToInventory5: TUniMenuItem;
    JumpToOutsourceBOM1: TUniMenuItem;
    JumpToVendor1: TUniMenuItem;
    JumpToShipOrder1: TUniMenuItem;
    IQJumpOutsrcInv: TIQWebJump;
    IQJumpOutsrcVendor: TIQWebJump;
    PkOutsourceBOM: TIQWebHPick;
    PkOutsourceBOMID: TBCDField;
    PkOutsourceBOMMFGNO: TStringField;
    PkOutsourceShipOrder: TIQWebHPick;
    PkOutsourceShipOrderID: TBCDField;
    PkOutsourceShipOrderORDERNO: TStringField;
    CreateShipOrder1: TUniMenuItem;
    procManualShipOrder: TFDStoredProc;
    PkOutsourceShipOrderIS_MANUAL_OUTSOURCE: TStringField;
    ShowAllVendorPriceBreaks1: TUniMenuItem;
    QryBelowMinVENDOR_ID: TBCDField;
    PKPOrdersCLOSED: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure ChangeNavSource(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure JumptoWO1Click(Sender: TObject);
    procedure JumptoSalesOrder1Click(Sender: TObject);
    procedure JumptoInventory2Click(Sender: TObject);
    procedure JumptoInventory3Click(Sender: TObject);
    procedure JumptoPO1Click(Sender: TObject);
    procedure AddtoPOItem1Click(Sender: TObject);
    procedure popmXcptDtlPopup(Sender: TObject);
    procedure PKPOrdersIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure sbtnSearchClick(Sender: TObject);
    procedure PKPOrdersBeforeOpen(DataSet: TDataSet);
    procedure JumptoInventory4Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PopupMenu4Popup(Sender: TObject);
    procedure PopupMenu5Popup(Sender: TObject);
    procedure recalculate1Click(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure wwGridItemsCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure sbtnEvalClick(Sender: TObject);
    procedure wwGridItemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwSearch1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnClassFilterClick(Sender: TObject);
    procedure wwQryXcpItemsAfterScroll(DataSet: TDataSet);
    procedure QryXcptDtlBeforeOpen(DataSet: TDataSet);
    procedure RestoreGridAfterDataSetOpen(DataSet: TDataSet);
    procedure AddtoPOVendor1Click(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure sbtnEplantViewClick(Sender: TObject);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure AssignClassDivisionEPlantFilter( DataSet: TDataSet ); virtual;
    procedure srchXcpItemsDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure DRPDemand1Click(Sender: TObject);
    procedure gridXcptDtlDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);

    procedure FormDestroy(Sender: TObject);
    procedure wwGrdPOReleasesOverDueDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure SaveGridBeforeDataSetClose(DataSet: TDataSet);
    procedure SetGridColor(DataSet: TDataSet);
    procedure gridWODrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure wwQryExist_Ideal_ItemsAfterScroll(DataSet: TDataSet);
    procedure QryV_Exist_IdealBeforeOpen(DataSet: TDataSet);
    procedure srchIdealVsExistDblClick(Sender: TObject);
    procedure srchIdealVsExistKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwQryXcpItemsBeforeOpen(DataSet: TDataSet);
    procedure ShowPOs1Click(Sender: TObject);
    procedure QryPOReleasesOverDueCalcFields(DataSet: TDataSet);
    procedure QryPOReleasesOverDueFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure JumptoPO2Click(Sender: TObject);
    procedure AddBatchToPOByVendorClick(Sender: TObject);
    procedure PkPoByVendorIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure AlternateItem1Click(Sender: TObject);
    procedure QryWOCalcFields(DataSet: TDataSet);
    procedure PkArinvtVendorBeforeOpen(DataSet: TDataSet);
    procedure ReceivingDays1Click(Sender: TObject);
    procedure VendorRFQ1Click(Sender: TObject);
    procedure JumpToMPS1Click(Sender: TObject);
    procedure sbtnSuggestedActionFilterClick(Sender: TObject);
    procedure wwQryExist_Ideal_ItemsAfterOpen(DataSet: TDataSet);
    procedure JumpToPoHistory1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JumpToInventoryAvailability1Click(Sender: TObject);
    procedure JumpToInventoryLocationsTransactions1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure JumpToInventory5Click(Sender: TObject);
    procedure JumpToVendor1Click(Sender: TObject);
    procedure JumpToOutsourceBOM1Click(Sender: TObject);
    procedure PkOutsourceBOMBeforeOpen(DataSet: TDataSet);
    procedure JumpToShipOrder1Click(Sender: TObject);
    procedure CreateShipOrder1Click(Sender: TObject);
    procedure popmOutsrcBelowMinPopup(Sender: TObject);
    procedure PkOutsourceShipOrderIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure ShowAllVendorPriceBreaks1Click(Sender: TObject);
  private
    { Private declarations }
    FPOItem: TPOItem;
    //FLast_Arinvt_ID: Real;
    FormCreated: Boolean;
    FLastArinvt_ID: Real;
    FPOItemsList: TList;
    FIsModeAddBatchOfItemsToPo: Boolean;
    FAddBatchOfItemsVendor_ID: Real;
    FAddBatchOfItemsArinvt_Vendor_ID: Real;
    FArinvt_ID_ForArinvtVendorPkList: Real;

    procedure AssignCursor;
    procedure IQRefreshDataSets;
    procedure IQAfterShowMessage;
    //procedure CreatePO_AddItem( AArinvt_ID, AQty: Real; AReqDate: TDateTime; AVendor_ID, ADivision_ID: Real );
    procedure CreatePO_AddItem( AVendor_ID: Real; ArinvtVendorsID:Real = 0 );
    function GetActiveWWSearch: TUniEdit;
    function GetActiveWWGrid: TIQUniGridControl;
    procedure AssignCheckMark( popMenu: TUniPopupMenu );
    procedure SortSchedChange(Sender: TObject);
    procedure AssignSearchField( AField: TField );
    procedure AppendPORelease( APOItem: TPOItem );
    function GetActiveDataSet: TDataSet;
    function GetActiveDataSource: TDataSource;

    procedure GetArinvtInfo( var ARec: TArinvtRec );
    function IndexOfPoItem( ARec: TArinvtRec; AList: TList ): Integer;
    procedure AppendToPoItems( ARec: TArinvtRec );
    procedure PreparePOItemInfoList( AGrid: TIQUniGridControl );
    function GetGridInFocus: TIQUniGridControl;
    //procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
    function GetDBGridBasedOnDataSet( DataSet: TDataSet): TComponent;
    function GetGridBelowMin: TIQUniGridControl;
    function GetLeftToRecv(APOReleases_ID: Real): Real;
    function GetActiveDetailDataSet: TDataSet;
    function GetActiveDetailDataSource: TDataSource;
    procedure GetTotalQtyEarliestShouldArrive(var AQty: Real; var ADate: TDateTime);
    procedure AddBatchOfItemsToPo(APO_ID: Real);
    procedure ValidateAddMoreInfoToPO;
    procedure AssignSuggestedActionFilter;
    procedure DisplaySuggestedActionFilter;
    function PickAnyVendor(var AVendor_ID: Real): Boolean;
    function GetAKAVendorBasedOnArinvt_ID(AArinvt_ID: Real;
      var ArinvtVendorsID: Real): Real;
    function CreateManualOutsourceShipOrder: Real;
  protected
    FInvClassFilter: TInvClassFilter;
    FFilterSuggestedActionList: TStringList;

    procedure RestoreInvClassFilter; virtual;
    procedure SaveInvClassFilter;
    procedure AddToPo_ItemBased;
    procedure AddToPo_VendorBased;
    function AddToPo_SetPkListTitle( S: string ): string; virtual;
    property gridBelowMin: TIQUniGridControl read GetGridBelowMin;
  public
    { Public declarations }
    property ActiveWWSearch: TUniEdit read GetActiveWWSearch;
    property ActiveWWGrid: TIQUniGridControl read GetActiveWWGrid;
    property ActiveDataSet: TDataSet read GetActiveDataSet;
    property ActiveDetailDataSet: TDataSet read GetActiveDetailDataSet;
    property ActiveDataSource: TDataSource read GetActiveDataSource;
    property ActiveDetailDataSource: TDataSource read GetActiveDetailDataSource;
  end;

procedure DoMatException;
procedure DoIQJumpToMatException( AArinvt_ID: Real );

implementation

{$R *.DFM}

uses
  capacity_rscstr,
  CapShare,
  DayHrs,
  inv_alternate_items_pk,
  InvtFltr,
  InvtFltrEx,
  IQMS.Common.Applications,
  IQMS.Common.Controls,
  IQMS.Common.Cursor,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.UOM,
  mat_xcpt_alternate,
  mat_xcpt_alternate_wo_alloc,
  mat_xcpt_ship_order,
  { TODO -oLema : Dependent on WC-5429 Capacity - mat_xcpt_suggested_acion_dlg }
//  mat_xcpt_suggested_acion_dlg,
  { TODO -oLema : Dependent on WC-6821 Iqmps - MPS_Excep }
//  MPS_Excep,
  OpenPOs,
  OrdersDRP,
  IQMS.Common.PanelMsg,
  { TODO -oLema : Dependent on WC-7854 Po - po_hist_ex}
//  po_hist_ex,
  { TODO -oLema : Dependent on WC-7841 Po - Pomain}
//  POMain,
  RecvDays,
  { TODO -oLema : Dependent on WC-8505 Sched - Sched_mn}
//  Sched_mn,
  IQMS.Common.SysShare,
  System.Variants,
  { TODO -oLema : Dependent on WC-9510 vendor_rfq - ven_rfq_main}
//  ven_rfq_main,
  ven_rfq_share,
  VendorAKABreaks,
  wo_misc;

{$REGION 'Wrappers'}

procedure DoMatException;
begin
  DoIQJumpToMatException(0);
end;

procedure DoIQJumpToMatException( AArinvt_ID: Real );
var
  frm: TFrmMatException;
begin
  frm := TFrmMatException.Create(uniGUIApplication.UniApplication);

  with frm do
  begin
    FormCreated:= FALSE;
    FFilterSuggestedActionList:= TStringList.Create;

  {Nov-13-2006 normal restore from registry did not work}
//  srchXcpItems.wwDBGrid.UseTFields:= FALSE;
//  IQSearchBelowMin.wwDBGrid.UseTFields:= FALSE;
//  srchIdealVsExist.wwDBGrid.UseTFields:= FALSE;

    RestoreInvClassFilter;
    FLastArinvt_ID:= -1;
    FPOItemsList:= TList.Create;

  {Aug-07-03 Division vs Warehouse}
  // with IQColumnByName( gridMatReq, 'DIVISION_NAME' ).Title  do Caption:= CheckReplaceDivisionCaption( Caption ); {IQMS.Common.SysShare.pas}

{ TODO -oLema : Find a workaround for CheckReplaceDivisionOfWWSelected}
//  with srchPastDuePO do CheckReplaceDivisionOfWWSelected( DBGrid.SelectedRows );
//  with srchXcpItems do CheckReplaceDivisionOfWWSelected( DBGrid.SelectedRows );
//  with gridBelowMin do CheckReplaceDivisionOfWWSelected( DBGrid.SelectedRows );
//  with srchIdealVsExist do CheckReplaceDivisionOfWWSelected( DBGrid.SelectedRows );

    srchIdealVsExist.DbGrid.Cursor := crJump;
    srchXcpItems.DBGrid.OnEnter:= ChangeNavSource;

    PageControl1.ActivePage:= shExceptions;
    PageControl1Change( NIL );
    shapeYellow.Hint:= 'Open PO(s) exist for this item.'#13'Please refer to Ideal vs Existing';

    AssignCursor;
    shOutsourceBelowMin.TabVisible:= SecurityManager.IsModuleLicensed( apOutsource );

    FormCreated:= TRUE;

    if (AArinvt_ID > 0) then
       wwQryXcpItems.Locate('arinvt_id', AArinvt_ID, []);
    Show;
  end;

end;

{$ENDREGION 'Wrappers'}

{ TFrmMatException }

procedure TFrmMatException.FormCreate(Sender: TObject);
begin
//
end;

procedure TFrmMatException.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self, pnlItems, pnlXcptDtl, pnlWO, gridXcptDtl,
                         gridWO, gridOrders, gridPastDuePOs, pnlReqMat, // gridMatReq,
                         // gridBelowMin,
                         pnlExist_Ideal_Items, gridExist_Ideal,
                         wwGrdPOReleasesOverDue ]);

  srchXcpItems.edtSearchText.SetFocus;

  IQAfterShowMessage;
//  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );  // set SaveFilter = True for  srchXcpItems and srchIdealVsExist
end;

procedure TFrmMatException.FormDestroy(Sender: TObject);
begin
  try
    ClearListOfObjects( FPOItemsList );  {IQCtrl}
    FPOItemsList.Free;
  except on E: Exception do
    Application.ShowException(E)
  end;
end;

procedure TFrmMatException.RestoreInvClassFilter;
var
  AKind          : Integer;
  AInvClass      : string;
  ADivision_ID   : Real;
  ABuyer_Code_ID : Real;
  AIncludeAll    : Boolean;
  AExceptionScope: Real;
  AMfgType       : string;
begin
  FInvClassFilter.IncludeAll    := TRUE;
  FInvClassFilter.ExceptionScope:= 0;

  FInvClassFilter.Kind       := ifPurchased; // ifNone
  FInvClassFilter.InvClass   := '';
  FInvClassFilter.Division_ID:= 0;
  FInvClassFilter.Buyer_Code_ID:= 0;
  FInvClassFilter.MfgType    := '';

  if IQRegIntegerScalarRead( self, 'InvClassFilter_Kind', AKind ) then
     FInvClassFilter.Kind:= TInvClassFilterKind( AKind );

  if IQRegStringScalarRead( self, 'InvClassFilter_Class', AInvClass ) then
     FInvClassFilter.InvClass:= AInvClass;

  if IQRegFloatScalarRead( self, 'InvClassFilter_Division', ADivision_ID ) then
     FInvClassFilter.Division_ID:= ADivision_ID;

  if IQRegFloatScalarRead( self, 'InvClassFilter_Buyer_Code_ID', ABuyer_Code_ID ) then
     FInvClassFilter.Buyer_Code_ID:= ABuyer_Code_ID;

  if IQRegBooleanScalarRead( self, 'InvClassFilter_IncludeAll', AIncludeAll ) then
     FInvClassFilter.IncludeAll:= AIncludeAll;

  if IQRegFloatScalarRead( self, 'InvClassFilter_ExceptionScope', AExceptionScope ) then
     FInvClassFilter.ExceptionScope:= AExceptionScope;

  if IQRegStringScalarRead( self, 'InvClassFilter_MfgType', AMfgType ) then
     FInvClassFilter.MfgType:= AMfgType;
end;

procedure TFrmMatException.SaveInvClassFilter;
begin
  IQRegIntegerScalarWrite( self, 'InvClassFilter_Kind'    ,      Ord( FInvClassFilter.Kind  ));
  IQRegStringScalarWrite ( self, 'InvClassFilter_Class'   ,      FInvClassFilter.InvClass    );
  IQRegFloatScalarWrite  ( self, 'InvClassFilter_Division',      FInvClassFilter.Division_ID );
  IQRegFloatScalarWrite  ( self, 'InvClassFilter_Buyer_Code_ID', FInvClassFilter.Buyer_Code_ID );
  IQRegBooleanScalarWrite( self, 'InvClassFilter_IncludeAll',    FInvClassFilter.IncludeAll );
  IQRegFloatScalarWrite  ( self, 'InvClassFilter_ExceptionScope',FInvClassFilter.ExceptionScope );
  IQRegStringScalarWrite ( self, 'InvClassFilter_MfgType',       FInvClassFilter.MfgType );
end;

procedure TFrmMatException.AssignCursor;
begin
  srchXcpItems.Cursor    := crJump;
  gridWO.Cursor          := crJump;
  gridOrders.Cursor      := crJump;
  // gridMatReq.Cursor      := crJump;
  gridPastDuePOs.Cursor  := crJump;
  gridXcptDtl.Cursor     := crJump;
  srchIdealVsExist.Cursor:= crJump;
  gridExist_Ideal.Cursor := crJump;
  srchIdealVsExist.Cursor:= crJump;
  pnlExistPO.Cursor      := crJump;

  // gridBelowMin.Cursor    := crJump;
  IQSearchBelowMin.Cursor:= crJump;
end;

procedure TFrmMatException.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FFilterSuggestedActionList.Free;

//  srchXcpItems.SaveFilter    := FALSE;
//  srchIdealVsExist.SaveFilter:= FALSE;

  SaveInvClassFilter;

  IQRegFormWrite( self, [ self, pnlItems, pnlXcptDtl, pnlWO, gridXcptDtl,
                         gridWO, gridOrders, gridPastDuePOs, pnlReqMat, // gridMatReq,
                         //gridBelowMin,
                         pnlExist_Ideal_Items, gridExist_Ideal,
                         wwGrdPOReleasesOverDue ]);
  //Application.OnShowHint:= NIL;
//  Action:= caFree;
end;

procedure TFrmMatException.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMatException.ChangeNavSource(Sender: TObject);
begin
  if Sender is TUniDBGrid then
     NavMain.DataSource:= ( Sender as TUniDBGrid ).DataSource

  else if Sender is TIQUniGridControl then
     NavMain.DataSource:= ( Sender as TIQUniGridControl ).DataSource
end;

procedure TFrmMatException.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmMatException.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmMatException.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmMatException.JumptoInventory1Click(Sender: TObject);
begin
  IQJumpInv1.Execute;
end;

procedure TFrmMatException.JumptoWO1Click(Sender: TObject);
begin
  IQJumpWO.Execute;
end;

procedure TFrmMatException.MenuItem1Click(Sender: TObject);
begin
  IQJumpInv4.Execute;
end;

procedure TFrmMatException.JumptoSalesOrder1Click(Sender: TObject);
begin
  IQJumpOE.Execute;
end;

procedure TFrmMatException.JumpToVendor1Click(Sender: TObject);
begin
  IQJumpOutsrcVendor.Execute
end;

procedure TFrmMatException.JumptoInventory2Click(Sender: TObject);
begin
  IQJumpInv2.Execute;
end;

procedure TFrmMatException.IQAfterShowMessage;
begin
  CheckMatReqRecalc(self);

//  srchXcpItems.SaveFilter    := TRUE;
//  srchIdealVsExist.SaveFilter:= TRUE;
end;

procedure TFrmMatException.IQRefreshDataSets;
begin
  // 02/14/2008 (Byron) These 2 lines prevent a screen-repaint problem
//  Application.ProcessMessages;
  Invalidate;

  IQSetTablesActive( FALSE, self );
  IQSetTablesActiveEx( TRUE, self, capacity_rscstr.cTXT0000001 {'Refreshing data.  Please wait.'} );
end;

procedure TFrmMatException.JumptoInventory3Click(Sender: TObject);
begin
  IQJumpInv3.Execute;
end;

procedure TFrmMatException.JumptoPO1Click(Sender: TObject);
begin
  IQJumpPO1.Execute;
end;

function TFrmMatException.GetGridInFocus: TIQUniGridControl;
begin
  if PageControl1.ActivePage = shExist_Ideal then
     Result:= gridExist_Ideal
  else if PageControl1.ActivePage = shBelowMin then
     Result:= gridBelowMin
  else
     Result:= gridXcptDtl;
end;

procedure TFrmMatException.AddtoPOItem1Click(Sender: TObject);
begin
  PreparePOItemInfoList( GetGridInFocus );
  ValidateAddMoreInfoToPO();
  AddToPo_ItemBased;
end;

procedure TFrmMatException.AddtoPOVendor1Click(Sender: TObject);
begin
  PreparePOItemInfoList( GetGridInFocus );
  ValidateAddMoreInfoToPO();
  AddToPo_VendorBased;
end;

procedure TFrmMatException.PreparePOItemInfoList( AGrid: TIQUniGridControl );
var
  I   : Integer;
  ARec: TArinvtRec;
begin
  ClearListOfObjects( FPOItemsList );  {IQCtrl}

  with AGrid, Datasource.Dataset do
  try
     DisableControls;
     for I:= 0 to DBGrid.SelectedRows.Count - 1 do
     begin
       GotoBookmark(DBGrid.SelectedRows.Items[ i ]);
       Freebookmark(DBGrid.SelectedRows.Items[ i ]);

       {Builld FPOItemsList}
       GetArinvtInfo( ARec );            {get arinvt_id, descrip, class. for now it's the same for all releases }
       AppendToPoItems( ARec );          {create TPOItem if does not exist and append to the list along with releases}
     end;
//     DBGrid.SelectedRows.Clear;
  finally
   EnableControls;
  end;
end;

procedure TFrmMatException.AppendToPoItems( ARec: TArinvtRec );
var
  APOItem: TPOItem;
  I      : Integer;
begin
  I:= IndexOfPoItem( ARec, FPOItemsList );
  if I = -1 then
    I:= FPOItemsList.Add( TPOItem.Create( ARec ));

  AppendPORelease( TPOItem( FPOItemsList[ I ]));
end;

function TFrmMatException.IndexOfPoItem( ARec: TArinvtRec; AList: TList ): Integer;
var
  I: Integer;
begin
  for I:= 0 to AList.Count - 1 do
    if (TPOItem( AList[ I ]).FArinvt_ID = ARec.FArinvt_ID) and
       (TPOItem( AList[ I ]).FCost_Object_Source = ARec.FCost_Object_Source) and
       (TPOItem( AList[ I ]).FCost_Object_ID = ARec.FCost_Object_ID) then
    begin
       Result:= I;
       EXIT;
    end;
  Result:= -1;
end;

procedure TFrmMatException.JumpToInventoryLocationsTransactions1Click(
  Sender: TObject);
var
  ARec: TArinvtRec;
begin
  GetArinvtInfo( ARec );
  JumpDirect( iq_JumpToInvTransLocs, Trunc(ARec.FArinvt_ID));
end;

procedure TFrmMatException.GetArinvtInfo( var ARec: TArinvtRec );
var
  AConsolidateDivReq: Boolean;
begin
  AConsolidateDivReq:= GetSwitch('capacity_consolidate_div_req', 'params') = 'Y';

  with ARec do
    if PageControl1.ActivePage = shBelowMin then
       begin
         FArinvt_ID  := QryBelowMinARINVT_ID.asFloat;
         FClass      := QryBelowMinCLASS.asString;
         FItemNo     := QryBelowMinITEMNO.asString;
         FDescrip    := QryBelowMinDESCRIP.asString;
         FDivision_ID:= QryBelowMinDIVISION_ID.asFloat;
         FCost_Object_Source:= '';
         FCost_Object_ID    := 0;
         FConsolidateDivReq := AConsolidateDivReq;
         FVendor_ID:= QryBelowMinVENDOR_ID.asFloat;
       end
    else if PageControl1.ActivePage = shExist_Ideal then
       begin
         FArinvt_ID  := wwQryExist_Ideal_ItemsARINVT_ID.asFloat;
         FClass      := wwQryExist_Ideal_ItemsCLASS.asString;
         FItemNo     := wwQryExist_Ideal_ItemsITEMNO.asString;
         FDescrip    := wwQryExist_Ideal_ItemsDESCRIP.asString;
         FDivision_ID:= wwQryExist_Ideal_ItemsDIVISION_ID.asFloat;
         FCost_Object_Source:= wwQryExist_Ideal_ItemsCOST_OBJECT_SOURCE.asString;
         FCost_Object_ID    := wwQryExist_Ideal_ItemsCOST_OBJECT_ID.asFloat;
         FConsolidateDivReq := AConsolidateDivReq;
         FVendor_ID:= 0;
       end
    else if PageControl1.ActivePage = shExceptions then
       begin
         FArinvt_ID  := wwQryXcpItemsARINVT_ID.asFloat;
         FClass      := wwQryXcpItemsCLASS.asString;
         FItemNo     := wwQryXcpItemsITEMNO.asString;
         FDescrip    := wwQryXcpItemsDESCRIP.asString;
         FDivision_ID:= wwQryXcpItemsDIVISION_ID.asFloat;
         FCost_Object_Source:= wwQryXcpItemsCOST_OBJECT_SOURCE.asString;
         FCost_Object_ID    := wwQryXcpItemsCOST_OBJECT_ID.asFloat;
         FConsolidateDivReq := AConsolidateDivReq;
         FVendor_ID:= wwQryXcpItemsVENDOR_ID.asFloat;
       end;
end;

procedure TFrmMatException.AppendPORelease( APOItem: TPOItem );
var
  AQty : Real;
  ADate: TDateTime;

  function _CheckAddLeadDays( ADate: TDateTime; AArinvt_ID: Real ): TDateTime;
  begin
    Result:= ADate;
    if GetSwitch( 'PO_RELEASE_USE_LEAD_TIME', 'IQSYS2' ) <> 'Y' then
       EXIT;

    Result:= ADate + SelectValueByID('lead_days', 'arinvt', AArinvt_ID);
  end;


begin
  if PageControl1.ActivePage = shBelowMin then
     APOItem.AddRelease( _CheckAddLeadDays( Date,
                                            QryBelowMinARINVT_ID.asFloat ),
                         IQConvertUOM( QryBelowMinMIN_ORDER_QTY.asFloat,
                                       QryBelowMinUOM.asString,
                                       QryBelowMinARINVT_UNIT.asString,
                                       QryBelowMinARINVT_ID.asFloat ))

  else if PageControl1.ActivePage = shExist_Ideal then
     APOItem.AddRelease( _CheckAddLeadDays( QryV_Exist_IdealSHOULD_ARRIVE.asDateTime,
                                            wwQryExist_Ideal_ItemsARINVT_ID.asFloat ),
                         IQConvertUOM( fMax(0, QryV_Exist_IdealIDEAL_QTY.asFloat - QryV_Exist_IdealPO_QTY.asFloat),
                                       wwQryExist_Ideal_ItemsUOM.asString,
                                       wwQryExist_Ideal_ItemsUNIT.asString,
                                       wwQryExist_Ideal_ItemsARINVT_ID.asFloat ))

  else if PageControl1.ActivePage = shExceptions then
     begin
       AQty := QryXcptDtlQTY.asFloat;
       ADate:= QryXcptDtlSHOULD_ARRIVE.asDateTime;
       if FIsModeAddBatchOfItemsToPo then
          GetTotalQtyEarliestShouldArrive( AQty, ADate );

       APOItem.AddRelease( _CheckAddLeadDays( ADate,
                                              wwQryXcpItemsARINVT_ID.asFloat ),   // QryXcptDtlSHOULD_ARRIVE.asDateTime,
                           IQConvertUOM( AQty,                        // QryXcptDtlQTY.asFloat,
                                         wwQryXcpItemsUOM.asString,
                                         wwQryXcpItemsARINVT_UNIT.asString,
                                         wwQryXcpItemsARINVT_ID.asFloat ));
     end;
end;

function TFrmMatException.AddToPo_SetPkListTitle( S: string ): string;
begin
  Result:= S;  {overriden in Mat_Xcpt_eMarket to specify who's eMarketPlace (OMNEXUS for ex) }
end;

procedure TFrmMatException.AddToPo_ItemBased;
var
  I: Integer;
begin
  { TODO -oLema : Dependent on WC-7841 Po - Pomain}
(*
  for I:= 0 to FPOItemsList.Count - 1 do
  begin
    TPOItem( FPOItemsList[ I ]).EnsureDivisionEPlantOfItemMatch;
    FPOItem:= TPOItem( FPOItemsList[ I ]);
    with PKPOrders do
    begin
      Title:= AddToPo_SetPkListTitle( Format('Existing PO for <%s-%s-%s>', [ FPOItem.FClass, FPOItem.FItemNo, FPOItem.FDescrip ]));
      if Execute then
         Do_IQ_New_PO_Item_With_Releases( GetValue('ID'), FPOItem )  {PO_main}
      else
         BREAK;
    end;
  end;
*)
end;

procedure TFrmMatException.AddToPo_VendorBased;
var
  I: Integer;
begin
  { TODO -oLema : Dependent on WC-7841 Po - Pomain}
(*
   for I:= 0 to FPOItemsList.Count - 1 do
   begin
     TPOItem( FPOItemsList[ I ]).EnsureDivisionEPlantOfItemMatch;
     FPOItem:= TPOItem( FPOItemsList[ I ]);
     with PkPoOfVendors do
     begin
       Title:= AddToPo_SetPkListTitle( Format('Existing PO based on vendor(s) for <%s-%s-%s>', [ FPOItem.FClass, FPOItem.FItemNo, FPOItem.FDescrip ]));
       if Execute then
          Do_IQ_New_PO_Item_With_Releases( GetValue('ID'), FPOItem )  {PO_main.pas}
       else
          BREAK;
     end;
   end;
*)
end;

function TFrmMatException.GetAKAVendorBasedOnArinvt_ID( AArinvt_ID: Real; var ArinvtVendorsID:Real ): Real;
var
  ACount: Real;
begin
  {Oct-21-2005}
  Result:= SelectValueFmtAsFloat('select vendor_id from arinvt_vendors where arinvt_id = %f and is_default = ''Y''', [ AArinvt_ID ]);
  if Result > 0 then
  begin
     ArinvtVendorsID := SelectValueFmtAsFloat('select id from arinvt_vendors where arinvt_id = %f and is_default = ''Y''', [ AArinvt_ID ]);
     EXIT;
  end;

  ACount:= SelectValueFmtAsFloat('select count(*) from arinvt_vendors where arinvt_id = %f', [ AArinvt_ID ]);
  // 07-21-2009
  if ACount = 1 then
  begin
     Result:= SelectValueFmtAsFloat('select vendor_id from arinvt_vendors where arinvt_id = %f', [ AArinvt_ID ]);
     ArinvtVendorsID := SelectValueFmtAsFloat('select id from arinvt_vendors where arinvt_id = %f', [ AArinvt_ID ]);
     EXIT;
  end;

  // 07-21-2009
  if ACount > 1 then
  begin
    FArinvt_ID_ForArinvtVendorPkList:= AArinvt_ID;
    with PkArinvtVendor do
      if Execute then
      begin
         Result:= GetValue('vendor_id');
         ArinvtVendorsID := GetValue('id');
      end;
    FArinvt_ID_ForArinvtVendorPkList:= 0;
  end;

  // Result:= SelectValueFmtAsFloat('select vendor_id from arinvt_vendors where arinvt_id = %f '+
  //                    '   and NVL(seq,0) = (select NVL(min(seq),0) from arinvt_vendors where arinvt_id = %f )',
  //                    [ AArinvt_ID, AArinvt_ID ]);
end;

procedure TFrmMatException.PKPOrdersIQModify(Sender: TObject;  var Action: TModalResult; var ResultValue: Variant);
var
  ArinvtVendorsID1:Real;
begin

  ArinvtVendorsID1 := 0;
  if PageControl1.ActivePage = shBelowMin then
     CreatePO_AddItem( GetAKAVendorBasedOnArinvt_ID( QryBelowMinARINVT_ID.asFloat, ArinvtVendorsID1 ), ArinvtVendorsID1)      // Vendor_ID. 0 will trigger vendor picklist

  else if PageControl1.ActivePage = shExist_Ideal then
     CreatePO_AddItem( GetAKAVendorBasedOnArinvt_ID( QryV_Exist_IdealARINVT_ID.asFloat, ArinvtVendorsID1 ), ArinvtVendorsID1) // Vendor_ID. 0 will trigger vendor picklist

  else if PageControl1.ActivePage = shExceptions then
     CreatePO_AddItem( GetAKAVendorBasedOnArinvt_ID( QryXcptDtlARINVT_ID.asFloat, ArinvtVendorsID1 ), ArinvtVendorsID1);      // Vendor_ID. 0 will trigger vendor picklist

  { to close PickList }
  Action:= mrABORT;
end;


procedure TFrmMatException.CreatePO_AddItem( AVendor_ID: Real; ArinvtVendorsID:Real = 0);
begin
  { TODO -oLema : Dependent on WC-7841 Po - Pomain}
  //Do_IQ_New_PO_with_Releases( AVendor_ID, FPOItemsList, ArinvtVendorsID );  {PO_Main}
end;

procedure TFrmMatException.sbtnSearchClick(Sender: TObject);
begin
  with PkItems do
    if Execute then
       if not wwQryXcpItems.Locate('ARINVT_ID', GetValue('ARINVT_ID'), []) then
          IQConfirm(Format('Selected item %s / %s is not among exception materials', [ Trim(GetValue('itemno')), Trim(GetValue('descrip')) ]));
end;

procedure TFrmMatException.PKPOrdersBeforeOpen(DataSet: TDataSet);
begin
//  with DataSet as TFDQuery do
//  begin
    // if Params.FindParam('arinvt_id') <> nil then
    //    ParamByName('arinvt_id').asFloat:= FPOItem.FArinvt_ID;
    // if Params.FindParam('vendor_id') <> nil then
    //    ParamByName('vendor_id').asFloat:= FAddBatchOfItemsVendor_ID;
    // ParamByName('cost_object_source').asString:= FPOItem.FCost_Object_Source;
    // if FPOItem.FCost_Object_ID = 0 then
    //    ParamByName('cost_object_id').Clear
    // else
    //    ParamByName('cost_object_id').AsFloat:= FPOItem.FCost_Object_ID;
  AssignQueryParamValue(DataSet, 'arinvt_id', FPOItem.FArinvt_ID);
  AssignQueryParamValue(DataSet, 'vendor_id', FAddBatchOfItemsVendor_ID);
  AssignQueryParamValue(DataSet, 'cost_object_source', FPOItem.FCost_Object_Source);
  if FPOItem.FCost_Object_ID = 0 then
     AssignQueryParamValue(DataSet, 'cost_object_id', null )
  else
     AssignQueryParamValue(DataSet, 'cost_object_id', FPOItem.FCost_Object_ID );

  with DataSet do
  begin
    if FInvClassFilter.Division_ID > 0 then
       Filter:= Format('Division_ID <> NULL and Division_ID = %f', [FInvClassFilter.Division_ID ])
    else
       Filter:= '';
    Filtered:= Filter <> '';
  end
end;

procedure TFrmMatException.JumptoInventory4Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmMatException.PageControl1Change(Sender: TObject);
var
  ADataSet: TDataSet;
begin
  IQOpenTables( self, [ PageControl1.ActivePage.PageIndex ]);    { Open Tables with Tag = ActivePage.PageIndex }

  // IQRegFormRead( self, [ GetGridInFocus ]);

  { TODO -oLema : SearchField }
//  with ActiveWWGrid.DataSource.DataSet do
//    if ActiveWWSearch.SearchField = '' then
//       AssignSearchField( Fields[ 0 ]);

  if FLastArinvt_ID > -1 then
  begin
    ADataSet:= ActiveDataSet;
    if Assigned( ADataSet ) then
      ADataSet.Locate('arinvt_id', FLastArinvt_ID, []);
  end;

  NavMain.DataSource := ActiveDataSource;
  shapeYellow.Visible:= PageControl1.ActivePage.PageIndex = 0;
end;

procedure TFrmMatException.PopupMenu4Popup(Sender: TObject);
begin
  if PopupMenu4.PopupComponent is TUniDBGrid then
     IQJumpInv3.DataSource:= (PopupMenu4.PopupComponent as TUniDBGrid).DataSource
  else
     IQJumpInv3.DataSource:= srchIdealVsExist.DataSource;
end;

procedure TFrmMatException.PopupMenu5Popup(Sender: TObject);
begin
  with PopupMenu5 do
    if PopupComponent is TUniDBGrid then
       IQJumpPO1.DataSource:= (PopupComponent as TUniDBGrid).DataSource
    else if PopupComponent = pnlExistPO then
       IQJumpPO1.DataSource:= SrcV_Exist_Ideal;
end;

procedure TFrmMatException.recalculate1Click(Sender: TObject);
var
 ALockHandle: string;
begin
  // DoDayHrs( self, [ 'IDEAL_VS_EXISTING' ]);

  // 06-23-2014 EIQ-3489 SER# 05600 - Ability to Consolidate Divisionalized Purchased Demand prior to Ideal vs Existing
  if not IQConfirmYN('Are you sure you want to recalculate material requirements?') then
     EXIT;

{ TODO -oLema : Dependent on WC-8505 Sched - Sched_mn}
(*
  TFrm_MainSched.IncrementIRV32Semaphore( ALockHandle );    {Shared mode}
  try
    DoDayHrs( self, TRUE )
  finally
    TFrm_MainSched.DecrementIRV32Semaphore( ALockHandle );
  end;
*)
end;

procedure TFrmMatException.Panel2Resize(Sender: TObject);
begin
  ActiveWWSearch.Width:= TUniPanel(ActiveWWSearch.Parent).ClientWidth - ActiveWWSearch.Left - 7;
end;

// --------
function TFrmMatException.GetActiveWWSearch: TUniEdit;
begin
  if PageControl1.ActivePage.PageIndex = 0 then
     Result:= srchXcpItems.edtSearchText
  else
     Result:= srchXcpItems.edtSearchText  {for future use - replace with appropriate wwSearch}
end;

function TFrmMatException.GetActiveWWGrid: TIQUniGridControl;
begin
  if PageControl1.ActivePage.PageIndex = 0 then
     Result:= srchXcpItems
  else
     Result:= srchXcpItems
end;

procedure TFrmMatException.PopupMenu1Popup(Sender: TObject);
var
  I:Integer;
  NewItem:TUniMenuItem;
  AMultipleRowsSelected: Boolean;

  procedure _CheckDisableWhenMultiSelect( AMenuItem: TUniMenuItem );
  var
    ARunTimeMenuItem: TUniMenuItem;
  begin
  { TODO -oLema : FindMenuItem }
//    ARunTimeMenuItem:= srchXcpItems.FindMenuItem( AMenuItem );
//    if Assigned( ARunTimeMenuItem ) then
//       ARunTimeMenuItem.Enabled:= not AMultipleRowsSelected and SR.Enabled[ AMenuItem.Name ];
  end;

begin
  PopupMenu1.Tag:= 4;  {3 original items}

  if TUniPopupMenu(Sender).Items.Count <= PopupMenu1.Tag then
     for I:= 0 to ActiveWWGrid.DataSource.DataSet.FieldCount - 1 do
     begin
       NewItem:= TUniMenuItem.Create( TUniPopupMenu( Sender ));
       with NewItem do
       begin
         Caption   := ActiveWWGrid.DataSource.DataSet.Fields[ I ].DisplayLabel;
         RadioItem := TRUE;
         Checked   := FALSE;
         OnClick   := SortSchedChange;
         GroupIndex:= 1;
         Tag       := LongInt( ActiveWWGrid.DataSource.DataSet.Fields[ I ]);
       end;
       TUniPopupMenu( Sender ).Items.Add( NewItem );
     end;
  AssignCheckMark( TUniPopupMenu( Sender ));

  AMultipleRowsSelected:= srchXcpItems.DBGrid.SelectedRows.Count > 1;

  { TODO -oLema : FindMenuItem }
(*
  with srchXcpItems.FindMenuItem(AlternateItem1) do
    Enabled:= not AMultipleRowsSelected
              and
              SR.Enabled[ 'AlternateItem1' ]
              and
              (SelectValueFmtAsFloat('select 1 from arinvt_alternate where parent_arinvt_id = %f and rownum < 2', [ wwQryXcpItemsARINVT_ID.asFloat ]) > 0);

  with srchXcpItems.FindMenuItem(JumpToMPS1) do
    Enabled:= not AMultipleRowsSelected
              and
              SR.Enabled[ 'JumpToMPS1' ]
              and
              (wwQryXcpItemsMPS.asString = 'Y');
*)

  _CheckDisableWhenMultiSelect( JumptoInventory1 );
  _CheckDisableWhenMultiSelect( JumpToInventoryLocationsTransactions1);
  _CheckDisableWhenMultiSelect( JumpToInventoryAvailability1 );
  _CheckDisableWhenMultiSelect( VendorRFQ1 );
  _CheckDisableWhenMultiSelect( JumpToPoHistory1 );
end;

procedure TFrmMatException.AssignCheckMark( popMenu: TUniPopupMenu );
var
  I:Integer;
begin
  { TODO -oLema : SearchField }
(*
  for I:= popMenu.Tag to popMenu.Items.Count - 1 do
    if popMenu.Items[ I ].Tag > 0 then
       if CompareText( TField(Pointer(popMenu.Items[ I ].Tag)).FieldName, ActiveWWSearch.SearchField ) = 0 then
       begin
         popMenu.Items[ I ].Checked:= TRUE;
         EXIT;
       end;
*)
end;

procedure TFrmMatException.SortSchedChange(Sender: TObject);
var
  AField: TField;
begin
  AField:= TField( Pointer(( Sender as TUniMenuItem ).Tag ));
  AssignSearchField( AField );
end;

procedure TFrmMatException.AssignSearchField( AField: TField );
var
  I   : Integer;
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait( AField.DataSet.Name );
  try
    with AField.DataSet as TFDQuery do           {Sort Query}
    try
      Screen.Cursor:= crSQLWait;
      DisableControls;
      Close;
      I:= Pos( 'ORDER BY ', UpperCase(SQL.Text) );
      if I > 0 then
        SQL.Text:= Copy( SQL.Text, 1, I-1);
      SQL.Add( 'ORDER BY ' + AField.Origin );
    finally
      Reopen(AField.DataSet);
      Screen.Cursor:= crDefault;
      EnableControls;
    end;

  { TODO -oLema : SearchField }
//    ActiveWWSearch.SearchField:= AField.FieldName;  {Assign new search field}
  finally
    hMsg.Free;
  end;
end;

procedure TFrmMatException.wwGridItemsCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
  { TODO -oLema : SearchField }
{
  if AFieldName = ActiveWWSearch.SearchField then
     begin
       ABrush.Color:= clBlue;
       AFont.Color := clWhite;
     end
  else
     begin
       ABrush.Color:= clBtnFace;
       AFont.Color := clBlack;
     end
}
end;

procedure TFrmMatException.sbtnEvalClick(Sender: TObject);
var
  hMsg : TPanelMesg;
begin
  if PageControl1.ActivePage = shExist_Ideal then
     begin
        srchIdealVsExistDblClick(nil);
     end
  else
    try
      hMsg:= hPleaseWait('');
      Reopen( QryXcptDtl );   {see before open: FILTER}
      Reopen( QryWO );
      Reopen( QryOrders );
    finally
      hMsg.Free;
    end;
end;

procedure TFrmMatException.QryXcptDtlBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('include_all').asFloat    := iif( FInvClassFilter.IncludeAll, 1, 0 );
  //   ParamByName('exception_scope').asFloat:= FInvClassFilter.ExceptionScope;
  // end;
  AssignQueryParamValue(DataSet, 'include_all', iif( FInvClassFilter.IncludeAll, 1, 0 ));
  AssignQueryParamValue(DataSet, 'exception_scope', FInvClassFilter.ExceptionScope );

  with DataSet do
  begin
    if wwQryXcpItemsDIVISION_ID.asFloat > 0 then
       Filter:= IQFormat('(arinvt_id = %.0f) and (division_id <> NULL and division_id = %.0f)',
                         [ wwQryXcpItemsARINVT_ID.asFloat, wwQryXcpItemsDIVISION_ID.asFloat ])

    else if wwQryXcpItemsDIVISION_ID.asFloat = -1 then
       Filter:= IQFormat('(arinvt_id = %.0f)',
                         [ wwQryXcpItemsARINVT_ID.asFloat ])

    else
       Filter:= IQFormat('(arinvt_id = %.0f) and (division_id = NULL)',
                         [ wwQryXcpItemsARINVT_ID.asFloat ]);


    if wwQryXcpItemsCOST_OBJECT_SOURCE.asString > '' then
       Filter:= Filter + IQFormat(' and cost_object_source = ''%s'' and cost_object_id = %f',
                                  [ wwQryXcpItemsCOST_OBJECT_SOURCE.asString, wwQryXcpItemsCOST_OBJECT_ID.asFloat ])
    else
       Filter:= Filter + ' and cost_object_source = NULL and cost_object_id = NULL';
  end;
end;

procedure TFrmMatException.wwQryXcpItemsAfterScroll(DataSet: TDataSet);
begin
  if FormCreated then
  begin
    QryOrders.Close;
    QryWO.Close;
    QryXcptDtl.Close;
  end;
end;

procedure TFrmMatException.wwGridItemsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    sbtnEvalClick( NIL );
    Key:= 0;
  end;
end;

procedure TFrmMatException.wwSearch1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key in [VK_DOWN, VK_UP, VK_PRIOR, VK_NEXT, VK_RETURN] then
     ActiveWWGrid.SetFocus;
  wwGridItemsKeyDown( Sender, Key, Shift );
end;

procedure TFrmMatException.sbtnClassFilterClick(Sender: TObject);
  procedure AssignExceptionTabCaption;
  begin
    if FInvClassFilter.IncludeAll then
       shExceptions.Caption:= 'Projected Exception'
    else
       shExceptions.Caption:= Format('Projected Exception (Scope = %s)', [FloatToStr(FInvClassFilter.ExceptionScope)]);
  end;
begin
  if (PageControl1.ActivePage = shExceptions) then
     begin
       if GetInventoryClassFilterEx( FInvClassFilter ) then {InvtFltrEx.pas}
       begin
         QryXcptDtl.Close;
         QryWO.Close;
         ReOpen( ActiveDataSet );
         AssignExceptionTabCaption;
       end
     end
  else
     begin
       if GetInventoryClassFilter( FInvClassFilter ) then {InvtFltr.pas}
          ReOpen( ActiveDataSet );
     end;
end;

function TFrmMatException.GetDBGridBasedOnDataSet( DataSet: TDataSet): TComponent;
begin
  if DataSet = QryWO                       then Result:= gridWO
  else if DataSet = QryOrders              then Result:= gridOrders
  else if DataSet = QryXcptDtl             then Result:= gridXcptDtl
  else if DataSet = wwQryExist_Ideal_Items then Result:= srchIdealVsExist.DBGrid
  else if DataSet = QryV_Exist_Ideal       then Result:= gridExist_Ideal
  else
     Result:= NIL;
end;

procedure TFrmMatException.SetGridColor(DataSet: TDataSet);
var
  AGrid: TComponent;
begin
  AGrid:= GetDBGridBasedOnDataSet( DataSet );
  if Assigned( AGrid ) then
     if AGrid is TIQUniGridControl then
        TIQUniGridControl(AGrid).Color:= cIIf( DataSet.Active, clWindow, clBtnFace )
     else if AGrid is TUniDBGrid then
        TUniDBGrid(AGrid).Color:= cIIf( DataSet.Active, clWindow, clBtnFace );
end;

procedure TFrmMatException.RestoreGridAfterDataSetOpen(DataSet: TDataSet);
var
  AGrid: TComponent;
begin
  SetGridColor(DataSet);
  AGrid:= GetDBGridBasedOnDataSet( DataSet );
  if Assigned( AGrid ) then
     IQRegFormRead( self, [ AGrid ]);
end;

procedure TFrmMatException.SaveGridBeforeDataSetClose(DataSet: TDataSet);
var
  AGrid: TComponent;
begin
  AGrid:= GetDBGridBasedOnDataSet( DataSet );
  if Assigned( AGrid ) then
     IQRegFormWrite( self, [ AGrid ]);
end;

procedure TFrmMatException.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
var
  ADataSet: TDataSet;
begin
  ADataSet:= ActiveDataSet;
  if Assigned( ADataSet ) then
  begin
     FLastArinvt_ID:= ADataSet.FieldByName('arinvt_id').asFloat;
     ADataSet.Close;
  end
  else
     FLastArinvt_ID:= -1;
end;

function TFrmMatException.GetActiveDataSet: TDataSet;
var
  DS: TDataSource;
begin
  DS:= ActiveDataSource;
  if Assigned( DS ) then
     Result:= DS.DataSet
  else
     Result:= NIL;
end;

function TFrmMatException.GetActiveDataSource: TDataSource;
begin
  case PageControl1.ActivePage.PageIndex of
   0: Result:= wwSrcXcpItems;
   1: Result:= SrcMatReqItems;
   2: Result:= SrcBelowMin;
   3: Result:= SrcOutsourceBelowMin;
   4: Result:= wwSrcExist_Ideal_Items;
  else
    Result:= NIL;
  end;
end;


function TFrmMatException.GetActiveDetailDataSet: TDataSet;
var
  DS: TDataSource;
begin
  DS:= ActiveDetailDataSource;
  if Assigned( DS ) then
     Result:= DS.DataSet
  else
     Result:= NIL;
end;


function TFrmMatException.GetActiveDetailDataSource: TDataSource;
begin
  case PageControl1.ActivePage.PageIndex of
   0: Result:= SrcXcptDtl;
   1: Result:= SrcPastDuePOs;
   2: Result:= NIL;
   3: Result:= nil;
   4: Result:= SrcV_Exist_Ideal;
  else
    Result:= NIL;
  end;
end;


procedure TFrmMatException.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmMatException.Contents1Click(Sender: TObject);
begin
  // IQHelp.HelpContext( 1051839 );

  if (PageControl1.ActivePage.PageIndex >= 0) and (PageControl1.ActivePage.HelpContext > 0) then
     IQHelp.HelpContext( PageControl1.ActivePage.HelpContext );
end;

procedure TFrmMatException.sbtnEplantViewClick(Sender: TObject);
begin
  if SoftEPlant1.ChangeEPlantView then
    IQRefreshDataSets;
//     PostMessage( Handle, iq_RefreshDataSets, 0, 0 );
end;

procedure TFrmMatException.AssignEPlantFilter(DataSet: TDataSet);
begin
  SoftEPlant1.AssignEPlantFilter( DataSet );
end;

procedure TFrmMatException.AssignClassDivisionEPlantFilter( DataSet: TDataSet );
var
  S: string;
begin
  with DataSet do
  begin
    SoftEPlant1.AssignEPlantFilter( DataSet );

    case FInvClassFilter.Kind of
      ifClass:
            S:= Format('Class = ''%s''', [ FInvClassFilter.InvClass ]);
      ifManufactured:
            S:= 'Standard_ID <> NULL';
      ifPurchased:
            S:= 'Standard_ID = NULL';
      ifNone:
            S:= '';
    end;

    if (Filter > '') and (S > '') then
       Filter:= Format('%s and (%s)', [S, Filter])
    else if S > '' then
       Filter:= S;

    if FInvClassFilter.Division_ID > 0 then
       if Filter > ''  then
          Filter:= IQFormat('%s and (Division_ID <> NULL and Division_ID = %.0f)', [Filter, FInvClassFilter.Division_ID ])
       else
          Filter:= IQFormat('Division_ID <> NULL and Division_ID = %.0f', [FInvClassFilter.Division_ID ]);

    if FInvClassFilter.Buyer_Code_ID > 0 then
       if Filter > ''  then
          Filter:= IQFormat('%s and (Buyer_Code_ID <> NULL and Buyer_Code_ID = %.0f)', [Filter, FInvClassFilter.Buyer_Code_ID ])
       else
          Filter:= IQFormat('Buyer_Code_ID <> NULL and Buyer_Code_ID = %.0f', [FInvClassFilter.Buyer_Code_ID ]);

    Filtered:= Filter <> '';

    StatusBar1.Caption:= Format('Filter: %s', [ CheckReplaceDivisionCaption( Filter )]);
  end;
end;


procedure TFrmMatException.popmXcptDtlPopup(Sender: TObject);
begin
  AddtoPO1.Enabled:= wwQryExist_Ideal_ItemsSTANDARD_ID.asFloat = 0; {enable for only raw materials}

  DRPDemand1.Enabled:= SelectValueFmtAsFloat('select 1 from ptallocate p where arinvt_id = %f and trunc(must_ship_date) = to_date(''%s'', ''mm/dd/yyyy'') '+
                                 '   and standard_id is NULL and (mfg_quan > 0 or po_allocate > 0 or fg_allocate > 0 or make_to_order_alloc > 0) '+
                                 '   and rownum < 2',
                                 [ QryXcptDtlARINVT_ID.asFloat,
                                   FormatDateTime('mm/dd/yyyy', QryXcptDtlMUST_ARRIVE.asDateTime + 1 )]) = 1;

  with ActiveDetailDataSet do
    case PageControl1.ActivePage.PageIndex of
     0: JumptoPO2.Enabled:= FieldByName('PO_DETAIL_ID').asFloat > 0;
     4: JumptoPO2.Enabled:= FieldByName('DETAIL_ID').asFloat > 0;
    else
        JumptoPO2.Enabled:= FALSE;
    end;
end;

procedure TFrmMatException.DRPDemand1Click(Sender: TObject);
begin
  if QryXcptDtlORIGIN.asString = 'FORECAST' then
  begin
    IQConfirm('This is a forecast DRP demand');
    EXIT;
  end;

  TFrmSalesOrderDRP.CreateModaless( QryXcptDtlARINVT_ID.asFloat, QryXcptDtlMUST_ARRIVE.asDateTime + 1 ); {OrdersDRP.pas}
end;


procedure TFrmMatException.gridWODrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if QryWOORIGIN.AsString = 'FORECAST' then
  begin
//    Attribs.Color:= IIf( gdSelected in State, clNavy,   clWhite );
//    Attribs.Font.Color := IIf( gdSelected in State, clYellow, clBlue  );
  end;
end;

procedure TFrmMatException.gridXcptDtlDBGridDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
const
  Highlight = FALSE;
begin
  if not Highlight and (QryXcptDtlPO_DETAIL_ID.asFloat > 0) then
     Attribs.Color:= clYellow;

  if QryXcptDtlORIGIN.asString = 'FORECAST' then
     case Highlight of
       TRUE : begin
                Attribs.Color:= clSilver;
                Attribs.Font.Color := clBlue;
              end;
       FALSE: begin
                Attribs.Color := clBlue;
              end;
     end;
end;


procedure TFrmMatException.wwGrdPOReleasesOverDueDBGridDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn;
  Attribs: TUniCellAttribs);
const
  Highlight = FALSE;
begin
  if Highlight then EXIT;

  if QryPOReleasesOverDuePROMISE_DATE.asDateTime > Now then
     Attribs.Font.Color:= clSilver;
end;

procedure TFrmMatException.wwQryExist_Ideal_ItemsAfterScroll( DataSet: TDataSet);
begin
  QryV_Exist_Ideal.Close;
end;

procedure TFrmMatException.QryV_Exist_IdealBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('ARINVT_ID').asFloat          :=  wwQryExist_Ideal_ItemsARINVT_ID.asFloat;
  //   ParamByName('DIVISION_ID').asFloat        :=  wwQryExist_Ideal_ItemsDIVISION_ID.asFloat;
  //   ParamByName('COST_OBJECT_SOURCE').asString:=  wwQryExist_Ideal_ItemsCOST_OBJECT_SOURCE.asString;
  //   ParamByName('COST_OBJECT_ID').asFloat     :=  wwQryExist_Ideal_ItemsCOST_OBJECT_ID.asFloat;
  // end;
  AssignQueryParamValue(DataSet, 'ARINVT_ID',         wwQryExist_Ideal_ItemsARINVT_ID.asFloat );
  AssignQueryParamValue(DataSet, 'DIVISION_ID',       wwQryExist_Ideal_ItemsDIVISION_ID.asFloat );
  AssignQueryParamValue(DataSet, 'COST_OBJECT_SOURCE',wwQryExist_Ideal_ItemsCOST_OBJECT_SOURCE.asString );
  AssignQueryParamValue(DataSet, 'COST_OBJECT_ID',    wwQryExist_Ideal_ItemsCOST_OBJECT_ID.asFloat );
end;

procedure TFrmMatException.srchIdealVsExistDblClick(Sender: TObject);
var
  hMsg : TPanelMesg;
begin
  try
    hMsg:= hPleaseWait('Accessing Ideal vs Existing Info ...');
    Reopen( QryV_Exist_Ideal );
  finally
    hMsg.Free;
  end;
end;

procedure TFrmMatException.srchIdealVsExistKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key:= 0;
    srchIdealVsExistDblClick( NIL );
  end;
end;

procedure TFrmMatException.srchXcpItemsDBGridDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
const
  HighLight= FALSE;
begin

  if (Column.Field = wwQryXcpItemsLEFT_TO_ORDER) then
     case Highlight of
       TRUE : Attribs.Font.Color:= IIf( Column.Field.asFloat > 0, clYellow, clWhite );
       FALSE: Attribs.Font.Color:= IIf( Column.Field.asFloat > 0, clRed, clBlack );
     end
  else if (wwQryXcpItemsOVERSIZE_FLAG.asFloat = 1) and not Highlight then
     begin
       Attribs.Color:= clPurple;
       Attribs.Color := clWhite;
     end

end;

procedure TFrmMatException.wwQryXcpItemsBeforeOpen(DataSet: TDataSet);
begin
  with wwQryXcpItems do
  begin
    if Params.FindParam('include_all') <> NIL then
       ParamByName('include_all').Value    := iif( FInvClassFilter.IncludeAll, 1, 0 );
    if Params.FindParam('exception_scope') <> NIL then
       ParamByName('exception_scope').Value:= FInvClassFilter.ExceptionScope;
    if Params.FindParam('mfgtype') <> NIL then
    begin
       if FInvClassFilter.MfgType = '' then
          ParamByName('mfgtype').Clear
       else
          ParamByName('mfgtype').asString:= FInvClassFilter.MfgType;
    end;
  end;

  self.AssignClassDivisionEPlantFilter(DataSet)
end;

function TFrmMatException.GetGridBelowMin: TIQUniGridControl;
begin
  Result:= IQSearchBelowMin;
end;

procedure TFrmMatException.ShowPOs1Click(Sender: TObject);
begin
  DoShowOpenPOs( QryBelowMinARINVT_ID.asFloat, Date + 100 * 365 {100 years from now}); {OpenPOs.pas}
end;

procedure TFrmMatException.QryPOReleasesOverDueCalcFields(DataSet: TDataSet);
begin
  QryPOReleasesOverDueLeft_To_Recv.asFloat:=  QryPOReleasesOverDueQTY_LEFT_TO_RECV.asFloat; // GetLeftToRecv( QryPOReleasesOverDueID.asFloat );
end;

procedure TFrmMatException.QryPOReleasesOverDueFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  // Accept:= not (QryPOReleasesOverDue.Bof and QryPOReleasesOverDue.Eof) and (GetLeftToRecv( QryPOReleasesOverDueID.asFloat ) > 0);
  // Accept:= GetLeftToRecv( QryPOReleasesOverDueID.asFloat ) > 0;
  // 03-05-2009 moved filter to the sql query
  Accept:= TRUE;
end;

function TFrmMatException.GetLeftToRecv( APOReleases_ID: Real ): Real;
begin
  // 03-05-2009 obsolete
  Result:= SelectValueFmtAsFloat('select greatest(0, Least( x.quan, x.cum_quan - NVL(r.qty_received, 0))) '+
                     '  from  c_po_releases x,     '+
                     '       c_po_receipts_total r '+
                     ' where                       '+
                     '       x.id = %f             '+
                     '   and x.po_detail_id = r.po_detail_id(+) ',
                     [ APOReleases_ID  ]);
end;

procedure TFrmMatException.JumptoPO2Click(Sender: TObject);
begin
  with ActiveDetailDataSet do
    case PageControl1.ActivePage.PageIndex of
     0: JumpDirect( iq_JumpToPO, FieldByName('PO_DETAIL_ID').asInteger );
     4: JumpDirect( iq_JumpToPO, FieldByName('DETAIL_ID').asInteger );
    end;
end;


procedure TFrmMatException.JumpToPoHistory1Click(Sender: TObject);
begin
  { TODO -oLema : Dependent on WC-7854 Po - po_hist_ex}
//  TFrmPO_Hist_Ex.DoShowModal( wwQryXcpItemsARINVT_ID.asFloat );  {po_hist_ex.pas}
end;

procedure TFrmMatException.GetTotalQtyEarliestShouldArrive( var AQty: Real; var ADate: TDateTime );
begin
  AQty := wwQryXcpItemsLEFT_TO_ORDER.asFloat;
  ADate:= Date();
  with QryXcptDtl do
  try
    DisableControls;
    Reopen(QryXcptDtl);
    while not Eof do
    begin
      if QryXcptDtlSHOULD_ARRIVE.asDateTime < ADate then
         ADate:= QryXcptDtlSHOULD_ARRIVE.asDateTime;
      // AQty:= AQty + QryXcptDtlQTY.asFloat;
      Next;
    end;
  finally
    EnableControls;
  end;
end;


procedure TFrmMatException.AddBatchToPOByVendorClick(Sender: TObject);
var
  APO_ID: Real;
begin
  FIsModeAddBatchOfItemsToPo:= TRUE;
  try
    // put the items in the list
    PreparePOItemInfoList( srchXcpItems );
    if FPOItemsList.Count = 0 then
       EXIT;

    // validate and assign default vendor
    ValidateAddMoreInfoToPO;

    // get PO ID
    FPOItem:= TPOItem( FPOItemsList[ 0 ]); // assign FPOItem that is referenced in the picklist before open to filter based on cost source id
    with PkPoByVendor do
      if Execute then
         APO_ID:= GetValue('ID')
      else
         EXIT;

    // add items to selected PO
    AddBatchOfItemsToPo( APO_ID );
  finally
    FIsModeAddBatchOfItemsToPo:= FALSE;
  end;
end;

procedure TFrmMatException.AddBatchOfItemsToPo( APO_ID: Real );
var
  I: Integer;
begin
  { TODO -oLema : Dependent on WC-7841 Po - Pomain}
(*
   for I:= 0 to FPOItemsList.Count - 1 do
   begin
     TPOItem( FPOItemsList[ I ]).EnsureDivisionEPlantOfItemMatch;
     FPOItem:= TPOItem( FPOItemsList[ I ]);
     Do_IQ_New_PO_Item_With_Releases( APO_ID, FPOItem )  {PO_main.pas}
   end;
*)
end;


procedure TFrmMatException.ValidateAddMoreInfoToPO;
var
  I: Integer;
  ACostObjectSource: string;
  ACostObject_ID   : Real;
  ACargo: TPOItem;
  AArinvt_Vendors_ID: Real;
begin
  FAddBatchOfItemsVendor_ID:= 0;
  FAddBatchOfItemsArinvt_Vendor_ID:= 0;

  for I:= 0 to FPOItemsList.Count - 1 do
  begin
    ACargo:= TPOItem( FPOItemsList[I]);

    AArinvt_Vendors_ID:= 0;
    if I = 0 then
    begin
      FAddBatchOfItemsVendor_ID:= GetAKAVendorBasedOnArinvt_ID( ACargo.FArinvt_ID, AArinvt_Vendors_ID );      // Vendor_ID. 0 will trigger vendor picklist
      if (FAddBatchOfItemsVendor_ID = 0) and not PickAnyVendor( AArinvt_Vendors_ID ) then
          ABORT;
      ACostObjectSource:= ACargo.FCost_Object_Source;
      ACostObject_ID   := ACargo.FCost_Object_ID;
      FAddBatchOfItemsArinvt_Vendor_ID:= AArinvt_Vendors_ID;
    end;

    {check if vendors are matching compared to the 1st line. Note 1st line may have different vendor from the displayed because we check AKA on-fly above}
    if (I > 0) and (ACargo.FVendor_ID > 0) then
       IQAssert( FAddBatchOfItemsVendor_ID = ACargo.FVendor_ID, 'All selected items must be associated with the same vendor - operation aborted.');

    IQAssert( (ACostObjectSource = ACargo.FCost_Object_Source) and (ACostObject_ID = ACargo.FCost_Object_ID),
              'All selected items must belong to the same cost source - operation aborted.');

    if (I > 0) and (ACargo.FVendor_ID > 0) then
      AArinvt_Vendors_ID:= SelectValueFmtAsFloat('select a.id from arinvt_vendors a where a.arinvt_id = %f and a.vendor_id = %f order by id',
                                                 [ ACargo.FArinvt_ID,
                                                   ACargo.FVendor_ID ]);
    // add arinvt_vendors_id to each future po line
    if AArinvt_Vendors_ID > 0 then
      ACargo.FArinvt_Vendors_ID:= AArinvt_Vendors_ID;
  end;

  // with srchXcpItems.wwDBGrid, Datasource.Dataset do
  // begin
  //   IQAssert( SelectedList.Count > 0, 'No records selected - operation aborted');
  //   for I:= 0 to SelectedList.Count - 1 do
  //   begin
  //     GotoBookmark(SelectedList.Items[ i ]);
  //     // IQAssert( wwQryXcpItemsVENDOR_ID.asFloat > 0, 'Vendor is not assigned - operation aborted');
  //     if I = 0 then
  //     begin
  //       // FAddBatchOfItemsVendor_ID:= wwQryXcpItemsVENDOR_ID.asFloat;
  //       FAddBatchOfItemsVendor_ID:= GetAKAVendorBasedOnArinvt_ID( wwQryXcpItemsARINVT_ID.asFloat, FAddBatchOfItemsArinvt_Vendor_ID );      // Vendor_ID. 0 will trigger vendor picklist
  //       if (FAddBatchOfItemsVendor_ID = 0) and not PickAnyVendor( FAddBatchOfItemsVendor_ID ) then
  //           ABORT;
  //       ACostObjectSource:= wwQryXcpItemsCOST_OBJECT_SOURCE.asString;
  //       ACostObject_ID   := wwQryXcpItemsCOST_OBJECT_ID.asFloat;
  //     end;
  //
  //     {check if vendors are matching compared to the 1st line. Note 1st line may have different vendor from the displayed because we check AKA on-fly above}
  //     if (I > 0) and (wwQryXcpItemsVENDOR_ID.asFloat > 0) then
  //        IQAssert( FAddBatchOfItemsVendor_ID = wwQryXcpItemsVENDOR_ID.asFloat, 'All selected items must be associated with the same vendor - operation aborted.');
  //
  //     IQAssert( (ACostObjectSource = wwQryXcpItemsCOST_OBJECT_SOURCE.asString)
  //                and
  //               (ACostObject_ID = wwQryXcpItemsCOST_OBJECT_ID.asFloat),
  //               'All selected items must belong to the same cost source - operation aborted.');
  //   end;
  // end;
end;

procedure TFrmMatException.PkPoByVendorIQModify(Sender: TObject; var Action: TModalResult; var ResultValue: Variant);
begin
  CreatePO_AddItem( FAddBatchOfItemsVendor_ID, FAddBatchOfItemsArinvt_Vendor_ID );
  { to close PickList }
  Action:= mrABORT;
end;

procedure TFrmMatException.AlternateItem1Click(Sender: TObject);
var
  AArinvt_Alternate_ID: Real;

  // ---------------------------------------------------------------------------
  procedure _apply_alternate_to_workorder_allocation;
  begin
    if TFrmMatXcptAlternateWorkorderAlloc.DoShowModal(wwQryXcpItemsARINVT_ID.asFloat, wwQryXcpItemsDIVISION_ID.asFloat, wwQryXcpItemsCOST_OBJECT_ID.asFloat, wwQryXcpItemsCOST_OBJECT_SOURCE.asString ) then {mat_xcpt_alternate}   // mat_xcpt_alternate_wo_alloc.pas
       Reopen(QryWO);
  end;

  // ---------------------------------------------------------------------------
  procedure _apply_alternate_to_substitute_bom;
  begin
    if TFrmInvAlternateItemsPk.DoShowModal( wwQryXcpItemsARINVT_ID.asFloat, AArinvt_Alternate_ID ) then  {inv_alternate_items_pk}
       if TFrmMatXcptAlternate.DoShowModal( AArinvt_Alternate_ID, wwQryXcpItemsDIVISION_ID.asFloat, wwQryXcpItemsCOST_OBJECT_ID.asFloat, wwQryXcpItemsCOST_OBJECT_SOURCE.asString ) then {mat_xcpt_alternate}
          Reopen(QryWO);
  end;

// -----------------------------------------------------------------------------
begin
  if wo_misc.IsAlternateAppliedToWorkorder then
     _apply_alternate_to_workorder_allocation
  else
     _apply_alternate_to_substitute_bom;
end;

procedure TFrmMatException.QryWOCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if QryWOPTOPER_ID.asFloat > 0 then
  begin
     A:= SelectValueArrayFmt('select s.opno, s.opdesc from ptoper p, sndop s where p.id = %f and p.sndop_id = s.id', [ QryWOPTOPER_ID.asFloat ]);
     if VarArrayDimCount( A ) > 0 then
     begin
       QryWOOpNo.asString  := A[ 0 ];
       QryWOOpDesc.asString:= A[ 1 ];
     end;
  end;

  if QryWOALTERNATE_ARINVT_ID.asFloat > 0 then
      QryWOAlternateItemNo.asString:= SelectValueByID('itemno', 'arinvt', QryWOALTERNATE_ARINVT_ID.asFloat);
end;

procedure TFrmMatException.PkArinvtVendorBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('arinvt_id').asFloat:= FArinvt_ID_ForArinvtVendorPkList;
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID_ForArinvtVendorPkList);
end;

procedure TFrmMatException.ReceivingDays1Click(Sender: TObject);
begin
  RecvDays.DoRecvDays;
end;

procedure TFrmMatException.VendorRFQ1Click(Sender: TObject);
var
  ACargo: TVendor_RFQ_Cargo;
begin
  ACargo.Source   := 'XCPT_MAT_REQ';                  // ven_rfq_share.pas
  ACargo.Arinvt_ID:= wwQryXcpItemsARINVT_ID.asFloat;
  ACargo.Qty      := wwQryXcpItemsQTY.asFloat;
  { TODO -oLema : Dependent on WC-9510 vendor_rfq - ven_rfq_main}
//  TFrmVendorRFQMain.DoShow( Application, ACargo );    // ven_rfq_main.pas
end;

procedure TFrmMatException.JumpToMPS1Click(Sender: TObject);
begin
  { TODO -oLema : Dependent on WC-6821 Iqmps - MPS_Excep }
//  MPS_Excep.DoMPSExceptions( wwQryXcpItemsARINVT_ID.asFloat );
end;


procedure TFrmMatException.DisplaySuggestedActionFilter;
begin
  if not Assigned(FFilterSuggestedActionList) then
     EXIT;

  case FFilterSuggestedActionList.Count of
     0: edSuggestedActionFilter.Text:= '<Filter not assigned>';
     1: edSuggestedActionFilter.Text:= FFilterSuggestedActionList[0];
  else
     edSuggestedActionFilter.Text:= Format('%d suggested System.Actions selected', [ FFilterSuggestedActionList.Count ]);
  end;
end;

procedure TFrmMatException.sbtnSuggestedActionFilterClick(Sender: TObject);
begin
  { TODO -oLema : Dependent on WC-5429 Capacity - mat_xcpt_suggested_acion_dlg }
(*
  if TFrmMatXcptSuggestedActionDlg.DoShowModal( self, FFilterSuggestedActionList ) then  // mat_xcpt_suggested_acion_dlg.pas
  begin
    AssignSuggestedActionFilter;
    Reopen(wwQryExist_Ideal_Items);
  end;
*)
end;

procedure TFrmMatException.wwQryExist_Ideal_ItemsAfterOpen(DataSet: TDataSet);
begin
  DisplaySuggestedActionFilter;
end;

procedure TFrmMatException.AssignSuggestedActionFilter;
var
  I: Integer;

  function FormatSuggestedActionStrings(): string;
  var
    I: Integer;
  begin
    Result:= '';
    for I:= 0 to FFilterSuggestedActionList.Count - 1 do
    begin
      if I = 0 then
         Result:= Format('''%s''', [ FFilterSuggestedActionList[ I ]])
      else
         Result:= Result + Format(', ''%s''', [ FFilterSuggestedActionList[ I ]])
    end;
  end;

  function GetIndexOfString( AStrings: TStrings; Value: string ): Integer;
  var
    I: Integer;
  begin
    for I:= 0 to AStrings.Count - 1 do
      if Trim( AStrings[ I ]) = Trim(Value) then
      begin
         Result:= I;
         EXIT;
      end;
    Result:= -1;
  end;

begin
  with wwQryExist_Ideal_Items do
  begin
    Close;

    // clear first
    I:= GetIndexOfString( SQL, '/* START SUGGESTED_ACTION FILTER */');
    IQAssert( I > -1, 'Unable to find SUGGESTED_ACTION FILTER');
    I:= I + 1;
    repeat
      if (Trim(SQL[ I ]) = '/* END SUGGESTED_ACTION FILTER */' ) then BREAK;
      SQL.Delete(I);
    until (I > SQL.Count - 1);

    // assign filter
    if FFilterSuggestedActionList.Count = 0 then
       SQL.Insert( I, 'and 1 = 1' ) // no filter
    else
       SQL.Insert( I, Format(' and v.action in (%s)', [ FormatSuggestedActionStrings()]));
  end;
end;

function TFrmMatException.PickAnyVendor( var AVendor_ID: Real ): Boolean;
begin
  Result:= PkVendor.Execute;
  if Result then
     AVendor_ID:= PkVendor.GetValue('ID');
end;

procedure TFrmMatException.JumpToInventory5Click(Sender: TObject);
begin
  IQJumpOutsrcInv.Execute
end;

procedure TFrmMatException.JumpToInventoryAvailability1Click(Sender: TObject);
begin
  IQJumpAvail.Execute;
end;


procedure TFrmMatException.PkOutsourceBOMBeforeOpen(DataSet: TDataSet);
begin
  // with TFDQuery(DataSet) do
  // begin
  //   ParamByName('arinvt_id').asFloat:= QryOutsourceBelowMinARINVT_ID.asFloat;
  //   ParamByName('vendor_id').asFloat:= QryOutsourceBelowMinVENDOR_ID.asFloat;
  // end;
  AssignQueryParamValue(DataSet, 'arinvt_id', QryOutsourceBelowMinARINVT_ID.asFloat );
  AssignQueryParamValue(DataSet, 'vendor_id', QryOutsourceBelowMinVENDOR_ID.asFloat);
end;


procedure TFrmMatException.JumpToOutsourceBOM1Click(Sender: TObject);
var
  AStandard_ID: Real;
begin
  AStandard_ID:= 0;

  if SelectValueFmtAsFloat('select outsrc_misc.get_bom_count_intransit( %f, %f ) from dual',
               [ QryOutsourceBelowMinARINVT_ID.asFloat,
                 QryOutsourceBelowMinVENDOR_ID.asFloat ]) = 1 then
     AStandard_ID:= SelectValueFmtAsFloat('select distinct s.id                    '+
                              '  from standard s,                      '+
                              '       partno p,                        '+
                              '       ptoper,                          '+
                              '       opmat                            '+
                              ' where s.id = p.standard_id             '+
                              '   and rtrim(s.cntr_type) = (select rtrim(vendorno) from vendor where id = %f) '+
                              '   and p.id = ptoper.partno_id          '+
                              '   and ptoper.sndop_id = opmat.sndop_id '+
                              '   and opmat.arinvt_id = %f             ',
                              [  QryOutsourceBelowMinVENDOR_ID.asFloat,
                                 QryOutsourceBelowMinARINVT_ID.asFloat ])
   else with PkOutsourceBOM do
     if Execute then
        AStandard_ID:= GetValue('id');

  if AStandard_ID = 0 then
     EXIT;

  JumpDirect( iq_JumpToBom, Trunc(AStandard_ID));
end;


procedure TFrmMatException.JumpToShipOrder1Click(Sender: TObject);
var
  AOrders_ID: Real;
begin
  AOrders_ID:= 0;

  // if SelectValueFmtAsFloat('select outsrc_misc.get_orders_count_intransit( %f, %f ) from dual',
  //              [ QryOutsourceBelowMinARINVT_ID.asFloat,
  //                QryOutsourceBelowMinVENDOR_ID.asFloat ]) = 1 then
  //    AOrders_ID:= SelectValueFmtAsFloat('select o.id                                                                '+
  //                           '  from orders o,                                                           '+
  //                           '       arcusto a                                                           '+
  //                           ' where o.arcusto_id = a.id                                                 '+
  //                           '   and a.vendor_id_outsource = %f                                          '+
  //                           '   and exists                                                              '+
  //                           '       (select 1 from ord_detail where orders_id = o.id and arinvt_id = %f)',
  //                           [ QryOutsourceBelowMinVENDOR_ID.asFloat,
  //                             QryOutsourceBelowMinARINVT_ID.asFloat ])
  //  else
  with PkOutsourceShipOrder do
  if Execute then
     AOrders_ID:= GetValue('id');

  if AOrders_ID = 0 then
     EXIT;

  JumpDirect( iq_JumpToSalesOrder, Trunc(AOrders_ID));
end;

procedure TFrmMatException.popmOutsrcBelowMinPopup(Sender: TObject);
begin
  // 03-18-2015 future use.

  { TODO -oLema : FindMenuItem }
//  if Assigned(srchOutsourceBelowMin.FindMenuItem( CreateShipOrder1 )) then
//     srchOutsourceBelowMin.FindMenuItem( CreateShipOrder1 ).Visible:= FALSE;


  // 05-19-2015 EIQ-7173 -  allow creation of the ship orders only for Inventory Based Outsource
  if SelectValueAsFloat('select irv32_misc.is_inventory_based_ex from dual') = 0 then
     PkOutsourceShipOrder.OnIQModify:= nil;
end;

procedure TFrmMatException.CreateShipOrder1Click(Sender: TObject);
var
  ACargo: TMatExcepShipOrderCargo;
begin
  // 03-18-2015 future use.

  if QryOutsourceBelowMinID.asFloat = 0 then
     EXIT;

  ACargo:= TMatExcepShipOrderCargo.Create( 0) ;
  if not TFrmMatExcepShipOrder.DoShowModal( ACargo ) then  // mat_xcpt_ship_order.pas
     EXIT;

  ExecuteCommandFmt('begin                                            '+
            '  irv32_misc.manual_outsource_ship_order( %f,    '+  // v_arinvt_id
            '                                          %f,    '+  // v_vendor_id
            '                                          %.6f,  '+  // v_order_qty_in
            '                                          to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''));'+  // v_promise_date
            'end;                                             ',
            [ QryOutsourceBelowMinARINVT_ID.asFloat,
              QryOutsourceBelowMinVENDOR_ID.asFloat,
              ACargo.Qty,
              FormatDateTime('mm/dd/yyyy hh:nn:ss', ACargo.PromiseDate )]);

  RefreshDataSetByID(QryOutsourceBelowMin);
end;


procedure TFrmMatException.PkOutsourceShipOrderIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrCancel;

  // 'About to create manual outsource shipping order.'#13#13'Please confirm to continue';
  if IQMS.Common.Dialogs.IQConfirmYNWithSecurity( capacity_rscstr.cTXT0000011, 'PkOutsourceShipOrderNewRecord', TRUE ) then
  begin
     ResultValue:= CreateManualOutsourceShipOrder();
     if ResultValue > 0 then
        Action:= mrOK;
  end;
end;

function TFrmMatException.CreateManualOutsourceShipOrder: Real;
begin
  Result:= 0;
  if (QryOutsourceBelowMinARINVT_ID.asFloat = 0) or (QryOutsourceBelowMinVENDOR_ID.asFloat = 0) or (QryOutsourceBelowMinMAX_ORDER_QTY.asFloat = 0) then
     EXIT;

  with procManualShipOrder do
  begin
    ParamByName('v_arinvt_id').asFmtBCD     := QryOutsourceBelowMinARINVT_ID.asFloat;
    ParamByName('v_vendor_id').asFmtBCD     := QryOutsourceBelowMinVENDOR_ID.asFloat;
    ParamByName('v_order_qty_in').asFmtBCD  := QryOutsourceBelowMinMAX_ORDER_QTY.asFloat;
    ParamByName('v_promise_date').asDateTime:= SelectValueAsDateTime('select trunc(sysdate) from dual');

    ExecProc;
    Result:= ParamByName('result').asFloat;
  end;
end;

procedure TFrmMatException.ShowAllVendorPriceBreaks1Click(Sender: TObject);
begin
  ShowAllVendorAkaBreaks(QryXcptDtlARINVT_ID.asFloat, QryXcptDtlQTY.asFloat);   {VendorAKABreaks.pas}
end;



end.


