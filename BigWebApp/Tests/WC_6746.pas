unit WC_6746;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  HRInjSt;

procedure Test1;
begin
  DoHRInjuryStats;
end;

initialization

  TTestRepo.RegisterTest('WC-6746', 'Iqhr', 'HRInjSt', 'DoHRInjuryStats', Test1);

end.
