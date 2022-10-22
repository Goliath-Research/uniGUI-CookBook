unit WC_7636;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  IQMS.WebVcl.SecRoleUsers;

procedure TestDoCheckNegativeAlert;
begin
//  DoCheckNegativeAlert( );
end;

initialization

  TTestRepo.RegisterTest('WC-7636', 'PayRoll', 'CheckNegativeAlert', 'DoCheckNegativeAlert', TestDoCheckNegativeAlert);

end.
