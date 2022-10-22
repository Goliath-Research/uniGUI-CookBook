unit WC_6398;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  inv_upc_codes;

procedure Test;
begin
  TFrmInvUPCCodes.DoShowModal(147536);
end;

initialization
  TTestRepo.RegisterTest('WC-6398', 'Inv',  'inv_upc_codes', 'DoShowModal', Test);
end.
