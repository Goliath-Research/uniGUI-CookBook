unit WC_7458;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  OeClone;

procedure Test1;
begin
  ShowMessage(FloatToStr(CloneOE(1)));
end;

initialization

TTestRepo.RegisterTest('WC-7458', 'OE', 'OeClone', 'CloneOE', Test1, 1);

end.
