unit WC_8545;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  Sd_EditDownTime;

procedure Test1;
var
  a,b : TDateTime;
  c,d,e: String;
begin
  a := 9/9/2015 ;
  b := 10/10/2015 ;
  c := 'test1';
  d := 'test2';
  e := 'test3';
  DoEditDownTime(True,True,a,b,c,d,e);
end;

initialization

  TTestRepo.RegisterTest('WC-8545', 'Shopdata', 'Sd_EditDownTime', 'DoEditDownTime', Test1);
end.
