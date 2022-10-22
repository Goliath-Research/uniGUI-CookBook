unit WC_9329;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  oc_reorder;

procedure Test1;
begin
  TFrmOutsourceCentralReorder.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-9329', 'outsource_central', 'oc_reorder', 'DoMCChargeTotals', Test1);
end.
