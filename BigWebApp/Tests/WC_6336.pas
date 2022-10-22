unit WC_6336;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  inv_alternate_item_code;

procedure Test;
begin
  TFrmInvAlternateItemCode.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-6336', 'Inv',  'inv_alternate_item_code', 'DoShow', Test);
end.
