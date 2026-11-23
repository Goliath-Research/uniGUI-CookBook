unit uniGUIApplication;

{ Session and cookie objects the sample reaches while handling login.
  They record calls and do not accept or reject an identity. }

interface

uses
  SysUtils, Classes;

type
  TUniCookies = class
  public
    function GetCookie(const Name: string): string;
    procedure SetCookie(const Name, Value: string; Expires: TDateTime);
  end;

  TUniGUISession = class
  public
    LastJS: string;
    procedure AddJS(const JS: string);
  end;

  TUniGUIApplication = class
  public
    Cookies: TUniCookies;
    UniMainModule: TObject;
    constructor Create;
    destructor Destroy; override;
  end;

function UniApplication: TUniGUIApplication;
function UniSession: TUniGUISession;
procedure SetUniApplication(App: TUniGUIApplication);

implementation

var
  GApp: TUniGUIApplication = nil;
  GSession: TUniGUISession = nil;

function UniApplication: TUniGUIApplication;
begin
  Result := GApp;
end;

function UniSession: TUniGUISession;
begin
  if GSession = nil then
    GSession := TUniGUISession.Create;
  Result := GSession;
end;

procedure SetUniApplication(App: TUniGUIApplication);
begin
  GApp := App;
end;

constructor TUniGUIApplication.Create;
begin
  inherited Create;
  Cookies := TUniCookies.Create;
end;

destructor TUniGUIApplication.Destroy;
begin
  Cookies.Free;
  inherited Destroy;
end;

function TUniCookies.GetCookie(const Name: string): string;
begin
  Result := '';
end;

procedure TUniCookies.SetCookie(const Name, Value: string; Expires: TDateTime);
begin
end;

procedure TUniGUISession.AddJS(const JS: string);
begin
  LastJS := JS;
end;

end.
