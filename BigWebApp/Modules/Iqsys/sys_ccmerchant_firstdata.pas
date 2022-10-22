unit sys_ccmerchant_firstdata;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
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
  IQMS.WebVcl.HPick;

type
  TFrmIQSysMerchantFirstData = class(TFrmIQSysMerchantBase)
    PnlCtrlsCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlCtrlsLeft: TUniPanel;
    lblMerchantID: TUniLabel;
    lblTerminalID: TUniLabel;
    lblGroupID: TUniLabel;
    lblChargeMethod: TUniLabel;
    PnlCtrlsClient: TUniPanel;
    edtMerchantID: TUniEdit;
    edtTerminalID: TUniEdit;
    edtGroupID: TUniEdit;
    cmbChargeMethod: TUniComboBox;
    chkTestAccount: TUniCheckBox;
    lblDatawireID: TUniLabel;
    edtDatawireID: TUniEdit;
    lblProcessingClass: TUniLabel;
    cmbProcessingClass: TUniComboBox;
    Label84: TUniLabel;
    edtCurrencyCode: TUniEdit;
    sbtnCurrencyCode: TUniSpeedButton;
    chkChangeSettlement: TUniCheckBox;
    chkAutoAdjustSettlement: TUniCheckBox;
    procedure UniFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOKClick(Sender: TObject);
    procedure sbtnCurrencyCodeClick(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
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

{ TFrmIQSysMerchantFirstData }

procedure TFrmIQSysMerchantFirstData.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlCtrlsLeft]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCtrlsClient);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCtrlsClient);
end;

procedure TFrmIQSysMerchantFirstData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlCtrlsLeft]);
  inherited;
end;

procedure TFrmIQSysMerchantFirstData.AfterShow;
begin
  inherited;
  if edtMerchantID.CanFocus then
    edtMerchantID.SetFocus;
end;

procedure TFrmIQSysMerchantFirstData.GetEncryptedValues;
begin
  inherited;

  DecryptToScreen(edtMerchantID, 'MERCHANT_ID');
  DecryptToScreen(edtTerminalID, 'TERMINAL_ID');
  DecryptToScreen(edtGroupID, 'GROUP_ID');
  DecryptToScreen(edtDatawireID, 'DATAWIRE_ID');

  cmbChargeMethod.ItemIndex := FCreditCardParams.ParamByName('TRANSACTION_TYPE')
    .AsInteger;

  edtCurrencyCode.Text := FCreditCardParams.ParamByName('CURRENCY_CODE').AsString;

  // Processing class
  case FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger of
    2:
      cmbProcessingClass.ItemIndex := 1;
    3:
      cmbProcessingClass.ItemIndex := 2;
  else
    cmbProcessingClass.ItemIndex := 0;
  end;

  // FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger;
  // Can Change Settlement Amount (07/06/2009)
  chkChangeSettlement.Checked := FCreditCardParams.ChangeSettlement;
  // Automatically adjust settlement amount during
  // settlement process (07/16/2009)
  chkAutoAdjustSettlement.Checked := FCreditCardParams.AutoAdjustSettlement;
  // Test Account
  chkTestAccount.Checked := FCreditCardParams.ParamByName('TEST_ACCOUNT')
    .AsBoolean;
end;

procedure TFrmIQSysMerchantFirstData.SetEncryptedValues;
begin
  try
    FCreditCardParams.BeginUpdate;

    EncryptToTable(edtMerchantID, 'MERCHANT_ID');
    EncryptToTable(edtTerminalID, 'TERMINAL_ID');
    EncryptToTable(edtGroupID, 'GROUP_ID');
    EncryptToTable(edtDatawireID, 'DATAWIRE_ID');

    // Charge Method - matches item index
    FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger :=
      cmbChargeMethod.ItemIndex;

    // Currency Code
    FCreditCardParams.ParamByName('CURRENCY_CODE').AsString :=
     edtCurrencyCode.Text;

    // Processing class
    case cmbProcessingClass.ItemIndex of
      1:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 2;
      2:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 3;
    else
      FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 0;
    end;

    // Can Change Settlement Amount (07/06/2009)
    FCreditCardParams.ChangeSettlement := chkChangeSettlement.Checked;
    // Automatically adjust settlement amount during
    // settlement process (07/16/2009)
    FCreditCardParams.AutoAdjustSettlement := chkAutoAdjustSettlement.Checked;
    // Test Account
    FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean :=
      chkTestAccount.Checked;
  finally
    FCreditCardParams.EndUpdate;
  end;
end;

procedure TFrmIQSysMerchantFirstData.bbtnOKClick(Sender: TObject);
begin
  if (Trim(edtMerchantID.Text) = '') then
    // iqsys_rscstr.cTXT0000112 = 'Please enter a Merchant ID';
    raise Exception.Create(iqsys_rscstr.cTXT0000112);

  if (Trim(edtTerminalID.Text) = '') then
    // iqsys_rscstr.cTXT0000113 = 'Please enter a Terminal ID';
    raise Exception.Create(iqsys_rscstr.cTXT0000113);

  if (Trim(edtGroupID.Text) = '') then
    // iqsys_rscstr.cTXT0000114 = 'Please enter a Group ID';
    raise Exception.Create(iqsys_rscstr.cTXT0000114);

  inherited;

  ModalResult := mrOk;
end;

procedure TFrmIQSysMerchantFirstData.sbtnCurrencyCodeClick(Sender: TObject);
begin
  // Select currency code
  if MultiCurrencyEnabled then
    begin
      with PkCurrencyCode do
        if Execute then
          edtCurrencyCode.Text := GetValue('DIGIT3');
    end
  else begin
      with PkCurrencyISO do
        if Execute then
          edtCurrencyCode.Text := GetValue('DIGIT3');
    end;
end;

end.
