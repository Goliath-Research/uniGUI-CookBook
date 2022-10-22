unit CustCredit;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
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
  uniEdit,
  uniDBEdit,
  uniCheckBox,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniMainMenu;

type
  TFrmCustCreditLimit = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    Calculate1: TUniMenuItem;
    Src: TDataSource;
    Qry: TFDQuery;
    PnlBottom: TUniPanel;
    BtnCalc: TUniButton;
    SrcArcusto: TDataSource;
    QryArcusto: TFDQuery;
    QryArcustoID: TBCDField;
    QryArcustoSTATUS_ID: TStringField;
    UpdateSQL1: TFDUpdateSQL;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    PnlLeft02: TUniPanel;
    Splitter2: TUniSplitter;
    PnlClient03: TUniPanel;
    cbPackSlip: TUniCheckBox;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    edDays: TUniDBNumberEdit;
    cbSO: TUniCheckBox;
    cbAutoCalc: TUniCheckBox;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    DBCurrent: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBTotal: TUniDBEdit;
    PnlCustStatus: TUniPanel;
    GroupBox2: TUniGroupBox;
    dbcStatus: TUniDBComboBox;
    Nav: TUniDBNavigator;
    Contents1: TUniMenuItem;
    cbAutoUpd: TUniCheckBox;
    Label6: TUniLabel;
    wwDBPastDue: TUniDBComboBox;
    QryCURRANT: TFMTBCDField;
    QryOPENTOBY: TFMTBCDField;
    QryCREDITLIMIT: TFMTBCDField;
    QryTOTAL: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbSOClick(Sender: TObject);
    procedure BtnCalcClick(Sender: TObject);
    procedure QryArcustoAfterPost(DataSet: TDataSet);
    procedure cbAutoCalcClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure cbAutoUpdClick(Sender: TObject);
    procedure wwDBPastDueCloseUp(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArcusto_id:Real;
    FCurrent:Real;
    FCreditLimit:Real;
    FOpenToBuy:Real;
    FTotalToPay:Real;
    procedure RefreshQry;
    procedure SetArcusto_id(const Value: Real);
    procedure SetCreditLimit(const Value: Real);
    procedure SetCurrent(const Value: Real);
    procedure SetTotalToPay(const Value: Real);
  public
    { Public declarations }
    property Arcusto_id : Real write SetArcusto_id;
    property Current : Real write SetCurrent;
    property CreditLimit : Real write SetCreditLimit;
    property TotalToPay : Real write SetTotalToPay;
  end;

procedure DoCustCreditLimit(AArcusto_id, ACurrent, ACreditLimit, ATotalToPay:Real);

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas file
  IQSecIns; }

{$R *.dfm}

procedure DoCustCreditLimit(AArcusto_id, ACurrent, ACreditLimit, ATotalToPay:Real);
var
  LFrmCustCreditLimit : TFrmCustCreditLimit;
begin
  LFrmCustCreditLimit := TFrmCustCreditLimit.Create(UniGUIApplication.UniApplication);
  LFrmCustCreditLimit.Arcusto_id := AArcusto_id;
  LFrmCustCreditLimit.Current := ACurrent;
  LFrmCustCreditLimit.CreditLimit := ACreditLimit;
  LFrmCustCreditLimit.TotalToPay := ATotalToPay;
  LFrmCustCreditLimit.ShowModal;
end;

procedure TFrmCustCreditLimit.RefreshQry;
begin
  Qry.Close;
  Qry.ParamByName('ACurrent').Value := FCurrent;
  Qry.ParamByName('AOpen').Value := FOpenToBuy;
  Qry.ParamByName('ALimit').Value := FCreditLimit;
  Qry.ParamByName('ATotal').Value := FTotalToPay;
  Qry.Open;
end;



procedure TFrmCustCreditLimit.SetArcusto_id(const Value: Real);
begin
  FArcusto_id := Value;
end;

procedure TFrmCustCreditLimit.SetCreditLimit(const Value: Real);
begin
  FCreditLimit := Value;
end;

procedure TFrmCustCreditLimit.SetCurrent(const Value: Real);
begin
  FCurrent := Value;
end;

procedure TFrmCustCreditLimit.SetTotalToPay(const Value: Real);
begin
  FTotalToPay := Value;
end;

procedure TFrmCustCreditLimit.UniFormCreate(Sender: TObject);
var
  aValue:String;
begin
  IQRegFormRead( self, [ self]);
  FCurrent := 0;
  FOpenToBuy := 0;
