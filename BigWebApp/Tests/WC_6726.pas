unit WC_6726;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIApplication,
  fore_ovr_cap_whiteboard;

procedure Test1;
var
  LFore_Head_ID: Real;
  FrmForeOvrCapWhiteboard: TFrmForeOvrCapWhiteboard;
begin
  LFore_Head_ID := 38;
  FrmForeOvrCapWhiteboard := TFrmForeOvrCapWhiteboard.create(uniGUIApplication.UniApplication);
  FrmForeOvrCapWhiteboard.Fore_Head_ID := LFore_Head_ID;
end;

initialization

  TTestRepo.RegisterTest('WC_6726', 'Iqforecast', 'fore_ovr_cap_whiteboard', 'FormCreate', Test1);

end.
