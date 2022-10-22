{05-11-2011 Note: TblDetail.MasterFields is set to DAY_PART_ID;ID to ensure grid moves up and down w/o skipping rows}
{01-06-2012 Note: TblDetail - allow sort on item, descrip, class }
unit Dsp_Prod;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Dsp_Cust,
  Data.DB,
  Mask,
  Vcl.DBGrids,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  IQMS.WebVcl.Trans,
  System.Variants,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.DropDownButton,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniMainMenu,
  uniLabel, uniMenuButton, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniPageControl, uniScrollBox, uniSplitter;

type
  TFrmDispoProduction = class(TFrmDispoCust)
    TblDetailDAY_PART_ID: TBCDField;
    TblDetailARINVT_ID: TBCDField;
    TblDetailARINVT_ID_STD: TBCDField;
    TblDetailDISPO: TStringField;
    TblDetailCLASS: TStringField;
    TblDetailITEMNO: TStringField;
    TblDetailREV: TStringField;
    TblDetailDESCRIP: TStringField;
    TblDetailTOT_MAT_QTY: TFMTBCDField;
    TblDetailTOT_RG_QTY: TFMTBCDField;
    TblDetailSTD_MAT_QTY: TFMTBCDField;
    TblDetailSTD_RG_QTY: TFMTBCDField;
    TblMasterLocDAY_PART_ID: TBCDField;
    TblMasterLocFGMULTI_ID: TBCDField;
    TblMasterLocQUAN: TFMTBCDField;
    TblMasterLocLocation: TStringField;
    TblMasterLocLotNo: TStringField;
    TblDetailLocDAY_PART_ID: TBCDField;
    TblDetailLocARINVT_ID: TBCDField;
    TblDetailLocFGMULTI_ID: TBCDField;
    TblDetailLocQUAN: TFMTBCDField;
    TblDetailLocRG_QUAN: TFMTBCDField;
    TblDetailLocStringField: TStringField;
    TblDetailLocStringField2: TStringField;
    QryHist_Illum_RT: TFDQuery;
    QryHist_Illum_RTID: TBCDField;
    QryHist_Illum_RTCLASS: TStringField;
    QryHist_Illum_RTITEMNO: TStringField;
    QryHist_Illum_RTREV: TStringField;
    QryHist_Illum_RTDESCRIP: TStringField;
    QryHist_Illum_RTARINVT_ID: TBCDField;
    TblMasterID: TBCDField;
    TblMasterHIST_ILLUM_PART_ID: TBCDField;
    TblMasterACTCAV: TFMTBCDField;
    TblMasterGOOD_PTS: TBCDField;
    TblMasterClass: TStringField;
    TblMasterItemNo: TStringField;
    TblMasterRev: TStringField;
    TblMasterDescrip: TStringField;
    TblMasterArinvt_ID: TBCDField;
    TblMasterDISPO: TStringField;
    TransDispo1: TIQWebTransDispo;
    TblMasterDAYPROD_ID: TBCDField;
    QryHist_Illum_RTSTANDARD_ID: TBCDField;
    TblMasterStandard_ID: TFloatField;
    QryFGMultiIN_DATE: TDateTimeField;
    TblMasterLocIn_Date: TDateTimeField;
    TblMasterFLOOR_DISPO_QTY: TBCDField;
    TblMasterTRANS_BATCH: TBCDField;
    TblMasterLeft_To_Dispo: TFloatField;
    QryHist_Illum_RTUNIT: TStringField;
    TblMasterUnit: TStringField;
    QryHist_Illum_RTPTWT: TFMTBCDField;
    TblMasterPtWt: TFloatField;
    QryHist_Illum_RTMFG_TYPE: TStringField;
    TblMasterMfg_Type: TStringField;
    TblMasterGood_Pts_Disp: TFloatField;
    TblMasterFloor_Dispo_Qty_Disp: TFloatField;
    TblMasterLeft_Dispo_Disp: TFloatField;
    PkMasterFGMultiRG_ONHAND: TBCDField;
    procAppendCostAlloc: TFDStoredProc;
    TblDetailEPlant_Name: TStringField;
    TblMasterEPlant_Name: TStringField;
    QryFGMultiEPLANT_ID: TBCDField;
    PkArinvtEPLANT_ID: TBCDField;
    PkMasterFGMultiEPLANT_ID: TBCDField;
    Label7: TUniLabel;
    QryFGMultiEPLANT_NAME: TStringField;
    TblDetailLocEPlant_Name2: TStringField;
    TblMasterLocEPlant_Name: TStringField;
    QryHist_Illum_RTEPLANT_NAME: TStringField;
    TblDetailID: TBCDField;
    TblDetailLocID: TBCDField;
    TblDetailLocMATPROD_ID: TBCDField;
    PkMasterFGMultiDIVISION_ID: TBCDField;
    QryHist_Illum_RTHIST_ILLUM_RT_ID: TBCDField;
    TblMasterHist_Illum_Rt_ID: TFloatField;
    TblMasterWork_Center_ID: TFloatField;
    QryHist_Illum_RTWORK_CENTER_ID: TBCDField;
    TblMasterLocHIST_LOC_DESC: TStringField;
    TblMasterLocHIST_LOTNO: TStringField;
    TblDetailLocHIST_LOC_DESC: TStringField;
    TblDetailLocHIST_LOTNO: TStringField;
    Shape1: TUniPanel;
    TblMasterLocLocation_Exists: TStringField;
    TblDetailLocLocation_Exists: TStringField;
    TblDetailFLOOR_DISPO_QTY: TFMTBCDField;
    TblMasterFLOOR_DISPO_QTY_OUT: TBCDField;
    PkMasterFGMultiIN_DATE: TDateTimeField;
    PkMasterFGMultiRelieve: TIQWebHPick;
    PkMasterFGMultiRelieveRG_ONHAND: TBCDField;
    PkMasterFGMultiRelieveEPLANT_ID: TBCDField;
    PkMasterFGMultiRelieveDIVISION_ID: TBCDField;
    PkMasterFGMultiRelieveIN_DATE: TDateTimeField;
    TblMasterWorkorder_ID: TFloatField;
    QryHist_Illum_RTWORKORDER_ID: TBCDField;
    TblDetailIsSerialized: TStringField;
    lblEPlant: TUniLabel;
    DBEdit8: TUniDBEdit;
    Label6: TUniLabel;
    lblFloorDispo: TUniLabel;
    lblLeftToDispo: TUniLabel;
    dbchkDispo: TUniDBCheckBox;
    DBEdit6: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    DBEdit7: TUniDBEdit;
    TblMasterDescrip2: TStringField;
    QryHist_Illum_RTDESCRIP2: TStringField;
    TblDetailDESCRIP2: TStringField;
    popmMaterials: TUniPopupMenu;
    JumpToInventory1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    TblMasterPtorder_ID: TFloatField;
    QryHist_Illum_RTPTORDER_ID: TFMTBCDField;
    PkMasterFGMultiRelieveHARD_ALLOC_TO_WO: TStringField;
    PkArinvtPK_HIDE: TStringField;
    TblDetailSTD_COST: TFMTBCDField;
    PkArinvtSTD_COST: TFMTBCDField;
    PkMasterFGMultiRelieveIS_HARD_ALLOC: TStringField;
    PkMasterFGMultiRelieveNON_CONFORM_ID: TBCDField;
    PkMasterFGMultiRelieveNON_ALLOCATE_ID: TBCDField;
    PkMasterFGMultiRelieveSHIPMENT_DTL_ID_IN_TRANSIT: TBCDField;
    PkMasterFGMultiRelieveMAKE_TO_ORDER_DETAIL_ID: TBCDField;
    PkMasterFGMultiRelieveLOT_DATE: TDateTimeField;
    PkMasterFGMultiRelieveSHELF_LIFE: TFMTBCDField;
    PkMasterFGMultiRelieveHARD_ALLOC_TO_WORKORDER: TFMTBCDField;
    sbtnRightAll: TUniSpeedButton;
    sbtnLeftAll: TUniSpeedButton;
    pnlLegendRelieve: TUniPanel;
    Shape2: TUniPanel;
    TblDetailIS_REWORK: TStringField;
    TblDetailUNIT: TStringField;
    TblDetailOnHand: TBCDField;
    ddbtnAlternateItem: TIQWebDropDownButton;
    popmDropDownAlternateItem: TUniPopupMenu;
    ReplacewithAlternateOneTime1: TUniMenuItem;
    ReplacewithAlternateThisWorkOrder1: TUniMenuItem;
    PkArinvtUNIT: TStringField;
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] Dsp_Prod.pas(194): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);}
    procedure btnDispositionClick(Sender: TObject);
    procedure SrcMasterDataChange(Sender: TObject; Field: TField);
    procedure PkMasterFGMultiIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure sbtnRightClick(Sender: TObject);
    procedure TblMasterCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure PkMasterFGMultiBeforeOpen(DataSet: TDataSet);
    procedure TblDetailCalcFields(DataSet: TDataSet);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure TblDetailLocNewRecord(DataSet: TDataSet);
    procedure TblMasterLocCalcFields(DataSet: TDataSet);
    procedure TblDetailLocCalcFields(DataSet: TDataSet);
    { TODO -oSanketG -cWC : Need to remove, previous declaration }
    {procedure gridTargetLocDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);}
    {procedure gridMatLocDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);}
    procedure gridMatLocEditButtonClick(Sender: TObject);
    procedure PkMasterFGMultiRelieveIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure SrcDetailDataChange(Sender: TObject; Field: TField);
    procedure JumpToInventory1Click(Sender: TObject);
    { TODO -oSanketG -cWC : Need to remove, previous declaration }
    {procedure PkMasterFGMultiIQDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);}
    procedure PkMasterFGMultiRelieveIQAfterHPickCreate(Sender: TObject);
    procedure sbtnRightAllClick(Sender: TObject);
    procedure sbtnLeftAllClick(Sender: TObject);
    { TODO -oSanketG -cWC : Need to remove, previous declaration }
    //procedure gridMatReqTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblDetailBeforePost(DataSet: TDataSet);
    procedure ReplacewithAlternateOneTime1Click(Sender: TObject);
    procedure ReplacewithAlternateThisWorkOrder1Click(Sender: TObject);
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] Dsp_Prod.pas(234): E2003 Undeclared identifier: 'TUniCellAttribs'}
    {procedure gridTargetLocDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);}
    procedure gridMatReqTitleClick(Column: TUniDBGridColumn);
    procedure UniFormShow(Sender: TObject);
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] Dsp_Prod.pas(234): E2003 Undeclared identifier: 'TUniCellAttribs'}
    {procedure gridMatLocDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);}
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] Dsp_Prod.pas(239): E2005 'TUniCellAttribs' is not a type identifier}
    {procedure PkMasterFGMultiIQDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);}
  private
    { Private declarations }
    FTotal_ActCav: Real;
    FDataSource: TDataSource;
    // FJobCosting: TFrmPrwJCMain;                 // prw_jc_main.pas

    function GetDispositioned:string;
    procedure SetDispositioned( const AValue : string );
    function GetDiffInPercent( CalcQty, ActQty: Real ): Real;

    procedure AssignMasterLookUpFields( AIllum_Part_ID: Real );
    procedure AssignDetailLocationLookUpFields( AFGMulti_ID: Real );

    function GetActCav_Proportion: Real;
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] Dsp_Prod.pas(253): E2003 Undeclared identifier: 'TGridDrawState'}
    //procedure DrawNoneExistLocationRed( Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState );
    procedure EnsureConsumedPhantomItemsLocationsAssigned;
    procedure PrepareDispositionConsumedPhantomItems( AParent_Arinvt_ID: Real );
    procedure LoadMasterLabelListBasedOn( ADay_Part_ID: Real; var AList: TStringList );
    procedure AssignLocationBasedOnLabels( AEnforceStrictMatch: Boolean = FALSE );
    function CheckAdjustConsumedMasterLabelQty( AMatProd_Location_ID: Real; AMaster_Label_List: TStringList ): Boolean;
    function CheckMakeToOrderAdjustFGMulti( AWorkorder_ID, APickedFGMulti_ID, ADay_Part_ID: Real ): Real;
    procedure CheckMasterLabelMaterialUsedQuanMismatch;
    procedure AppendPhantomToMatprod(AArinvt_ID: Real);
    procedure ReplaceMatprod(PkArinvt: TIQWebHPick);
    function GetPostActCosInv: Boolean;
    function HasActualUseMasterLabelsAssigned(AMatprod_ID: Real): Boolean;
    function HasPhantomInOutOnFly(ADay_Part_ID, AArinvt_ID: Real): Boolean;
    function ApplyAlternateOneTime( AWorkorder_ID, ADayPart_ID, AMatprod_ID: Real; var ANewMatprod_ID, AArinvt_Alternate_ID: Real ): Boolean;
    function FindFloorDispoLotNo(ADay_Part_ID, AArinvt_ID: Real): string;
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] Dsp_Prod.pas(277): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure DrawNoneExistLocationRed(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);}
    procedure SetDataSource(const Value: TDataSource);
    // procedure CreateJobCostingChild;
    // procedure ExecuteJobCosting;
  protected
    FMaster_Label_List: TStringList; // support for Change Item
    FReverseDisposition: Boolean;
    FReworkMaster_Label_List: TStringList;
    FAutoDispo: Boolean;

    procedure AddInTransactions; override;
    procedure AddOutTransactions; override;
    procedure CheckMasterRecordTotal; override; //Used for IQAlert
    procedure CheckMasterRecordTotalWithInfo; //Used for IQWin32
    procedure CheckDetailRecordTotal; override;
    procedure ExecuteTransaction; override;
    function DoGetNewLocationByArinvt( ArinvtID:Real; var AFGMultiID: Real ): TModalResult; override;
    procedure AddOverhead( const AIN_OUT: string ); override;
    procedure AddLabor( const AIN_OUT: string ); override;
    function GetFloorDispoAmountOf( ATransType: string; AFixed_Overhead: string = 'N' ): Real;
    procedure BeforeDisposition; override;
    procedure Append_To_Cost_Allocate( ADay_Part_ID: Real );
    function DoNotDispoFloorPartialQty( AArinvt_ID: Real ): Boolean;
    procedure SyncVarsTo( ADataSource: TDataSource );
    procedure EnsureINTransSideExists;
    function IsReworkWorkorder: Boolean;
    procedure CheckIsReworkAddOutFromNonConform;
    procedure CheckDetailTotal; override;
    procedure CheckConsumedInventoryGoingNegative;
    procedure AssignDispositioned; virtual;
    procedure SetDataSetReadOnly; virtual;
    procedure AdjustOnHandBasedOnTransConsumed(AFGMulti_ID: Real; var AOnHand, ARgOnHand: Real);
    procedure DeleteFromLocation( ADay_Part_ID: Real; ATable: TFDTable );
    procedure AssignAutoDispoMatprodLocations( ADefaultOUTLocation: string );
    function FindWorkorderOnGetNewLocationByArinvt: Real; override;
    procedure AssignMasterLabelListOnAddInTrans( ADay_Part_ID: Real );  virtual;
    procedure CheckSerializedItem; virtual;
    procedure AssignMasterLocationLookUpFields( AFGMulti_ID: Real ); virtual;
    function PositionFGMultiLookupQuery( AFGMulti_ID: Real ): Boolean;
    // procedure CheckFreeJobCosting;
    procedure DoAfterDisposition;
    // procedure CreateExecuteJobCosting;
    procedure ReportQuanMismatch(AErrorMessage : string; ADetails : string);
    procedure BeforeTransDispoAddOut( ADay_Part_ID: Real; Qry: TDataSet; AMaster_Label_List: TStringList ); virtual;

    procedure ReverseOverhead( const AIN_OUT: string );
    procedure ReverseLabor( const AIN_OUT: string );

    function  GetProdDate:TDateTime; virtual;
    function GetSysDate: TDateTime;

  public
    { Public declarations }
    //constructor Create( AOwner:TComponent; ADataSource: TDataSource ); virtual;
    property Dispositioned : string read GetDispositioned write SetDispositioned;
    property ActCav_Proportion: Real read GetActCav_Proportion;
    destructor Destroy; override;
    class procedure DoShow(  ADataSource: TDataSource );
    procedure UpdateInventoryActualCost(AActCost: Real);
    // property JobCosting: TFrmPrwJCMain read FJobCosting write FJobCosting;
    property DataSource: TDataSource write SetDataSource;
  end;

  { TFrmAutoDispo  }

  TFrmAutoDispo = class(TFrmDispoProduction)
    procedure SrcMasterDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
  private
    FDefaultINLocation : string;
    FDefaultOUTLocation: string;
    FMode: Real;
    FMon_Act_ID: Real;
    FEPlant_ID: Real;
    procedure FrmCreate( ADataSource: TDataSource; ADefaultINLocation, ADefaultOUTLocation: string );
    {To be used with IQAlert action AUTO DISPOSITION}
    procedure FrmCreateAlertMode( ADataSource: TDataSource; ADefaultINLocation, ADefaultOUTLocation: string; AMon_Act_ID, AMode, AEPlant_ID: Real);
    procedure SetDefaultINLocation(const Value: string);
    procedure SetDefaultOUTLocation(const Value: string);
    procedure SetEPlant_ID(const Value: Real);
    procedure SetMode(const Value: Real);
    procedure SetMon_Act_ID(const Value: Real);
  protected
    procedure AssignDefaultAutoDispoQtys;
    //procedure AppendToLocation( AArinvt_ID, AStandard_ID, AQty, ARGQty: Real; ATable:TFDTable; const ALot, DefaultLocation: string; AWork_Center_ID: Real );
    //procedure AppendToLocationFIFO( AArinvt_ID, AStandard_ID, AQty, ARG_Qty: Real; ATable:TFDTable; const DefaultLocation: string; AWork_Center_ID: Real );
    function NeedsDisposition: Boolean;
  public
    //constructor Create( AOwner:TComponent; ADataSource: TDataSource; ADefaultINLocation, ADefaultOUTLocation: string );
    {To be used with IQAlert action AUTO DISPOSITION}
    //constructor CreateAlertMode( AOwner:TComponent; ADataSource: TDataSource; ADefaultINLocation, ADefaultOUTLocation: string; AMon_Act_ID, AMode, AEPlant_ID: Real);
    procedure AutoDisposition;
    //property DataSource: TDataSource write SetDataSource;
    property DefaultINLocation: string write SetDefaultINLocation;
    property DefaultOUTLocation: string write SetDefaultOUTLocation;
    property Mon_Act_ID: Real write SetMon_Act_ID;
    property Mode: Real write SetMode;
    property EPlant_ID: Real write SetEPlant_ID;
  end;

