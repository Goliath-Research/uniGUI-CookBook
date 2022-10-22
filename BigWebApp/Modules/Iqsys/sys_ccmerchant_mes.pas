unit sys_ccmerchant_mes;

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
  uniScrollBox,
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
  TFrmIQSysMerchantMES = class(TFrmIQSysMerchantBase)
    ScrollBox1: TUniScrollBox;
    PnlCaption_General: TUniPanel;
    lblMerchantPrompt: TUniLabel;
    Bevel1: TUniPanel;
    PnlMerchant: TUniPanel;
    Splitter2: TUniSplitter;
    PnlMerchantLeft: TUniPanel;
    PnlMerchantClient: TUniPanel;
    PnlCaption_Options: TUniPanel;
    Label7: TUniLabel;
    Bevel4: TUniPanel;
    PnlOption: TUniPanel;
    Label89: TUniLabel;
    chkChangeSettlement: TUniCheckBox;
    chkAutoAdjustSettlement: TUniCheckBox;
    chkTestAccount: TUniCheckBox;
    edtMerchantName: TUniEdit;
    Label87: TUniLabel;
    edtProfileID: TUniEdit;
    Label90: TUniLabel;
    edtProfileKey: TUniEdit;
    lblProcessingClass: TUniLabel;
    cmbProcessingClass: TUniComboBox;
    Label91: TUniLabel;
    cmbChargeMethod: TUniComboBox;
    procedure chkChangeSettlementClick(Sender: TObject);
    procedure chkAutoAdjustSettlementClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbProcessingClassCloseUp(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    private
      { Private declarations }
      procedure SetControls;
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
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  iqsys_rscstr;

{ TFrmIQSysMerchantVital }

procedure TFrmIQSysMerchantMES.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlMerchantLeft]);
end;

procedure TFrmIQSysMerchantMES.AfterShow;
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlMerchantLeft]);
//  ScrollBox1.VertScrollBar.Position := 0;
  if Self.Showing and edtMerchantName.CanFocus then
    edtMerchantName.SetFocus;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlMerchantClient);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlOption);
  SetControls;
end;

procedure TFrmIQSysMerchantMES.GetEncryptedValues;
var
  AValue: string;
  i: Integer;
begin
  // inherited;// nothing
  DecryptToScreen(edtMerchantName, 'MERCHANT_NAME');
  DecryptToScreen(edtProfileID, 'PROFILE_ID');
  DecryptToScreen(edtProfileKey, 'PROFILE_KEY');
  // Processing class
  case FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger of
    2:
      cmbProcessingClass.ItemIndex := 1;
    3:
      cmbProcessingClass.ItemIndex := 2;
  else
    cmbProcessingClass.ItemIndex := 0;
  end;
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

procedure TFrmIQSysMerchantMES.SetEncryptedValues;
var
  AValue: string;
  i: Integer;
begin
  // inherited;// nothing
  try
    FCreditCardParams.BeginUpdate;
    EncryptToTable(edtMerchantName, 'MERCHANT_NAME');
    EncryptToTable(edtProfileID, 'PROFILE_ID');
    EncryptToTable(edtProfileKey, 'PROFILE_KEY');
    // Processing class
    case cmbProcessingClass.ItemIndex of
      1:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 2;
      2:
        FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 3;
    else
      FCreditCardParams.ParamByName('PROCESSING_CLASS').AsInteger := 0;
    end;
    // Charge Method (matches item index)
    FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger :=
      cmbChargeMethod.ItemIndex;
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

procedure TFrmIQSysMerchantMES.UniFormCreate(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmIQSysMerchantMES.ValidateBeforeClose;
begin
  inherited;
  // iqsys_rscstr.cTXT0000102 = 'Please enter Merchant Name.';
  IQAssert(edtMerchantName.Text > '', iqsys_rscstr.cTXT0000102);
  // iqsys_rscstr.cTXT0000103 = 'Please enter a Profile ID.';
  IQAssert(edtProfileID.Text > '', iqsys_rscstr.cTXT0000103);
  // iqsys_rscstr.cTXT0000104 = 'Please enter a Profile Key.';
  IQAssert(edtProfileKey.Text > '', iqsys_rscstr.cTXT0000104);
end;

procedure TFrmIQSysMerchantMES.chkChangeSettlementClick(Sender: TObject);
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

procedure TFrmIQSysMerchantMES.cmbProcessingClassCloseUp(Sender: TObject);
begin
  SetControls;
end;

procedure TFrmIQSysMerchantMES.chkAutoAdjustSettlementClick(Sender: TObject);
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

procedure TFrmIQSysMerchantMES.SetControls;
begin
  // For MES, if the processing class is Level II or Level III,
  // then they do not support AuthOnly.  It must be a Sale.
  IQEnableControl(cmbChargeMethod, True);
{  if (cmbProcessingClass.ItemIndex in [1, 2]) then
   begin
     cmbChargeMethod.ItemIndex := 1;
     IQEnableControl(cmbChargeMethod, False);
   end; }
end;

end.
