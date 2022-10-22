unit sys_ccadvanced;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Vcl.Buttons,
  cc_params,
  cc_types,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl, Vcl.ComCtrls;

type
  { TFrmSysCCAdvanced }
  TFrmSysCCAdvanced = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    pcMain: TUniPageControl;
    TabFirewall: TUniTabSheet;
    PnlFirewall: TUniPanel;
    Splitter12: TUniSplitter;
    PnlFirewallLeft: TUniPanel;
    lblFirewallHost: TUniLabel;
    lblFirewallPassword: TUniLabel;
    lblFirewallPort: TUniLabel;
    lblFirewallType: TUniLabel;
    lblFirewallUserName: TUniLabel;
    PnlFirewallClient: TUniPanel;
    dbeFirewallHost: TUniEdit;
    dbeFirewallPassword: TUniEdit;
    dbeFirewallUser: TUniEdit;
    TabGateway: TUniTabSheet;
    PnlURL: TUniPanel;
    Splitter1: TUniSplitter;
    PnlURLLeft: TUniPanel;
    PnlURLClient: TUniPanel;
    lblProductionURL: TUniLabel;
    lblProductionPort: TUniLabel;
    lblTestURL: TUniLabel;
    lblTestPort: TUniLabel;
    edtProductionURL: TUniEdit;
    edtProductionPort: TUniEdit;
    edtTestURL: TUniEdit;
    edtTestPort: TUniEdit;
    Panel3: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    TabGeneral: TUniTabSheet;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    edtTimeOut: TUniEdit;
    edtFirewallPort: TUniEdit;
    cmbFirewallType: TUniComboBox;
    chkUseFirewallSettings: TUniCheckBox;
    udTimeOut: TUpDown;
    procedure btnOkClick(Sender: TObject);
    procedure chkUseFirewallSettingsClick(Sender: TObject);
    procedure cmbFirewallTypeChange(Sender: TObject);
    procedure dbeFirewallHostChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    private
      { Private declarations }
      FCreditCardAccountID: Int64;
      FCreditCardParams: TCreditCardParams;
      procedure LoadFirewallTypeComboBox;
      procedure DoSetPort;
      procedure SetControls;
      procedure GetSettings;
      procedure SaveSettings;
    procedure SetCreditCardAccountID(const Value: Int64);

    public
      { Public declarations }
      property CreditCardAccountID: Int64 write SetCreditCardAccountID;
  end;

function AdvancedCreditCardOptions(const ACreditCardAccountID: Int64): Boolean;

implementation

{$R *.dfm}

uses
  cc_encrypt,
  IQMS.Common.Controls,
  IQMS.Common.RegFrm;

function AdvancedCreditCardOptions(const ACreditCardAccountID: Int64): Boolean;
var
  LFrmSysCCAdvanced : TFrmSysCCAdvanced;
begin
  LFrmSysCCAdvanced := TFrmSysCCAdvanced.Create(UniGUIApplication.UniApplication);
  LFrmSysCCAdvanced.CreditCardAccountID := ACreditCardAccountID;
  Result := LFrmSysCCAdvanced.ShowModal = mrOk;
end;

procedure TFrmSysCCAdvanced.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  FCreditCardParams := TCreditCardParams.Create(Self, FCreditCardAccountID);
end;

procedure TFrmSysCCAdvanced.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmSysCCAdvanced.dbeFirewallHostChange(Sender: TObject);
begin
  SetControls;
end;

procedure TFrmSysCCAdvanced.LoadFirewallTypeComboBox;
var
  o: TFirewallType;
begin
  { Note:  The Ord(TFirewallType) value is equivalent to the combo box
    item index. }
  cmbFirewallType.Items.Clear;
  for o := low(TFirewallType) to high(TFirewallType) do
    cmbFirewallType.Items.Add(FirewallTypeName[o]);
end;

procedure TFrmSysCCAdvanced.chkUseFirewallSettingsClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SetControls;
end;

procedure TFrmSysCCAdvanced.cmbFirewallTypeChange(Sender: TObject);
begin
  DoSetPort;
end;

procedure TFrmSysCCAdvanced.DoSetPort;
begin
  if cmbFirewallType.ItemIndex > - 1 then
    case TFirewallType(cmbFirewallType.ItemIndex) of
      frwProxy:
        edtFirewallPort.Text := '80';
      frwProxySOCKS4, frwProxySOCKS5:
        edtFirewallPort.Text := '1080';
    end;
end;

