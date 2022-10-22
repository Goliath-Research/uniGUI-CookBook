unit WC_7432;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  CONTACT;

procedure test1;
begin
  ShowMessage(FloatToStr(DoGetContact(14401, 20226)));
end;

initialization

TTestRepo.RegisterTest('WC-7432', 'OE', 'CONTACT', 'DoGetContact', Test1, 1);

end.
