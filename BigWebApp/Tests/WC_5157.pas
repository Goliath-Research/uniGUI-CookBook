unit WC_5157;
// WC-5157 Ap - APTax
interface

implementation

uses
  MainModule,
  UniGUIApplication,
  TestReg,
  APTax;

procedure Test;
begin
   DoArTax;
end;

initialization

  TTestRepo.RegisterTest('WC-5157', 'Ap', 'APTax', 'DoArTax', Test);

end.
