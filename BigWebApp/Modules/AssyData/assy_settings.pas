unit assy_settings;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  IQMS.Common.Registry,
  ComCtrls,
  IQMS.Common.RegSet,
  IQMS.Common.sd_settings;

type
    TAssyDataSettings = class(TShopDataSettings)
  private
    function GetPrintLabelsOnFinalAssy: Boolean;
    procedure SetPrintLabelsOnFinalAssy(const Value: Boolean);
    function GetShowWorkCenterCertifiedProcesses: Boolean;
    procedure SetShowWorkCenterCertifiedProcesses(const Value: Boolean);
    public
      property PrintLabelsOnFinalAssy: Boolean read GetPrintLabelsOnFinalAssy write SetPrintLabelsOnFinalAssy;
      property ShowWorkCenterCertifiedProcesses: Boolean read GetShowWorkCenterCertifiedProcesses write SetShowWorkCenterCertifiedProcesses;
      constructor Create;
    end;

var
   AssyDataSettings: TAssyDataSettings;

procedure CheckAssyDataSettingsCreated;

implementation

const
   cPRINT_LABELS_ON_FINAL_ASSY = 'PRINT_LABELS_ON_FINAL_ASSY';
   cSHOW_WORK_CENTER_CERTIFIED_PROCESSES = 'SHOW_WORK_CENTER_CERTIFIED_PROCESSES';

{ TAssy1DataSettings }

procedure CheckAssyDataSettingsCreated;
begin
  if not Assigned(AssyDataSettings) then
     AssyDataSettings:= TAssyDataSettings.Create;
  if not Assigned(WCPalletBuilderSettings) then
     WCPalletBuilderSettings:= TWCPalletBuilderSettings.Create;
end;


constructor TAssyDataSettings.Create;
begin
  inherited Create;
  FLocalMachineSettingsPath:= 'SOFTWARE\IQMS\Assy Data\Config';
end;

function TAssyDataSettings.GetPrintLabelsOnFinalAssy: Boolean;
begin
  Result:= IQMS.Common.RegSet.ReadSetting_Bool2( FLocalMachineSettingsPath, cPRINT_LABELS_ON_FINAL_ASSY, FALSE);
end;

function TAssyDataSettings.GetShowWorkCenterCertifiedProcesses: Boolean;
begin
  Result:= IQMS.Common.RegSet.ReadSetting_Bool2( FLocalMachineSettingsPath, cSHOW_WORK_CENTER_CERTIFIED_PROCESSES, TRUE);
end;

procedure TAssyDataSettings.SetPrintLabelsOnFinalAssy(const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool2(FLocalMachineSettingsPath, cPRINT_LABELS_ON_FINAL_ASSY, Value);
end;

procedure TAssyDataSettings.SetShowWorkCenterCertifiedProcesses(
  const Value: Boolean);
begin
  IQMS.Common.RegSet.WriteSetting_Bool2(FLocalMachineSettingsPath, cSHOW_WORK_CENTER_CERTIFIED_PROCESSES, Value);
end;

end.

