unit WC_5389;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  select_mfgcell;

procedure Test1;
var
  AMfgCell_ID: Real;
begin
  AMfgCell_ID := 2345;
  TFrmSelectMfgCell.DoShowModal(AMfgCell_ID);
end;

initialization

  TTestRepo.RegisterTest('WC_5389', 'Bom', 'select_mfgcell', 'DoShowModal', Test1);

end.