procedure TFrmSysCCAdvanced.GetSettings;
begin
  if not Assigned(FCreditCardParams) then
    Exit;
  udTimeOut.Position := FCreditCardParams.ParamByName('TIME_OUT').AsInteger;
  edtProductionURL.Text := FCreditCardParams.ParamByName
    ('PRODUCTION_URL').AsString;
  edtProductionPort.Text := FCreditCardParams.ParamByName
    ('PRODUCTION_PORT').AsString;
  edtTestURL.Text := FCreditCardParams.ParamByName('TEST_URL').AsString;
  edtTestPort.Text := FCreditCardParams.ParamByName('TEST_PORT').AsString;
  chkUseFirewallSettings.Checked := FCreditCardParams.ParamByName
    ('FIREWALL_DETECT').AsBoolean;
  dbeFirewallHost.Text := FCreditCardParams.ParamByName
    ('FIREWALL_HOST').AsString;
  edtFirewallPort.Text := FCreditCardParams.ParamByName
    ('FIREWALL_PORT').AsString;
  cmbFirewallType.ItemIndex := FCreditCardParams.ParamByName('FIREWALL_TYPE')
    .AsInteger;
  dbeFirewallUser.Text :=
    Trim(cc_encrypt.CCKeyDecrypt(FCreditCardParams.ParamByName('FIREWALL_USER')
    .AsString));
  dbeFirewallPassword.Text :=
    Trim(cc_encrypt.CCKeyDecrypt(FCreditCardParams.ParamByName
    ('FIREWALL_PASSWORD').AsString));
  SetControls;
end;

procedure TFrmSysCCAdvanced.SaveSettings;
begin
  if not Assigned(FCreditCardParams) then
    Exit;
  try
    FCreditCardParams.BeginUpdate;
    FCreditCardParams.ParamByName('TIME_OUT').AsInteger := udTimeOut.Position;
    FCreditCardParams.ParamByName('PRODUCTION_URL').AsString :=
      edtProductionURL.Text;
    FCreditCardParams.ParamByName('PRODUCTION_PORT').AsString :=
      edtProductionPort.Text;
    FCreditCardParams.ParamByName('TEST_URL').AsString := edtTestURL.Text;
    FCreditCardParams.ParamByName('TEST_PORT').AsString := edtTestPort.Text;
    FCreditCardParams.ParamByName('FIREWALL_DETECT').AsBoolean :=
      chkUseFirewallSettings.Checked;
    FCreditCardParams.ParamByName('FIREWALL_HOST').AsString :=
      dbeFirewallHost.Text;
    FCreditCardParams.ParamByName('FIREWALL_PORT').AsString :=
      edtFirewallPort.Text;
    FCreditCardParams.ParamByName('FIREWALL_TYPE').AsInteger :=
      cmbFirewallType.ItemIndex;
    FCreditCardParams.ParamByName('FIREWALL_USER').AsString :=
      cc_encrypt.CCKeyEncrypt(Trim(dbeFirewallUser.Text));
    FCreditCardParams.ParamByName('FIREWALL_PASSWORD').AsString :=
      cc_encrypt.CCKeyEncrypt(Trim(dbeFirewallPassword.Text));
  finally
    FCreditCardParams.EndUpdate;
  end;
end;

procedure TFrmSysCCAdvanced.SetControls;
begin
  // Firewall controls
  IQMS.Common.Controls.IQEnableControl([lblFirewallHost, dbeFirewallHost, lblFirewallPort,
    edtFirewallPort, lblFirewallType, cmbFirewallType, lblFirewallUserName,
    dbeFirewallUser, lblFirewallPassword, dbeFirewallPassword],
    chkUseFirewallSettings.Checked);
  IQMS.Common.Controls.IQEnableControl([lblFirewallUserName, dbeFirewallUser,
    lblFirewallPassword, dbeFirewallPassword],
    chkUseFirewallSettings.Checked and
    (Length(Trim(dbeFirewallHost.Text)) > 0));
end;

procedure TFrmSysCCAdvanced.SetCreditCardAccountID(const Value: Int64);
begin
  FCreditCardAccountID := Value;
end;

procedure TFrmSysCCAdvanced.UniFormCreate(Sender: TObject);
begin
  // 06/20/2012 Update the package encryption keys so that
  // we can see data.
  cc_encrypt.ResetPackage;
  LoadFirewallTypeComboBox;
  GetSettings;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlURLClient);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlFirewallClient);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlFirewallClient);
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlURLLeft, PnlFirewallLeft]);
  pcMain.ActivePageIndex := 0;
{ TODO -oGPatil -cWebConvert :  Incompatible types: 'TCustomEdit' and 'TUniEdit'
  IQMS.Common.Controls.SetPasswordCharBullet(dbeFirewallPassword);  }
end;

procedure TFrmSysCCAdvanced.btnOkClick(Sender: TObject);
begin
  SaveSettings;
  ModalResult := mrOk;
end;

end.
