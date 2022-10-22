unit scanid_settings;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  IQMS.Common.Registry,
  MainModule;

  // Create the settings object
  procedure CheckScanIDSettingsCreated; // call this to ensure that the object is created

type
   TScanIDSettings = class  //crm_context
   private
      // Private variables
      FPrintCopies       : Integer;
      FPlayAlarm         : Boolean;
      FAlarmFile_Fatal   : String ;
      FAlarmFile_General : String ;
      FLogMode           : Boolean;
      FLogAll            : Boolean;
      FLogFile           : String ;
      FUseLblHierarchy   : Boolean;

      // Property methods
      // Get...
      function GetAlarmFile_Fatal: String;
      function GetAlarmFile_General: String;
      function GetLogAll: Boolean;
      function GetLogFile: String;
      function GetLogMode: Boolean;
      function GetPlayAlarm: Boolean;
      function GetPrintCopies: Integer;
      function GetUseLblHierarchy : Boolean;

      // Set...
      procedure SetAlarmFile_Fatal(const Value: String);
      procedure SetAlarmFile_General(const Value: String);
      procedure SetLogAll(const Value: Boolean);
      procedure SetLogFile(const Value: String);
      procedure SetLogMode(const Value: Boolean);
      procedure SetPlayAlarm(const Value: Boolean);
      procedure SetPrintCopies(const Value: Integer);
      procedure SetUseLblHierarchy(const Value : Boolean);

   published
      // Label Properties
      property PrintCopies: Integer        read GetPrintCopies write SetPrintCopies;
      property UseLblHierarchy : Boolean   read GetUseLblHierarchy write SetUseLblHierarchy;

      // Alarms
      property PlayAlarm: Boolean          read GetPlayAlarm write SetPlayAlarm;
      property AlarmFile_Fatal: String     read GetAlarmFile_Fatal write SetAlarmFile_Fatal;
      property AlarmFile_General: String   read GetAlarmFile_General write SetAlarmFile_General;

      // Log file
      property LogMode: Boolean            read GetLogMode write SetLogMode;
      property LogAll: Boolean             read GetLogAll write SetLogAll;
      property LogFile: String             read GetLogFile write SetLogFile;

   public
      constructor Create;
      destructor Destroy;
      procedure RefreshSettings;
      procedure SaveSettings;
   end;

const
    // Registry key names
    cCurrentUserSettingsPath    = '\Software\IQMS\IQWin32\Scan_ID.exe\Settings';
    cReg_PlayAlarm              = 'PlayAlarm';
    cReg_AlarmFile_Fatal        = 'AlarmFile_Fatal';
    cReg_AlarmFile_General      = 'AlarmFile_General';
    cReg_PrintCopies            = 'PrintCopies';
    cReg_LogFile                = 'LogFileName';  // log file name for mode 1
    cReg_LogMode                = 'LogMode';
    cReg_LogAll                 = 'LogAll';
    cReg_UseLblHierarchy        = 'UseLblHierarchy';

var
   ScanIDSettings: TScanIDSettings; // global object

implementation

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegSet,
  IQMS.Common.StringUtils;

procedure CheckScanIDSettingsCreated;
begin
     if not Assigned( ScanIDSettings ) then ScanIDSettings:= TScanIDSettings.Create;
end;


{ TScanIDSettings }

constructor TScanIDSettings.Create;
begin
     inherited Create;
     RefreshSettings;
end;

procedure TScanIDSettings.RefreshSettings;
begin
     FPrintCopies        := PrintCopies      ;
     FPlayAlarm          := PlayAlarm        ;
     FAlarmFile_Fatal    := AlarmFile_Fatal  ;
     FAlarmFile_General  := AlarmFile_General;
     FLogMode            := LogMode          ;
     FLogAll             := LogAll           ;
     FLogFile            := LogFile          ;
     FUseLblHierarchy    := UseLblHierarchy  ;
end;

procedure TScanIDSettings.SaveSettings;
begin
     PrintCopies       := FPrintCopies       ;
     PlayAlarm         := FPlayAlarm         ;
     AlarmFile_Fatal   := FAlarmFile_Fatal   ;
     AlarmFile_General := FAlarmFile_General ;
     LogMode           := FLogMode           ;
     LogAll            := FLogAll            ;
     LogFile           := FLogFile           ;
     UseLblHierarchy   := FUseLblHierarchy   ;
end;

destructor TScanIDSettings.Destroy;
begin
     inherited Destroy;
end;

function TScanIDSettings.GetAlarmFile_Fatal: String;
begin
     Result := ReadSetting_String( cCurrentUserSettingsPath, cReg_AlarmFile_Fatal, '' );
end;

function TScanIDSettings.GetPlayAlarm: Boolean;
begin
     Result := ReadSetting_Bool( cCurrentUserSettingsPath, cReg_PlayAlarm, TRUE );
end;

procedure TScanIDSettings.SetAlarmFile_Fatal(const Value: String);
begin
     WriteSetting_String( cCurrentUserSettingsPath, cReg_AlarmFile_Fatal, Value );
end;

procedure TScanIDSettings.SetPlayAlarm(const Value: Boolean);
begin
     WriteSetting_Bool( cCurrentUserSettingsPath, cReg_PlayAlarm, Value );
end;

function TScanIDSettings.GetPrintCopies: Integer;
begin
     Result := ReadSetting_Int( cCurrentUserSettingsPath, cReg_PrintCopies, 1 );
end;

function TScanIDSettings.GetUseLblHierarchy: Boolean;
begin
  Result := ReadSetting_Bool( cCurrentUserSettingsPath, cReg_UseLblHierarchy, TRUE );
end;

procedure TScanIDSettings.SetPrintCopies(const Value: Integer);
begin
     WriteSetting_Int( cCurrentUserSettingsPath, cReg_PrintCopies, Value );
end;

procedure TScanIDSettings.SetUseLblHierarchy(const Value: Boolean);
begin
  WriteSetting_Bool( cCurrentUserSettingsPath, cReg_UseLblHierarchy, Value);
end;

function TScanIDSettings.GetAlarmFile_General: String;
begin
     Result := ReadSetting_String( cCurrentUserSettingsPath, cReg_AlarmFile_General, '' );
end;

procedure TScanIDSettings.SetAlarmFile_General(const Value: String);
begin
     WriteSetting_String( cCurrentUserSettingsPath, cReg_AlarmFile_General, Value );
end;

function TScanIDSettings.GetLogMode: Boolean;
begin
     Result := ReadSetting_Bool( cCurrentUserSettingsPath, cReg_LogMode, TRUE );
end;

procedure TScanIDSettings.SetLogMode(const Value: Boolean);
begin
     WriteSetting_Bool( cCurrentUserSettingsPath, cReg_LogMode, Value );
end;

function TScanIDSettings.GetLogFile: String;
var
   ADir: String;
begin
     ADir := IQGetLocalHomePath + 'logfile.txt';
     Result := ReadSetting_String( cCurrentUserSettingsPath, cReg_LogFile, ADir );
end;

procedure TScanIDSettings.SetLogFile(const Value: String);
begin
     WriteSetting_String( cCurrentUserSettingsPath, cReg_LogFile, Value );
end;

function TScanIDSettings.GetLogAll: Boolean;
begin
     Result := ReadSetting_Bool( cCurrentUserSettingsPath, cReg_LogAll, TRUE );
end;

procedure TScanIDSettings.SetLogAll(const Value: Boolean);
begin
     WriteSetting_Bool( cCurrentUserSettingsPath, cReg_LogAll, Value );
end;

end.
