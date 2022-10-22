unit WC_6358;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  inv_po_param_div;

procedure Test;
begin
  TFrmInvPOParamsDivision.DoShow(24);
end;

initialization
  TTestRepo.RegisterTest('WC-6358', 'Inv',  'inv_po_param_div', 'DoShow', Test);
end.
