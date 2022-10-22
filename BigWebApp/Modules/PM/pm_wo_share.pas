unit pm_wo_share;

interface

// for units that must call pm_wo

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule;

function get_wo_mfgcell_id(APmWo_ID: Real): Real;

// Close a work order task
procedure CloseWorkOrderTask(APMWoDtlID: Real);

// Get the new total units for a task, if closing the task.
function NewTotalUnitsOnCloseTask(APMEqmtID, APMWoDtlID: Real): Real;

procedure CheckCanCloseWorkOrderDetail(const APMWoDtlID: Real);
procedure CheckCanCloseAllWorkOrderDetail(const APMWoID: Real);

function WorkOrderDetailHasIncompleteChecklist(const APMWoDtlID: Real): Boolean;
function WorkOrderHasIncompleteChecklist(const APMWoID: Real): Boolean;

implementation

uses
  pm_rscstr,
  pm_taskunit,
  IQMS.Common.DataConst,
  IQMS.Common.DataLib,
  IQMS.Common.Dates;

function get_wo_mfgcell_id(APmWo_ID: Real): Real;
begin
  Result := SelectValueFmtAsInt64(
    'select p.mfgcell_id                                                            '
    +
    '  from ( select min(pmjob_id) as pmjob_id from pmwo_dtl where pmwo_id = %d) d, '
    +
    '       pmjob j,                                                                '
    +
    '       pmeqmt p                                                                '
    +
    ' where                                                                         '
    +
    '       d.pmjob_id = j.id                                                       '
    +
    '   and j.pmeqmt_id = p.id                                                      ',
    [Trunc(APmWo_ID)]);
end;

function NewTotalUnitsOnCloseTask(APMEqmtID, APMWoDtlID: Real): Real;
var
  AOption: TTaskUnitCountOption;
begin
  Result := 0; // initial

  if (APMEqmtID = 0) or (APMWoDtlID = 0) then
    Exit;

  // Get the option
  AOption := pm_taskunit.GetTaskUnitCountOption(APMEqmtID);

  if AOption = tucZero then // PARAMS.ZERO_PMWO_TASK = 'Y' (True)? Just pass 0.
    Result := 0
  else if (AOption = tucResetClose) then
    // Is PARAMS.RESET_PMWO_ON_OPEN = 'N' (False)? Then use this block
    begin
      with TFDQuery.Create(nil) do
        try
          ConnectionName := cnstFDConnectionName; // UniMainModule.FDConnection1;
          SQL.Add('select NVL(decode(sign(v.new_count), -1, 0, v.new_count), 0) as total_units ');
          SQL.Add('from (select NVL(j.total_units, 0) - NVL(d.start_units, 0) as new_count ');
          SQL.Add('       from pmjob j, pmwo_dtl d ');
          SQL.Add(Format('       where j.id = d.pmjob_id and d.id = %d) v',
            [Trunc(APMWoDtlID)]));
          Open;
          Result := FieldByName('TOTAL_UNITS').AsFloat;
        finally
          Free;
        end;
    end
  else // Is PARAMS.RESET_PMWO_ON_OPEN = 'Y' (True)? Then use this block
    begin
      Result := SelectValueFmtAsFloat(
        'select j.total_units from pmjob j, pmwo_dtl d where j.id = d.pmjob_id and d.id = %d',
        [Trunc(APMWoDtlID)]);
    end;
end;

procedure CloseWorkOrderTask(APMWoDtlID: Real);
var
  APMEqmtID, APMJobID: Int64;
  ATaskTotalUnits, AEquipmentTotalUnits: Real;
  AClosedDateStr: string;
begin
  APMJobID := SelectValueFmtAsInt64(
    'SELECT pmjob_id FROM pmwo_dtl WHERE id = %d',
    [Trunc(APMWoDtlID)]);
  APMEqmtID := SelectValueFmtAsInt64(
    'SELECT pmeqmt_id FROM pmjob WHERE id = %d',
    [APMJobID]);
  // Total equipment units
  AEquipmentTotalUnits := SelectValueFmtAsFloat(
    'SELECT NVL(total_units,0) FROM pmeqmt WHERE id = %d',
    [APMEqmtID]);
  // Total units for the task
  ATaskTotalUnits := NewTotalUnitsOnCloseTask(APMEqmtID, APMWoDtlID);
  // Get the "closed date" string for consistency
  AClosedDateStr := FormatDateTime('mm/dd/yyyy hh:nn',
    IQMS.Common.Dates.IQOracleAdjustedDateTime);
  // Close the work order task
  ExecuteCommandFmt(
    'UPDATE pmwo_dtl SET incomplete = ''N'', wo_open = ''N'', ' +
    'close_units = %f, closed_date = to_date(''%s'', ''MM/DD/RRRR HH24:MI''), ' +
    'closed_by = iqms.misc.getusername WHERE id = %d',
    [AEquipmentTotalUnits, AClosedDateStr, Trunc(APMWoDtlID)]);

  // Update the PMJOB record if applicable
  if APMJobID > 0 then
    ExecuteCommandFmt(
      'UPDATE pmjob SET last_closed_wo = TO_DATE(''%s'', ' +
      '''MM/DD/RRRR HH24:MI''), last_update_date = TO_DATE(''%s'', ' +
      '''MM/DD/RRRR HH24:MI''), total_units = %f WHERE id = %d',
      [AClosedDateStr, FormatDateTime('mm/dd/yyyy hh:nn',
      IQOracleAdjustedDateTime), ATaskTotalUnits, APMJobID]);
end;

procedure CheckCanCloseWorkOrderDetail(const APMWoDtlID: Real);
begin
  if WorkOrderDetailHasIncompleteChecklist(APMWoDtlID) then
    // pm_rscstr.cTXT0000349 =
    // 'Checklist has incomplete critical items.  Cannot close this task.';
    raise Exception.Create(pm_rscstr.cTXT0000349);
end;

procedure CheckCanCloseAllWorkOrderDetail(const APMWoID: Real);
begin
  if WorkOrderHasIncompleteChecklist(APMWoID) then
    // pm_rscstr.cTXT0000350 =
    // 'Checklist has incomplete critical items.  Cannot close this task.';
    raise Exception.Create(pm_rscstr.cTXT0000350);
end;

function WorkOrderDetailHasIncompleteChecklist(const APMWoDtlID: Real): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1 FROM pmwo_dtl_checklist ' +
    'WHERE pmwo_dtl_id = %d AND NVL(critical, ''N'') = ''Y'' AND ' +
    'status IS NULL AND ROWNUM < 2', [Trunc(APMWoDtlID)]) = 1;
end;

function WorkOrderHasIncompleteChecklist(const APMWoID: Real): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1 FROM pmwo_dtl ' +
    'WHERE pmwo_id = %d AND EXISTS (SELECT 1 FROM pmwo_dtl_checklist ' +
    'WHERE pmwo_dtl_id = pmwo_dtl.id AND NVL(wo_open, ''N'') = ''Y'' AND ' +
    'NVL(critical, ''N'') = ''Y'' AND status IS NULL AND ROWNUM < 2)',
    [Trunc(APMWoID)]) = 1;
end;

end.
