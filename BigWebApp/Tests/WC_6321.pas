unit WC_6321;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  TariffCodes;

procedure Test;
begin
  DoTariffCodes;
end;

initialization
  TTestRepo.RegisterTest('WC-6321', 'Inv',  'TariffCodes', 'DoTariffCodes', Test);
end.
