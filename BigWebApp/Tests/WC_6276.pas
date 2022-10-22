unit WC_6276;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  InvRolup;

procedure Test;
begin
  DoShowCostElem_Rollup(147468);
end;

initialization
  TTestRepo.RegisterTest('WC-6276', 'Inv',  'InvRolup', 'DoChangeItemno', Test);
end.