//  FOpenToBuy := FCreditLimit - FCreditLimit;
  eddays.text := IntToStr(Trunc(SelectValueFmtAsFloat('select CUST_CREDIT_DAYS from arcusto where id = %f', [FArcusto_id])));
  cbPackSlip.checked := SelectValueFmtAsString('select NVL(CUST_CREDIT_INCL_SHIP, ''N'') from arcusto where id = %f', [FArcusto_id]) = 'Y';
  cbAutoCalc.checked := SelectValueFmtAsString('select NVL(CREDIT_LIMIT_AUTOCALC, ''N'') from arcusto where id = %f', [FArcusto_id]) = 'Y';
  cbAutoUpd.checked := SelectValueFmtAsString('select NVL(CREDIT_LIMIT_AUTO_UPDATE, ''N'') from arcusto where id = %f', [FArcusto_id]) = 'Y';
  cbSO.checked := SelectValueFmtAsString('select NVL(CUST_CREDIT_INCL_SO, ''N'') from arcusto where id = %f', [FArcusto_id]) = 'Y';

  aValue := SelectValueFmtAsString('select CREDIT_LIMIT_PAST_DUE_DAYS from arcusto where id = %f', [FArcusto_id]);
  if AValue = '' then
    AValue := '0';
{ TODO -oGPatil -cWebConvert : TUniDBComboBox does not contain a member named Value
  wwDBPastDue.Value := AValue;  }

  wwDBPastDue.Visible := cbAutoUpd.checked;
  Label6.Visible := cbAutoUpd.checked;

  RefreshQry;
  QryArcusto.Close;
  QryArcusto.ParamByName('AId').Value := FArcusto_id;
  QryArcusto.Open;
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlLeft01);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, GroupBox1);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient03);
end;

procedure TFrmCustCreditLimit.wwDBPastDueCloseUp(Sender: TObject);
var
  aValue:String;
begin
{ TODO -oGPatil -cWebConvert : TUniDBComboBox does not contain a member named Value
  aValue := wwDBPastDue.Value;  }
  if AValue <> '' then
    ExecuteCommandFmt('update arcusto set CREDIT_LIMIT_PAST_DUE_DAYS = %s where id = %f', [AValue, FArcusto_id]);
end;

procedure TFrmCustCreditLimit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self]);
end;

procedure TFrmCustCreditLimit.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCustCreditLimit.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmCustCreditLimit.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas File
  EnsureSecurityInspectorOnTopOf( self );   }
end;

procedure TFrmCustCreditLimit.cbSOClick(Sender: TObject);
begin
  edDays.Enabled := cbSO.checked;
end;

procedure TFrmCustCreditLimit.BtnCalcClick(Sender: TObject);
var
  APackSlips, AReleases:Real;
  ANotInvoiced:Real;
  ACurrent:Real;
  ANotInvoiced2:Real;
  ANotInvoiced3:Real;
  APackSlips2:Real;
  APackSlips3:Real;
