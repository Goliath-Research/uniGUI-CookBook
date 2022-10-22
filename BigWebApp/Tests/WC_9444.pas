unit WC_9444;

interface

implementation


uses
  TestReg,
  SysUtils,
  uniGUIDialogs,uniGUIApplication,
  IQMS.WebVcl.SecGroupUsers;

procedure Test1;
begin
  TTFrmSecGroupUsers.DoShowModal(1);
end;

initialization

  TTestRepo.RegisterTest('WC-9444', 'WebIQ', 'IQWebVcl', 'IQSecGroupUsers', Test1);

end.
