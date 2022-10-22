unit WC_7682;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  PrEmplBenefits;

procedure TestTFrmEmplBenefits;
begin
  DoQuickAddBenefit;
end;

initialization

  TTestRepo.RegisterTest('WC-7682', 'Payroll', 'PrEmplBenefits', 'DoQuickAddBenefit', TestTFrmEmplBenefits);

end.
