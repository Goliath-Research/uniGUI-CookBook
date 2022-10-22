unit WC_6264;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  Inv_UOM;

procedure Test;
begin
  GetInv_UOM2;
end;

initialization
  TTestRepo.RegisterTest('WC-6264', 'Inv',  'Inv_UOM', 'GetInv_UOM2', Test);
end.
