unit WC_7454;

interface

implementation

uses
  TestReg,
  oe_ver;

procedure Test1;
begin
  DoShowVerControl;
end;

initialization

  TTestRepo.RegisterTest('WC-7454', 'Oe', 'oe_ver', 'DoShowVerControl', Test1, 1);
end.
