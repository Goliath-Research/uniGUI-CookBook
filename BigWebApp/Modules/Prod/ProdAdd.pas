unit ProdAdd;

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
  StdCtrls,
  Buttons,
  ComCtrls,
  Db,
  IQMS.WebVcl.Hpick,
  ExtCtrls,
  Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniRadioButton,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, uniComboBox, uniDBComboBox;

type
  TFrmProdManual = class(TUniForm)
    StatusBar1: TUniStatusBar;
    wwQryWorkorder: TFDQuery;
    wwQryMfg: TFDQuery;
    PkMfg: TIQWebHPick;
    PkMfgMFGNO: TStringField;
    PkMfgITEMNO: TStringField;
    PkMfgREV: TStringField;
    PkMfgDESCRIP: TStringField;
    PkMfgCOMPANY: TStringField;
    PkMfgID: TBCDField;
    PkMfgMFG_TYPE: TStringField;
    PkMfgDESCRIP2: TStringField;
    wwQryWorkCenter: TFDQuery;
    wwQrySalesOrder: TFDQuery;
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoPRIME_CONTACT: TStringField;
    PkArcustoID: TBCDField;
    wwQryCustomer: TFDQuery;
    PkOrders: TIQWebHPick;
    PkOrdersID: TBCDField;
    PkOrdersPONO: TStringField;
    PkOrdersCUSTNO: TStringField;
    PkOrdersCOMPANY: TStringField;
    PkOrdersDATE_TAKEN: TDateTimeField;
    PkOrdersORD_BY: TStringField;
    PkOrdersCLASS: TStringField;
    PkOrdersREV: TStringField;
    PkOrdersITEMNO: TStringField;
    PkOrdersDESCRIPTION: TStringField;
    PkOrdersDESCRIPTION2: TStringField;
    PkOrdersSTATUS: TStringField;
    PkOrdersADDR1: TStringField;
    PkOrdersADDR2: TStringField;
    PkOrdersADDR3: TStringField;
    PkOrdersORDERNO: TStringField;
    wwQryCustomerCUSTNO: TStringField;
    wwQryCustomerCOMPANY: TStringField;
    wwQryCustomerARCUSTO_ID: TBCDField;
    wwQrySalesOrderORDERNO: TStringField;
    wwQrySalesOrderCUSTNO: TStringField;
    wwQrySalesOrderCOMPANY: TStringField;
    wwQrySalesOrderITEMNO: TStringField;
    wwQrySalesOrderDESCRIPTION: TStringField;
    wwQryWorkCenterEQNO: TStringField;
    wwQryWorkCenterCNTR_DESC: TStringField;
    wwQryWorkCenterCNTR_TYPE: TStringField;
    wwQryWorkCenterMFG_TYPE: TStringField;
    wwQryWorkCenterCNTR_RATE: TBCDField;
    wwQryWorkCenterMFGCELL: TStringField;
    wwQryWorkCenterWORK_CENTER_ID: TBCDField;
    PkMfgDIVISION_ID: TBCDField;
    wwQryWorkCenterDIVISION_ID: TBCDField;
    PkMfgEPLANT_ID: TBCDField;
    PkOrdersEPLANT_ID: TBCDField;
    wwQrySalesOrderEPLANT_ID: TBCDField;
    wwQryWorkCenterEPLANT_ID: TBCDField;
    wwQryWorkorderWORKORDER_ID: TBCDField;
    wwQryWorkorderSTANDARD_ID: TBCDField;
    wwQryWorkorderBUCKET: TBCDField;
    wwQryWorkorderARCUSTO_ID: TBCDField;
    wwQryWorkorderMFGNO: TStringField;
    wwQryWorkorderEQNO: TStringField;
    wwQryWorkorderCNTR_SEQ: TBCDField;
    wwQryWorkorderCUSTNO: TStringField;
    wwQryWorkorderCOMPANY: TStringField;
    wwQryWorkorderDIVISION_ID: TBCDField;
    wwQryWorkorderEPLANT_ID: TBCDField;
    wwQryMfgSTANDARD_ID: TBCDField;
    wwQryMfgMFGNO: TStringField;
    wwQryMfgCUSTNO: TStringField;
    wwQryMfgCOMPANY: TStringField;
    wwQryMfgDIVISION_ID: TBCDField;
    wwQryMfgEPLANT_ID: TBCDField;
    wwQryMfgROUTE_SEQ: TBCDField;
    PkMfgPK_HIDE: TStringField;
    PkArcustoPK_HIDE: TStringField;
    PkWorOrder: TIQWebHPick;
    PkWorOrderWORKORDER_ID: TBCDField;
    PkWorOrderSTANDARD_ID: TBCDField;
    PkWorOrderBUCKET: TBCDField;
    PkWorOrderARCUSTO_ID: TBCDField;
    PkWorOrderMFGNO: TStringField;
    PkWorOrderEQNO: TStringField;
    PkWorOrderCNTR_SEQ: TBCDField;
    PkWorOrderCUSTNO: TStringField;
    PkWorOrderCOMPANY: TStringField;
    PkWorOrderDIVISION_ID: TBCDField;
    PkWorOrderEPLANT_ID: TBCDField;
    PkWorkCntr: TIQWebHPick;
    PkWorkCntrEQNO: TStringField;
    PkWorkCntrCNTR_DESC: TStringField;
    PkWorkCntrCNTR_TYPE: TStringField;
    PkWorkCntrID: TBCDField;
    PkWorkCntrEPLANT_ID: TBCDField;
    PkWorkCntrMFGCELL: TStringField;
    PkWorkCntrDIVISION_NAME: TStringField;
    PkWorkCntrEPLANT_NAME: TStringField;
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    GroupBox2: TUniGroupBox;
    Panel4: TUniPanel;
    GroupBox1: TUniGroupBox;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label3: TUniLabel;
    Label7: TUniLabel;
    Label6: TUniLabel;
    PnlClient01: TUniPanel;
    wwcombWorkCenter: TUniDBLookupComboBox;
    wwcombSalesOrd: TUniDBLookupComboBox;
    wwcombCustomer: TUniDBLookupComboBox;
    PkWorkCntrPK_HIDE: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PkMfgSTANDARD_DESCRIP: TStringField;
    Panel5: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    btnApply: TUniButton;
    Panel6: TUniPanel;
    sbtnSearchWoItem: TUniSpeedButton;
    sbtnSearchMfgItem: TUniSpeedButton;
    Panel7: TUniPanel;
    radioWorkorder: TUniRadioButton;
    radioMfg: TUniRadioButton;
    wwcombWorkOrder: TUniDBLookupComboBox;
    wwcombMfg: TUniDBLookupComboBox;
    radioDownTime: TUniRadioButton;
    Panel8: TUniPanel;
    sbtnSearchworkCenter: TUniSpeedButton;
    sbtnSearchSalesOrder: TUniSpeedButton;
    sbtnSearchCustomer: TUniSpeedButton;
    SR: TIQWebSecurityRegister;
    ds_QryWorkorder: TDataSource;
    ds_QryMfg: TDataSource;
    ds_QryWorkCenter: TDataSource;
    ds_QrySalesOrder: TDataSource;
    ds_QryCustomer: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSearchMfgItemClick(Sender: TObject);
    procedure radioWorkorderClick(Sender: TObject);
    procedure sbtnSearchCustomerClick(Sender: TObject);
    procedure sbtnSearchSalesOrderClick(Sender: TObject);
    procedure wwcombWorkOrderCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AssignDivisionFilter(DataSet: TDataSet);
    procedure btnApplyClick(Sender: TObject);
    procedure sbtnSearchWoItemClick(Sender: TObject);
    procedure sbtnSearchworkCenterClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel7Resize(Sender: TUniControl; OldWidth, OldHeight: Integer);
    procedure Panel4Resize(Sender: TUniControl; OldWidth, OldHeight: Integer);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FProdDate    : TDateTime;
    FShift       : Integer;
    FMfgCell     : string;
    FStandard_ID : Real;
    FWorkorder_ID: Real;
    FSilentWorkorder_ID: Real; // provided by silent wrapper
    FDivision_ID : Real;
    FDayProd_ID  : Real;
    FArinvt_ID   : Real;
    procedure SetProdDate( AValue: TDateTime );
    procedure SetShift( AValue: Integer );
    procedure SetMfgCell( AValue: string );
    procedure EnableControl( AControl:TControl; AValue: Boolean );
    procedure Check( OK: Boolean; const S: string );
    procedure AssignWorkOrderID;
    procedure AddToHist_Illum_RT( var AHist_Illum_RT_ID: Real );
    procedure AddToHist_Illum_Part( AHist_Illum_RT_ID: Real );
    procedure SyncOthersToWorkOrder( LookupTable: TDataSet );
    function GetCustomerDataAsString(AFieldName: string): string;
    function GetOrderNo: string;
    procedure SetOrderNo(const Value: string);
    function GetEqno: string;
    procedure SetEqno(const Value: string);
    function GetCustNo: string;
    procedure SetCustNo(const Value: string);
    function GetWork_Center_ID: Real;
  protected
    function GetPartnoID: Int64;
  public
    { Public declarations }
    ApplyClicked: Boolean;
    Silent: Boolean;

    FSelectedArcusto_ID: Real;

    property ProdDate      : TDateTime read FProdDate     write SetProdDate;
    property Shift         : Integer   read FShift        write SetShift;
    property MfgCell       : string    read FMfgCell      write SetMfgCell;
    property Standard_ID   : Real      read FStandard_ID  write FStandard_ID;
    property WorkOrder_ID  : Real      read FWorkOrder_ID write FWorkOrder_ID;
    property Division_ID   : Real      read FDivision_ID  write FDivision_ID;
    property DayProd_ID    : Real      read FDayProd_ID   write FDayProd_ID;
    property OrderNo       : string    read GetOrderNo    write SetOrderNo;
    property Eqno          : string    read GetEqno       write SetEqno;
    property CustNo        : string    read GetCustNo     write SetCustNo;
    property Arinvt_ID     : Real      read FArinvt_ID    write FArinvt_ID;
    property Work_Center_ID: Real      read GetWork_Center_ID;

    procedure Validate; virtual;
    procedure Add; virtual;
    procedure AddToDayProd( var ADayProd_ID: Real; AHist_Illum_RT_ID: Real );virtual;
    procedure AddToDay_Part( ADayProd_ID, AHist_Illum_RT_ID: Real );virtual;
  end;

  TManualProdParams = record
    ProdDate     : TDateTime;
    Shift        : Integer;
    MfgCell      : string;
    Standard_ID  : Real;
    Eqno         : string;
    Custno       : string;
    OrderNo      : string;
    DayProd_ID   : Real;
    WorkOrder_ID : Real;
    Arinvt_ID    : Real; // 04/29/2009 Added (Byron)
    constructor Create( AWorkorder_ID: Real );
  end;

