unit WC_8230;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RBom_Cost_Param;

procedure Test1;
begin
  TFrmRBomCostParam.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8230', 'Rbom', 'RBom_Cost_Param', 'DoShowModal', Test1, 1);

end.
