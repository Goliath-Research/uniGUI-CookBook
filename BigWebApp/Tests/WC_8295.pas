unit WC_8295;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RMAAffectSO;

procedure Test1;
begin
  CheckAffectSO(1,1);
end;

initialization

  TTestRepo.RegisterTest('WC-8295', 'Rma', 'RMAAffectSO', 'CheckAffectSO', Test1, 1);

end.
