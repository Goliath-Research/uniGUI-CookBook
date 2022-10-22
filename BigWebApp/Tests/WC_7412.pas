unit WC_7412;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  MCORDTOT;

procedure TestCreate;
var
  LFrm: TFrmMCOrdTotals;
begin
  LFrm:= TFrmMCOrdTotals.Create(UniGUIApplication.UniApplication);
  LFrm.Show;
end;

initialization

  TTestRepo.RegisterTest('WC-7412', 'Multicur', 'FrmMCOrdTotals', 'Create', TestCreate);
end.
