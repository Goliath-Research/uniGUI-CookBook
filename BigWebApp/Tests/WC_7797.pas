unit WC_7797;

interface

implementation

uses
  TestReg,
  pm_prompt_total_units,
  System.SysUtils,
  Dialogs;

procedure Test1;
var
  Units: Int64;
  UpdateTasks: Boolean;
begin
  if PromptTotalUnits(Units , UpdateTasks) then
    Showmessage('Units: '+ FloatToStr(Units) + ' UpdateTasks: ' + BoolToStr(UpdateTasks));
end;

initialization

  TTestRepo.RegisterTest('WC-7797', 'Pm', 'pm_prompt_total_units', 'DoPMComponents', Test1);

end.
