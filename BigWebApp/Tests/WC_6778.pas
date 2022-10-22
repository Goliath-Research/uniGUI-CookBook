unit WC_6778;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  MainImp;

procedure Test1;
begin
  DoImpFA;
end;
procedure Test2;
begin
  DoImp;
end;
procedure Test3;
begin
  DoAutoImp('test',1234,'test1');
end;

initialization

  TTestRepo.RegisterTest('WC_6778', 'Iqimp', 'MainImp', 'DoImpFA', Test1,1);
  TTestRepo.RegisterTest('WC_6778', 'Iqimp', 'MainImp', 'DoImp', Test2,2);
  TTestRepo.RegisterTest('WC_6778', 'Iqimp', 'MainImp', 'DoAutoImp', Test3,3);
end.
