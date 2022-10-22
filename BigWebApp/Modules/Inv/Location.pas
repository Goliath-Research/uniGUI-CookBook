unit Location;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Mask,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  IQMS.WebVcl.PkHideManager,
  IQMS.WebVcl.UserDefinedLabel,
  IQMS.WebVcl.UDComboBox,
  IQMS.WebVcl.RepDef,
  Vcl.Dialogs,
  //IQMS.Common.UserMessages,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Stan.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
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
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  { TNewLocationFlags }
  TNewLocationFlags = packed record
    NonConforming: Boolean;
  end;

  { TLocationsTable }
  TLocationsTable = class(TUniForm)
    DBNavigator: TUniDBNavigator;
    Panel1: TUniPanel;
    SrcLocations: TDataSource;
    wwQryDivisionLookup: TFDQuery;
    wwQryDivisionLookupID: TBCDField;
    wwQryDivisionLookupNAME: TStringField;
    wwQryDivisionLookupEPLANT_NAME: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryEdi: TFDQuery;
    QryEdiID: TBCDField;
    QryEdiDESCRIP: TStringField;
    Contents1: TUniMenuItem;
    PkLoc: TIQWebHPick;
    PkLocID: TBCDField;
    PkLocLOCATION: TStringField;
    PkLocDESCRIPTION: TStringField;
    PkLocEPLANT_NAME: TStringField;
    PkLocDIVISION: TStringField;
    spSearch: TUniSpeedButton;
    UpdateSQLLocations: TFDUpdateSQL;
    Bevel1: TUniPanel;
    PkLocPATH: TBCDField;
    QryLocations: TFDQuery;
    QryLocationsLOC_DESC: TStringField;
    QryLocationsDESCRIP: TStringField;
    QryLocationsSTART_ROW: TBCDField;
    QryLocationsID: TBCDField;
    QryLocationsVMI: TStringField;
    QryLocationsNON_CONFORM: TStringField;
    QryLocationsSHIP_DEFAULT: TStringField;
    QryLocationsEPLANT_ID: TBCDField;
    QryLocationsSTART_COL: TBCDField;
    QryLocationsEND_ROW: TBCDField;
    QryLocationsEND_COL: TBCDField;
    QryLocationsSTATUS: TStringField;
    QryLocationsDIVISION_ID: TBCDField;
    QryLocationsDISABLE_DEL_EMPTY: TStringField;
    QryLocationsTRANSIT: TStringField;
    QryLocationsNO_SHIP: TStringField;
    QryLocationsNO_BACKFLUSH: TStringField;
    QryLocationsRECV_DEFAULT: TStringField;
    QryLocationsSHIP_DOCK: TStringField;
    QryLocationsPKG_COUNT: TBCDField;
    QryLocationsDivisionName: TStringField;
    QryLocationsEPLANT: TStringField;
    Options1: TUniMenuItem;
    ViewAll1: TUniMenuItem;
    ViewActive1: TUniMenuItem;
    ViewInactive1: TUniMenuItem;
    PkLocACTIVE_TYPE: TStringField;
    QryLocationsPK_HIDE: TStringField;
    QryLocationsBUILDING: TStringField;
    QryLocationsCUSER1: TStringField;
    QryLocationsCUSER2: TStringField;
    popmUserDefined: TUniPopupMenu;
    DefineLabelText1: TUniMenuItem;
    QryLocationsNON_CONFORM_ALLOCATABLE: TStringField;
    QryLocationsAUTO_DISPO_DEFAULT_LOC: TStringField;
    N1: TUniMenuItem;
    Zones1: TUniMenuItem;
    PkInvZone: TIQWebHPick;
    PkInvZoneID: TBCDField;
    PkInvZoneCODE: TStringField;
    PkInvZoneDESCRIP: TStringField;
    QryLocationsINV_ZONE_ID: TBCDField;
    QryLocationsInvZoneCodeLO: TStringField;
    pnlHeader: TUniPanel;
    pgctrlMain: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    pnlGrid: TUniPanel;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    wwDBComboDlg1: TUniEdit;
    Grid: TIQUniGridControl;
    PnlFormViewInner: TUniPanel;
    PnlFormViewClient01: TUniPanel;
    Splitter4: TUniSplitter;
    PnlFormViewClient02: TUniPanel;
    Splitter5: TUniSplitter;
    PnlFormViewLeft01: TUniPanel;
    Splitter6: TUniSplitter;
    PnlFormViewClient04: TUniPanel;
    Splitter7: TUniSplitter;
    PnlFormViewLeft02: TUniPanel;
    PnlFormViewClient05: TUniPanel;
    PnlFormViewClient03: TUniPanel;
    Splitter8: TUniSplitter;
    PnlFormViewLeft03: TUniPanel;
    PnlFormViewClient06: TUniPanel;
    Label1: TUniLabel;
    lblZone: TUniLabel;
    IQUDComboBoxBuilding: TIQWebUDComboBox;
    wwDBComboDlgZoneLO: TUniEdit;
    Splitter9: TUniSplitter;
    PnlAltToolbar: TUniPanel;
    Panel3: TUniPanel;
    Shape3: TUniPanel;
    Shape2: TUniPanel;
    Shape1: TUniPanel;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    PrintDialog1: TPrintDialog;
    IQRepDef1: TIQWebRepDef;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    dbeLocationDescrip: TUniDBEdit;
    wwDBComboDlgEplantOnForm: TUniEdit;
    Label6: TUniLabel;
    Label12: TUniLabel;
    dbePickPath: TUniDBEdit;
    wwDBComboDlgLocationTypeDescrip: TUniEdit;
    Label13: TUniLabel;
    Label14: TUniLabel;
    Label15: TUniLabel;
    Label16: TUniLabel;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    DBEdit6: TUniDBEdit;
    QryLocationsLOCATION_TYPE_ID: TBCDField;
    QryLocationsLocationTypeDescrip: TStringField;
    QryLocationsLENGTH: TFloatField;
    QryLocationsWIDTH: TFloatField;
    QryLocationsHEIGHT: TFloatField;
    QryLocationsWEIGHT: TFloatField;
    QryLocationsITEMS_PER_LOC: TStringField;
    QryLocationsALLOW_MIXED_LOTS: TStringField;
    QryLocationsMAX_CASE_STACK: TFloatField;
    QryLocationsMAX_PALLET_STACK: TFloatField;
    QryLocationsALLOCATE_SEQ: TStringField;
    sbtnToggle: TUniSpeedButton;
    PkLocationType: TIQWebHPick;
    PkLocationTypeID: TBCDField;
    PkLocationTypeDESCRIP: TStringField;
    PkLocationTypeLENGTH: TBCDField;
    PkLocationTypeWIDTH: TBCDField;
    PkLocationTypeHEIGHT: TBCDField;
    PkLocationTypeWEIGHT: TBCDField;
    QryLocationsEplantDisp: TStringField;
    QryLocationsLOC_AISLE: TStringField;
    QryLocationsLOC_BAY: TStringField;
    QryLocationsLOC_LEVEL: TStringField;
    dbeLocation: TUniDBEdit;
    PkLocLOC_AISLE: TStringField;
    PkLocLOC_BAY: TStringField;
    PkLocLOC_LEVEL: TStringField;
    lblDivision: TUniLabel;
    wwDBLookupComboDivision: TUniDBLookupComboBox;
    Label20: TUniLabel;
    Label21: TUniLabel;
    Label22: TUniLabel;
    wwDBComboDlgZoneAL: TUniEdit;
    wwDBComboDlgZoneDZ: TUniEdit;
    wwDBComboDlgZoneWK: TUniEdit;
    QryLocationsInvZoneCodeAL: TStringField;
    QryLocationsInvZoneCodeDZ: TStringField;
    QryLocationsInvZoneCodeWK: TStringField;
    QryLocationsAL_INV_ZONE_ID: TBCDField;
    QryLocationsDZ_INV_ZONE_ID: TBCDField;
    QryLocationsWK_INV_ZONE_ID: TBCDField;
    DBCheckBox1: TUniDBCheckBox;
    QryLocationsLOC_STATUS: TStringField;
    Label23: TUniLabel;
    wwDBComboBoxLocStatus: TUniDBComboBox;
    QryLocationsINV_AISLES_ID: TBCDField;
    PkAisle: TIQWebHPick;
    PkAisleID: TBCDField;
    PkAisleNAME: TStringField;
    PkAisleDIVISION_NAME: TStringField;
    PkAisleEPLANT_ID: TBCDField;
    Aisles1: TUniMenuItem;
    Label24: TUniLabel;
    DBEdit7: TUniDBEdit;
    IQUDComboBoxBuildingOnGrid: TIQWebUDComboBox;
    wwDBComboBoxLocStatusOnGrid: TUniDBComboBox;
    wwDBComboDlgLo_OnGrid: TUniEdit;
    wwDBComboDlgAl_OnGrid: TUniEdit;
    wwDBComboDlgDz_OnGrid: TUniEdit;
    wwDBComboDlgWk_OnGrid: TUniEdit;
    wwDBComboDlgLocTypeOnGrid: TUniEdit;
    pgctrlDetails: TUniPageControl;
    tabGeneral: TUniTabSheet;
    tabStaging: TUniTabSheet;
    pnlDetails: TUniPanel;
    Splitter2: TUniSplitter;
    PnlCheckBoxes: TUniPanel;
    pnlOptions: TUniPanel;
    dbchkVMI: TUniDBCheckBox;
    dbchkNonConform: TUniDBCheckBox;
    dbchkShipDesignator: TUniDBCheckBox;
    dbchkAutoDelete: TUniDBCheckBox;
    dbchkTransit: TUniDBCheckBox;
    dbchkNoShip: TUniDBCheckBox;
    dbchkNoBackflush: TUniDBCheckBox;
    dbchkRecv: TUniDBCheckBox;
    dbchkShipDock: TUniDBCheckBox;
    dbchNonConformAllocatable: TUniDBCheckBox;
    dbchDispoDesignator: TUniDBCheckBox;
    PnlGeneralCllient01: TUniPanel;
    Splitter3: TUniSplitter;
    PnlGeneralLeft01: TUniPanel;
    Label7: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    IQUserDefLabel1: TIQWebUserDefLabel;
    IQUserDefLabel2: TIQWebUserDefLabel;
    Label17: TUniLabel;
    Label18: TUniLabel;
    Label19: TUniLabel;
    PnlGeneralCllient02: TUniPanel;
    dbeMaxCaseStack: TUniDBEdit;
    dbeMaxPalletStack: TUniDBEdit;
    wwDBComboBoxAllocSeq: TUniDBComboBox;
    wwDBComboBoxItemsPerLocation: TUniDBComboBox;
    dbchkAlloMixedLots: TUniDBCheckBox;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    dbeLocAisle: TUniEdit;
    dbeLocBay: TUniDBEdit;
    dbeLocLevel: TUniDBEdit;
    tabMilkRun: TUniTabSheet;
    QryLocationsLocationTypeSubType: TStringField;
    pnlStagingIn: TUniPanel;
    Panel18: TUniPanel;
    Splitter1: TUniSplitter;
    PnlToolbarRawMatStaging2: TUniPanel;
    navStagingOut: TUniDBNavigator;
    PnlToolbarRawMatStaging1: TUniPanel;
    navStagingIn: TUniDBNavigator;
    gridStagingIn: TIQUniGridControl;
    gridStagingOut: TIQUniGridControl;
    SrcStagingIN: TDataSource;
    QryStagingIN: TFDQuery;
    QryStagingINEQNO: TStringField;
    QryStagingINCNTR_DESC: TStringField;
    QryStagingINPICKUP_PACKAGES: TBCDField;
    QryStagingINPICKUP_PALLETS: TBCDField;
    QryStagingINID: TBCDField;
    QryStagingINLOCATIONS_ID_IN: TBCDField;
    wwDBComboDlgWorkcenterTransIN: TUniEdit;
    PkWorkCenterStagingIN: TIQWebHPick;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField1: TStringField;
    PkWorkCenterStagingINID: TBCDField;
    PkWorkCenterStagingINEPLANT_ID: TBCDField;
    PkWorkCenterStagingINLOC_DESC_IN: TStringField;
    PkWorkCenterStagingINLOC_DESC_OUT: TStringField;
    PkWorkCenterStagingINLOCATIONS_ID_IN: TBCDField;
    PkWorkCenterStagingINLOCATIONS_ID: TBCDField;
    PkWorkCenterStagingOUT: TIQWebHPick;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField1: TBCDField;
    FloatField2: TBCDField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField3: TBCDField;
    FloatField4: TBCDField;
    SrcStagingOUT: TDataSource;
    QryStagingOUT: TFDQuery;
    QryStagingOUTID: TBCDField;
    QryStagingOUTEQNO: TStringField;
    QryStagingOUTCNTR_DESC: TStringField;
    QryStagingOUTLOCATIONS_ID: TBCDField;
    QryStagingOUTSTAGING_HRS: TFMTBCDField;
    QryStagingOUTSTAGING_HRS_PARAMS: TFMTBCDField;
    wwDBComboDlgWorkcenterTransOUT: TUniEdit;
    PnlToolbar_MilkRunStaging: TUniPanel;
    NavMilkRun: TUniDBNavigator;
    gridMilkRun: TIQUniGridControl;
    SrcMilkRun: TDataSource;
    QryMilkRun: TFDQuery;
    QryMilkRunORDERNO: TStringField;
    QryMilkRunITEMNO: TStringField;
    QryMilkRunDESCRIP: TStringField;
    QryMilkRunREV: TStringField;
    QryMilkRunCLASS: TStringField;
    QryMilkRunDESCRIP2: TStringField;
    QryMilkRunCUSTNO: TStringField;
    QryMilkRunCOMPANY: TStringField;
    QryMilkRunATTN: TStringField;
    QryMilkRunID: TBCDField;
    PkOrdDetail: TIQWebHPick;
    PkOrdDetailID: TBCDField;
    PkOrdDetailORDERNO: TStringField;
    PkOrdDetailITEMNO: TStringField;
    PkOrdDetailDESCRIP: TStringField;
    PkOrdDetailREV: TStringField;
    PkOrdDetailCLASS: TStringField;
    PkOrdDetailDESCRIP2: TStringField;
    PkOrdDetailCUSTNO: TStringField;
    PkOrdDetailCOMPANY: TStringField;
    PkOrdDetailATTN: TStringField;
    PkOrdDetailLOC_DESC: TStringField;
    wwDBComboDlgMilkRun: TUniEdit;
    QryMilkRunMILK_RUN_LOCATIONS_ID: TBCDField;
    QryStagingINTRANS_PRIORITY: TBCDField;
    LocationTypes1: TUniMenuItem;
    QryLocationsCYCLE_COUNT_DATE: TDateTimeField;
    lblLastCycleCount: TUniLabel;
    dbeCycleCountDate: TUniDBEdit;
    lblReservation: TUniLabel;
    QryLocationsRESERVATION_SOURCE_DESCRIP: TStringField;
    dbeReservation: TUniDBEdit;
    Parameters1: TUniMenuItem;
    N2: TUniMenuItem;
    sbtnTransPlan: TUniSpeedButton;
    PkInvTransPlan: TIQWebHPick;
    PkInvTransPlanID: TBCDField;
    PkInvTransPlanSOURCE_MODULE: TStringField;
    PkInvTransPlanSOURCE: TStringField;
    PkInvTransPlanKIND: TStringField;
    PkInvTransPlanARINVT_ID: TBCDField;
    PkInvTransPlanCLASS: TStringField;
    PkInvTransPlanITEMNO: TStringField;
    PkInvTransPlanDESCRIP: TStringField;
    PkInvTransPlanDESCRIP2: TStringField;
    PkInvTransPlanREV: TStringField;
    PkInvTransPlanQTY: TFMTBCDField;
    PkInvTransPlanPK_UNIT_TYPE: TStringField;
    PkInvTransPlanUNITS: TBCDField;
    QryLocationsNON_ALLOCATABLE: TStringField;
    dbchkNonAllocatable: TUniDBCheckBox;
    SR: TIQWebSecurityRegister;
    dbchkShelfLife2NoProcess: TUniDBCheckBox;
    QryLocationsSHELF_LIFE2_NO_PROCESS: TStringField;
    lblDefaultNonConfirmCode: TUniLabel;
    cmbDefaultNonConfirmCode: TUniEdit;
    QryLocationsNON_CONFORM_CODE: TStringField;
    PkNonConform: TIQWebHPick;
    PkNonConformID: TBCDField;
    PkNonConformCODE: TStringField;
    PkNonConformDESCRIP: TStringField;
    PNonConformCode: TUniPopupMenu;
    SelectNonConformCode1: TUniMenuItem;
    ClearNonConformCode1: TUniMenuItem;
    QryLocationsNON_CONFORM_ID: TBCDField;
    sbFormView: TUniScrollBox;
    PnlFormView: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QryLocationsBeforePost(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure wwTable1BeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlg1CustomDlg(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    {
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    }
    procedure spSearchClick(Sender: TObject);
    procedure QryLocoationsNewRecord(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryLocationsBeforeOpen(DataSet: TDataSet);
    procedure PkLocBeforeOpen(DataSet: TDataSet);
    procedure FilterPKHide(Sender: TObject);
    procedure DefineLabelText1Click(Sender: TObject);
    procedure dbchkNonConformClick(Sender: TObject);
    procedure SrcLocationsDataChange(Sender: TObject; Field: TField);
    procedure Zones1Click(Sender: TObject);
    procedure wwDBComboDlgZoneLOCustomDlg(Sender: TObject);
    procedure QryLocationsCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgZoneLOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure sbtnToggleClick(Sender: TObject);
    procedure ClearLocationType(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure wwDBComboDlgLocationTypeDescripCustomDlg(Sender: TObject);
    procedure PkLocIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkInvZoneBeforeOpen(DataSet: TDataSet);
    procedure dbeLocAisleCustomDlg(Sender: TObject);
    procedure Aisles1Click(Sender: TObject);
    procedure PostParent(DataSet: TDataSet);
    procedure wwDBComboDlgWorkcenterTransINCustomDlg(Sender: TObject);
    {
    procedure PkWorkCenterStagingINIQDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PkWorkCenterStagingOUTIQDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    }
    procedure QryStagingINBeforePost(DataSet: TDataSet);
    procedure wwDBComboDlgWorkcenterTransOUTCustomDlg(Sender: TObject);
    procedure QryStagingOUTBeforePost(DataSet: TDataSet);
    procedure QryStagingINUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryStagingOUTUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryMilkRunUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure wwDBComboDlgMilkRunCustomDlg(Sender: TObject);
    {
    procedure PkOrdDetailIQDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    }
    procedure QryMilkRunAfterInsert(DataSet: TDataSet);
    procedure QryStagingINAfterInsert(DataSet: TDataSet);
    procedure QryStagingOUTAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure QryLocationsBeforeDelete(DataSet: TDataSet);
    procedure LocationTypes1Click(Sender: TObject);
    procedure Parameters1Click(Sender: TObject);
    procedure sbtnTransPlanClick(Sender: TObject);
    procedure PkInvTransPlanBeforeOpen(DataSet: TDataSet);
    procedure SelectNonConformCode1Click(Sender: TObject);
    procedure ClearNonConformCode1Click(Sender: TObject);
    procedure cmbDefaultNonConfirmCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SRAfterApply(Sender: TObject);
    procedure QryLocationsBeforeEdit(DataSet: TDataSet);
    procedure QryLocationsAfterCancel(DataSet: TDataSet);
  private
    { private declarations }
    FPkHideManager: TIQWebPkHideManager;
    FPkListZoneType: string;
    FFlags: TNewLocationFlags;
    FLastNewID: Real;
    FRECV_DEFAULT_BeforeEdit: string;
    //procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure ValidateLocationStatus(ALocation_ID: Real;
      ANewLoc_Status: string);
    procedure UpdateDimLabels;
    {
    procedure ColorWorkCenterPicklist( Sender: TObject;
                                       const Rect: TRect;
                                       DataCol: Integer;
                                       Column: TColumn;
                                       State: TGridDrawState;
                                       AFieldName: string );
    }
    procedure AssignViaPicklist(APk: TIQWebHPick; ADataSet: TDataSet;
      AFieldName: string);
    function SameStagingOutLocation( ALocations_ID: Real; var AEqNo: string ): Boolean;
    procedure SetControls;
    procedure CheckClearRecvDefaultAlreadyAssigned;
  public
    { public declarations }
    //constructor Create( AOwner: TComponent; AID: Real = 0);
    class procedure ClearFlags(var AFlags: TNewLocationFlags);
    class procedure CopyFlags(const ASource: TNewLocationFlags;
      var ATarget: TNewLocationFlags);
    property PkHideManager: TIQWebPkHideManager read FPkHideManager write FPkHideManager;
    property Flags: TNewLocationFlags read FFlags;
    property LastNewID: Real read FLastNewID;
    class procedure DoShow( AID: Real = 0 );
  end;

procedure DoLocations(AID: Real = 0);
function DoNewLocation(var ANewLocationsID: Real): Boolean; overload;
function DoNewLocation(var ANewLocationsID: Real;
  const AFlags: TNewLocationFlags): Boolean; overload;

function IsNonConform(const ALocationsID: Real): Boolean;


implementation

{$R *.DFM}

uses
   IQMS.Common.ConfirmWithSecurity,
  //inv_aisles,
  inv_loc_params,
  inv_location_type,
  inv_non_empty_fgmulti,
  inv_rscstr,
  inv_trans_plan_base,
  inv_trans_share,
  inv_zones,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  //iqsecins,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.COmmon.SetPlant,
  IQMS.Common.SysShare,
  System.Math,
  System.Variants,
  IQMS.WebVcl.AutoSaveMan,
  uniBasicGrid,
  uniDBGrid;

const
  cnstAppendNew = 1;

procedure DoLocations(AID: Real = 0);
var
  FLocationsTable : TLocationsTable;
begin
  FLocationsTable:=TLocationsTable.Create(uniGUIApplication.UniApplication);
  if AID = -1 then
    //PostMessage( self.Handle, iq_Notify, cnstAppendNew, 0 )
  else
    LocateOrPicklist( FLocationsTable, AID, FLocationsTable.QryLocations, FLocationsTable.PkLoc );

 FLocationsTable.ShowModal;
end;

class procedure TLocationsTable.DoShow( AID: Real = 0 );
var
   FLocationsTable : TLocationsTable;
begin
  FLocationsTable := TLocationsTable.Create(uniGUIApplication.UniApplication);
  with FLocationsTable do
  begin
    if AID = -1 then
    //PostMessage( self.Handle, iq_Notify, cnstAppendNew, 0 )
    else
      LocateOrPicklist( FLocationsTable, AID, QryLocations, PkLoc );
    show;
  end;
end;


function DoNewLocation(var ANewLocationsID: Real): Boolean;
var
  AFlags: TNewLocationFlags;
begin
  TLocationsTable.ClearFlags(AFlags);
  Result := DoNewLocation(ANewLocationsID, AFlags);
end;

function DoNewLocation(var ANewLocationsID: Real;
  const AFlags: TNewLocationFlags): Boolean;
begin
  Result := False;
  ANewLocationsID := 0;
  with TLocationsTable.Create(uniGUIApplication.UniApplication) do
    begin
      // Set the flags
      CopyFlags(AFlags, FFlags);
      // Show the form modally
      ShowModal;
      // Return true if a new ID was assigned for the new record, and the
      // record actually exists in the table.
      Result := (LastNewID > 0) and (SelectValueFmtAsFloat('SELECT 1 FROM locations ' +
        'WHERE id = %.0f', [LastNewID]) = 1);
      // If the record exists, then return the new id
      if Result then
        ANewLocationsID := LastNewID; // QryLocationsID.AsInteger;
    end;
end;

function IsNonConform(const ALocationsID: Real): Boolean;
begin
  Result := SelectValueFmtAsFloat('SELECT 1 FROM locations WHERE id = %.0f AND ' +
    'NVL(non_conform,''N'') = ''Y'' ', [ALocationsID]) = 1;
end;

{ TLocationsTable }
{
constructor TLocationsTable.Create(AOwner: TComponent; AID: Real);
begin
  FLastNewID := 0;
  inherited Create( AOwner );
  ClearFlags(FFlags);
  if AID = -1 then
    PostMessage( self.Handle, iq_Notify, cnstAppendNew, 0 )
  else
    LocateOrPicklist( self, AID, QryLocations, PkLoc );


end;
}
procedure TLocationsTable.FormCreate(Sender: TObject);
begin
  FPkHideManager:= TIQWebPkHideManager.Create(self);
  FPkHideManager.RegisterMenuItem( ViewAll1,      mvoAll      );
  FPkHideManager.RegisterMenuItem( ViewActive1  , mvoActive   );
  FPkHideManager.RegisterMenuItem( ViewInactive1, mvoInactive );

  //FPkHideManager.LoadFromRegistry;

  pgctrlMain.ActivePageIndex:= 0;
  IQMS.Common.Controls.AdjustPageControlToParent( pgctrlMain );
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlFormViewClient01);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlFormViewClient01);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlFormViewClient06);
  IQMS.Common.Controls.AutoSizeCheckBoxes(PnlFormViewClient06);
  IQMS.Common.Controls.AutoSizeCheckBoxes(pnlOptions);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlGeneralCllient01);
  IQMS.Common.Controls.AutoSizeCheckBoxes(PnlGeneralCllient01);
  { ToDo Resolve dependency
  with Grid do
  begin
    CheckReplaceDivisionOfWWSelected( Selected );
    ApplySelected;
  end;

  with wwDBLookupCombo1 do CheckReplaceDivisionOfWWSelected( Selected );
  lblDivision.Caption:= IQMS.Common.SysShare.CheckReplaceDivisionCaption( lblDivision.Caption );
  }
  IQSetTablesActive( TRUE, self );

  UpdateDimLabels;

  pgctrlDetails.ActivePageIndex:= 0;

  //EIQ-2133 Inventory Master Locations - without advanced WMS2 license, remove 'Aisles' and 'Location Types' in Options
  Aisles1.Visible := inv_trans_share.IsWMS2Licensed;
  LocationTypes1.Visible := inv_trans_share.IsWMS2Licensed;
  sbtnTransPlan.Visible := inv_trans_share.IsWMS2Licensed;
  cmbDefaultNonConfirmCode.Left := lblDefaultNonConfirmCode.Left +
    lblDefaultNonConfirmCode.Width + 16;
    FLastNewID := 0;
  ClearFlags(FFlags);
