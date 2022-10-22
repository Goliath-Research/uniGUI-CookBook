unit ps_voided;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  IQMS.WebVcl.QueryNavigator,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  Vcl.Wwdatsrc,
  Data.DB,
  Mask,
  Vcl.Menus,
  IQMS.WebVcl.About,
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
  Vcl.Controls,
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
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.ExtCtrls;

type
  TFrmPSVoided = class(TUniForm)
    pnlHeaderTop: TUniPanel;
    Splitter1: TUniSplitter;
    pnlDetailClient: TUniPanel;
    pgctrlHeader: TUniPageControl;
    TabSheet1: TUniTabSheet;
    NavShipments: TIQWebQueryNavigator;
    spSearchShipments: TUniSpeedButton;
    SrcShipments: TDataSource;
    QryShipments: TFDQuery;
    QryShipmentsPACKSLIPNO: TStringField;
    QryShipmentsFOB: TStringField;
    QryShipmentsSHIPDATE: TDateTimeField;
    QryShipmentsPS_DATE: TDateTimeField;
    QryShipmentsARCUSTO_CUSTNO: TStringField;
    QryShipmentsARCUSTO_ADDR1: TStringField;
    QryShipmentsARCUSTO_ADDR2: TStringField;
    QryShipmentsARCUSTO_ADDR3: TStringField;
    QryShipmentsARCUSTO_CITY: TStringField;
    QryShipmentsARCUSTO_STATE: TStringField;
    QryShipmentsARCUSTO_COUNTRY: TStringField;
    QryShipmentsARCUSTO_ZIP: TStringField;
    QryShipmentsARCUSTO_EXT: TStringField;
    QryShipmentsARCUSTO_PRIME_CONTACT: TStringField;
    QryShipmentsSHIP_TO_ATTN: TStringField;
    QryShipmentsSHIP_TO_ADDR1: TStringField;
    QryShipmentsSHIP_TO_ADDR2: TStringField;
    QryShipmentsSHIP_TO_ADDR3: TStringField;
    QryShipmentsSHIP_TO_CITY: TStringField;
    QryShipmentsSHIP_TO_STATE: TStringField;
    QryShipmentsSHIP_TO_COUNTRY: TStringField;
    QryShipmentsSHIP_TO_ZIP: TStringField;
    QryShipmentsSHIP_TO_TAX_CODE_ID: TBCDField;
    QryShipmentsSHIP_TO_PHONE_NUMBER: TStringField;
    QryShipmentsSHIP_TO_EXT: TStringField;
    QryShipmentsSHIP_TO_FAX: TStringField;
    QryShipmentsSHIP_TO_PRIME_CONTACT: TStringField;
    QryShipmentsBILL_TO_ATTN: TStringField;
    QryShipmentsBILL_TO_ADDR1: TStringField;
    QryShipmentsBILL_TO_ADDR2: TStringField;
    QryShipmentsBILL_TO_ADDR3: TStringField;
    QryShipmentsBILL_TO_CITY: TStringField;
    QryShipmentsBILL_TO_STATE: TStringField;
    QryShipmentsBILL_TO_COUNTRY: TStringField;
    QryShipmentsBILL_TO_ZIP: TStringField;
    QryShipmentsBILL_TO_PHONE_NUMBER: TStringField;
    QryShipmentsBILL_TO_EXT: TStringField;
    QryShipmentsBILL_TO_FAX: TStringField;
    QryShipmentsBILL_TO_PRIME_CONTACT: TStringField;
    QryShipmentsTERMS_DESCRIP: TStringField;
    QryShipmentsTERMS_DAYS: TBCDField;
    QryShipmentsTERMS_DISCOUNT: TBCDField;
    QryShipmentsTERMS_DISCOUNT_DAYS: TBCDField;
    QryShipmentsARCUSTO_COMPANY: TStringField;
    QryShipmentsARCUSTO_PHONE_NUMBER: TStringField;
    QryShipmentsARCUSTO_FAX_NUMBER: TStringField;
    QryShipmentsPOOL_BILL_NUMBER: TStringField;
    QryShipmentsSHIP_VIA: TStringField;
    QryShipmentsSHIP_TO_SHIP_TIME: TBCDField;
    QryShipmentsCityStateZip: TStringField;
    QryShipmentsShipCityStateZip: TStringField;
    QryShipmentsBillCityStateZip: TStringField;
    QryShipmentsFREIGHT_DESCRIP: TStringField;
    QryShipmentsPRO_NO: TStringField;
    QryShipmentsSHIP_TIME: TDateTimeField;
    QryShipmentsEST_ARRIVAL: TDateTimeField;
    QryShipmentsCONVEYANCE_NO: TStringField;
    QryShipmentsBOX_CODE: TStringField;
    QryShipmentsTO_INVOICE: TStringField;
    QryShipmentsARCUSTO_ID: TBCDField;
    QryShipmentsUSERID: TStringField;
    QryShipmentsBOL_COMMENT1: TStringField;
    QryShipmentsSHIPMENT_TYPE: TStringField;
    QryShipmentsEPLANT_ID: TBCDField;
    QryShipmentsARCHIVED: TStringField;
    QryShipmentsEDI_CREATED: TStringField;
    QryShipmentsTRACKING_NUM: TStringField;
    QryShipmentsVMI: TStringField;
    QryShipmentsID: TBCDField;
    QryShipmentsPALLET_COUNT: TBCDField;
    QryShipmentsSHIP_TO_ID: TBCDField;
    QryShipmentsFREIGHT_ID: TBCDField;
    QryShipmentsPS_TICKET_ID: TBCDField;
    QryShipmentsAUTO_FREIGHT_PRICE: TBCDField;
    QryShipmentsNeedInventoryVerification: TStringField;
    QryShipmentsPS_TICKET_BATCH: TBCDField;
    QryShipmentsEPlant_Name: TStringField;
    QryShipmentsBILL_TO_ID: TBCDField;
    SrcShip_Dtl: TDataSource;
    QryShipDetail: TFDQuery;
    QryShipDetailORDERNO: TStringField;
    QryShipDetailItemNo: TStringField;
    QryShipDetailDescription: TStringField;
    QryShipDetailQTYSHIPPED: TBCDField;
    QryShipDetailBACKORDER_QTY: TBCDField;
    QryShipDetailINVOICED_QTY: TBCDField;
    QryShipDetailORD_INVOICED_QTY: TBCDField;
    QryShipDetailSHIPMENT_TYPE: TStringField;
    QryShipDetailUOM: TStringField;
    QryShipDetailCRM_QUOTE_RFQ: TStringField;
    QryShipDetailRAN: TStringField;
    QryShipDetailextDescrip: TStringField;
    QryShipDetailClass: TStringField;
    QryShipDetailRev: TStringField;
    QryShipDetailAKA_ItemNo: TStringField;
    QryShipDetailAKA_Descrip: TStringField;
    QryShipDetailAKA_Rev: TStringField;
    QryShipDetailAKA_Descrip2: TStringField;
    QryShipDetailOrder_id: TFloatField;
    QryShipDetailID: TBCDField;
    QryShipDetailSHIPMENTS_ID: TBCDField;
    QryShipDetailORDER_DTL_ID: TBCDField;
    QryShipDetailArinvt_ID: TFloatField;
    QryShipDetailCalc_Arinvt_ID: TFloatField;
    QryShipDetailCMTLINE: TStringField;
    QryShipDetailORD_DETAIL_CMTLINE: TStringField;
    QryShipDetailCRM_QUOTE_ID: TBCDField;
    QryShipDetailCRM_QUOTE_DESCRIP: TStringField;
    QryShipDetailPONO: TStringField;
    PkShipments: TIQWebHPick;
    PkShipmentsARCUSTO_COMPANY: TStringField;
    PkShipmentsARCUSTO_PRIME_CONTACT: TStringField;
    PkShipmentsARCUSTO_ADDR1: TStringField;
    PkShipmentsARCUSTO_CITY: TStringField;
    PkShipmentsARCUSTO_STATE: TStringField;
    PkShipmentsARCUSTO_ZIP: TStringField;
    PkShipmentsARCUSTO_COUNTRY: TStringField;
    PkShipmentsSHIPDATE: TDateTimeField;
    PkShipmentsPS_DATE: TDateTimeField;
    PkShipmentsID: TBCDField;
    PkShipmentsEPLANT_ID: TBCDField;
    PkShipmentsPACKSLIPNO: TStringField;
    PkShipmentsARCHIVED: TStringField;
    PkShipmentsPS_TICKET_ID: TBCDField;
    PkShipmentsPS_TICKET_BATCH: TBCDField;
    PkShipmentsSHIP_TO_PRIME_CONTACT: TStringField;
    PkShipmentsSHIP_TO_ATTN: TStringField;
    PkShipmentsSHIP_TO_ADDR1: TStringField;
    PkShipmentsSHIP_TO_CITY: TStringField;
    PkShipmentsSHIP_TO_STATE: TStringField;
    PkShipmentsSHIP_TO_ZIP: TStringField;
    PkShipmentsSHIP_TO_COUNTRY: TStringField;
    PkShipmentsPONO: TStringField;
    GroupBox1: TUniGroupBox;
    Splitter4: TUniSplitter;
    Splitter8: TUniSplitter;
    Panel3: TUniPanel;
    Splitter5: TUniSplitter;
    Panel14: TUniPanel;
    dbeCustomer: TUniDBEdit;
    dbeShipTo: TUniDBEdit;
    dbeBillTo: TUniDBEdit;
    dbePlantName: TUniDBEdit;
    dbePSDate: TUniDBEdit;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    lblEPlantName: TUniLabel;
    Label6: TUniLabel;
    PnlLeft04: TUniPanel;
    Splitter6: TUniSplitter;
    PnlLeft02: TUniPanel;
    Label4: TUniLabel;
    Label10: TUniLabel;
    Label5: TUniLabel;
    Label9: TUniLabel;
    Label13: TUniLabel;
    Panel17: TUniPanel;
    dbDays: TUniDBEdit;
    dbePalletCount: TUniDBEdit;
    DBCheckBoxInvVerification: TUniDBCheckBox;
    PnlLeft05: TUniPanel;
    Splitter7: TUniSplitter;
    PnlLeft03: TUniPanel;
    Label14: TUniLabel;
    Label7: TUniLabel;
    Label11: TUniLabel;
    lblBOLNote: TUniLabel;
    lblPoolBillNo: TUniLabel;
    lblBatch: TUniLabel;
    Panel19: TUniPanel;
    dbFChg: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    dbeTracking: TUniDBEdit;
    DBMemoBOL: TUniEdit;
    DBMemo1: TUniEdit;
    dbeBatch: TUniDBEdit;
    QryShipmentsShipVia: TStringField;
    dbeShipVia: TUniDBEdit;
    PkShipmentsVOID_DATE: TDateTimeField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel7: TUniPanel;
    PnlLegend: TUniPanel;
    Shape1: TUniPanel;
    Shape2: TUniPanel;
    Shape3: TUniPanel;
    Shape4: TUniPanel;
    Shape5: TUniPanel;
    GridShipDetails: TIQUniGridControl;
    dbeFob: TUniDBEdit;
    Label8: TUniLabel;
    dbeVoidDate: TUniDBEdit;
    QryShipmentsVOID_DATE: TDateTimeField;
    dbeShipDate: TUniDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryShipmentsCalcFields(DataSet: TDataSet);
    procedure QryShipmentsBeforeOpen(DataSet: TDataSet);
    procedure QryShipDetailCalcFields(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure spSearchShipmentsClick(Sender: TObject);
{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
    procedure GridShipDetailsCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);    }
    procedure SrcShipmentsDataChange(Sender: TObject; Field: TField);
    procedure DBMemoBOLCustomDlg(Sender: TObject);
    procedure DBMemo1CustomDlg(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure EnsureDataSetsOpen;
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.EditMemoStr,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  packslip_rscstr;

class procedure TFrmPSVoided.DoShow;
var
  LFrmPSVoided : TFrmPSVoided;
begin
  LFrmPSVoided := TFrmPSVoided.Create(UniGUIApplication.UniApplication);
  LFrmPSVoided.Show;
end;

procedure TFrmPSVoided.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, pnlHeaderTop]);
end;

