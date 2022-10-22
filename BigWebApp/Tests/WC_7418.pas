unit WC_7418;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  McSalesCom;

procedure Test1;
var
  LFrmMCSalesman : TFrmMCSalesman;
begin
  LFrmMCSalesman := TFrmMCSalesman.create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7418', 'Multicur', 'McSalesCom', 'CheckUpdateInactiveSalesPerson', Test1);

end.
