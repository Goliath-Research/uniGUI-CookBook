unit WC_5190;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ARCustMt;

procedure TestDoShowModal;
begin
  DoARCustomerMaterial(55974);
end;

initialization
  TTestRepo.RegisterTest('WC-5190', 'Ar', 'ARCustMt', 'DoShowShipmentDays', TestDoShowModal);
end.