procedure TFrmPSVoided.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, pnlHeaderTop]);
  Application.OnShowHint := nil;
end;

procedure TFrmPSVoided.QryShipmentsCalcFields(DataSet: TDataSet);
begin
  if QryShipmentsFREIGHT_ID.AsLargeInt > 0 then
    QryShipmentsShipVia.AsString := SelectValueByID('descrip', 'freight',
      QryShipmentsFREIGHT_ID.AsFloat);

  QryShipmentsCityStateZip.AsString :=
    Trim(Trim(QryShipmentsARCUSTO_CITY.AsString) + ', ' +
    Trim(Trim(QryShipmentsARCUSTO_STATE.AsString) + ' ' +
    Trim(QryShipmentsARCUSTO_ZIP.AsString)));

  QryShipmentsBillCityStateZip.AsString :=
    Trim(Trim(QryShipmentsBILL_TO_CITY.AsString) + ', ' +
    Trim(Trim(QryShipmentsBILL_TO_STATE.AsString) + ' ' +
    Trim(QryShipmentsBILL_TO_ZIP.AsString)));

  QryShipmentsShipCityStateZip.AsString :=
    Trim(Trim(QryShipmentsSHIP_TO_CITY.AsString) + ', ' +
    Trim(Trim(QryShipmentsSHIP_TO_STATE.AsString) + ' ' +
    Trim(QryShipmentsSHIP_TO_ZIP.AsString)));

  QryShipmentsNeedInventoryVerification.AsString := 'N';
  if SelectValueFmtAsString(
    'select ''Y'' from shipment_dtl d, fgmulti f ' +
    ' where d.shipments_id = %f and d.id = f.shipment_dtl_id_in_transit ' +
    '   and f.in_transit_origin = 3 and nvl(f.onhand,0) <> 0 and rownum < 2',
    [QryShipmentsID.AsFloat]) = 'Y' then
    QryShipmentsNeedInventoryVerification.AsString := 'Y';

  if QryShipmentsEPLANT_ID.AsFloat > 0 then
    QryShipmentsEPlant_Name.AsString := SelectValueByID('name', 'eplant',
      QryShipmentsEPLANT_ID.AsFloat)
