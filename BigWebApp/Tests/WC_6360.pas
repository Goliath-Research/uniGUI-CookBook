unit WC_6360;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  inv_proprietary;

procedure Test;
begin
  TFrmInvProprietary.DoShowModal(1145);
end;

initialization
  TTestRepo.RegisterTest('WC-6360', 'Inv',  'inv_proprietary', 'DoShow', Test);
end.
