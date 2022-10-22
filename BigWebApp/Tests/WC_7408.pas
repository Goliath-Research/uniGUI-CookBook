unit WC_7408;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  MCARTOT;

procedure TestCreate;
var
  LFrm: TFrmMCARTotals;
begin
  LFrm:= TFrmMCARTotals.Create(UniGUIApplication.UniApplication);
  LFrm.Show;
end;

initialization

  TTestRepo.RegisterTest('WC-7408', 'Multicur', 'FrmMCARTotals', 'Create', TestCreate);
end.
