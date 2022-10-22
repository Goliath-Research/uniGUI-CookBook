unit sys_ccmerchant_authnet;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  sys_ccmerchant_base,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  Mask,
  IQMS.WebVcl.CaptionPanel,
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
  TFrmIQSysMerchantAuthNet = class(TFrmIQSysMerchantBase)
    PnlCtrlsCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlCtrlsLeft: TUniPanel;
    PnlCtrlsClient: TUniPanel;
    lblLoginName: TUniLabel;
    lblTranskey: TUniLabel;
    Label88: TUniLabel;
    Label91: TUniLabel;
    lblProcessingClass: TUniLabel;
    lblCurrencyCode: TUniLabel;
    edtLoginName: TUniEdit;
    edtTransKey: TUniEdit;
    edtHashValue: TUniEdit;
    cmbChargeMethod: TUniComboBox;
    chkChangeSettlement: TUniCheckBox;
    chkAutoAdjustSettlement: TUniCheckBox;
    cmbProcessingClass: TUniComboBox;
    edtCurrencyCode: TUniEdit;
    sbtnCurrencyCode: TUniSpeedButton;
    chkTestAccount: TUniCheckBox;
    CaptionPanel1: TIQWebCaptionPanel;
    procedure sbtnCurrencyCodeClick(Sender: TObject);
    procedure chkChangeSettlementClick(Sender: TObject);
    procedure chkAutoAdjustSettlementClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    { Protected declarations }
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
  iqsys_rscstr;

{ TFrmIQSysMerchantAuthNet }

procedure TFrmIQSysMerchantAuthNet.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlCtrlsLeft]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCtrlsClient);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCtrlsClient);
end;

procedure TFrmIQSysMerchantAuthNet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlCtrlsLeft]);
end;

procedure TFrmIQSysMerchantAuthNet.AfterShow;
begin
  inherited;
  if edtLoginName.CanFocus then
    edtLoginName.SetFocus;
end;

procedure TFrmIQSysMerchantAuthNet.GetEncryptedValues;
begin

  inherited; // nothing

  DecryptToScreen(edtLoginName, 'LOGIN_NAME');
  DecryptToScreen(edtTransKey, 'TRANS_KEY');
  DecryptToScreen(edtHashValue, 'HASH_VALUE');

  // Processing Class
  // For an index of 3 (for Level 3), just select index 2 because Authorize.Net
  // does not support Level 3 processing.  Had to change the combo box list,
  // but for backward compatibility we just select Level 2 for the user.
  case FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger of
    2:
      cmbProcessingClass.ItemIndex := 1;
    3:
      cmbProcessingClass.ItemIndex := 1; // 2/16/2011
  else
    cmbProcessingClass.ItemIndex := 0;
  end;

  // Currency Code
  edtCurrencyCode.Text := FCreditCardParams.ParamByName('CURRENCY_CODE').AsString;
  if edtCurrencyCode.Text = '' then
    edtCurrencyCode.Text := 'USD';

  // Charge Method (matches item index)
  cmbChargeMethod.ItemIndex := FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger;
  // Can Change Settlement Amount (07/06/2009)
  chkChangeSettlement.Checked := FCreditCardParams.ChangeSettlement;
  // Automatically adjust settlement amount during
  // settlement process (07/16/2009)
  chkAutoAdjustSettlement.Checked := FCreditCardParams.AutoAdjustSettlement;

  // Test Account
  chkTestAccount.Checked := FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean;

end;

procedure TFrmIQSysMerchantAuthNet.SetEncryptedValues;
begin

  inherited; // nothing

  try
    FCreditCardParams.BeginUpdate;

    EncryptToTable(edtLoginName, 'LOGIN_NAME');
    EncryptToTable(edtTransKey, 'TRANS_KEY');
    EncryptToTable(edtHashValue, 'HASH_VALUE');

    // Processing class
    // 02/16/2011 Authorize.Net does not support Level 3 processing, so
    // we always just default to Level 2 processing.
    case cmbProcessingClass.ItemIndex of
      1:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 2;
      2:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 2; // 02/16/2011
    else
      FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 0;
    end;

    // Charge Method - matches item index
    FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger := cmbChargeMethod.ItemIndex;
    // Can Change Settlement Amount (07/06/2009)
    FCreditCardParams.ChangeSettlement := chkChangeSettlement.Checked;
    // Automatically adjust settlement amount during
    // settlement process (07/16/2009)
    FCreditCardParams.AutoAdjustSettlement := chkAutoAdjustSettlement.Checked;

    // Currency Code
    FCreditCardParams.ParamByName('CURRENCY_CODE').AsString := edtCurrencyCode.Text;

    // Test Account
    FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean := chkTestAccount.Checked;
  finally
    FCreditCardParams.EndUpdate;
  end;
end;

procedure TFrmIQSysMerchantAuthNet.sbtnCurrencyCodeClick(Sender: TObject);
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

procedure TFrmIQSysMerchantAuthNet.ValidateBeforeClose;
begin

  Assert(edtLoginName.Text > '', Format(iqsys_rscstr.cTXT0000084 { 'Please enter a value for %s' } , [lblLoginName.Caption]));
  Assert(edtTransKey.Text > '', Format(iqsys_rscstr.cTXT0000084 { 'Please enter a value for %s' } , [lblTranskey.Caption]));
  WarnInvalidCurrencyCode(edtCurrencyCode.Text);

  // Informational - "password required" must be enabled
  { 'To communicate with Authorize.Net, the "Password required" ' +
    'setting on your account must be enabled.  Please verify that "Password ' +
    'required" has been enabled on your Authorize.Net account.' }
  IQInformation(iqsys_rscstr.cTXT0000080);

end;

procedure TFrmIQSysMerchantAuthNet.chkChangeSettlementClick(Sender: TObject);
var
  ev: TNotifyEvent;
begin
  // 07/16/2009
  if not Showing then
    Exit;
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

procedure TFrmIQSysMerchantAuthNet.chkAutoAdjustSettlementClick(Sender: TObject);
var
  ev: TNotifyEvent;
begin
  // 07/16/2009
  if not Showing then
    Exit;
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
