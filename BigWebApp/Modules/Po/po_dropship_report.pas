unit po_dropship_report;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  po_share,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniComboBox, uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmPODropShipReport = class(TUniForm)
    Panel1: TUniPanel;
    Bevel1: TUniPanel;
    wwQryTransCode: TFDQuery;
    wwQryTransCodeCODE: TStringField;
    wwQryTransCodeDESCRIP: TStringField;
    wwQryTransCodeID: TBCDField;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label6: TUniLabel;
    edQty: TUniEdit;
    tpShipmentDate: TUniDBDateTimePicker;
    wwComboTransCode: TUniDBLookupComboBox;
    Label3: TUniLabel;
    edLot: TUniEdit;
    lblRecvcDate: TUniLabel;
    tpRecvDate: TUniDBDateTimePicker;
    chkBackflush: TUniCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  private
    FPO_Detail_ID : Real;
    FPO_ID        : Real;
    FVendor_ID    : Real;
    FFGMulti_ID   : Real;
    FArinvt_ID    : Real;
    FStandard_ID  : Real;
    FOrd_Detail_ID: Real;
    FQty          : Real;
    FPO_UOM       : string;
    FSO_UOM       : string;
    FIsOutSource  : Boolean;
    procedure SetPO_Detail_ID(const Value: Real);

  protected
    procedure Validate; virtual;
    { TODO -ohphadke : Dependency
    //procedure Receive;
    procedure CreatePS;   }
    procedure InitVars; virtual;
  public
    { Public declarations }
    class function DoShowModal( APO_Detail_ID: Real ): Boolean;
    property PO_Detail_ID: Real read FPO_Detail_ID write SetPO_Detail_ID;
  end;

  TFrmPODropShipReportSilent = class(TFrmPODropShipReport)
  private
    FParams: TPODropShipRec;
    procedure SetParams(const Value: TPODropShipRec);
  public
    class procedure DoExecute( AParams: TPODropShipRec );
    property Params: TPODropShipRec read FParams write SetParams;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.Dispo,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.UOM;
  { TODO -ohphadke : Dependency
  RecMain;PS_Man }


{ TFrmPODropShipReport }

class function TFrmPODropShipReport.DoShowModal(APO_Detail_ID: Real): Boolean;
Var
  LFrmPODropShipReport : TFrmPODropShipReport;
begin
  LFrmPODropShipReport := TFrmPODropShipReport.create(UniGUIApplication.UniApplication);
  with LFrmPODropShipReport do
  begin
    FPO_Detail_ID := APO_Detail_ID;
    Result:= ShowModal = mrOK;
  end;
end;


procedure TFrmPODropShipReport.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, PnlLeft01 ]);
end;

procedure TFrmPODropShipReport.btnOKClick(Sender: TObject);
var
  ADB: TFDConnection;
begin
  Validate;
  InitVars;

  ADB:= TFDConnection(FDManager.FindConnection('IQFD'));
  ADB.StartTransaction;
  try
    //Receive;
    //CreatePS;
    ADB.Commit;
  finally
    if ADB.InTransaction then
       ADB.RollBack;
  end;
  ModalResult:= mrOK;
end;

procedure TFrmPODropShipReport.Validate;
begin
  StrToFloat( edQty.Text );
  StrToDate( tpShipmentDate.Text );
  StrToDate( tpRecvDate.Text );
end;


procedure TFrmPODropShipReport.InitVars;
begin
  FQty          := StrToFloat( edQty.Text );
  FStandard_ID  := SelectValueByID('standard_id', 'arinvt', FArinvt_ID );
  FOrd_Detail_ID:= SelectValueByID('drop_ship_ord_detail_id', 'po_detail', FPO_Detail_ID);
  FFGMulti_ID   := GetAutoDispoFGMultiID( FArinvt_ID,          {IQMS.Common.Dispo.pas}
                                          FStandard_ID,
                                          'TEMPORARY',         // DefaultLocation,
                                          edLot.Text,          // ALot,
                                          0,                   // AWork_Center_ID,
                                          0,                   // FDivision_ID
                                          0,                   // AWorkorder_ID
                                          FOrd_Detail_ID );    // AOrd_Detail_ID

  FPO_UOM       := SelectValueByID('unit', 'po_detail', FPO_Detail_ID);
  FSO_UOM       := SelectValueByID('unit', 'ord_detail', FOrd_Detail_ID);
  FIsOutSource  := SelectValueByID('is_outsource_dropship', 'standard', FStandard_ID ) = 'Y';
end;

{ TODO -ohphadke : Dependency }
{procedure TFrmPODropShipReport.Receive;
var
  APO_Receipt_ID: Real;
  AForceOrigin: string; }

