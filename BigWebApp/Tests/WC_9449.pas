unit WC_9449;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  IQMS.WebVcl.SecRoleUsers;

procedure TestDoShowModal;
begin
  TFrmSecRoleUsers.DoShowModal('IQMS');
end;

initialization

  TTestRepo.RegisterTest('WC-9449', 'IQWebVcl', 'SecRoleUsers', 'DoShowModal', TestDoShowModal);

end.
