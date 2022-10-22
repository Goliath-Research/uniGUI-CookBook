unit WC_7579;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  VMI_NonAssoc_Chk;

procedure Test1;
begin
  CheckVMINotAssociatedLocation(1, 2, 0);
end;

initialization

  TTestRepo.RegisterTest('WC-7579', 'Packslip', 'VMI_NonAssoc_Chk', 'CheckVMINotAssociatedLocation', Test1, 1);

end.
