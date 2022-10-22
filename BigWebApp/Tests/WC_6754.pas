unit WC_6754;

interface

implementation

uses
  TestReg,
  System.Variants,
  HrSelEmp;

procedure Test1;
begin
  DoHREmpSelect('test');
end;

initialization

  TTestRepo.RegisterTest('WC-6754', 'Iqhr', 'FrmHrSelEmp', 'DoHREmpSelect', Test1);
end.
