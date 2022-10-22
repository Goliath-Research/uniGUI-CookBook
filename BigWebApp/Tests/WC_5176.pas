unit WC_5176;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  StatisticalAllocValues;

procedure Test1;
begin
  DoSelectSegmentValues(2, 'TYPE', 'SEGMENT');
end;

procedure Test2;
begin
  DoSelectSegmentValues(2, '', 'GLACCOUNT');
end;

procedure Test3;
begin
  DoSelectSegmentValues(2, '', '');
end;

initialization

TTestRepo.RegisterTest('WC-5176', 'Ap', 'StatisticalAllocValues', 'Do_ICA_Select_PO_Receipts', Test1, 1);
TTestRepo.RegisterTest('WC-5176', 'Ap', 'StatisticalAllocValues', 'Do_ICA_Select_PO_Receipts', Test2, 2);
TTestRepo.RegisterTest('WC-5176', 'Ap', 'StatisticalAllocValues', 'Do_ICA_Select_PO_Receipts', Test3, 3);

end.
