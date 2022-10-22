unit WC_7350;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  IRV_Main;

procedure TestIRV_Main;
var
  LVar: Real;
begin
  DoIRV32('test');
end;

initialization

  TTestRepo.RegisterTest('WC-7350', 'Irv32', 'IRV_Main', 'DoIRV32', TestIRV_Main);

end.