end;

procedure TLocationsTable.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [self, pnlHeader, Grid, PnlCheckboxes, pnlStagingIn,
    gridStagingIn, gridStagingOut, gridMilkRun]); // IQMS.Common.RegFrm.pas
  SetControls;
  if dbeLocation.CanFocus then
    dbeLocation.SetFocus;
  //iqsecins.EnsureSecurityInspectorOnTopOf(Self);
end;

procedure TLocationsTable.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TAutoSaveManager.Create(self).Execute;  // auto_save_man.pas

  IQRegFormWrite(Self, [self, pnlHeader, Grid, PnlCheckboxes, pnlStagingIn,
    gridStagingIn, gridStagingOut, gridMilkRun]); // IQMS.Common.RegFrm.pas
  FPkHideManager.SaveToRegistry;
end;

procedure TLocationsTable.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

class procedure TLocationsTable.ClearFlags(var AFlags: TNewLocationFlags);
begin
  ZeroMemory(@AFlags, SizeOf(TNewLocationFlags));
end;

class procedure TLocationsTable.CopyFlags(const ASource: TNewLocationFlags;
  var ATarget: TNewLocationFlags);
begin
  FillChar( ATarget, SizeOf(ATarget), 0);
  Move( ASource, ATarget, System.Math.Min( SizeOf(TNewLocationFlags), SizeOf(TNewLocationFlags)))
