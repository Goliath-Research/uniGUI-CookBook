unit WC_6155;

interface

implementation

uses
  TestReg,
  System.Variants,
  GL;

procedure Test1;
begin
  DoIQGL;
end;

initialization

  TTestRepo.RegisterTest('WC-6155', 'Gl', 'FrmGLMain', 'DoIQGL', Test1);
end.
