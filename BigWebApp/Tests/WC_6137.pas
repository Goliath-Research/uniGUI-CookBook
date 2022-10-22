unit WC_6137;

interface

implementation

uses
  TestReg,
  System.Variants,
  ACCONFIG;

procedure Test1;
begin
  DOACConfig;
end;

initialization

  TTestRepo.RegisterTest('WC-6137', 'Gl', 'FrmActDrillConf', 'DOACConfig', Test1);
end.
