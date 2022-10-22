unit WC_6294;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FireDAC.Comp.Client,
  MainModule,
  ItemInfoFilter;

procedure Test1;
var AItemInfoCargo: TItemInfoCargo;
begin
    AItemInfoCargo.FType      := iitAny;
    AItemInfoCargo.FSource    := iisAny;
    AItemInfoCargo.FDate1     := 13/03/2015;
    AItemInfoCargo.FDate2     := 15/15/2016;
    AItemInfoCargo.FPOStatus  := iipAny;
    AItemInfoCargo.FVendor_ID := 3122;
    AItemInfoCargo.FArcusto_ID:= 14156;
  DoGetItemInfoFilter(AItemInfoCargo);
end;

initialization

TTestRepo.RegisterTest('WC-6294', 'Inv', 'ItemInfoFilter', 'DoInvPeriodVal', Test1);

end.
