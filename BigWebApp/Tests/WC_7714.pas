unit WC_7714;

interface

implementation

uses
  TestReg,
  Philips_Main,
  uniGUIApplication;

procedure Test1;
var
  AForm : TFrmPhilips;
begin
  AForm := TFrmPhilips.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC_7714', 'Philips', 'Main', 'FormCreate', Test1);

end.
