unit WC_8649;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TAPercComp;

procedure Test1;
var
  R: Real;
begin
  if GetPercentComplete('TL', 5, 5, R) then
  begin
    ShowMessage(FloatToStr(R));
  end else
    ShowMessage('Cancelled');
end;

initialization

TTestRepo.RegisterTest('WC-8649', 'Ta', 'TAPercComp', 'GetPercentComplete', Test1, 1);

end.
