unit WC_6725;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIApplication,
  fore_lab_cap_whiteboard;

procedure Test1;
var
  FrmForeLabCapWhiteboard: TFrmForeLabCapWhiteboard;
  LFore_Head_ID: Real;
begin
  LFore_Head_ID := 38;
  FrmForeLabCapWhiteboard := TFrmForeLabCapWhiteboard.create(uniGUIApplication.UniApplication);
  FrmForeLabCapWhiteboard.Fore_Head_ID := LFore_Head_ID;
end;

initialization

  TTestRepo.RegisterTest('WC_6725', 'Iqforecast', 'fore_lab_cap_whiteboard', 'FormCreate', Test1);

end.
