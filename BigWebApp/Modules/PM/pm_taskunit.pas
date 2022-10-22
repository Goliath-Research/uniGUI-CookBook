unit pm_taskunit;

interface

uses
  System.SysUtils,
  System.Classes;

// option for resetting task count when closing a task
type
  TTaskUnitCountOption = (tucResetAdd, tucResetClose, tucZero);

function GetTaskUnitCountOption(APMEqmtID: Real): TTaskUnitCountOption;

implementation

uses
  IQMS.Common.DataLib;

function GetTaskUnitCountOption(APMEqmtID: Real): TTaskUnitCountOption;
var
  i: Integer;
  ATaskResetYN, AZeroYN: String;
begin
  // Returns the "reset task units" option, as specified in MRO options (PMOption.pas)
  // This method returns a clean enumerated type signifying which option to use.

  // Initialize
  i := 0;
  Result := tucResetAdd;

  // If the PMEQMT.ID is provided, then check the option at the equipment level
  if (APMEqmtID > 0) then
    begin
      i := SelectValueFmtAsInteger(
        'SELECT NVL(task_unit_reset,0) FROM pmeqmt WHERE id = %.0f',
        [APMEqmtID]);
      if i > 0 then
        Result := TTaskUnitCountOption(i - 1);
    end;

  // If the PMEQMT.ID is not provided or the option is not set at the equipment
  // level, then get the MRO parameter
  if (i <= 0) or (APMEqmtID = 0) then
    begin
      // The fact that we use character fields for these options is a design
      // flaw from the old days.  Really, the option field should be a
      // number and the user should be able to choose from a combo box list.
      // Since we are working with VARCHAR2 fields, we just have to deal
      // with it this way.
      ATaskResetYN := SelectValueAsString(
        'SELECT NVL( reset_pmwo_on_open, ''N'' ) FROM params WHERE ROWNUM < 2');

      AZeroYN := SelectValueAsString(
        'SELECT NVL( zero_pmwo_task, ''N'' ) FROM params WHERE ROWNUM < 2');

      if (ATaskResetYN = 'Y') and (AZeroYN = 'N') then
        Result := tucResetAdd
      else if (ATaskResetYN = 'N') and (AZeroYN = 'N') then
        Result := tucResetClose
      else if (AZeroYN = 'Y') then
        Result := tucZero
      else
        Result := tucResetAdd;
    end
end;

end.
