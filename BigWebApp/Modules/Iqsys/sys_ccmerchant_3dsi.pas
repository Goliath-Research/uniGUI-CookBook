unit sys_ccmerchant_3dsi;

interface

uses
  Winapi.Windows,
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
  IQMS.WebVcl.HPick, uniButton, uniBitBtn, System.Classes, Vcl.Controls;

type
  TFrmIQSysMerchant3DSI = class(TFrmIQSysMerchantBase)
    PnlCtrlsCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlCtrlsLeft: TUniPanel;
    PnlCtrlsClient: TUniPanel;
    Label87: TUniLabel;
    Label89: TUniLabel;
    Label1: TUniLabel;
    Label91: TUniLabel;
    lblProcessingClass: TUniLabel;
    edtLoginName: TUniEdit;
    edtPassword: TUniEdit;
    edtUserID: TUniEdit;
    cmbChargeMethod: TUniComboBox;
    cmbProcessingClass: TUniComboBox;
    chkTestAccount: TUniCheckBox;
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
  IQMS.Common.StringUtils;

{ TFrmIQSysMerchant3DSI }

procedure TFrmIQSysMerchant3DSI.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlCtrlsLeft]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCtrlsClient);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCtrlsClient);
end;

procedure TFrmIQSysMerchant3DSI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlCtrlsLeft]);
end;

procedure TFrmIQSysMerchant3DSI.AfterShow;
begin
  inherited;
  if edtLoginName.CanFocus then
    edtLoginName.SetFocus;
end;

procedure TFrmIQSysMerchant3DSI.GetEncryptedValues;
var
  AValue: String;
begin
  inherited; // nothing

  DecryptToScreen(edtLoginName, 'LOGIN_NAME');
  DecryptToScreen(edtPassword, 'PASSWORD');
  DecryptToScreen(edtUserID, 'USERID');

  { Charge Method - matches item index
    Method                                Code
    ----------------------------------------------
    'Authorize and Settle separately'     '0'
    'Settle immediately'                  '1' }
  cmbChargeMethod.ItemIndex := FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger;

  // Processing Class
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

end;

procedure TFrmIQSysMerchant3DSI.SetEncryptedValues;
begin
  // inherited;// nothing

  try
    FCreditCardParams.BeginUpdate;

    EncryptToTable(edtLoginName, 'LOGIN_NAME');
    EncryptToTable(edtPassword, 'PASSWORD');
    EncryptToTable(edtUserID, 'USERID');

    // Processing class
    case cmbProcessingClass.ItemIndex of
      1:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 2;
      2:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 3;
    else
      FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 0;
    end;

    // Charge Method - matches item index
    FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger := cmbChargeMethod.ItemIndex;

    // Test Account
    FCreditCardParams.ParamByName('TEST_ACCOUNT').AsBoolean := chkTestAccount.Checked;
  finally
    FCreditCardParams.EndUpdate;
  end;
end;

end.
