unit WC_5567;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_select_account;

procedure Test1;
var
  a : Int64;
  b : Boolean;
begin
  a := 15;
  b := True;
  SelectCreditCardAccountID(a,b);
end;

initialization

  TTestRepo.RegisterTest('WC-5567', 'Creditcard', 'cc_select_account', 'SelectCreditCardAccountID', Test1);

end.
