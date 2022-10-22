unit crm_settings;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.Registry,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.DataLib,
  MainModule,
  IQUniGrid;

procedure CheckCRMSettingsCreated;

// IQSearchGrid Registry Settings
procedure SaveCRMSearchGrid(ASearchGrid: TIQUniGridControl; AKey: string);
procedure ApplyCRMSearchGrid(ASearchGrid: TIQUniGridControl; AKey: string);

function GetParam(const AFieldName: string): string;
function GetParamAsBoolean(const AFieldName: string): Boolean;

type
  { Forwards }
  TCRMSettings = class;
  TCRMTodaySettings = class;
  TCRMUserProfile = class;
  TMailMergeOptions = class;

  { TCRMSettings }
  TCRMSettings = class
  private
    // Private variables
    FActivityDetails: Boolean;
    FAlwaysShowAlerts: Boolean;
    FCopySelfOnAlertEMail: Boolean;
    FCRMTodaySettings: TCRMTodaySettings;
    FCRMUserProfile: TCRMUserProfile;
    FEMailBody: Boolean;
    FModuleHints: Boolean;
    FNotifications: Boolean;
    FPlayTelephonySound: Boolean;
    FPlayTelephonySoundFile: Boolean;
    FPromptRollOver: Boolean; // used by the CRMToday property
    FRefreshRate: Integer;
    FRefreshRateAssignmentAlert: Integer;
    FShowAssignmentAlert: Boolean;
    FShowCRMTodayHints: Boolean;
    FShowCustMaintOnNew: Boolean;
    FTelephonySoundFile: string;
    FUseOpenFormsToolbar: Boolean;
    FUseOutlook: Boolean;
    FUseOutlookInternally: Boolean;
    FUseTelephony: Boolean;
    FTelephonyProtocolMode: Byte;
    FTelephonyTAPIDriverName: string;
    FMailMergeOptions: TMailMergeOptions;
    FUseLotusNotesInternally: Boolean;
    FMassMailAsyncBatchThreshold: Integer;
    // Property methods
    function GetUseOutlook: Boolean;
    procedure SetActivityDetailsRec(const Value: Boolean);
    procedure SetAlwaysShowAlerts(const Value: Boolean);
    procedure SetCopySelfOnAlertEMail(const Value: Boolean);
    procedure SetEMailBody(const Value: Boolean);
    procedure SetModuleHintsRec(const Value: Boolean);
    procedure SetPlayTelephonySound(const Value: Boolean);
    procedure SetPlayTelephonySoundFile(const Value: Boolean);
    procedure SetPromptRollOver(const Value: Boolean);
    procedure SetRefreshRate(const Value: Integer);
    procedure SetRefreshRateAssignmentAlert(const Value: Integer);
    procedure SetShowAssignmentAlert(const Value: Boolean);
    procedure SetShowCustMaintOnNew(const Value: Boolean);
    procedure SetShowNotifications(const Value: Boolean);
    procedure SetTelephonySoundFile(const Value: string);
    procedure SetUseOpenFormsToolbar(const Value: Boolean);
    procedure SetUseOutlookInternally(const Value: Boolean);
    procedure SetUseTelephony(const Value: Boolean);
    procedure SetTelephonyProtocolMode(const Value: Byte);
    procedure SetTelephonyTAPIDriverName(const Value: string);
    function GetUseLotusNotes: Boolean;
    function GetUseGroupWise: Boolean;
    procedure SetUseLotusNotesInternally(const Value: Boolean);
    procedure CheckSettingsCopiedToNewRegistryLocation;
    procedure SetMassMailAsyncBatchThreshold(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure RefreshSettings; // Retrieves settings saved in the Registry
    procedure SaveSettings; // Saves settings to the Regestry
  published
    // Properties available to the CRMSettings object

    // Current User Profile settings
    property CurrentUser: TCRMUserProfile read FCRMUserProfile;

    // CRMToday provides access to the TCRMToday properties
    property CRMToday: TCRMTodaySettings read FCRMTodaySettings;

    // Mail Merge Options
    property MailMergeOptions: TMailMergeOptions read FMailMergeOptions;

    // Standard properties
    property AlwaysShowAlerts: Boolean read FAlwaysShowAlerts
      write SetAlwaysShowAlerts;
    property CopySelfOnAlertEMail: Boolean read FCopySelfOnAlertEMail
      write SetCopySelfOnAlertEMail;
    property PlayTelephonySound: Boolean read FPlayTelephonySound
      write SetPlayTelephonySound;
    property PlayTelephonySoundFile: Boolean read FPlayTelephonySoundFile
      write SetPlayTelephonySoundFile;
    property PromptRollOver: Boolean read FPromptRollOver
      write SetPromptRollOver;
    property RefreshRateAssignmentAlert: Integer
      read FRefreshRateAssignmentAlert write SetRefreshRateAssignmentAlert;
    property RefreshRateNotifications: Integer read FRefreshRate
      write SetRefreshRate;
    property ShowActivityDetails: Boolean read FActivityDetails
      write SetActivityDetailsRec;
    property ShowAssignmentAlert: Boolean read FShowAssignmentAlert
      write SetShowAssignmentAlert;
    property ShowCustMainOnNew: Boolean read FShowCustMaintOnNew
      write SetShowCustMaintOnNew;
    property ShowEMailBody: Boolean read FEMailBody write SetEMailBody;
    property ShowModuleHints: Boolean read FModuleHints
      write SetModuleHintsRec;
    property ShowNotifications: Boolean read FNotifications
      write SetShowNotifications;
    property TelephonyProtocolMode: Byte read FTelephonyProtocolMode
      write SetTelephonyProtocolMode;
    property TelephonyTAPIDriverName: string read FTelephonyTAPIDriverName
      write SetTelephonyTAPIDriverName;
    property TelephonySoundFile: string read FTelephonySoundFile
      write SetTelephonySoundFile;
    property UseOpenFormsToolbar: Boolean read FUseOpenFormsToolbar
      write SetUseOpenFormsToolbar;
    property UseOutlook: Boolean read GetUseOutlook;
    property UseOutlookInternally: Boolean read FUseOutlookInternally
      write SetUseOutlookInternally;
    property UseLotusNotes: Boolean read GetUseLotusNotes;
    property UseLotusNotesInternally: Boolean read FUseLotusNotesInternally
      write SetUseLotusNotesInternally;
    property UseGroupWise: Boolean read GetUseGroupWise;
    property UseTelephony: Boolean read FUseTelephony write SetUseTelephony;
    property MassMailAsyncBatchThreshold: Integer
      read FMassMailAsyncBatchThreshold write SetMassMailAsyncBatchThreshold;
  end;

  { TCRMUserProfile }
  TCRMUserProfile = class
  private
    function GetDefaultGroupID: Real;
    function GetDefaultQueueID: Real;
    function GetDefaultSubQueueID: Real;
    function GetDeleteOwnedOnly: Boolean;
  public
    constructor Create;
  published
    property DeletedOwnedOnly: Boolean read GetDeleteOwnedOnly;
    property SupportQueueID: Real read GetDefaultQueueID;
    property SupportSubqueueID: Real read GetDefaultSubQueueID;
    property GroupID: Real read GetDefaultGroupID;
  end;

  { TAutoSizeOption }
  TAutoSizeOption = (aszNone, aszFitToWindow, aszFitHorizontally,
    aszFitVertically);

  { TCRMTodaySettings }
  TCRMTodaySettings = class
  private
    // Private declarations
    FByRange: Boolean;
    FDaysBeforeToday, FDaysAfterToday: Integer;
    FVisibleModules: string;
    FTileFormat, FColumnFormat: Integer;
    FShowHints, FShowColumnHeadings: Boolean;
    FAutoSize: TAutoSizeOption;
    procedure SetByRange(const Value: Boolean);
    procedure SetColumnFormat(const Value: Integer);
    procedure SetDaysAfterToday(const Value: Integer);
    procedure SetDaysBeforeToday(const Value: Integer);
    procedure SetTileFormat(const Value: Integer);
    procedure SetVisibleModules(const Value: string);
    procedure SetHints(const Value: Boolean);
    procedure SetShowColumnHeadings(const Value: Boolean);
    procedure SetAutoSize(const Value: TAutoSizeOption);
  public
    // Public declarations
    function StartDateTimeStr: string;
    function EndDateTimeStr: string;
    function StartDateTime: TDateTime;
    function EndDateTime: TDateTime;
  published
    // Published declarations
    property ByRange: Boolean read FByRange write SetByRange;
    property DaysBeforeToday: Integer read FDaysBeforeToday
      write SetDaysBeforeToday;
    property DaysAfterToday: Integer read FDaysAfterToday
      write SetDaysAfterToday;
    property VisibleModules: string read FVisibleModules
      write SetVisibleModules;
    property TileFormat: Integer read FTileFormat write SetTileFormat;
    property ColumnFormat: Integer read FColumnFormat write SetColumnFormat;
    property AutoSize: TAutoSizeOption read FAutoSize write SetAutoSize;
    property ShowHints: Boolean read FShowHints write SetHints;
    property ShowColumnHeadings: Boolean read FShowColumnHeadings
      write SetShowColumnHeadings;
  end;

  { TMailMergeOptions }
  TMailMergeOptions = class
  private
    // Private declarations
    FDefaultDataFormat: Byte;
    procedure SetDefaultDataFormat(const Value: Byte);
  public
    // Public declarations
  published
    // Published declarations
    property DefaultDataFormat: Byte read FDefaultDataFormat
      write SetDefaultDataFormat;
  end;

const
  // Registry Path
  // 05/24/2012 Changed this key so that these will not be cleared.
  cCurrentUserSettingsPath = '\Software\IQMS\CRM\Settings';

  // Registry Values.  Each setting has a corresponding constant.
  cActivityDetails = 'ActivityDetails';
  cModuleHints = 'ModuleHints';
  cEMailBody = 'EBody';
  cUseOpenFormsToolbar = 'UseOpenFormsToolbar';
  cUseOutlookInternally = 'UseOutlookInternally';
  cRefreshRate = 'RefreshRate'; // refresh rate for notifications
  cNotifications = 'Notifications';
  cAlwaysShowAlerts = 'AlwaysShowAlerts';
  cShowCustMaintOnNew = 'ShowCustMaintOnNew';
  // show Cust Maint form instead of Quick Add
  cPromptRollOver = 'PromptRollOver';
  cUseTelephony = 'UseTelephony';
  cTelephonyProtocolMode = 'TelephonyProtocolMode';
  cTelephonyTAPIDriverName = 'TelephonyTAPIDriverName';
  cPlayTelephonySound = 'PlayTelephonySound';
  cPlayTelephonySoundFile = 'PlayTelephonySoundFile';
  cTelephonySoundFile = 'TelephonySoundFile';
  cCopySelfOnAlertEMail = 'CopySelfOnAlertEMail';
  cShowAssignmentAlert = 'ShowAssignmentAlert';
  cRefreshRateAssignmentAlert = 'RefreshRateAssignmentAlert';
  cUseLotusNotesInternally = 'UseLotusNotesInternally';
  cMassMailAsyncBatchThreshold = 'MassMailAsyncBatchThreshold';

  // CRM Today
  cCRMToday_ByRange = 'CRMToday_ByRange';
  cCRMToday_DaysBeforeToday = 'CRMToday_DaysBeforeToday';
  cCRMToday_DaysAfterToday = 'CRMToday_DaysAfterToday';
  cCRMToday_VisibleModules = 'CRMToday_VisibleModules';
  cCRMToday_TileFormat = 'CRMToday_TileFormat';
  cCRMToday_ColumnFormat = 'CRMToday_ColumnFormat';
  cCRMToday_ShowHints = 'CRMToday_ShowHints';
  cCRMToday_ShowColumnHeadings = 'CRMToday_ShowColumnHeadings';
  cCRMToday_AutoSize = 'CRMToday_AutoSize';

  // Mail Merge
  cMailMerge_DefaultDataFormat = 'MailMerge_DefaultDataFormat';

var
  CRMSettings: TCRMSettings;

implementation

uses
  IQMS.Common.Dialogs,
  IQMS.Common.RegSet,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication;

{ Global wrapper to assign the CRMSettings variable.  This can be called as
  many times as is necessary, and when there is doubt that it might still be
  NIL. }
procedure CheckCRMSettingsCreated;
begin
  if not Assigned(CRMSettings) then
    CRMSettings := TCRMSettings.Create;
end;

procedure SaveCRMSearchGrid(ASearchGrid: TIQUniGridControl; AKey: string);
begin
  // Prevent an error condition
  if (ASearchGrid = nil) or (ASearchGrid.DataSource = nil) or
    (ASearchGrid.DataSource.DataSet = nil) or (AKey = '') then
    Exit;

  // Write to the Registry
  try
    with TIQRegForm.Create(ASearchGrid.Owner as TUniForm) do
      try
        FormPath := Format('%s\%s', [FormPath, Trim(AKey)]);
        Path := FormPath;
        { TODO -oSanketG -cWebConvert : Need to find alternative property/method for SearchField, wwDBGrid in TIQUniGridControl }
        {if ASearchGrid.SearchField > '' then
          WriteString('IQSearchField', ASearchGrid.SearchField);
        write(ASearchGrid.wwDBGrid);}
      finally
        //Free;
      end;
  except
    on E: Exception do // tame the error.
      begin
        IQError(E.Message); // report it
        ABORT; // Handled
      end;
  end;
end;

procedure ApplyCRMSearchGrid(ASearchGrid: TIQUniGridControl; AKey: string);
var
  ASearchField: string;
begin
  // Prevent an error condition
  if (ASearchGrid = nil) or (ASearchGrid.DataSource = nil) or
    (ASearchGrid.DataSource.DataSet = nil) or (AKey = '') then
    Exit;

  // Get the Registry settings
  try
    with TIQRegForm.Create(ASearchGrid.Owner as TUniForm) do
      try
        FormPath := Format('%s\%s', [FormPath, Trim(AKey)]);
        Path := FormPath;
        ASearchField := ReadString('IQSearchField');
        { TODO -oSanketG -cWebConvert : Need to find alternative property/method for SearchField, wwDBGrid in TIQUniGridControl }
        {if ASearchField > '' then
          ASearchGrid.SearchField := ASearchField;
        read(ASearchGrid.wwDBGrid);}
      finally
        //Free;
      end;
  except
    on E: Exception do // tame the error
      begin
        IQError(E.Message); // report it
        ABORT; // handled
      end;
  end;
end;

function GetParam(const AFieldName: string): string;
begin
  try
    Result := SelectValueFmtAsString
      ('SELECT %s FROM crm_params WHERE ROWNUM < 2',
      [AFieldName]);
  except
    on E: Exception do
      raise Exception.CreateFmt('Invalid CRM param request:  %s', [AFieldName]);
  end;
end;

function GetParamAsBoolean(const AFieldName: string): Boolean;
begin
  Result := GetParam(AFieldName) = 'Y';
end;

{$REGION 'TCRMSettings'}

{ TCRMSettings }

procedure TCRMSettings.CheckSettingsCopiedToNewRegistryLocation;
const
  c_old_reg_key: string = '\Software\IQMS\IQWin32\IQCRM.exe\Settings';
var
  i: Integer;
  AValues: TStringList;
  AValueName: string;
  {Replaced TWeIQbRegistry with TIQWebRegistry}
  ARegistryOld, ARegistryNew: TIQWebRegistry;
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] crm_settings.pas(383): E2003 Undeclared identifier: 'TRegDataType'}
  //ARegDataType: TRegDataType;
