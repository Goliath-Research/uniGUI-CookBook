unit WC_7406;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  MCAPTOT;

procedure TestCreate;
var
  LFrm: TFrmMCAPTotals;
begin
  LFrm:= TFrmMCAPTotals.Create(UniGUIApplication.UniApplication);
  LFrm.Show;
end;

initialization

  TTestRepo.RegisterTest('WC-7406', 'Multicur', 'FrmMCAPTotals', 'Create', TestCreate);
end.