{ Wrappers }
procedure DoEditProdDisposition( ADataSource: TDataSource );
function CreateAutoDispoObject( ADataSource: TDataSource; ADefaultINLocation, ADefaultOUTLocation: string ): TFrmAutoDispo;
function AlertCreateAutoDispoObject(ADataSource: TDataSource; ADefaultINLocation, ADefaultOUTLocation: string; AMon_Act_ID, AMode, AEPlant_ID : Real ): TFrmAutoDispo;



implementation

{$R *.DFM}

uses
  bom_share,
  dispo_rscstr,
  dispo_sec_conf_over_consume_qty_percent,
  dispo_sec_conf_over_consume_regrind_percent,
  dispo_sec_conf_zero_material,
  dsp_share,
  inv_alternate_items_pk,
  IQMS.Common.Controls,
  IQMS.Common.Dispo,
  IQMS.Common.ErrorDialog,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Proc,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  { TODO -oSanketG -cWC : Need to revisit }
  //IQMS.Common.UserMessages,
  mat_xcpt_alternate,
  mat_xcpt_alternate_wo_alloc,
  IQMS.Common.MfgShare,
  { TODO -oSanketG -cWC : Need to revisit }
  //NewLocat,
  prod_share,
  { TODO -oSanketG -cWC : Need to revisit }
  {PS_Man,
  TranLinkedLabelsItemPkListMatProd,}
  IQMS.Common.TransMisc,
  Trans_Share,
  wo_misc,
  uniGUIApplication,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.HpickFrm;


procedure DoEditProdDisposition( ADataSource: TDataSource );
begin
  // TFrmDispoProduction.Create( AOwner, ADataSource ).Show;
  TFrmDispoProduction.DoShow( ADataSource );
end;

class procedure TFrmDispoProduction.DoShow(  ADataSource: TDataSource );
var
  FrmDispoProduction: TFrmDispoProduction;
begin
  FrmDispoProduction := self.Create( uniGUIApplication.UniApplication );
  FrmDispoProduction.DataSource := ADataSource;
  FrmDispoProduction.Show;
end;

function CreateAutoDispoObject( ADataSource: TDataSource; ADefaultINLocation, ADefaultOUTLocation: string ): TFrmAutoDispo;
begin
  Result := TFrmAutoDispo.Create( uniGUIApplication.UniApplication );
  with Result do
  begin
    FrmCreate( ADataSource, ADefaultINLocation, ADefaultOUTLocation );
  end;
end;

function AlertCreateAutoDispoObject( ADataSource: TDataSource; ADefaultINLocation, ADefaultOUTLocation: string;
                                     AMon_Act_ID, AMode, AEPlant_ID: Real ): TFrmAutoDispo;
var
  FrmAutoDispo:TFrmAutoDispo;
begin
  Result := TFrmAutoDispo.Create( uniGUIApplication.UniApplication );
  with Result do
  begin
    FrmCreateAlertMode(ADataSource, ADefaultINLocation, ADefaultOUTLocation, AMon_Act_ID, AMode, AEPlant_ID);
  end;
end;

{ TFrmDispoProduction }

destructor TFrmDispoProduction.Destroy;
begin
  FreeAndNil(FMaster_Label_List);
  FreeAndNil(FReworkMaster_Label_List);
  inherited;
end;

procedure TFrmDispoProduction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // CheckFreeJobCosting;
end;

procedure TFrmDispoProduction.FormCreate(Sender: TObject);
var
  ADecimal: Integer;
begin
  inherited;

  ADecimal:= Trunc( SelectValueAsFloat('select NVL(prod_rep_decimal,2) from params'));
  TblDetailTOT_MAT_QTY.DisplayFormat    := '########0.' + Repl('0', ADecimal) + ';; ' ;
  TblDetailTOT_RG_QTY.DisplayFormat     := '########0.' + Repl('0', ADecimal) + ';; ' ;
  TblDetailLocQUAN.DisplayFormat        := '########0.' + Repl('0', ADecimal) + ';; ' ;
  TblDetailLocRG_QUAN.DisplayFormat     := '########0.' + Repl('0', ADecimal) + ';; ' ;
  TblDetailFLOOR_DISPO_QTY.DisplayFormat:= '########0.' + Repl('0', ADecimal) + ';; ' ;

  IQRegFormRead( self, [ self, ScrollBoxCarrierLeft01 ]);  // even though we have it in the inherited it doesn't kick in
end;

procedure TFrmDispoProduction.UniFormShow(Sender: TObject);
begin
  inherited;
  FMaster_Label_List:= TStringList.Create;
  FReworkMaster_Label_List:= TStringList.Create;

  TblMaster.MasterSource:= FDataSource;

  SyncVarsTo( TblMaster.MasterSource );

  {Manually assign OnDataChange here to avoid double table open when form opens}
  SrcMaster.OnDataChange:= SrcMasterDataChange;
  SrcMasterDataChange( NIL, NIL );

  Label9.Caption:= sIIf( IQMS.Common.Dispo.HasWorkorderBOM( TblMasterWorkorder_ID.asFloat ), 'Materials Involved [Hard Alloc Based]', 'Materials Involved [BOM Based]');  // update relieve inventory label
  ddbtnAlternateItem.Enabled:= SR.Enabled['ddbtnAlternateItem'] and not FReverseDisposition;
end;

procedure TFrmDispoProduction.SyncVarsTo( ADataSource: TDataSource );
begin
  FDivision_ID := SelectValueFmtAsFloat('select division_id from mfgcell where id = %f', [ ADataSource.DataSet.FieldByName('mfgcell_id').asFloat ]);
  FTotal_ActCav:= SelectValueFmtAsFloat('select sum(NVL(actcav,0)) from day_part where dayprod_id = %f', [ TblMasterDAYPROD_ID.asFloat ]);

  with TransDispo1 do
  begin
    Trans_Batch := ADataSource.DataSet.FieldByName('trans_batch').asFloat;
    TransBatchAutoInc:= Trans_Batch = 0;
    Sub_Batch:= 0;  // 01-28-2009 force sub batch being assigned during transaction
  end;
end;

function TFrmDispoProduction.GetActCav_Proportion: Real;
begin
  FTotal_ActCav:= SelectValueFmtAsFloat('select sum(NVL(actcav,0)) from day_part where dayprod_id = %f', [ TblMasterDAYPROD_ID.asFloat ]);
  if FTotal_ActCav <> 0 then
     Result:= TblMasterACTCAV.asFloat / FTotal_ActCav
  else
     Result:= 0;
end;

procedure TFrmDispoProduction.SetDataSetReadOnly;
var
  IsDispo  : Boolean;
  OnChange : TDataChangeEvent;
begin
  IsDispo:= Dispositioned = 'Y';
  if (TblMasterLoc.UpdateOptions.ReadOnly <> IsDispo) and (TblMaster.State = dsBrowse) then
  try
    OnChange:= SrcMaster.OnDataChange;
    SrcMaster.OnDataChange:= NIL;
    TblMasterLoc.DisableControls;
    TblDetail.DisableControls;
    TblDetailLoc.DisableControls;

    IQSetTablesActive( FALSE, self );

    dbchkDispo.Color      := TColor( iIIf( IsDispo, Ord(clRed), Ord(clBtnFace)));
    TblMasterLoc.UpdateOptions.ReadOnly := IsDispo;
    TblDetail.UpdateOptions.ReadOnly    := IsDispo;
    TblDetailLoc.UpdateOptions.ReadOnly := IsDispo;
  finally
    TblMasterLoc.EnableControls;
    TblDetail.EnableControls;
    TblDetailLoc.EnableControls;

    IQSetTablesActive( TRUE, self );

    TblMasterLoc.Open;
    TblDetail.Open;
    TblDetailLoc.Open;

    SrcMaster.OnDataChange:= OnChange;
  end;

  btnDisposition.Enabled:= Dispositioned <> 'Y';
end;

procedure TFrmDispoProduction.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

function TFrmDispoProduction.GetDispositioned:string;
begin
  Result:= TblMaster.FieldByName('dispo').asString;
end;

procedure TFrmDispoProduction.SetDispositioned( const AValue : string );
begin
  if (Dispositioned <> AValue) and (TblMaster.FieldByName('id').asFloat > 0) then
  begin
     TblMaster.Refresh;
     TblMaster.Edit;
     TblMaster.FieldByName('dispo').asString:= AValue;
     TblMaster.Post;
     //SetDataSetReadOnly;
  end;
end;

{ TODO -oSanketG -cWC : Need to revisit }
(*procedure TFrmDispoProduction.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  IsPlastic:Boolean;
begin
  inherited; {nothing}

  if CompareText( Column.FieldName, 'TOT_RG_QTY' ) = 0 then
  begin
     IsPlastic:= TblDetail.FieldByName('CLASS').AsString = 'PL';

     if gdSelected in State then
        TblDetail.FieldByName( 'TOT_RG_QTY' ).ReadOnly:= not IsPlastic;

     if not IsPlastic and not (gdSelected in State ) then
         with gridMatReq.Canvas do Brush.Color:= clBtnFace;
  end;

  gridMatReq.DefaultDrawColumnCell( Rect, DataCol, Column, State );
end;*)

{ TODO -oSanketG -cWC : Need to revisit }
(*procedure TFrmDispoProduction.gridMatReqEditButtonClick(Sender: TObject);
begin
  inherited;  {nothing}

  if TblDetailDISPO.asString = 'Y' then
     EXIT;

  if TblDetail.State <> dsInsert then
  begin
    TblDetail.CheckBrowseMode;
    if not (TblDetailLoc.Eof and TblDetailLoc.Bof) then
       // 'Delete "Relieve" records before changing "Materials Involved"'
       raise Exception.Create(dispo_rscstr.cTXT0000002);
  end;

  if PkArinvt.Execute then
     if SelectValueByID('phantom', 'arinvt', PkArinvt.GetValue('ID')) = 'Y'  then
        AppendPhantomToMatprod( PkArinvt.GetValue('ID') )
     else
        ReplaceMatprod( PkArinvt )
end;*)


procedure TFrmDispoProduction.AppendPhantomToMatprod( AArinvt_ID: Real );
var
  AQty: Real;
  S: string;
begin
  AQty:= 0;

  if not (InputQuery( dispo_rscstr.cTXT0000016 {'Phantom Item'}, dispo_rscstr.cTXT0000017 {'Enter Consumed Qty'}, S) and IsStringValidFloat( S, AQty )) then
     EXIT;

  if not (TblDetail.State in [dsEdit, dsInsert]) then
     TblDetail.Cancel;

  ExecuteCommandFmt('declare                                              '+
            '  v_day_part_id      number::= %f;                   '+
            '  v_parent_arinvt_id number::= %f;                   '+
            '  v_opmat_arinvt_id  number::= %f;                   '+
            '  v_qty              number::= %f;                   '+
            'begin                                                '+
            '  appdef_prod.append_to_matprod( v_day_part_id,      '+
            '                                 v_parent_arinvt_id, '+
            '                                 v_opmat_arinvt_id,  '+
            '                                 v_qty );            '+
            'end;                                                 ',
            [ TblMasterID.asFloat,          //  v_day_part_id
              TblMasterArinvt_ID.asFloat,   //  v_parent_arinvt_id
              AArinvt_ID,                   //  v_opmat_arinvt_id
              AQty ]);                      //  v_qty

  TblDetail.Refresh;
end;


procedure TFrmDispoProduction.ReplaceMatprod( PkArinvt: TIQWebHPick );
begin
  with TblDetail do
  begin
     if not (TblDetail.State in [dsEdit, dsInsert]) then
        Edit;
     TblDetailDAY_PART_ID.asFloat:= TblMasterID.asFloat;
     TblDetailARINVT_ID.asString := PkArinvt.GetValue('ID');
     TblDetailCLASS.asString     := PkArinvt.GetValue('CLASS');
     TblDetailITEMNO.asString    := PkArinvt.GetValue('ITEMNO');
     TblDetailREV.asString       := PkArinvt.GetValue('REV');
     TblDetailDESCRIP.asString   := PkArinvt.GetValue('DESCRIP');
     TblDetailDESCRIP2.asString  := PkArinvt.GetValue('DESCRIP2');
     TblDetailSTD_COST.asString  := PkArinvt.GetValue('STD_COST');
     TblDetailUNIT.AsString      := PkArinvt.GetValue('UNIT');
     TblDetail.Post;
  end;
  TblDetail.Refresh;
end;

procedure TFrmDispoProduction.ReportQuanMismatch(AErrorMessage : string; ADetails : string);
begin
  ShowIQErrorMessage(dispo_rscstr.cTXT0000019, AErrorMessage, ADetails);
  //A quantity mismatch was detected during auto dispositioning - unable to continue.
end;

procedure TFrmDispoProduction.ReverseLabor(const AIN_OUT: string);
var
  ALabor_Added: Boolean;

  function _DefaultLaborCostElement: string;
  begin
    Result:= SelectValueFmtAsString('select e.elem_descrip from standard s, mfgtype m, elements e '+
                          ' where s.id = %f  and RTrim(s.mfg_type) = RTrim(m.mfgtype) and e.id = m.elements_id',
                          [ TblMasterStandard_ID.asFloat ]);
  end;

begin
  // inherited;

  ALabor_Added:= False;
  with TFDQuery.Create(NIL) do
  try
     Connection := UniMainModule.FDConnection1;
     SQL.Add(IQFormat('select kind,               '+
                      '       act_cost,           '+
                      '       elem_descrip,       '+
                      '       prodhrs             '+
                      '  from                     '+
                      '       matprod             '+
                      ' where                     '+
                      '       day_part_id = %f    '+
                      '   and arinvt_id is null   '+
                      '   and kind in (''LABOR'') ',
                      [ TblMaster.FieldByName('ID').asFloat ]));
     Open;
     while not Eof do
     begin
       TransDispo1.AddLabor( FieldByName('act_cost').asFloat,       {act_cost}
                             AIN_OUT,                               {in_out}
                             FieldByName('elem_descrip').asString,  {elem_descrip}
                             FieldByName('prodhrs').asFloat );      {prodhrs}
       ALabor_Added:= True;
       Next;
     end;

    if not ALabor_Added then
      TransDispo1.AddLabor( 0, AIN_OUT, _DefaultLaborCostElement(), 0 );
  finally
    Free;
  end;
end;


procedure TFrmDispoProduction.ReverseOverhead(const AIN_OUT: string);
var
  AOverhead_Added: Boolean;

  function _DefaultOverheadCostElement: string;
  var
    ACost_Elem_ID: Real;
  begin
    ACost_Elem_ID:= SelectValueFmtAsFloat('select inv_cost.get_overhead_cost_element_id( %f ) from dual', [ TblMasterStandard_ID.asFloat ]);
    Result:= SelectValueByID('elem_descrip', 'elements', ACost_Elem_ID);
  end;

begin
  // inherited;
  AOverhead_Added:= False;
  with TFDQuery.Create(NIL) do
  try
     Connection := UniMainModule.FDConnection1;
     SQL.Add(IQFormat('select kind,                                '+
                      '       act_cost,                            '+
                      '       elem_descrip,                        '+
                      '       prodhrs                              '+
                      '  from                                      '+
                      '       matprod                              '+
                      ' where                                      '+
                      '       day_part_id = %f                     '+
                      '   and arinvt_id is null                    '+
                      '   and kind in (''OVERHEAD'', ''OVERHEADF'')',
                      [ TblMaster.FieldByName('ID').asFloat ]));
     Open;
     while not Eof do
     begin
       TransDispo1.AddOverhead( FieldByName('act_cost').asFloat,       {act_cost}
                                AIN_OUT,                               {in_out}
                                FieldByName('elem_descrip').asString,  {elem_descrip}
                                FieldByName('prodhrs').asFloat,        {prodhrs}
                                BoolToYN( FieldByName('kind').asString = 'OVERHEADF'));

       AOverhead_Added:= True;
       Next;
     end;

     if not AOverhead_Added then
        TransDispo1.AddOverhead( 0, AIN_OUT,_DefaultOverheadCostElement(), 0 );
  finally
    Free;
  end;
