unit WC_5558;

interface

uses
  cc_types;

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_pickcard;

procedure Test1;
var
  b : Int64;
begin
  b := 4;
  SelectCreditCard(20239,15,b);
end;

procedure Test2;
var
  m : TCreditCardRec;
begin
  SelectCreditCardEx(20239,15,m);
end;


initialization

  TTestRepo.RegisterTest('WC-5558', 'Creditcard', 'cc_pickcard', 'SelectCreditCard', Test1,1);
  TTestRepo.RegisterTest('WC-5558', 'Creditcard', 'cc_pickcard', 'SelectCreditCardEx', Test2,2);
end.
