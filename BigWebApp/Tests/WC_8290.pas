unit WC_8290;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FailCode;

procedure Test1;
begin
  TFrmFailureCode.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8290', 'Rma', 'FailCode', 'DoShowModal', Test1, 1);

end.
