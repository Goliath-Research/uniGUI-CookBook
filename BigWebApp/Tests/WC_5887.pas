unit WC_5887;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Territories;

procedure Test1;
begin
  TFrmTerritories.DoShow(1);
end;

initialization

  TTestRepo.RegisterTest('WC-5887', 'Customer', 'Territories', 'DoShow', Test1, 1);

end.