end;

procedure TLocationsTable.QryLocationsBeforePost(DataSet: TDataSet);
var
  AEPlantIDStr:String;
begin
  IQAssignIDBeforePost(DataSet, 'LOCATIONS');

  if (DataSet.State = dsEdit) and (DataSet.FieldByName('DIVISION_ID').asFloat <> SelectValueByID('division_id', 'locations', DataSet.FieldByName('ID').asFloat )) then
  begin
    {'Items attached to this location will now be assigned to the specified division and warehouse.'#13#13+
     'Continue?';}
    if not IQConfirmYN(inv_rscstr.cTXT0000103) then
       ABORT;
  end;

  if (DataSet.FieldByName('VMI').asString = 'Y') and (DataSet.FieldByName('TRANSIT').asString = 'Y') then
     raise Exception.Create(inv_rscstr.cTXT0000104 {'Cannot have location marked both VMI and TRANSIT at the same time.'});

  if (DataSet.FieldByName('TRANSIT').asString = 'Y') then
  begin
    if SelectValueFmtAsFloat('select 1 from locations where transit = ''Y'' and NVL(eplant_id,0) = %f and NVL(division_id,0) = %f and id <> %f',
                 [ DataSet.FieldByName('EPLANT_ID').asFloat, DataSet.FieldByName('DIVISION_ID').asFLoat, DataSet.FieldByName('ID').asFloat ]) = 1 then
       raise Exception.Create( CheckReplaceDivisionCaption(inv_rscstr.cTXT0000105 {'Cannot have two locations marked TRANSIT for same EPlant or Division.'}));
  end;

  if (DataSet.FieldByName('NON_CONFORM').asString <> 'Y') then
     DataSet.FieldByName('NON_CONFORM_ALLOCATABLE').Clear;

  if DataSet.FieldByName('SHIP_DEFAULT').asString = 'Y' then
     ExecuteCommandFmt('update locations set SHIP_DEFAULT = ''N'' where id <> %f and SHIP_DEFAULT = ''Y'' and eplant_id %s and NVL(division_id, 0) = %f',
                [ DataSet.FieldByName('ID').asFloat,
                  IIf( DataSet.FieldByName('EPLANT_ID').asFloat = 0, ' is NULL', ' = '+ DataSet.FieldByName('EPLANT_ID').asString ),
                  DataSet.FieldByName('DIVISION_ID').asFloat ]);

  // 09/25/2015 (Byron, EIQ-8757) Check if another record has the flag,
  // and prompt the user to clear it.
  CheckClearRecvDefaultAlreadyAssigned;

