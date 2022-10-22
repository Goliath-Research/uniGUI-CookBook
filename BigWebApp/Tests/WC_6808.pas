unit WC_6808;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  M_Launcher;

procedure TestDoShowModal;
var
LFrmM_Launcher : TFrmM_Launcher;
begin
  LFrmM_Launcher:=TFrmM_Launcher.create(uniGUIApplication.UniApplication);
end;

initialization
  TTestRepo.RegisterTest('WC-6808', 'Iqmeter', 'M_Launcher', 'create', TestDoShowModal);
end.
