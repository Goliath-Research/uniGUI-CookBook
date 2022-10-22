unit WC_7245;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  Tlmakewo;

procedure Test1;
begin
  GetToolingWOOptions;
end;

initialization

  TTestRepo.RegisterTest('WC-7245', 'Iqtool', 'Tlmakewo', 'GetToolingWOOptions', Test1);

end.