begin
  // 05/24/2012 This was added because I moved the Registry location
  // for settings so that they would never be deleted.
  {Replaced TWebIQQMS.Common.Registry with TIQWebRegistry}
  ARegistryOld := TIQWebRegistry.CreateRO;
  try
    ARegistryOld.RootKey := HKEY_CURRENT_USER;
    {Replaced TWebIQQMS.Common.Registry with TIQWebRegistry}
    ARegistryNew := TIQWebRegistry.Create;
    try
      ARegistryNew.RootKey := HKEY_CURRENT_USER;

      if not ARegistryOld.OpenKey(c_old_reg_key, False) or
        not ARegistryNew.OpenKey(cCurrentUserSettingsPath, True) then
        Exit;

      AValues := TStringList.Create;
      try
        ARegistryOld.GetValueNames(AValues);

        for i := 0 to AValues.Count - 1 do
          begin
            AValueName := AValues.Strings[i];
            if not ARegistryNew.ValueExists(AValueName) then
              begin
                // Copy value to new location
                { TODO -oSanketG -cWebConvert : Need to revisit, [dcc32 Error] crm_settings.pas(415): E2003 Undeclared identifier: 'ARegDataType',
                 [dcc32 Error] crm_settings.pas(417): E2003 Undeclared identifier: 'rdString'}
                {ARegDataType := ARegistryOld.GetDataType(AValueName);
                case ARegDataType of
                  rdString, rdExpandString:
                    ARegistryNew.WriteString(AValueName,
                      ARegistryOld.ReadString(AValueName));
                  rdInteger:
                    ARegistryNew.WriteInteger(AValueName,
                      ARegistryOld.ReadInteger(AValueName));
                end;}
              end;
          end;
      finally
        if Assigned(AValues) then
          FreeAndNil(AValues);
      end;
      ARegistryOld.CloseKey;
      ARegistryNew.CloseKey;
      ARegistryOld.DeleteKey(c_old_reg_key);
    finally
      if Assigned(ARegistryOld) then
        FreeAndNil(ARegistryOld);
    end;
  finally
    if Assigned(ARegistryNew) then
      FreeAndNil(ARegistryNew);
  end;
