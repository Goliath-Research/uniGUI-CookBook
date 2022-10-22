unit WC_5376;

interface

implementation

uses
  TestReg,
  MainModule,
  bom_clone,
  Dialogs;

procedure Test1;
var
  c2 : Real;
begin
  if TFrmBom_Clone.DoShowModal(15,c2) then
    ShowMessage('Ok');
end;

initialization

  TTestRepo.RegisterTest('WC-5376', 'Bom', 'bom_clone', 'DoShowModal', Test1);

end.
