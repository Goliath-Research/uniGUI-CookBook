unit WC_5372;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PM_Info;

procedure Test1;
var
  R: Real;
begin
  R := 3;
  if DoPMInfo(R) then
    Showmessage(FloatToStr(R)) else
    Showmessage('Cancelled');
end;


initialization

  TTestRepo.RegisterTest('WC-5372', ' Bom', 'PM_Info', 'DoPMInfo', Test1, 1);

end.