function DoAppendManualProd(const AOwner: TComponent; var AParams: TManualProdParams ):Boolean;
function DoAppendSilentProd(const AOwner: TComponent; const AParams: TManualProdParams;
 var ANewDayProdID: Real ):Boolean;
procedure DoAppendSilentHist_Illum_RT(const AOwner: TComponent; const AParams: TManualProdParams; var AHist_Illum_RT_ID: Real );


implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Dialogs,
  IQMS.Common.HelpHook,
  IQMS.Common.StringUtils,
  Variants,
  prod_rscstr;
//  IQSecIns;


procedure TFrmProdManual.UniFormCreate(Sender: TObject);
begin
  ApplyClicked:= FALSE;
  IQRegFormRead( self, [ self ]);
end;


function DoAppendManualProd(const AOwner: TComponent; var AParams: TManualProdParams ):Boolean;
var
  frm:TFrmProdManual;
begin
//not used the AOwner param.

  frm                     := TFrmProdManual.Create(uniGUIApplication.uniApplication);
  frm.Silent              := FALSE;
  frm.ProdDate            := AParams.ProdDate;
  frm.Shift               := AParams.Shift;
  frm.MfgCell             := AParams.MfgCell;
  frm.Arinvt_ID           := 0;
  frm.FSilentWorkorder_ID := 0; // initial

  Result:= (frm.ShowModal = mrOK) or frm.ApplyClicked;
  if Result then
  begin
     AParams.Standard_ID  := frm.Standard_ID;
     AParams.Eqno         := frm.Eqno;      // wwcombWorkCenter.LookupValue;
     AParams.Custno       := frm.CustNo;    // wwcombCustomer.LookupValue;
     AParams.OrderNo      := frm.OrderNo;   // Trim(wwcombSalesOrd.LookupValue);
     AParams.DayProd_ID   := frm.DayProd_ID;
     AParams.WorkOrder_ID := 0;             // init value; unused
  end;

