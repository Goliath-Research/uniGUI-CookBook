unit FirewallRules;

interface

  procedure OpenFirewallPort(Caption: string; APort: word);
  procedure OpenFirewallApp (Caption, AppPath: string; Port : word = 0);

implementation

// http://stackoverflow.com/questions/20066467/how-to-open-port-in-win7-firewall-using-delphi
// Code attached to SYST-431 Setup_Apache11gR2
// http://www.delphifeeds.com/go/s/110292
// https://msdn.microsoft.com/en-us/library/windows/desktop/ff956128(v=vs.85).aspx

uses
  SysUtils,
  ActiveX,
  ComObj,
  Variants,
  Windows;

procedure AddPortToFirewallXP(const Caption:string; Port: Word);
const
  NET_FW_PROFILE_DOMAIN     = 0;
  NET_FW_PROFILE_STANDARD   = 1;
  NET_FW_IP_VERSION_ANY     = 2;
  NET_FW_IP_PROTOCOL_UDP    = 17;
  NET_FW_IP_PROTOCOL_TCP    = 6;
  NET_FW_SCOPE_ALL          = 0;
  NET_FW_SCOPE_LOCAL_SUBNET = 1;
var
  fwMgr,rule: OleVariant;
  profile:OleVariant;
begin
  fwMgr := CreateOLEObject('HNetCfg.FwMgr');
  profile       := fwMgr.LocalPolicy.CurrentProfile;
  rule          := CreateOLEObject('HNetCfg.FWOpenPort');
  rule.Name     := Caption;
  rule.Protocol := NET_FW_IP_PROTOCOL_TCP;
  rule.Port     := Port;
  rule.Scope    := NET_FW_SCOPE_ALL;
  rule.Enabled  := true;
  profile.GloballyOpenPorts.Add(rule);
end;

procedure AddAppToFirewallXP(const Caption, ExecPath: string; Port : Word = 0);
const
  NET_FW_PROFILE_DOMAIN     = 0;
  NET_FW_PROFILE_STANDARD   = 1;
  NET_FW_IP_VERSION_ANY     = 2;
  NET_FW_IP_PROTOCOL_UDP    = 17;
  NET_FW_IP_PROTOCOL_TCP    = 6;
  NET_FW_SCOPE_ALL          = 0;
  NET_FW_SCOPE_LOCAL_SUBNET = 1;
var
  fwMgr,app:OleVariant;
  profile:OleVariant;
begin
  fwMgr := CreateOLEObject('HNetCfg.FwMgr');
  profile := fwMgr.LocalPolicy.CurrentProfile;
  app := CreateOLEObject('HNetCfg.FwAuthorizedApplication');
  app.Name := Caption;
  app.ProcessImageFileName := ExecPath;
  app.Scope := NET_FW_SCOPE_ALL;
  app.IpVersion := NET_FW_IP_VERSION_ANY;
  app.Enabled :=true;
  profile.AuthorizedApplications.Add(app);
end;

procedure AddPortToFirewall(const Caption, ExecPath: string; Port : Word);
const
  NET_FW_PROFILE2_DOMAIN  = 1;
  NET_FW_PROFILE2_PRIVATE = 2;
  NET_FW_PROFILE2_PUBLIC  = 4;

  NET_FW_IP_PROTOCOL_TCP  = 6;
  NET_FW_ACTION_ALLOW     = 1;
  NET_FW_RULE_DIR_IN      = 1;
  NET_FW_RULE_DIR_OUT     = 2;
var
  fwPolicy2   : OleVariant;
  RulesObject : OleVariant;
  Profile     : Integer;
  oEnum       : IEnumvariant;
  Rule        : OleVariant;
  iValue      : LongWord;
  NewRule     : OleVariant;
begin
  Profile             := NET_FW_PROFILE2_PRIVATE OR NET_FW_PROFILE2_PUBLIC;
  fwPolicy2           := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject         := fwPolicy2.Rules;

  oEnum := IUnknown(Rulesobject._NewEnum) as IEnumVariant;
  while oEnum.Next(1, Rule, iValue) = 0 do
    if (Rule.Name = Caption) and
       (Rule.ApplicationName = ExecPath) and
       (Rule.Grouping = 'IQMS Group') and
       (Rule.LocalPorts = Port) then
      begin
        Rule.Enabled := TRUE;
        Exit;
      end;

  NewRule             := CreateOleObject('HNetCfg.FWRule');
  NewRule.Name        := Caption;
  NewRule.Description := Format('Allow incoming TCP traffic for %s at port %d', [Caption, Port]);
  NewRule.Applicationname := ExecPath;
  NewRule.Protocol    := NET_FW_IP_PROTOCOL_TCP;
  NewRule.LocalPorts  := Port;
  NewRule.Direction   := NET_FW_RULE_DIR_IN;
  NewRule.Enabled     := TRUE;
  NewRule.Grouping    := 'IQMS Group';
  NewRule.Profiles    := Profile;
  NewRule.Action      := NET_FW_ACTION_ALLOW;
  RulesObject.Add(NewRule);
end;

procedure AddAppToFirewall(const Caption, ExecPath: string; Port : Word = 0);
const
  NET_FW_PROFILE2_DOMAIN  = 1;
  NET_FW_PROFILE2_PRIVATE = 2;
  NET_FW_PROFILE2_PUBLIC  = 4;

  NET_FW_IP_PROTOCOL_TCP  = 6;
  NET_FW_ACTION_ALLOW     = 1;
  NET_FW_RULE_DIR_IN      = 1;
  NET_FW_RULE_DIR_OUT     = 2;
var
  fwPolicy2      : OleVariant;
  RulesObject    : OleVariant;
  NewRule        : OleVariant;
begin
  fwPolicy2           := CreateOleObject('HNetCfg.FwPolicy2');
  RulesObject         := fwPolicy2.Rules;
  NewRule             := CreateOleObject('HNetCfg.FWRule');
  NewRule.Name        := Caption;
  NewRule.Description := Caption;
  NewRule.Applicationname := ExecPath;
  NewRule.Protocol    := NET_FW_IP_PROTOCOL_TCP;
  if Port <> 0 then
    NewRule.LocalPorts  := Port;
  NewRule.Direction   := NET_FW_RULE_DIR_IN;
  NewRule.Enabled     := TRUE;
  NewRule.Grouping    := 'IQMS Group';
  NewRule.Profiles    := fwPolicy2.CurrentProfileTypes;
  NewRule.Action      := NET_FW_ACTION_ALLOW;
  RulesObject.Add(NewRule);
end;

function GetOSMajorVersion: Cardinal;
var
  VersionInfo: TOSVersionInfo;
begin
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
  GetVersionEx(VersionInfo);

  result := VersionInfo.dwMajorVersion; // < 6 => Windows XP or lower
end;

procedure OpenFirewallPort(Caption: string; APort: word);
begin
  CoInitialize(nil);
  try
    if GetOSMajorVersion < 6 then
      AddPortToFirewallXP(Caption, APort)
    else
      AddPortToFirewall(Caption, '', APort); // open port for all applications
  finally
    CoUninitialize;
  end;
end;

procedure OpenFirewallApp (Caption, AppPath: string; Port: word = 0);
begin
  CoInitialize(nil);
  try
    if GetOSMajorVersion < 6 then
      AddAppToFirewallXP(Caption, AppPath, Port)
    else
      AddAppToFirewall(Caption, AppPath, Port);
  finally
    CoUninitialize;
  end;
end;

end.
