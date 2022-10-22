unit WC_6201;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs, uniGUIApplication,
  fix_file_lines;

procedure Test1;
begin
  DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-6201', 'IQFixStringsUtility',  'fix_file_lines', 'DoShow', Test1);
end.
