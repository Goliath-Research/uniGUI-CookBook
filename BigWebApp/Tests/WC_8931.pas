unit WC_8931;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wave_match;

procedure Test1;
begin
  TFrmWaveMatch.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-8931', 'Wave', 'wave_match', 'DoShow', Test1, 1);

end.
