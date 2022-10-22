unit WC_7061;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_ups_custom_values;

procedure Test;
begin
  DoUPSCustomValues;
end;

initialization
  TTestRepo.RegisterTest('WC-7061', 'Iqshipman',  'shipman_ups_custom_values', 'DoUPSCustomValues', Test);
end.
