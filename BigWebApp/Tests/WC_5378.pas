unit WC_5378;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  uniGUIDialogs,
  bom_confirm_del_emp;

procedure Test1;
 var ADeleteFromAllBOMs: Boolean;
begin
  if TFrmBOMConfirmDeleteEmployee.DoShoModal(ADeleteFromAllBOMs) then
    ShowMessage(BoolToStr(ADeleteFromAllBOMs, True));
end;

initialization

  TTestRepo.RegisterTest('WC-5378', 'Bom', 'bom_confirm_del_emp', 'DoShoModal', Test1);

end.
