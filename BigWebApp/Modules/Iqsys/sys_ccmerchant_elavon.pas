unit sys_ccmerchant_elavon;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
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
  IQMS.WebVcl.HPick, uniButton, uniBitBtn, System.Classes;

type
  TFrmIQSysMerchantElavon = class(TFrmIQSysMerchantBase)
    PnlCtrlsCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlCtrlsLeft: TUniPanel;
    PnlCtrlsClient: TUniPanel;
    lblAccountID: TUniLabel;
    lblUserID: TUniLabel;
    lblPassword: TUniLabel;
    lblChargeMethod: TUniLabel;
    edtAccountID: TUniEdit;
    edtUserID: TUniEdit;
    edtPIN: TUniEdit;
    cmbChargeMethod: TUniComboBox;
    chkTestAccount: TUniCheckBox;
    procedure bbtnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

{ TFrmIQSysMerchantElavon }

procedure TFrmIQSysMerchantElavon.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlCtrlsLeft]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCtrlsClient);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCtrlsClient);
end;

procedure TFrmIQSysMerchantElavon.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlCtrlsLeft]);
end;

procedure TFrmIQSysMerchantElavon.AfterShow;
begin
  inherited;
  if edtAccountID.CanFocus then edtAccountID.SetFocus;
end;

procedure TFrmIQSysMerchantElavon.GetEncryptedValues;
begin
  inherited;


  DecryptToScreen(edtAccountID,'LOGIN_NAME');
  DecryptToScreen(edtUserID,'USERID');
  DecryptToScreen(edtPIN,'PASSWORD');

  // Charge Method (matches item index)
  // 10/03/2008 Elavon supports only Sale transactions.  We cannot settle
  //            MyVirtualMerchant transactions through XML.
  cmbChargeMethod.ItemIndex := 1; // FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger;
  IQMS.Common.Controls.IQEnableControl([lblChargeMethod, cmbChargeMethod],False);

  // Test Account
  chkTestAccount.Checked := FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean;
end;

procedure TFrmIQSysMerchantElavon.SetEncryptedValues;
begin
  try
     FCreditCardParams.BeginUpdate;

     EncryptToTable(edtAccountID,'LOGIN_NAME');
     EncryptToTable(edtUserID,'USERID');
     EncryptToTable(edtPIN,'PASSWORD');

     // Charge Method - matches item index
     // 10/03/2008 Elavon supports only Sale transactions.  We cannot settle
     //            MyVirtualMerchant transactions through XML.
     FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger := 1; // cmbChargeMethod.ItemIndex;

     // Currency Code
     FCreditCardParams.ParamByName('CURRENCY_CODE').AsString := 'USD'; //edtCurrencyCode.Text;

     // Test Account
     FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean := chkTestAccount.Checked;
  finally
     FCreditCardParams.EndUpdate;
  end;
end;

procedure TFrmIQSysMerchantElavon.bbtnOKClick(Sender: TObject);
begin
  if (Trim(edtAccountID.Text) = '') then
     raise Exception.Create(iqsys_rscstr.cTXT0000056 {'Please enter an Account ID.'});

  if (Trim(edtUserID.Text) = '') then
     raise Exception.Create(iqsys_rscstr.cTXT0000057 {'Please enter a User ID.'});

  if (Trim(edtPIN.Text) = '') then
     raise Exception.Create(iqsys_rscstr.cTXT0000058 {'Please enter a PIN number.'});

  inherited;

  ModalResult := mrOk;
end;

end.