{
  if DataSet.FieldByName('RECV_DEFAULT').asString = 'Y' then
     ExecuteCommandFmt('update locations set RECV_DEFAULT = ''N'' where id <> %f and RECV_DEFAULT = ''Y'' and eplant_id %s and NVL(division_id, 0) = %f',
                [ DataSet.FieldByName('ID').asFloat,
                  IIf( DataSet.FieldByName('EPLANT_ID').asFloat = 0, ' is NULL', ' = '+ DataSet.FieldByName('EPLANT_ID').asString),
                  DataSet.FieldByName('DIVISION_ID').asFloat ]);
}
  ValidateLocationStatus( DataSet.FieldByName('id').asFloat, DataSet.FieldByName('loc_status').asString );
end;

procedure TLocationsTable.CheckClearRecvDefaultAlreadyAssigned;
var
  AQuery: TFDQuery;
begin
  AQuery := TFDQuery.Create(nil);
  try
    // If the new value is Y, then check for other records that
    // have the same flag
    if QryLocationsRECV_DEFAULT.asString = 'Y' then
      with AQuery do
        begin
          Connection := UniMainModule.FDConnection1;
          SQL.Add('SELECT id,                                 ');
          SQL.Add('       loc_desc                            ');
          SQL.Add('  FROM locations                           ');
          SQL.Add(' WHERE NVL(recv_default, ''N'') = ''Y''    ');
          // Exclude the current ID
          SQL.Add(Format('       AND id <> %.0f               ',
            [QryLocationsID.AsFloat]));
          // EplantID
          if QryLocationsEPLANT_ID.AsLargeInt > 0 then
            SQL.Add(Format('       AND NVL(eplant_id, 0) = %d   ',
              [QryLocationsEPLANT_ID.AsLargeInt]))
          else
            SQL.Add('       AND eplant_id IS NULL        ');
          // Division Id
          SQL.Add(Format('       AND NVL(division_id, 0) = %d ',
            [QryLocationsDIVISION_ID.AsLargeInt]));
          Open;

          // Prompt # 1
          // Are there any records that already have the flag set?
          if not (Bof and Eof) then
            // If another record has already been flagged, inform the user
            // that the other record will be cleared.
            // inv_rscstr.cTXT0000206 =
            // 'Location %s will no longer be marked as a Receive ' +
            // 'Designator.  Continue?';
            if not IQMS.Common.Dialogs.IQConfirmYNWithSecurity(
              Format(inv_rscstr.cTXT0000206,
              [FixStr(FieldByName('loc_desc').AsString)]),
              'LocationsRecvDefaultChk2',
              True) then
              System.SysUtils.Abort;
        end;

    // Prompt # 2
    // 09/18/2015, 09/23/2015 (Byron, EIQ-8757) Prompt with security if
    // "Receive Designator" (RECV_DEFAULT) changes.
    // inv_rscstr. cTXT0000205 = '
    // 'Location %s is currently attached to item(s) in ' +
    // 'Transactions and Locations.  Continue?';
    if (CompareText(QryLocationsRECV_DEFAULT.asString, FRECV_DEFAULT_BeforeEdit)
      <> 0) and
      (SelectValueFmtAsInteger(
      'SELECT 1 FROM fgmulti WHERE loc_id = %.0f AND ROWNUM < 2',
      [QryLocationsID.asFloat]) = 1) and
      not IQMS.Common.Dialogs.IQConfirmYNWithSecurity(
      Format(inv_rscstr.cTXT0000205, [FixStr(QryLocationsLOC_DESC.AsString)]),
      'LocationsRecvDefaultChk', True) then
      System.SysUtils.Abort;

    // Process it:
    // If execution gets here, then the user has opted to clear flag on
    // other records. Normally, there will be only one record for the
    // given EPlant and Division.
    if QryLocationsRECV_DEFAULT.asString = 'Y' then
      with AQuery do
        while not Eof do
          begin
            // Clear the flag
            ExecuteCommandFmt(
              'UPDATE locations                     '#13 +
              '   SET recv_default = ''N''          '#13 +
              ' WHERE id = %.0f                     ',
              [FieldByName('id').AsFloat]);
            // Next record in the dataset
            Next;
          end;
  finally
    FreeAndNil(AQuery);
  end;
