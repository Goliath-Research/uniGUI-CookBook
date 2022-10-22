unit dng_settings;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.Registry;

procedure CheckDunningSettingsCreated;

type
  TDunningSettings = class(TComponent)
  private
    FForceSMTP: Boolean;
    procedure SetForceSMTP(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    constructor Create;
    procedure RefreshSettings; // Retrieves settings saved in the Registry
    property ForceSMTP: Boolean read FForceSMTP
      write SetForceSMTP;
  end;

var
  DunningSettings: TDunningSettings;

implementation

uses
  IQMS.Common.RegSet;

const
  // Registry Path
  // 05/24/2012 Changed this key so that these will not be cleared.
  cCurrentUserSettingsPath = 'Software\IQMS\IQWin32\Iqwin32.exe\Dunning';
  cRegDunning_ForceSMTP = 'Force SMTP';

procedure CheckDunningSettingsCreated;
begin
  if not Assigned(DunningSettings) then
    DunningSettings := TDunningSettings.Create;
end;

{ TDunningSettings }

constructor TDunningSettings.Create;
begin
  inherited Create(Application);
  RefreshSettings;
end;

procedure TDunningSettings.RefreshSettings;
begin
  FForceSMTP := IQMS.Common.RegSet.ReadSetting_Bool(cCurrentUserSettingsPath,
    cRegDunning_ForceSMTP, False);
end;

procedure TDunningSettings.SetForceSMTP(const Value: Boolean);
begin
  FForceSMTP := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cRegDunning_ForceSMTP,
    FForceSMTP);
end;

end.
