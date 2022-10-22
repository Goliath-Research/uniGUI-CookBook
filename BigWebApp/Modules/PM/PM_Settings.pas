unit PM_Settings;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  IQMS.Common.Registry,
  MainModule;

  procedure CheckIQPMSettingsCreated;


type
  TIQPMSettings = class
     private
       function GetASBRange: Boolean;
       function GetASEnd: TDateTime;
       function GetASStart: TDateTime;
       procedure SetASBRange(const Value: Boolean);
       procedure SetASEnd(const Value: TDateTime);
       procedure SetASStart(const Value: TDateTime);
       function GetClassFilter: String;
       procedure SetClassFilter(const Value: String);
     public
       constructor Create;
     published
       property ActivitySummary_ByDateRange: Boolean read GetASBRange write SetASBRange;
       property ActivitySummary_StartDate: TDateTime read GetASStart write SetASStart;
       property ActivitySummary_EndDate: TDateTime read GetASEnd write SetASEnd;
       property ClassFilter: String read GetClassFilter write SetClassFilter;

end;

const
      // Registry Path
      cCurrentUserSettingsPath = '\Software\IQMS\IQWin32\IQPM.exe\Settings';

      // Registry Values.  Each setting has a corresponding constant.
      cASBRange = 'ASBRange';
      cASStart = 'ASStart';
      cASEnd = 'ASEnd';
      cClassFilter = 'Class Filter';

var
   IQPMSettings: TIQPMSettings;

implementation

uses
  IQMS.Common.Dates,
  IQMS.Common.RegSet;

procedure CheckIQPMSettingsCreated;
begin
     if not Assigned( IQPMSettings ) then
        IQPMSettings := TIQPMSettings.Create;
end;

{ TIQPMSettings }

constructor TIQPMSettings.Create;
begin
     inherited Create;
end;

function TIQPMSettings.GetASBRange: Boolean;
begin
     // Get Activity Summary "Show All Dates"
     Result := ReadSetting_Bool( cCurrentUserSettingsPath, cASBRange, TRUE ); // IQMS.Common.RegSet.pas
end;

function TIQPMSettings.GetASEnd: TDateTime;
begin
     // Get Activity Summary "End Date"
     Result := ReadSetting_DateTime( cCurrentUserSettingsPath, cASEnd, IQOracleAdjustedDate ); // IQMS.Common.Dates.pas; IQMS.Common.RegSet.pas
end;

function TIQPMSettings.GetASStart: TDateTime;
begin
     // Get Activity Summary "Start Date"
     Result := ReadSetting_DateTime( cCurrentUserSettingsPath, cASStart, IQOracleAdjustedDate ); // IQMS.Common.Dates.pas; IQMS.Common.RegSet.pas
end;

function TIQPMSettings.GetClassFilter: String;
begin
  Result := ReadSetting_String(cCurrentUserSettingsPath, cClassFilter, '');
end;

procedure TIQPMSettings.SetASBRange(const Value: Boolean);
begin
     // Set Activity Summary "Show All Dates"
     WriteSetting_Bool( cCurrentUserSettingsPath, cASBRange, Value );  // IQMS.Common.RegSet.pas
end;

procedure TIQPMSettings.SetASEnd(const Value: TDateTime);
begin
     // Set Activity Summary "End Date"
     WriteSetting_DateTime( cCurrentUserSettingsPath, cASEnd, Value ); // IQMS.Common.RegSet.pas

end;

procedure TIQPMSettings.SetASStart(const Value: TDateTime);
begin
     // Set Activity Summary "Start Date"
     WriteSetting_DateTime( cCurrentUserSettingsPath, cASStart, Value ); // IQMS.Common.RegSet.pas

end;

procedure TIQPMSettings.SetClassFilter(const Value: String);
begin
  WriteSetting_String(cCurrentUserSettingsPath, cClassFilter, UpperCase(Trim(Value)));
end;

end.
