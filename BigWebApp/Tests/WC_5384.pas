unit WC_5384;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  bom_secured_confirm_ptsper_zero,
  uniGUIApplication;

procedure Test1;
begin
  TFrmBOMSecuredConfirmPtsPerZero.Create(uniGUIApplication.UniApplication).Show;
end;

initialization

  TTestRepo.RegisterTest('WC_5384', 'Bom', 'bom_secured_confirm_ptsper_zero', 'Call the default constructor', Test1);

end.
