unit WC_8999;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wo_chk_assy_pit_pending;

procedure Test1;
begin
  CheckAssyPendingProcessingInPIT(1);
end;

initialization

  TTestRepo.RegisterTest('WC-8999', 'Wrkorder', 'wo_chk_assy_pit_pending', 'CheckAssyPendingProcessingInPIT', Test1, 1);

end.
