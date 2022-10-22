unit WC_6259;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FireDAC.Comp.Client,
  MainModule,
  InvtClas,
  InvFltr2;

procedure Test1;
var AInvClassFilter : TInvClassFilter;
begin
    AInvClassFilter.Kind       := ifClass;
    AInvClassFilter.InvClass   := 'iqms';
    AInvClassFilter.Division_ID:= 454;
    AInvClassFilter.Buyer_Code_ID:= 217;

    {for material exceptions}
    AInvClassFilter.IncludeAll  := true;
    AInvClassFilter.ExceptionScope := 78;
    AInvClassFilter.ConsolidateDivReq := true;
    AInvClassFilter.MfgType := 'iqms';
  GetInventoryClassFilter2(AInvClassFilter);
end;

initialization

TTestRepo.RegisterTest('WC-6259', 'Inv', 'InvFltr2', 'GetInventoryClassFilter2', Test1);

end.
