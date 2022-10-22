unit WC_5534;

interface

uses
  cc_types;

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_add_credit_card;

procedure Test1;
begin
  TFrmCCAddCreditCard.DoShowModal(20239,227);
end;

procedure Test2;
var
  a : Integer;
begin
  a := 227;
  TFrmCCAddCreditCard.DoAddNew(20239,a);
end;


initialization

  TTestRepo.RegisterTest('WC-5534', 'Creditcard', 'cc_add_credit_card', 'DoShowModal', Test1,1);
  TTestRepo.RegisterTest('WC-5534', 'Creditcard', 'cc_add_credit_card', 'DoAddNew', Test2,2);
end.
