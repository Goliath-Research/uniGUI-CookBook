unit WC_5862;

interface

implementation

uses
  TestReg,
  Consolidators;

procedure Test1;
begin
  DoConsolidator;
end;

initialization

TTestRepo.RegisterTest('WC-5862', 'Customer', 'Consolidators', 'DoConsolidator', Test1, 1);

end.
