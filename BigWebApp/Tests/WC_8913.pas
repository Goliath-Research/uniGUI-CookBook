unit WC_8913;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  VENDSALE;

procedure Test1;
begin
  DoVendSalesAnalysis(1);
end;

initialization

  TTestRepo.RegisterTest('WC-8913', 'Vendor', 'VENDSALE', 'DoVendSalesAnalysis', Test1, 1);

end.
