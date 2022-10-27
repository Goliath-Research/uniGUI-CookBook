unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes;

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

    procedure SetUserIdToken(const Value : string);
  public

    function  LoggedIn : boolean;
    procedure Logout;

    property UserFullName : string read FUserFullName write FUserFullName;
    property UserEmail    : string read FUserEmail    write FUserEmail;
    property UserImageURL : string read FUserImageURL write FUserImageURL;
    property UserIdToken  : string read FUserIdToken  write SetUserIdToken;
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

procedure TUniMainModule.Logout;
begin
  UserFullName := '';
  UserEmail    := '';
  UserImageURL := '';
  UserIdToken  := '';
end;

procedure TUniMainModule.SetUserIdToken(const Value: string);
begin
  FUserIdToken := Value;
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
