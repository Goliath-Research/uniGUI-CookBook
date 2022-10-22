unit WC_7982;

interface

implementation

uses
  TestReg,
  Rejects;

procedure Test1;
begin
  DoEditRTRejects(194407);
end;

initialization

  TTestRepo.RegisterTest('WC-7982', 'Prod', 'Rejects', 'DoEditRTRejects', Test1);
end.
