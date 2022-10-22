unit WC_6134;
//WC-6134 Gj - Jtemlate
interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  JTemlate;

procedure Test1;
begin
  DoTemplate('');
end;

initialization

  TTestRepo.RegisterTest('WC-6134', 'Gj', 'Jtemlate', 'DoTemplate', Test1,1);

end.
