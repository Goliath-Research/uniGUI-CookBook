unit sys_ccmerchant_tsys;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  sys_ccmerchant_base,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Menus, uniMainMenu, Data.DB,
  IQMS.WebVcl.HPick, Vcl.Controls;

type
  TFrmIQSysMerchantTSYS = class(TFrmIQSysMerchantBase)
    PnlCtrlsCarrier: TUniPanel;
    PnlCaption_Options: TUniPanel;
    Label7: TUniLabel;
    Bevel4: TUniPanel;
    PnlOption: TUniPanel;
    chkChangeSettlement: TUniCheckBox;
    chkAutoAdjustSettlement: TUniCheckBox;
    chkTestAccount: TUniCheckBox;
    PnlMerchant: TUniPanel;
    Splitter2: TUniSplitter;
    PnlMerchantLeft: TUniPanel;
    lblLoginName: TUniLabel;
    lblTranskey: TUniLabel;
    Label88: TUniLabel;
    lblPassword: TUniLabel;
    Label77: TUniLabel;
    Label84: TUniLabel;
    Label85: TUniLabel;
    Label91: TUniLabel;
    lblProcessingClass: TUniLabel;
    PnlMerchantClient: TUniPanel;
    edtMerchantID: TUniEdit;
    edtDeviceID: TUniEdit;
    edtUserName: TUniEdit;
    edtPassword: TUniEdit;
    edtCountryCode: TUniEdit;
    sbtnCountryCode: TUniSpeedButton;
    edtCurrencyCode: TUniEdit;
    sbtnCurrencyCode: TUniSpeedButton;
    cmbLanguageCode: TUniComboBox;
    cmbChargeMethod: TUniComboBox;
    cmbProcessingClass: TUniComboBox;
    PnlCaption_General: TUniPanel;
    lblMerchantPrompt: TUniLabel;
    Bevel1: TUniPanel;
    lblTransactionKey: TUniLabel;
    edtTransKey: TUniEdit;
    btnTransKey: TUniButton;
    procedure UniFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnCountryCodeClick(Sender: TObject);
    procedure sbtnCurrencyCodeClick(Sender: TObject);
    procedure btnTransKeyClick(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure ValidateBeforeClose; override;
    procedure GetEncryptedValues; override;
    procedure SetEncryptedValues; override;
    procedure AfterShow; override;
    property CreditCardAccountID;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  {TODO -oLema : Need to revisit. Dependent on cc_epayment, cc_share ,
    the problem is the missing cc_purge_expired_cards_dlg.
    I removed the btnTransKeyClick in order to compile}

  cc_epayment,
  cc_share,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  iqsys_rscstr;

{ TFrmIQSysMerchantTSYS }

procedure TFrmIQSysMerchantTSYS.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlMerchantLeft]);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlOption);
  IQMS.Common.Controls.IQEnableControl(cmbChargeMethod, False);
end;

procedure TFrmIQSysMerchantTSYS.btnTransKeyClick(Sender: TObject);
(*
var
  AEPaymentProcessor: TEPaymentProcessor;
  ASuccess: Boolean;
  AErrorText: string;
*)
begin
(*
  // Save changes
  // All four must be entered
  if (Trim(edtMerchantID.Text) = '') or (Trim(edtDeviceID.Text) = '') or (Trim(edtUserName.Text) = '') or (Trim(edtPassword.Text) = '') then
  begin
    { iqsys_rscstr.cTXT0000089 = 'Merchant ID, Device ID,
      User Name/Operator, and Password must all be entered.' }
    if IQMS.Common.Dialogs.IQWarningYN(iqsys_rscstr.cTXT0000089) then
      System.SysUtils.Abort;
  end;

  SetEncryptedValues;
  AEPaymentProcessor := cc_share.CreateEPaymentProcessor(Self, CreditCardAccountID);
  try
    ASuccess := cc_share.TSYS_CreateTransactionKey(AEPaymentProcessor, CreditCardAccountID, { var } AErrorText);
    if ASuccess then
    begin
      FCreditCardParams.Refresh;
      GetEncryptedValues;
    end;
  finally
    FreeAndNil(AEPaymentProcessor);
  end;

  if not ASuccess and (AErrorText > '') then
    // iqsys_rscstr.cTXT0000126 = 'Could not create transaction key.';
    IQWarning(iqsys_rscstr.cTXT0000126 + #13 + AErrorText);
*)
end;

procedure TFrmIQSysMerchantTSYS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlMerchantLeft]);
end;

procedure TFrmIQSysMerchantTSYS.AfterShow;
begin
  inherited;
  if Self.Showing and edtMerchantID.CanFocus then
    edtMerchantID.SetFocus;
end;

procedure TFrmIQSysMerchantTSYS.GetEncryptedValues;
var
  AValue: string;
