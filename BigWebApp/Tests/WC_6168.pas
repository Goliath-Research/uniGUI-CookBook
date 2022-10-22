unit WC_6168;

interface

implementation

uses
  TestReg,
  System.Variants,
  MergeAndDelGL;

procedure Test1;
begin
  DoMergeAndDelGL;
end;

initialization

  TTestRepo.RegisterTest('WC-6168', 'Gl', 'FrmMergeAndDelGL', 'DoMergeAndDelGL', Test1);
end.