end;

procedure TFrmPSVoided.QryShipmentsBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', NavShipments.MainID);
  AssignQueryParamValue(DataSet, 'scope_batch', NavShipments.ScopeBatch);
  AssignQueryParamValue(DataSet, 'cust_count',
    SelectValueAsInteger(
    'select count(*) from s_user_crm_customers ' +
    'where user_name = misc.GetUserName and rownum < 2'));
end;

procedure TFrmPSVoided.QryShipDetailCalcFields(DataSet: TDataSet);
var
  nArInvtId: Real;
  A: Variant;
begin
  A := SelectValueArrayFmt(
    'select v.orders_id,                                                            '#13 +
    '       v.arinvt_id,                                                            '#13 +
    '       decode( v.arinvt_id, NULL, RTrim(v.misc_item), rtrim( v.descrip  )),    '#13 +
    '       decode( v.arinvt_id, NULL, NULL,               rtrim( v.descrip2 )),    '#13 +
    '       decode( v.arinvt_id, NULL, rtrim(v.misc_itemno), rtrim( v.itemno )),    '#13 +
    '       decode( v.arinvt_id, NULL, NULL,               rtrim( v.rev ))     ,    '#13 +
    '       decode( v.arinvt_id, NULL, NULL,               rtrim( v.class ))   ,    '#13 +
    '       decode( v.arinvt_id, NULL, NULL,               rtrim( v.cust_itemno )), '#13 +
    '       decode( v.arinvt_id, NULL, NULL,             rtrim( v.cust_descrip )),  '#13 +
    '       decode( v.arinvt_id, NULL, NULL,             rtrim( v.cust_rev )),      '#13 +
    '       decode( v.arinvt_id, NULL, NULL,             rtrim( v.cust_descrip2 ))  '#13 +
    '  from                                                                         '#13 +
    '       v_ord_comb3 v                                                           '#13 +
    ' where v.ord_detail_id = %f                                                    ',
    [QryShipDetailORDER_DTL_ID.AsFloat]);

  if VarArrayDimCount(A) > 0 then
  begin
    QryShipDetailOrder_id.AsLargeInt := A[0];
    QryShipDetailArinvt_ID.AsLargeInt := A[1]; //same
    QryShipDetailCalc_Arinvt_ID.AsLargeInt := A[1]; //same
    QryShipDetailDescription.AsString := A[2];
    QryShipDetailextDescrip.AsString := A[3];
    QryShipDetailItemNo.AsString := A[4];
    QryShipDetailRev.AsString := A[5];
    QryShipDetailClass.AsString := A[6];
    QryShipDetailAKA_ItemNo.AsString := A[7];
    QryShipDetailAKA_Descrip.AsString := A[8];
    QryShipDetailAKA_Rev.AsString := A[9];
    QryShipDetailAKA_Descrip2.AsString := A[10];
  end;

