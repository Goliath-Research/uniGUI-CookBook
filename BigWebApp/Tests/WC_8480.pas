unit WC_8480;

interface

implementation

uses
  TestReg,
  System.Variants,
  SchdCnfR;

procedure Test1;
begin
  ConfirmRecalc('test');
end;

initialization

  TTestRepo.RegisterTest('WC-8480', 'Sched', 'SchdCnfR', 'DoShowModal', Test1);
end.
