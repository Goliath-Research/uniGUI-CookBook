unit WC_6308;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  Planner_Code;

procedure Test;
begin
  TFrmPlannerCode.DoShowModal;
end;

initialization
  TTestRepo.RegisterTest('WC-6308', 'Inv',  'Planner_Code', 'DoShowModal', Test);
end.