begin
  APackSlips := 0;
  ANotInvoiced := 0;

  APackSlips2 := 0;
  APackSlips3 := 0;
  ANotInvoiced2 := 0;
  ANotInvoiced3 := 0;

  if cbPackSlip.checked then
  begin


    APackSlips3 := SelectValueFmtAsFloat('select Sum(NVL(v.qtyshipped, 0) * NVL(v.unit_price, 0)) ' +
                            '  from v_shipments_short v,                             ' +
                            '       ship_to s                                        ' +
                            ' where v.invoice_qty > 0                                ' +
                            '   and NVL(v.to_invoice, ''Y'') = ''Y''                 ' +
                            '   and NVL(v.pending_invoiced_qty, 0) = 0               ' +
                            '   and v.arcusto_id = %f                                ' +
                            '   and v.ship_to_id = s.id(+)                           ' +
                            '   and not exists(select id from arprepost_detail where shipment_dtl_id = v.shipment_dtl_id) ' +
                            '   and not exists(select id from arinvoice_detail where shipment_dtl_id = v.shipment_dtl_id) ' +
                            '   and not exists(select id from arprepost_detail where ord_detail_id = v.ord_detail_id) ' +
                            '   and not exists(select id from arinvoice_detail where ord_detail_id = v.ord_detail_id) ' +
                            '   and (v.vmi = ''N'' or (v.vmi = ''Y'' and NVL(s.vmi_invoice_on_ship, ''N'')  = ''Y'') ) ',
                            [FArcusto_Id]);

    APackSlips := SelectValueFmtAsFloat('select Sum(NVL(v.qtyshipped, 0) * NVL(a.unit_price, 0)) ' +
                            '  from v_shipments_short v,                             ' +
                            '       ship_to s,                                       ' +
                            '       arinvoice_detail a                          ' +
                            ' where v.invoice_qty > 0                                ' +
                            '   and NVL(v.to_invoice, ''Y'') = ''Y''                 ' +
                            '   and v.shipment_dtl_id = a.shipment_dtl_id         ' +
                            '   and NVL(v.pending_invoiced_qty, 0) = 0               ' +
                            '   and v.arcusto_id = %f                                ' +
                            '   and v.ship_to_id = s.id(+)                           ' +
                            '   and (v.vmi = ''N'' or (v.vmi = ''Y'' and NVL(s.vmi_invoice_on_ship, ''N'')  = ''Y'') ) ',
                            [FArcusto_Id]);


    ANotInvoiced := SelectValueFmtAsFloat('select Sum(NVL(v.qtyshipped, 0) * NVL(pa.unit_price, 0)) ' +
                            '  from v_shipments_short v,                             ' +
                            '       ship_to s,                                       ' +
                            '       arprepost_detail pa                         ' +
                            ' where NVL(v.to_invoice, ''Y'') = ''Y''                 ' +
                            '   and v.shipment_dtl_id = pa.shipment_dtl_id           ' +
                            '   and v.arcusto_id = %f                                ' +
                            '   and v.ship_to_id = s.id(+)                           ' +
                            '   and (v.vmi = ''N'' or (v.vmi = ''Y'' and NVL(s.vmi_invoice_on_ship, ''N'')  = ''Y'') ) ',
                            [FArcusto_Id]);


        APackSlips2 := SelectValueFmtAsFloat('select Sum(NVL(v.qtyshipped, 0) * NVL(a.unit_price, 0)) ' +
                              '  from v_shipments_short v,                             ' +
                              '       ship_to s,                                       ' +
                              '       arinvoice_detail a                          ' +
                              ' where v.invoice_qty > 0                                ' +
                              '   and NVL(v.to_invoice, ''Y'') = ''Y''                 ' +
                              '   and v.ord_detail_id = a.ord_detail_id                ' +
                              '   and a.shipment_dtl_id is null                        ' +
                              '   and NVL(v.pending_invoiced_qty, 0) = 0               ' +
                              '   and v.arcusto_id = %f                                ' +
                              '   and v.ship_to_id = s.id(+)                           ' +
                              '   and (v.vmi = ''N'' or (v.vmi = ''Y'' and NVL(s.vmi_invoice_on_ship, ''N'')  = ''Y'') ) ',
                              [FArcusto_Id]);


        ANotInvoiced2 := SelectValueFmtAsFloat('select Sum(NVL(v.qtyshipped, 0) * NVL(pa.unit_price, 0)) ' +
                                '  from v_shipments_short v,                             ' +
                                '       ship_to s,                                       ' +
                                '       arprepost_detail pa                              ' +
                                ' where NVL(v.to_invoice, ''Y'') = ''Y''                 ' +
                                '   and v.ord_detail_id = pa.ord_detail_id               ' +
                                '   and pa.shipment_dtl_id is null                        ' +
                                '   and v.arcusto_id = %f                                ' +
                                '   and v.ship_to_id = s.id(+)                           ' +
                                '   and (v.vmi = ''N'' or (v.vmi = ''Y'' and NVL(s.vmi_invoice_on_ship, ''N'')  = ''Y'') ) ',
                                [FArcusto_Id]);


    ANotInvoiced3 := SelectValueFmtAsFloat('select Sum(NVL(pa.invoice_qty, 0) * NVL(pa.unit_price, 0)) ' +
                            '  from arprepost v,                                 ' +
                            '       arprepost_detail pa                          ' +
                            ' where NVL(pa.shipment_dtl_id, 0) = 0               ' +
                            '   and NVL(v.cia_invoice, ''N'') <> ''Y''           ' +
                            '   and NVL(pa.ord_detail_id, 0) = 0                 ' +
                            '   and v.arcusto_id = %f                            ' +
                            '   and v.id = pa.arprepost_id(+)',
                            [FArcusto_Id]);

  end;

