unit WC_9000;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wo_chk_assytrack;

procedure Test1;
begin
  CheckWorkorderInAssyTrack(122933);
end;

initialization

  TTestRepo.RegisterTest('WC-9000', 'Wrkorder', 'wo_chk_assytrack', 'CheckWorkorderInAssyTrack', Test1, 1);

end.
