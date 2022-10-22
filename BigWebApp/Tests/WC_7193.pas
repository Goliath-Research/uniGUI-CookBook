unit WC_7193;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Web_Modules;

procedure Test1;
begin
  DoEditWebModules;
end;

initialization

  TTestRepo.RegisterTest('WC-7193', 'Iqsys', 'Web_Modules', 'DoEditWebModules', Test1, 1);

end.