end;

procedure TFrmPSVoided.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPSVoided.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmPSVoided.spSearchShipmentsClick(Sender: TObject);
var
  AID: Int64;
begin
  with PkShipments do
    if Execute then
    begin
      AID := System.Variants.VarAsType(GetValue('ID'), varUInt64);
      if AID > 0 then
        NavShipments.MainID := AID;
      EnsureDataSetsOpen;
    end
    else
      System.SysUtils.Abort;
end;

procedure TFrmPSVoided.EnsureDataSetsOpen;
begin
  {datasets are closed on form creation having Tag = 1. Open it after the picklist}
  QryShipments.Open;
  QryShipDetail.Open;
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmPSVoided.GridShipDetailsCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then
    EXIT;

  with TIQUniGridControl(Sender).DataSource.DataSet, TIQUniGridControl(Sender).Canvas do
  begin
    if FieldByName('QTYSHIPPED').AsFloat = FieldByName('INVOICED_QTY').AsFloat then
    begin
      ABrush.Color := clLime;
      AFont.Color := clBlack;
    end;
    if FieldByName('INVOICED_QTY').AsFloat = 0 then
    begin
      ABrush.Color := clPurple;
      AFont.Color := clWhite;
    end;
    if (FieldByName('INVOICED_QTY').AsFloat <> 0) and
      (FieldByName('INVOICED_QTY').AsFloat < FieldByName('QTYSHIPPED').AsFloat) then
    begin
      ABrush.Color := clYellow;
      AFont.Color := clBlack;
    end;
    if FieldByName('INVOICED_QTY').AsFloat > FieldByName('QTYSHIPPED').AsFloat then
    begin
      ABrush.Color := clRed;
      AFont.Color := clBlack;
    end;
    if FieldByName('QTYSHIPPED').AsFloat < 0 then
    begin
      ABrush.Color := clTeal;
      AFont.Color := clBlack;
    end;
  end;
