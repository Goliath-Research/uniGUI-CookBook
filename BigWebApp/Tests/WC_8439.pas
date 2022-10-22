unit WC_8439;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  SelSales;

procedure Test1;
begin
  ProcessSelectedSalesPeople;
end;

initialization

  TTestRepo.RegisterTest('WC-8439', 'Salesmen', 'SelSales', 'ProcessSelectedSalesPeople', Test1);

end.
