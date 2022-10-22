unit sys_ccmerchant_moneris;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  sys_ccmerchant_base,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.CaptionPanel,
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
  TFrmIQSysMerchantMoneris = class(TFrmIQSysMerchantBase)
    PnlCtrlsCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlCtrlsLeft: TUniPanel;
    PnlCtrlsClient: TUniPanel;
    lblUserID: TUniLabel;
    lblKey: TUniLabel;
    Label77: TUniLabel;
    lblProcessingClass: TUniLabel;
    edtLoginName: TUniEdit;
    edtPassword: TUniEdit;
    cmbLanguageCode: TUniComboBox;
    cmbProcessingClass: TUniComboBox;
    chkTestAccount: TUniCheckBox;
    CaptionPanel1: TIQWebCaptionPanel;
    procedure UniFormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FCurrCode: String;
  protected
    { Protected declarations }
    procedure ValidateBeforeClose; override;
    procedure GetEncryptedValues; override;
    procedure SetEncryptedValues; override;
    procedure AfterShow; override;
    procedure SetCurrCode(const Value:string);
  public
    { Public declarations }
    property CurrCode : string read FCurrCode write SetCurrCode;
  end;

//  procedure DoConfigMonerisMerchantAccount_USA(AOwner: TComponent;
//   ACreditCardAccountID: Real);
//  procedure DoConfigMonerisMerchantAccount_Canada(AOwner: TComponent;
//   ACreditCardAccountID: Real);

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

//procedure DoConfigMonerisMerchantAccount_USA(AOwner: TComponent;
// ACreditCardAccountID: Real);
//begin
//  TFrmIQSysMerchantMoneris.Create(AOwner, ACreditCardAccountID, 'USD').ShowModal;
//end;
//
//procedure DoConfigMonerisMerchantAccount_Canada(AOwner: TComponent;
// ACreditCardAccountID: Real);
//begin
//  TFrmIQSysMerchantMoneris.Create(AOwner, ACreditCardAccountID, 'CAD').ShowModal;
//end;


procedure TFrmIQSysMerchantMoneris.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlCtrlsLeft]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCtrlsClient);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCtrlsClient);
end;

procedure TFrmIQSysMerchantMoneris.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlCtrlsLeft]);
end;

procedure TFrmIQSysMerchantMoneris.AfterShow;
begin
  inherited;
  if edtLoginName.CanFocus then edtLoginName.SetFocus;
end;

procedure TFrmIQSysMerchantMoneris.GetEncryptedValues;
var
   AValue: String;
   i: Integer;
begin
  inherited;// nothing

  DecryptToScreen(edtLoginName,'LOGIN_NAME');
  DecryptToScreen(edtPassword,'PASSWORD');

  // Language Code value.  The value is technically a string ('01,'02',...),
  // but we convert it to an integer here for the combo box.  It will match
  // the combo box item index.  Beyond that, however, we want to store it
  // as a 2-character string.
  AValue := FCreditCardParams.ParamByName('LANGUAGE_CODE').AsString;
  if cmbLanguageCode.Items.IndexOf(AValue) > -1 then
    cmbLanguageCode.Text := AValue
  else cmbLanguageCode.ItemIndex := 0;

  // Processing Class
  // Moneris does not support Level 2/3 through direct post.
  cmbProcessingClass.ItemIndex := 0;
  IQMS.Common.Controls.IQEnableControl(cmbProcessingClass, False);
  {case FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger of
   2: cmbProcessingClass.ItemIndex := 1;
   3: cmbProcessingClass.ItemIndex := 2;
  else cmbProcessingClass.ItemIndex := 0;
  end;}

  // Test Account
  chkTestAccount.Checked := FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean;

end;

procedure TFrmIQSysMerchantMoneris.SetCurrCode(const Value: string);
begin
  FCurrCode := Value;
end;

procedure TFrmIQSysMerchantMoneris.SetEncryptedValues;
var
   AValue: String;
   i: Integer;
begin

  // inherited;// nothing

  try
     FCreditCardParams.BeginUpdate;

     EncryptToTable(edtLoginName,'LOGIN_NAME');
     EncryptToTable(edtPassword,'PASSWORD');
     FCreditCardParams.ParamByName('LANGUAGE_CODE').AsString := cmbLanguageCode.Text;
     // Processing class
     FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 0;
     {case cmbProcessingClass.ItemIndex of
      1: FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 2;
      2: FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 3;
     else FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 0;
     end;}

     // Charge Method - matches item index
     // Moneris always settles immediately.
     FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger := 1;

     // Test Account
     FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean := chkTestAccount.Checked;
  finally
     FCreditCardParams.EndUpdate;
  end;
end;

procedure TFrmIQSysMerchantMoneris.ValidateBeforeClose;
begin
  inherited;
end;

end.
