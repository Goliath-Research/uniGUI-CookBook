unit ADLoginDM;

interface

uses
  SysUtils, Classes, ipwcore, ipwldap;

type

  // https://www.nsoftware.com/kb/articles/ldap.rst
  // This DM will be privately used by two services:
  //   1) Login against a common LDAP Server
  //   2) Login against an Active Directory LDAP Server

  TADLogin = class(TDataModule)
    ldap1: TipwLDAP;
    procedure ldap1SearchResult(Sender: TObject; MessageId: Integer;
      const DN: string);
  private
    FSearchResultDN : string;

  public

    function Login(aUserName, aPassword, aServer : string) : boolean;
  end;

implementation

{$R *.dfm}

{ TADLogin }

procedure TADLogin.ldap1SearchResult(Sender: TObject; MessageId: Integer;
  const DN: string);
begin
  FSearchResultDN := DN;
end;

function TADLogin.Login(aUserName, aPassword, aServer: string): boolean;
begin
  Result := false;

  // Search the user

  ldap1.ServerName := aServer;
  ldap1.DN         := 'CN=Users,DC=Server';
  ldap1.Timeout    := 10; // a timeout > 0 will make the component behave synchronously

  FSearchResultDN  := '';
  ldap1.Search('sAMAccountName=' + aUserName);

  if FSearchResultDN = '' then
    Exit;

  // User was found, check the password

  ldap1.DN         := FSearchResultDN;
  ldap1.Password   := aPassword;
  ldap1.Bind();

  Result := ldap1.ResultCode = 0;
end;

end.
