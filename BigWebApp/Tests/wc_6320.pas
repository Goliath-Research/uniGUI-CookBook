unit WC_6320;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  TariffChange;

procedure Test1;
begin
  DoTariffChange(152512,66,65);
end;

initialization

  TTestRepo.RegisterTest('WC_6320', 'Inv', 'TariffChange', 'DoTariffChange', Test1);
end.
