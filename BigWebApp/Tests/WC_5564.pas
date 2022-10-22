unit WC_5564;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_purgelog;

procedure Test1;
begin
  DoCCPurgeLog;
end;

procedure Test2;
begin
  DoCCPurgeLogForCustomer(141);
end;

initialization

  TTestRepo.RegisterTest('WC-5564', 'Creditcard', 'cc_purgelog', 'DoCCPurgeLog', Test1,1);
  TTestRepo.RegisterTest('WC-5564', 'Creditcard', 'cc_purgelog', 'DoCCPurgeLogForCustomer', Test2,2);

end.
