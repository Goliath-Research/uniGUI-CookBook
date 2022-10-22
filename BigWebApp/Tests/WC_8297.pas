unit WC_8297;

interface

implementation

uses
  TestReg,
  RMAStatusException;

procedure TestCheckRMAStatusException;
begin
  CheckRMAStatusException(1000, 1);
end;

initialization

  TTestRepo.RegisterTest('WC-8297', 'RMA', 'FrmViewArchivedRMA', 'CheckRMAStatusException', TestCheckRMAStatusException);

end.
