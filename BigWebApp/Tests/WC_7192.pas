unit WC_7192;

interface

implementation

uses
  TestReg,
  System.Variants,
  Tab_Trac;

procedure TestDoConfigTrace;
begin
  DoConfigTrace
end;

initialization

  TTestRepo.RegisterTest('WC-7192', 'Iqsys ', 'FrmConfigTrace', 'DoConfigTrace', TestDoConfigTrace);
end.