end;

procedure TLocationsTable.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TLocationsTable.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TLocationsTable.wwTable1BeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TLocationsTable.wwDBComboDlg1CustomDlg(Sender: TObject);
begin
  QryLocations.CheckBrowseMode;
  DoChangePlantID(QryLocations );  {IQMS.COmmon.SetPlant.pas}
end;

procedure TLocationsTable.wwDBComboDlgLocationTypeDescripCustomDlg(
  Sender: TObject);
begin
  QryLocations.CheckBrowseMode;
  with PkLocationType do
    if Execute then
    begin
      QryLocations.Edit;
      QryLocationsLOCATION_TYPE_ID.asFloat:= GetValue('ID');
    end;
end;


procedure TLocationsTable.wwDBComboDlgZoneLOCustomDlg(Sender: TObject);
var
  AField: TField;
begin
  QryLocations.CheckBrowseMode;

  if (Sender = wwDBComboDlgZoneLO) or (Sender = wwDBComboDlgLO_OnGrid)  then
     begin
       AField:= QryLocationsINV_ZONE_ID;
       FPkListZoneType:= 'LO';
     end
  else if (Sender = wwDBComboDlgZoneAL) or (Sender = wwDBComboDlgAL_OnGrid) then
     begin
       AField:= QryLocationsAL_INV_ZONE_ID;
       FPkListZoneType:= 'AL';
     end
  else if (Sender = wwDBComboDlgZoneDZ) or (Sender = wwDBComboDlgDZ_OnGrid ) then
     begin
       AField:= QryLocationsDZ_INV_ZONE_ID;
       FPkListZoneType:= 'DZ';
     end
  else if (Sender = wwDBComboDlgZoneWK) or (Sender = wwDBComboDlgWK_OnGrid) then
     begin
       AField:= QryLocationsWK_INV_ZONE_ID;
       FPkListZoneType:= 'WK';
     end
  else
     ABORT;

  with PkInvZone do
    if Execute then
    begin
      QryLocations.Edit;
      AField.asFloat:= GetValue('ID');
    end;
end;

procedure TLocationsTable.wwDBComboDlgZoneLOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Sender is TUniEdit) then
  begin
    QryLocations.Edit;
    if      (Sender = wwDBComboDlgZoneLO) or (Sender = wwDBComboDlgLO_OnGrid) then QryLocationsINV_ZONE_ID.Clear
    else if (Sender = wwDBComboDlgZoneAL) or (Sender = wwDBComboDlgAL_OnGrid) then QryLocationsAL_INV_ZONE_ID.Clear
    else if (Sender = wwDBComboDlgZoneDZ) or (Sender = wwDBComboDlgDZ_OnGrid) then QryLocationsDZ_INV_ZONE_ID.Clear
    else if (Sender = wwDBComboDlgZoneWK) or (Sender = wwDBComboDlgWK_OnGrid) then QryLocationsWK_INV_ZONE_ID.Clear
    else    ABORT;

    TUniEdit( Sender ).Text:= '';
    Key:= 0;
  end;
end;

