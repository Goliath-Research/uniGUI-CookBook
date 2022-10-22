unit WC_6034;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Employes;

procedure TestDoEmployees;
begin
  DoEmployees;
end;

initialization

  TTestRepo.RegisterTest('WC-6034', 'Employee', 'Employes', 'DoEmployees', TestDoEmployees);

end.
