unit WC_5203;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  ChangeInvoiceNo;

procedure Test1;
begin
  DoChangeInvoiceNo(11840);
end;

initialization

  TTestRepo.RegisterTest('WC_5203', 'Ar', 'ChangeInvoiceNo', 'DoChangeInvoiceNo', Test1);
end.
