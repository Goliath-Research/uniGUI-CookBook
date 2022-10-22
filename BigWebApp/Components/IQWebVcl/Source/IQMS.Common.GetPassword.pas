unit IQMS.Common.GetPassword;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmSystemPassword = class(TUniForm)
    lblPrompt: TUniLabel;
    dbaseElecSign: TFDConnection;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    edtPassword: TUniEdit;
    procedure edtPasswordChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    function GetPassword: string;
    function GetPromptText: string;
    procedure SetPromptText(const Value: string);
  protected
    { Protected declarations }
    procedure SetButtons; virtual;
    procedure Validate; virtual;
  public
    { Public declarations }
    class function RequestValidateSystemPassword: Boolean;
    class function PromptPassword(var APassword: string): Boolean;
    class function PromptPasswordEx(
      const ACaption: string;
      const APrompt: string;
       var APassword: string): Boolean;
    property Password: string read GetPassword;
    property PromptText: string read GetPromptText write SetPromptText;
  end;

function GetIQSysPassword(var APassword: string): Boolean;
function GetIQSysPasswordEx(
  const ACaption: string;
  const APrompt: string;
  var APassword: string): Boolean;


implementation

{$R *.DFM}

uses
//  IQ_Login,
  IQMS.Common.Controls,
  IQMS.Common.ResStrings;


function GetIQSysPassword(var APassword: string): Boolean;
begin
  Result := TFrmSystemPassword.PromptPassword(APassword);
end;

function GetIQSysPasswordEx(const ACaption, APrompt: string;
  var APassword: string): Boolean;
begin
  Result := TFrmSystemPassword.PromptPasswordEx(
    ACaption,
    APrompt,
    APassword);
end;

{ TFrmSystemPassword }

class function TFrmSystemPassword.PromptPassword(var APassword: string): Boolean;
begin
  APassword := '';
  with Self.Create(uniGUIApplication.UniApplication) do
  try
    Result:= ShowModal = mrOK;
    if Result then
       APassword := Password;
  finally
    Release;
  end;
end;

class function TFrmSystemPassword.PromptPasswordEx(const ACaption,
  APrompt: string; var APassword: string): Boolean;
begin
  APassword := '';
  with Self.Create(uniGUIApplication.UniApplication) do
  try
    Caption := ACaption;
    PromptText := APrompt;
    Result:= ShowModal = mrOK;
    if Result then
       APassword := Password;
  finally
    Release;
  end;
end;

procedure TFrmSystemPassword.FormCreate(Sender: TObject);
begin
  dbaseElecSign.Params.Clear;
//  dbaseElecSign.Params.Text := MainModule.FDConnection.Params.Text;
end;

procedure TFrmSystemPassword.FormShow(Sender: TObject);
begin
//  IQMS.Common.Controls.CenterForm(Self, True);
  SetButtons;
end;

class function TFrmSystemPassword.RequestValidateSystemPassword: Boolean;
begin
  with self.Create(uniGUIApplication.UniApplication) do
  try
    Result:= (ShowModal = mrOK) and
             not String.IsNullOrWhiteSpace(Password)
//             and SilentLogOntoEx( dbaseElecSign,
//                              'IQMS',
//                              Password,
//                              FALSE,             // RaiseExceptionOnCheckLogin
//                              FALSE );           // ARebuildSecurityManager
  finally
    Release;
  end;
end;

procedure TFrmSystemPassword.btnOkClick(Sender: TObject);
begin
  Validate;
  ModalResult := mrOk;
end;

procedure TFrmSystemPassword.edtPasswordChange(Sender: TObject);
begin
  SetButtons;
end;

function TFrmSystemPassword.GetPassword: string;
begin
  Result := Trim(edtPassword.Text);
end;

procedure TFrmSystemPassword.SetButtons;
begin
  btnOK.Enabled := not string.IsNullOrWhiteSpace(Password);
end;

function TFrmSystemPassword.GetPromptText: string;
begin
  Result := lblPrompt.Caption;
end;

procedure TFrmSystemPassword.SetPromptText(const Value: string);
begin
  lblPrompt.Caption := Value;
end;

procedure TFrmSystemPassword.Validate;
begin
  if string.IsNullOrWhiteSpace(Password) then
    // IQMS.Common.ResStrings.cTXT0000544 = 'Please enter a password.';
    raise Exception.Create(IQMS.Common.ResStrings.cTXT0000544);
end;

end.
