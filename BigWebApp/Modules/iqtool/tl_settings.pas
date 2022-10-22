unit tl_settings;

interface

uses
  System.SysUtils,
  Vcl.Controls,
  IQMS.Common.Registry,
  IQMS.Common.RegSet,
  uniGUIClasses,
  uniGUIApplication;

procedure CheckToolingSettingsCreated;

type
  { TTemplates }
  TTemplates = class
    private
      // Property methods
      function GetDragMode: TDragMode;
      procedure SetDragMode(const Value: TDragMode);
    public
      constructor Create;
    published
      property TreeDragMode: TDragMode read GetDragMode write SetDragMode;
  end;

type
  { TToolingSettings }
  TToolingSettings = class
    private
      // Property methods
      FMarkUpRate: Real;
      FLaborRate: Real;
      FShowTax: Boolean;
      FWorkflowApproval: Boolean;
      FShowCRMProspects: Boolean;
    FFilterProjectManagerEmployees: Boolean;
      function GetDragMode: TDragMode;
      procedure SetDragMode(const Value: TDragMode);
      function GetLaborRate: Real;
      function GetMURate: Real;
      procedure SetLaborRate(const Value: Real);
      procedure SetMURate(const Value: Real);
      function GetShowTax: Boolean;
      procedure SetShowTax(const Value: Boolean);
      procedure SetActivitySummary_ByDateRange(const Value: Boolean);
      procedure SetActivitySummary_EndDate(const Value: TDateTime);
      procedure SetActivitySummary_StartDate(const Value: TDateTime);
      function GetActivitySummary_ByDateRange: Boolean;
      function GetActivitySummary_EndDate: TDateTime;
      function GetActivitySummary_StartDate: TDateTime;
      procedure SetWorkflowApproval(const Value: Boolean);
      procedure SetShowCRMProspects(const Value: Boolean);
    procedure SetFilterProjectManagerEmployees(const Value: Boolean);
    public
      Templates: TTemplates;
      constructor Create;
      procedure RefreshSettings; // Retrieves settings saved in the Registry
    published
      // Properties
      property TreeDragMode: TDragMode read GetDragMode write SetDragMode;
      property MarkUpRate: Real read FMarkUpRate write SetMURate;
      property LaborRate: Real read FLaborRate write SetLaborRate;
      property ShowTax: Boolean read FShowTax write SetShowTax;
      property ActivitySummary_ByDateRange: Boolean
        read GetActivitySummary_ByDateRange
        write SetActivitySummary_ByDateRange;
      property ActivitySummary_StartDate: TDateTime
        read GetActivitySummary_StartDate write SetActivitySummary_StartDate;
      property ActivitySummary_EndDate: TDateTime
        read GetActivitySummary_EndDate write SetActivitySummary_EndDate;
      property WorkflowApproval: Boolean read FWorkflowApproval
        write SetWorkflowApproval;
      property ShowCRMProspects: Boolean read FShowCRMProspects
        write SetShowCRMProspects;
      property FilterProjectManagerEmployees: Boolean read FFilterProjectManagerEmployees
        write SetFilterProjectManagerEmployees;

  end;

{$REGION 'Constants'}


const
  // Registry Path - so
  cCurrentUserSettingsPath = '\Software\IQMS\IQWin32\IQTool.exe\Settings';
  // Registry Values.  Each setting has a corresponding constant.
  cAllowDragDropMain = 'AllowDragDropMain';
  cAllowDragDropTemplate = 'AllowDragDropTemplate';
  cActivitySummary_ByDateRange = 'ActivitySummary_ByDateRange';
  cActivitySummary_StartDate = 'ActivitySummary_StartDate';
  cActivitySummary_EndDate = 'ActivitySummary_EndDate';
  cCRMProspectFilter = 'Show CRM Prospects';
  cFilterProjectManagerEmployees = 'FilterProjectManagerEmployees';

{$ENDREGION 'Constants'}


var
  ToolingSettings: TToolingSettings;

implementation

uses
  IQMS.Common.Boolean,
  IQMS.Common.DataLib,
  IQMS.Common.NLS;

{$REGION 'Global wrappers'}


/// <summary>  Ensure ToolingSettings object is instantiated.</summary>
procedure CheckToolingSettingsCreated;
begin
  if not Assigned(ToolingSettings) then
    ToolingSettings := TToolingSettings.Create;
end;

{$ENDREGION 'Global wrappers'}

{$REGION 'TToolingSettings'}

{ TToolingSettings }

{$REGION 'Public methods'}


constructor TToolingSettings.Create;
begin
  inherited Create;
  Templates := TTemplates.Create;
  RefreshSettings;
end;

procedure TToolingSettings.RefreshSettings;
begin
  // FActivityDetails       := ReadSetting_Bool( cActivityDetails             );
  FMarkUpRate := SelectValueAsFloat('SELECT NVL( mu_rate, 0 ) FROM tool_option ' +
    'WHERE ROWNUM < 2');
  FLaborRate := SelectValueAsFloat('SELECT NVL( labor_rate, 0 ) FROM tool_option ' +
    'WHERE ROWNUM < 2');
  FShowTax := SelectValueAsString('SELECT NVL( show_tax, ''N'' ) FROM ' +
    'tool_option WHERE ROWNUM < 2') = 'Y';
  FWorkflowApproval := SelectValueAsString('SELECT NVL( wf_approval, ''N'' ) ' +
    'FROM tool_option WHERE ROWNUM < 2') = 'Y';
  FShowCRMProspects := IQMS.Common.RegSet.ReadSetting_Bool(cCurrentUserSettingsPath,
    cCRMProspectFilter, False);
  FFilterProjectManagerEmployees:= IQMS.Common.RegSet.ReadSetting_Bool(cCurrentUserSettingsPath,
    cFilterProjectManagerEmployees, False);
