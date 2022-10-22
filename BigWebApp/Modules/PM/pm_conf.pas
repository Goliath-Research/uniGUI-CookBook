unit pm_conf;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.Confbas,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniLabel, uniCheckBox,UniGUIApplication;

type
  TFrmPMConf = class(TIQDialogCheckBox)
    lblPrompt: TUniLabel;
    PnlButtonsRight: TUniPanel;
    btnYes: TUniBitBtn;
    btnNo: TUniBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FShowCheckBox: Boolean;
    procedure AssignText(S: string); override;
    procedure SetShowCheckBox(const Value: Boolean);
    procedure SetKey(const Value: String);
  public
    { Public declarations }
    property ShowCheckBox : Boolean write SetShowCheckBox;
    property Key : String write SetKey;
  end;

function DoPMConfirmYN(AKey: string;
  AShowCheckBox: Boolean = True): Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm;

{ TFrmPMConf }

function DoPMConfirmYN(AKey: string; AShowCheckBox: Boolean): Boolean;
var
  LFrmPMConf : TFrmPMConf;
begin
  LFrmPMConf := TFrmPMConf.Create(UniGUIApplication.UniApplication);
  LFrmPMConf.Key := AKey;
  LFrmPMConf.ShowCheckBox := AShowCheckBox;
  if AShowCheckBox and LFrmPMConf.CheckBox.Checked and LFrmPMConf.SR.Enabled['btnYes'] then
    Result := True
  else
    Result := LFrmPMConf.ShowModal = mrOk;
end;

procedure TFrmPMConf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FShowCheckBox then
    IQRegFormWrite(Self, [CheckBox]);
  inherited;
end;

procedure TFrmPMConf.SetKey(const Value: String);
begin
  if Length(Value) > 35 then
    IQMS.Common.Dialogs.IQWarning('Application Warning:  Registry key value length is too ' +
      'long.  Values must be 35 characters or less.');

  CheckBox.Visible := FShowCheckBox;
  if not FShowCheckBox then
    SR.RemoveSecurityItem('CheckBox');

  // if the user does not have rights to click the Yes button,
  // then he doesn't have rights to check the check box.
  if not SR.Enabled['btnYes'] then
  begin
    CheckBox.Checked := FALSE;
    CheckBox.Enabled := FALSE;
  end;

  if FShowCheckBox then
    IQRegFormRead(Self, [CheckBox]);

  if Value > '' then
  begin
    SR.SecurityCode := UpperCase(Value);
    SR.ForceAccessItems.Add(Value);
    SR.Refresh;
  end;
end;

procedure TFrmPMConf.SetShowCheckBox(const Value: Boolean);
begin
  FShowCheckBox := Value;
end;

procedure TFrmPMConf.AssignText(S: string);
begin
  lblPrompt.Caption := S;
  lblPrompt.Update;
end;

end.
