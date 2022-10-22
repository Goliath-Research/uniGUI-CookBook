unit WC_7180;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  BoilBas;

procedure TestDoBoilerPlates;
begin
  DoBoilerPlates('MTB');
end;

initialization

  TTestRepo.RegisterTest('WC-7180', 'Iqsys', 'FrmBoilerPlatesViewSelect', 'DoBoilerPlates', TestDoBoilerPlates);

end.