end;

function DoAppendSilentProd(const AOwner: TComponent;
 const AParams: TManualProdParams; var ANewDayProdID: Real ):Boolean;
var
  frm:TFrmProdManual;
begin
//not used the AOwner param.
  // Initialize
  ANewDayProdID := 0;

  if AParams.Standard_ID = 0 then
     raise Exception.Create('Application Error: Standard ID not provided.  ' +
      'Cannot insert records.');


  frm                     := TFrmProdManual.Create(uniGUIApplication.uniApplication);
  frm.Silent              := TRUE;
  frm.ProdDate            := AParams.ProdDate;
  frm.Shift               := AParams.Shift;
  frm.MfgCell             := AParams.MfgCell;
  frm.Standard_ID         := AParams.Standard_ID;
  frm.WorkOrder_ID        := AParams.WorkOrder_ID;
  frm.FSilentWorkorder_ID := AParams.WorkOrder_ID;
  frm.Arinvt_ID           := AParams.Arinvt_ID;

   // Select the "Manufacturing #" option
   frm.radioMfg.Checked := True;
   frm.radioWorkorderClick(frm.radioMfg);

   // Set the Standard ID
{ TODO -oLema : Need to find alternative for LookupValue,PerformSearch }
//     wwcombMfg.LookupValue:= SelectValueByID('mfgno', 'standard', AParams.Standard_ID);
//     wwcombMfg.PerformSearch;

   frm.wwQryMfg.Locate('standard_id', AParams.Standard_ID, []);

   // Set the Work center
   if AParams.Eqno > '' then
      begin
        //wwcombWorkCenter.LookupValue:= AParams.Eqno;
        //wwcombWorkCenter.PerformSearch;
        frm.Eqno:= AParams.Eqno;
      end;

   // Set the Customer
   if AParams.Custno > '' then
      begin
        //wwcombCustomer.LookupValue:= AParams.Custno;
        //wwcombCustomer.PerformSearch;
        frm.CustNo:= AParams.CustNo;
      end;

     // Sales Order
   if AParams.OrderNo > '' then
      begin
        // wwcombSalesOrd.LookupValue:= AParams.OrderNo;
        // wwcombSalesOrd.PerformSearch;
        frm.OrderNo:= AParams.OrderNo;
      end;

  // Create the production report
  frm.btnOKClick(NIL);
  Result:= frm.ModalResult = mrOk;

  // Return new DAYPROD.ID value
  if Result then
     ANewDayProdID := frm.DayProd_ID;

  Result:= ANewDayProdID > 0;

end;


procedure DoAppendSilentHist_Illum_RT(const AOwner: TComponent; const AParams: TManualProdParams; var AHist_Illum_RT_ID: Real );
var
  frm:TFrmProdManual;