end;

constructor TCRMSettings.Create;
begin
  inherited Create;
  CheckSettingsCopiedToNewRegistryLocation;
  FCRMUserProfile := TCRMUserProfile.Create;
  FCRMTodaySettings := TCRMTodaySettings.Create;
  FMailMergeOptions := TMailMergeOptions.Create;
  RefreshSettings;
end;

destructor TCRMSettings.Destroy;
begin
  if Assigned(FCRMUserProfile) then
    FreeAndNil(FCRMUserProfile);
  if Assigned(FCRMTodaySettings) then
    FreeAndNil(FCRMTodaySettings);
  if Assigned(FMailMergeOptions) then
    FreeAndNil(FMailMergeOptions);

  inherited Destroy;
end;

procedure TCRMSettings.RefreshSettings;
begin
  FActivityDetails := ReadSetting_Bool(cCurrentUserSettingsPath,
    cActivityDetails);
  FModuleHints := ReadSetting_Bool(cCurrentUserSettingsPath, cModuleHints);
  FEMailBody := ReadSetting_Bool(cCurrentUserSettingsPath, cEMailBody);
  FUseOpenFormsToolbar := ReadSetting_Bool(cCurrentUserSettingsPath,
    cUseOpenFormsToolbar);
  // FUseOutlook            := ReadSetting_Bool( cCurrentUserSettingsPath, cUseOutlook, FALSE           );
  FUseOutlookInternally := ReadSetting_Bool(cCurrentUserSettingsPath,
    cUseOutlookInternally, False);
  FUseLotusNotesInternally := ReadSetting_Bool(cCurrentUserSettingsPath,
    cUseLotusNotesInternally, False);
  FRefreshRate := ReadSetting_Int(cCurrentUserSettingsPath, cRefreshRate, 120);
  FNotifications := ReadSetting_Bool(cCurrentUserSettingsPath,
    cNotifications, True);
  FAlwaysShowAlerts := ReadSetting_Bool(cCurrentUserSettingsPath,
    cAlwaysShowAlerts, False);
  FShowCustMaintOnNew := ReadSetting_Bool(cCurrentUserSettingsPath,
    cShowCustMaintOnNew, False);
  FPromptRollOver := ReadSetting_Bool(cCurrentUserSettingsPath,
    cPromptRollOver, True);

  FUseTelephony := ReadSetting_Bool(cCurrentUserSettingsPath,
    cUseTelephony, False);
  FTelephonyProtocolMode := ReadSetting_Int(cCurrentUserSettingsPath,
    cTelephonyProtocolMode, 0);
  FTelephonyTAPIDriverName := ReadSetting_String(cCurrentUserSettingsPath,
    cTelephonyTAPIDriverName, '');
  FPlayTelephonySound := ReadSetting_Bool(cCurrentUserSettingsPath,
    cPlayTelephonySound, True);
  FTelephonySoundFile := ReadSetting_String(cCurrentUserSettingsPath,
    cTelephonySoundFile, '');
  FPlayTelephonySoundFile := ReadSetting_Bool(cCurrentUserSettingsPath,
    cPlayTelephonySoundFile, True);

  FCopySelfOnAlertEMail := ReadSetting_Bool(cCurrentUserSettingsPath,
    cCopySelfOnAlertEMail, False);

  // Assignment Alerts (added 08/30/2006)
  FRefreshRateAssignmentAlert := ReadSetting_Int(cCurrentUserSettingsPath,
    cRefreshRateAssignmentAlert, 120);
  FShowAssignmentAlert := ReadSetting_Bool(cCurrentUserSettingsPath,
    cShowAssignmentAlert, False { By Randy's request } );

  // 06/10/2014 CRM Mass Mailer asyncronous email batch threshold
  FMassMailAsyncBatchThreshold := ReadSetting_Int(cCurrentUserSettingsPath,
    cMassMailAsyncBatchThreshold, 500);
  // Keep 1200 or less to prevent too many threads (potentially) from
  // running at the same time
  if FMassMailAsyncBatchThreshold > 1200 then
    FMassMailAsyncBatchThreshold := 1200;

  with CRMToday do
    begin
      FByRange := ReadSetting_Bool(cCurrentUserSettingsPath,
        cCRMToday_ByRange, True);
      FDaysAfterToday := ReadSetting_Int(cCurrentUserSettingsPath,
        cCRMToday_DaysAfterToday, 7);
      FDaysBeforeToday := ReadSetting_Int(cCurrentUserSettingsPath,
        cCRMToday_DaysBeforeToday, 7);
      FColumnFormat := ReadSetting_Int(cCurrentUserSettingsPath,
        cCRMToday_ColumnFormat, 0);
      FTileFormat := ReadSetting_Int(cCurrentUserSettingsPath,
        cCRMToday_TileFormat, 0);
      FVisibleModules := ReadSetting_String(cCurrentUserSettingsPath,
        cCRMToday_VisibleModules, '1,2,3,4');
      FShowHints := ReadSetting_Bool(cCurrentUserSettingsPath,
        cCRMToday_ShowHints, True);
      FShowColumnHeadings := ReadSetting_Bool(cCurrentUserSettingsPath,
        cCRMToday_ShowColumnHeadings, True);
      FAutoSize := TAutoSizeOption(ReadSetting_Int(cCurrentUserSettingsPath,
        cCRMToday_AutoSize, 0));
    end;

  // Mail Merge Options
  with MailMergeOptions do
    begin
      FDefaultDataFormat := ReadSetting_Int(cCurrentUserSettingsPath,
        cMailMerge_DefaultDataFormat, 5 { Microsoft Access } );
    end;
end;

procedure TCRMSettings.SaveSettings;
begin
  WriteSetting_Bool(cCurrentUserSettingsPath, cActivityDetails,
    FActivityDetails);
  WriteSetting_Bool(cCurrentUserSettingsPath, cModuleHints, FModuleHints);
  WriteSetting_Bool(cCurrentUserSettingsPath, cEMailBody, FEMailBody);
  WriteSetting_Bool(cCurrentUserSettingsPath, cUseOpenFormsToolbar,
    FUseOpenFormsToolbar);
  WriteSetting_Bool(cCurrentUserSettingsPath, cUseOutlookInternally,
    FUseOutlookInternally);
  WriteSetting_Bool(cCurrentUserSettingsPath, cUseLotusNotesInternally,
    FUseLotusNotesInternally);

  WriteSetting_Int(cCurrentUserSettingsPath, cRefreshRate, FRefreshRate);
  WriteSetting_Bool(cCurrentUserSettingsPath, cNotifications, FNotifications);
  WriteSetting_Bool(cCurrentUserSettingsPath, cAlwaysShowAlerts,
    FAlwaysShowAlerts);
  WriteSetting_Bool(cCurrentUserSettingsPath, cShowCustMaintOnNew,
    FShowCustMaintOnNew);
  WriteSetting_Bool(cCurrentUserSettingsPath, cPromptRollOver, FPromptRollOver);

  WriteSetting_Bool(cCurrentUserSettingsPath, cUseTelephony, FUseTelephony);
  WriteSetting_Bool(cCurrentUserSettingsPath, cPlayTelephonySound,
    FPlayTelephonySound);
  WriteSetting_Bool(cCurrentUserSettingsPath, cPlayTelephonySoundFile,
    FPlayTelephonySoundFile);
  WriteSetting_String(cCurrentUserSettingsPath, cTelephonySoundFile,
    FTelephonySoundFile);

  WriteSetting_Int(cCurrentUserSettingsPath, cTelephonyProtocolMode,
    FTelephonyProtocolMode);
  WriteSetting_String(cCurrentUserSettingsPath, cTelephonyTAPIDriverName,
    FTelephonyTAPIDriverName);

  WriteSetting_Bool(cCurrentUserSettingsPath, cCopySelfOnAlertEMail,
    FCopySelfOnAlertEMail);

  WriteSetting_Int(cCurrentUserSettingsPath, cRefreshRateAssignmentAlert,
    FRefreshRateAssignmentAlert);
  WriteSetting_Bool(cCurrentUserSettingsPath, cShowAssignmentAlert,
    FShowAssignmentAlert);

  with CRMToday do
    begin
      WriteSetting_Bool(cCurrentUserSettingsPath, cCRMToday_ByRange, FByRange);
      WriteSetting_Int(cCurrentUserSettingsPath, cCRMToday_DaysAfterToday,
        FDaysAfterToday);
      WriteSetting_Int(cCurrentUserSettingsPath, cCRMToday_DaysBeforeToday,
        FDaysBeforeToday);
      WriteSetting_Int(cCurrentUserSettingsPath, cCRMToday_ColumnFormat,
        FColumnFormat);
      WriteSetting_Int(cCurrentUserSettingsPath, cCRMToday_TileFormat,
        FTileFormat);
      WriteSetting_String(cCurrentUserSettingsPath, cCRMToday_VisibleModules,
        FVisibleModules);
      WriteSetting_Bool(cCurrentUserSettingsPath, cCRMToday_ShowHints,
        FShowHints);
      WriteSetting_Bool(cCurrentUserSettingsPath, cCRMToday_ShowColumnHeadings,
        FShowColumnHeadings);
    end;

  // Mail Merge Options
  with MailMergeOptions do
    begin
      WriteSetting_Int(cCurrentUserSettingsPath, cMailMerge_DefaultDataFormat,
        FDefaultDataFormat);
    end;

end;

procedure TCRMSettings.SetActivityDetailsRec(const Value: Boolean);
begin
  FActivityDetails := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cActivityDetails, Value);
end;

procedure TCRMSettings.SetRefreshRate(const Value: Integer);
begin
  FRefreshRate := Value;
  WriteSetting_Int(cCurrentUserSettingsPath, cRefreshRate, Value);
end;

procedure TCRMSettings.SetShowNotifications(const Value: Boolean);
begin
  FNotifications := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cNotifications, Value);
