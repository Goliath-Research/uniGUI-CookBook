unit WC_6533;

interface

implementation

uses
  TestReg,
  dbtlogin,
  IQMS.common.Miscellaneous,
  Dialogs;

procedure Test1;
var
  Res: Boolean;
  AUserName, APassword ,APrompt: String;
begin
  AUserName := 'IQMS';
  APassword := 'IQMS';
  Res := GetLoginIn(AUserName, APassword, APrompt);
  if Res then
    ShowMessage('Login Successful');
end;

procedure Test2;
var
  Res: Boolean;
  AUserName, APassword ,APrompt: String;
begin
  AUserName := 'IQMS';
  APassword := 'IQMS';
  Res := GetLoginInWithCheckA(AUserName, APassword, APrompt);
  if Res then
    ShowMessage('Login Successful');
end;

procedure Test3;
var
  Res: Boolean;
  AUserName, APassword ,APrompt: String;
  Employee_ID : Real;
begin
  AUserName := 'IQMS';
  APassword := 'IQMS';
  Employee_ID := 40;
  Res := GetLoginInWithCheckB(IQGetServerName, AUserName, APassword, Employee_ID, 'Please select your user name, and enter your password.');
  if Res then
    ShowMessage('Login Successful');
end;

initialization

  TTestRepo.RegisterTest('WC-6533', 'Iqdbtrans', 'dbtlogin', 'GetLoginIn', Test1, 1);
  TTestRepo.RegisterTest('WC-6533', 'Iqdbtrans', 'dbtlogin', 'GetLoginInWithCheckA', Test1, 2);
  TTestRepo.RegisterTest('WC-6533', 'Iqdbtrans', 'dbtlogin', 'GetLoginInWithCheckB', Test1, 3);

end.
