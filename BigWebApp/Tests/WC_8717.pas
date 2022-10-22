unit WC_8717;

interface

implementation

uses
  TestReg,
  System.Variants,
  CycleCntByTransRank;

procedure Test1;
begin
  TFrmAssignInvCycleCodeByTransRank.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8717', 'Taginv', 'CycleCntByTransRank', 'DoShowModal', Test1);
end.
