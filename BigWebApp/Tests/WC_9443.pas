unit WC_9443;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  IQMS.WebVcl.SecGroupClone;

procedure TestDoShowModal;
var
  ANewGroup_ID:Real;
begin
  TFrmSecurityGroupClone.DoShowModal(1,ANewGroup_ID);
end;

initialization

  TTestRepo.RegisterTest('WC-9443', 'IQWebVcl', 'SecGroupClone', 'DoShowModal', TestDoShowModal);

end.
