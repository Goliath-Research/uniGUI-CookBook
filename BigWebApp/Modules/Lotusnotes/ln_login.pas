unit ln_login;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmLnLogin = class(TUniForm)
    PnlPrompt: TUniPanel;
    lblPrompt: TUniLabel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    lblPassword: TUniLabel;
    edtPassword: TUniEdit;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    chkSave: TUniCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
  end;

function LotusNotes_PromptPassword(var APassword: string): Boolean;

procedure LotusNotes_SavePasswordToRegistry(const APassword: string);
procedure LotusNotes_LoadPasswordFromRegistry(var APassword: string);
procedure LotusNotes_ClearPasswordFromRegistry;

const
  C_REGKEY_LOTUSNOTES_PASSWORD_VALUE = 'Lotus Notes Password';

var
  FrmLnLogin: TFrmLnLogin;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

{function LotusNotes_PromptPassword(AOwner: TComponent;
  var APassword: string): Boolean;
begin
  with TFrmLnLogin.Create(AOwner) do
    try
      Result := (ShowModal = mrOk) and (Trim(edtPassword.Text) > '');
      if Result then
        begin
          APassword := edtPassword.Text;
          if chkSave.Checked then
            LotusNotes_SavePasswordToRegistry(APassword);
        end;
    finally
      Free;
    end;
end;         }

function LotusNotes_PromptPassword(var APassword: string): Boolean;
var
  LFrmLnLogin : TFrmLnLogin;
begin
  LFrmLnLogin := TFrmLnLogin.Create(UniGUIApplication.UniApplication);
  Result := (LFrmLnLogin.ShowModal = mrOk) and (Trim(LFrmLnLogin.edtPassword.Text) > '');
  if Result then
  begin
    APassword := LFrmLnLogin.edtPassword.Text;
    if LFrmLnLogin.chkSave.Checked then
    LotusNotes_SavePasswordToRegistry(APassword);
  end;
end;

procedure LotusNotes_SavePasswordToRegistry(const APassword: string);
var
  APath, S: string;
begin
  S := CharXOR(APassword);
  IQMS.Common.RegFrm.IQRegStringScalarWrite(Application.MainForm,
    C_REGKEY_LOTUSNOTES_PASSWORD_VALUE, S);
end;

procedure LotusNotes_LoadPasswordFromRegistry(var APassword: string);
var
  S: string;
begin
  APassword := '';
  if IQMS.Common.RegFrm.IQRegStringScalarRead(Application.MainForm,
    C_REGKEY_LOTUSNOTES_PASSWORD_VALUE, S) then
    APassword := CharXOR(S);
end;

procedure LotusNotes_ClearPasswordFromRegistry;
begin
  LotusNotes_SavePasswordToRegistry('');
end;

{ TFrmLnLogin }
procedure TFrmLnLogin.FormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
  { TODO -oysingh -cWebConvert : Incompatible types: 'TForm' and 'TFrmLnLogin' }
  //IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlClient02);

  if Screen.Fonts.IndexOf('Symbol') >= 0 then
    with edtPassword do
      begin
        Font.Name := 'Symbol';
        Font.Size := 9;
        Font.Style := [fsBold];
        PasswordChar := #183; // bullet
      end;

end;

procedure TFrmLnLogin.FormActivate(Sender: TObject);
begin
  if Showing then
  try
    if edtPassword.CanFocus then
      edtPassword.SetFocus;
  except
  end;
end;

end.
