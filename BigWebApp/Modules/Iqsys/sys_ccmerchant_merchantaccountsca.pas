unit sys_ccmerchant_merchantaccountsca;

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
  TFrmIQSysMerchantMerchantAccountsCa = class(TFrmIQSysMerchantBase)
    PnlCtrlsCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlCtrlsLeft: TUniPanel;
    lblLoginName: TUniLabel;
    lblPassword: TUniLabel;
    Label91: TUniLabel;
    lblProcessingClass: TUniLabel;
    lblCurrencyCode: TUniLabel;
    PnlCtrlsClient: TUniPanel;
    edtLoginName: TUniEdit;
    edtPassword: TUniEdit;
    cmbChargeMethod: TUniComboBox;
    chkChangeSettlement: TUniCheckBox;
    chkAutoAdjustSettlement: TUniCheckBox;
    cmbProcessingClass: TUniComboBox;
    chkTestAccount: TUniCheckBox;
    cmbCurrency: TUniComboBox;
    procedure UniFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkAutoAdjustSettlementClick(Sender: TObject);
    procedure chkChangeSettlementClick(Sender: TObject);
    private
      { Private declarations }
      function GetCurrencyCode: string;
      procedure SetCurrencyCode(Value: string);
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
  IQMS.Common.StringUtils,
  iqsys_rscstr;

{ TFrmIQSysMerchantMerchantAccountsCa }

procedure TFrmIQSysMerchantMerchantAccountsCa.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlCtrlsLeft]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCtrlsClient);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCtrlsClient);
end;

procedure TFrmIQSysMerchantMerchantAccountsCa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlCtrlsLeft]);
end;

procedure TFrmIQSysMerchantMerchantAccountsCa.AfterShow;
begin
  inherited;
  if edtLoginName.CanFocus then
    edtLoginName.SetFocus;
end;

procedure TFrmIQSysMerchantMerchantAccountsCa.GetEncryptedValues;
begin

  inherited; // nothing

  DecryptToScreen(edtLoginName, 'LOGIN_NAME');
  DecryptToScreen(edtPassword, 'PASSWORD');

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
  SetCurrencyCode(FCreditCardParams.ParamByName('CURRENCY_CODE').AsString);

  // Charge Method (matches item index)
  cmbChargeMethod.ItemIndex := FCreditCardParams.ParamByName('TRANSACTION_TYPE')
    .AsInteger;
  // Can Change Settlement Amount (07/06/2009)
  chkChangeSettlement.Checked := FCreditCardParams.ChangeSettlement;
  // Automatically adjust settlement amount during
  // settlement process (07/16/2009)
  chkAutoAdjustSettlement.Checked := FCreditCardParams.AutoAdjustSettlement;

  // Test Account
  chkTestAccount.Checked := FCreditCardParams.ParamByName('TEST_ACCOUNT')
    .AsBoolean;

end;

procedure TFrmIQSysMerchantMerchantAccountsCa.SetEncryptedValues;
begin

  inherited; // nothing

  try
    FCreditCardParams.BeginUpdate;

    EncryptToTable(edtLoginName, 'LOGIN_NAME');
    EncryptToTable(edtPassword, 'PASSWORD');

    // Processing class
    // 02/16/2011 Authorize.Net does not support Level 3 processing, so
    // we always just default to Level 2 processing.
    case cmbProcessingClass.ItemIndex of
      1:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 2;
      2:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 2;
    else
      FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 0;
    end;

    // Charge Method - matches item index
    FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger :=
      cmbChargeMethod.ItemIndex;
    // Can Change Settlement Amount (07/06/2009)
    FCreditCardParams.ChangeSettlement := chkChangeSettlement.Checked;
    // Automatically adjust settlement amount during
    // settlement process (07/16/2009)
    FCreditCardParams.AutoAdjustSettlement := chkAutoAdjustSettlement.Checked;

    // Currency Code
    FCreditCardParams.ParamByName('CURRENCY_CODE').AsString := GetCurrencyCode;

    // Test Account
    FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean :=
      chkTestAccount.Checked;
  finally
    FCreditCardParams.EndUpdate;
  end;
end;

procedure TFrmIQSysMerchantMerchantAccountsCa.ValidateBeforeClose;
begin
  inherited;

  Assert(edtLoginName.Text > '',
    Format(iqsys_rscstr.cTXT0000084 { 'Please enter a value for %s' } ,
    [lblLoginName.Caption]));

  Assert(edtPassword.Text > '',
    Format(iqsys_rscstr.cTXT0000084 { 'Please enter a value for %s' } ,
    [lblPassword.Caption]));

  WarnInvalidCurrencyCode(GetCurrencyCode);

end;

procedure TFrmIQSysMerchantMerchantAccountsCa.chkChangeSettlementClick
  (Sender: TObject);
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
      chkAutoAdjustSettlement.OnClick := nil;
      chkAutoAdjustSettlement.Checked := False;
    finally
      chkAutoAdjustSettlement.OnClick := ev;
    end;
end;

procedure TFrmIQSysMerchantMerchantAccountsCa.chkAutoAdjustSettlementClick
  (Sender: TObject);
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
      chkChangeSettlement.OnClick := nil;
      chkChangeSettlement.Checked := False;
    finally
      chkChangeSettlement.OnClick := ev;
    end;
end;

function TFrmIQSysMerchantMerchantAccountsCa.GetCurrencyCode: string;
begin
  case cmbCurrency.ItemIndex of
    1:
      Result := 'USD';
  else
    Result := 'CAD';
  end;
end;

procedure TFrmIQSysMerchantMerchantAccountsCa.SetCurrencyCode(Value: string);
var
  AIndex: Integer;
begin
  try
    // Get the item index
    AIndex := IQMS.Common.StringUtils.CaseOfStr(Value, ['CAD', 'USD']);

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

end.
