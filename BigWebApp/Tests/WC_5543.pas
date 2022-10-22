unit WC_5543;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_custcards_new;

procedure Test1;
var
  a : Int64;
begin
  a := 143;
  DoInsertNewCustCreditCard(20239,a);
end;

initialization

  TTestRepo.RegisterTest('WC-5543', 'Creditcard', 'cc_custcards_new', 'DoInsertNewCustCreditCard', Test1);

end.
