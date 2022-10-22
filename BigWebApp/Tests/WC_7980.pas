unit WC_7980;

interface

implementation

uses
  TestReg,
  ProdSum;

procedure Test1;
begin
  DoProdSummary(194407);
end;

initialization

  TTestRepo.RegisterTest('WC-7980', 'Prod', 'ProdSum', 'DoProdSummary', Test1);
end.