end;

procedure TCRMSettings.SetEMailBody(const Value: Boolean);
begin
  FEMailBody := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cEMailBody, Value);
end;

procedure TCRMSettings.SetMassMailAsyncBatchThreshold(const Value: Integer);
begin
  FMassMailAsyncBatchThreshold := Value;
  if FMassMailAsyncBatchThreshold > 1200 then
    FMassMailAsyncBatchThreshold := 1200;
  WriteSetting_Int(cCurrentUserSettingsPath, cMassMailAsyncBatchThreshold,
    FMassMailAsyncBatchThreshold);
end;

procedure TCRMSettings.SetModuleHintsRec(const Value: Boolean);
begin
  FModuleHints := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cModuleHints, Value);
end;

procedure TCRMSettings.SetUseOpenFormsToolbar(const Value: Boolean);
begin
  FUseOpenFormsToolbar := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cUseOpenFormsToolbar, Value);
end;

{ procedure TCRMSettings.SetUseOutlook(const Value: Boolean);
  begin
  FUseOutlook := Value;
  WriteSetting_Bool( cCurrentUserSettingsPath, cUseOutlook, Value );
  end; }

procedure TCRMSettings.SetUseOutlookInternally(const Value: Boolean);
begin
  FUseOutlookInternally := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cUseOutlookInternally, Value);
