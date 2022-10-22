unit WC_6352;

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

  TTestRepo.RegisterTest('WC-6352', 'Inv', 'inv_loc_type_params', 'DoShowModal', Test1);

end.
