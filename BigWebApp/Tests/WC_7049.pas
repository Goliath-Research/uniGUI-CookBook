unit WC_7049;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_scale;

procedure Test;
begin
  DoFreightScale(35);
end;

initialization
  TTestRepo.RegisterTest('WC-7049', 'Iqshipman',  'shipman_scale', 'DoShowModal', Test);
end.
