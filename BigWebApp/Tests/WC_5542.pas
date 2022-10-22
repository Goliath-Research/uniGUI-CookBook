unit WC_5542;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_custcards;

procedure Test1;
begin
  DoShowCustCreditCards(20239);
end;

initialization

  TTestRepo.RegisterTest('WC-5542', 'Creditcard', 'cc_custcards', 'DoShowCustCreditCards', Test1);

end.
