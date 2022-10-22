unit WC_7580;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  VMI_OnHand_Chk;

procedure Test1;
begin
  CheckVMIExceededOnHand(165517, 10);
end;

initialization

  TTestRepo.RegisterTest('WC-7580', 'Packslip', 'VMI_OnHand_Chk', 'CheckVMIExceededOnHand', Test1, 1);

end.
