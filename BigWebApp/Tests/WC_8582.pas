unit WC_8582;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  sd_uomconv;

procedure Test1;
var
  a : Real;
begin
  a := 48;
  IQGetConvertedUOM_SD('test1','test2',a,'CS',149328)
end;

initialization

  TTestRepo.RegisterTest('WC-8582', 'Shopdata', 'sd_uomconv', 'IQGetConvertedUOM_SD', Test1);
end.
