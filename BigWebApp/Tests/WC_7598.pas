unit WC_7598;

interface

implementation

uses
  TestReg,
  System.Variants,
  sel_div_ex;

procedure Test1;
var
  ADivisionID : real;
begin
  ADivisionID := 54345;
  TFrmSelectDivisionExtended.DoShowModal(ADivisionID);
end;

initialization

  TTestRepo.RegisterTest('WC-7598', 'Packslip', 'FrmSelectDivisionExtended', 'DoShowModal', Test1);
end.
