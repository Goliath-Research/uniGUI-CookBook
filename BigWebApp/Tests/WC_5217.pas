unit WC_5217;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  IVoid;

procedure Test1;
begin
  DoVoidArInvoice(298, 1);
end;

initialization

  TTestRepo.RegisterTest('WC-5217', 'Ar', 'IVoid', 'DoVoidArInvoice', Test1);

end.
