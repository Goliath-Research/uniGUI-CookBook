unit cc_settings;

interface

uses
  Winapi.Windows,
  IQMS.Common.Registry,
  MainModule;

  procedure CheckCreditCardSettingsCreated;


type
  TCreditCardSettings = class
     private
     public
       constructor Create;
     published

end;

const
  // Registry Path
  cCurrentUserSettingsPath = '\Software\IQMS\IQWin32\CreditCard.exe\Settings';

  // Registry Values.  Each setting has a corresponding constant.


var
   CreditCardSettings: TCreditCardSettings;

implementation

uses
  IQMS.Common.RegSet;

procedure CheckCreditCardSettingsCreated;
begin
  if not Assigned( CreditCardSettings ) then
     CreditCardSettings := TCreditCardSettings.Create;
end;

{ TCreditCardSettings }

constructor TCreditCardSettings.Create;
begin
  inherited Create;
end;

(*
function TCreditCardSettings.GetASBRange: Boolean;
begin
     // Get Activity Summary "Show All Dates"
     Result := ReadSetting_Bool( cCurrentUserSettingsPath, cASBRange, TRUE ); // IQMS.Common.RegSet.pas
end;

function TCreditCardSettings.GetASEnd: TDateTime;
begin
     // Get Activity Summary "End Date"
     Result := ReadSetting_DateTime( cCurrentUserSettingsPath, cASEnd, IQOracleAdjustedDate ); // IQMS.Dates.pas; IQMS.Common.RegSet.pas
end;

function TCreditCardSettings.GetASStart: TDateTime;
begin
     // Get Activity Summary "Start Date"
     Result := ReadSetting_DateTime( cCurrentUserSettingsPath, cASStart, IQOracleAdjustedDate ); // IQMS.Dates.pas; IQMS.Common.RegSet.pas
end;

function TCreditCardSettings.GetClassFilter: String;
begin
  Result := ReadSetting_String(cCurrentUserSettingsPath, cClassFilter, '');
end;

procedure TCreditCardSettings.SetASBRange(const Value: Boolean);
begin
     // Set Activity Summary "Show All Dates"
     WriteSetting_Bool( cCurrentUserSettingsPath, cASBRange, Value );  // IQMS.Common.RegSet.pas
end;

procedure TCreditCardSettings.SetASEnd(const Value: TDateTime);
begin
     // Set Activity Summary "End Date"
     WriteSetting_DateTime( cCurrentUserSettingsPath, cASEnd, Value ); // IQMS.Common.RegSet.pas

end;

procedure TCreditCardSettings.SetASStart(const Value: TDateTime);
begin
     // Set Activity Summary "Start Date"
     WriteSetting_DateTime( cCurrentUserSettingsPath, cASStart, Value ); // IQMS.Common.RegSet.pas

end;

procedure TCreditCardSettings.SetClassFilter(const Value: String);
begin
  WriteSetting_String(cCurrentUserSettingsPath, cClassFilter, UpperCase(Trim(Value)));
end;  *)

end.