begin
  // inherited;// nothing
  DecryptToScreen(edtMerchantID, 'MERCHANT_ID');
  DecryptToScreen(edtDeviceID, 'DEVICE_ID');
  DecryptToScreen(edtUserName, 'OPERATOR');
  DecryptToScreen(edtPassword, 'PASSWORD');
  // Country code
  DecryptToScreen(edtCountryCode, 'COUNTRY_CODE');
  if FCreditCardParams.ParamByName('COUNTRY_CODE').AsString = '840' then
    edtCountryCode.Text := 'US';
  // Currency code
  DecryptToScreen(edtCurrencyCode, 'CURRENCY_CODE');
  if FCreditCardParams.ParamByName('CURRENCY_CODE').AsString = '840' then
    edtCountryCode.Text := 'USD';
  // Language code
  AValue := FCreditCardParams.ParamByName('LANGUAGE_CODE').AsString;
  if AValue = 'SPANISH' then
    cmbLanguageCode.ItemIndex := 1
  else
    cmbLanguageCode.ItemIndex := 0;
  // Charge Method (matches item index).
  // Note:  While TSYS does support AuthOnly, it is impractical
  // because it is a "host batch system," which means that TSYS
  // does an automatic batch settle at the end of each business day.
  cmbChargeMethod.ItemIndex := 1;
  // FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger;
  // Can Change Settlement Amount (07/06/2009)
  chkChangeSettlement.Checked := FCreditCardParams.ChangeSettlement;
  // Automatically adjust settlement amount during
  // settlement process (07/16/2009)
  chkAutoAdjustSettlement.Checked := FCreditCardParams.AutoAdjustSettlement;
  // Processing class
  case FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger of
    2:
      cmbProcessingClass.ItemIndex := 1;
    3:
      cmbProcessingClass.ItemIndex := 2;
  else
    cmbProcessingClass.ItemIndex := 0;
  end;
  // Test Account
  chkTestAccount.Checked := FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean;

  edtTransKey.Text := FCreditCardParams.ParamByName('TRANSACTION_KEY').AsString;
end;

procedure TFrmIQSysMerchantTSYS.sbtnCountryCodeClick(Sender: TObject);
begin
  // Select country code
  with PkCountryCode do
    if Execute then
      edtCountryCode.Text := GetValue('CHR2');
end;

procedure TFrmIQSysMerchantTSYS.sbtnCurrencyCodeClick(Sender: TObject);
begin
  // Select currency code
  if MultiCurrencyEnabled then
  begin
    with PkCurrencyCode do
      if Execute then
        edtCurrencyCode.Text := GetValue('CHR3');
  end
  else
  begin
    with PkCurrencyISO do
      if Execute then
        edtCurrencyCode.Text := GetValue('CHR3');
  end;
end;

procedure TFrmIQSysMerchantTSYS.SetEncryptedValues;
var
  AValue: string;
  i: Integer;
begin
  // inherited;// nothing
  try
    FCreditCardParams.BeginUpdate;
    EncryptToTable(edtMerchantID, 'MERCHANT_ID');
    EncryptToTable(edtDeviceID, 'DEVICE_ID');
    EncryptToTable(edtUserName, 'OPERATOR');
    EncryptToTable(edtPassword, 'PASSWORD');
    EncryptToTable(edtCountryCode, 'COUNTRY_CODE');
    EncryptToTable(edtCurrencyCode, 'CURRENCY_CODE');
    if cmbLanguageCode.ItemIndex = 1 then
      FCreditCardParams.ParamByName('LANGUAGE_CODE').AsString := 'SPANISH'
    else
      FCreditCardParams.ParamByName('LANGUAGE_CODE').AsString := 'ENGLISH';
    // Charge Method (matches item index)
    FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger := 1;
    // Can Change Settlement Amount (07/06/2009)
    FCreditCardParams.ChangeSettlement := chkChangeSettlement.Checked;
    // Automatically adjust settlement amount during
    // settlement process (07/16/2009)
    FCreditCardParams.AutoAdjustSettlement := chkAutoAdjustSettlement.Checked;
    // Processing class
    case cmbProcessingClass.ItemIndex of
      1:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 2;
      2:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 3;
    else
      FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 0;
    end;
    // Test Account
    FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean := chkTestAccount.Checked;

    FCreditCardParams.ParamByName('TRANSACTION_KEY').AsString := edtTransKey.Text;

  finally
    FCreditCardParams.EndUpdate;
  end;
end;

procedure TFrmIQSysMerchantTSYS.ValidateBeforeClose;
begin
  inherited;
  // All four must be entered
  if (Trim(edtMerchantID.Text) = '') or (Trim(edtDeviceID.Text) = '') or (Trim(edtUserName.Text) = '') or (Trim(edtPassword.Text) = '') then
  begin
    { iqsys_rscstr.cTXT0000089 = 'Merchant ID, Device ID,
      User Name/Operator, and Password must all be entered.' }
    if IQMS.Common.Dialogs.IQWarningYN(iqsys_rscstr.cTXT0000089) then
      System.SysUtils.Abort;
  end;

  // iqsys_rscstr.cTXT0000105 = 'Invalid currency code.
  // Currency code must be a 3-character ISO code.'
  if (edtCurrencyCode.Text = '') or (Length(edtCurrencyCode.Text) <> 3) then
    raise Exception.Create(iqsys_rscstr.cTXT0000105);

  // Ensure a trans key is created
  // iqsys_rscstr.cTXT0000125 =
  // 'A transaction key has not been created.  Do you want to ' +
  // 'obtain a transaction key now?';
  if (edtTransKey.Text = '') and IQConfirmYN(iqsys_rscstr.cTXT0000125) then
    btnTransKeyClick(nil);
end;

end.