end;   }

procedure TFrmPSVoided.SrcShipmentsDataChange(Sender: TObject;
  Field: TField);
begin
  if Assigned(QryShipments) and (QryShipments.State <> dsInactive) then
    // packslip_rscstr.cTXT0000048 = 'Voided Packing Slip # %s'
    GroupBox1.Caption := Format(
      ' ' + packslip_rscstr.cTXT0000048 + ' ',
      [Trim(QryShipmentsPACKSLIPNO.AsString)]);
end;

procedure TFrmPSVoided.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);

  pgctrlHeader.ActivePageIndex := 0;

  try
{ TODO -oGPatil -cWebConvert : Formowner must be UniApplication
    spSearchShipmentsClick(nil);   }
  except
    on E: EAbort do
      PostMessage(Handle, wm_Command, Exit1.Command, 0); { Call "Exit" }
  end;
end;

procedure TFrmPSVoided.DBMemoBOLCustomDlg(Sender: TObject);
var
  S: string;
begin
  if QryShipmentsID.AsLargeInt > 0 then
  begin
    S := QryShipmentsBOL_COMMENT1.AsString;
    IQMS.Common.EditMemoStr.DoViewMemoStr(S, lblBOLNote.Caption);
  end;
end;

procedure TFrmPSVoided.DBMemo1CustomDlg(Sender: TObject);
var
  S: string;
begin
  if QryShipmentsID.AsLargeInt > 0 then
  begin
    S := QryShipmentsPOOL_BILL_NUMBER.AsString;
    IQMS.Common.EditMemoStr.DoViewMemoStr(S, lblPoolBillNo.Caption)
  end;
end;

end.