end;

procedure TCRMSettings.SetAlwaysShowAlerts(const Value: Boolean);
begin
  FAlwaysShowAlerts := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cAlwaysShowAlerts, Value);
end;

procedure TCRMSettings.SetShowCustMaintOnNew(const Value: Boolean);
begin
  FShowCustMaintOnNew := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cShowCustMaintOnNew, Value);
end;

{ TCRMUserProfile }

constructor TCRMUserProfile.Create;
begin
  inherited Create;
end;

function TCRMUserProfile.GetDefaultGroupID: Real;
begin
  Result := 0;
  try
    Result := SelectValueFmtAsFloat('select NVL( crm_group_id, 0 ) as myresult ' +
      'from crm_user_params ' +
      'where Upper( LTrim( RTrim( user_id ))) = Upper( LTrim( RTrim( ''%s'' )))',
      [SecurityManager.UserName]);
  except
    Result := 0;
  end;
end;

function TCRMUserProfile.GetDefaultQueueID: Real;
begin
  Result := 0;
  try
    Result := SelectValueFmtAsFloat
      ('select NVL( crm_queue_type_id, 0 ) as myresult ' +
      'from crm_user_params ' +
      'where Upper( LTrim( RTrim( user_id ))) = Upper( LTrim( RTrim( ''%s'' )))',
      [SecurityManager.UserName]);
  except
    Result := 0;
  end;
