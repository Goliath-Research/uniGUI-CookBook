unit WC_7972;

interface

implementation

uses
  TestReg,
  ProdFrmn;

procedure Test1;
var
  MfgType:String;
  Shift:Integer;
  Foreman: string;
begin
  MfgType := 'THERMOSET ';
  Shift := 3;
  DoChooseForeman(MfgType, Shift ,Foreman);
end;

initialization

  TTestRepo.RegisterTest('WC-7972', 'Prod', 'ProdFrmn', 'DoEditRTRejects', Test1);
end.
