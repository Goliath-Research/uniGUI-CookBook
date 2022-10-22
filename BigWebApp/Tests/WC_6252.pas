unit WC_6252;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  CostHist;

procedure Test1;
begin
  TFrmCostHist.DoShow(147168);
end;

initialization

  TTestRepo.RegisterTest('WC-6252', 'Inv', 'CostHist', 'DoShow', Test1, 1);

end.
