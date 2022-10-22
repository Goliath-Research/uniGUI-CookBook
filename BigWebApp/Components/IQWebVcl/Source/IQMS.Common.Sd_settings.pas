unit IQMS.Common.Sd_settings;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Registry,
  IQMS.Common.RegSet;

  procedure CheckShopDataSettingsCreated;
  procedure CheckFreeShopDataSettings;

  { ShopData settings are not by "current user," but by "local machine."
    It is mportant that settings are for all users. }

type
  { TScannedLoginOption }
  { 04/03/2009 "Scanned Login" option:
      sloDefault = default action, which is an employee pick list.
      sloEmployeeNo = prompt for employee number
      sloBadgeNo = prompt for badge number
  }
  TScannedLoginOption = (sloDefault, sloEmployeeNo, sloBadgeNo);

  { TScannedSerialOption }
  {08/24/2010 Scanned Serial option}
  TScannedSerialOption = (ssoSerial, ssoItem);

  { TShopDataSettings }
  TShopDataSettings = class
    private
      { Private declarations }
     function GetADefaultWorkCenterID: Real;
     function GetAllowNavWorkCenters: Boolean;
     function GetHideMouse: Boolean;
     function GetShowTimeClock: Boolean;
     function GetTimeClockType: Integer;
     procedure SetADefaultWorkCenterID(const Value: Real);
     procedure SetAllowNavWorkCenters(const Value: Boolean);
     procedure SetHideMouse(const Value: Boolean);
     procedure SetShowTimeClock(const Value: Boolean);
     procedure SetTimeClockType(const Value: Integer);
     function GetDefaultComponentRejectTransactionCode: Real;
     procedure SetDefaultComponentRejectTransactionCode(const Value: Real);
     function GetScannedLoginOption: TScannedLoginOption;
     procedure SetScannedLoginOption(const Value: TScannedLoginOption);
     function GetQuickInspectionSource: String;
     procedure SetQuickInspectionSource(const Value: String);
     function GetRTLblsShowGridWhenMultiplePartsRunning: Boolean;
     procedure SetRTLblsShowGridWhenMultiplePartsRunning(
       const Value: Boolean);
     function GetLaunchLastFormOnStartup: Boolean;
     procedure SetLaunchLastFormOnStartup(const Value: Boolean);
     function GetPromptForBadgeNumber: Boolean;
     procedure SetPromptForBadgeNumber(const Value: Boolean);
    protected
      { Protected declarations }
      FLocalMachineSettingsPath: string;
    public
      { Public declarations }
      constructor Create;

      // 08/24/2010 Get/set local Registry setting
      procedure SetConfig(const ASetting, AValue: String); overload;
      function GetConfig(const ASetting: String; ADefault: String = ''): String; overload;

      procedure SetConfig(const ASetting: String; AValue: Integer); overload;
      function GetConfig(const ASetting: String; ADefault: Integer = 0): Integer; overload;

      { Properties }
      property ShowTimeClock: Boolean read GetShowTimeClock write SetShowTimeClock;
      property TimeClockType: Integer read GetTimeClockType write SetTimeClockType;
      property AllowNavWorkCenters: Boolean read GetAllowNavWorkCenters write SetAllowNavWorkCenters;
      property DefaultWorkCenterID: Real read GetADefaultWorkCenterID write SetADefaultWorkCenterID;
      property HideMouseCursorImage: Boolean read GetHideMouse write SetHideMouse;
      property DefaultComponentRejectTransactionCodeID: Real read
        GetDefaultComponentRejectTransactionCode write SetDefaultComponentRejectTransactionCode;
      property ScannedLoginOption: TScannedLoginOption read
        GetScannedLoginOption write SetScannedLoginOption;
      property QuickInspectionSource: String read GetQuickInspectionSource
       write SetQuickInspectionSource;
      property RTLblsShowGridWhenMultiplePartsRunning: Boolean
        read GetRTLblsShowGridWhenMultiplePartsRunning write SetRTLblsShowGridWhenMultiplePartsRunning;
      property LaunchLastFormOnStartup: Boolean
        read GetLaunchLastFormOnStartup write SetLaunchLastFormOnStartup;
      property PromptForBadgeNumber: Boolean
        read GetPromptForBadgeNumber write SetPromptForBadgeNumber;
