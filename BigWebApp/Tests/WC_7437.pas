unit WC_7437;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  EdiCapt;

procedure Test1;
begin
  DoViewCapturedEdiSegments(nil);
end;

initialization

  TTestRepo.RegisterTest('WC-7437', 'Oe', 'EditCapt', 'DoViewCapturedEdiSegments', Test1);
end.