//begin
  //with TFrmReceive.CreateSilent( self ) do       {RecMain.pas}
  //try
    {receive}
    //FAllowDropShipReceiving:= TRUE;
    //AForceOrigin:= IIf( FIsOutSource, 'FROM_PO', 'FROM_RF');  // this will allow tran dialog for outsource items

    {APO_Receipt_ID:= ExecuteSilent( VarArrayOf([ FVendor_ID,                 // AVendor_ID
                                                 FPO_ID,                     // APO_ID
                                                 FPO_Detail_ID,              // APO_Detail_ID
                                                 FFGMulti_ID,                // AFGMulti_ID
                                                 FQty,                       // AQty,
                                                 tpRecvDate.Date,            // Recv ADate
                                                 TRUE,                       // AAllowMakeToOrderTrans,
                                                 wwComboTransCode.Text,      // TransCode
                                                 AForceOrigin,               // 'FROM_RF' will keep in silent, 'FROM_PO' will popup trandlg form
                                                 '',                         // ExistSerial
                                                 0,                          // Po_Releases_Id
                                                 BoolToNum( chkBackflush.Checked )]));  // ForceMaterialBackflush  -1-N/A  0-DoNotBackflush 1-Backflush
  finally
    Free;
  end;
end; }


procedure TFrmPODropShipReport.SetPO_Detail_ID(const Value: Real);
begin
  FPO_Detail_ID := Value;
end;

procedure TFrmPODropShipReport.UniFormShow(Sender: TObject);
begin
  //FPO_Detail_ID:= APO_Detail_ID;
  FPO_ID       := SelectValueByID('po_id', 'po_detail', FPO_Detail_ID);
  FVendor_ID   := SelectValueByID('vendor_id', 'po', FPO_ID);
  FArinvt_ID   := SelectValueByID('arinvt_id', 'po_detail', FPO_Detail_ID);

  chkBackflush.Checked:= SelectValueFmtAsString('select backflush from arinvt where id = %f', [ FArinvt_ID ]) = 'Y';

  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self, PnlLeft01 ]);
  tpShipmentDate.DateTime:= Date;
  tpRecvDate.DateTime:= Date;

end;

{ TODO -ohphadke : Dependency
procedure TFrmPODropShipReport.CreatePS;
var
  RF_PackSlip_Manager: TRF_PackSlip_Manager;
begin
  RF_PackSlip_Manager:= TRF_PackSlip_Manager.Create;  {PS_Man.pas}
  {with RF_PackSlip_Manager do
  try
    FShipmentDate:= Trunc(tpShipmentDate.DateTime);

    Add( FOrd_Detail_ID,                     { AOrder_Dtl_ID    }
         //0,                                  { AMaster_Label_ID }
         //FFGMulti_ID,                        { AFGMulti_ID      }
         //IQConvertUom( FQty, FPO_UOM, FSO_UOM, FArinvt_ID ),  {translate po qty to so qty, IQMS.Common.UOM.pas}
         //[0,                                 { AVolume - future use }
          //0,                                 { AWeight - future use }
         // 'Drop Ship Reporting',             { comment line - goes to shipment_dtl}
         // 0,                                 { releases_id - goes into shipment_dtl.ps_ticket_releases_id }
         // 0 ]);                              { ps_ticket_dtl_id - goes into shipment_dtl.ps_ticket_dtl_id. Used in IQRF to update shipment_dtl_id in Master_Label}

 {   RemoteProcessPackingSlip;
  finally
    RF_PackSlip_Manager.Free;
  end;
end;  }


//  TPODropShipParams = record
//     PO_Detail_ID: Real;
//     Qty: Real;
//     Trans_Code_ID: Real;
//     ShipDate: TDateTime;
//     RecvDate: TDateTime;
//     LotNo: string;

 { TFrmPODropShipReportSilent }

class procedure TFrmPODropShipReportSilent.DoExecute(AParams: TPODropShipRec);
begin
  with TFrmPODropShipReportSilent.Create( UniguiApplication.UniApplication ) do
  begin
    Params :=AParams;
    edQty.Text           := FloatToStr( AParams.Qty );
    wwComboTransCode.Text:= SelectValueByID( 'code', 'trans_code', AParams.Trans_Code_ID );
    tpShipmentDate.DateTime  := AParams.ShipDate;
    tpRecvDate.DateTime      := AParams.RecvDate;
    edLot.Text           := AParams.LotNo;
    btnOK.Click;

  end;
end;



procedure TFrmPODropShipReportSilent.SetParams(const Value: TPODropShipRec);
begin
  FParams := Value;
end;

end.