end;

function TCRMUserProfile.GetDefaultSubQueueID: Real;
begin
  Result := 0;
  try
    Result := SelectValueFmtAsFloat('select NVL( crm_queue_id, 0 ) as myresult ' +
      'from crm_user_params ' +
      'where Upper( LTrim( RTrim( user_id ))) = Upper( LTrim( RTrim( ''%s'' )))',
      [SecurityManager.UserName]);
  except
    Result := 0;
  end;
end;

function TCRMUserProfile.GetDeleteOwnedOnly: Boolean;
begin
  Result := False;
  try
    Result := SelectValueFmtAsString('select NVL( delete_owned_only, ''N'' ) as myresult '
      + 'from crm_user_params ' +
      'where Upper( LTrim( RTrim( user_id ))) = Upper( LTrim( RTrim( ''%s'' )))',
      [SecurityManager.UserName]) = 'Y';
  except
    Result := False;
  end;
end;

function TCRMSettings.GetUseOutlook: Boolean;
begin
  Result := False;
  try
    Result := SelectValueAsString
      ('select NVL( use_outlook, ''N'' ) as use_outlook ' +
      'from iqsys where rownum < 2') = 'Y';
  except
    Result := False;
  end;
end;

function TCRMSettings.GetUseLotusNotes: Boolean;
begin
  Result := False;
  try
    Result := SelectValueAsString('select NVL( use_lotusnotes, ''N'' ) as use_lotusnotes '
      + 'from iqsys where rownum < 2') = 'Y';
  except
    Result := False;
  end;