end;

{$ENDREGION 'Public methods'}

{$REGION 'Private methods'}


function TToolingSettings.GetDragMode: TDragMode;
begin
  if IQMS.Common.RegSet.ReadSetting_Bool(cCurrentUserSettingsPath, cAllowDragDropMain,
    TRUE) then
    Result := dmAutomatic
  else
    Result := dmManual;
end;

procedure TToolingSettings.SetDragMode(const Value: TDragMode);
begin
  IQMS.Common.RegSet.WriteSetting_Bool(cCurrentUserSettingsPath, cAllowDragDropMain,
    (Value = dmAutomatic));
end;

procedure TToolingSettings.SetFilterProjectManagerEmployees(
  const Value: Boolean);
begin
  FFilterProjectManagerEmployees := Value;
  IQMS.Common.RegSet.WriteSetting_Bool(cCurrentUserSettingsPath, cFilterProjectManagerEmployees,
    FFilterProjectManagerEmployees);
end;

function TToolingSettings.GetLaborRate: Real;
begin
  Result := FLaborRate;
end;

procedure TToolingSettings.SetLaborRate(const Value: Real);
begin
  FLaborRate := Value;
  ExecuteCommandFmt('UPDATE tool_option SET labor_rate = %.2f', [Value]);
end;

function TToolingSettings.GetMURate: Real;
begin
  Result := FMarkUpRate;
end;

procedure TToolingSettings.SetMURate(const Value: Real);
begin
  FMarkUpRate := Value;
  ExecuteCommandFmt('UPDATE tool_option SET mu_rate = %.2f', [Value]);
end;

function TToolingSettings.GetShowTax: Boolean;
begin
  Result := FShowTax;
end;

procedure TToolingSettings.SetShowCRMProspects(const Value: Boolean);
begin
  FShowCRMProspects := Value;
  IQMS.Common.RegSet.WriteSetting_Bool(cCurrentUserSettingsPath, cCRMProspectFilter,
    FShowCRMProspects);
end;

procedure TToolingSettings.SetShowTax(const Value: Boolean);
begin
  FShowTax := Value;
  ExecuteCommandFmt('UPDATE tool_option SET show_tax = ''%s''',
    [BoolToYN(Value)]);
  // pas; IQMS.Common.Boolean.pas
end;

procedure TToolingSettings.SetWorkflowApproval(const Value: Boolean);
begin
  // 03/11/2013
  FWorkflowApproval := Value;
  ExecuteCommandFmt('UPDATE tool_option SET wf_approval = ''%s''',
    [BoolToYN(Value)]);
  // pas; IQMS.Common.Boolean.pas
end;

procedure TToolingSettings.SetActivitySummary_ByDateRange(
  const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool(cCurrentUserSettingsPath,
    cActivitySummary_ByDateRange, Value);
end;

procedure TToolingSettings.SetActivitySummary_EndDate(
  const Value: TDateTime);
begin
  IQMS.Common.RegSet.WriteSetting_DateTime(cCurrentUserSettingsPath,
    cActivitySummary_EndDate, Value);
end;

procedure TToolingSettings.SetActivitySummary_StartDate(
  const Value: TDateTime);
begin
  IQMS.Common.RegSet.WriteSetting_DateTime(cCurrentUserSettingsPath,
    cActivitySummary_StartDate, Value);
end;

function TToolingSettings.GetActivitySummary_ByDateRange: Boolean;
begin
  Result := IQMS.Common.RegSet.ReadSetting_Bool(cCurrentUserSettingsPath,
    cActivitySummary_ByDateRange, False);
end;

function TToolingSettings.GetActivitySummary_EndDate: TDateTime;
begin
  Result := IQMS.Common.RegSet.ReadSetting_DateTime(cCurrentUserSettingsPath,
    cActivitySummary_EndDate, Date);
end;

function TToolingSettings.GetActivitySummary_StartDate: TDateTime;
begin
  Result := IQMS.Common.RegSet.ReadSetting_DateTime(cCurrentUserSettingsPath,
    cActivitySummary_StartDate, Date);
end;

{$ENDREGION 'Private methods'}

{$ENDREGION 'TToolingSettings'}

{$REGION 'TTemplates'}


constructor TTemplates.Create;
begin
  inherited Create;
end;

function TTemplates.GetDragMode: TDragMode;
begin
  if IQMS.Common.RegSet.ReadSetting_Bool(cCurrentUserSettingsPath, cAllowDragDropTemplate,
    TRUE) then
    Result := dmAutomatic
  else
    Result := dmManual;
end;

procedure TTemplates.SetDragMode(const Value: TDragMode);
begin
  IQMS.Common.RegSet.WriteSetting_Bool(cCurrentUserSettingsPath, cAllowDragDropTemplate,
    (Value = dmAutomatic));
end;

{$ENDREGION 'TTemplates'}

end.