end;

  TWCPalletBuilderSettings = class

    private
    { Private declarations }
    function GetPromptPrintCompletePallet : Boolean;
    procedure SetPromptPrintCompletePallet(const Value: Boolean);
    function GetWarnOnNonConformScan : Boolean;
    procedure SetWarnOnNonConformScan(const Value: Boolean);
    function GetDoNotForceBOLData : Boolean;
    procedure SetDoNotForceBOLData(const Value: Boolean);
    function GetDispoOnPltComplete : Boolean;
    procedure SetDispoOnPltComplete (const Value: Boolean);
    function GetPromptPltQuantity : Boolean;
    procedure SetPromptPltQuantity (const Value: Boolean);
    function GetAllowMixedLots : Boolean;
    procedure SetAllowMixedLots (const Value: Boolean);

    function GetGlobalSwitch( AName : string ) : Boolean;
    protected
    { Protected declarations }
      FCurrentUserSettingsPath: string;

    public
    { Public declarations }
    constructor Create;

    { Properties }
    { Local Settings }
    property PromptPrintCompletePallet : Boolean
      read GetPromptPrintCompletePallet write SetPromptPrintCompletePallet;
    property WarnOnNonConformScan : Boolean
      read GetWarnOnNonConformScan write SetWarnOnNonConformScan;
    { Global Settings }
    property DoNotForceBOLData  : Boolean
      read GetDoNotForceBOLData write SetDoNotForceBOLData;
    property DispoOnPltComplete : Boolean
      read GetDispoOnPltComplete write SetDispoOnPltComplete;
    property PromptPltQuantity  : Boolean
      read   GetPromptPltQuantity write SetPromptPltQuantity;
    property AllowMixedLots     : Boolean
      read   GetAllowMixedLots write SetAllowMixedLots;

  end;

{$REGION 'Constants'}
const
      {$REGION 'Shop Data Constants'}
      // Registry Path
      // Registry Values.  Each setting has a corresponding constant.
      cShowTimeClock = 'TIME_CLOCK';
      cTimeClockType =  'TIME_TYPE';
      cToolbarVisible =  'TOOLBAR_VISIBLE';
      cAllowShowHideToolbar = 'ALLOW_SHOW_HIDE';
      cAllowNavWorkCenter = 'ALLOW_NAV_WC';
      cDefaultWorkCenterID = 'DEFAULT_WORK_CENTER';
      cHideMouse = 'HIDE_MOUSE';
      cQuickInspectionSource = 'QuickInspectionSource';
      cRTLblsShowGridWhenMultiplePartsRunning = 'RTLblsShowGridWhenMultiplePartsRunning';
      cLaunchLastFromOnStartup = 'LaunchLastFormOnStartup';
      cPromptForBadgeNumber = 'PromptForBadgeNumber';

      SCAN_SERIAL_PROMPT_QTY = 'Prompt for scan quantity';
      SCAN_ALLOW_NON_PROD = 'Allow non-production scan';

      {$ENDREGION 'Shop Data Constants'}

      {$REGION 'WC Pallet Builder Constants'}
        // Registry Values.  Each setting has a corresponding constant.
        cPromptPalletComplete = 'PRMPT_PLT_COMPLETE';
        cWarnNCScan = 'WARN_NC_SCAN';
        cDispoOnPalletComplete = 'DISPO_ON_PLT_COMPLETE';
        cPromptPalletQty = 'PROMPT_PLT_QUAN';
      {$ENDREGION 'WC Pallet Builder Constants'}

