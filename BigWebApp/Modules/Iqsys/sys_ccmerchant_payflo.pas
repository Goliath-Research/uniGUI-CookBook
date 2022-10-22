unit sys_ccmerchant_payflo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  sys_ccmerchant_base,
  Vcl.Wwdatsrc,
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
  uniPanel,
  uniSplitter,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Menus, uniMainMenu, Data.DB,
  IQMS.WebVcl.HPick, uniButton, uniBitBtn, Vcl.Controls;

type
  TFrmIQSysMerchantPayFlo = class(TFrmIQSysMerchantBase)
    PnlCtrlsCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlCtrlsLeft: TUniPanel;
    PnlCtrlsClient: TUniPanel;
    lblUserName: TUniLabel;
    lblPassword: TUniLabel;
    Label91: TUniLabel;
    lblProcessingClass: TUniLabel;
    edtUserName: TUniEdit;
    edtPassword: TUniEdit;
    cmbChargeMethod: TUniComboBox;
    cmbProcessingClass: TUniComboBox;
    chkTestAccount: TUniCheckBox;
    chkChangeSettlement: TUniCheckBox;
    chkAutoAdjustSettlement: TUniCheckBox;
    lblCurrencyCode: TUniLabel;
    cmbCurrency: TUniComboBox;
    edtPartner: TUniEdit;
    edtVendor: TUniEdit;
    lblPartner: TUniLabel;
    lblVendor: TUniLabel;
    chkAllowNonReferencedCredits: TUniCheckBox;
    procedure UniFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkChangeSettlementClick(Sender: TObject);
    procedure chkAutoAdjustSettlementClick(Sender: TObject);
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
  IQMS.Common.RegFrm,
  iqsys_rscstr;

{ TFrmIQSysMerchantPayFlo }

procedure TFrmIQSysMerchantPayFlo.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlCtrlsLeft]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCtrlsClient);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCtrlsClient);
end;

procedure TFrmIQSysMerchantPayFlo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlCtrlsLeft]);
end;

procedure TFrmIQSysMerchantPayFlo.AfterShow;
begin
  inherited;
  if edtUserName.CanFocus then edtUserName.SetFocus;
end;

procedure TFrmIQSysMerchantPayFlo.GetEncryptedValues;
var
   AValue: String;
   i: Integer;
begin
  inherited; // nothing
  DecryptToScreen(edtUserName,'LOGIN_NAME');
  DecryptToScreen(edtPassword,'PASSWORD');
  DecryptToScreen(edtPartner,'PARTNER');
  DecryptToScreen(edtVendor,'VENDOR');

{ Charge Method - matches item index
  Method                                Code
  ----------------------------------------------
  'Authorize and Settle separately'     '0'
  'Settle immediately'                  '1' }
  cmbChargeMethod.ItemIndex := FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger;

  // Processing Class - PayFloPro only supports Standard and Level 2
  case FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger of
   2: cmbProcessingClass.ItemIndex := 1;
   3: cmbProcessingClass.ItemIndex := 2;
  else cmbProcessingClass.ItemIndex := 0;
  end;

  // Can Change Settlement Amount
  chkChangeSettlement.Checked := FCreditCardParams.ChangeSettlement;
  // Automatically adjust settlement amount during
  // settlement process
  chkAutoAdjustSettlement.Checked := FCreditCardParams.AutoAdjustSettlement;
  // Test Account
  chkTestAccount.Checked := FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean;
  // Allow non-referenced credits
  chkAllowNonReferencedCredits.Checked := FCreditCardParams.ParamByName('NON_REF_CREDITS_ALLOWED').AsBoolean;

end;

procedure TFrmIQSysMerchantPayFlo.SetEncryptedValues;
var
   AValue: String;
   i: Integer;
begin
  // inherited; // nothing
  try
     FCreditCardParams.BeginUpdate;

     EncryptToTable(edtUserName,'LOGIN_NAME');
     EncryptToTable(edtPassword,'PASSWORD');
     EncryptToTable(edtPartner,'PARTNER');
     EncryptToTable(edtVendor,'VENDOR');

     // Processing Class - PayFloPro only supports Standard and Level 2
     case cmbProcessingClass.ItemIndex of
      1: FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 2;
      2: FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 3;
     else FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 0;
     end;

     // Charge Method - matches item index
     FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger := cmbChargeMethod.ItemIndex;

     // Currency Code
     FCreditCardParams.ParamByName('CURRENCY_CODE').AsString := 'USD';
     // Can Change Settlement Amount
     FCreditCardParams.ChangeSettlement := chkChangeSettlement.Checked;
     // Automatically adjust settlement amount during
     // settlement process
     FCreditCardParams.AutoAdjustSettlement := chkAutoAdjustSettlement.Checked;
     // Test Account
     FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean := chkTestAccount.Checked;
     // Allow non-referenced credits
     FCreditCardParams.ParamByName('NON_REF_CREDITS_ALLOWED').AsBoolean :=
       chkAllowNonReferencedCredits.Checked;
  finally
     FCreditCardParams.EndUpdate;
  end;
end;

procedure TFrmIQSysMerchantPayFlo.ValidateBeforeClose;
begin
  inherited;

  Assert(edtUserName.Text > '',
   Format(iqsys_rscstr.cTXT0000084 {'Please enter a value for %s'},
    [lblUserName.Caption]));

  Assert(edtPassword.Text > '',
   Format(iqsys_rscstr.cTXT0000084 {'Please enter a value for %s'},
    [lblPassword.Caption]));

  Assert(edtPartner.Text > '',
   Format(iqsys_rscstr.cTXT0000084 {'Please enter a value for %s'},
    [lblPartner.Caption]));

  Assert(edtVendor.Text > '',
   Format(iqsys_rscstr.cTXT0000084 {'Please enter a value for %s'},
    [lblVendor.Caption]));

end;

procedure TFrmIQSysMerchantPayFlo.chkChangeSettlementClick(Sender: TObject);
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

procedure TFrmIQSysMerchantPayFlo.chkAutoAdjustSettlementClick(Sender: TObject);
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