procedure TLocationsTable.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1327783 );
end;
{
procedure TLocationsTable.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Field = QryLocationsID then
     begin
       ABrush.Color:= IIf( Highlight, clBlack, clBtnFace );
       AFont.Color := IIf( Highlight, clSilver, clBlack  );
     end
  else if QryLocationsVMI.asString = 'Y' then
     begin
       ABrush.Color:= IIf( Highlight, clBlack, clYellow );
       AFont.Color := IIf( Highlight, clWhite, clBlack );
     end
  else if QryLocationsNON_CONFORM.asString = 'Y' then
     begin
       ABrush.Color:= IIf( Highlight, clBlack, clMaroon );
       AFont.Color := IIf( Highlight, clYellow, clWhite );
     end
  else if QryLocationsTRANSIT.asString = 'Y' then
     begin
       ABrush.Color:= IIf( Highlight, clPurple, clBlack );
       AFont.Color := IIf( Highlight, clWhite, clFuchsia );
     end;
end;

procedure TLocationsTable.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    cnstAppendNew: if DBNavigator.Controls[ Ord(nbInsert) ].Enabled then
                      DBNavigator.BtnClick( nbInsert );
  end;
end;
}
procedure TLocationsTable.LocationTypes1Click(Sender: TObject);
begin
  // 10/30/2013 Location types (Byron)
  // EIQ-1432  Master Inventory Locations -> Options -> add "Location Types"
  TFrmInvLocationType.DoShow;  // inv_location_type.pas
end;

procedure TLocationsTable.sbtnToggleClick(Sender: TObject);
begin
  if pgctrlMain.ActivePageIndex = 0 then
     pgctrlMain.ActivePageIndex:= 1
  else
     pgctrlMain.ActivePageIndex:= 0;
end;

procedure TLocationsTable.spSearchClick(Sender: TObject);
begin
  with PkLoc do
  if Execute then
    QryLocations.Locate('ID', GetValue('ID'), [])
  else
    ABORT;
end;

procedure TLocationsTable.QryLocoationsNewRecord(DataSet: TDataSet);
begin
  if SecurityManager.EPlantsExist and (SecurityManager.EPlant_ID <> 'NULL') then
     DataSet.FieldByName('EPLANT_ID').AsFloat:= SecurityManager.EPlant_ID_AsFloat;
  QryLocationsID.AsFloat := GetNextID('LOCATIONS');
  FLastNewID := QryLocationsID.AsFloat;
  QryLocationsLOC_STATUS.asString:= 'E';
  if FFlags.NonConforming then
    QryLocationsNON_CONFORM.AsString := 'Y';
end;

procedure TLocationsTable.Zones1Click(Sender: TObject);
begin
  TFrmInvZones.DoShow;  // inv_zones.pas
end;

procedure TLocationsTable.QryStagingINAfterInsert(DataSet: TDataSet);
begin
  wwDBComboDlgWorkcenterTransINCustomDlg(nil)
end;

procedure TLocationsTable.QryStagingINBeforePost(DataSet: TDataSet);
var
  AEqNo: string;
begin
  IQAssert( DataSet.FieldByName('id').asFloat > 0, 'Work center must be assigned - operation aborted');

  if (QryStagingInPICKUP_PACKAGES.asFloat > 0) or (QryStagingInPICKUP_PALLETS.asFloat > 0) then
  begin
    if SameStagingOutLocation( QryStagingInLOCATIONS_ID_IN.asFloat, AEqNo ) then
       raise Exception.CreateFmt('This location is assigned as a staging out location of work center %s - operation aborted', [ AEqNo ]);
  end;
end;

procedure TLocationsTable.QryStagingInUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  case ARequest of
    arUpdate, arInsert:
       begin
         ExecuteCommandFmt('update work_center              '+
                   '   set locations_id_in = %f,    '+
                   '       trans_priority = %f,     '+
                   '       pickup_packages = %f,    '+
                   '       pickup_pallets = %f      '+
                   ' where id = %f                  ',
                   [ ASender.FieldByName('locations_id_in').asFloat,
                     ASender.FieldByName('trans_priority').asFloat,
                     ASender.FieldByName('pickup_packages').asFloat,
                     ASender.FieldByName('pickup_pallets').asFloat,
                     ASender.FieldByName('id').asFloat ]);
       end;
    arDelete:
       begin
         ExecuteCommandFmt('update work_center set locations_id_in = null where id = %f',
                   [ DtoF( ASender.FieldByName('id').OldValue )]);
       end;
  end;

  AAction := eaApplied;
end;

procedure TLocationsTable.QryStagingOUTAfterInsert(DataSet: TDataSet);
begin
  wwDBComboDlgWorkcenterTransOUTCustomDlg(nil)
end;

procedure TLocationsTable.QryStagingOUTBeforePost(DataSet: TDataSet);
begin
  IQAssert( DataSet.FieldByName('id').asFloat > 0, 'Work center must be assigned - operation aborted');
end;

procedure TLocationsTable.QryStagingOUTUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  case ARequest of
    arUpdate, arInsert:
       begin
         ExecuteCommandFmt('update work_center              '+
                   '   set locations_id = %f,       '+
                   '       staging_hrs = %.6f       '+
                   ' where id = %f                  ',
                   [ ASender.FieldByName('locations_id').asFloat,
                     ASender.FieldByName('staging_hrs').asFloat,
                     ASender.FieldByName('id').asFloat ]);
       end;
    arDelete:
       begin
         ExecuteCommandFmt('update work_center set locations_id = null where id = %f',
                   [ DtoF( ASender.FieldByName('id').OldValue )]);
       end;
  end;

  AAction := eaApplied;
end;

procedure TLocationsTable.QryMilkRunAfterInsert(DataSet: TDataSet);
begin
  wwDBComboDlgMilkRunCustomDlg(nil)
end;

procedure TLocationsTable.QryMilkRunUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  case ARequest of
    arUpdate, arInsert:
       begin
         ExecuteCommandFmt('update ord_detail                  '+
                   '   set milk_run_locations_id = %f  '+
                   ' where id = %f                     ',
                   [ QryLocationsID.asFloat,
                     ASender.FieldByName('id').asFloat ]);
       end;
    arDelete:
       begin
         ExecuteCommandFmt('update ord_detail set milk_run_locations_id = null where id = %f',
                   [ DtoF( ASender.FieldByName('id').OldValue )]);
       end;
  end;

  AAction := eaApplied;
end;



procedure TLocationsTable.Aisles1Click(Sender: TObject);
begin
   {ToDo Resolve dependency
  TFrmInvAisles.DoShow( self );   // inv_aisles.pas
  }
end;

procedure TLocationsTable.ApplyUpdates(DataSet: TDataSet);
begin

//  if FDManager.FindConnection('IQFD').InTransaction then
//     try
//       {since we may be within transaction such as when coming from creating a new location originated in receiving don't commit - just send the changes to the table}
//       TFDQuery(DataSet).ApplyUpdates;   {send updates}
//       TFDQuery(DataSet).CommitUpdates;  {clear buffer}
//     except on E: Exception do
//       begin
//         TFDQuery(DataSet).CancelUpdates;
//         IQError( E.Message );
//         System.SysUtils.ABORT;
//       end;
//     end
//  else
//     {normal case}
//     IQApplyUpdateToTable(DataSet);
  FRECV_DEFAULT_BeforeEdit := '';
  RefreshDataSetByID( DataSet );
end;
{
procedure TLocationsTable.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;
}
procedure TLocationsTable.ClearLocationType(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Sender is TUniEdit) and (Key = VK_DELETE) then
  begin
    QryLocations.Edit;
    QryLocationsLOCATION_TYPE_ID.Clear;
    TUniEdit( Sender ).Text:= '';
    Key:= 0;
  end;