{$ENDREGION 'Constants'}

var
   ShopDataSettings: TShopDataSettings;
   WCPalletBuilderSettings : TWCPalletBuilderSettings;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils;

{$REGION 'Wrappers'}

procedure CheckShopDataSettingsCreated;
begin
  if not Assigned(ShopDataSettings) then
     ShopDataSettings := TShopDataSettings.Create;
  if not Assigned(WCPalletBuilderSettings) then
     WCPalletBuilderSettings := TWCPalletBuilderSettings.Create;
end;

procedure CheckFreeShopDataSettings;
begin
  if Assigned(ShopDataSettings) then
     FreeAndNil(ShopDataSettings);
  if Assigned(WCPalletBuilderSettings) then
     FreeAndNil(WCPalletBuilderSettings);
end;

{$ENDREGION 'Wrappers'}

{$REGION 'TShopDataSettings'}

{ ---------------------------------------------------------------------------- }
{ TShopDataSettings }
{ ---------------------------------------------------------------------------- }

constructor TShopDataSettings.Create;
begin
  inherited Create;
  FLocalMachineSettingsPath:= 'SOFTWARE\IQMS\Shop Data\Config';
end;

function TShopDataSettings.GetADefaultWorkCenterID: Real;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Float2(FLocalMachineSettingsPath, cDefaultWorkCenterID, 0);
end;

function TShopDataSettings.GetAllowNavWorkCenters: Boolean;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Bool2(FLocalMachineSettingsPath, cAllowNavWorkCenter, TRUE);
end;

function TShopDataSettings.GetConfig(const ASetting: String;
  ADefault: String): String;
begin
  Result := IQMS.Common.RegSet.ReadSetting_String(FLocalMachineSettingsPath, ASetting, ADefault);
end;

function TShopDataSettings.GetConfig(const ASetting: String;
  ADefault: Integer): Integer;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Int(FLocalMachineSettingsPath, ASetting, ADefault);
end;

function TShopDataSettings.GetDefaultComponentRejectTransactionCode: Real;
begin
  Result := SelectValueAsFloat('select comp_rej_trans_code_id from params where rownum < 2');
end;

function TShopDataSettings.GetHideMouse: Boolean;
var
   ADefault: Boolean;
begin
  // Get the setting from System Parameters.  The default is FALSE.
  ADefault := SelectValueAsString('select nvl(touchscreen_hidecursor, ''N'') from iqsys where rownum < 2') = 'Y';
  Result := IQMS.Common.RegSet.ReadSetting_Bool2(FLocalMachineSettingsPath, cHideMouse, ADefault);
end;

function TShopDataSettings.GetLaunchLastFormOnStartup: Boolean;
begin
  // 02/14/2014
  Result := IQMS.Common.RegSet.ReadSetting_Bool2(FLocalMachineSettingsPath, cLaunchLastFromOnStartup, FALSE);
end;

function TShopDataSettings.GetPromptForBadgeNumber: Boolean;
begin
  // 05/15/2014
  Result := IQMS.Common.RegSet.ReadSetting_Bool2(FLocalMachineSettingsPath, cPromptForBadgeNumber, FALSE);
end;

function TShopDataSettings.GetQuickInspectionSource: String;
begin
  Result := IQMS.Common.RegSet.ReadSetting_String(FLocalMachineSettingsPath, cQuickInspectionSource, '');
end;

function TShopDataSettings.GetRTLblsShowGridWhenMultiplePartsRunning: Boolean;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Bool2(FLocalMachineSettingsPath, cRTLblsShowGridWhenMultiplePartsRunning, FALSE);
end;

function TShopDataSettings.GetScannedLoginOption: TScannedLoginOption;
var
   i: Integer;
   o: TScannedLoginOption; // declared in this unit
begin
 Result := sloDefault; // intialize result to default
 i := Trunc(SelectValueAsFloat('select nvl(QI_SCANNED_LOGIN, 0) from params where rownum < 2'));
 if (i <= Ord(High(o))) then
    Result := TScannedLoginOption(i);
