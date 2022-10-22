unit WC_5327;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  BomInputQry;

procedure TestGetRFQNumber;
var
  s : string;
  ARev: Real;
  PriceUpdate: Boolean;
  StdCostUpdate: Boolean;
  DueDate:TDateTime;
begin
  s := 'hello';
  ARev := 3123;
  PriceUpdate := true;
  StdCostUpdate := false;
  DueDate :=  3-5-1995;
  GetRFQNumber(s, ARev, PriceUpdate, StdCostUpdate, DueDate);
end;

initialization

  TTestRepo.RegisterTest('WC-5327', 'Bom', 'BomInputQry', 'GetRFQNumber', TestGetRFQNumber);

end.
