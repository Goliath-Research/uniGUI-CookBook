unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, GoogleIdToken;

type
  TUniMainModule = class(TUniGUIMainModule)
    procedure UniGUIMainModuleBrowserClose(Sender: TObject);
  strict private
    procedure LeaveLogoutCookie;
  private
    FUserFullName : string;
    FUserEmail    : string;
    FUserImageURL : string;
    FUserIdToken  : string;
  public

    function  LoggedIn : boolean;
    procedure SignIn(const Identity : TGoogleIdentity);
    procedure Logout;

    property UserFullName : string read FUserFullName;
    property UserEmail    : string read FUserEmail;
    property UserImageURL : string read FUserImageURL;
    property UserIdToken  : string read FUserIdToken;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

{ TUniMainModule }

procedure TUniMainModule.LeaveLogoutCookie;
begin
  uniGUIApplication.UniApplication.Cookies.SetCookie('logout', '!', Date + 365.0);
end;

function TUniMainModule.LoggedIn: boolean;
begin
  LoggedIn := FUserIdToken <> '';
end;

{ Identity must come from VerifyGoogleIdToken, never from request parameters. }
procedure TUniMainModule.SignIn(const Identity: TGoogleIdentity);
begin
  FUserFullName := Identity.FullName;
  FUserEmail    := Identity.Email;
  FUserImageURL := Identity.ImageURL;
  FUserIdToken  := Identity.IdToken;
end;

procedure TUniMainModule.Logout;
begin
  FUserFullName := '';
  FUserEmail    := '';
  FUserImageURL := '';
  FUserIdToken  := '';
end;

procedure TUniMainModule.UniGUIMainModuleBrowserClose(Sender: TObject);
begin
  if LoggedIn then
  begin
    Logout;
    LeaveLogoutCookie;
  end;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
