unit WC_5219;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UnitPriceAcctSplit;

procedure TestDoShowModal;
begin
  DoUnitPriceAmountSplit(55974);
end;

initialization
  TTestRepo.RegisterTest('WC-5219', 'Ar', 'UnitPriceAcctSplit', 'DoShowShipmentDays', TestDoShowModal);
end.
