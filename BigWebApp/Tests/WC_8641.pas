unit WC_8641;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TAAssignPayTypes;

procedure Test1;
begin
  DoAssignPayTypesToEmployees;
end;

initialization

  TTestRepo.RegisterTest('WC-8641', 'Ta', 'TAAssignPayTypes', 'DoAssignPayTypesToEmployees', Test1, 1);

end.
