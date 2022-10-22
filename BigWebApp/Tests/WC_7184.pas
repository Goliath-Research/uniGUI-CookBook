unit WC_7184;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  Emailpwd;

procedure Test1;
var
 Form: TFrmChangeEMailPassword;
begin
   Form := TFrmChangeEMailPassword.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7184', 'Iqsys', 'Emailpwd', 'create', Test1);
end.