end;

procedure TCRMSettings.SetUseLotusNotesInternally(const Value: Boolean);
begin
  FUseLotusNotesInternally := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cUseLotusNotesInternally, Value);
end;

function TCRMSettings.GetUseGroupWise: Boolean;
begin
  Result := False; // in development
  try
    Result := SelectValueAsString
      ('select NVL( use_groupwise, ''N'' ) as use_groupwise ' +
      'from iqsys where rownum < 2') = 'Y';
  except
    Result := False;
  end;
end;

{ TCRMTodaySettings }

function TCRMTodaySettings.EndDateTime: TDateTime;
var
  i: Integer;
begin
  // Returns calculated EndDateTime based on DaysAfterToday
  i := DaysAfterToday;
  if (i > 0) then
    Result := Date + i
  else
    Result := Date;
end;

function TCRMTodaySettings.EndDateTimeStr: string;
begin
  Result := FormatDateTime('ddddd', EndDateTime);
end;

function TCRMTodaySettings.StartDateTime: TDateTime;
var
  i: Integer;
begin
  // Returns calculated StartDateTime based on DaysBeforeToday
  i := DaysBeforeToday;
  if (i > 0) then
    Result := Date - i
  else
    Result := Date;
end;

function TCRMTodaySettings.StartDateTimeStr: string;
begin
  Result := FormatDateTime('ddddd', StartDateTime);