end;


(*procedure TFrmDispoProduction.gridMatReqTitleClick(Column: TColumn);
var
  I: Integer;
begin
  inherited;  // n

  if not Assigned(Column.Field) then
     EXIT;

  if not (Column.Field.FieldKind = fkData) then
     EXIT;

  if not (Column.Field.DataSet is TFDTable) then
     EXIT;

  with Column.Field.DataSet as TFDTable do
  begin
    Close;
    IndexFieldNames:= Format('DAY_PART_ID;%s;ID', [ Column.FieldName ]);
    Open;
  end;

  // reset color of the titles
  with Column.Grid as TUniDBGrid do
    for I:= 0 to Columns.Count - 1 do Columns[ I ].Title.Font.Style:= Columns[ I ].Title.Font.Style - [fsBold];

  // highlight the selected title
  Column.Title.Font.Style:= Column.Title.Font.Style + [fsBold];
end;*)

// function TFrmDispoProduction.DoNotDispoFloorPartialQty( FloorQty: Real ): Boolean;
function TFrmDispoProduction.DoNotDispoFloorPartialQty( AArinvt_ID: Real ): Boolean;
var
  AValue: string;
begin
  AValue:= SelectValueByID( 'do_not_dispo_floor_partial', 'arinvt', AArinvt_ID );

  if (AValue = '') or (AValue = 'D') or (AValue = 'd') then
     {default}
     Result:= (SelectValueAsString('select do_not_dispo_floor_partial from params') = 'Y') // and (Abs(FloorQty) > 0.000001);
  else
     {item specific setting}
     Result:= AValue = 'Y'
end;


procedure TFrmDispoProduction.CheckMasterRecordTotal;
var
  Qty       : Real;
  FloorQty  : Real;
  GoodPtsQty: Real;
  LeftDispo : Real;
  AExeName  : string;
  Hist_illum_part_id : Real;
  Dayprod_id         : Real;
  Day_part_id        : Real;
  Workorder_id       : Real;
begin
 AExeName := Uppercase(ExtractFileName(Application.ExeName)); // Check whether invoked from IQAlert or IQWin32

 if (AnsiCompareText(AExeName, 'IQWIN32.EXE') = 0) and not FAutoDispo then
 begin
   CheckMasterRecordTotalWithInfo; //Check values with new error handling
   Exit;
 end;

  // Auto disposition action was invoked from IQAlert, pass pertinent info into exception to be raised in comment in IQAlert
  // 'Validating Total Quantity for %s.  Please wait.'
  Status:= Format(dispo_rscstr.cTXT0000003, [ TblMasterItemNo.asString ]);

  FloorQty  := TblMasterFloor_Dispo_Qty_Disp.asFloat;
  GoodPtsQty:= TblMasterGood_Pts_Disp.asFloat;
  LeftDispo := TblMasterLeft_Dispo_Disp.asFloat;
  //Debug fields
  Dayprod_id         := TblMasterDAYPROD_ID.asFloat;
  Day_part_id        := TblMasterID.asFloat;
  Hist_illum_part_id := TblMasterHIST_ILLUM_PART_ID.asFloat;
  Workorder_id       := TblMasterWorkorder_ID.asFloat;

  if DoNotDispoFloorPartialQty( TblMasterArinvt_ID.asFloat )
     or
     // 01-28-2015 EIQ-5780 Quantity Mismatch error when doing a reverse disposition with Do Not Disposition Partials Unchecked
     FReverseDisposition then
    EXIT;

  Qty:= SelectValueFmtAsFloat('select Sum(quan) from day_part_location where day_part_id = %f',
                  [ TblMaster.FieldByName('id').asFloat ]);

  if FloorQty > 0 then
  begin
    if (FloorQty > GoodPtsQty) and (Abs( FloorQty - Qty ) > 0.000001) then
       {'Total of ''Add To'' Quantity (%f) must equal the '+
        'Floor Disposition Quantity (%f)'#13#13  +
        'Please check the ''Add To'' quantity value(s).'}
       raise Exception.CreateFmt(dispo_rscstr.cTXT0000020,
                                 [ Qty,
                                   FloorQty,
                                   Dayprod_id,
                                   Day_part_id,
                                   Hist_illum_part_id,
                                   Workorder_id ])
    else if Abs( LeftDispo - Qty ) > 0.000001 then
       {'The total ''Add To'' Quantity (%f) must equal the '+
        'Left to Disposition Quantity (%f)'#13#13 +
        'Please check the ''Add To'' quantity value(s).'}
       raise Exception.CreateFmt(dispo_rscstr.cTXT0000021,
                                 [ Qty,
                                   LeftDispo,
                                   Dayprod_id,
                                   Day_part_id,
                                   Hist_illum_part_id,
                                   Workorder_id ])
  end
  else
    if Abs( GoodPtsQty - Qty ) > 0.000001 then
       {'The total ''Add To'' quantity (%f) must equal the '+
        'Disposition Quantity (%f)'#13#13 +
        'Please check ''Add To'' quantity value(s).'}
       raise Exception.CreateFmt(dispo_rscstr.cTXT0000022,
                                 [ Qty,
                                   GoodPtsQty,
                                   Dayprod_id,
                                   Day_part_id,
                                   Hist_illum_part_id,
                                   Workorder_id ]);
end;

procedure TFrmDispoProduction.CheckMasterRecordTotalWithInfo;
var
  Qty                : Real;
  FloorQty           : Real;
  GoodPtsQty         : Real;
  LeftDispo          : Real;
  Hist_illum_part_id : Real;
  Dayprod_id         : Real;
  Day_part_id        : Real;
  Workorder_id       : Real;
  ADbgList           : TStringList;
  ADbg               : String;
begin
 Status:= Format(dispo_rscstr.cTXT0000003, [ TblMasterItemNo.asString ]);

  FloorQty           := TblMasterFloor_Dispo_Qty_Disp.asFloat;
  GoodPtsQty         := TblMasterGood_Pts_Disp.asFloat;
  LeftDispo          := TblMasterLeft_Dispo_Disp.asFloat;
  //Debug fields
  Dayprod_id         := TblMasterDAYPROD_ID.asFloat;
  Day_part_id        := TblMasterID.asFloat;
  Hist_illum_part_id := TblMasterHIST_ILLUM_PART_ID.asFloat;
  Workorder_id       := TblMasterWorkorder_ID.asFloat;

  if DoNotDispoFloorPartialQty( TblMasterArinvt_ID.asFloat )
     // 01-28-2015 EIQ-5780 Quantity Mismatch error when doing a reverse disposition with Do Not Disposition Partials Unchecked
     or
     FReverseDisposition then
    EXIT;

  Qty:= SelectValueFmtAsFloat('select Sum(quan) from day_part_location where day_part_id = %f',
                  [ TblMaster.FieldByName('id').asFloat ]);

  ADbgList := TStringList.Create;
  with ADbgList do
  try
    if Dayprod_id > 0 then
    Add(Format('dayprod_id  = %f',[Dayprod_id]));
    if Day_part_id > 0 then
    Add(Format('day_part_id  = %f',[Day_part_id]));
    if Hist_illum_part_id > 0 then
    Add(Format('hist_illum_part_id = %f',[Hist_illum_part_id]));
    if Workorder_id > 0 then
    Add(Format('workorder_id  = %f',[Workorder_id]));

    ADbg := ADbgList.Text; //convert label/value pairs to string so we may pass it to ReportQuanMismatch/ShowIQErrorMessage
  finally
    ADbgList.Free;
  end;

  if FloorQty > 0 then
  begin
    if (FloorQty > GoodPtsQty) and (Abs( FloorQty - Qty ) > 0.000001) then
       {'Total of ''Add To'' Quantity (%f) must equal the '+
        'Floor Disposition Quantity (%f)'#13#13  +
        'Please check the ''Add To'' quantity value(s).'}
        begin
        ReportQuanMismatch(format(dispo_rscstr.cTXT0000004,[ Qty, FloorQty]), ADbg);
        ABORT;
        end
   //    raise Exception.CreateFmt(dispo_rscstr.cTXT0000004,
   //                              [ Qty, FloorQty ])


    else if Abs( LeftDispo - Qty ) > 0.000001 then
       {'The total ''Add To'' Quantity (%f) must equal the '+
        'Left to Disposition Quantity (%f)'#13#13 +
        'Please check the ''Add To'' quantity value(s).'}
         begin
         ReportQuanMismatch(format(dispo_rscstr.cTXT0000004,[ Qty, FloorQty]), ADbg);
         ABORT;
         end;
  //     raise Exception.CreateFmt(dispo_rscstr.cTXT0000005,
  //                               [ Qty, LeftDispo ])
  end
  else
    if Abs( GoodPtsQty - Qty ) > 0.000001 then
       begin
          // dispo_rscstr.cTXT0000026 =
          // 'Total of ''Add To'' Quantity (%f) must equal the '+
          // 'Good Parts Quantity (%f)'#13#13 +
          // 'Please check the ''Add To'' quantity value(s).';
          ReportQuanMismatch(Format(dispo_rscstr.cTXT0000026,[ Qty, GoodPtsQty]), ADbg);
        ABORT;
        end;
    //   raise Exception.CreateFmt(dispo_rscstr.cTXT0000006,
    //                             [ Qty, GoodPtsQty ]);
end;

procedure TFrmDispoProduction.CheckDetailRecordTotal;
var
  ActQty    : Real;
  CalcQty   : Real;
  ActRGQty  : Real;
  CalcRG_Qty: Real;
  AThreshold: Real;
  S         : string;
