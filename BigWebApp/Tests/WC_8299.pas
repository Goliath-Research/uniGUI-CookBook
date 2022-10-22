unit WC_8299;

interface

implementation

uses
  TestReg,
  RMAStatusException3;

procedure TestCheckRMAStatusException3;
begin
  CheckRMAStatusException3(1000, 1);
end;

initialization

  TTestRepo.RegisterTest('WC-8299', 'RMA', 'FrmRMAStatusException3', 'CheckRMAStatusException3', TestCheckRMAStatusException3);

end.
