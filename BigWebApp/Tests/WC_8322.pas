unit WC_8322;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  RTCycles_Hist;

procedure Test1;
begin
  TFrmRTCyclesArchive.DoShow(472989);
end;

initialization

  TTestRepo.RegisterTest('WC-8322', 'Rt', 'RTCycles_Hist', 'DoShow', Test1);

end.
