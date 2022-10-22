unit WC_5521;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  CVoid;

procedure Test1;
begin
  DoVoidCashRec(298, 1);
end;

initialization

  TTestRepo.RegisterTest('WC-5521', 'Cr', 'CVoid', 'DoVoidCashRec', Test1);

end.
