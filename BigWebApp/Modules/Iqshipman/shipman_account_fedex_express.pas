unit shipman_account_fedex_express;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  shipman_account_base,
  Vcl.Buttons,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniLabel,
  uniDBComboBox, uniButton, uniBitBtn, uniSplitter, System.Classes,
  Vcl.Controls, Vcl.Forms, uniPanel;

type
  TFrmShipManAccountFedExExpress = class(TFrmShipManAccountBase)
    edtAccountNumber: TUniEdit;
    edtMeterNumber: TUniEdit;
    lblAccountNumber: TUniLabel;
    lblMeterNumber: TUniLabel;
    chkFreightEnabled: TUniCheckBox;
    lblFreightAccountNumber: TUniLabel;
    lblContact: TUniLabel;
    lblPhone: TUniLabel;
    lblZip: TUniLabel;
    lblAddr2: TUniLabel;
    lblCountry: TUniLabel;
    lblCompany: TUniLabel;
    lblCity: TUniLabel;
    lblState: TUniLabel;
    lblAddr1: TUniLabel;
    edtFreightAcctNum: TUniEdit;
    edtContact: TUniEdit;
    edtPhone: TUniEdit;
    edtCompany: TUniEdit;
    edtAddr1: TUniEdit;
    edtAddr2: TUniEdit;
    edtCity: TUniEdit;
    edtZip: TUniEdit;
    cmbCountry: TUniComboBox;
    cmbState: TUniComboBox;
    procedure chkFreightEnabledClick(Sender: TObject);
    procedure cmbCountryChange(Sender: TObject);
  private
    procedure SetSize;
    procedure SetComboBoxValue(AComboBox: TUniDBComboBox; AValue: String);
    { Private declarations }
  protected
    { Protected declarations }
    procedure LoadOptions; override;
    procedure SaveOptions; override;
    procedure ValidateOptions; override;
  public
    { Public declarations }
  end;

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Regional,
  IQMS.Common.Boolean;

{$R *.dfm}

procedure TFrmShipManAccountFedExExpress.chkFreightEnabledClick(Sender: TObject);
begin
 SetSize;
end;

procedure TFrmShipManAccountFedExExpress.SetSize;
begin
  if chkFreightEnabled.Checked then
    begin
      IQMS.Common.Controls.IQShowControl([edtFreightAcctNum, edtContact, edtPhone,edtCompany, edtAddr1, edtAddr2,
        edtCity, cmbState, edtZip, cmbCountry], true);
      self.Height := 400
    end
  else
    begin
      IQMS.Common.Controls.IQShowControl([edtFreightAcctNum, edtContact, edtPhone,edtCompany, edtAddr1, edtAddr2,
        edtCity, cmbState, edtZip, cmbCountry], false);
      self.Height := 150;
    end;
end;

procedure TFrmShipManAccountFedExExpress.SetComboBoxValue(AComboBox: TUniDBComboBox;
  AValue: String);
var
   i: Integer;
begin
   if (AComboBox = NIL) then Exit;
   for i := 0 to AComboBox.Items.Count - 1 do
    if (AComboBox.Items[i] = AValue) then
       begin
         AComboBox.ItemIndex := i;
         BREAK;
       end;

end;

procedure TFrmShipManAccountFedExExpress.cmbCountryChange(Sender: TObject);
begin
  IQMS.Common.Regional.LoadStateCodes(cmbState, IQMS.Common.Regional.ComboBoxCountryCode(cmbCountry), cmbState.Text);
end;

procedure TFrmShipManAccountFedExExpress.LoadOptions;
begin
  // inherited; // nothing
  edtAccountNumber.Text := CarrierOptions.ParamByName('AccountNumber').AsString;
  edtMeterNumber.Text := CarrierOptions.ParamByName('MeterNumber').AsString;
  chkFreightEnabled.Checked := IQMS.Common.Boolean.YNToBool(CarrierOptions.ParamByName('FreightEnabled').AsString);
  edtFreightAcctNum.Text := CarrierOptions.ParamByName('FreightAcctNum').AsString;
  edtContact.Text := CarrierOptions.ParamByName('FreightContact').AsString;
  edtPhone.Text := CarrierOptions.ParamByName('FreightPhone').AsString;
  edtCompany.Text := CarrierOptions.ParamByName('FreightCompany').AsString;
  edtAddr1.Text := CarrierOptions.ParamByName('FreightAddr1').AsString;
  edtAddr2.Text := CarrierOptions.ParamByName('FreightAddr2').AsString;
  edtCity.Text := CarrierOptions.ParamByName('FreightCity').AsString;
  edtZip.Text := CarrierOptions.ParamByName('FreightZip').AsString;

  IQMS.Common.Regional.LoadCountries(cmbCountry);
  cmbCountry.ItemIndex := IQMS.Common.Regional.IndexOfCountryCode(cmbCountry, CarrierOptions.ParamByName('FreightCountry').AsString);
  IQMS.Common.Regional.LoadStateCodes(cmbState, IQMS.Common.Regional.ComboBoxCountryCode(cmbCountry), CarrierOptions.ParamByName('FreightState').AsString);

  SetSize;
end;

procedure TFrmShipManAccountFedExExpress.SaveOptions;
begin
  // inherited; // nothing
  CarrierOptions.ParamByName('AccountNumber').AsString := edtAccountNumber.Text;
  ExecuteCommandFmt('update freight_carrier set acct = ''%s'' where id = %.0f', [edtAccountNumber.Text, FCarrierID]);
  CarrierOptions.ParamByName('MeterNumber').AsString := edtMeterNumber.Text;
  CarrierOptions.ParamByName('FreightEnabled').AsString := IQMS.Common.Boolean.boolToYN(chkFreightEnabled.Checked);
  if (chkFreightEnabled.Checked) then
    begin
      CarrierOptions.ParamByName('FreightAcctNum').AsString := edtFreightAcctNum.Text;
      CarrierOptions.ParamByName('FreightContact').AsString := edtContact.Text;
      CarrierOptions.ParamByName('FreightPhone').AsString := edtPhone.Text;
      CarrierOptions.ParamByName('FreightCompany').AsString := edtCompany.Text;
      CarrierOptions.ParamByName('FreightAddr1').AsString := edtAddr1.Text;
      CarrierOptions.ParamByName('FreightAddr2').AsString := edtAddr2.Text;
      CarrierOptions.ParamByName('FreightCity').AsString := edtCity.Text;
      CarrierOptions.ParamByName('FreightState').AsString := cmbState.Text;
      CarrierOptions.ParamByName('FreightZip').AsString := edtZip.Text;
      CarrierOptions.ParamByName('FreightCountry').AsString := IQMS.Common.Regional.ComboBoxCountryCode(cmbCountry);
    end;
end;

procedure TFrmShipManAccountFedExExpress.ValidateOptions;
begin
  inherited;

  if Trim(edtAccountNumber.Text) = '' then
     raise Exception.Create('Please enter an Account number.');
end;

end.