{
  if cbPackSlip.checked then
    APackSlips := SelectValueFmtAsFloat('select Sum(NVL(v.qtyshipped, 0) * NVL(v.unit_price, 0)) ' +
                            '  from v_shipments_short v,                             ' +
                            '       ship_to s,                                       ' +
                            '       ord_detail d,                                    ' +
                            '       C_ARINVOICE_SHIP_SUM a,                          ' +
                            '       C_ARINVOICE_ORD_SUM b,                           ' +
                            '       C_ARPREPOST_SHIP_SUM pa,                         ' +
                            '       C_ARPREPOST_ORD_SUM pb                           ' +
                            ' where v.invoice_qty > 0                                ' +
                            '   and NVL(v.to_invoice, ''Y'') = ''Y''                 ' +
                            '   and v.shipment_dtl_id = a.shipment_dtl_id(+)         ' +
                            '   and v.ord_detail_id = b.ord_detail_id(+)             ' +
                            '   and v.ord_detail_id = d.id(+)                        ' +
                            '   and v.shipment_dtl_id = pa.shipment_dtl_id(+)        ' +
                            '   and v.ord_detail_id = pb.ord_detail_id(+)            ' +
                            '   and NVL(v.pending_invoiced_qty, 0) = 0               ' +
                            '   and v.qtyshipped > NVL(a.invoiced_qty, 0)            ' +
                            '   and v.arcusto_id = %f                                ' +
                            '   and v.ship_to_id = s.id(+)                           ' +
                            '   and (v.vmi = ''N'' or (v.vmi = ''Y'' and NVL(s.vmi_invoice_on_ship, ''N'')  = ''Y'') ) ',
                            [FArcusto_Id]);
}

  AReleases := 0;
  if cbSO.checked then
  begin
    AReleases := SelectValueFmtAsFloat('select sum((NVL(r.quan, 0) - NVL(shipped_quan, 0)) * NVL(d.unit_price, d.unit_price)) ' +
                           '   from releases r,                                  ' +
                           '        ord_detail d,                                ' +
                           '        orders o                                     ' +
                           '  where r.ord_detail_id = d.id                       ' +
                           '    and d.orders_id = o.id                           ' +
                           '    and o.arcusto_id = %f                            ' +
                           '    and NVL(r.shipped_quan, 0) < NVL(r.quan, 0)      ' +
                           '    and r.request_date <= trunc(sysdate) + %d',
                           [FArcusto_Id, Trunc(StrToFloat(edDays.Text))]);

    ExecuteCommandFmt('update arcusto set CUST_CREDIT_DAYS = %d where id = %f', [Trunc(StrToFloat(edDays.Text)), FArcusto_Id]);

  end;
  if cbPackSlip.checked then
    ExecuteCommandFmt('update arcusto set CUST_CREDIT_INCL_SHIP = ''Y'' where id = %f', [FArcusto_Id])
  else
    ExecuteCommandFmt('update arcusto set CUST_CREDIT_INCL_SHIP = ''N'' where id = %f', [FArcusto_Id]);

  if cbSO.checked then
    ExecuteCommandFmt('update arcusto set CUST_CREDIT_INCL_SO = ''Y'' where id = %f', [FArcusto_Id])
  else
    ExecuteCommandFmt('update arcusto set CUST_CREDIT_INCL_SO = ''N'' where id = %f', [FArcusto_Id]);


//  ACurrent := FTotalToPay + AReleases + APackSlips + ANotInvoiced;
  ACurrent := AReleases + APackSlips + ANotInvoiced + APackSlips2 + ANotInvoiced2 + ANotInvoiced3 + APackSlips3;
  FCurrent := ACurrent;
  FOpenToBuy := FCreditLimit - ACurrent - FTotalToPay;
  RefreshQry;
end;

procedure TFrmCustCreditLimit.QryArcustoAfterPost(DataSet: TDataSet);
begin
{
  try
    QryArcusto.DataBase.ApplyUpdates( [QryArcusto ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryArcusto.Close;
      QryArcusto.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmCustCreditLimit.cbAutoCalcClick(Sender: TObject);
begin
  if cbAutoCalc.Checked then
    ExecuteCommandFmt('update arcusto set CREDIT_LIMIT_AUTOCALC = ''Y'' where id = %f', [FArcusto_id])
  else
    ExecuteCommandFmt('update arcusto set CREDIT_LIMIT_AUTOCALC = ''N'' where id = %f', [FArcusto_id]);

end;


procedure TFrmCustCreditLimit.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAR{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCustCreditLimit.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmCustCreditLimit.cbAutoUpdClick(Sender: TObject);
begin
  if cbAutoUpd.Checked then
    ExecuteCommandFmt('update arcusto set CREDIT_LIMIT_AUTO_UPDATE = ''Y'' where id = %f', [FArcusto_id])
  else
    ExecuteCommandFmt('update arcusto set CREDIT_LIMIT_AUTO_UPDATE = ''N'' where id = %f', [FArcusto_id]);

  wwDBPastDue.Visible := cbAutoUpd.checked;
  Label6.Visible := cbAutoUpd.checked;
end;




end.
