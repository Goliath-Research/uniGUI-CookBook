unit WC_5833;

interface

implementation

uses
  TestReg,
  price_break_sum,
  Dialogs;

procedure Test1;
var
  ArcustoID, ArinvtID: Real;
begin
  ArcustoID := 20523;
  ArinvtID := 149001;
  DoArinvtBreaksSummary(ArcustoID, ArinvtID);
end;

procedure Test2;
var
  ArcustoID, AkaID: Real;
begin
  ArcustoID := 20523;
  AkaID := 122;
  DoAKABreaksSummary(ArcustoID, AkaID);
end;

procedure Test3;
var
  QinvtID: Real;
begin
  QinvtID := 154;
  DoQinvtBreaksSummary(QinvtID);
end;

initialization

  TTestRepo.RegisterTest('WC-5833', 'CRM_Quote', 'price_break_sum', 'DoArinvtBreaksSummary', Test1, 1);
  TTestRepo.RegisterTest('WC-5833', 'CRM_Quote', 'price_break_sum', 'DoAKABreaksSummary', Test2, 2);
  TTestRepo.RegisterTest('WC-5833', 'CRM_Quote', 'price_break_sum', 'DoQinvtBreaksSummary', Test3, 3);

end.
