unit WC_8989;

interface

implementation

uses
  TestReg,
  wo_alloc_filter,
  wo_misc;

procedure TestDoShowModal;
var
  Cargo: TWOHardAllocCargo;
begin
   Cargo := TWOHardAllocCargo.create(187242);
   TFrmWOHardAllocFilter.DoShowModal(Cargo);
end;

initialization

  TTestRepo.RegisterTest('WC-8989', 'Wrkorder ', 'wo_alloc_filter', 'DoShowModal', TestDoShowModal);
end.
