unit WC_6248;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Commod;

procedure Test1;
begin
  DoCommodities(1);
end;

initialization

  TTestRepo.RegisterTest('WC-6248', 'Inv', 'Commod', 'DoCommodities', Test1, 1);

end.