begin
//not used the AOwner param.

  if AParams.Standard_ID = 0 then
     raise Exception.Create('Application Error: Standard ID not provided. Cannot insert records.');



  frm                     := TFrmProdManual.Create(uniGUIApplication.uniApplication);
  frm.Silent              := TRUE;
     // Assign property values
  frm.ProdDate            := AParams.ProdDate;
  frm.Shift               := AParams.Shift;
  frm.MfgCell             := AParams.MfgCell;
  frm.Standard_ID         := AParams.Standard_ID;
  frm.WorkOrder_ID        := AParams.WorkOrder_ID;
  frm.FSilentWorkorder_ID := AParams.WorkOrder_ID;
  frm.Arinvt_ID           := AParams.Arinvt_ID;


   // Select the "Manufacturing #" option
   frm.radioMfg.Checked := True;
   frm.radioWorkorderClick(frm.radioMfg);

   // Set the Standard ID
   // wwcombMfg.LookupValue:= SelectValueByID('mfgno', 'standard', AParams.Standard_ID);
   // wwcombMfg.PerformSearch;
   // wwQryMfg.Locate('standard_id', AParams.Standard_ID, []);
    frm.wwQryWorkCenter.Open();

   // Set the Work center
   if AParams.Eqno > '' then
      begin
        //wwcombWorkCenter.LookupValue:= AParams.Eqno;
        //wwcombWorkCenter.PerformSearch;
        frm.Eqno:= AParams.Eqno;
      end;

   // Set the Customer
   if AParams.Custno > '' then
      begin
        //wwcombCustomer.LookupValue:= AParams.Custno;
        //wwcombCustomer.PerformSearch;
        frm.CustNo:= AParams.CustNo;
      end;

   // Sales Order
   if AParams.OrderNo > '' then
      begin
        // wwcombSalesOrd.LookupValue:= AParams.OrderNo;
        // wwcombSalesOrd.PerformSearch;
        frm.OrderNo:= AParams.OrderNo;
      end;

    // Create hist_illum_rt and hist_illum_part
    frm.AddToHist_Illum_RT( AHist_Illum_RT_ID );
    frm.AddToHist_Illum_Part( AHist_Illum_RT_ID );

end;



{ TFrmProdManual }

