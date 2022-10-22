unit WC_5445;

interface

implementation

uses
  TestReg,
  System.Variants,
  CDVoid;

procedure TestGetCDVoidInfo;
var
    FID:Real;
    FReason:String;
begin
  GetCDVoidInfo(FID,FReason);
end;

initialization

  TTestRepo.RegisterTest('WC-5445', 'Cd', 'CDVoid', 'GetCDVoidInfo', TestGetCDVoidInfo);
end.
