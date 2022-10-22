unit IQMS.PrintLabels.LabelMatrix;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Printers,
  Vcl.Menus, Winapi.RichEdit,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Phys, FireDAC.Phys.Intf,
  FireDAC.DatS, FireDAC.DApt, FireDAC.DApt.Intf, FireDAC.UI.Intf,
//  IQMisc,
  IQMS.PrintLabels.LMBase,
//  IqLMManu,
//  IqLMPurc,
//  IQLMPack,
//  IQBMP,
//  IqLMBom,
//  IqLMRaw,
//  IqLMRT,
//  IqLMsdpk,
//  IQLMSDRw,
//  IQLmsdbm,
  IQMS.PrintLabels.LMShare,
  IQMS.PrintLabels.Events,
  IQMS.Common.DataLib;

  // Shop Data units:  IqLMsdpk, IQLMSDRw, IQLmsdbm

type

  BlendRecord = Record
    BlendItem : String;
    BlendDesc : String;
    BlendPrcn : Real;
  end;

  TIQWebLMPackSlip = class;
  TIQWebLMBom = class;
  TIQWebLMRaw = class;
  TIQWebLMRT = class;

  TIQWebLMBase = class(TComponent)
  private
    // +  : indicates used for both - FG and Mtrl,
    //  *  : Mtrl only

    { Private declarations }
    FDataLink       : TFieldDataLink;

    FVendor_Id      : Real;
    FBill_To_ID     : Real;
	FBill_To_ID2     : Real;
    FFgMulti_ID     : Real;
    FStandard_ID    : Real;
    FHistIllumRT_ID : Real;
    FOrders_Id      : Real;
    FOrd_Detail_Id  : Real;
    FPO_Id          : Real;

    FPartno_Id      : Real;
    FWorkorder_Id   : Real;

    FDBFFile        : string;
    FRemoteServer   : string;
    FComm_Port      : string;

    FDisplayModal   : Boolean;

    FThis_Standard_ID: Real;

    FCountryOfOrigin: string;
    FLabelKind: string;

    function  GetDataField:string;
    function  GetDataSource : TDataSource;

    procedure SetDataField( AValue:string );
    procedure SetDataSource( AValue:TDataSource );
    procedure SetArinvt_ID( AValue : Double );
    procedure SetVendor_ID( AValue : Real );
    procedure SetArcusto_ID( AValue : Real );
    procedure SetBill_To_ID( AValue : Real );
	procedure SetBill_To_ID2( AValue : Real );
    procedure SetFgMulti_ID( AValue : Real );
    procedure SetPoNoRec(AValue:String);
    procedure SetStandard_ID( AValue : Real );
    procedure SetOrders_ID( AValue : Real );
    procedure SetOrd_Detail_ID( AValue : Real );
    procedure SetHistIllumRT_ID( AValue : Real );
    procedure SetPck_wght( AValue : Real );

    procedure SetPartno_ID( AValue : Real );
    procedure SetWorkorder_ID( AValue : Real );
    procedure AssignRawMaterialsInfo(AStandard_ID:Real);

    procedure AssignVendorFromPO( APoNo: string );
    procedure SetPk_Ticket_Dtl_ID(const Value: Real);
    procedure AssignUPC_Codes(AArinvt_ID: Real);
    procedure SetPressno(const Value: String);
    procedure SetWorkCenterID(const Value: Real);
    procedure AssignAKA;

  protected
    { Protected declarations }
  public
    { Public declarations }
    FLabelDate : TDateTime;


    FLabelQty   : Integer;
    FLabelType : string;
    FOrigin : string;
    FLabelFile  : string;  {for LM}
    FReportFile : string;  {for RB}
    FBatch      : Real;    {for RB}
    FLM_Labels_ID: Real;

    FArcusto_Id     : Real;


    FPart_No   : string;        {+  Arinvt.ItemNo }
    FPart_desc : string;        {+  Arinvt.Descrip }

    FOrder_no  : string;        {   Orders.OrderNo }
    FPono      : string;        {+  Orders.PONO or User Supplied( Mtrl )}
    FOrd_quan  : Real;          {   Ord_Detail.Total_Qty_Ord }

    {Customer}
    FCust_no   : string;        {   Arcusto.CustNo }
    FCustomer  : string;        {   Arcusto.Company }
    FAddress1  : string;        {   Arcusto.Addr1 }
    FAddress2  : string;        {   Arcusto.Addr2 }
    FAddress3  : string;        {   Arcusto.Addr2 }
    FCity_st_zp: string;        {   Arcusto.City+Arcusto.State+Arcusto.Zip }
    FZipcode   : string;        {   Arcusto.Zip }
    FShipName  : string;        {   Ship_to.attn }
    FCountry   : string;        {   arcusto.country overwritten by ship_to.country}

    FBillname  : string;        {   Arcusto.Company }
    FBilladd   : string;        {   Bill_To.Addr1 }
    FBilladd2  : string;        {   Bill_To.Addr2 }
    FBilladd3  : string;        {   Bill_To.Addr3 }
    FBillcityst: string;        {   Bill_To.City+Bill_To.State }
    FBillzip   : string;        {   Bill_To.Zip }

    FShipToUser1 : string;
    FShipToUser2 : string;
    FDOCKID      : string;
    FLINEFEED    : string;
    FRESERVELOC  : string;

    FSupp_Code   : string;

    FBlend : Array[1..5] of BlendRecord;

    {common stuff}
    FSerial    : Real;          {   Master_Label.ID }
    FCSerial   : String;
    FPrint_Time: string;        {+  Time of printing }
    FTboxno    : Integer;       {   This is Number of Labels they asked to print }

    {Arinvt}
    FMaterial2 : string;        {+  Arinvt.Descrip2 }
    FUnit      : string;        {*  Arinvt.Unit }
    FClass     : string;        {*  Arinvt.Class }
    FRev       : string;        {   Arinvt.Rev }
    FVendor1   : string;        {+  Vendor.Company (from Arinvt_Vendors.Vendor_ID) }
    FVen_Code1 : string;        {+  Vendor.VendorNo (from Arinvt_Vendors.Vendor_ID) }
    FVendor2   : string;        {+  Vendor.Company (from Arinvt_Vendors.Vendor_ID) }
    FVen_Code2 : string;        {+  Vendor.VendorNo (from Arinvt_Vendors.Vendor_ID) }
    FEcno      : string;        {   Arinvt.ECNO }
    FSeries    : string;        {   Arinvt.Series }
    FDrawing   : string;        {   Arinvt.Drawing }
    FArinvt_ID : Double;
    FParent_Arinvt_ID: Real;

    {AKA}
    FAka_ptno  : string;        {   AKA.Cust_Itemno }
    FAka_desc  : string;        {   AKA.Cust_Descrip}
    FAka_C4    : string;        {   Aka.CUser4      }
    FAka_Rev   : string;

    {FGMulti}
    FLocation  : string;        {*  Locations.Loc_Desc (from FgMulti.Loc_ID)}
    FLotNo     : string;        {*  FGMulti.LotNo }
    FLotNo_User: String;        { User-provided lot number }

    {Qty}
    FQuantity  : Real;          {+  OpMat.Ptsper or User Supplied (Mtrl) }

    {Standard}
    FMoldno    : string;        {   Standard.MfgNo }
    FMaterial  : string;        {   Arinvt.Descrip (Standard.Arinvt_ID_Mat) }
    FPL_ItemNo : string;        {   Arinvt.itemno for material used Standard.Arinvt_ID_Mat }