end;

procedure TCRMTodaySettings.SetAutoSize(const Value: TAutoSizeOption);
begin
  FAutoSize := Value;
  WriteSetting_Int(cCurrentUserSettingsPath, cCRMToday_AutoSize, Ord(Value));
end;

procedure TCRMTodaySettings.SetByRange(const Value: Boolean);
begin
  FByRange := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cCRMToday_ByRange, Value);
end;

procedure TCRMTodaySettings.SetDaysAfterToday(const Value: Integer);
begin
  FDaysAfterToday := Value;
  WriteSetting_Int(cCurrentUserSettingsPath, cCRMToday_DaysAfterToday, Value);
end;

procedure TCRMTodaySettings.SetDaysBeforeToday(const Value: Integer);
begin
  FDaysBeforeToday := Value;
  WriteSetting_Int(cCurrentUserSettingsPath, cCRMToday_DaysBeforeToday, Value);
end;

procedure TCRMTodaySettings.SetColumnFormat(const Value: Integer);
begin
  FColumnFormat := Value;
  WriteSetting_Int(cCurrentUserSettingsPath, cCRMToday_ColumnFormat, Value);
end;

procedure TCRMTodaySettings.SetTileFormat(const Value: Integer);
begin
  FTileFormat := Value;
  WriteSetting_Int(cCurrentUserSettingsPath, cCRMToday_TileFormat, Value);
end;

procedure TCRMTodaySettings.SetVisibleModules(const Value: string);
begin
  FVisibleModules := Value;
  WriteSetting_String(cCurrentUserSettingsPath,
    cCRMToday_VisibleModules, Value);
end;

procedure TCRMTodaySettings.SetHints(const Value: Boolean);
begin
  FShowHints := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cCRMToday_ShowHints, Value);
end;

procedure TCRMTodaySettings.SetShowColumnHeadings(const Value: Boolean);
begin
  FShowColumnHeadings := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath,
    cCRMToday_ShowColumnHeadings, Value);
end;

procedure TCRMSettings.SetPromptRollOver(const Value: Boolean);
begin
  FPromptRollOver := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cPromptRollOver, Value);
end;

procedure TCRMSettings.SetPlayTelephonySound(const Value: Boolean);
begin
  FPlayTelephonySound := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cPlayTelephonySound, Value);
end;

procedure TCRMSettings.SetTelephonySoundFile(const Value: string);
begin
  FTelephonySoundFile := Value;
  WriteSetting_String(cCurrentUserSettingsPath, cTelephonySoundFile, Value);
end;

procedure TCRMSettings.SetUseTelephony(const Value: Boolean);
begin
  FUseTelephony := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cUseTelephony, Value);
end;

procedure TCRMSettings.SetPlayTelephonySoundFile(const Value: Boolean);
begin
  FPlayTelephonySoundFile := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cPlayTelephonySoundFile, Value);
end;

procedure TCRMSettings.SetCopySelfOnAlertEMail(const Value: Boolean);
begin
  FCopySelfOnAlertEMail := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cCopySelfOnAlertEMail, Value);
end;

procedure TCRMSettings.SetRefreshRateAssignmentAlert(const Value: Integer);
begin
  FRefreshRateAssignmentAlert := Value;
  WriteSetting_Int(cCurrentUserSettingsPath,
    cRefreshRateAssignmentAlert, Value);
end;

procedure TCRMSettings.SetShowAssignmentAlert(const Value: Boolean);
begin
  FShowAssignmentAlert := Value;
  WriteSetting_Bool(cCurrentUserSettingsPath, cShowAssignmentAlert, Value);
end;

procedure TCRMSettings.SetTelephonyProtocolMode(const Value: Byte);
begin
  FTelephonyProtocolMode := Value;
  WriteSetting_Int(cCurrentUserSettingsPath, cTelephonyProtocolMode, Value);
end;

procedure TCRMSettings.SetTelephonyTAPIDriverName(const Value: string);
begin
  FTelephonyTAPIDriverName := Value;
  WriteSetting_String(cCurrentUserSettingsPath,
    cTelephonyTAPIDriverName, Value);
end;

{$ENDREGION 'TCRMSettings'}

{$REGION 'TMailMergeOptions'}

{ TMailMergeOptions }

procedure TMailMergeOptions.SetDefaultDataFormat(const Value: Byte);
begin
  FDefaultDataFormat := Value;
  WriteSetting_Int(cCurrentUserSettingsPath,
    cMailMerge_DefaultDataFormat, Value);
end;

{$ENDREGION 'TMailMergeOptions'}

end.
