unit WC_8343;

interface

implementation

uses
  TestReg,
  System.Variants,
  RT_QkRej;

procedure TestDoQuickRejects;
begin
  DoQuickRejects(100, '1001');
end;

initialization

  TTestRepo.RegisterTest('WC-8343', 'RT', 'RTQuickReject', 'DoQuickRejects', TestDoQuickRejects);
end.
