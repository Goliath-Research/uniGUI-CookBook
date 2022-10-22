unit WC_7910;

interface

implementation

uses
  TestReg,
  prn_expected_receipt,
  System.SysUtils;

procedure Test1;
begin
  TFrmPrintDocsExpectedReceipt.DoShowModal(DateTimeToStr(now), DateTimeToStr(now-1));
end;

procedure Test2;
begin
  TFrmPrintDocsExpectedReceipt.DoShow(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization
  TTestRepo.RegisterTest('WC-7910', 'Print_Dialogs',  'prn_expected_receipt', 'DoShowModal', Test1, 1);
  TTestRepo.RegisterTest('WC-7910', 'Print_Dialogs',  'prn_expected_receipt', 'DoShow', Test2, 2);
end.