//    FFg_lotno  : string;        {   Standard.FG_Lotno }
    FBaseno    : string;        {   Standard.EqNo }

    {PartNo}
    FBoxno     : Integer;          {   PartNo.BoxNo }
    FPartNoId  : Real;          {   PartNo.ID }

    {PTORDER}
    FPTOrder_ID     : Real;

    {OpMat}
    FPck_wght  : Real;          {   OpMat.Weight }
    FBox_ID    : Real;          { packaging opmat.arinvt_id - mfg items only}

    {PO}
    FPoNoRec    : String;

    {Blends}
    FBcls_item1: string;        {+  Arinvt.Itemno (from OpMat.Arinvt_ID) }
    FBcls_item2: string;        {+  These are the first 5 items included }
    FBcls_item3: string;        {+  in the blend.  The blend is defined  }
    FBcls_item4: string;        {+  by the snd operation                 }
    FBcls_item5: string;        {+                                       }
    FBldesc1   : string;        {+  Arinvt.Descrip (from OpMat.Arinvt_ID }
    FBldesc2   : string;        {+            ""                         }
    FBldesc3   : string;        {+            ""                         }
    FBldesc4   : string;        {+            ""                         }
    FBldesc5   : string;        {+            ""                         }
    FBld_prcnt1: Real;          {+  OpMat.PtsPer (percentage of blend    }
    FBld_prcnt2: Real;          {+  component) }
    FBld_prcnt3: Real;          {+            "" }
    FBld_prcnt4: Real;          {+            "" }
    FBld_prcnt5: Real;          {+            "" }

    {RT specific}
    FPressno   : string;        {   Hist_Illum_Rt.EQNO (only labels printed from Realtime screens)  }
    FWorkCenterID: Real;
    FCntr_Desc : string;        {   WORK_CENTER.CNTR_DESC   Populate when printing labels from WORK_CENTER.CNTR_DESC where ever you populate the current LM dbf column PRESSNO}
    FWorkCenter_MFGType: String;
    FWorkCenter_MFGCell: String;

    FWeight     : Real;
    FVolume     : Real;

    {User Defined}
    FInv_CUser1: string;
    FInv_CUser2: string;
    FInv_CUser3: string;
    FInv_CUser4: string;
    FInv_CUser5: string;
    FInv_CUser6: string;
    FInv_CUser7: string;
    FInv_CUser8: string;
    FInv_CUser9: string;
    FInv_CUser10: string;

    FInv_NUser1: Real;
    FInv_NUser2: Real;
    FInv_NUser3: Real;
    FInv_NUser4: Real;
    FInv_NUser5: Real;
    FInv_NUser6: Real;
    FInv_NUser7: Real;
    FInv_NUser8: Real;
    FInv_NUser9: Real;
    FInv_NUser10: Real;

    FRaw_CUsr1: string;
    FRaw_CUsr2: string;
    FRaw_CUsr3: string;
    FRaw_CUsr4: string;
    FRaw_CUsr5: string;
    FRaw_CUsr6: string;
    FRaw_CUsr7: string;
    FRaw_CUsr8: string;
    FRaw_CUsr9: string;
    FRaw_CUsr10: string;


    FRaw_NUsr1: Real;
    FRaw_NUsr2: Real;
    FRaw_NUsr3: Real;
    FRaw_NUsr4: Real;
    FRaw_NUsr5: Real;
    FRaw_NUsr6: Real;
    FRaw_NUsr7: Real;
    FRaw_NUsr8: Real;
    FRaw_NUsr9: Real;
    FRaw_NUsr10: Real;

    F_CARTONS_PALLET:Real;
    F_PIECES_CARTON:Real;

    Feplant_id:Real;
    Flabel_date:TDateTime;
    Fprod_date:TDateTime;
    Fraw_mat_ex:String;
    FLabel_Class:String;
    Fptwt:Real;
    Fshift:Integer;
    Freceiptnum:String;
    FRaw_rev:String;
    FDivision: string;

    FPackno    : string;  {ps_ticket id}
    FPackslipno: string;

    {Not Used}
    FPtspac    : Real;
    FPtspac2   : string;
    FBaseno2   : string;
    FRouting2  : string;
    FRouting   : string;

    FHistOrddetailId:Real;
    FShipmentDtlId:Real;
    FShipments_ID: Real;

    Child:TFrmLM_Base;

    FLM_Switch: string;
    FShip_To_ID: Real;
    FAka_ID    : Real;

    FIllum_Part_ID: Real;    {assigned from RT}
    FForceShip_To_ID: Real;
  	FForceBill_To_ID: Real;

    FShipQty: Real;          {used to determine qty when printing from pk tickets}
    FPk_Ticket_Dtl_ID: Real; {used from pk tickets}

    {packaging aka}
    FPkg_Arinvt_ID : Real;
    FPkg_Aka_ID    : Real;
    FPkg_Aka_Itemno: string;

    FPk_Tare: Real;
    FPK_1_Tare: Real;
    FPK_1_Item: string;

    FUPC_Code : string;
    FUPC_Code2: string;

    {edi}
    FIsa_receiver_code:string;
    FSu_supplier_code :string;
    FPci_11z          :string;
    FPci_12z          :string;
    FPci_13z          :string;
    FPci_14z          :string;
    FPci_15z          :string;
    FPci_16z          :string;
    FPci_17z          :string;
    FShip_to_cuser5   :string;
    FEdi_ship_to_code :string;
    FCust_ref         :string;
    FSf_n1_code       :string;
    FRan              :string;

    FSeg_man          :string;

    FEDIUser1         :string;
    FEDIUser2         :string;
    FEDIUser3         :string;
    FEDIUser4         :string;
    FEDIUser5         :string;
    FEDIUser6         :string;
    FEDIUser7         :string;
    FEDIUser8         :string;
    FEDIUser9         :string;
    FEDIUser10        :string;
    FEDIUser11        :string;
    FEDIUser12        :string;
    FEDIUser13        :string;
    FEDIUser14        :string;
    FEDIUser15        :string;


    FRel_CUser1      : string;  {get releases CUSER1 and CUSER2 based on the RAN}
    FRel_CUser2      : string;

    // FSeg_stock     :string;
    // FSeg_vendor    :string;
    // FSeg_plant     :string;
    // FSeg_ord_no    :string;

    {serialized labels on pallet completion}
    FQty_per_pk       : Real;    // Standard qty per box for the packaging item for the box (sequence #1 packaging item)
    FQty_of_pks       : Real;    // Total boxes scanned to that pallet label

    FShipping         : Boolean; // used in shipping labels = TRUE

    {Company address - located based on eplant_id and division_id. Used when ship_to is known and we want to populate the dbf with FROM where the goods were shipped}
    FCo_Addr1         : string;
    FCo_Addr2         : string;
    FCo_City          : string;
    FCo_State         : string;
    FCo_Zip           : string;

    {PkTicket batch label print}
    FSkipBoxNoUpdate: Boolean;

    FLot_Date: TDateTime;

    FStart_Time: TDateTime;
    FShelf_Life: Real;

    FSndop_Dispatch_ID: Real;
    FNext_Sndop_Dispatch_ID: Real;
    FSndop_ID: Real;
    FNext_Sndop_ID: Real;
    FProcessLogin: string;
    FProcessShift_ID: Real;
    FOnCalculateLabelsCount: TOnCalculateLabelsCount;
    FDateReceived:TDateTime;

    FOrd_Detail_Uom  : string;
    FOrd_Detail_Seq  : Real;
    FOrd_DetailCuser1: string;
    FOrd_DetailCuser2: string;
    FOrd_DetailCuser3: string;
    FOrd_DetailCuser4: string;
    FOrd_DetailCuser5: string;
    FOrd_DetailCuser6: string;
    FShip_From_Eplant: Real;
    FAka_Kind        : String;
    FDoNoDisplayAKANumber:boolean;

    FNoShip: string;

    function GetSerial2  : string;
    function GetPart_No2 : string;
    function GetRev2     : string;
    function GetAka_ptno2: string;
    function GetLotNo2   : string;
    function GetQuantity2: string;
    function GetMoldNo2  : string;
//    function GetFg_lotno2: string;
    function GetBoxno2   : string;
    function GetPck_Wght2: string;
    function GetOrder_no2: string;
    function GetPono2    : string;
    function GetPonoRec2 : string;
    function GetCust_no2: string;
    procedure AssignBlends;


    property Serial2  : string read GetSerial2;   {'S'+}
    property Part_No2 : string read GetPart_No2;  {'P'+}
    property Rev2     : string read GetRev2;      {'R'+}
    property Aka_ptno2: string read GetAka_ptno2; {'P'+}
    property LotNo2   : string read GetLotNo2;    {'L'+}
    property Quantity2: string read GetQuantity2; {'Q'+}
    property MoldNo2  : string read GetMoldNo2;   {'M'+}
//    property FG_lotno2: string read GetFg_lotno2; {'L'+}
    property Boxno2   : string read GetBoxNo2;    {'B'+}
    property Pck_Wght2: string read GetPck_Wght2; {'W'+}
    property Order_no2: string read GetOrder_no2; {'S'+}
    property Pono2    : string read GetPono2;     {'O'+}
    property PonoRec2: string read GetPonoRec2;   {'O'+}
    property Cust_no2 : string read GetCust_no2;  {'C'+}

    property OrderNo  : String read FOrder_no write FOrder_no;
    property MfgNo    : String read FMoldno write FMoldno;
    property Eqno     : String read FPressno write SetPressno;
    property WorkCenterID: Real read FWorkCenterID write SetWorkCenterID;
    property Cntr_Desc : String read FCntr_Desc write FCntr_Desc;
    property WorkCenter_MFGType: String read FWorkCenter_MFGType;
    property WorkCenter_MFGCell: String read FWorkCenter_MFGCell;

    property Vendor_Id      : Real   read FVendor_Id      write SetVendor_ID   ;
    property Arcusto_Id     : Real   read FArcusto_Id     write SetArcusto_ID  ;
    property Arinvt_ID      : Double read FArinvt_ID      write SetArinvt_ID   ;
    property Bill_To_ID     : Real   read FBill_To_ID     write SetBill_To_ID  ;
	property Bill_To_ID2     : Real   read FBill_To_ID2     write SetBill_To_ID2  ;
    property FgMulti_ID     : Real   read FFgMulti_ID     write SetFgMulti_ID  ;
    property Standard_ID    : Real   read FStandard_ID    write SetStandard_ID ;
    property Pck_wght       : Real   read FPck_wght       write SetPck_wght ;
    property HistIllumRT_ID : Real   read FHistIllumRT_ID write SetHistIllumRT_ID ;
    property Orders_id      : Real   read FOrders_Id      write SetOrders_Id;
    property Ord_Detail_id  : Real   read FOrd_Detail_Id  write SetOrd_detail_Id;
    property PoNoRec        : String read FPoNoRec        write SetPoNoRec;
    property This_Standard_ID: Real read FThis_Standard_ID write FThis_Standard_ID;

    property Partno_id      : Real   read FPartno_Id      write SetPartno_Id;
    property Workorder_id   : Real   read FWorkorder_Id   write SetWorkorder_Id;


    property LabelType   : string    read FLabelType write FLabelType; {Either FG or Material}
    property LabelKind   : string    read FLabelKind write FLabelKind; {Either FG or Material}
    property Origin      : string    read FOrigin write FOrigin; {PACKSLIP, BOM...}
    property LabelFile   : string    read FLabelFile write FLabelFile;
    property DBFFile     : string    read FDBFFile write FDBFFile;
    property RemoteServer: string    read FRemoteServer write FRemoteServer;
    property Comm_Port   : string    read FComm_Port write FComm_Port;

    property LabelDate   : TDateTime read FLabelDate  write FLabelDate;
    property Quantity    : Real      read FQuantity   write FQuantity;
    property LabelQty    : Integer   read FLabelQty   write FLabelQty;
    property TBoxNo      : Integer   read FTBoxNo     write FTBoxNo;
    property Ship_To_ID  : Real      read FShip_To_ID write FShip_To_ID;
    //property UseLotNo     : String    read FLotNoUD    write FLotNoUD;

    property Pk_Ticket_Dtl_ID: Real read FPk_Ticket_Dtl_ID write SetPk_Ticket_Dtl_ID;

    property CountryOfOrigin: string read FCountryOfOrigin write FCountryOfOrigin;

    property Parent_Arinvt_ID: Real read FParent_Arinvt_ID write FParent_Arinvt_ID;

    constructor Create( AOwner:TComponent ); override;
    destructor Destroy; override;
    function Execute: Boolean;
    procedure ClearVars;
    function NumToStrDef( AValue: Real ): string;

    function ExtractParamAsFloat( AParam: Variant; AIndex: Integer; ADefaultValue: Real = 0 ): Real;
    function ExtractParamAsString( AParam: Variant; AIndex: Integer; ADefaultValue: string = '' ): string;

    function IsSIC: Boolean;
    property OnCalculateLabelsCount: TOnCalculateLabelsCount read FOnCalculateLabelsCount write FOnCalculateLabelsCount;

  published
    { Published declarations }
    property DataField:string                 read GetDataField     write SetDataField;
    property DataSource:TDataSource           read GetDataSource    write SetDataSource;
    property DisplayModal: Boolean            read FDisplayModal    write FDisplayModal;
  end;

  TIQWebLMPackSlip = class(TIQWebLMBase)
  public
    constructor Create( AOwner:TComponent ); override;
  published
    property Arinvt_ID;
  end;

  TIQWebLMBom = class(TIQWebLMBase)
  public
    constructor Create( AOwner:TComponent ); override;
  published
    property Arinvt_ID;
  end;

  TIQWebLMRaw = class(TIQWebLMBase)
  public
    constructor Create( AOwner:TComponent ); override;
  published
    property Arinvt_ID;
  end;

  TIQWebLMRT = class(TIQWebLMBase)
  public
    constructor Create( AOwner:TComponent ); override;
  end;

  TIQWebSDLMPackSlip = class(TIQWebLMBase)
  public
    // hOrderID       : Real;
    // hArcustoID     : Real;
    constructor Create( AOwner:TComponent ); override;
  published
    hDisplayParent : TWinControl;
    property Arinvt_ID;
  end;

  TIQWebSDLMBom = class(TIQWebLMBase)
  public
    constructor Create( AOwner:TComponent ); override;
  published
    hDisplayParent : TWinControl;
    property Arinvt_ID;
  end;

  TIQWebSDLMRaw = class(TIQWebLMBase)
  public
    constructor Create( AOwner:TComponent ); override;
  published
    hDisplayParent : TWinControl;
    property Arinvt_ID;
  end;

  TIQWebLMProd = class(TIQWebLMPackSlip)
  public
    hDisplayParent : TWinControl;
    constructor Create( AOwner:TComponent ); override;
  end;

  TLMProdPRW = class(TIQWebLMProd)
    constructor Create( AOwner:TComponent ); override;
  end;


  TIQWebLMSDProd = class(TIQWebLMProd)
  public
    constructor Create( AOwner:TComponent ); override;
  end;

  TIQWebLMReject = class(TIQWebLMBase)
  private
    FRejectCodeID: Real;
    FLotNumber: string;
    FRejectComment: string;
    FRejectCode: string;
    FRejectDescription: string;
    procedure SetRejectCodeID(const Value: Real);
  public
    constructor Create( AOwner:TComponent ); override;
    property Arinvt_ID;
    property Standard_ID;
    property WorkCenterID;
    property RejectCodeID: Real read FRejectCodeID write SetRejectCodeID;
    property RejectCode: string read FRejectCode;
    property RejectDescription: string read FRejectDescription;
    property RejectComment: string read FRejectComment write FRejectComment;
    property LotNumber: string read FLotNumber write FLotNumber;
    property Quantity;
  end;

implementation

uses
//  IQAppSet,
//  IQLMProd,
//  IQLMProdPRW,
//  IQLMReject,
//  IQLMSDProd,
//  IQLMSdReject,
//  vcl_rscstr,
  System.Variants,
  IQMS.Common.NLS,
  IQMS.Common.StringUtils;

{ TIQWebLMBase }

constructor TIQWebLMBase.Create( AOwner:TComponent );
begin
  FDisplayModal := FALSE; // default
  inherited Create( AOwner );
  FDataLink:= TFieldDataLink.Create;
end;

destructor TIQWebLMBase.Destroy;
begin
  FDataLink.Free;
  inherited Destroy;
end;

function TIQWebLMBase.GetSerial2 : string;
begin
  Result:= 'S' + FloatToStr(FSerial);
end;

function TIQWebLMBase.GetPart_No2 : string;
begin
  Result:= 'P' + FPart_No;
end;

function TIQWebLMBase.GetRev2 : string;
begin
  Result:= 'R' + FRev;
end;

function TIQWebLMBase.GetAka_ptno2 : string;
begin
  Result:= 'P' + FAka_ptno;
end;

function TIQWebLMBase.GetLotNo2 : string;
begin
  Result:= 'L' + FLotNo;
end;

function TIQWebLMBase.GetQuantity2: string;
begin
  Result:= 'Q' + FloatToStr(FQuantity);
end;

function TIQWebLMBase.GetMoldNo2 : string;
begin
  Result:= 'M' + FMoldNo;
end;

//function TIQWebLMBase.GetFg_lotno2: string;
//begin
//  Result:= 'L' + FFG_lotno;
//end;

function TIQWebLMBase.GetBoxno2: string;
begin
  Result:= 'B' + FloatToStr(FBoxno);
end;

function TIQWebLMBase.GetPck_Wght2: string;
begin
  Result:= 'W' + Trim(Format('%7.6f', [FPck_wght]));
end;

function TIQWebLMBase.GetOrder_no2: string;
begin
  Result:= 'S' + FOrder_no;
end;

function TIQWebLMBase.GetPono2: string;
begin
  Result:= 'O' + FPono;
end;

function TIQWebLMBase.GetPonoRec2: string;
begin
  Result:= 'O' + FPoNoRec;
end;

function TIQWebLMBase.GetCust_no2: string;
begin
  Result:= 'C' + FCust_no;
end;

function TIQWebLMBase.Execute: Boolean;
//var
//   AForm: TFrmLM_Base;
begin
  Result := TRUE; // default

//  if FOrigin = 'PACKSLIP' then
//    Result := TFrmLM_Pack.CreateEx( self, FArInvt_ID, TRUE ).DoShow(DisplayModal)
//
//  else if FOrigin = 'SDPACKSLIP' then
//    begin
//         // if not Assigned( TIQWebSDLMPackSlip( Owner ).hDisplayParent ) then
//         if not Assigned( TIQWebSDLMPackSlip( self ).hDisplayParent ) then
//            Result := TFrmIqLmSdPack.Create(self, FArInvt_Id).DoShow(DisplayModal)
//         else TFrmIqLmSdPack.Create(self, FArInvt_Id);
//    end
//
//  else if FOrigin = 'BOM' then
//    Result := TFrmLM_Bom.Create(self, FArInvt_Id, true).DoShow(DisplayModal)
//
//  else if FOrigin = 'SDBOM' then
//    begin
//         // if not Assigned( TIQWebSDLMBom( Owner ).hDisplayParent ) then
//         if not Assigned( TIQWebSDLMBom( self ).hDisplayParent ) then
//            begin
//              AForm := TFrmLM_SDBOM.Create(self, FArInvt_Id, TRUE);
//              if Assigned(AForm) then
//                 begin
//                   TFrmLM_SDBOM(AForm).CloseBtnVisible := True; // 10/25/2010
//                   Result := AForm.DoShow(DisplayModal);
//                 end;
//            end
//         else TFrmLM_SDBOM.Create(self, FArInvt_Id, TRUE);
//    end
//
//  else if FOrigin = 'PURCHASED' then
//    Result := TFrmLMRaw.Create(self, FArInvt_Id).DoShow(DisplayModal)
//
//  else if FOrigin = 'RT' then
//    Result := TFrmLM_RT.Create(self, FArInvt_Id).DoShow(DisplayModal)
//
//  else if FOrigin = 'RAW' then
//    Result := TFrmLMRaw.Create(self, FArInvt_Id).DoShow(DisplayModal)
//
//  else if FOrigin = 'SDRAW' then
//    begin
//         // if not Assigned( TIQWebSDLMRaw( Owner ).hDisplayParent ) then
//         if not Assigned( TIQWebSDLMRaw( self ).hDisplayParent ) then
//            begin
//              AForm := TFrmLM_SDRaw.Create(self, FArInvt_Id);
//              if Assigned(AForm) then
//                 begin
//                   TFrmLM_SDRaw(AForm).CloseBtnVisible := True; // 10/25/2010
//                   Result := AForm.DoShow(DisplayModal);
//                 end;
//            end
//         else TFrmLM_SDRaw.Create(self, FArInvt_Id);
//    end
//
//  else if FOrigin = 'PROD' then
//    if not Assigned( TIQWebLMProd( self ).hDisplayParent ) then
//       begin
//         AForm := TFrmLM_Prod.Create( self, FArinvt_ID );
//         if Assigned(AForm) then
//            Result:= AForm.DoShow( DisplayModal );
//       end
//    else
//       TFrmLM_Prod.Create( self, FArinvt_ID )
//
//  else if FOrigin = 'SDPROD' then
//    if not Assigned( TIQWebLMProd( self ).hDisplayParent ) then
//       begin
//         AForm := TFrmSDLM_Prod.Create( self, FArinvt_ID );
//         if Assigned(AForm) then
//            Result:= AForm.DoShow( DisplayModal );
//       end
//    else
//       TFrmSDLM_Prod.Create( self, FArinvt_ID )
//
//  else if FOrigin = 'PROD_PRW' then
//    if not Assigned( TLMProdPRW( self ).hDisplayParent ) then
//       begin
//         AForm := TFrmLM_ProdPRW.Create( self, FArinvt_ID );
//         if Assigned(AForm) then
//            Result:= AForm.DoShow( DisplayModal );
//       end
//    else
//       TFrmLM_ProdPRW.Create( self, FArinvt_ID )
//
//  else if FOrigin = 'LMREJECT' then
//    begin
//      if IQAppSet.IsTouchScreen then
//        // IQLMSdReject.pas
//        Result := TFrmLM_SDReject.Create(Self, FArinvt_ID).DoShow( DisplayModal )
//      else
//        // IQLMReject.pas
//        Result := TFrmLM_Reject.Create(Self, FArinvt_ID).DoShow( DisplayModal );
//    end;
end;


procedure TIQWebLMBase.SetArinvt_Id( AValue : Double );
var
//  A: Variant;
  AStandard_id:Real;
begin
  if (csDesigning in ComponentState) or (csLoading in ComponentState) then
     Exit;

  if (AValue = 0) and (FArinvt_Id = 0) then Exit;

  FArinvt_Id := AValue;

//  with TFDQuery.Create(NIL) do
//  try
//     {Arinvt}
//     Connection := db_dm.FDConnection;
//     SQL.Add('select itemno, descrip, descrip2, unit, class, rev, ecno, series, drawing, standard_id from arinvt');
//     SQL.Add( IQFormat('where id = %f', [ FArinvt_ID ]));
//     Open;
//     FPart_No   := FieldByName('itemno').asString;
//     FPart_desc := FieldByName('descrip').asString;
//     FMaterial2 := FieldByName('descrip2').asString;
//     FUnit      := FieldByName('Unit').asString;
//     FClass     := FieldByName('Class').asString;
//     FRev       := FieldByName('Rev').asString;
//     FEcno      := FieldByName('ECNO').asString;
//     FSeries    := FieldByName('Series').asString;
//     FDrawing   := FieldByName('Drawing').asString;
//
//     AStandard_id := FieldByName('standard_id').asFloat;
//     FLotNo     := SelectValueFmtAsString('select bom_misc.get_fg_lotno_ex( %f, %f, %f ) from dual', [ AStandard_ID, FArinvt_Id, FWorkorder_ID ]); // SelectValueFmtAsString('select fg_lotno from standard where id = %f', [FieldByName('standard_id').asFloat]);
//   finally
//     Free;
//   end;

   {AKA}
  // 09/25/2015 (Byron, EIQ-8780) Assign AKA values.  Moved code below
  // to separate method because I found two separate areas which were
  // both assigning AKA values (duplicate code).
  AssignAKA;

{
   A:= SelectValueArrayFmt( 'select cust_itemno, cust_descrip, id, cuser4, cust_rev from aka where arcusto_id = %f and arinvt_id = %f '+
                       '   and misc.aka_ship_to_filter( arcusto_id, arinvt_id, %s, ship_to_id ) = 1',
                       // June-20-2005 Replaced NULL with NumToStrDef( FShip_to_ID ) so the correct AKA will show up when printing a sales order label
                       [ FArcusto_ID, FArinvt_ID, NumToStrDef( FShip_to_ID ) ]);
   FAka_ptno:= '';
   FAka_desc:= '';
   FAka_ID  := 0;
   FAka_C4  := '';
   FAka_Rev := '';

   if VarArrayDimCount( A ) > 0 then
   begin
     FAka_ptno:= A[ 0 ];
     FAka_desc:= A[ 1 ];
     FAka_ID  := A[ 2 ];
     FAka_C4  := A[ 3 ];
     FAka_Rev := A[ 4 ];
   end;
}
//   if Assigned( Child ) then
//   begin
//      Child.AssignUserDefined( AValue );
//      Child.DisplayCaption;
//   end;

   if Standard_ID > 0 then
      FPartnoId:= SelectValueFmtAsFloat('select id from partno where arinvt_id = %f and standard_id = %f', [ FArinvt_ID, Standard_Id ]);


   if AStandard_ID > 0 then
     AssignRawMaterialsInfo(AStandard_ID);

   AssignUPC_Codes( FArinvt_ID );
end;

procedure TIQWebLMBase.AssignUPC_Codes( AArinvt_ID: Real );
begin
  FUPC_Code := SelectValueFmtAsString('select upc_code from arinvt_upc where arinvt_id = %.0f and seq = 1', [ AArinvt_ID ]);
  FUPC_Code2:= SelectValueFmtAsString('select upc_code from arinvt_upc where arinvt_id = %.0f and seq = 2', [ AArinvt_ID ]);
end;

procedure TIQWebLMBase.AssignRawMaterialsInfo(AStandard_ID:Real);
//var
//  AArinvt_Id:Real;
begin
//  AArinvt_id := SelectValueFmtAsFloat('select arinvt_id_mat from standard where id = %f', [AStandard_ID]);
//  if AArinvt_id <> 0 then
//    with TFDQuery.Create(NIL) do
//    try
//       {Arinvt}
//       Connection := db_dm.FDConnection;
//       Sql.Add(IQFormat('select class, rev, cuser1, cuser2, cuser3, cuser4, cuser5, nuser1, nuser2, nuser3, nuser4, nuser5, descrip2 ' +
//                        '  from arinvt where id = %f', [AArinvt_id]));
//       Open;
//
//       FRaw_CUsr1   := FieldByName('CUser1').asstring;
//       FRaw_CUsr2   := FieldByName('CUser2').asstring;
//       FRaw_CUsr3   := FieldByName('CUser3').asstring;
//       FRaw_CUsr4   := FieldByName('CUser4').asstring;
//       FRaw_CUsr5   := FieldByName('CUser5').asstring;
//
//       FRaw_NUsr1   := FieldByName('nuser1').asFloat;
//       FRaw_NUsr2   := FieldByName('nuser2').asFloat;
//       FRaw_NUsr3   := FieldByName('nuser3').asFloat;
//       FRaw_NUsr4   := FieldByName('nuser4').asFloat;
//       FRaw_NUsr5   := FieldByName('nuser5').asFloat;
//
//       Fraw_mat_ex  := FieldByName('descrip2').asstring;
//       FLabel_Class := FieldByName('Class').asstring;
//       FRaw_rev     := FieldByName('Rev').asstring;
//
//
//
//     finally
//       Free;
//     end;
//
//  FPtwt := SelectValueFmtAsFloat('select ptwt_disp from partno where standard_id = %f and arinvt_id = %f', [AStandard_ID, FArinvt_ID]);
end;

procedure TIQWebLMBase.SetOrd_Detail_ID( AValue : Real );
begin
  FOrd_Detail_id := AValue;
  // 09/22/2015 (Byron, EIQ-8780) When setting the order detail ID,
  // also set the AKA kind.  The check for an empty FAka_Kind is a
  // matter of caution; remove it, if required.
  if FAka_Kind = '' then
    FAka_Kind := SelectValueFmtAsString(
      'SELECT aka_kind FROM ord_detail WHERE id = %.0f', [FOrd_Detail_id]);
end;


procedure TIQWebLMBase.SetOrders_ID( AValue : Real );
begin
  FOrders_ID := AValue;
//  with TFDQuery.Create(NIL) do
//  try
//    Connection := db_dm.FDConnection;
//
//    {Check current orders}
//    Sql.Add(IQFormat('select o.orderno, o.pono, d.total_qty_ord * nvl(d.uom_factor,1) as total_qty_ord, d.DOCKID, d.LINEFEED, d.RESERVELOCATION, d.id, ' +
//                     '       d.unit, d.ord_det_seqno, d.ship_to_id_from, o.cuser1, o.cuser2, o.cuser3, o.cuser4, o.cuser5, o.cuser6 '+
//                     '  from orders o, ord_detail d ' +
//                     ' where d.orders_id = o.id ' +
//                     '   and o.id = %f ' +
//                     '   and d.arinvt_id = %f', [AValue, FArinvt_Id]));
//    Open;
//
//    FOrder_No  := FieldByName('orderno').asstring;
//    FPono      := FieldByName('pono').asstring;
//    FOrd_quan  := FieldByName('total_qty_ord').asFloat;
//    FDOCKID      := FieldByName('DOCKID').asstring;
//    FLINEFEED    := FixStr(FieldByName('LINEFEED').asstring);
//    FRESERVELOC  := FieldByName('RESERVELOCATION').asstring;
//    FOrd_detail_id := FieldByName('id').asFloat;
//
//    FOrd_Detail_Uom  := FieldByName('unit').asString;
//    FOrd_Detail_Seq  := FieldByName('ord_det_seqno').asFloat;
//    FOrd_DetailCuser1:= FieldByName('cuser1').asString;
//    FOrd_DetailCuser2:= FieldByName('cuser2').asString;
//    FOrd_DetailCuser3:= FieldByName('cuser3').asString;
//    FOrd_DetailCuser4:= FieldByName('cuser4').asString;
//    FOrd_DetailCuser5:= FieldByName('cuser5').asString;
//    FOrd_DetailCuser6:= FieldByName('cuser6').asString;
//    FShip_From_Eplant:= FieldByName('ship_to_id_from').asFloat;
//
//    if not Eof then
//       EXIT;
//
//    {Nothing found - look in the history}
//    Close;
//    SQL.Clear;
//    Sql.Add(IQFormat('select o.orderno, o.pono, d.total_qty_ord * nvl(d.uom_factor,1) as total_qty_ord, d.DOCKID, d.LINEFEED, d.RESERVELOCATION, d.id, ' +
//                     '       d.unit, d.ord_det_seqno, d.ship_to_id_from, o.cuser1, o.cuser2, o.cuser3, o.cuser4, o.cuser5, o.cuser6 '+
//                     '  from hist_orders o, hist_ord_detail d ' +
//                     '  where d.orders_id = o.id ' +
//                     '    and o.id = %f ' +
//                     '    and d.arinvt_id = %f', [ AValue, FArinvt_Id ]));
//    Open;
//
//    FOrder_No  := FieldByName('orderno').asstring;
//    FPono      := FieldByName('pono').asstring;
//    FOrd_quan  := FieldByName('total_qty_ord').asFloat;
//    FDOCKID      := FieldByName('DOCKID').asstring;
//    FLINEFEED    := FixStr(FieldByName('LINEFEED').asstring);
//    FRESERVELOC  := FieldByName('RESERVELOCATION').asstring;
//    FOrd_detail_id := FieldByName('id').asFloat;
//
//    FOrd_Detail_Uom  := FieldByName('unit').asString;
//    FOrd_Detail_Seq  := FieldByName('ord_det_seqno').asFloat;
//    FOrd_DetailCuser1:= FieldByName('cuser1').asString;
//    FOrd_DetailCuser2:= FieldByName('cuser2').asString;
//    FOrd_DetailCuser3:= FieldByName('cuser3').asString;
//    FOrd_DetailCuser4:= FieldByName('cuser4').asString;
//    FOrd_DetailCuser5:= FieldByName('cuser5').asString;
//    FOrd_DetailCuser6:= FieldByName('cuser6').asString;
//    FShip_From_Eplant:= FieldByName('ship_to_id_from').asFloat;
//
//  finally
//    Free;
//  end;

end;

procedure TIQWebLMBase.SetHistIllumRT_ID( AValue : Real );
begin
  if AValue = FHistIllumRT_ID then Exit;
  // Set the property value
  FHistIllumRT_ID := AValue;
  // Get the Work Center ID
  FWorkCenterID := SelectValueFmtAsFloat('select w.id from work_center w, hist_illum_rt h where h.id = %f and h.work_center_id = w.id', [FHistIllumRT_ID]);
  // Set the Work Center ID.  This also sets property values
  // that are descriptive of the work center.
  SetWorkCenterID(FWorkCenterID);
  // Set the eqno value based on hist_illum_rt
  FPressno   := SelectValueFmtAsString('select eqno from hist_illum_rt where id = %f', [FHistIllumRT_ID]);
end;

procedure TIQWebLMBase.SetPck_wght( AValue : Real );
begin
//  with TFDQuery.Create(NIL) do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Add(IQFormat('select o.weight, ' +
//                   'o.ptsper ' +
//                   'from partno p, ' +
//                   'sndop s, ' +
//                   'opmat o, ' +
//                   'ptoper t ' +
//                   'where s.op_class = ''PK'' ' +
//                   'and p.arinvt_id = %f ' +
//                   'and t.partno_id = p.id ' +
//                   'and t.sndop_id = s.id ' +
//                   'and o.sndop_id = s.id ' +
//                   'and o.arinvt_id = %f', [FArinvt_Id, AValue]));
//     Open;
//     FPck_wght  := FieldByName('weight').asFloat;
//     FQuantity  := FieldByName('ptsper').asFloat;
//  finally
//    Free;
//  end;

end;

procedure TIQWebLMBase.SetStandard_ID( AValue : Real );
//var
//  nId:Real;
begin
//  // if AValue = FStandard_Id then Exit;  Feb 19,00
//  FStandard_Id := AValue;
//  with TFDQuery.Create(NIL) do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Add(IQFormat('select s.mfgno, ' +
//                     '       bom_misc.get_fg_lotno( s.id, t.id ) as fg_lotno, '+  // s.fg_lotno,
//                     '       p.eqno, ' +
//                     '       workorder_misc.get_boxno(%d, %d) as boxno, '+ //replaced t.boxno for EIQ-11211 03-15-16
//                     //'       t.boxno, ' +
//                     '       t.id as partno_id, ' +
//                     '       s.arinvt_id_mat ' +
//                     '  from standard s, ' +
//                     '       partno t, ' +
//                     '       pmeqmt p ' +
//                     ' where s.id = %f ' +
//                     '   and t.standard_id(+) = s.id ' +
//                     '   and p.id(+) = s.pmeqmt_id', [Trunc(Arinvt_ID), Trunc(FStandard_Id), FStandard_Id]));
//    open;
//    {Standard}
//    FMoldno    := FieldByName('mfgno').asstring;
//    FMaterial  := SelectValueFmtAsString('select descrip from arinvt where id = %f', [FieldByName('arinvt_id_mat').asFloat]);
//    FPL_ItemNo := SelectValueFmtAsString('select itemno from arinvt where id = %f', [FieldByName('arinvt_id_mat').asFloat]);
////    FFg_lotno  := FieldByName('fg_lotno').asstring;
//    FBaseno    := FieldByName('eqno').asstring;
//    nId        := FieldByName('arinvt_id_mat').asfloat;
//
//    FLotNo     := FieldByName('fg_lotno').asstring;
//
//    FPartnoId  := FieldByName('partno_id').asFloat;
//    if Arinvt_ID > 0 then
//    begin
//       FPartnoId:= SelectValueFmtAsFloat('select id from partno where arinvt_id = %f and standard_id = %f', [ Arinvt_ID, FStandard_Id ]);
//       FLotNo   := SelectValueFmtAsString('select bom_misc.get_fg_lotno_ex( %f, %f, %f ) from dual', [ FStandard_ID, Arinvt_Id, FWorkorder_ID ]);
//    end;
//  finally
//    Free;
//  end;

end;



procedure TIQWebLMBase.SetFgMulti_Id( AValue : Real );
begin
//  if AValue = FFgMulti_Id then Exit;
//
//  FFgMulti_Id := AValue;
//
//  with TFDQuery.Create(NIL) do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Add(IQFormat('select l.loc_desc, f.lotno from fgmulti f, locations l ' +
//                   'where l.id = f.loc_id and f.id = %f', [FFgMulti_Id]));
//    open;
//    FLocation  := FieldByName('loc_desc').asstring;
////    FLotno     := FieldByName('lotno').asstring;
//  finally
//    Free;
//  end;
end;


procedure TIQWebLMBase.SetVendor_Id( AValue : Real );
begin
    // if AValue = FVendor_Id then Exit;

    FVendor_ID := AValue;

    //  with TFDQuery.Create(NIL) do
    //  try
    //    {Vendor}
    //    Connection := db_dm.FDConnection;
    //    SQL.Add(Format('select vendorno, company from vendor where id = %f', [FVendor_ID]));
    //    Open;
    //    FVendor1   := FieldByName('company').asString;
    //    FVen_Code1 := FieldByName('vendorno').asString;
    //   finally
    //     Free;
    //   end;

    if FPONoRec > '' then
    begin
      AssignVendorFromPO( FPONoRec );
      EXIT;
    end;

//    with TFDQuery.Create(NIL) do
//    try
//      {Vendor}
//      Connection := db_dm.FDConnection;
//      SQL.Add(IQFormat('select vendorno, company from vendor v, arinvt_vendors a ' +
//                     'where a.arinvt_id = %f ' +
//                     'and a.vendor_id = v.id', [FArinvt_ID]));
//      Open;
//      FVendor1   := FieldByName('company').asString;
//      FVen_code1   := FieldByName('vendorno').asString;
//      Next;
//      if (not eof) and (not bof) then
//      begin
//        FVendor2   := FieldByName('company').asString;
//        FVen_code2   := FieldByName('vendorno').asString;
//      end;
//     finally
//       Free;
//     end;
end;

procedure TIQWebLMBase.SetArcusto_Id( AValue : Real );
var
//  i:Integer;
  ASql:String;
begin
  //if AValue = FArcusto_Id then Exit;

  if FHistOrddetailId <> 0 then
  begin

    FArcusto_Id := SelectValueFmtAsFloat('select arcusto_id from hist_orders where id = %f', [FHistOrddetailId]);

    ASql := IQFormat('select arcusto_custno as custno, ' +
                     'arcusto_company as company, ' +
                     'arcusto_addr1 as addr1, ' +
                     'arcusto_addr2 as addr2, ' +
                     'arcusto_addr3 as addr3, ' +
                     'arcusto_zip as zip, ' +
                     'rtrim(ltrim(arcusto_city)) || '', '' || ' +
                     'rtrim(ltrim(arcusto_state)) || ''  '' || rtrim(ltrim(arcusto_zip)) as city_st_zp, ' +
                     'arcusto_country as country '+
                     'from hist_orders where id = %f', [FHistOrddetailId]);
  end
  else
  begin
      FArcusto_Id := AValue;
      ASql := IQFormat('select custno, ' +
                     'company, ' +
                     'addr1, ' +
                     'addr2, ' +
                     'addr3, ' +
                     'zip, ' +
                     'rtrim(ltrim(city)) || '', '' || ' +
                     'rtrim(ltrim(state)) || ''  '' || rtrim(ltrim(zip)) as city_st_zp, ' +
                     'country '+
                     'from arcusto where id = %f', [FArcusto_ID]);
  end;


//  with TFDQuery.Create(NIL) do
//  try
//    {Customer}
//    Connection := db_dm.FDConnection;
//    Sql.Add(ASql);
//
//    Open;
//    FBillname    := FieldByName('company').asString;
//    FShipName    := FieldByName('company').asString;
//    FCustomer    := FieldByName('company').asString;
//    FAddress1    := FieldByName('addr1').asString;
//    FAddress2    := FieldByName('addr2').asString;
//    FAddress3    := FieldByName('addr3').asString;
//    FCust_No     := FieldByName('custno').asString;
//    FCity_st_zp  := FieldByName('city_st_zp').asString;
//    FZipcode     := FieldByName('zip').asString;
//    FCountry     := FieldByName('country').asString;
//  finally
//    Free;
//  end;

//  if Assigned(Child) then
//    Child.AssignShipTo;

  // 09/25/2015 (Byron, EIQ-8780) Assign AKA values.  Moved code below
  // to separate method because I found two separate areas which were
  // both assigning AKA values (duplicate code).
  AssignAKA;

{
  with TFDQuery.Create(NIL) do
  try
    Connection := db_dm.FDConnection;
    if FShipmentDtlId <> 0 then
      Sql.Add(IQFormat('select cust_itemno,  ' +
                       '       cust_descrip  ' +
                       '  from c_ship_hist   ' +
                       ' where shipment_dtl_id = %f ', [FShipmentDtlId]))
    else
      Sql.Add(IQFormat('select cust_itemno, '    +
                       '  cust_descrip, id  '    +
                       '  from aka '             +
                       ' where arcusto_id = %f ' +
                       '   and arinvt_id = %f '  +
                       '   and misc.aka_ship_to_filter( arcusto_id, arinvt_id, %s, ship_to_id) = 1',
                       [ FArcusto_ID, FArinvt_ID, NumToStrDef( FShip_to_ID )]));

      Open;
      //Note - be careful assigning with FieldByName here - both queries don't pull the same fields! AB 10-06-14
      FAka_ptno := FieldByName('cust_itemno').asString;
      FAka_desc := FieldByName('cust_descrip').asString;
      FAka_ID   := SelectValueFmtAsFloat( 'select id from aka where arcusto_id = %f and arinvt_id = %f '+
                                 '   and misc.aka_ship_to_filter( arcusto_id, arinvt_id, %s, ship_to_id) = 1',
                                 [ FArcusto_ID, FArinvt_ID, NumToStrDef( FShip_to_ID )]);
      FAka_C4   := SelectValueFmtAsString( 'select cuser4 from aka where arcusto_id = %f and arinvt_id = %f '+
                                 '   and misc.aka_ship_to_filter( arcusto_id, arinvt_id, %s, ship_to_id) = 1',
                                 [ FArcusto_ID, FArinvt_ID, NumToStrDef( FShip_to_ID )]);
      FAka_Rev := SelectValueFmtAsString( 'select cust_rev from aka where arcusto_id = %f and arinvt_id = %f '+
                                '   and misc.aka_ship_to_filter( arcusto_id, arinvt_id, %s, ship_to_id) = 1',
                                [ FArcusto_ID, FArinvt_ID, NumToStrDef( FShip_to_ID )]);
  finally
    Free;
  end;
}
  AssignBlends;
end;

procedure TIQWebLMBase.AssignAKA;
begin
//  // Reset
//  FAka_ID := 0;
//  FAka_ptno := '';
//  FAka_desc := '';
//  FAka_C4 := '';
//  FAka_Rev := '';
//
//  try
//    with TFDQuery.Create(NIL) do
//      try
//        Connection := db_dm.FDConnection;
//        // If SHIPMENT_DTL_ID is provided, get data from C_SHIP_HIST.
//        // Note:  AKA.ID is obtained, however, using a subquery.
//        if Trunc(FShipmentDtlId) > 0 then
//          begin
//            // Normally the AKA itemno and descrip come from shipment history.
//            // If those values are unavailable, and an AKA record is available,
//            // then get cust_itemno and cust_descrip from AKA.
//            SQL.Add(       'SELECT aka.id,                                                ');
//            SQL.Add(       '       DECODE(c_ship_hist.cust_itemno,                        ');
//            SQL.Add(       '              NULL, aka.cust_itemno,                          ');
//            SQL.Add(       '              c_ship_hist.cust_itemno)                        ');
//            SQL.Add(       '          AS cust_itemno,                                     ');
//            SQL.Add(       '       DECODE(c_ship_hist.cust_itemno,                        ');
//            SQL.Add(       '              NULL, aka.cust_descrip,                         ');
//            SQL.Add(       '              c_ship_hist.cust_descrip)                       ');
//            SQL.Add(       '          AS cust_descrip,                                    ');
//            SQL.Add(       '       DECODE(c_ship_hist.cust_itemno,                        ');
//            SQL.Add(       '              NULL, aka.cust_descrip2,                        ');
//            SQL.Add(       '              c_ship_hist.cust_descrip2)                      ');
//            SQL.Add(       '          AS cust_descrip2,                                   ');
//            SQL.Add(       '       aka.cust_rev,                                          ');
//            SQL.Add(       '       aka.cuser4                                             ');
//            SQL.Add(       '  FROM c_ship_hist,                                           ');
//            SQL.Add(       '       (SELECT id,                                            ');
//            SQL.Add(       '               cust_itemno,                                   ');
//            SQL.Add(       '               cust_descrip,                                  ');
//            SQL.Add(       '               cust_descrip2,                                 ');
//            SQL.Add(       '               cust_rev,                                      ');
//            SQL.Add(       '               cuser4                                         ');
//            SQL.Add(       '          FROM aka                                            ');
//            SQL.Add(Format('         WHERE aka.arcusto_id = %d AND                        ',[Trunc(FArcusto_ID)]));
//            SQL.Add(Format('               aka.arinvt_id = %d AND                         ',[Trunc(FArinvt_ID)]));
//            if FAKA_Kind > '' then
//              SQL.Add(Format('               aka.kind = ''%s'' AND                          ',[FAKA_Kind]));
//            SQL.Add(       '               misc.aka_ship_to_filter(aka.arcusto_id,        ');
//            SQL.Add(       '                                       aka.arinvt_id,         ');
//            SQL.Add(Format('                                       %s,                    ',[NumToStrDef(Trunc(FShip_to_ID))]));
//            SQL.Add(       '                                       aka.ship_to_id) = 1 AND');
//            SQL.Add(       '               ROWNUM < 2) aka                                ');
//            SQL.Add(Format(' WHERE c_ship_hist.shipment_dtl_id = %d                       ',[Trunc(FShipmentDtlId)]));
//          end
//        else
//          begin
//            SQL.Add(       'SELECT id,                                                    ');
//            SQL.Add(       '       cust_itemno,                                           ');
//            SQL.Add(       '       cust_descrip,                                          ');
//            SQL.Add(       '       cust_descrip2,                                         ');
//            SQL.Add(       '       cust_rev,                                              ');
//            SQL.Add(       '       cuser4                                                 ');
//            SQL.Add(       '  FROM aka                                                    ');
//            SQL.Add(Format(' WHERE arcusto_id = %d AND                                    ',[Trunc(FArcusto_ID)]));
//            SQL.Add(Format('       arinvt_id = %d AND                                     ',[Trunc(FArinvt_ID)]));
//            if FAKA_Kind > '' then
//              SQL.Add(Format('       kind = ''%s'' AND                                    ',[FAKA_Kind]));
//            SQL.Add(       '       misc.aka_ship_to_filter(arcusto_id,                    ');
//            SQL.Add(       '                               arinvt_id,                     ');
//            SQL.Add(Format('                               %s,                            ',[NumToStrDef(Trunc(FShip_to_ID))]));
//            SQL.Add(       '                               ship_to_id) = 1                ');
//          end;
//
//        Open;
//
//        FAka_ID := FieldByName('id').AsLargeInt;
//        FAka_ptno := FieldByName('cust_itemno').asString;
//        FAka_desc := FieldByName('cust_descrip').asString;
//        FAka_C4 := FieldByName('cuser4').asString;
//        FAka_Rev := FieldByName('cust_rev').asString;
//      finally
//        Free;
//      end;
//  except on E: Exception do
//    // vcl_rscstr.cTXT0000506 = 'Encountered error assigning AKA information:';
//    raise Exception.Create(
//      vcl_rscstr.cTXT0000506 + #13#13 + E.Message);
//  end;
end;

procedure TIQWebLMBase.AssignBlends;
var
  i:Integer;
begin
  {reset}
  for I:= 1 to 5 do
  begin
    FBlend[I].BlendItem:= '';
    FBlend[I].BlendDesc:= '';
    FBlend[I].BlendPrcn:= 0;
  end;

//  {assign}
//  with TFDQuery.Create(NIL) do
//  try
//    Connection := db_dm.FDConnection;
//    Sql.Clear;
//    Sql.Add(IQFormat('select o.ptsper, a.itemno, a.descrip ' +
//                   'from opmat o, sndop s, arinvt a ' +
//                   'where s.arinvt_id = %f ' +
//                   'and o.arinvt_id = a.id ' +
//                   'and o.sndop_id = s.id', [FArinvt_ID]));
//    Open;
//    I:= 0;
//    while not eof and (I < 5) do
//    begin
//      Inc( I );
//      FBlend[ I ].BlendItem := FieldByName('itemno').asString;
//      FBlend[ I ].BlendDesc := FieldByName('descrip').asString;
//      FBlend[ I ].BlendPrcn := FieldByName('ptsper').asFloat;
//      Next;
//    end;
//  finally
//    Free;
//  end;

end;


procedure TIQWebLMBase.SetPoNoRec( AValue : String );
begin
  // if AValue = FPoNoRec then Exit;

  {Assign PO# Receiving}
  FPONoRec:= AValue;

  AssignVendorFromPO( FPONoRec );
end;

procedure TIQWebLMBase.AssignVendorFromPO( APoNo: string );
var
  A: Variant;
begin
  {Assign Vendor info}
  A:= SelectValueArrayFmt( 'select v.id, v.vendorno, v.company from po, vendor v where rtrim(po.pono) = ''%s'' and po.vendor_id = v.id',
                      [ Trim( APoNo )]);

  FVendor_ID:= 0;
  FVendor1  := '';
  FVen_Code1:= '';
  {for now let vendor2 and ven_code2 to stay as is}
  // FVendor2  := '';
  // FVen_Code2:= '';

  if VarArrayDimCount( A ) > 0 then
  begin
    FVendor_ID:= A[0];
    FVen_Code1:= A[1];
    FVendor1  := A[2];
  end;
end;

procedure TIQWebLMBase.SetPartno_Id( AValue : Real );
begin
  if AValue = FPartno_Id then Exit;
  FPartno_Id := AValue;
end;

procedure TIQWebLMBase.SetWorkCenterID(const Value: Real);
var
  AData: Variant;
begin
  if FWorkCenterID = Value then Exit;
  // Set property value
  FWorkCenterID := Value;
  // Initialize variables
  FPressno := '';
  FCntr_Desc := '';
  FWorkCenter_MFGType := '';
  FWorkCenter_MFGCell := '';
  // Get work center information
  AData := SelectValueArrayFmt(
    'SELECT eqno, cntr_desc, mfg_type, mfgcell'#13 +
    '  FROM work_center'#13 +
    ' WHERE id = %.0f',
    [FWorkCenterID]);
  // Populate property variables
  if System.Variants.VarArrayDimCount(AData) > 0 then
     begin
       FPressno := AData[0];
       FCntr_Desc := AData[1];
       FWorkCenter_MFGType := AData[2];
       FWorkCenter_MFGCell := AData[3];
     end;
end;

procedure TIQWebLMBase.SetWorkorder_Id( AValue : Real );
begin
  if AValue = FWorkorder_Id then Exit;
  FWorkorder_Id := AValue;
end;


procedure TIQWebLMBase.SetBill_To_Id( AValue : Real );
begin
  if AValue = FBill_To_Id then Exit;


  if FHistOrddetailId <> 0 then
  begin

    FBill_To_Id := SelectValueFmtAsFloat('select bill_to_id from hist_orders where id = %f', [FHistOrddetailId]);

//    with TFDQuery.Create(NIL) do
//    try
//      {Customer}
//      Connection := db_dm.FDConnection;
//      SQL.Add(IQFormat('select bill_to_attn as attn, ' +
//                     'bill_to_addr1 as addr1, ' +
//                     'bill_to_addr2 as addr2, ' +
//                     'bill_to_addr3 as addr3, ' +
//                     'bill_to_zip as zip, ' +
//                     'rtrim(ltrim(bill_to_city)) || '', '' || ' +
//                     'rtrim(ltrim(bill_to_state)) as city_st ' +
//                     'from hist_orders where id = %f', [FHistOrddetailId]));
//      Open;
//      FBillname   := FieldByName('attn').asString;
//      FBilladd    := FieldByName('addr1').asString;
//      FBilladd2   := FieldByName('addr2').asString;
//      FBilladd3   := FieldByName('addr3').asString;
//      FBillcityst := FieldByName('city_st').asString;
//      FBillzip    := FieldByName('zip').asString;
//     finally
//       Free;
//     end;

  end
  else
  begin

    FBill_To_Id := AValue;

//    with TFDQuery.Create(NIL) do
//    try
//      {Customer}
//      Connection := db_dm.FDConnection;
//      SQL.Add(IQFormat('select attn, ' +
//                     'addr1, ' +
//                     'addr2, ' +
//                     'addr3, ' +
//                     'zip, ' +
//                     'rtrim(ltrim(city)) || '', '' || ' +
//                     'rtrim(ltrim(state)) as city_st ' +
//                     'from bill_to where id = %f', [FBill_To_Id]));
//      Open;
//      FBillname   := FieldByName('attn').asString;
//      FBilladd    := FieldByName('addr1').asString;
//      FBilladd2   := FieldByName('addr2').asString;
//      FBilladd3   := FieldByName('addr3').asString;
//      FBillcityst := FieldByName('city_st').asString;
//      FBillzip    := FieldByName('zip').asString;
//     finally
//       Free;
//     end;
  end;
end;

{DataLinks}
function TIQWebLMBase.GetDataField:string;
begin
  Result:= FDataLink.FieldName;
end;

procedure TIQWebLMBase.SetDataField( AValue:string );
begin
  if AValue <> FDataLink.FieldName then
    FDataLink.FieldName:= AValue;
end;

function TIQWebLMBase.GetDataSource : TDataSource;
begin
  Result:= FDataLink.DataSource;
end;

procedure TIQWebLMBase.SetDataSource( AValue:TDataSource );
begin
  if FDataLink.DataSource <> AValue then
     FDataLink.DataSource:= AValue;
end;

procedure TIQWebLMBase.ClearVars;
begin
    FVendor_Id      := 0;
    FBill_To_ID     := 0;
    FFgMulti_ID     := 0;
    FStandard_ID    := 0;
    FHistIllumRT_ID := 0;
    FOrders_Id      := 0;
    FOrd_Detail_Id  := 0;
    FPO_Id          := 0;
    FPartno_Id      := 0;
    FPTOrder_ID     := 0;
    FWorkorder_Id   := 0;
    FDBFFile        := '';
    FRemoteServer   := '';
    FComm_Port      := '';
    FLabelDate      := 0;
    FLabelQty       := 0;
    //FLabelType      := '';
    //FOrigin         := '';
    FLabelFile      := '';
    FLM_Labels_ID   := 0;
    FArcusto_Id     := 0;
    FPart_No        := '';
    FPart_desc      := '';
    FOrder_no       := '';
    FPono           := '';
    FOrd_quan       := 0;
    FCust_no        := '';
    FCustomer       := '';
    FAddress1       := '';
    FAddress2       := '';
    FAddress3       := '';
    FCity_st_zp     := '';
    FZipcode        := '';
    FShipName       := '';
    FCountry        := '';
    FBillname       := '';
    FBilladd        := '';
    FBilladd2       := '';
    FBilladd3       := '';
    FBillcityst     := '';
    FBillzip        := '';
    FShipToUser1    := '';
    FShipToUser2    := '';
    FSupp_Code      := '';
    FPk_Tare        := 0;
    FPK_1_Tare      := 0;
    FPK_1_Item      := '';
    FUPC_Code       := '';
    FUPC_Code2      := '';
    FDOCKID         := '';
    FLINEFEED       := '';
    FRESERVELOC     := '';
    FSerial         := 0;
    FCSerial        := '';
    FPrint_Time     := '';
    FTboxno         := 0;
    FMaterial2      := '';
    FUnit           := '';
    FClass          := '';
    FRev            := '';
    FVendor1        := '';
    FVen_Code1      := '';
    FVendor2        := '';
    FVen_Code2      := '';
    FEcno           := '';
    FSeries         := '';
    FDrawing        := '';
    FArinvt_ID      := 0;
    FAka_ptno       := '';
    FAka_desc       := '';
    FLocation       := '';
    FLotNo          := '';
    FQuantity       := 0;
    FMoldno         := '';
    FMaterial       := '';
    FPL_ItemNo      := '';
    FBaseno         := '';
    FBoxno          := 0;
    FPartNoId       := 0;
    FPck_wght       := 0;
    FBox_ID         := 0;
    FPoNoRec        := '';
    FBcls_item1     := '';
    FBcls_item2     := '';
    FBcls_item3     := '';
    FBcls_item4     := '';
    FBcls_item5     := '';
    FBldesc1        := '';
    FBldesc2        := '';
    FBldesc3        := '';
    FBldesc4        := '';
    FBldesc5        := '';
    FBld_prcnt1     := 0;
    FBld_prcnt2     := 0;
    FBld_prcnt3     := 0;
    FBld_prcnt4     := 0;
    FBld_prcnt5     := 0;
    FPressno        := '';
    FWeight         := 0;
    FVolume         := 0;
    FInv_CUser1     := '';
    FInv_CUser2     := '';
    FInv_CUser3     := '';
    FInv_CUser4     := '';
    FInv_CUser5     := '';
    FInv_CUser6     := '';
    FInv_CUser7     := '';
    FInv_CUser8     := '';
    FInv_CUser9     := '';
    FInv_CUser10    := '';
    FInv_NUser1     := 0;
    FInv_NUser2     := 0;
    FInv_NUser3     := 0;
    FInv_NUser4     := 0;
    FInv_NUser5     := 0;
    FInv_NUser6     := 0;
    FInv_NUser7     := 0;
    FInv_NUser8     := 0;
    FInv_NUser9     := 0;
    FInv_NUser10    := 0;
    FRaw_CUsr1      := '';
    FRaw_CUsr2      := '';
    FRaw_CUsr3      := '';
    FRaw_CUsr4      := '';
    FRaw_CUsr5      := '';
    FRaw_CUsr6      := '';
    FRaw_CUsr7      := '';
    FRaw_CUsr8      := '';
    FRaw_CUsr9      := '';
    FRaw_CUsr10     := '';
    FRaw_NUsr1      := 0;
    FRaw_NUsr2      := 0;
    FRaw_NUsr3      := 0;
    FRaw_NUsr4      := 0;
    FRaw_NUsr5      := 0;
    FRaw_NUsr6      := 0;
    FRaw_NUsr7      := 0;
    FRaw_NUsr8      := 0;
    FRaw_NUsr9      := 0;
    FRaw_NUsr10     := 0;
    Feplant_id      := 0;
    Flabel_date     := 0;
    Fprod_date      := 0;
    Fraw_mat_ex     := '';
    FLabel_Class    := '';
    Fptwt           := 0;
    Fshift          := 0;
    Freceiptnum     := '';
    FDivision       := '';
    FRaw_rev        := '';
    FPackno         := '';
    FPackslipno     := '';
    FDateReceived   := 0;
    FPtspac         := 0;
    FPtspac2        := '';
    FBaseno2        := '';
    FRouting2       := '';
    FRouting        := '';
    FHistOrddetailId:= 0;
    FShipmentDtlId  := 0;
    FShipments_ID   := 0;
    FShip_To_ID     := 0;
    FAka_ID         := 0;
    FRel_CUser1     := '';
    FRel_CUser2     := '';
    FLot_Date       := 0;

    FStart_Time     := 0;
    FShelf_Life     := 0;

    FSndop_Dispatch_ID:= 0;
    FSndop_ID       := 0;
    FNext_Sndop_ID  := 0;
    FProcessLogin   := '';
    FProcessShift_ID:= 0;
    FNext_Sndop_Dispatch_ID:= 0;

    FCountryOfOrigin:= '';

    FOrd_Detail_Uom  := '';
    FOrd_Detail_Seq  := 0;
    FOrd_DetailCuser1:= '';
    FOrd_DetailCuser2:= '';
    FOrd_DetailCuser3:= '';
    FOrd_DetailCuser4:= '';
    FOrd_DetailCuser5:= '';
    FOrd_DetailCuser6:= '';
    FShip_From_Eplant:= 0;
end;


function TIQWebLMBase.ExtractParamAsFloat( AParam: Variant; AIndex: Integer; ADefaultValue: Real = 0 ): Real;
begin
  if AIndex > VarArrayHighBound( AParam, 1 ) then
  begin
    Result:= ADefaultValue;
    EXIT;
  end;

  try
    Result:= AParam[ AIndex ];
  except on E: Exception do
      raise Exception.Create('Unexpected param type encountered calling ExtractParamAsFloat. ' + E.Message );
  end;
end;

function TIQWebLMBase.ExtractParamAsString( AParam: Variant; AIndex: Integer; ADefaultValue: string = '' ): string;
begin
  if AIndex > VarArrayHighBound( AParam, 1 ) then
  begin
    Result:= ADefaultValue;
    EXIT;
  end;

  try
    Result:= AParam[ AIndex ];
  except on E: Exception do
      raise Exception.Create('Unexpected param type encountered calling ExtractParamAsFloat. ' + E.Message );
  end;
end;

{ ============================================================================ }

function TIQWebLMBase.NumToStrDef(AValue: Real): string;
begin
  if AValue = 0 then
     Result:= 'NULL'
  else
     Result:= FloatToStr( AValue );
end;

procedure TIQWebLMBase.SetPk_Ticket_Dtl_ID(const Value: Real);
begin
  FPk_Ticket_Dtl_ID:= Value;
  FPackno:= SelectValueByID('ps_ticket_id', 'ps_ticket_dtl', FPk_Ticket_Dtl_ID );
end;

procedure TIQWebLMBase.SetPressno(const Value: String);
var
  AResult: Variant;
begin
  FPressno  := Value;
  AResult := SelectValueParam(
   'SELECT id FROM work_center WHERE TRIM(eqno) = TRIM(:EQNO)',
   ['EQNO'], [Value]);
  if not System.Variants.VarIsNull(AResult) then
    FWorkCenterID := System.Variants.VarAsType(AResult, varInt64)
  else
    FWorkCenterID := 0;
  SetWorkCenterID(FWorkCenterID);
end;

{ TIQWebLMPackSlip }

constructor TIQWebLMPackSlip.Create( AOwner:TComponent );
begin
  inherited;
  LabelType  := 'MANUFACTURED';
  Origin := 'PACKSLIP';
  Arinvt_id  := 0;
end;

{ TIQWebLMBom }

constructor TIQWebLMBom.Create( AOwner:TComponent );
begin
  inherited;
  LabelType  := 'MANUFACTURED';
  Origin := 'BOM';
end;

{ TIQWebLMRaw }

constructor TIQWebLMRaw.Create( AOwner:TComponent );
begin
  inherited;
  LabelType  := 'PURCHASED';
  Origin := 'RAW';
end;

constructor TIQWebLMRT.Create( AOwner:TComponent );
begin
  inherited Create(AOwner);
  LabelType  := 'MANUFACTURED';
  Origin := 'RT';
end;

{ TIQWebSDLMPackSlip }
constructor TIQWebSDLMPackSlip.Create(AOwner: TComponent);
begin
  inherited;
  LabelType  := 'MANUFACTURED';
  Origin     := 'SDPACKSLIP';
  Arinvt_id  := 0;
end;

{ TIQWebSDLMBom }

constructor TIQWebSDLMBom.Create(AOwner: TComponent);
begin
  inherited;
  LabelType  := 'MANUFACTURED';
  Origin     := 'SDBOM';
end;

{ TIQWebSDLMRaw }

constructor TIQWebSDLMRaw.Create(AOwner: TComponent);
begin
  inherited;
  LabelType  := 'PURCHASED';
  Origin     := 'SDRAW';
end;

{ TIQWebLMProd }

constructor TIQWebLMProd.Create(AOwner: TComponent);
begin
  inherited;
  Origin := 'PROD';
end;

{ TIQWebLMSDProd }

constructor TIQWebLMSDProd.Create(AOwner: TComponent);
begin
  inherited;
  Origin := 'SDPROD';
end;

{ TLMProdPRW }

constructor TLMProdPRW.Create(AOwner: TComponent);
begin
  inherited;
  Origin := 'PROD_PRW';
end;

function TIQWebLMBase.IsSIC: Boolean;
begin
  Result := SelectValueFmtAsString('select is_linked_to_serial from arinvt where id = %f', [FArinvt_ID]) = 'Y';
end;


{ TIQWebLMReject }

constructor TIQWebLMReject.Create(AOwner: TComponent);
begin
  inherited;
  Origin := 'LMREJECT';
  LabelType  := 'MANUFACTURED';
  LabelKind  := 'NONSERIAL';
end;

procedure TIQWebLMReject.SetRejectCodeID(const Value: Real);
begin
  FRejectCodeID := Value;
//  with TFDQuery.Create(nil) do
//  try
//    Connection := db_dm.FDConnection;
//    SQL.Add('SELECT reject_code,');
//    SQL.Add('       attribute');
//    SQL.Add('  FROM reject_code');
//    SQL.Add(Format(' WHERE id = %.0f',[RejectCodeID]));
//    Open;
//    FRejectCode := Fields[0].AsString;
//    FRejectDescription := Fields[1].AsString;
//  finally
//    Free;
//  end;
end;

procedure TIQWebLMBase.SetBill_To_Id2( AValue : Real );
begin
  if AValue = FBill_To_Id2 then Exit;


  if FHistOrddetailId <> 0 then
  begin

    FBill_To_Id2 := SelectValueFmtAsInt64(
      'select bill_to_id from hist_orders where id = %f',
      [FHistOrddetailId]);

//    with TFDQuery.Create(NIL) do
//    try
//      {Customer}
//      Connection := db_dm.FDConnection;
//      SQL.Add(IQFormat('select bill_to_attn as attn, ' +
//                     'bill_to_addr1 as addr1, ' +
//                     'bill_to_addr2 as addr2, ' +
//                     'bill_to_addr3 as addr3, ' +
//                     'bill_to_zip as zip, ' +
//                     'rtrim(ltrim(bill_to_city)) || '', '' || ' +
//                     'rtrim(ltrim(bill_to_state)) as city_st ' +
//                     'from hist_orders where id = %f', [FHistOrddetailId]));
//      Open;
//      FBillname   := FieldByName('attn').asString;
//      FBilladd    := FieldByName('addr1').asString;
//      FBilladd2   := FieldByName('addr2').asString;
//      FBilladd3   := FieldByName('addr3').asString;
//      FBillcityst := FieldByName('city_st').asString;
//      FBillzip    := FieldByName('zip').asString;
//     finally
//       Free;
//     end;

  end
  else
  begin

    FBill_To_Id2 := AValue;

//    with TFDQuery.Create(NIL) do
//    try
//      {Customer}
//      Connection := db_dm.FDConnection;
//      SQL.Add(IQFormat('select attn, ' +
//                     'addr1, ' +
//                     'addr2, ' +
//                     'addr3, ' +
//                     'zip, ' +
//                     'rtrim(ltrim(city)) || '', '' || ' +
//                     'rtrim(ltrim(state)) as city_st ' +
//                     'from bill_to where id = %f', [FBill_To_Id2]));
//      Open;
//      FBillname   := FieldByName('attn').asString;
//      FBilladd    := FieldByName('addr1').asString;
//      FBilladd2   := FieldByName('addr2').asString;
//      FBilladd3   := FieldByName('addr3').asString;
//      FBillcityst := FieldByName('city_st').asString;
//      FBillzip    := FieldByName('zip').asString;
//     finally
//       Free;
//     end;
  end;
end;


end.




