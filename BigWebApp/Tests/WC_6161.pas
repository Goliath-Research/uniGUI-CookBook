unit WC_6161;

interface

implementation

uses
  TestReg,
  System.Variants,
  GLTrLog;

procedure Test1;
begin
  DoShowGLTransLogTransactions('GLBATCHID_ID', 244, 154);
end;

initialization

  TTestRepo.RegisterTest('WC-6161', 'Gl', 'FrmGLTransLog', 'DoShowGLTransLogTransactions', Test1);
end.
