unit WC_7963;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Lab_Aloc;

procedure TestDoLaborAllocation;
begin
  DoLaborAllocation;
end;

initialization

  TTestRepo.RegisterTest('WC-7963', 'Prod', 'Lab_Aloc', 'DoLaborAllocation', TestDoLaborAllocation);

end.
