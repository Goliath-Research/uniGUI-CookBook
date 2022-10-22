unit WC_8206;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  VendAka;

procedure Test1;
begin
  // DoVendorAka(147143);
  ShowMessage('ID=' + FloatToStr(DoVendorAka(148055)));
end;

initialization

TTestRepo.RegisterTest('WC-8206', 'Quote', 'VendAka', 'DoVendorAka', Test1, 1);

end.
