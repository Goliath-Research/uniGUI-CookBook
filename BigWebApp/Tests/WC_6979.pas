unit WC_6979;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_common,
  shipman_account;

procedure Test;
begin
  DoEditAccount(452, ctFedExExpress);
end;

initialization
  TTestRepo.RegisterTest('WC-6979', 'Iqshipman',  'shipman_account', 'DoEditAccount', Test);
end.