procedure TFrmProdManual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmProdManual.FormShow(Sender: TObject);
begin
  { TODO -oLema : dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf( self );

  wwQryWorkorder.Close;
  wwQryMfg.Close;
  if not Silent then
     IQSetTablesActive( TRUE, self );

  // initial selection
//Lema: changed from nil to radioWorkorder
//  radioWorkorderClick( nil );
  radioWorkorderClick( radioWorkorder );

  radioWorkorder.Checked:= SR.Enabled[ 'radioWorkorder' ];

  if Division_ID > 0 then
     Caption:= Format(prod_rscstr.cTXT0000027 {'New Production [ %s ]'}, [ SelectValueFmtAsString('select name from division where id = %f', [Division_ID]) ]);

end;

procedure TFrmProdManual.SetProdDate( AValue: TDateTime );
begin
  FProdDate:= AValue;
  StatusBar1.Panels[ 0 ].Text:= Format( prod_rscstr.cTXT0000028 {'Prod Date: %s'}, [ DateToStr( FProdDate )]);
end;

procedure TFrmProdManual.SetShift( AValue: Integer );
begin
  FShift:= AValue;
  StatusBar1.Panels[ 1 ].Text:= Format(prod_rscstr.cTXT0000029 {'Shift: %d'}, [ FShift ]);
end;

procedure TFrmProdManual.SetMfgCell( AValue: string );
begin
  FMfgCell:= AValue;
  if AValue > '' then
     StatusBar1.Panels[ 2 ].Text:= Format(prod_rscstr.cTXT0000030 {'Cell: %s'}, [ FMfgCell ])
  else
     StatusBar1.Panels[ 2 ].Text:= '';
  Division_ID:= SelectValueFmtAsFloat('select division_id from mfgcell where RTrim(mfgcell) = ''%s''', [ FixStr(Trim( FMfgCell ))]);
end;

procedure TFrmProdManual.sbtnSearchMfgItemClick(Sender: TObject);
begin
  with PkMfg do
    if Execute then
    begin
{ TODO -oLema : Need to find alternative for LookupValue,PerformSearch }
//       wwcombMfg.LookupValue:= GetValue('MfgNo');
//       wwcombMfg.PerformSearch;
       wwQryMfg.Locate('standard_id', GetValue('ID'), []);
    end;
end;

procedure TFrmProdManual.sbtnSearchWoItemClick(Sender: TObject);
begin
  with PkWorOrder do
    if Execute then
    begin
{ TODO -oLema : Need to find alternative for LookupValue,PerformSearch }
//       wwcombWorkOrder.LookupValue:= GetValue('WORKORDER_ID');
//       wwcombWorkOrder.PerformSearch;
       wwQryWorkorder.Locate('standard_id', GetValue('WORKORDER_ID'), []);

{ TODO -oLema : Need to find alternative for LookupTable }
//    SyncOthersToWorkOrder( wwcombWorkOrder.LookupTable );
    end;
end;


procedure TFrmProdManual.radioWorkorderClick(Sender: TObject);
begin
  EnableControl( wwcombWorkOrder, Sender = radioWorkorder );
  EnableControl( wwcombMfg, Sender = radioMfg );
  EnableControl( sbtnSearchMfgItem, Sender = radioMfg );
  EnableControl( sbtnSearchWoItem, Sender = radioWorkorder );
  EnableControl( wwcombSalesOrd, Sender <> radioDownTime );
  EnableControl( sbtnSearchSalesOrder, Sender <> radioDownTime );
  EnableControl( wwcombCustomer, Sender <> radioDownTime );
  EnableControl( sbtnSearchCustomer, Sender <> radioDownTime );
end;

procedure TFrmProdManual.EnableControl( AControl:TControl; AValue: Boolean );
begin
  AControl.Enabled:= AValue and SR.Enabled[ AControl.Name ];
  if AControl is TUniDBLookupComboBox then with AControl as TUniDBLookupComboBox do
     Color:= cIIf( AControl.Enabled, clWindow, clBtnFace );
end;

procedure TFrmProdManual.sbtnSearchCustomerClick(Sender: TObject);
begin
  with PkArcusto do
    if Execute then
    begin
      //wwcombCustomer.LookupValue:= GetValue('custno');
      //wwcombCustomer.PerformSearch;
      CustNo:= GetValue('custno');
    end;
end;

procedure TFrmProdManual.sbtnSearchSalesOrderClick(Sender: TObject);
begin
  with PkOrders do
    if Execute then
      // wwcombSalesOrd.LookupValue:= Trim(GetValue('orderno'));
      OrderNo:= Trim(GetValue('orderno'));
end;

procedure TFrmProdManual.wwcombWorkOrderCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if Modified then
     SyncOthersToWorkOrder( LookupTable );
end;

procedure TFrmProdManual.btnOKClick(Sender: TObject);
begin
  Validate;
  Add;
  ModalResult:= mrOK;
end;

procedure TFrmProdManual.Validate;
begin
  Check( radioWorkorder.Checked or radioMfg.Checked or radioDownTime.Checked, prod_rscstr.cTXT0000048 ); // 'Report Production Based On' must be selected - operation aborted';

  {Standard ID}
  if radioWorkorder.Checked and not Silent then
  begin
     Check( wwcombWorkOrder.KeyValueStr > '', prod_rscstr.cTXT0000031 {'Work Order # is not assigned'} );
     Standard_ID:= wwQryWorkorder.FieldByName('standard_id').asFloat;
  end
  else if radioMfg.Checked and not Silent then
  begin
     Check( wwcombMfg.KeyValueStr > '', prod_rscstr.cTXT0000032 {'Manufacturing # is not assigned'} );
     Standard_ID:= wwQryMfg.FieldByName('standard_id').asFloat;
  end;
  if not radioDownTime.Checked and not Silent then
     Check( Standard_ID > 0, prod_rscstr.cTXT0000033 {'Manufacturing # is unavailable.'} );

  if not Silent then
      Check( wwcombWorkCenter.KeyValueStr > '', prod_rscstr.cTXT0000034 {'Work Center # is not assigned'} );
     Check( Eqno > '', prod_rscstr.cTXT0000034 {'Work Center # is not assigned'} );

  if not radioDownTime.Checked and not Silent then
     if wwcombCustomer.KeyValueStr = '' then
     if CustNo = '' then
        IQWarning(prod_rscstr.cTXT0000035 {'Customer is not assigned'})
end;

procedure TFrmProdManual.Check( OK: Boolean; const S: string );
begin
  if not OK then raise Exception.Create( S );
end;

procedure TFrmProdManual.Add;
var
  Hist_Illum_RT_ID: Real;
begin
  with FDManager.FindConnection('IQFD') do
  try
    StartTransaction;
    AssignWorkOrderID;

    AddToHist_Illum_RT( Hist_Illum_RT_ID );
    AddToHist_Illum_Part( Hist_Illum_RT_ID );

    AddToDayProd( FDayProd_ID, Hist_Illum_RT_ID );
    AddToDay_Part( FDayProd_ID, Hist_Illum_RT_ID );

    Commit;
  finally
    if InTransaction then
       RollBack;
  end;
end;

procedure TFrmProdManual.AssignWorkOrderID;
begin
  if Silent and (FSilentWorkorder_ID > 0) then
     FWorkOrder_ID := FSilentWorkorder_ID
  else if radioWorkorder.Checked then
     FWorkOrder_ID:= wwQryWorkorder.FieldByName('workorder_id').asFloat
  else if radioMfg.Checked then
     FWorkOrder_ID:= GetNextID('WORKORDER')
  else
     FWorkOrder_ID:= 0;
end;

procedure TFrmProdManual.AddToHist_Illum_RT( var AHist_Illum_RT_ID: Real );
var
  A: Variant;
  ASQL: String;
begin
  AHist_Illum_RT_ID:= GetNextID('ILLUM_RT');

  // 03/26/2009 Changed iqlib call from ExecuteCommandFmt to ExecuteCommandParamDataSet to
  // solve a 'missing right quote' error.  Reported by Lael in connection
  // with IQPRA. (Changed by Byron).
  // Get SQL, which contains the new ILLUM_RT.ID and the MFG Cell.  The
  // rest is populated by the dataset fields directly.
  ASQL := Format('insert into hist_illum_rt '#13 +
                 ' (id, mfgcell, work_center_id, eqno, cntr_rate, mfg_type, mfgno ) ' +
                 'values'#13 +
                 ' (%.0f, ''%s'', %.0f, ''%s'', :CNTR_RATE, :MFG_TYPE, ''DOWN-TIME'') ',
                 [ AHist_Illum_RT_ID,
                   IQMS.Common.StringUtils.FixStr(MfgCell),
                   Work_Center_ID,
                   IQMS.Common.StringUtils.FixStr(EqNo)]);
  ExecuteCommandParamDataSet(ASQL, wwQryWorkCenter);

{  ExecuteCommandFmt('insert into hist_illum_rt '+
            '(id, mfgcell, eqno, cntr_rate, mfg_type, mfgno, work_center_id) ' +
            'values( %f, ''%s'', ''%s'', %f, ''%s'', ''DOWN-TIME'', %f)',
            [ AHist_Illum_RT_ID,
              MfgCell,
              wwQryWorkCenter.FieldByName('eqno').asString,
              wwQryWorkCenter.FieldByName('cntr_rate').asFloat,
              wwQryWorkCenter.FieldByName('mfg_type').asString,
              wwQryWorkCenter.FieldByName('work_center_id').asFloat ]);  }

  if (Standard_ID > 0) and not radioDownTime.Checked then
  begin
    A:= SelectValueArrayFmt( 'select s.mfgno, s.mfg_type, s.operator, s.sets, s.cycle, s.cycletm, s.setuphrs, ' +
                        's.reuse, s.rg_dispo, s.regrind, s.sprue, s.shotwt, s.lbsk, s.uom, p.eqno, s.reuse_sprue ' +
                        'from standard s, pmeqmt p where s.id = %f and s.pmeqmt_id = p.id(+)             ' , [ Standard_ID ]);
    if VarArrayDimCount( A ) = 0 then
       raise Exception.CreateFmt(prod_rscstr.cTXT0000036 {'Could not find BOM (Standard ID = %f)'}, [ Standard_ID ]);

    ExecuteCommandFmt( 'update hist_illum_rt             ' +
               '   set mfgno          = ''%s'',  ' +
               '       mfgcell        = ''%s'',  ' +
               '       orderno        = ''%s'',  ' +
               '       mfg_type       = ''%s'',  ' +
               '       custno         = ''%s'',  ' +
               '       company        = ''%s'',  ' +
               '       operator       = %f,      ' +
               '       sets           = %f,      ' +
               '       cycle          = %f,      ' +
               '       cycletm        = %f,      ' +
               '       setuphrs       = %f,      ' +
               '       reuse          = ''%s'',  ' +
               '       rg_dispo       = ''%s'',  ' +
               '       standard_id    = %f,      ' +
               '       arcusto_id     = %s,      ' +
               '       regrind        = %f,      ' +
               '       sprue          = %.6f,    ' +
               '       shotwt         = %f,      ' +
               '       lbsk           = %f,      ' +
               '       setup_time     = sysdate, ' +
               '       setup_userid   = ''%s'',  ' +
               '       workorder_id   = %f,      ' +
               '       work_center_id = %f,      ' +
               '       uom            = ''%s'',  ' +
               '       tool_eqno      = ''%s'',  ' +
               '       reuse_sprue    = ''%s''   ' +
               'where id = %f                    ',
               [  FixStr(A[ 0 ]),                                                        // v_mfgno,
                  FixStr(MfgCell),                                                       // mfgcell
                  OrderNo,                                                               // Trim(wwcombSalesOrd.LookupValue), // v_orderno,
                  FixStr(A[ 1 ]),                                                        // v_mfg_type,
                  GetCustomerDataAsString('custno'),                                     // v_custno,
                  GetCustomerDataAsString('company'),                                    // v_company,
                  DtoF( A[ 2 ]),                                                         // v_operator,
                  DtoF( A[ 3 ]),                                                         // v_sets,
                  DtoF( A[ 4 ]),                                                         // v_cycle,
                  DtoF( A[ 5 ]),                                                         // v_cycletm,
                  DtoF( A[ 6 ]),                                                         // v_setuphrs,
                  A[ 7 ],                                                                // v_reuse,
                  A[ 8 ],                                                                // v_rg_dispo,
                  Standard_ID,                                                           // v_standard_id,
                  GetCustomerDataAsString('arcusto_id'),                                 // v_arcusto_id,
                  DtoF( A[ 9 ]),                                                         // v_regrind,
                  DtoF( A[10 ]),                                                         // v_sprue,
                  DtoF( A[11 ]),                                                         // v_shotwt,
                  DtoF( A[12 ]),                                                         // v_lbsk,
                  FixStr(SecurityManager.UserName),                                      // user
                  WorkOrder_ID,                                                          // v_workorder_id,
                  // wwQryWorkCenter.FieldByName('work_center_id').asFloat,
                  Work_Center_ID,                                                        // v_work_center_id,
                  FixStr(A[ 13 ]),                                                        // v_uom
                  FixStr(A[ 14 ]),                                                       // tool_eqno
                  A[ 15 ],                                                               // reuse_sprue
                  AHist_Illum_RT_ID ]);                                                  // hist_illum_rt_id
  end;
end;


function TFrmProdManual.GetCustomerDataAsString( AFieldName: string ): string;
begin
  // if Trim(wwcombCustomer.Text) = '' then
  if FSelectedArcusto_ID = 0 then
  begin
    if wwQryCustomer.FieldByName( AFieldName ).DataType <> ftString then
       Result:= 'NULL'
    else
       Result:= '';
     EXIT;
  end;

  if CompareText(AFieldName, 'arcusto_id') = 0 then
     Result:= FloatToStr(FSelectedArcusto_ID)
  else if CompareText(AFieldName, 'custno') = 0 then
     Result:= CustNo
  else if CompareText(AFieldName, 'company') = 0 then
     Result:= SelectValueByID('company', 'arcusto', FSelectedArcusto_ID );

  Result:= StrTran( Result, '''', '''''');
end;

procedure TFrmProdManual.AddToHist_Illum_Part( AHist_Illum_RT_ID: Real );
var
   AArinvtExists: Boolean;
begin
  // 04/29/2008 Added check for Arinvt_ID.  If an Arinvt_ID is provided,
  // then ensure that the record will exist in the nested query below.
  AArinvtExists := False;
  if (Trunc(Arinvt_ID) > 0) then
     AArinvtExists := SelectValueFmtAsFloat('select arinvt.id'#13 +
                                      '  from partno, arinvt'#13 +
                                      ' where partno.standard_id = %.0f'#13 +
                                      '   and partno.arinvt_id = arinvt.id'#13 +
                                      '   and arinvt.id = %.0f',
                                      [Standard_ID, Arinvt_ID]) > 0;
   ExecuteCommandFmt( 'insert into hist_illum_part         ' +
              '       (id, hist_illum_rt_id, class, itemno, rev, descrip, descrip2, stdcav, actcav, ptwt, partno_id, pt_cost, pt_price ) ' +
              'select s_illum_part.nextval,        ' +
              '       %f,                          ' +  // hist_illum_rt_id,
              '       arinvt.class,                ' +
              '       arinvt.itemno,               ' +
              '       arinvt.rev,                  ' +
              '       arinvt.descrip,              ' +
              '       arinvt.descrip2,             ' +
              '       partno.stdcav,               ' +
              '       partno.actcav,               ' +
              '       partno.ptwt,                 ' +
              '       partno.id,                   ' +
              '       arinvt.std_cost,             ' +
              '       arinvt.std_price             ' +
              '  from partno, arinvt               ' +
              ' where partno.standard_id = %f      ' +  // standard_id
              '   and partno.arinvt_id = arinvt.id ' +
              '   and (arinvt.id = %.0f and %d=1 or %d=0)',
              [ AHist_Illum_RT_ID,
                Standard_ID,
                Arinvt_ID,
                INTEGER(AArinvtExists),
                INTEGER(AArinvtExists)]);
end;

procedure TFrmProdManual.AddToDayProd( var ADayProd_ID: Real; AHist_Illum_RT_ID: Real );
var
  AStd_Cycle: Real;
  ACntr_Cost: Real;
begin
  ADayProd_ID:= GetNextID('xdayprod'); {note xdayprod!}

  AStd_Cycle:= SelectValueFmtAsFloat('select decode( mfg.lookup_mfgtype(mfg_type), ' +
    '''EXTRUSION'', cycletm*sets, ' +
    '''SLITTING'', decode(mfg.is_weight(mfg_type), 1, cycletm,  cycletm*sets), ' +
    'cycletm ) from hist_illum_rt where id = %f', [ AHist_Illum_RT_ID ]);

  ACntr_Cost:= SelectValueFmtAsFloat('select w.cntr_cost from work_center w, hist_illum_rt h where h.id = %f and h.work_center_id = w.id', [ AHist_Illum_RT_ID ]);

  ExecuteCommandFmt('insert into dayprod( id, hist_illum_rt_id, prod_date, shift, setup_hrs, reuse, regrind, rg_dispo, std_cycle, avg_cycle, cntr_cost, reuse_sprue ) '+
            'select %f, %f, to_date(''%s'', ''MM/DD/YYYY''), %d, setuphrs, reuse, regrind, rg_dispo, %f, %f, %f, reuse_sprue from hist_illum_rt where id = %f',
            [ ADayProd_ID,
              AHist_Illum_RT_ID,
              FormatDateTime( 'mm/dd/yyyy', ProdDate ),
              Shift,
              AStd_Cycle,
              AStd_Cycle,
              ACntr_Cost,
              AHist_Illum_RT_ID ]);

  //ExecuteCommandFmt('update dayprod set fg_lotno = (select fg_lotno from standard where id = %f) where id = %f', [ Standard_ID, ADayProd_ID ]);
  ExecuteCommandFmt(
    'update dayprod set fg_lotno = ' +
    'substr(bom_misc.get_fg_lotno_illum_rt(%.0f), 1, 60) ' +
    'where id = %.0f',
    [ AHist_Illum_RT_ID, ADayProd_ID ]);
end;

procedure TFrmProdManual.AddToDay_Part( ADayProd_ID, AHist_Illum_RT_ID: Real );
begin
  ExecuteCommandFmt('insert into day_part( dayprod_id, hist_illum_part_id, actcav ) ' +
            'select %f, id, actcav from hist_illum_part where hist_illum_rt_id = %f',
            [ ADayProd_ID, AHist_Illum_RT_ID ]);
end;


procedure TFrmProdManual.FormActivate(Sender: TObject);
begin
     IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmPROD_REP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmProdManual.AssignDivisionFilter(DataSet: TDataSet);
begin
  // IQAssignEPlantFilter( DataSet );
  // with DataSet do
  // begin
  //   if (Division_ID > 0) and Assigned(FindField( 'DIVISION_ID' )) then
  //   begin
  //     if Filter > ''  then
  //        Filter:= Format('%s and (DIVISION_ID <> NULL and DIVISION_ID = %.0f)', [ Filter, Division_ID ])
  //     else
  //        Filter:= Format('DIVISION_ID <> NULL and DIVISION_ID = %.0f', [ Division_ID ]);
  //   end;
  //   Filtered:= Filter > '';
  // end;

  with DataSet as TFDQuery do
    if Params.FindParam('division_id') <> nil then
       AssignQueryParamValue( DataSet, 'division_id', Division_ID);
end;

procedure TFrmProdManual.btnApplyClick(Sender: TObject);
var
  I: Integer;
begin
  Validate;
  Add;

  for I:= 0 to ComponentCount - 1 do
    if Components[ I ] is TUniDBLookupComboBox then with TUniDBLookupComboBox(Components[ I ]) do
    begin
{ TODO -oLema : Need to find alternative for LookupValue }
//      LookupValue:= '';
      Text:= '';
    end;

  ApplyClicked:= TRUE;
  IQConfirm(prod_rscstr.cTXT0000037 {'Posted successfully'});
end;

procedure TFrmProdManual.SyncOthersToWorkOrder( LookUpTable: TDataSet );
begin
  if wwcombWorkOrder.Text = '' then EXIT;

  //wwcombWorkCenter.LookupValue:= LookUpTable.FieldByName('eqno').asString;
  //wwcombWorkCenter.PerformSearch;
  Eqno:= SelectValueFmtAsString('select w.eqno from work_center w, cntr_sched c where c.workorder_id = %f and c.work_center_id = w.id', [ LookUpTable.FieldByName('workorder_id').asFloat ]);

  //wwcombCustomer.LookupValue:= LookUpTable.FieldByName('custno').asString;
  //wwcombCustomer.PerformSearch;
  CustNo:= SelectValueFmtAsString('select a.custno from workorder w, arcusto a where w.id = %f and w.arcusto_id = a.id', [ LookUpTable.FieldByName('workorder_id').asFloat ]);

  //wwcombSalesOrd.LookupValue:= SelectValueFmtAsString('select rtrim(r.orderno) from ptorder_rel r, ptorder p where p.workorder_id = %f and r.ptorder_id = p.id',
  //                                          [ LookUpTable.FieldByName('workorder_id').asFloat ]);
  // wwcombSalesOrd.PerformSearch; - don't performsearch - ptorder_rel may have manual orderno that is not in OE
  OrderNo:= SelectValueFmtAsString('select rtrim(r.orderno) from ptorder_rel r, ptorder p where p.workorder_id = %f and r.ptorder_id = p.id and rownum < 2',
                         [ LookUpTable.FieldByName('workorder_id').asFloat ]);
end;


procedure TFrmProdManual.sbtnSearchworkCenterClick(Sender: TObject);
begin
  with PkWorkCntr do
    if Execute then
    begin
      //wwcombWorkCenter.LookupValue:= GetValue('eqno');
      //wwcombWorkCenter.PerformSearch;
      Eqno:= GetValue('eqno');
    end;
end;

function TFrmProdManual.GetOrderNo: string;
begin
  Result:= Trim(wwcombSalesOrd.Text);
end;

function TFrmProdManual.GetPartnoID: Int64;
begin
  Result := SelectValueFmtAsInt64(
     'select id from partno where standard_id = %.0f and arinvt_id = %.0f',
     [FStandard_ID, FArinvt_ID]);
end;

procedure TFrmProdManual.SetOrderNo(const Value: string);
begin
  wwcombSalesOrd.Text:= Value;
end;

procedure TFrmProdManual.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmProdManual.Exit1Click(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

function TFrmProdManual.GetEqno: string;
begin
  Result:= Trim(wwcombWorkCenter.Text);
end;

procedure TFrmProdManual.SetEqno(const Value: string);
begin
{ TODO -oLema : Need to find alternative for LookupValue,PerformSearch }
//  wwcombWorkCenter.LookupValue:= Value;
  wwcombWorkCenter.Text:= Value;
//  if wwcombWorkCenter.Text > '' then
//     wwcombWorkCenter.PerformSearch;
end;

function TFrmProdManual.GetCustNo: string;
begin
  Result:= Trim(wwcombCustomer.Text);
end;

procedure TFrmProdManual.SetCustNo(const Value: string);
begin
  wwcombCustomer.Text:= Value;
  FSelectedArcusto_ID:= 0;
  if Value > '' then
     FSelectedArcusto_ID:= SelectValueFmtAsFloat('select id from arcusto where custno = ''%s''', [ FixStr( Value )]);
end;

function TFrmProdManual.GetWork_Center_ID: Real;
begin
  if EqNo > '' then
     Result:= SelectValueFmtAsFloat('select id from work_center where eqno = ''%s''', [FixStr(EqNo)])
  else
     Result:= 0;
end;



procedure TFrmProdManual.Panel4Resize(Sender: TUniControl; OldWidth, OldHeight: Integer);
begin
  // iqctrl.RefreshComponents([ wwcombWorkCenter, wwcombSalesOrd, wwcombCustomer ], 4, nil);
end;

procedure TFrmProdManual.Panel7Resize(Sender: TUniControl; OldWidth, OldHeight: Integer);
begin
 // iqctrl.RefreshComponents([ wwcombWorkOrder, wwcombMfg ], 28, nil);
end;

{ TManualProdParams }

constructor TManualProdParams.Create(AWorkorder_ID: Real);
begin
  ProdDate     := 0;
  Shift        := 0;
  MfgCell      := '';
  Standard_ID  := 0;
  Eqno         := '';
  Custno       := '';
  OrderNo      := '';
  DayProd_ID   := 0;
  WorkOrder_ID := AWorkorder_ID;
  Arinvt_ID    := 0;
end;

end.