end;

function TShopDataSettings.GetShowTimeClock: Boolean;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Bool2(FLocalMachineSettingsPath, cShowTimeClock, TRUE);
end;

function TShopDataSettings.GetTimeClockType: Integer;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Int2(FLocalMachineSettingsPath, cTimeClockType, 0);
end;

procedure TShopDataSettings.SetADefaultWorkCenterID(const Value: Real);
begin
  IQMS.Common.RegSet.WriteSetting_Float2(FLocalMachineSettingsPath, cDefaultWorkCenterID, Value);
end;

procedure TShopDataSettings.SetAllowNavWorkCenters(const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool2(FLocalMachineSettingsPath, cAllowNavWorkCenter, Value);
end;

procedure TShopDataSettings.SetConfig(const ASetting, AValue: String);
begin
  IQMS.Common.RegSet.WriteSetting_String(FLocalMachineSettingsPath, ASetting, AValue);
end;

procedure TShopDataSettings.SetConfig(const ASetting: String;
  AValue: Integer);
begin
  IQMS.Common.RegSet.WriteSetting_Int(FLocalMachineSettingsPath, ASetting, AValue);
end;

procedure TShopDataSettings.SetDefaultComponentRejectTransactionCode(
  const Value: Real);
begin
  if Value = 0 then
     ExecuteCommand('update params set comp_rej_trans_code_id = NULL')
  else
     ExecuteCommandFmt('update params set comp_rej_trans_code_id = %.0f', [Value]);
end;

procedure TShopDataSettings.SetHideMouse(const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool2(FLocalMachineSettingsPath, cHideMouse, Value);
end;

procedure TShopDataSettings.SetLaunchLastFormOnStartup(const Value: Boolean);
begin
  // 02/14/2014
  IQMS.Common.RegSet.WriteSetting_Bool2(FLocalMachineSettingsPath, cLaunchLastFromOnStartup, Value);
end;

procedure TShopDataSettings.SetPromptForBadgeNumber(const Value: Boolean);
begin
  // 05/15/2014
  IQMS.Common.RegSet.WriteSetting_Bool2(FLocalMachineSettingsPath, cPromptForBadgeNumber, Value);
end;

procedure TShopDataSettings.SetQuickInspectionSource(const Value: String);
begin
  IQMS.Common.RegSet.WriteSetting_String(FLocalMachineSettingsPath,
   cQuickInspectionSource, Value);
end;

procedure TShopDataSettings.SetRTLblsShowGridWhenMultiplePartsRunning(
  const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool2(FLocalMachineSettingsPath, cRTLblsShowGridWhenMultiplePartsRunning, Value);
end;

procedure TShopDataSettings.SetScannedLoginOption(
  const Value: TScannedLoginOption);
begin
  // 04/03/2009
  ExecuteCommandFmt('update params set QI_SCANNED_LOGIN = %d', [Ord(Value)]);
end;

procedure TShopDataSettings.SetShowTimeClock(const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool2(FLocalMachineSettingsPath, cShowTimeClock, Value);
end;

procedure TShopDataSettings.SetTimeClockType(const Value: Integer);
begin
  IQMS.Common.RegSet.WriteSetting_Int2(FLocalMachineSettingsPath, cTimeClockType, Value);
end;

{$ENDREGION 'TShopDataSettings'}

{$REGION 'TWCPalletBuilderSettings'}

{ ---------------------------------------------------------------------------- }
{ TWCPalletBuilderSettings }
{ ---------------------------------------------------------------------------- }

constructor TWCPalletBuilderSettings.Create;
begin
  inherited Create;
  FCurrentUserSettingsPath:= 'SOFTWARE\IQMS\WC Pallet Builder\Config';
end;

function TWCPalletBuilderSettings.GetGlobalSwitch(AName: string): Boolean;
begin
  (*retrieves switch from IQSYS3 table*)
  Result:=
    SelectValueFmtAsString('select nvl(value, ''N'') '+
                           '  from iqsys3 '+
                           ' where app_code = ''PALLET_BUILDER'' '+
                           '   and name = ''%s''', [ aName ] ) = 'Y';
end;

function TWCPalletBuilderSettings.GetAllowMixedLots: Boolean;
begin
  Result:= GetGlobalSwitch('YN_ALLOW_MIXED_LOTS');
end;

function TWCPalletBuilderSettings.GetDispoOnPltComplete: Boolean;
begin
//  Result:= GetGlobalSwitch('YN_DISPO_ON_PALLET_COMPLETE');
  Result:= IQMS.Common.RegSet.ReadSetting_Bool(FCurrentUserSettingsPath, cDispoOnPalletComplete, FALSE);
end;

procedure TWCPalletBuilderSettings.SetDispoOnPltComplete(const Value: Boolean);
begin
(*  ExecuteCommandFmt('begin iqsys3_settings.set_pltbldr_disp_plt_complete( ''%s'' ); end; ',
                      [ IQMS.Common.StringUtils.BoolToYN( Value ) ]);
*)
  IQMS.Common.RegSet.WriteSetting_Bool(FCurrentUserSettingsPath, cDispoOnPalletComplete, Value);
end;

function TWCPalletBuilderSettings.GetDoNotForceBOLData: Boolean;
begin
  Result:= GetGlobalSwitch('YN_NOFORCE_BOL');
end;

function TWCPalletBuilderSettings.GetPromptPrintCompletePallet: Boolean;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Bool(FCurrentUserSettingsPath, cPromptPalletComplete, TRUE);
end;

procedure TWCPalletBuilderSettings.SetAllowMixedLots(const Value: Boolean);
begin
  ExecuteCommandFmt('begin iqsys3_settings.set_pltbldr_allow_mixed_lots( ''%s''); end; ',
                     [ IQMS.Common.StringUtils.BoolToYN( Value ) ]);

end;

procedure TWCPalletBuilderSettings.SetDoNotForceBOLData(const Value: Boolean);
begin
  ExecuteCommandFmt('begin iqsys3_settings.set_plt_bldr_noforce_BOL( ''%s'' ); end; ',
                      [ IQMS.Common.StringUtils.BoolToYN( Value ) ]);
end;

function TWCPalletBuilderSettings.GetPromptPltQuantity: Boolean;
begin
//  Result:= GetGlobalSwitch('YN_PROMPT_PALLET_QTY');
  Result := IQMS.Common.RegSet.ReadSetting_Bool(FCurrentUserSettingsPath, cPromptPalletQty, FALSE);
end;

procedure TWCPalletBuilderSettings.SetPromptPltQuantity(const Value: Boolean);
begin
(*  ExecuteCommandFmt('begin iqsys3_settings.set_pltbldr_prmpt_pallet_qty( ''%s'' ); end; ',
                      [ IQMS.Common.StringUtils.BoolToYN( Value ) ]);
*)
  IQMS.Common.RegSet.WriteSetting_Bool(FCurrentUserSettingsPath, cPromptPalletQty, Value);
end;

procedure TWCPalletBuilderSettings.SetPromptPrintCompletePallet(
  const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool(FCurrentUserSettingsPath, cPromptPalletComplete, Value);
end;

function TWCPalletBuilderSettings.GetWarnOnNonConformScan: Boolean;
begin
  Result:= IQMS.Common.RegSet.ReadSetting_Bool(FCurrentUserSettingsPath, cWarnNCScan, TRUE);
end;

procedure TWCPalletBuilderSettings.SetWarnOnNonConformScan(
  const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool(FCurrentUserSettingsPath, cWarnNCScan, Value);
end;


{$ENDREGION 'TWCPalletBuilderSettings'}


end.
