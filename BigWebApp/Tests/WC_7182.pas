unit WC_7182;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Division;

procedure Test1;
begin
  DoDivisions;
end;

initialization

  TTestRepo.RegisterTest('WC-7182', 'Iqsys', 'Division', 'DoDivisions', Test1, 1);

end.
