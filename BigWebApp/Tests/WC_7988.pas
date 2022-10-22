unit WC_7988;

interface

implementation

uses
  TestReg,
  System.Variants,
  prod_labor_ta_setup_chk;

procedure Test1;
begin
  CheckMfgtypeLaborPostingSetup(445008);
end;

initialization

  TTestRepo.RegisterTest('WC-7988', 'Prod', 'FrmProdRepTALaborException', 'CheckMfgtypeLaborPostingSetup', Test1);
end.