end;

procedure TLocationsTable.QryLocationsAfterCancel(DataSet: TDataSet);
begin
  FRECV_DEFAULT_BeforeEdit := '';
end;

procedure TLocationsTable.QryLocationsBeforeDelete(DataSet: TDataSet);
var
  AExists: Boolean;
begin
  // Check if the location is referenced in PMEQMT
  AExists := SelectValueFmtAsInteger('SELECT 1 FROM pmeqmt ' +
   'WHERE locations_id = %.0f AND ROWNUM < 2',
   [QryLocationsID.AsFloat]) = 1;

  // If a reference exists, prompt the user for a choice
  if AExists then
    begin
      //ConfirmWithSecurity
      if DoShowModalConfirmWithSecurity(
        // inv_rscstr.cTXT0000183 =
        // 'This location is associated to MRO, do you wish to continue?';
        inv_rscstr.cTXT0000183,
        'Delete Location Linked to MRO', False) then
        // Clear the field reference
        ExecuteCommandFmt('UPDATE pmeqmt SET locations_id = NULL ' +
          'WHERE locations_id = %.0f', [QryLocationsID.AsFloat])
      else
        System.SysUtils.Abort;
    end;
end;

procedure TLocationsTable.QryLocationsBeforeEdit(DataSet: TDataSet);
begin
  FRECV_DEFAULT_BeforeEdit := QryLocationsRECV_DEFAULT.AsString;
end;

procedure TLocationsTable.QryLocationsBeforeOpen(DataSet: TDataSet);
begin
  with TFDQuery(DataSet) do
   begin
     ParamByName('selected_view').Value := PkHideManager.SelectedViewIndex;
     ParamByName('non_conform_only').Value := Integer(FFlags.NonConforming);
   end;
end;

procedure TLocationsTable.PkInvZoneBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'zone_type', FPkListZoneType);
//  TFDQuery(DataSet).ParamByName('zone_type').Value := FPkListZoneType;
end;

procedure TLocationsTable.PkLocBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'selected_view', PkHideManager.SelectedViewIndex);
//  TFDQuery(DataSet).ParamByName('selected_view').Value := PkHideManager.SelectedViewIndex;
end;

procedure TLocationsTable.PkLocIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  //PostMessage( self.Handle, iq_Notify, cnstAppendNew, 0 );
end;
{
procedure TLocationsTable.PkOrdDetailIQDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //ColorWorkCenterPicklist( Sender, Rect, DataCol, Column, State, 'milk_run_locations_id' );  // we dont really assign any work center - just using the same func
end;

procedure TLocationsTable.PkWorkCenterStagingINIQDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ColorWorkCenterPicklist( Sender, Rect, DataCol, Column, State, 'locations_id_in' );
end;

procedure TLocationsTable.PkWorkCenterStagingOUTIQDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  ColorWorkCenterPicklist( Sender, Rect, DataCol, Column, State, 'locations_id' );
end;
}
procedure TLocationsTable.PostParent(DataSet: TDataSet);
begin
  QryLocations.CheckBrowseMode;
end;

