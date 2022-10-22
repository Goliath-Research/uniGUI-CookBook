unit Emailpwd;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  //ChangPsw,
  UniGuiApplication,
  MainModule, IQMS.Common.ChangePassword, IQMS.WebVcl.SecurityRegister,
  uniGUIClasses, uniEdit, uniLabel, uniButton, System.Classes,
  uniGUIBaseClasses, uniPanel;

type
  TFrmChangeEMailPassword = class(TFrmChangePassword)
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoGetNewEMailPassword( var ANewPassword: string ):Boolean;

implementation
{$R *.DFM}

function DoGetNewEMailPassword( var ANewPassword: string ):Boolean;
begin
  with TFrmChangeEMailPassword.Create(UniGuiApplication.UniApplication) do
  begin
    Result:= ShowModal = mrOK;
    if Result then
       ANewPassword:= edNew.Text;
  end;
end;


procedure TFrmChangeEMailPassword.FormCreate(Sender: TObject);
begin
//
end;

procedure TFrmChangeEMailPassword.btnOKClick(Sender: TObject);
begin
  ConfirmPasswordChange;
  ModalResult:= mrOK;
end;

end.
