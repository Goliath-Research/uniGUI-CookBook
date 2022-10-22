unit WC_6416;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  RebateStatusException;

procedure TestCheckRebateStatusException;
begin
  CheckRebateStatusException(1000);
end;

initialization

  TTestRepo.RegisterTest('WC-6416', 'IqRebate', 'CheckRebateStatusException', 'CheckRebateStatusException', TestCheckRebateStatusException);

end.
