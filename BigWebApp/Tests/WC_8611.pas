unit WC_8611;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  Snd_Tool;

procedure Test1;

begin
   TFrmSndopTool.DoShow;

end;

initialization

  TTestRepo.RegisterTest('WC-8611', 'SNDOP', 'snd_where_used', 'DoShow', Test1);

end.
