unit WC_6322;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  TariffHistory;

procedure Test1;
var
 Form: TFrmTariffHistory;
begin
  Form := TFrmTariffHistory.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-6322', 'Inv', 'create', 'TAddDownTime', Test1);
end.
