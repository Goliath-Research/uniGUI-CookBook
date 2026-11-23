unit GoogleLoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  uniHTMLFrame, uniURLFrame;

type
  TUniGoogleLoginForm = class(TUniLoginForm)
    UniHTMLFrame1: TUniHTMLFrame;
    procedure UniLoginFormAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure UniLoginFormBeforeShow(Sender: TObject);
  private
    procedure Logout;
  public
    { Public declarations }
  end;

function UniGoogleLoginForm: TUniGoogleLoginForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, GoogleIdToken;

const
  { Must match the google-signin-client_id meta tag in GoogleLoginForm.dfm. }
  GoogleClientId = '679905286098-4der25sucnu0lkhlgiipuul48m0gp979.apps.googleusercontent.com';

function UniGoogleLoginForm: TUniGoogleLoginForm;
begin
  Result := TUniGoogleLoginForm(UniMainModule.GetFormInstance(TUniGoogleLoginForm));
end;

procedure TUniGoogleLoginForm.Logout;
begin
  UniSession.AddJS('gapi.auth2.getAuthInstance().signOut();');
end;

procedure TUniGoogleLoginForm.UniLoginFormAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
var
  Identity: TGoogleIdentity;
begin
  if EventName = 'success' then
  begin
    if VerifyGoogleIdToken(Params.Values['Token'], GoogleClientId, Identity) then
    begin
      UniMainModule.SignIn(Identity);
      ModalResult := mrOk;
    end
    else
      ShowMessage('Google sign-in could not be verified.');
  end;
  if EventName = 'failure' then
  begin
    ShowMessage('Error: ' + Params.Values['Error']);
    ModalResult := mrCancel;
  end;
end;

procedure TUniGoogleLoginForm.UniLoginFormBeforeShow(Sender: TObject);
begin
  if uniGUIApplication.UniApplication.Cookies.GetCookie('logout') <> '' then
    Logout;
end;

initialization
  RegisterAppFormClass(TUniGoogleLoginForm);

end.
