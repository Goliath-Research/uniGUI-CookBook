unit WC_7558;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  PS_CoC;

procedure Test;
begin
  TFrmCoC.DoShowModal(420);
end;

initialization

  TTestRepo.RegisterTest('WC-7558', 'Packslip', 'PS_CoC', 'DoShowModal',Test);

end.
