unit WC_6684;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ExpMerchants;

procedure Test1;
begin
  DoExpMerchants;
end;

procedure Test2;
begin
 ShowMessage(FloatToStr(GetExpMerchants));
end;

initialization

  TTestRepo.RegisterTest('WC-6684', 'Iqexp', 'ExpMerchants', 'DoExpMerchants', Test1, 1);
  TTestRepo.RegisterTest('WC-6684', 'Iqexp', 'ExpMerchants', 'GetExpMerchants', Test2, 2);

end.
