unit WC_8932;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wave_params;

procedure Test1;
begin
  if TFrmWaveParams.DoShowModal then
    Showmessage('OK')
  else
    Showmessage('Cancelled');

end;

initialization

TTestRepo.RegisterTest('WC-8932', 'Wave', 'wave_params', 'DoShowModal', Test1, 1);

end.
