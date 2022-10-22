unit WC_6347;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  UniGUIApplication,
  inv_customer_rma;

procedure Test1;
begin
  TFrmInvCustomerRMA.DoShow(148444);
end;

initialization

  TTestRepo.RegisterTest('WC-6347', 'Inv', 'inv_customer_rma', 'DoShow', Test1);

end.
