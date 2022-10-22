unit WC_5192;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ARCrMemo;

procedure Test1;
var
  Amount : Real;
begin
  Amount := 10;
  if GetCreditMemoAmount(Amount) then
    ShowMessage('Modified amount is: ' + FloatToStr(Amount));
end;

initialization

  TTestRepo.RegisterTest('WC-5192', 'Ar', 'ARCrMemo', 'GetCreditMemoAmount', Test1);

end.
