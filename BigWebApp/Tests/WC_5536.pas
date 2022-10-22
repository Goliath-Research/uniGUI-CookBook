unit WC_5536;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_cardtypes;

procedure Test1;
begin
  DoAcceptedCreditCards;
end;

initialization

  TTestRepo.RegisterTest('WC-5536', 'Creditcard', 'cc_cardtypes', 'DoAcceptedCreditCards', Test1);

end.
