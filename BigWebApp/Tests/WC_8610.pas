unit WC_8610;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  Snd_PR;

procedure TestSnd_Process;
begin
  TSnd_Process.DoShow(1252);
end;

initialization

  TTestRepo.RegisterTest('WC-8610', 'SNDOP', 'TSnd_Process', 'DoShow', TestSnd_Process);

end.
