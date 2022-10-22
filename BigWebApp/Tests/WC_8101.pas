unit WC_8101;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  qcexec_car;

procedure Test1;
begin
  DoQCExecCAR;
end;

initialization

TTestRepo.RegisterTest('WC-8101', 'Qc_Exec', 'qcexec_car', 'DoQCExecCAR', Test1);

end.