procedure TLocationsTable.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TLocationsTable.PrinterSetup1Click(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TLocationsTable.FilterPKHide(Sender: TObject);
begin
  FPkHideManager.Select(Sender);
  Reopen(QryLocations);
end;

procedure TLocationsTable.DefineLabelText1Click(Sender: TObject);
begin
  (popmUserDefined.PopupComponent as TIQWebUserDefLabel).Execute;
end;

procedure TLocationsTable.dbchkNonConformClick(Sender: TObject);
begin
  IQMS.Common.Controls.IQEnableControl([dbchNonConformAllocatable, lblDefaultNonConfirmCode,
  cmbDefaultNonConfirmCode], dbchkNonConform.Checked, SR );
end;

procedure TLocationsTable.SRAfterApply(Sender: TObject);
begin
  {
  IQMS.Common.Controls.AutoSizeNavBar(DBNavigator);
  IQMS.Common.Controls.AutoSizeNavBar(navStagingIn);
  IQMS.Common.Controls.AutoSizeNavBar(navStagingOut);
  IQMS.Common.Controls.AutoSizeNavBar(NavMilkRun);
  }
end;

procedure TLocationsTable.SrcLocationsDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(QryLocations) and (QryLocations.State = dsBrowse) then
  begin
    IQMS.Common.Controls.IQEnableControl( dbchNonConformAllocatable, QryLocationsNON_CONFORM.asString = 'Y');

    tabGeneral.TabVisible:= True;
    tabStaging.TabVisible:= QryLocationsLocationTypeSubType.asString = 'S';
    tabMilkRun.TabVisible:= QryLocationsLocationTypeSubType.asString = 'M';
    if not pgctrlDetails.ActivePage.TabVisible then
       pgctrlDetails.ActivePageIndex:= 0;
    SetControls;
  end;
end;

procedure TLocationsTable.SetControls;
begin
  IQMS.Common.Controls.IQEnableControl(dbchkNonConform, not FFlags.NonConforming);
  dbchkNonConformClick(dbchkNonConform);
end;

procedure TLocationsTable.QryLocationsCalcFields(DataSet: TDataSet);
var
  A: Variant;

  procedure _assign_lookup_zone( AInv_Zone_ID: Real; AField: TField );
  begin
    if AInv_Zone_ID > 0 then
       AField.asString:= SelectValueByID('code', 'inv_zone', AInv_Zone_ID );
  end;

begin
  _assign_lookup_zone( QryLocationsINV_ZONE_ID.asFloat,    QryLocationsInvZoneCodeLO );
  _assign_lookup_zone( QryLocationsAL_INV_ZONE_ID.asFloat, QryLocationsInvZoneCodeAL );
  _assign_lookup_zone( QryLocationsDZ_INV_ZONE_ID.asFloat, QryLocationsInvZoneCodeDZ );
  _assign_lookup_zone( QryLocationsWK_INV_ZONE_ID.asFloat, QryLocationsInvZoneCodeWK );

  if QryLocationsLOCATION_TYPE_ID.asFloat > 0 then
     QryLocationsLocationTypeDescrip.asString:= SelectValueByID('descrip', 'location_type', QryLocationsLOCATION_TYPE_ID.asFloat );

  if QryLocationsEPLANT_ID.asFloat > 0 then
     QryLocationsEplantDisp.asString:= SelectValueByID('name', 'eplant', QryLocationsEPLANT_ID.asFloat);

   if QryLocationsINV_AISLES_ID.asFloat > 0 then
      QryLocationsLoc_Aisle.asString:= SelectValueByID('name', 'inv_aisles', QryLocationsINV_AISLES_ID.asFloat );

   if QryLocationsLOCATION_TYPE_ID.asFloat > 0 then
   begin
      A:= SelectValueArrayFmt('select length, width, height, weight, items_per_loc,       '+
                         '       allow_mixed_lots, max_case_stack, max_pallet_stack, '+
                         '       allocate_seq, nvl(sub_type, ''D'')                  '+
                         '  from location_type                                       '+
                         ' where id = %f                                             ',
                         [ QryLocationsLOCATION_TYPE_ID.asFloat ]);
      if VarArrayDimCount( A ) > 0 then
      begin
        QryLocationsLENGTH.asFloat              := A[ 0 ];
        QryLocationsWIDTH.asFloat               := A[ 1 ];
        QryLocationsHEIGHT.asFloat              := A[ 2 ];
        QryLocationsWEIGHT.asFloat              := A[ 3 ];
        QryLocationsITEMS_PER_LOC.asString      := A[ 4 ];
        QryLocationsALLOW_MIXED_LOTS.asString   := A[ 5 ];
        QryLocationsMAX_CASE_STACK.asFloat      := A[ 6 ];
        QryLocationsMAX_PALLET_STACK.asFloat    := A[ 7 ];
        QryLocationsALLOCATE_SEQ.asString       := A[ 8 ];
        QryLocationsLocationTypeSubType.asString:= A[ 9 ];
      end;
   end;


  if QryLocationsDIVISION_ID.asFloat > 0 then
     QryLocationsDivisionName.asString:= SelectValueByID('NAME', 'DIVISION', QryLocationsDIVISION_ID.asFloat )
end;

procedure TLocationsTable.ValidateLocationStatus( ALocation_ID: Real; ANewLoc_Status: string );
var
  ALocationIsEmpty: Boolean;
begin
  // has location status changed
  if IQMS.Common.StringUtils.nz(SelectValueByID('loc_status', 'locations', ALocation_ID ), 'E') = IQMS.Common.StringUtils.nz( ANewLoc_Status, 'E') then
     EXIT;

  // is location empty across all fgmulti-s
  ALocationIsEmpty:= SelectValueFmtAsFloat('select inventory_trans.is_location_empty( %f ) from dual', [ ALocation_ID ]) = 1;

  if ANewLoc_Status = 'E' then
     begin
       if not ALocationIsEmpty then
       begin
         TFrmInvNonEmpty.DoShowModal( ALocation_ID );  // inv_non_empty_fgmulti.pas
         ABORT;
       end;
     end

  else if StrInList( ANewLoc_Status, ['P', 'S']) then
     begin
       if ALocationIsEmpty then
          IQAssert( not ALocationIsEmpty, inv_rscstr.cTXT0000180 {'No locations found with non zero onhand qty - opearation aborted'} )
     end;
end;

procedure TLocationsTable.dbeLocAisleCustomDlg(Sender: TObject);
begin
  with PkAisle do
    if Execute then
    begin
      QryLocations.Edit;
      QryLocationsINV_AISLES_ID.asFloat:= GetValue('ID');
    end;
end;

procedure TLocationsTable.UpdateDimLabels;
var
  S: string;
  { Todo Resolve
  procedure _assign_grid_title( AFieldName, ACaption: string );
  var
    i: Integer;
  begin
    i:= IQMS.Common.Controls.WWColumnIndexByName(Grid, AFieldName);
    if i > -1 then
      Grid.Columns[i].DisplayLabel:= ACaption;
  end;
  }

begin
  S:= SelectValueAsString('select lower(location_dim_uom) from params');
  {Length}Label13.Caption:= Format('Length (%s)', [S]);
  {Width }Label14.Caption:= Format('Width (%s)',  [S]);
  {Height}Label15.Caption:= Format('Height (%s)', [S]);
  { ToDo
  _assign_grid_title( 'LENGTH', Label13.Caption );
  _assign_grid_title( 'WIDTH',  Label14.Caption );
  _assign_grid_title( 'HEIGHT', Label15.Caption );
  }
end;

procedure TLocationsTable.wwDBComboDlgWorkcenterTransINCustomDlg(Sender: TObject);
begin
  AssignViaPicklist( PkWorkCenterStagingIN, QryStagingIN, 'locations_id_in' );
end;

procedure TLocationsTable.wwDBComboDlgWorkcenterTransOUTCustomDlg(
  Sender: TObject);
begin
  AssignViaPicklist( PkWorkCenterStagingOUT, QryStagingOUT, 'locations_id' );
end;

procedure TLocationsTable.wwDBComboDlgMilkRunCustomDlg(Sender: TObject);
begin
  AssignViaPicklist( PkOrdDetail, QryMilkRun, 'milk_run_locations_id' );
end;

procedure TLocationsTable.AssignViaPicklist( APk: TIQWebHPick; ADataSet: TDataSet; AFieldName: string );
var
  I: Integer;
begin
  with APk do
    if Execute then
    begin
      ADataSet.Edit;
      ADataSet.FieldByName(AFieldName).asFloat:= QryLocationsID.asFloat;
      ADataSet.FieldByName('ID').asFloat:= GetValue('id');
      ADataSet.Post;
    end;
end;

(* ToDo Resolve dependency
procedure TLocationsTable.ColorWorkCenterPicklist( Sender: TObject;
                                                   const Rect: TRect;
                                                   DataCol: Integer;
                                                   Column: TColumn;
                                                   State: TGridDrawState;
                                                   AFieldName: string );
  function _get_location_id: Real;
  begin
    Result:= (Sender as TUniDBGrid).DataSource.DataSet.FieldByName( AFieldName ).asFloat;
  end;

  procedure _set_color( AFontSel, ABrushSel, AFontNorm, ABrushNorm: TColor );
  begin
    with Sender as TUniDBGrid, Canvas do
    begin
      if gdSelected in State then
         begin
           Brush.Color:= ABrushSel;
           Font.Color := AFontSel;
         end
      else
         begin
           Brush.Color:= ABrushNorm;
           Font.Color := AFontNorm;
         end
    end;
  end;

begin
  with Sender as TUniDBGrid do
  begin
    if _get_location_id() = QryLocationsID.asFloat then
       _set_color( clLime, clBlack, clGreen, clWindow )
    else if _get_location_id() > 0 then
       _set_color( clYellow, clBlack, clGray, clWindow );

    DefaultDrawColumnCell( Rect, DataCol, Column, State );
  end;
end;
*)
function TLocationsTable.SameStagingOutLocation( ALocations_ID: Real; var AEqNo: string ): Boolean;
begin
  AEqNo:= Trim(SelectValueFmtAsString('select eqno from work_center where locations_id = %f', [ ALocations_ID ]));
  Result:= AEqNo > '';
end;

procedure TLocationsTable.Parameters1Click(Sender: TObject);
begin
  TFrmInvLocParams.DoShowModal; // inv_loc_params.pas
end;

procedure TLocationsTable.sbtnTransPlanClick(Sender: TObject);
begin
 (* ToDo Resolve dependency
 with PkInvTransPlan do
   if Execute then
      TFrmInvTransPlanBase.DoShowViewOnly( self, GetValue('id'));  // inv_trans_plan_base.pas

 *)
end;

procedure TLocationsTable.PkInvTransPlanBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).Params.ParamByName('locations_id').Value := QryLocationsID.asFloat;
end;

procedure TLocationsTable.SelectNonConformCode1Click(Sender: TObject);
begin
  // Select the non-conform code
  if SR.Enabled['SelectNonConformCode1'] then
    with PkNonConform do
      if Execute then
        begin
          if not (QryLocations.State in [dsEdit, dsInsert]) then
            QryLocations.Edit;
          QryLocationsNON_CONFORM_ID.AsFloat := System.Variants.VarAsType(GetValue('ID'),
            varInt64);
          QryLocationsNON_CONFORM_CODE.AsString := SelectValueFmtAsString(
            'SELECT code FROM non_conform WHERE id = %.0f',
            [QryLocationsNON_CONFORM_ID.AsFloat]);
        end;
end;

procedure TLocationsTable.ClearNonConformCode1Click(Sender: TObject);
begin
  // Clear the non-conform code
  if SR.Enabled['ClearNonConformCode1'] then
    begin
      if not (QryLocations.State in [dsEdit, dsInsert]) then
        QryLocations.Edit;
      QryLocationsNON_CONFORM_ID.Clear;
      QryLocationsNON_CONFORM_CODE.Clear;
    end;
end;

procedure TLocationsTable.cmbDefaultNonConfirmCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ClearNonConformCode1Click(ClearNonConformCode1);
end;

end.
