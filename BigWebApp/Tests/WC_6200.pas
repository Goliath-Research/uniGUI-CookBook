unit WC_6200;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs, uniGUIApplication,
  fix_debug_string;

procedure Test1;
begin
  DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-6200', 'IQFixStringsUtility',  'fix_debug_string', 'DoShow', Test1);
end.
