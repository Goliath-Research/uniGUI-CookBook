unit WC_7189;

interface

implementation

uses
  TestReg,
  System.Variants,
  SkipSeq;

procedure TestConstructor;
begin
  ShowSkippedSeq('TEST', 'ARINVT', 'ID');
end;

initialization

  TTestRepo.RegisterTest('WC-7189', 'Iqsys ', 'FrmSkippedSeq', 'ShowSkippedSeq', TestConstructor);
end.
