unit WC_7906;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  prn_cc_receipt;

procedure Test1;
begin
  DoCreditCardReceipt('test1','test2');
end;
initialization

  TTestRepo.RegisterTest('WC-7906', 'Print_Dialogs', 'prn_cc_receipt', 'DoCreditCardReceipt', Test1);

end.
