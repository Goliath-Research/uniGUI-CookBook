unit WC_5885;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TPSelect;

procedure Test1;
begin
  ShowMessage(FloatToStr(GetTradingPartner(20536)));
end;

initialization

TTestRepo.RegisterTest('WC-5885', 'Customer', 'TPSelect', 'GetTradingPartner', Test1, 1);

end.
