unit WC_9448;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  IQMS.WebVcl.SecRoleGroups;

procedure TestDoShowModal;
begin
  TFrmSecRoleGroups.DoShowModal('IQMS');
end;

initialization

  TTestRepo.RegisterTest('WC-9448', 'IQWebVcl', 'SecRoleGroups', 'DoShowModal', TestDoShowModal);

end.
