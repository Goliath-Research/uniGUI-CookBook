unit WC_6141;

interface

implementation

uses
  TestReg,
  System.Variants,
  Activity;

procedure Test1;
begin
  DoActivity;
end;

initialization

  TTestRepo.RegisterTest('WC-6141', 'Gl', 'FrmActivity', 'DoActivity', Test1);
end.
