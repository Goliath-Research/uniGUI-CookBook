unit WC_6273;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  InvMargins;

procedure Test;
begin
  DoINVMargins(456);
end;

initialization
  TTestRepo.RegisterTest('WC-6273', 'Inv',  'InvMargins', 'DoINVMargins', Test);
end.
