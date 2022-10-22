unit WC_7969;

interface

implementation

uses
  TestReg,
  System.Variants,
  Prod_Share,
  ProdClone;

procedure TestSelectShift;
var ACurrentShift, ASelectShift: TProdCargo;
begin
  TFrmProdCloneShift.SelectShift(ACurrentShift,AselectShift);
end;

initialization

  TTestRepo.RegisterTest('WC-7969', 'Prod', 'ProdClone', 'SelectShift', TestSelectShift);
end.
