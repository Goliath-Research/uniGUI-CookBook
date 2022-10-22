unit WC_7181;

interface

implementation

uses
  System.SysUtils,
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  BoilSel;

procedure TestDoViewSelectBoilerPlate;
var
  LABoiler_ID: Real;
begin
  if DoViewSelectBoilerPlate('MTB', LABoiler_ID) then
    ShowMessage('ABoiler ID: ' + FloatToStr(LABoiler_ID))
end;

initialization

TTestRepo.RegisterTest('WC-7181', 'Iqsys', 'FrmBoilerPlatesViewSelect',
  'DoViewSelectBoilerPlate', TestDoViewSelectBoilerPlate);

end.
