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
  uniGUIVars, MainModule, uniGUIApplication;

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
begin
  if EventName = 'success' then
  begin
    UniMainModule.UserFullName := Params.Values['Name'];
    UniMainModule.UserEmail    := Params.Values['Email'];
    UniMainModule.UserImageURL := Params.Values['ImageURL'];
    UniMainModule.UserIdToken  := Params.Values['Token'];
    ModalResult := mrOk;
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
