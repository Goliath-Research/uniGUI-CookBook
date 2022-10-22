unit WC_8298;

interface

implementation

uses
  TestReg,
  RMAStatusException2;

procedure TestCheckRMAStatusException2;
begin
  CheckRMAStatusException2(1000, 1);
end;

initialization

  TTestRepo.RegisterTest('WC-8298', 'RMA', 'FrmRMAStatusException2', 'CheckRMAStatusException2', TestCheckRMAStatusException2);

end.