begin
  if TblDetailTOT_MAT_QTY.asFloat = 0 then
     EXIT;

  AThreshold:= SelectValueAsFloat('select IQMS.Common.Miscellaneous.no_zero(prod_mat_consume_percent_warn,20) from params');

  // 'Validating total quantity for %s.  Please wait.'
  Status:= Format(dispo_rscstr.cTXT0000007, [ TblDetailITEMNO.asString ]);
  with TFDQuery.Create(NIL) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(IQFormat('select Sum(quan),Sum(rg_quan) from matprod_location where matprod_id = %f', [ TblDetail.FieldByName('id').asFloat ]));
    Open;
    ActQty  := Fields[ 0 ].asFloat;
    ActRGQty:= Fields[ 1 ].asFloat;
  finally
    Free;
  end;

  CalcQty:= TblDetail.FieldByName('tot_mat_qty').AsFloat;
  if GetDiffInPercent( CalcQty, ActQty  ) > AThreshold then
     {'The total ''Relieve From'' quantity ( %f ) differs by ' +
      'more than %f%% from the ''Material Used'' quantity (%f)'#13#13}
     begin
       S:= Format(dispo_rscstr.cTXT0000023, [ ActQty, AThreshold, CalcQty ]);
       case FAutoDispo of
         True : raise Exception.Create( S );
         False: if TFrmDispoSecuredConfirmOverConsumeQtyPercent.DoShowModal( S + dispo_rscstr.cTXT0000025 {'Ignore and continue?'} ) <>  mrYes then // bom_secured_confirm_ptsper_zero.pas
                   ABORT;
       end;
     end;

  CalcRG_Qty:= TblDetail.FieldByName('tot_rg_qty').AsFloat;
  if GetDiffInPercent( CalcRG_Qty, ActRGQty  ) > AThreshold then
     {'The total ''Relieve From'' Regrind quantity (%f) differs by ' +
      'more than %f%% from the ''Material Used'' Regrind quantity (%f)'#13#13 }
     begin
       S:= Format(dispo_rscstr.cTXT0000024, [ ActRGQty, AThreshold, CalcRG_Qty ]);
       case FAutoDispo of
         True : raise Exception.Create( S );
         False: if TFrmDispoSecuredConfirmOverConsumeRegrindPercent.DoShowModal( S + dispo_rscstr.cTXT0000025 {'Ignore and continue?'}) <>  mrYes then // dispo_sec_conf_over_consume_regrind_percent.pas
                   ABORT;
       end;
     end;
end;

function TFrmDispoProduction.GetDiffInPercent( CalcQty, ActQty: Real ): Real;
const
  cTHRESHOLD = 0.0000001;
begin
  if ( Abs(CalcQty) < cTHRESHOLD ) and ( Abs(ActQty) < cTHRESHOLD  ) then
     Result:= 0
  else if Abs(CalcQty) < cTHRESHOLD  then
     Result:= 100
  else
     Result:= Abs( ActQty - CalcQty ) / CalcQty * 100;
end;

function TFrmDispoProduction.GetProdDate:TDateTime;
var
  ASysDate: TDateTime;
  AMfgcell_ID: string;
  A: Variant;
  ADayProd_ProdDate: TDateTime;

  function _GetMfgcell_ID: string;
  begin
    Result:= 'null';
    if Assigned( TblMaster.MasterSource ) and Assigned(TblMaster.MasterSource.DataSet) and Assigned(TblMaster.MasterSource.DataSet.FindField('mfgcell_id')) then
       Result:= IQMS.Common.StringUtils.FloatToStr0asNull( TblMaster.MasterSource.DataSet.FieldByName('mfgcell_id').asFloat, 'null');
  end;
begin
  // Result:= SelectValueFmtAsFloat('select Trunc(prod_date) from dayprod where id = %f', [TblMasterDAYPROD_ID.asFloat]);

  ASysDate   := SelectValueAsFloat('select sysdate from dual');
  AMfgCell_ID:= _GetMfgcell_ID;
  // 09-03-2014 EIQ-4172 Auto Dispo - populating translog without a timestamp - CRM# 1028520
  try
    A:= SelectValueArrayFmt('select iqcalendar.get_prod_shift_end( prod_date, shift, %s), prod_date from dayprod where id = %f',
                       [ AMfgCell_ID,
                         TblMasterDAYPROD_ID.asFloat ]);
  except on E: Exception do
    // 10-16-204 EIQ-4564: Production Reporting by Shift - No longer able to report against un-defined shift
    // in case they report against a non existing shift grab the end of the last shift
    A:= SelectValueArrayFmt('select iqcalendar.get_prod_shift_end( trunc( prod_date ), iqcalendar.get_shifts_count( %s ), %s ), prod_date from dayprod where id = %f',
                       [ AMfgCell_ID,
                         AMfgCell_ID,
                         TblMasterDAYPROD_ID.asFloat ]);
  end;

  if VarArrayDimCount( A ) = 0 then  // s/n happen
     EXIT (ASysDate);

  Result:= A[ 0 ];
  ADayProd_ProdDate:= A[ 1 ];

  // EIQ-4959 Production Report - Populating translog with end of shift time for shifts that cross midnight
  if Trunc(Result) > Trunc(ADayProd_ProdDate) then
     Result:= Trunc(ADayProd_ProdDate) + 86399/86400;
end;

function TFrmDispoProduction.GetSysDate: TDateTime;
begin
  Result := SelectValueAsFloat('SELECT SYSDATE FROM DUAL');
end;

procedure TFrmDispoProduction.LoadMasterLabelListBasedOn( ADay_Part_ID: Real; var AList: TStringList );
begin
  with TFDQuery.Create(NIL) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(Format('select id from master_label where day_part_id = %.0f', [ ADay_Part_ID ]));
    Open;
    AList.Clear;
    while not Eof do
    begin
      AList.Add( FieldByName('id').asString );
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmDispoProduction.AddInTransactions;
var
  ID                : Real;
  ForceUniqueDate   : Boolean;
  AProdDate         : TDateTime;
  AFGMulti_ID       : Real;
  ATransIn          : TIQWebTransIn;
begin
  ID:= TblMaster.FieldByName('ID').asFloat;
  if ID = 0 then
     EXIT;

  ForceUniqueDate:= (SelectValueFmtAsString('select unque_date_in from arinvt where id = %f', [ TblMasterARINVT_ID.asFloat ]) = 'Y');
  AProdDate:= GetSysDate;

  {Inventory}
  with TFDQuery.Create(NIL) do
  try
     Connection := UniMainModule.FDConnection1;
     SQL.Add(IQFormat('select d.quan, d.fgmulti_id, Trunc(f.in_date) as in_date, f.onhand, f.id as verify_fgmulti_id from day_part_location d, fgmulti f '+
                      'where day_part_id = %f and f.id(+) = d.fgmulti_id', [ ID ]));
     Open;
     while not Eof do
     begin
        // check fgmulti exists
        IQAssert( FieldByName('fgmulti_id').asInteger = FieldByName('verify_fgmulti_id').asInteger, '''Add To'' location does not exist - operation aborted.');

        // check in-date
        // 08/29/2014 Truncate the dates for the comparison.  For YouTrack:
        // "EIQ-4145 Production Reporting by Shift - Manual dispositions -
        // Unique Date In - change to ignore time and look only at
        // date". (Byron)
        if ForceUniqueDate and
        (Trunc(AProdDate) <> Trunc(FieldByName('in_date').asDateTime)) and
        (FieldByName('onhand').asFloat <> 0 ) then // and not FReverseDisposition then
           raise Exception.CreateFmt('Cannot add production of %s to the location with IN-DATE = %s',
                                     [ DateToStr(AProdDate), FieldByName('in_date').asString ]);

        // check make-to-order
        AFGMulti_ID:= CheckMakeToOrderAdjustFGMulti( TblMaster.FieldByName('workorder_id').asFloat, FieldByName('fgmulti_id').asFloat, ID );

        TransDispo1.AddInTran( FieldByName('quan').asFloat,         { Qty  }
                               0,                                   { RgQty}
                               AFGMulti_ID,                         { FGMulti_ID }
                               TransDispo1.Act_Cost );              { 0 - not filled in }

        with TransDispo1 do
          ATransIn:= TIQWebTransIn( TransObjects[ TransObjects.Count - 1 ]);

        ATransIn.Trans_Note:= 'Parent Trans';
        if FAutoDispo then
           ATransIn.MissingLotExpiryDateAction:= meaRaiseException;

        {Mar-21-2006 If qty is zero do not associate labels with a location = 0 parts}
        if (FieldByName('quan').asFloat > 0) then
            AssignMasterLabelListOnAddInTrans( ID );

        {02-07-2011 support for serialized rework
         09-16-2013 - obsolete}
        if (FieldByName('quan').asFloat > 0) and IsReworkWorkorder and (FReworkMaster_Label_List.Count > 0) then
          ATransIn.Master_Label_List:= FReworkMaster_Label_List;  // the TTransIn object Master_Label_List should be null - we only direct it to the FReworkMaster_Label_List

        Next;
     end;
  finally
     Free;
  end;
end;

procedure TFrmDispoProduction.AssignMasterLabelListOnAddInTrans( ADay_Part_ID: Real );
begin
  {Nov-05-2008 Limit reassigning master labels location to support change of item/garde that is only applicable to EXTRUSION2}
  if (TblMasterMfg_Type.asString = 'EXTRUSION2') or (TblMasterMfg_Type.asString = 'COMPOUND1') then
  begin
    {Nov-30-2005 - support Change Item/Grade. This will update master_label fgmulti_id during transaction}
    LoadMasterLabelListBasedOn( ADay_Part_ID, FMaster_Label_List );
    with TransDispo1, TIQWebTransIn( TransObjects[ TransObjects.Count - 1 ]) do
      Master_Label_List:= FMaster_Label_List;
  end;
end;


procedure TFrmDispoProduction.AddOutTransactions;
label
  next_rec;
var
  ID: Real;
  ATotal_Cav: Real;
  AMaster_Label_List: TStringList;
  AIsSerializedLabelPartiallyConsumedAdjusted: Boolean;
  Qry: TFDQuery;
begin
  ID:= TblMaster.FieldByName('ID').asFloat;
  if ID = 0 then
     EXIT;

  AMaster_Label_List:= TStringList.Create;
  try
    Qry:= TFDQuery.Create(NIL);
    with Qry do
    try
       Connection := UniMainModule.FDConnection1;
       {Aug-30-2005 - added selection by parent_arinvt_id to allow phantom in/out on fly transactions (for PIT)}
       SQL.Add(IQFormat('select NVL(m.quan,0) as quan,           '+
                        '       m.rg_quan,                       '+
                        '       m.fgmulti_id,                    '+
                        '       x.top_phantom_arinvt_id,         '+
                        '       m.id as matprod_location_id,     '+
                        '       x.floor_dispo_posted,            '+             // 03-04-2014 populated when shopdata posts floor dispo out of SIC items
                        '       case                             '+             // 04-21-2014 EIQ-2852 mark the phantom broken out to components as phantom in/out on-fly
                        '         when NVL(x.tot_mat_qty,0) = 0 and a.phantom = ''Y'' then ''Y'' '+
                        '         else ''N''                     '+
                        '       end as phantom_on_fly            '+
                        '  from                                  '+
                        '       matprod_location m,              '+
                        '       matprod x,                       '+
                        '       arinvt a                         '+
                        ' where                                  '+
                        '       m.day_part_id = %f               '+
                        '   and m.matprod_id = x.id              '+
                        '   and NVL(x.parent_arinvt_id, %f) = %f '+             // Note we NVL to TblMasterArinvt_ID.asFloat for compatability only
                        '   and m.arinvt_id is not null          '+             // when in reverse disposition matprod.arinvt_id can be null for labor and overhead
                        '   and x.arinvt_id = a.id               ',
                        [ ID,
                          TblMasterArinvt_ID.asFloat,
                          TblMasterArinvt_ID.asFloat ]));
       Open;
       while not Eof do
       begin
          // 03-04-2014 skip consumed items that have been floor dispo and marked posted. (originated in shopdata)
          if (FieldByName('floor_dispo_posted').asString = 'Y') and not FReverseDisposition then
             goto next_rec;

          // 02-29-2008 add support for serialized consumed items
          LoadColumnValueIntoStringList( AMaster_Label_List,                       {pas}
                                         Format( 'select master_label_id from matprod_location where id = %.0f and master_label_id is not null', [ FieldByName('matprod_location_id').asFloat ]));

          // 02-29-2008 partialy consumed serialized label - adjust label qty and take it out from the list.
          AIsSerializedLabelPartiallyConsumedAdjusted:= CheckAdjustConsumedMasterLabelQty( FieldByName('matprod_location_id').asFloat, AMaster_Label_List );

          // 01-08-2014 used in reverse dispo to ensure fgmulti_id exists
          BeforeTransDispoAddOut( ID{day_part_id}, Qry, AMaster_Label_List );

          TransDispo1.AddOutTran( FieldByName('quan').asFloat,                     { Qty  }
                                  FieldByName('rg_quan').asFloat,                  { RgQty}
                                  FieldByName('fgmulti_id').asFloat,               { FGMulti_ID }
                                  FieldByName('top_phantom_arinvt_id').asFloat,    { top_phantom_arinvt_id }
                                  AMaster_Label_List );                            { Associated master label list for serialized items. Note we will create an internal to TTransOut Master_Label_List}

          // 04-02-2008 prevent partially consumed serialized labels to be consumed again on the backend
          if AIsSerializedLabelPartiallyConsumedAdjusted then with TransDispo1, TIQWebTransOut( TransObjects[ TransObjects.Count - 1 ]) do
          begin
            SkipMasterLabelUpdate:= TRUE;
            Is_Labels_Updated:= 'Y';
          end;

          if FieldByName('phantom_on_fly').asString = 'Y' then with TransDispo1 do
             TIQWebTransOut( TransObjects[ TransObjects.Count - 1 ]).Trans_Reason:= 'DISPOSITION phantom in/out on-fly';

          next_rec:
          Next;
       end;
    finally
       Free;
    end;
  finally
    AMaster_Label_List.Free;
  end;

  {Nov-14-2005 - support Change Item/Grade}
  if TblMasterFLOOR_DISPO_QTY_OUT.asFloat > 0 then
     TransDispo1.AddOutTran( TblMasterFLOOR_DISPO_QTY_OUT.asFloat ,                   {Qty  }
                             0,                                                       {RgQty}
                             GetAutoDispoFGMultiID( TblMasterARINVT_ID.asFloat,       {Fgmulti_id: arinvt_id}
                                                    TblMasterSTANDARD_ID.asFloat,     {            standard_id}
                                                    'TEMPORARY',                      {            default loc}
                                                    SelectValueFmtAsString('select fg_lotno from dayprod where id = %f', [ TblMasterDAYPROD_ID.asFloat ]), {lot}
                                                    TblMasterWork_Center_ID.asFloat,  {            workcenter_id}
                                                    FDivision_ID ),                   {            division_id}
                             0 );                                                     {Top_phantom_arinvt_id }

  AddOverhead( TRAN_OUT );
  AddLabor(TRAN_OUT);
end;


function TFrmDispoProduction.CheckAdjustConsumedMasterLabelQty( AMatProd_Location_ID: Real; AMaster_Label_List: TStringList ): Boolean;
var
  I: Integer;
  AMatProd_Location_Qty: Real;
  AMaster_Label_Qty    : Real;
begin
  Result:= FALSE;

  // each matprod_location record corresponds to one master_label
  if AMaster_Label_List.Count = 0 then
     EXIT;

  // 02-29-2008 partialy consumed serialized label - adjust label qty and take it out from the list.
  // On the other hand if consumed in full - leave it in the list so the engine will process it as usual (nullify fgmulti etc)
  // Note AMaster_Label_List is just 1 record because each matprod_location is associated with just one master_label
  AMatProd_Location_Qty:= SelectValueByID('quan', 'matprod_location', AMatProd_Location_ID);
  AMaster_Label_Qty    := SelectValueByID('qty', 'master_label', StrToFloat(AMaster_Label_List[0]));

  // 05-21-2014 always adjust the master_label qty so we could do properly the reverse dispo

  if FReverseDisposition then
  begin
    ExecuteCommandFmt('update master_label set qty = %.6f where id = %s',
             [ AMaster_Label_Qty + AMatProd_Location_Qty,
               AMaster_Label_List[ 0 ]]);
    EXIT;
  end;

  if AMatProd_Location_Qty < 0 then
     // add support for negative consumption
     begin
       ExecuteCommandFmt('update master_label set qty = %.6f where id = %s',
                [ AMaster_Label_Qty + Abs(AMatProd_Location_Qty),
                  AMaster_Label_List[ 0 ]]);
       // AMaster_Label_List.Delete(0);   // 12/05/2013 keep the labels for the translog_master_label, use SkipMasterLabelUpdate instead
       Result:= TRUE;
     end

  else // if AMatProd_Location_Qty < AMaster_Label_Qty then
     // normal case (see negative consumption above) - just adjust label qty
     begin
       ExecuteCommandFmt('update master_label set qty = %.6f where id = %s',
                [ fMax(0, AMaster_Label_Qty - AMatProd_Location_Qty),
                  AMaster_Label_List[ 0 ]]);
       // AMaster_Label_List.Delete(0);   // 12/05/2013 keep the labels for the translog_master_label, use SkipMasterLabelUpdate instead

       // 05-21-2014 if we consumed the entire label then return false to set SkipMasterLabelUpdate = FALSE
       // forcing master_label fgmulti_id to be reset to null in IQTran UpdateMasterLabelLocation thus disconnecting it from fgmulti.
       Result:= SelectValueByID( 'qty', 'master_label', StrToFloat(AMaster_Label_List[ 0 ])) > 0;
     end;
end;


function TFrmDispoProduction.GetFloorDispoAmountOf( ATransType: string; AFixed_Overhead: string = 'N' ): Real;
var
  AFilter: string;
begin
  AFilter:= '';
  if ATransType = 'OVERHEAD' then
     AFilter:= Format(' and nvl(fixed_overhead, ''N'') = ''%s''', [ AFixed_Overhead ]);

  Result:= SelectValueFmtAsFloat('select sum(act_cost) from translog where day_part_id = %f and rtrim(trans_type) = ''%s'' and trans_in_out = ''OUT'' ' + AFilter,
                     [ TblMasterID.asFloat,
                       ATransType ]);
end;

procedure TFrmDispoProduction.AddOverhead( const AIN_OUT: string );
var
  Prod_Hrs   : Real;
  Center_Rate: Real;
  ACost_Elem : string;
  ATotal     : Real;
  ACost_Elem_ID: Real;

  procedure AddOverheadWorkcenterBased;

     procedure AddOverheadWorkcenterBased_1( AFixed_Overhead: string = 'N' );
     begin
       ATotal:= Center_Rate * Prod_Hrs * ActCav_Proportion;

       {account for floor dispo}
       ATotal:= ATotal - GetFloorDispoAmountOf( 'OVERHEAD', AFixed_Overhead );

       {Overhead}
       TransDispo1.AddOverhead( ATotal,          {Total Overhead = Center_Rate * (Prod_Hrs + SetupHrs) }
                                AIN_OUT,
                                ACost_Elem,
                                Prod_Hrs,
                                AFixed_Overhead,
                                TRUE );          {Store back in matprod for later reverse prod capability}
     end;
  begin
    // VARIABLE OVERHEAD
    {Center Rate}
    Center_Rate:= SelectValueFmtAsFloat( 'select NVL( w.cntr_cost, 0 ) from hist_illum_rt rt, work_center w '+
                             ' where rt.id = %f and rt.work_center_id = w.id(+)', [ TblMasterHist_Illum_Rt_ID.asFloat ]);

    if Center_Rate = 0 then
       Center_Rate:= Get_Center_Rate( TblMasterStandard_ID.asFloat, 'N' );

    {Cost element}
    // ACost_Elem := SelectValueFmtAsString('select e.elem_descrip                          '+
    //                            '  from hist_illum_rt rt, mfgtype m, elements e '+
    //                            ' where rt.id = %f                              '+
    //                            '   and rt.mfg_type = m.mfgtype                 '+
    //                            '   and m.elements_id_oh = e.id ', [ TblMasterHist_Illum_Rt_ID.asFloat ]);
    // 02-25-2014 EIQ-2346 PIT at Standard
    ACost_Elem_ID:= SelectValueFmtAsFloat('select inv_cost.get_overhead_cost_element_id( %f ) from dual', [ TblMasterStandard_ID.asFloat ]);
    ACost_Elem := SelectValueByID('elem_descrip', 'elements', ACost_Elem_ID);

    AddOverheadWorkcenterBased_1( 'N' );
  end;


  procedure AddOverheadLaborBased;
  var
    AOperators: Real;

    procedure AddOverheadLaborBased_1( AFixed_Overhead: string = 'N' );
    begin
      // 04-27-2015 EIQ-6914 PRW - Actual cost overhead variable & fixed calculation is multiplying by number of operators from BOM when labor based mfg type is used
      // ATotal:= Center_Rate * Prod_Hrs * ActCav_Proportion * AOperators;
      ATotal:= Center_Rate * Prod_Hrs * ActCav_Proportion;

      {account for floor dispo}
      ATotal:= ATotal - GetFloorDispoAmountOf( 'OVERHEAD', AFixed_Overhead );

      {Overhead}
      TransDispo1.AddOverhead( ATotal,          {Total Overhead = Center_Rate * (Prod_Hrs + SetupHrs) }
                               AIN_OUT,
                               ACost_Elem,
                               Prod_Hrs,
                               AFixed_Overhead,
                               TRUE );          {Store back in matprod for later reverse prod capability}
    end;
  begin
    {Number of operators}
    AOperators:= SelectValueByID('operator', 'standard', TblMasterStandard_ID.asFloat );

    // VARIABLE OVERHEAD
    {Overhead Rate = MfgType.labor_based_oh_rate}
    Center_Rate:= SelectValueFmtAsFloat('select labor_based_oh_rate from mfgtype where mfgtype = ''%s''', [ TblMasterMfg_Type.asString ]);

    {Cost element}
    ACost_Elem := SelectValueFmtAsString('select e.elem_descrip                          '+
                               '  from hist_illum_rt rt, mfgtype m, elements e '+
                               ' where rt.id = %f                              '+
                               '   and rt.mfg_type = m.mfgtype                 '+
                               '   and m.elements_id_oh = e.id ', [ TblMasterHist_Illum_Rt_ID.asFloat ]);

    AddOverheadLaborBased_1( 'N' );
  end;

begin
  // 03-02-2016 EIQ-10947
  if IsOverheadPostedFromTA( TblMasterMfg_Type.asString ) then
     EXIT;

  {Prod Hrs. May-02-06 - add chargeable_down_time}
  Prod_Hrs:= SelectValueFmtAsFloat('select NVL(prod_hrs,0) + NVL(setup_hrs,0) + NVL(chargeable_down_time,0) from v_dayprod where id = %f', [ TblMasterDAYPROD_ID.asFloat ]);

  if SelectValueFmtAsString('select is_labor_based_oh from mfgtype where mfgtype = ''%s''', [ TblMasterMfg_Type.asString ]) <> 'Y' then
     AddOverheadWorkcenterBased
  else
     AddOverheadLaborBased;

  TransDispo1.AddFixedOverhead( TblMasterArinvt_ID.asFloat,
                                SelectValueFmtAsFloat('select Sum(quan) from day_part_location where day_part_id = %f', [ TblMasterID.asFloat ]),
                                TRUE );

  TransDispo1.AddAuxOverhead( TblMasterStandard_ID.asFloat,
                              Prod_Hrs,
                              TRUE );
end;

procedure TFrmDispoProduction.AddLabor( const AIN_OUT: string );
var
  AQry        : TFDQuery;
  ALabor_Added: Boolean;
  AFloorDispo : Real;
  ATotal      : Real;

  {If Labor cost element is empty - find default }
  function Labor_Cost_Element_Def( S: string ): string;
  begin
    Result:= Trim(S);
    if Result = '' then
       Result:= SelectValueFmtAsString('select e.elem_descrip from standard s, mfgtype m, elements e '+
                             ' where s.id = %f  and RTrim(s.mfg_type) = RTrim(m.mfgtype) and e.id = m.elements_id',
                             [ TblMasterStandard_ID.asFloat ]);
  end;

  {STD Labor}
  procedure Add_STD_Labor;
  var
    Aprod_hrs:Real;
  begin
    with AQry do
    begin
      {Create labor objects grouped by cost elements associated with employee}
      AQry.Close; AQry.SQL.Clear;
      SQL.Add(       'select p.elements_id,                                              ');
      SQL.Add(       '       e.elem_descrip,                                             ');
      SQL.Add(       '       sum( NVL( d.prod_hrs,0 )) as prod_hrs,                       ');
   // SQL.Add(       '       sum( NVL( d.prod_hrs,0 ) * NVL( p.charge_rate, 0 )) as labor');
      SQL.Add(Format('       sum( NVL( d.prod_hrs,0 ) * mfg_misc.get_labor_rate( p.id, ''%s'')) as labor', [ TblMasterMfg_Type.asString ]));
      SQL.Add(       '  from day_emp d,                                                  ');
      SQL.Add(       '       pr_emp p,                                                   ');
      SQL.Add(       '       elements e                                                  ');
      SQL.Add(IQFormat(' where dayprod_id = %f', [ TblMasterDAYPROD_ID.asFloat ]           ));
      SQL.Add(       '   and d.pr_emp_id = p.id                                          ');
      SQL.Add(       '   and p.elements_id = e.id(+)                                     ');
      SQL.Add(       '   and d.ta_labor_id is NULL                                       ');
      SQL.Add(       ' group by p.elements_id,                                           ');
      SQL.Add(       '       e.elem_descrip                                              ');

      Open;

      {account for floor dispo}
      AFloorDispo:= GetFloorDispoAmountOf( 'LABOR' );

      while not Eof do
      begin
        ATotal:= FieldByName('labor').asFloat * ActCav_Proportion;

        // Aprod_hrs := SelectValueFmtAsFloat('select NVL( prod_hrs,0 ) from day_emp where dayprod_id = %f', [TblMasterDAYPROD_ID.asFloat]);
        // AA 07-06-2009 the above is wrong - switch getting prod_hrs based on the summary sql that calculates the labor dollar amount
        AProd_Hrs:= FieldByName('prod_hrs').asFloat;

        if ATotal < 0 then
           {just accept it}
        else if ATotal > AFloorDispo then
           begin
             ATotal:= ATotal - AFloorDispo;
             AFloorDispo:= 0;
           end
        else
           begin
             AFloorDispo:= AFloorDispo - ATotal;
             ATotal:= 0;
           end;
        // 07/01/2009 Remmed "if" statement below (Byron).  Allow adding labor,
        //            even if the total = 0.  Requested by Nancy and Lael.
        //if ATotal <> 0 then
           TransDispo1.AddLabor( ATotal,
                                 AIN_OUT,
                                 Labor_Cost_Element_Def( FieldByName('elem_descrip').asString ),
                                 Aprod_hrs,
                                 TRUE {store back in matprod for later reverse prod capability} );
        ALabor_Added:= TRUE;
        Next;
      end;
    end;
  end; {Std Labor}

  {ACT Labor}
  procedure Add_ACT_Labor;
  var
    I: Integer;
  begin
    with AQry do
    begin
      AQry.Close; AQry.SQL.Clear;
      SQL.Add(       'select c.id as cost_alloc_dtl_id,                         ');
      SQL.Add(       '       e.elem_descrip,                                    ');
      SQL.Add(       '       NVL(c.act_hrs, 0) as act_hrs,                      ');
      SQL.Add(       '       NVL(c.act_rate,0) * NVL(c.act_hrs,0) as labor      ');
      SQL.Add(       '  from cost_alloc_dtl c,                                  ');
      SQL.Add(       '       elements e                                         ');
      SQL.Add(IQFormat('  where c.day_part_id = %f', [ TblMasterID.asFloat ]      ));
      SQL.Add(       '    and c.origin = ''ACT''                                ');
      SQL.Add(       '    and c.elements_id = e.id(+)                           ');

      Open;
      while not Eof do
      begin
        {Add Labor}
        TransDispo1.AddLabor( FieldByName('labor').asFloat * ActCav_Proportion,
                              AIN_OUT,
                              Labor_Cost_Element_Def( FieldByName('elem_descrip').asString ),
                              FieldByName('act_hrs').asFloat,
                              TRUE {store back in matprod for later reverse prod capability} );
        ALabor_Added:= TRUE;

        {Change Source from day_part to cost_alloc_dtl}
        with TransDispo1, TIQWebTranLabor( TransObjects[ TransObjects.Count - 1 ]) do
        begin
          Trans_Source     := 'COST_ALLOC_DTL';
          Trans_Source_ID  := FieldByName('cost_alloc_dtl_id').asFloat;
        end;

        Next;
      end;
    end;
  end; {Act Labor}

begin
  AQry:= TFDQuery.Create(NIL);
  ALabor_Added:= FALSE;
  try
    AQry.Connection := UniMainModule.FDConnection1;
    Add_STD_Labor;
    Add_ACT_Labor;
    if not ALabor_Added then
      TransDispo1.AddLabor( 0, AIN_OUT, Labor_Cost_Element_Def(''), 0 );
  finally
    if Assigned(AQry) then AQry.Free;
  end;
end;

{ TODO -oSanketG -cWC : Need to revisit }
{procedure TFrmDispoProduction.PkMasterFGMultiIQDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  // D...
end;}

procedure TFrmDispoProduction.PkMasterFGMultiIQModify(Sender: TObject; var Action: TModalResult; var ResultValue: Variant);
begin
  inherited;
  if Action = mrOK then
  begin
     Trans_Share.AssignFGMultiMakeToOrderDetailFromWorkorder( DtoF(ResultValue), TblMasterWorkorder_ID.asFloat );
     QryFGMulti.Close;
     QryFGMulti.Open;
  end;
end;

procedure TFrmDispoProduction.PkMasterFGMultiRelieveIQModify(Sender: TObject; var Action: TModalResult; var ResultValue: Variant);
begin
  if SelectValueFmtAsFloat('select wo_bom.is_anything_allocated(%f, %f) from dual', [ TblMasterWorkorder_ID.asFloat, TblDetailARINVT_ID.asFloat ]) = 1 then
     // 'Hard material allocations were found.  New location(s) cannot be created or used.'
     raise Exception.Create(dispo_rscstr.cTXT0000011);

  inherited PkMasterFGMultiIQModify(Sender, Action, ResultValue );  {note we call inherited PkMasterFGMultiIQModify to avoid assigning make_to_order_detail_id}
end;


procedure TFrmDispoProduction.btnDispositionClick(Sender: TObject);
var
  A                   : Variant;
  AIsExternalStartTran: Boolean;
  ASaveReason         : string;
begin
  CheckPosted;

  TransDispo1.Day_Part_ID:= TblMaster.FieldByName('ID').asFloat;

  A:= SelectValueArrayFmt('select h.orderno, h.mfgno from hist_illum_rt h, hist_illum_part p where p.hist_illum_rt_id = h.id and p.id = %f',
      [ TblMaster.FieldByName('hist_illum_part_id').asFloat ]);

  if VarArrayDimCount( A ) > 0 then
  begin
    TransDispo1.OrderNo:= A[ 0 ];
    TransDispo1.MfgNo  := A[ 1 ];
  end;

  TransDispo1.Trans_Date:= GetProdDate;

  {04-10-2013 send work_center_id and workorder_id so we could create trans_alert record if needed}
  CheckPopulateProductionData( TransDispo1, TblMaster.FieldByName('work_center_id').asFloat, TblMaster.FieldByName('workorder_id').asFloat );  // dsp_cust.pas

  {Dec-27-2002 Ensure we have IN transaction even with 0 qty so FG_LotNo will get propogated to backflushed materials}
  EnsureINTransSideExists;

  try
    AIsExternalStartTran:= UniMainModule.FDConnection1.InTransaction;
    if not AIsExternalStartTran then
       UniMainModule.FDConnection1.StartTransaction;

    ExecuteCommandFmt('update matprod set is_processed_on_fly = null where day_part_id = %f', [ TblMaster.FieldByName('id').asFloat ]);

    {Aug-30-2005 - normally user does not assign phantom items because we explode down to components. Assgin TEMPORARY location so we could do IN/OUT on fly (for PIT)}
    EnsureConsumedPhantomItemsLocationsAssigned;

    {09-16-2013 - moved to PROD_REP.PROD_MATSUM}
    {09-14-2009 - check if this is a rework workorder and create an OUT trans record from non-conform location}
    // CheckIsReworkAddOutFromNonConform;

    // 05-14-2014 we want to recalc rolling average of the fgmulti act cost when components of the blend are submitted below in PrepareDispositionConsumedPhantomItems
    if HasPhantomInOutOnFly( TblMaster.FieldByName('id').asFloat {day_part_id}, TblMasterArinvt_ID.asFloat ) then
       TransDispo1.AppendAttribute('SKIP_FLOOR_DISPO_REDO_ACT_COST');

    inherited;

    {Aug-30-2005 - do the on fly IN/OUT thing for phantom items}
    ASaveReason:= TransDispo1.Trans_Reason;
    // if not FReverseDisposition then
    try
      TransDispo1.ClearTransObjectsList;
      TransDispo1.IsParent_Arinvt_Assigned:= TRUE;
      TransDispo1.Attribute:= '';
      PrepareDispositionConsumedPhantomItems( TblMasterArinvt_ID.asFloat );
      if TransDispo1.TransObjects.Count > 0 then
         self.ExecuteTransaction;   // TransDispo1.Execute;
    finally
      {04-20-2006 restore trans_reason otherwise it carries over to ALL transactions during auto dispo}
      TransDispo1.Trans_Reason:= ASaveReason;
      TransDispo1.IsParent_Arinvt_Assigned:= FALSE;
    end;

    AssignDispositioned;

    // 03-04-2014 turn the flag off so in case they reverse dispo and dispo again we will backflush it
    ExecuteCommandFmt('update matprod_actual_use set floor_dispo_posted = ''N'' where daypart_id = %f and nvl(floor_dispo_posted,''N'') = ''Y''', [ TblMaster.FieldByName('id').asFloat ]);

    if not AIsExternalStartTran then
       UniMainModule.FDConnection1.Commit;
  finally
    if not AIsExternalStartTran and UniMainModule.FDConnection1.InTransaction then
       UniMainModule.FDConnection1.RollBack;
  end;

  Append_To_Cost_Allocate( TblMaster.FieldByName('ID').asFloat );

  // 03-20-2013 process cost!
  DoAfterDisposition;
end;

function TFrmDispoProduction.HasPhantomInOutOnFly( ADay_Part_ID, AArinvt_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1                       '+
                     '  from matprod m, arinvt a     '+
                     ' where m.day_part_id = %f      '+
                     '   and m.arinvt_id = a.id      '+  // to get arinvt.phantom
                     '   and ( NVL(m.phantom_mat_qty,0) <> 0 and NVL(m.tot_mat_qty,0) = 0 '+  // consider only phantom items.
                     '         or                    '+  // they zero out tot_mat_qty and wanted to dispo the components
                     '         NVL(m.phantom_mat_qty,0) = 0 and NVL(m.tot_mat_qty,0) = 0 and a.phantom = ''Y'' ' +
                     '       )                       '+
                     '   and m.parent_arinvt_id = %f '+
                     '   and rownum < 2              ',
                     [ ADay_Part_ID, AArinvt_ID ]) = 1;
end;


procedure TFrmDispoProduction.DoAfterDisposition;
begin
  if FReverseDisposition then
     EXIT;

  // if not GetPostActCosInv() then  // future use
  //   EXIT;

  // CreateExecuteJobCosting;  // obsolete
end;

procedure TFrmDispoProduction.EnsureINTransSideExists;
var
  ALot: string;
begin
  if FReverseDisposition then
     EXIT;

  with TblMaster do
  begin
    {is any IN records found}
    if not (TblMasterLoc.Eof and TblMasterLoc.Bof) then
       EXIT;

    {no IN records found - do we have any backflushed materials assigned}
    // 05-14-2014 EIQ-3066 PIT at Standard – When reporting only chargeable downtime in the production report the resulting Translog record has no item number and therefore is not showing correctly in PIT.
    //            Ensure we always have an IN transaction
    // if TblDetail.Eof and TblDetail.Bof then
    //   EXIT;

    {well, we have OUT records but no IN - create 1 IN record}
    ALot:= SelectValueFmtAsString('select fg_lotno from dayprod where id = %f', [ FieldByName('dayprod_id').asFloat ]);

    {"Add to" Location}
    AppendToLocation( FieldByName('arinvt_id').asFloat,                         {inherited: Dsp_Cust}
                      TblMaster.FieldByName('standard_id').asFloat,
                      0,                        {Qty    }
                      0,
                      TblMasterLoc,
                      ALot,                     {FGLot #}
                      'TEMPORARY',
                      TblMaster.FieldByName('work_center_id').asFloat,
                      TblMaster.FieldByName('workorder_id').asFloat );
  end;
end;


procedure TFrmDispoProduction.EnsureConsumedPhantomItemsLocationsAssigned;

  procedure EnsureNoneZeroConsumedPhantomItemsIsolated;
  {if we have a phantom item with some qty consumed and the rest is blown to components -
   make the qty that was blown down as as record by itself so we could assign matprod_location}
  begin
    ExecuteCommandFmt('insert into matprod                                                                                       '+
              '     ( day_part_id,  arinvt_id,   arinvt_id_std,  dispo, class, itemno, rev, descrip,  descrip2, rgprcnt, '+
              '       ptsper,       std_mat_qty, std_rg_qty,     std_cost,     top_phantom_arinvt_id, floor_dispo_qty,   '+
              '       tot_mat_qty,  tot_rg_qty,                                                                          '+
              '       parent_arinvt_id, phantom_mat_qty, unit )                                                                '+
              ' select                                                                                                   '+
              '       day_part_id,  arinvt_id,   arinvt_id_std,  dispo, class, itemno, rev, descrip,  descrip2, rgprcnt, '+
              '       ptsper,       std_mat_qty, std_rg_qty,     std_cost,     top_phantom_arinvt_id, floor_dispo_qty,   '+
              '       0,            0,                                                                                   '+  // note we assing 0 to tot_mat_qty because we'll be using phantom_mat_qty
              '       parent_arinvt_id, phantom_mat_qty, unit                                                                  '+
              '  from matprod                                                                                            '+
              ' where day_part_id = %f                                                                                   '+
              '   and phantom_mat_qty > 0                                                                                '+
              '   and ( NVL(tot_mat_qty,0) > 0  or NVL(tot_rg_qty,0) > 0 )                                               ',
              [ TblMaster.FieldByName('id').asFloat ]);
  end;

begin
  //if FReverseDisposition then
  //   EXIT;

  {Phantom items are going to be transacted IN/OUT - ensure we don't mix some consumed qty and qty blown down to components}

  // 01-11-2013 Reverse Disposition - NonZeroConsumedPhantomItems already isolated - skip this step to avoid re-introducing the same IN record of the phantom item
  if not FReverseDisposition then
     EnsureNoneZeroConsumedPhantomItemsIsolated; {local above}

  {For each phantom item with phantom_mat_qty assigned - assign fgmulti location}
  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(IQFormat('select m.id,                        '+
                     '       m.arinvt_id,                 '+
                     '       m.phantom_mat_qty            '+
                     ' from matprod m                     '+
                     'where m.day_part_id = %f            '+
                     '  and NVL(m.phantom_mat_qty,0) <> 0 '+
                     '  and NVL(m.tot_mat_qty,0) = 0      ',
                     [ TblMaster.FieldByName('id').asFloat ]));
    Open;
    while not Eof do
    begin
      if TblDetail.Locate('ID', FieldByName('id').asFloat, []) then
      begin
        ExecuteCommandFmt('delete from matprod_location where matprod_id = %f', [ FieldByName('id').asFloat ]);
        TblDetailLoc.Refresh;

        AppendToLocationFIFO( FieldByName('arinvt_id').asFloat,                  {inherited: Dsp_Cust}
                              TblMaster.FieldByName('standard_id').asFloat,
                              FieldByName('phantom_mat_qty').asFloat,
                              0,                                                  // tot_rg_qty
                              TblDetailLoc,
                              'TEMPORARY',
                              TblMaster.FieldByName('work_center_id').asFloat,
                              TblMasterLocLotNo.asString );
      end;

      Next;
    end;
  finally
    Free;
  end;
end;


procedure TFrmDispoProduction.PrepareDispositionConsumedPhantomItems( AParent_Arinvt_ID: Real );

  {-----------------------------------------------------------------------------}
  procedure Add_IN( AArinvt_ID, AParent_Arinvt_ID: Real );
  begin
    with TFDQuery.Create(NIL) do
    try
       Connection := UniMainModule.FDConnection1;
       SQL.Add(IQFormat('select NVL(m.quan,0) as quan,         '+
                        '       m.rg_quan,                     '+
                        '       m.fgmulti_id,                  '+
                        '       x.top_phantom_arinvt_id        '+
                        '  from                                '+
                        '       matprod_location m,            '+
                        '       matprod x                      '+
                        ' where                                '+
                        '       m.day_part_id = %f             '+
                        '   and m.matprod_id = x.id            '+
                        '   and NVL(x.arinvt_id, 0) = %f       '+
                        '   and NVL(x.parent_arinvt_id, 0) = %f '+
                        '   and (NVL(x.phantom_mat_qty,0) <> 0 and NVL(x.tot_mat_qty,0) = 0) ',  // consider only phantom items.
                        [ TblMaster.FieldByName('id').asFloat,
                          AArinvt_ID,
                          AParent_Arinvt_ID ]));
       Open;
       while not Eof do
       begin
          TransDispo1.AddInTran( FieldByName('quan').asFloat,         { Qty  }
                                 0,                                   { RgQty}
                                 FieldByName('fgmulti_id').asFloat,   { FGMulti_ID }
                                 TransDispo1.Act_Cost );              { 0 - not filled in }

          {allow on fly in-out phantom transaction to bypass make to order check}
          TIQWebTransIn( TransDispo1.TransObjects[ TransDispo1.TransObjects.Count - 1 ]).AllowMakeToOrderTrans:= TRUE;

          Next;
       end;
    finally
       Free;
    end;

  end;

  {-----------------------------------------------------------------------------}
  procedure Add_OUT( AParent_Arinvt_ID: Real ); {note it is different from the one passed above to the main proc}
  begin
    with TFDQuery.Create(NIL) do
    try
       Connection := UniMainModule.FDConnection1;
       SQL.Add(IQFormat('select NVL(m.quan,0) as quan,          '+
                        '       m.rg_quan,                      '+
                        '       m.fgmulti_id,                   '+
                        '       x.top_phantom_arinvt_id,        '+
                        '       x.id as matprod_id              '+
                        '  from                                 '+
                        '       matprod_location m,             '+
                        '       matprod x                       '+
                        ' where                                 '+
                        '       m.day_part_id = %f              '+
                        '   and m.matprod_id = x.id             '+
                        '   and NVL(x.parent_arinvt_id, 0) = %f '+
                        '   and nvl(x.is_processed_on_fly, ''N'') <> ''Y'' ',
                        [ TblMaster.FieldByName('id').asFloat,
                          AParent_Arinvt_ID ]));
       Open;
       while not Eof do
       begin
          TransDispo1.AddOutTran( FieldByName('quan').asFloat,                     { Qty  }
                                  FieldByName('rg_quan').asFloat,                  { RgQty}
                                  FieldByName('fgmulti_id').asFloat,               { FGMulti_ID }
                                  FieldByName('top_phantom_arinvt_id').asFloat );  { top_phantom_arinvt_id }

          {Mark this matprod as is_processed_on_fly = Y so we won't touch it again if the same parent_arinvt_id shows up again}
          ExecuteCommandFmt('update matprod set is_processed_on_fly = ''Y'' where id = %f', [ FieldByName( 'matprod_id' ).asFloat ]);

          {allow on fly in-out phantom transaction to bypass make to order check}
          TIQWebTransOut( TransDispo1.TransObjects[ TransDispo1.TransObjects.Count - 1 ]).AllowMakeToOrderTrans:= TRUE;
          // 03-08-2016 EIQ-11020 PIT Standard - Disposition transaction incorrect when multi level phantom BOM consumes same item - CRM #1407353
          TIQWebTransOut( TransDispo1.TransObjects[ TransDispo1.TransObjects.Count - 1 ]).Parent_Arinvt_ID:= AParent_Arinvt_ID;

          Next;
       end;
    finally
       Free;
    end;
  end;

  {-----------------------------------------------------------------------------}
begin {PrepareDispositionConsumedPhantomItems main}

  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add( IQFormat( 'select m.arinvt_id             '+
                       '  from matprod m, arinvt a     '+
                       ' where m.day_part_id = %f      '+
                       '   and m.arinvt_id = a.id      '+  // to get arinvt.phantom
                       '   and ( NVL(m.phantom_mat_qty,0) <> 0 and NVL(m.tot_mat_qty,0) = 0 '+  // consider only phantom items.
                       '         or                    '+  // they zero out tot_mat_qty and wanted to dispo the components
                       '         NVL(m.phantom_mat_qty,0) = 0 and NVL(m.tot_mat_qty,0) = 0 and a.phantom = ''Y'' ' + // 09-03-2010 Prod report - override phantom item calc #455955
                       '       )                       '+
                       '   and m.parent_arinvt_id = %f ',
                       [ TblMaster.FieldByName('id').asFloat,
                         AParent_Arinvt_ID  ]));
    Open;
    while not Eof do
    begin
      {06-16-2006 move it outside of the dispositioning to execute all records at once.
       This done to prevent deleting empty fgmulti locations that are involved in multiple IN/OUT trans}
      // TransDispo1.ClearTransObjectsList;

      {04-20-2006 Keep the same trans_batch}
      // TransDispo1.Trans_Batch := 0;
      // TransDispo1.TransBatchAutoInc:= TRUE;
      TransDispo1.Trans_Reason:= 'DISPOSITION phantom in/out on-fly';

      Add_IN ( FieldByName('arinvt_id').asFloat, AParent_Arinvt_ID ); {arinvt_id as an IN tran side}
      Add_OUT( FieldByName('arinvt_id').asFloat ); {get children of arinvt_id for OUT tran side}

      {06-16-2006 move it outside of the dispositioning to execute all records at once.
      // TransDispo1.Execute;

      {Recursive call}
      PrepareDispositionConsumedPhantomItems( FieldByName('arinvt_id').asFloat );

      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmDispoProduction.Append_To_Cost_Allocate( ADay_Part_ID: Real );
begin
  if FReverseDisposition then
     EXIT;

  with procAppendCostAlloc do
  begin
    Prepare;
    Params[0].Value := Trunc(ADay_Part_ID);
    ExecProc;
  end;
end;

procedure TFrmDispoProduction.SrcMasterDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;  {nothing}
  SetDataSetReadOnly;
end;

procedure TFrmDispoProduction.ExecuteTransaction;
begin
  TransDispo1.Execute;
end;

function TFrmDispoProduction.DoGetNewLocationByArinvt( ArinvtID:Real; var AFGMultiID: Real ): TModalResult;
var
 ALot:string;
begin
  if LocationTableFromEditedGrid = gridTargetLoc.DataSource.DataSet then
  begin
    {New is clicked on FGmulti picklist for FG part}
    ALot:= SelectValueFmtAsString('select fg_lotno from dayprod where id = %f', [ TblMaster.FieldByName('dayprod_id').asFloat ]);
    { TODO -oSanketG -cWC : Need to revisit , dependent on newlocat}
    //Result:= GetNewLocationDefaultLotByArinvt( ArinvtID, AFGMultiID, ALot, GetSysDate, FDivision_ID, TblMaster.FieldByName('Workorder_ID').asFloat ); {NewLocat.pas}
  end
  else
    {New is clicked on Consumed material locations FGmulti picklist}
    Result:= inherited DoGetNewLocationByArinvt( ArinvtID, AFGMultiID );
end;

function TFrmDispoProduction.FindWorkorderOnGetNewLocationByArinvt: Real;
begin
  Result:= TblMaster.FieldByName('Workorder_ID').asFloat;
end;

procedure TFrmDispoProduction.sbtnLeftAllClick(Sender: TObject);
begin
  if Dispositioned <> 'Y' then
     DeleteFromLocation( TblMaster.FieldByName('ID').asFloat, TblDetailLoc );
end;

procedure TFrmDispoProduction.sbtnRightAllClick(Sender: TObject);
begin
  // inherited; n
  if Dispositioned <> 'Y' then
     AssignAutoDispoMatprodLocations('TEMPORARY');
end;


procedure TFrmDispoProduction.sbtnRightClick(Sender: TObject);
begin
  inherited;  {put dataset in edit mode}

  if TblDetailIsSerialized.asString = 'Y' then
  begin
     AssignLocationBasedOnLabels;
     EXIT;
  end;

  with gridMatLoc.DataSource.DataSet do
  begin
    FieldByName('QUAN').asFloat   := TblDetailTOT_MAT_QTY.asFloat;
    if not FieldByName('RG_QUAN').ReadOnly then
       FieldByName('RG_QUAN').asFloat:= TblDetailTOT_RG_QTY.asFloat;
  end;
end;

procedure TFrmDispoProduction.BeforeDisposition;
begin
  CheckSerializedItem;

  if IsReworkWorkorder then
  begin
    ExecOutTransFirst:= TRUE; // first execute out and then in transaction so the labels will be in sync with inv
  end;
end;

procedure TFrmDispoProduction.CheckSerializedItem;
var
  AIsSerialized: Boolean;
begin
  AIsSerialized:= SelectValueByID('is_linked_to_serial', 'arinvt', TblMasterArinvt_ID.asFloat ) = 'Y';
  if AIsSerialized and (SelectValueFmtAsFloat('select 1 from day_part_location where day_part_id = %f and nvl(quan,0) <> 0', [ TblMasterID.asFloat ]) = 1) then
     // 'This is a serialized inventory item.  Production reporting should be done using a scanner.'
     raise Exception.Create(dispo_rscstr.cTXT0000010);
end;

procedure TFrmDispoProduction.TblMasterCalcFields(DataSet: TDataSet);
var
  ALookupMfgType: String;
begin
  inherited;  {nothing}

  AssignMasterLookUpFields( TblMasterHIST_ILLUM_PART_ID.asFloat );

  with DataSet do
    if FieldByName('DISPO').asString = 'Y' then
       FieldByName('left_to_dispo').asFloat:= 0
    else if DoNotDispoFloorPartialQty( FieldByName('arinvt_id').asFloat ) then
       FieldByName('left_to_dispo').asFloat:= 0
    else
       FieldByName('left_to_dispo').asFloat:= fMax( FieldByName('GOOD_PTS').asFloat - FieldByName('FLOOR_DISPO_QTY').asFloat, 0);

  TblMasterGood_Pts_Disp.asFloat       := DataSet.FieldByName('good_pts').asFloat;
  TblMasterFloor_Dispo_Qty_Disp.asFloat:= DataSet.FieldByName('floor_dispo_qty').asFloat;
  TblMasterLeft_Dispo_Disp.asFloat     := DataSet.FieldByName('left_to_dispo').asFloat;

  ALookupMfgType := IQMS.Common.MfgShare.lookup_mfgtype(TblMasterMfg_Type.asString);
  if ((ALookupMfgType = 'EXTRUSION') or
      ((ALookupMfgType = 'SLITTING') and not (IQMS.Common.MfgShare.IsMfgTypeByWeight(TblMasterMfg_Type.asString)))) then
  begin
     TblMasterGood_Pts_Disp.asFloat       := IQRound( TblMasterGood_Pts_Disp.asFloat        / (TblMasterPtWt.asFloat / 12), 2);
     TblMasterFloor_Dispo_Qty_Disp.asFloat:= IQRound( TblMasterFloor_Dispo_Qty_Disp.asFloat / (TblMasterPtWt.asFloat / 12), 2);
     TblMasterLeft_Dispo_Disp.asFloat     := IQRound( TblMasterLeft_Dispo_Disp.asFloat      / (TblMasterPtWt.asFloat / 12), 2);
  end;
end;

procedure TFrmDispoProduction.AssignMasterLookUpFields( AIllum_Part_ID: Real );
begin
  if (AIllum_Part_ID = 0) then
     begin
       TblMasterClass.Clear;
       TblMasterItemNo.Clear;
       TblMasterRev.Clear;
       TblMasterDescrip.Clear;
       TblMasterArinvt_ID.Clear;
       TblMasterStandard_ID.Clear;
       TblMasterUnit.Clear;
       TblMasterPtWt.Clear;
       TblMasterMfg_Type.Clear;
       TblMasterEPlant_Name.Clear;
       TblMasterHist_Illum_Rt_ID.Clear;
       TblMasterWork_Center_ID.Clear;
       TblMasterWorkorder_ID.Clear;
       TblMasterPtorder_ID.Clear;
     end
  else
     begin
       {Open QryHist_Illum_Rt}
       QryHist_Illum_Rt.Close;
       QryHist_Illum_Rt.ParamByName('illum_part_id').Value := AIllum_Part_ID;
       QryHist_Illum_Rt.Open;

       {Assign Fields}
       TblMasterClass.asString          := QryHist_Illum_RtCLASS.asString;
       TblMasterItemNo.asString         := QryHist_Illum_RtITEMNO.asString;
       TblMasterRev.asString            := QryHist_Illum_RtREV.asString;
       TblMasterDescrip.asString        := QryHist_Illum_RtDESCRIP.asString;
       TblMasterArinvt_ID.asString      := QryHist_Illum_RtARINVT_ID.asString;
       TblMasterStandard_ID.asString    := QryHist_Illum_RtSTANDARD_ID.asString;
       TblMasterUnit.asString           := QryHist_Illum_RtUNIT.asString;
       TblMasterPtWt.asString           := QryHist_Illum_RtPTWT.asString;
       TblMasterMfg_Type.asString       := QryHist_Illum_RtMFG_TYPE.asString;
       TblMasterEPlant_Name.asString    := QryHist_Illum_RtEPLANT_NAME.asString;
       TblMasterHist_Illum_Rt_ID.asFloat:= QryHist_Illum_RTHIST_ILLUM_RT_ID.asFloat;
       TblMasterWork_Center_ID.asFloat  := QryHist_Illum_RTWORK_CENTER_ID.asFloat;
       TblMasterWorkorder_ID.asFloat    := QryHist_Illum_RTWORKORDER_ID.asFloat;
       TblMasterDescrip2.asString       := QryHist_Illum_RTDESCRIP2.asString;
       TblMasterPtorder_ID.asFloat      := QryHist_Illum_RTPTORDER_ID.asFloat;
     end;
end;


procedure TFrmDispoProduction.TblMasterLocCalcFields(DataSet: TDataSet);
begin
  inherited;  {nothing}
  if TblMasterLocDAY_PART_ID.asFloat = TblMasterID.asFloat then  {Assign lookup fields if TblMasterLoc has settled}
     AssignMasterLocationLookUpFields( TblMasterLocFGMULTI_ID.asFloat )
  else
     AssignMasterLocationLookUpFields( 0 );                      {TblMasterLoc has not settled yet}
end;


function TFrmDispoProduction.PositionFGMultiLookupQuery( AFGMulti_ID: Real ): Boolean;
begin
  with QryFGMulti do
  begin
    Close;
    ParamByName('fgmulti_id').Value := AFGMulti_ID;
    Open;
    Result:= not (eof and bof);
  end;
end;

procedure TFrmDispoProduction.AssignMasterLocationLookUpFields( AFGMulti_ID: Real );
begin
  TblMasterLocLocation.Clear;
  TblMasterLocLotNo.Clear;
  TblMasterLocIn_Date.Clear;
  TblMasterLocEPlant_Name.Clear;
  TblMasterLocLocation_Exists.asString:= 'N';

  if AFGMulti_ID = 0 then
     EXIT
  else if PositionFGMultiLookupQuery( AFGMulti_ID ) then
     begin
       TblMasterLocLocation.asString   := QryFGMultiLOC_DESC.asString;
       TblMasterLocLotNo.asString      := QryFGMultiLOTNO.asString;
       // TblMasterLocIn_Date.asString := QryFGMultiIN_DATE.asString;
       {Aug-8-2007 dd-mmm-yy setting had problems with the above}
       TblMasterLocIn_Date.asDateTime  := QryFGMultiIN_DATE.asDateTime;
       TblMasterLocEPlant_Name.asString:= QryFGMultiEPLANT_NAME.asString;
       TblMasterLocLocation_Exists.asString:= 'Y';
     end
  else
     begin
       TblMasterLocLocation.asString   := TblMasterLocHIST_LOC_DESC.asString;
       TblMasterLocLotNo.asString      := TblMasterLocHIST_LOTNO.asString;
     end;
end;


procedure TFrmDispoProduction.TblDetailLocCalcFields(DataSet: TDataSet);
begin
  inherited;  {nothing}
  {Call lookup fields if child table (TblDetailLoc) has settled}
  if TblDetailLocMATPROD_ID.asFloat = TblDetailID.asFloat then
     AssignDetailLocationLookUpFields( TblDetailLocFGMULTI_ID.asFloat )
  else
     AssignDetailLocationLookUpFields( 0 );
end;

procedure TFrmDispoProduction.AssignDetailLocationLookUpFields( AFGMulti_ID: Real );
begin
  TblDetailLocStringField.Clear;
  TblDetailLocStringField2.Clear;
  TblDetailLocEPlant_Name2.Clear;
  TblDetailLocLocation_Exists.asString:= 'N';

  if (AFGMulti_ID = 0) then
     EXIT
  else if PositionFGMultiLookupQuery( AFGMulti_ID ) then
     begin
       TblDetailLocStringField.asString := QryFGMultiLOC_DESC.asString;
       TblDetailLocStringField2.asString:= QryFGMultiLOTNO.asString;
       TblDetailLocEPlant_Name2.asString:= QryFGMultiEPLANT_NAME.asString;
       TblDetailLocLocation_Exists.asString:= 'Y';
     end
  else
     begin
       TblDetailLocStringField.asString := TblDetailLocHIST_LOC_DESC.asString;
       TblDetailLocStringField2.asString:= TblDetailLocHIST_LOTNO.asString;
     end;
end;


procedure TFrmDispoProduction.AssignEPlantFilter(DataSet: TDataSet);
begin
  inherited; {nothing}
  IQAssignEPlantFilter( DataSet );
end;

procedure TFrmDispoProduction.PkMasterFGMultiBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // IQAssignEPlantFilter( DataSet );

  if FDivision_ID > 0 then with DataSet do
  begin
    if Filter > ''  then
       Filter:= Format('%s and (Division_ID <> NULL and Division_ID = %.0f)', [ Filter, FDivision_ID ])
    else
       Filter:= Format('Division_ID <> NULL and Division_ID = %.0f', [ FDivision_ID ]);
  end;

  // TFDQuery(DataSet).ParamByName('workorder_id').Value := TblMasterWorkorder_ID.asFloat;
  AssignQueryParamValue(DataSet, 'workorder_id', TblMasterWorkorder_ID.asFloat );
end;

procedure TFrmDispoProduction.TblDetailBeforePost(DataSet: TDataSet);
begin
  inherited;
  AssignIDBeforePost(DataSet);

  // give a warining if qty = 0
  if (DataSet.FieldByName('TOT_MAT_QTY').asFloat = 0)
     and
     (SelectValueByID('tot_mat_qty', 'matprod', DataSet.FieldByName('id').asFloat) <> 0) then
  begin
    if TFrmDispoSecConfZeroMaterial.DoShowModal <>  mrYes then // dispo_sec_conf_zero_material.pas
       ABORT;
  end;
end;

procedure TFrmDispoProduction.TblDetailCalcFields(DataSet: TDataSet);
begin
  inherited; {nothing}
  TblDetailEPlant_Name.AsString:= SelectValueFmtAsString( 'select ''['' || e.ID || '']  '' || e.name ' +
                                                '  from arinvt a, eplant e where a.id = %f and a.eplant_id = e.id',
                                                [ TblDetailARINVT_ID.asFloat ]);

  TblDetailIsSerialized.asString:= SelectValueByID('is_linked_to_serial', 'arinvt', TblDetailARINVT_ID.asFloat );
  TblDetailOnHand.asFloat:= SelectValueByID('onhand', 'arinvt', TblDetailARINVT_ID.asFloat );
end;

procedure TFrmDispoProduction.AssignIDBeforePost(DataSet: TDataSet);
begin
  inherited; {Nothing}
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmDispoProduction.TblDetailLocNewRecord(DataSet: TDataSet);
begin
  inherited; {nothing}
  TblDetailLocDAY_PART_ID.asFloat:= TblDetailDAY_PART_ID.asFloat;
  TblDetailLocARINVT_ID.asFloat  := TblDetailARINVT_ID.asFloat;
end;

{procedure TFrmDispoProduction.gridTargetLocDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  DrawNoneExistLocationRed( Sender, Rect, DataCol, Column, State );
end;}

{ TODO -oSanketG -cWC : Need to revisit ,
[dcc32 Error] Dsp_Prod.pas(2320): E2003 Undeclared identifier: 'DrawNoneExistLocationRed'}
{procedure TFrmDispoProduction.DrawNoneExistLocationRed( Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  ALocation_Exists: string;
  AFGMulti_ID     : Real;
begin
  with Sender as TUniDBGrid do
  begin
    if not (Assigned(DataSource) and Assigned(DataSource.DataSet) and Assigned( DataSource.DataSet.FindField('Location_Exists')) and Assigned(DataSource.DataSet.FindField('fgmulti_id'))) then
       EXIT;
    ALocation_Exists:= DataSource.DataSet.FieldByName('Location_Exists').asString;
    AFGMulti_ID     := DataSource.DataSet.FieldByName('fgmulti_id').asFloat;
  end;

  if (AFGMulti_ID > 0) and (ALocation_Exists <> 'Y') then
  begin
     if gdSelected in State then
        begin
          (Sender as TUniDBGrid).Canvas.Brush.Color:= clBlack;
          (Sender as TUniDBGrid).Canvas.Font.Color := clRed;
        end
     else
        begin
          (Sender as TUniDBGrid).Canvas.Brush.Color:= clWhite;
          (Sender as TUniDBGrid).Canvas.Font.Color := clRed;
        end;

     (Sender as TUniDBGrid).DefaultDrawColumnCell( Rect, DataCol, Column, State );
  end;
end;}


{procedure TFrmDispoProduction.gridMatLocDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  DrawNoneExistLocationRed( Sender, Rect, DataCol, Column, State );
end;}


function TFrmDispoProduction.IsReworkWorkorder: Boolean;
begin
  Result:= IQMS.Common.MfgShare.lookup_mfgtype(TblMasterMfg_Type.asString) = 'REWORK';
end;


procedure TFrmDispoProduction.CheckIsReworkAddOutFromNonConform;
var
  AList: TList;
  I: Integer;
  ATotalQty: Real;
  AMatProd_ID: Real;
begin
  {obsolete}

  if FReverseDisposition then
     EXIT;

  if not IsReworkWorkorder then
     EXIT;

  {based on IN dispo qty create OUT from the non-conform locations}

  ATotalQty:= SelectValueFmtAsFloat('select Sum(quan) from day_part_location where day_part_id = %f', [ TblMaster.FieldByName('id').asFloat ]);

  TblDetail.Append;
  AMatProd_ID:= GetNextID('matprod');
  TblDetailID.asFloat           := AMatProd_ID;
  TblDetailDAY_PART_ID.asFloat  := TblMasterID.asFloat;
  TblDetailARINVT_ID.asFloat    := TblMasterArinvt_ID.asFloat;
  TblDetailARINVT_ID_STD.asFloat:= TblMasterArinvt_ID.asFloat;
  TblDetailCLASS.asString       := TblMasterClass.asString;
  TblDetailITEMNO.asString      := TblMasterItemNo.asString;
  TblDetailREV.asString         := TblMasterRev.asString;
  TblDetailDESCRIP.asString     := TblMasterDescrip.asString;
  TblDetailDESCRIP2.asString    := TblMasterDescrip2.asString;
  TblDetailTOT_MAT_QTY.asFloat  := ATotalQty;
  TblDetailSTD_MAT_QTY.asFloat  := ATotalQty;
  TblDetail.Post;
  TblDetail.Locate('ID', AMatProd_ID, []);  {03-08-2011 bde was losing the position}

  if TblDetailIsSerialized.asString = 'Y' then
  begin
     AssignLocationBasedOnLabels( TRUE );
     LoadColumnValueIntoStringList( FReworkMaster_Label_List,      {pas}
                                    Format( 'select master_label_id from matprod_location where matprod_id = %.0f and master_label_id is not null', [ TblDetailID.asFloat ]));
     IQAssert( FReworkMaster_Label_List.Count > 0, Format( dispo_rscstr.cTXT0000018, [ Trim( TblDetail.FieldByName('ITEMNO').asString )])); // 'No labels selected for serialized item %s - unable to continue.'
     EXIT;
  end;

  AList:= TList.Create;
  try
    IQMS.Common.Dispo.GetReworkFGMultiFIFO( AList,                        // list of locations
                                  ATotalQty,                    // Qty
                                  0,                            // ARG_Qty
                                  TblMasterArinvt_ID.asFloat,   // arinvt_id
                                  TblMasterPtorder_ID.asFloat,  // ptorder_id
                                  FDivision_ID );               // division_id

    for I:= 0 to AList.Count - 1 do with TFGMultiFIFO( AList[ I ]) do
       with TblDetailLoc do
       begin
         Append;
         FieldByName('quan').asFloat      := Qty;
         FieldByName('fgmulti_id').asFloat:= FGMulti_ID;
         Post;
       end;

  finally
     while AList.Count > 0 do
     begin
       TFGMultiFIFO( AList[ 0 ]).Free;
       AList.Delete( 0 );
     end;
     AList.Free;
  end;
end;

procedure TFrmDispoProduction.CheckMasterLabelMaterialUsedQuanMismatch;
begin
  IQAssert( Abs( TblDetailTOT_MAT_QTY.asFloat - SelectValueFmtAsFloat('select sum(quan) from matprod_location where matprod_id = %f', [ TblDetailID.asFloat ]) ) <= 0.000001,
            dispo_rscstr.cTXT0000015 {'Material used qty vs total master label qty mismatch - operation aborted'});
end;


{ ---------------------------------------------------------------------------- }
{ TFrmAutoDispo                                                                }
{ ---------------------------------------------------------------------------- }

procedure TFrmAutoDispo.FrmCreate(ADataSource: TDataSource; ADefaultINLocation, ADefaultOUTLocation: string );
begin
  DataSource := ADataSource;
  DefaultINLocation := ADefaultINLocation;
  DefaultOUTLocation:= ADefaultOUTLocation;

  TransDispo1.RaiseExceptionOnError:= TRUE;
end;

//EIQ-3256 IQAlert - Auto Disposition action is using the the wrong EPlant ID - Plasticum Netherlands AB 05-04-14
procedure TFrmAutoDispo.FrmCreateAlertMode(
  ADataSource: TDataSource; ADefaultINLocation, ADefaultOUTLocation: string;
  AMon_Act_ID, AMode, AEPlant_ID: Real);
begin
  //inherited Create( AOwner, ADataSource );
  DataSource := ADataSource;
  DefaultINLocation := ADefaultINLocation;
  DefaultOUTLocation:= ADefaultOUTLocation;

  {EPlant ID determined in Mon_Thrd.pas TMonThreadBas.ProdReport}
  if AEPlant_ID > 0 then
    TransDispo1.Force_EPlant_ID:= AEPlant_ID;

end;

procedure TFrmAutoDispo.FormCreate(Sender: TObject);
begin
  inherited;
  IQSetTablesActive( TRUE, self );
  FAutoDispo:= TRUE;
end;

procedure TFrmAutoDispo.SetDefaultINLocation(const Value: string);
begin
  FDefaultINLocation := Value;
end;

procedure TFrmAutoDispo.SetDefaultOUTLocation(const Value: string);
begin
  FDefaultOUTLocation := Value;
end;

procedure TFrmAutoDispo.SetEPlant_ID(const Value: Real);
begin
  FEPlant_ID := Value;
end;

procedure TFrmAutoDispo.SetMode(const Value: Real);
begin
  FMode := Value;
end;

procedure TFrmAutoDispo.SetMon_Act_ID(const Value: Real);
begin
  FMon_Act_ID := Value;
end;

procedure TFrmAutoDispo.SrcMasterDataChange(Sender: TObject; Field: TField);
begin
  // supress call to SetDataSetReadOnly for speed considerations.
end;

function TFrmAutoDispo.NeedsDisposition: Boolean;
begin
  with TblMaster do
  begin
    Result:= ( TblMasterLeft_Dispo_Disp.asFloat >= 0.000001 )
             or
             // ( SelectValueAsString('select do_not_dispo_floor_partial from params') = 'Y' )
               DoNotDispoFloorPartialQty( TblMasterArinvt_ID.asFloat )
             or
             ( (TblMasterLeft_Dispo_Disp.asFloat = 0)
               and
               (( SelectValueFmtAsFloat('select count(*) from matprod where day_part_id = %f', [ FieldByName('ID').asFloat ]) > 0)
                or
                ( SelectValueFmtAsFloat('select count(*) from day_part_location where day_part_id = %f', [ FieldByName('ID').asFloat ]) > 0)));

    if not Result then EXIT;

    {prevent serialized being dispositioned - has to be dispo by scanner. Allow only 0 IN}
    if SelectValueByID('is_linked_to_serial', 'arinvt', TblMasterArinvt_ID.asFloat ) = 'Y' then
       Result:= ( TblMasterLeft_Dispo_Disp.asFloat = 0 )
                and
                ( SelectValueFmtAsFloat('select count(*) from matprod where day_part_id = %f', [ FieldByName('ID').asFloat ]) > 0)
  end;
end;

procedure TFrmAutoDispo.AutoDisposition;
begin
  if Dispositioned = 'Y' then
     EXIT;

  if not NeedsDisposition then
  begin
    if Dispositioned <> 'Y' then
       AssignDispositioned;
     EXIT;
  end;

  if TblMasterStandard_ID.asFloat = 0 then
  begin
    IQMS.Common.Miscellaneous.WriteEventLogEx( 'PROD REP', Format('Dayprod ID: %.0f, standard information not available - unable to Auto Disposition', [ TblMasterDAYPROD_ID.asFloat ]));
    EXIT;
  end;

  btnDisposition.Enabled:= FALSE;
  Button2.Enabled:= FALSE;

  SyncVarsTo( TblMaster.MasterSource );

  UniMainModule.FDConnection1.StartTransaction;
  try
    TblDetail.Refresh;              {we recalc material used on a day_prod basis just prior }
    AssignDefaultAutoDispoQtys;     {to calling AutoDisposition - refresh MATPROD here      }
    btnDisposition.Click;
    UniMainModule.FDConnection1.Commit;
  finally
    if UniMainModule.FDConnection1.InTransaction then
       UniMainModule.FDConnection1.RollBack;
  end;
end;


procedure TFrmAutoDispo.AssignDefaultAutoDispoQtys;
var
  ALot: string;
  AQty: Real;
begin
  {"Add to" Location}
  with TblMaster do
  begin
    DeleteFromLocation( FieldByName('ID').asFloat, TblMasterLoc );
    ALot:= SelectValueFmtAsString('select fg_lotno from dayprod where id = %f', [ FieldByName('dayprod_id').asFloat ]);
    ALot:= bom_share.CheckApplyUniqueLot( ALot, TblMasterArinvt_ID.asFloat, TblMasterStandard_ID.asFloat );

    if DoNotDispoFloorPartialQty( FieldByName('arinvt_id').AsFloat ) then
       AQty:= 0
    else
       AQty:= TblMasterLeft_Dispo_Disp.asFloat;

    AppendToLocation( FieldByName('arinvt_id').asFloat,                         {inherited: Dsp_Cust}
                      TblMaster.FieldByName('standard_id').asFloat,
                      AQty,
                      0,
                      TblMasterLoc,
                      ALot,                     { FGLot # }
                      FDefaultINLocation,
                      TblMaster.FieldByName('work_center_id').asFloat,
                      TblMaster.FieldByName('workorder_id').asFloat );
  end;

  {"Relieve from" location}
  AssignAutoDispoMatprodLocations( FDefaultOUTLocation );
end;

procedure TFrmDispoProduction.AssignAutoDispoMatprodLocations( ADefaultOUTLocation: string );
var
  ALotNo: string;
begin
  {"Relieve from" location}
  DeleteFromLocation( TblMaster.FieldByName('ID').asFloat, TblDetailLoc );

  with TblDetail do
  begin
    First;
    while not Eof do
    begin
       if ((FieldByName('tot_mat_qty').asFloat <> 0) or (FieldByName('tot_rg_qty').asFloat <> 0))
          and
          not HasActualUseMasterLabelsAssigned( FieldByName('id').asFloat ) then
       begin
          if FieldByName('is_rework').asString = 'Y' then
             AppendToLocationFIFO_Rework( FieldByName('arinvt_id').asFloat,          {inherited: Dsp_Cust}
                                          TblMasterPtorder_ID.asFloat,
                                          FieldByName('tot_mat_qty').asFloat,
                                          FDivision_ID )
          else
            begin
              ALotNo:= '';
              if FieldByName('tot_mat_qty').asFloat < 0 then
                 ALotNo:= FindFloorDispoLotNo( TblMasterID.asFloat, FieldByName('arinvt_id').asFloat );
              AppendToLocationFIFO( FieldByName('arinvt_id').asFloat,                 {inherited: Dsp_Cust}
                                    TblMaster.FieldByName('standard_id').asFloat,
                                    FieldByName('tot_mat_qty').asFloat,
                                    FieldByName('tot_rg_qty').asFloat,
                                    TblDetailLoc,
                                    ADefaultOUTLocation,
                                    TblMaster.FieldByName('work_center_id').asFloat,
                                    ALotNo,                                            // AMandatoryLotNo. EIQ-4512 10-10-14 normally null unless floor dispo negative backflush
                                    0,                                                 // AShipment_Dtl_ID_In_Transit: Real = 0 );
                                    TblMasterWorkorder_ID.asFloat,                     // Workorder_ID to be checked for hardallocated materials
                                    AdjustOnHandBasedOnTransConsumed );                // reduce onhand by already consumed in this transaction
            end;
       end;

       Next;
    end;
  end;
end;


procedure TFrmDispoProduction.DeleteFromLocation( ADay_Part_ID: Real; ATable: TFDTable );
var
  ACondition: string;
begin
  ACondition:= '';
  if CompareText(ATable.TableName, 'MATPROD_LOCATION') = 0 then
     ACondition:= ' and mat_act_use_master_label_id is null';    // leave preassigned matprod_actual_use labels in place!

  ExecuteCommandFmt('delete from %s where day_part_id = %f '
            + ACondition,
            [ ATable.TableName, ADay_Part_ID ]);
  ATable.Refresh;
end;

{ TODO -oSanketG -cWC : Need to revisit }
{procedure TFrmDispoProduction.gridMatLocDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  DrawNoneExistLocationRed( Sender, Rect, DataCol, Column, State );
end;}

procedure TFrmDispoProduction.gridMatLocEditButtonClick(Sender: TObject);
begin
  if TblDetailIsSerialized.asString = 'Y' then
  begin
     AssignLocationBasedOnLabels();
     EXIT;
  end;

  {Assign LocationTableFromEditedGrid based on Sender}
  LocationTableFromEditedGrid:= (Sender as TUniDBGrid).DataSource.DataSet;

  {Get FGMulti_ID from the picklist}
  IQPickAndReplace( LocationTableFromEditedGrid.FieldByName('FGMulti_ID'),
                   PkMasterFGMultiRelieve,
                   'FGMulti_ID' );

  {refresh lookup fields}
  DispoTableFromEditedGrid.CursorPosChanged;
end;


procedure TFrmDispoProduction.gridMatReqTitleClick(Column: TUniDBGridColumn);
var
  I: Integer;
begin
  inherited;  // n

  if not Assigned(Column.Field) then
     EXIT;

  if not (Column.Field.FieldKind = fkData) then
     EXIT;

  if not (Column.Field.DataSet is TFDTable) then
     EXIT;

  with Column.Field.DataSet as TFDTable do
  begin
    Close;
    IndexFieldNames:= Format('DAY_PART_ID;%s;ID', [ Column.FieldName ]);
    Open;
  end;

  // reset color of the titles
  with Column.Grid as TUniDBGrid do
    for I:= 0 to Columns.Count - 1 do Columns[ I ].Title.Font.Style:= Columns[ I ].Title.Font.Style - [fsBold];

  // highlight the selected title
  Column.Title.Font.Style:= Column.Title.Font.Style + [fsBold];
end;

{ TODO -oSanketG -cWC : Need to revisit }
{procedure TFrmDispoProduction.gridTargetLocDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  DrawNoneExistLocationRed( Sender, Rect, DataCol, Column, State );
end;}

procedure TFrmDispoProduction.AssignLocationBasedOnLabels( AEnforceStrictMatch: Boolean = FALSE );
var
  AList  : TList;
  I      : Integer;
  AQtyReq: Real;
  AQty   : Real;
  ALabelQty: Real;
begin
  // 'This is a serialized item. Negative consumption is not allowed.'
  // 04-23-2008 allow negative consumption
  // IQAssert( TblDetailTOT_MAT_QTY.asFloat >= 0, dispo_rscstr.cTXT0000012);

  AList:= TList.Create;
  try
    {labels picklist}
    { TODO -oSanketG -cWC : Need to revisit , dependent on TranLinkedLabelsItemPkListMatProd}
    //if not TFrmLinkedLabelsItemPkListMat.DoShowModal( AList, TblDetailARINVT_ID.asFloat, TblMasterID.asFloat {day_part_id}  ) then   {TranLinkedLabelsItemPkListMatProd.pas}
       EXIT;

    // {update matprod_location}
    AQtyReq:= TblDetailTOT_MAT_QTY.asFloat - SelectValueFmtAsFloat('select sum(quan) from matprod_location where matprod_id = %f', [ TblDetailID.asFloat ]);

    for I:= 0 to AList.Count - 1 do
    begin
      { TODO -oSanketG -cWC : Need to revisit , dependent on PS_Man}
      {if TRF_ShipLocation(AList[I]).Qty <= AQtyReq then
         AQty:=  TRF_ShipLocation(AList[I]).Qty
      else
         AQty:=  AQtyReq;

      ALabelQty:= SelectValueByID('qty', 'master_label', TRF_ShipLocation(AList[I]).Master_Label_ID );}

      if AEnforceStrictMatch then
         IQAssert( Abs(AQty - ALabelQty) <= 0.000001, dispo_rscstr.cTXT0000015 {'Qty required vs master label qty mismatch - operation aborted'})
      else
         begin
           // how much of this label is left to consume
           { TODO -oSanketG -cWC : Need to revisit , dependent on ps_man}
           {ALabelQty:= ALabelQty - SelectValueFmtAsFloat('select sum(quan) from matprod_location where master_label_id = %f and day_part_id = %f',
                                             [ TRF_ShipLocation(AList[I]).Master_Label_ID,
                                               TblMasterID.asFloat ]);}
           AQty:= fMin( AQty, ALabelQty );
         end;

      if AQty = 0 then
         Continue;
      { TODO -oSanketG -cWC : Need to revisit , dependent on ps_man}
      {ExecuteCommandFmt('insert into matprod_location                                                   '+
                '     ( matprod_id, arinvt_id, fgmulti_id, master_label_id, quan, day_part_id ) '+
                'values                                                                         '+
                '     ( %f, %f, %f, %f, %.6f, %f )',
                [ TblDetailID.asFloat,
                  TblDetailARINVT_ID.asFloat,
                  TRF_ShipLocation(AList[I]).ID,
                  TRF_ShipLocation(AList[I]).Master_Label_ID,
                  AQty,
                  TblMaster.FieldByName('ID').asFloat ]);}

      AQtyReq:= AQtyReq - AQty;
    end;

    TblDetailLoc.Refresh;

    if AEnforceStrictMatch then
       CheckMasterLabelMaterialUsedQuanMismatch;
  finally
    AList.Free;
  end;
end;

procedure TFrmDispoProduction.SrcDetailDataChange(Sender: TObject;  Field: TField);
var
  AColumn: TColumn;

  procedure AssignColumnReadOnly( AFieldName: string );
  begin
    { TODO -oSanketG -cWC : Need to revisit,
    [dcc32 Error] Dsp_Prod.pas(2784): E2010 Incompatible types: 'TColumn' and 'TUniBaseDBGridColumn' }
    {AColumn:= IQColumnByName( gridMatLoc, AFieldName);
    if Assigned(AColumn) then
    begin
      AColumn.ReadOnly:= TblDetailIsSerialized.asString = 'Y';
      if AColumn.Field.FieldKind = fkCalculated then
         AColumn.ButtonStyle:= IIf( TblDetailIsSerialized.asString = 'Y', cbsAuto, cbsEllipsis );
    end;}
  end;

begin
  inherited; {n}
  if not (Assigned(TblDetail)  and (TblDetail.State = dsBrowse)) then
     EXIT;
  AssignColumnReadOnly('QUAN'   );
  AssignColumnReadOnly('RG_QUAN');
  AssignColumnReadOnly('Location');
  AssignColumnReadOnly('LotNo');

  TblDetailTOT_RG_QTY.ReadOnly:= TblDetail.FieldByName('class').asString <> 'PL';
  TblDetailSTD_RG_QTY.ReadOnly:= TblDetail.FieldByName('class').asString <> 'PL';
end;


function TFrmDispoProduction.CheckMakeToOrderAdjustFGMulti( AWorkorder_ID, APickedFGMulti_ID, ADay_Part_ID: Real ): Real;
begin
  Result:= APickedFGMulti_ID;
  if SelectValueFmtAsFloat('select MTO.is_dispo_location_valid(%f, %f) from dual', [ AWorkorder_ID, APickedFGMulti_ID ]) = 1 then
     EXIT;

  Result:= GetNextID('fgmulti');
  ExecuteCommandFmt('begin MTO.clone_fgmulti( %f, %f, to_number(''%s'')); end;',
            [ APickedFGMulti_ID, {src fgmulti}
              Result,            {trg fgmulti}
              SelectValueFmtAsString('select mto.get_ord_detail( %f ) from dual', [ AWorkorder_ID ]) ]);


  // just keep things clean
  ExecuteCommandFmt('update day_part_location set fgmulti_id = %f where day_part_id = %f and fgmulti_id = %f', [ Result, ADay_Part_ID, APickedFGMulti_ID ]);

end;

procedure TFrmDispoProduction.JumpToInventory1Click(Sender: TObject);
begin
  inherited;        // n
  IQJumpInv.Execute;
end;



procedure TFrmDispoProduction.CheckDetailTotal;
begin
  inherited;
  CheckConsumedInventoryGoingNegative;
end;


procedure TFrmDispoProduction.CheckConsumedInventoryGoingNegative;
begin
// day_part_id = TblMaster.FieldByName('id').asFloat
//    select m.arinvt_id,
//        m.fgmulti_id,
//        sum(m.quan) as quan,
//        f.onhand
//   from matprod_location m, fgmulti f
//  where m.day_part_id = 267948
//    and m.fgmulti_id = f.id(+)
//  group by
//        m.arinvt_id,
//        m.fgmulti_id,
//        f.onhand
//  having
//        nvl(f.onhand,0) - nvl(sum(m.quan),0) < 0

end;


procedure TFrmDispoProduction.AssignDispositioned;
begin
  Dispositioned:= 'Y';

  prod_share.UpdatePM( TblMasterDAYPROD_ID.asFloat );

  IQMS.Common.Controls.PostMessageToForm('TMainProdRep', iq_RefreshDataSets, 1, 0 );
end;

{procedure TFrmDispoProduction.PkMasterFGMultiIQDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  // D...
end;}

procedure TFrmDispoProduction.PkMasterFGMultiRelieveIQAfterHPickCreate(
  Sender: TObject);
begin
  inherited;
  THyperPick(Sender).AddLegendImages( IQMS.Common.TransMisc.LocationsColorLegendArray );
end;

procedure TFrmDispoProduction.AdjustOnHandBasedOnTransConsumed( AFGMulti_ID: Real; var AOnHand, ARgOnHand: Real);
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select sum(quan), sum(rg_quan) from matprod_location where day_part_id = %f and fgmulti_id = %f',
                      [ TblDetail.FieldByName('day_part_id').asFloat,
                        AFGMulti_ID ] );
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  AOnHand  := AOnHand - fMax(0, A[ 0 ]);    // can consumed qty be negative - just in case protect it here
  ARgOnHand:= ARgOnHand - fMax(0, A[ 1 ]);
end;

procedure TFrmDispoProduction.UpdateInventoryActualCost(AActCost: Real);
begin
  if (TblMasterLoc.State <> dsBrowse) or (AActCost = 0) then
     EXIT;

  // update inventory fgmulti and translog act_cost
  with TblMasterLoc do
  begin
    First;
    if (TblMasterLocFGMULTI_ID.asFloat > 0) and (TblMasterLocQUAN.asFloat > 0) then
       dsp_share.UpdateRollingAverageActCost( TblMasterLocFGMULTI_ID.asFloat,
                                              TblMasterLocQUAN.asFloat,
                                              AActCost,
                                              TransDispo1.Sub_Batch );
    Next;
  end;

  // now update avg_cost
  dsp_share.UpdateArinvtAverageCost( TblMasterArinvt_ID.asFloat );
end;


function TFrmDispoProduction.GetPostActCosInv: Boolean;
begin
  // Result:= SelectValueAsString('select post_act_cost_inv from prw_param') = 'Y';
  Result:= TRUE;
end;


// procedure TFrmDispoProduction.CreateExecuteJobCosting;
// begin
//   CreateJobCostingChild;
//   ExecuteJobCosting;
// end;


// procedure TFrmDispoProduction.CreateJobCostingChild;
// begin
//   {execute jobcosting}
//   CheckFreeJobCosting;
//
//   FJobCosting:= dsp_share.CreateJobCosting( TblMasterWorkorder_ID.asFloat );
// end;

// procedure TFrmDispoProduction.ExecuteJobCosting;
// var
//   AActCost: Real;
// begin
//   if not Assigned(FJobCosting) then
//      EXIT;
//
//   AActCost:= dsp_share.ExecuteJobCosting( FJobCosting, TblMasterArinvt_ID.asFloat );
//
//   if AActCost > 0 then
//     self.UpdateInventoryActualCost( AActCost );
// end;


// procedure TFrmDispoProduction.CheckFreeJobCosting;
// begin
//   if Assigned(FJobCosting) then
//   begin
//     try
//       FJobCosting.Release;
//       Application.ProcessMessages;
//     finally
//       FJobCosting:= nil;
//     end;
//   end;
// end;


function TFrmDispoProduction.HasActualUseMasterLabelsAssigned( AMatprod_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from matprod_location where matprod_id = %f and mat_act_use_master_label_id is NOT null and rownum < 2',
                     [ AMatprod_ID ]) = 1
end;

procedure TFrmDispoProduction.BeforeTransDispoAddOut( ADay_Part_ID: Real; Qry: TDataSet; AMaster_Label_List: TStringList );
begin
  // 01-08-2014 used in reverse dispo to ensure fgmulti_id exists. See Dsp_Reverse.pas
end;


procedure TFrmDispoProduction.ReplacewithAlternateOneTime1Click(Sender: TObject);
var
  ANewMatprod_ID: Real;
  AArinvt_Alternate_ID: Real;
begin
  if TblDetailID.asFloat = 0 then
     EXIT;

  if not ApplyAlternateOneTime( TblMasterWorkorder_ID.asFloat, TblMasterID.asFloat, TblDetailID.asFloat, ANewMatprod_ID, AArinvt_Alternate_ID ) then
     EXIT;

  Reopen(TblDetail);
  TblDetail.Locate('id', ANewMatprod_ID, [])
end;

procedure TFrmDispoProduction.ReplacewithAlternateThisWorkOrder1Click(Sender: TObject);
var
  ANewMatprod_ID: Real;
  AMustArriveDate: TDateTime;
  AArinvt_Alternate_ID: Real;

  // ---------------------------------------------------------------------------
  procedure _apply_alternate_to_workorder_allocation;
  begin
    TFrmMatXcptAlternateWorkorderAlloc.DoReplaceWorkorderBomItemtWithAlternate( TblMasterWorkorder_ID.asFloat,  // mat_xcpt_alternate_wo_alloc.pas
                                                                                AArinvt_Alternate_ID,
                                                                                'COMPONENT',                    //  AKind,
                                                                                AMustArriveDate );
  end;


  // ---------------------------------------------------------------------------
  procedure _apply_alternate_to_substitute_bom;
  var
    AExist_Standard_ID: Real;
  begin
    AExist_Standard_ID:= SelectValueByID('standard_id', 'workorder', TblMasterWorkorder_ID.asFloat );
    TFrmMatXcptAlternate.DoSubstituteWorkordersBOM( AExist_Standard_ID,                           // mat_xcpt_alternate.pas
                                                    TblMasterWorkorder_ID.asFloat,
                                                    AArinvt_Alternate_ID,
                                                    AMustArriveDate );
  end;


// -----------------------------------------------------------------------------
begin
  if TblDetailID.asFloat = 0 then EXIT;

  if not ApplyAlternateOneTime( TblMasterWorkorder_ID.asFloat, TblMasterID.asFloat, TblDetailID.asFloat, ANewMatprod_ID, AArinvt_Alternate_ID ) then
     EXIT;

  try
    AMustArriveDate:= SelectValueFmtAsFloat('select min(x.must_arrive) from xcpt_mat_req x where x.arinvt_id = %f', [ TblDetailARINVT_ID.asFloat ]);

    if wo_misc.IsAlternateAppliedToWorkorder then
       _apply_alternate_to_workorder_allocation
    else
       _apply_alternate_to_substitute_bom;

  finally
    Reopen(TblDetail);
    TblDetail.Locate('id', ANewMatprod_ID, [])
  end;
end;

function TFrmDispoProduction.ApplyAlternateOneTime( AWorkorder_ID, ADayPart_ID, AMatprod_ID: Real; var ANewMatprod_ID, AArinvt_Alternate_ID: Real ): Boolean;
var
  AAlternate_Item_Code_ID: Real;
  AStandard_ID: Real;
  AArinvt_ID: Real;
  AAlternate_Arinvt_ID: Real;
begin
  Result:= False;
  if SelectValueByID('dispo', 'matprod', AMatprod_ID) = 'Y' then
     EXIT;
  AStandard_ID:= SelectValueByID('standard_id', 'workorder', AWorkorder_ID);
  AArinvt_ID  := SelectValueByID('arinvt_id', 'matprod', AMatprod_ID);
  AAlternate_Item_Code_ID:= 0;

  if wo_misc.IsAlternateAppliedToWorkorder then
     AAlternate_Item_Code_ID:= SelectValueByID('alternate_item_code_id', 'standard', AStandard_ID);

  if not TFrmInvAlternateItemsPk.DoShowModal( AArinvt_ID, AArinvt_Alternate_ID, AAlternate_Item_Code_ID) then
     EXIT;

  AAlternate_Arinvt_ID:= SelectValueByID('arinvt_id', 'arinvt_alternate', AArinvt_Alternate_ID);
  if AAlternate_Arinvt_ID = 0 then
     EXIT;

  ANewMatprod_ID:= GetNextID('matprod');
  ExecuteCommandFmt('declare                                                          '+
            '  v_workorder_id number::= %f;                                   '+
            '  v_day_part_id number::= %f;                                    '+
            '  v_old_matprod_id number::= %f;                                 '+
            '  v_new_matprod_id number::= %f;                                 '+
            '  v_alternate_arinvt_id number::= %f;                            '+
            'begin                                                            '+
            '  prod_rep.apply_alternate_to_matprod( v_workorder_id,           '+
            '                                       v_day_part_id,            '+
            '                                       v_old_matprod_id,         '+
            '                                       v_new_matprod_id,         '+
            '                                       v_alternate_arinvt_id );  '+
            'end;                                                             ',
            [ AWorkorder_ID,
              ADayPart_ID,
              AMatprod_ID,
              ANewMatprod_ID,                     // New Matprod_ID,
              AAlternate_Arinvt_ID ]);
  Result:= True;
end;


function TFrmDispoProduction.FindFloorDispoLotNo( ADay_Part_ID, AArinvt_ID: Real ): string;
begin
  Result:= SelectValueFmtAsString('select t.lotno                  '+
                        '  from translog t               '+
                        ' where t.day_part_id = %f       '+
                        '   and t.trans_in_out = ''OUT'' '+
                        '   and t.arinvt_id = %f         '+
                        ' order by id desc               ',
                        [ ADay_Part_ID, AArinvt_ID ]);
end;

end.




