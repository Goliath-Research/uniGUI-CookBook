unit sys_ccmerchant_paypal;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  sys_ccmerchant_base,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Menus, uniMainMenu, Data.DB,
  IQMS.WebVcl.HPick, uniButton, uniBitBtn, Vcl.Controls;

type
  TFrmIQSysMerchantPayPal = class(TFrmIQSysMerchantBase)
    PnlCtrlsCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlCtrlsLeft: TUniPanel;
    PnlCtrlsClient: TUniPanel;
    lblAccountNumber: TUniLabel;
    lblPassword: TUniLabel;
    lblSignature: TUniLabel;
    Label91: TUniLabel;
    lblAccountType: TUniLabel;
    lblCurrencyCode: TUniLabel;
    edtLoginName: TUniEdit;
    edtPassword: TUniEdit;
    edtSignature: TUniEdit;
    cmbChargeMethod: TUniComboBox;
    chkChangeSettlement: TUniCheckBox;
    chkAutoAdjustSettlement: TUniCheckBox;
    cmbAccountType: TUniComboBox;
    cmbCurrency: TUniComboBox;
    chkTestAccount: TUniCheckBox;
    procedure chkChangeSettlementClick(Sender: TObject);
    procedure chkAutoAdjustSettlementClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function GetCurrencyCode: String;
    procedure SetCurrencyCode(Value: String);
    procedure ValidateBeforeClose; override;
    procedure GetEncryptedValues; override;
    procedure SetEncryptedValues; override;
    procedure AfterShow; override;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  iqsys_rscstr;

{ TFrmIQSysMerchantBase1 }

procedure TFrmIQSysMerchantPayPal.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlCtrlsLeft]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCtrlsClient);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCtrlsClient);
end;

procedure TFrmIQSysMerchantPayPal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlCtrlsLeft]);
end;

procedure TFrmIQSysMerchantPayPal.AfterShow;
begin
  inherited;
  if edtLoginName.CanFocus then edtLoginName.SetFocus;
end;

procedure TFrmIQSysMerchantPayPal.GetEncryptedValues;
begin
  inherited;// nothing

  // Account Type must = 'Business'.  It is there as a reminder that
  // the gateway settings must be for a 'Business' account
  IQMS.Common.Controls.IQEnableControl([cmbAccountType],False);
  cmbAccountType.ItemIndex := 1;

  DecryptToScreen(edtLoginName,'LOGIN_NAME');
  DecryptToScreen(edtPassword,'PASSWORD');
  DecryptToScreen(edtSignature,'TRANS_KEY');

  // Charge Method (matches item index)
  cmbChargeMethod.ItemIndex := FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger;
  // Can Change Settlement Amount (07/06/2009)
  chkChangeSettlement.Checked := FCreditCardParams.ChangeSettlement;
  // Automatically adjust settlement amount during
  // settlement process (07/16/2009)
  chkAutoAdjustSettlement.Checked := FCreditCardParams.AutoAdjustSettlement;

  // Currency Code
  SetCurrencyCode(FCreditCardParams.ParamByName('CURRENCY_CODE').AsString);

  // Test Account
  chkTestAccount.Checked := FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean;

end;

procedure TFrmIQSysMerchantPayPal.SetEncryptedValues;
begin
  inherited;// nothing

  try
     FCreditCardParams.BeginUpdate;
     EncryptToTable(edtLoginName,'LOGIN_NAME');
     EncryptToTable(edtPassword,'PASSWORD');
     EncryptToTable(edtSignature,'TRANS_KEY');

     // Charge Method - matches item index
     FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger := cmbChargeMethod.ItemIndex;
     // Can Change Settlement Amount (07/06/2009)
     FCreditCardParams.ChangeSettlement := chkChangeSettlement.Checked;
     // Automatically adjust settlement amount during
     // settlement process (07/16/2009)
     FCreditCardParams.AutoAdjustSettlement := chkAutoAdjustSettlement.Checked;

     // Currency Code
     FCreditCardParams.ParamByName('CURRENCY_CODE').AsString := GetCurrencyCode;

     // Test Account
     FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean := chkTestAccount.Checked;

  finally
     FCreditCardParams.EndUpdate;
  end;

end;

procedure TFrmIQSysMerchantPayPal.ValidateBeforeClose;
begin
  Assert(edtLoginName.Text > '',
   Format(iqsys_rscstr.cTXT0000084 {'Please enter a value for %s'},
    [lblAccountNumber.Caption]));

  Assert(edtPassword.Text > '',
   Format(iqsys_rscstr.cTXT0000084 {'Please enter a value for %s'},
    [lblPassword.Caption]));

  Assert(edtSignature.Text > '',
   Format(iqsys_rscstr.cTXT0000084 {'Please enter a value for %s'},
    [lblSignature.Caption]));

  Assert(cmbAccountType.ItemIndex > -1,
   Format(iqsys_rscstr.cTXT0000085 {'Please select a value for %s'},
    [lblAccountType.Caption]));

  WarnInvalidCurrencyCode(GetCurrencyCode);

  // Informational - "password required" must be enabled
  {'In order for your PayPal Business seller account to ' +
    'process credit card transactions in EnterpriseIQ, "Website Payments ' +
    'Pro" must be activated on the account.  Please verify that you have ' +
    'selected "Website Payments Pro" as the payment solution on your PayPal ' +
    'account.'}
  IQInformation(iqsys_rscstr.cTXT0000086);

end;

function TFrmIQSysMerchantPayPal.GetCurrencyCode: String;
begin
  case cmbCurrency.ItemIndex of
   1: Result := 'CAD'; // Canadian Dollars
   2: Result := 'EUR'; // Euros
   3: Result := 'GBP'; // British Pounds
   4: Result := 'JPY'; // Japanese Yen
   5: Result := 'AUD'; // Australian Dollars
  else
    Result := 'USD'; // US Dollars
  end;
end;

procedure TFrmIQSysMerchantPayPal.SetCurrencyCode(Value: String);
var
   AIndex: Integer;
begin
  try
     // Get the item index
     AIndex := IQMS.Common.StringUtils.CaseOfStr(Value,
      // 0     1     2     3     4     5
        ['USD','CAD','EUR','GBP','JPY','AUD']);

     // Adjust the index if necessary
     if (AIndex < 0) or (AIndex > cmbCurrency.Items.Count - 1) then
        AIndex := 0;

     // apply the index
     cmbCurrency.ItemIndex := AIndex;
  except
    // don't raise, just set value to default
    cmbCurrency.ItemIndex := 0;
  end;
end;

procedure TFrmIQSysMerchantPayPal.chkChangeSettlementClick(
  Sender: TObject);
var
   ev: TNotifyEvent;
begin
  // 07/16/2009
  if not Showing then Exit;
//  Application.ProcessMessages;
  if chkChangeSettlement.Checked then
  try
     ev := chkAutoAdjustSettlement.OnClick;
     chkAutoAdjustSettlement.OnClick := NIL;
     chkAutoAdjustSettlement.Checked := False;
  finally
     chkAutoAdjustSettlement.OnClick := ev;
  end;
end;

procedure TFrmIQSysMerchantPayPal.chkAutoAdjustSettlementClick(
  Sender: TObject);
var
   ev: TNotifyEvent;
begin
  // 07/16/2009
  if not Showing then Exit;
//  Application.ProcessMessages;
  if chkAutoAdjustSettlement.Checked then
  try
     ev := chkChangeSettlement.OnClick;
     chkChangeSettlement.OnClick := NIL;
     chkChangeSettlement.Checked := False;
  finally
     chkChangeSettlement.OnClick := ev;
  end;
end;

end.
