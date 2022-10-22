unit WC_8716;

interface

implementation

uses
  TestReg,
  System.Variants,
  CycleCntByRank;

procedure Test1;
begin
  TFrmAssignInvCycleCodeByRank.DoShowModal('Hi');
end;

initialization

  TTestRepo.RegisterTest('WC-8716', 'Taginv', 'CycleCntByRank', 'DoShowModal', Test1);
end.
