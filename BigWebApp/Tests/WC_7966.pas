unit WC_7966;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  ProdProp;

procedure Test1;
var
  aProperties : ProdProp.TProperties;
begin
  if DoProdProp(aProperties) then
    ShowMessage('Label Reporting: ' + IfThen(aProperties.LaborReporting, 'true', 'false'));
end;

initialization

  TTestRepo.RegisterTest('WC-7966', 'Prod', 'ProdProp', 'DoProdProp', Test1);

end.
