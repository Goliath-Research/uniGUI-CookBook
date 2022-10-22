unit WC_5889;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UpdateSalesPersonChk;

procedure Test1;
begin
  CheckUpdateInactiveSalesPerson(379);
end;

procedure Test2;
begin
  CheckMassUpdateCommissionsGroupOnOrders(20182,31356,1,4208);
end;

initialization

  TTestRepo.RegisterTest('WC-5889', 'Customer', 'UpdateSalesPersonChk', 'CheckUpdateInactiveSalesPerson', Test1,1);
  TTestRepo.RegisterTest('WC-5889', 'Customer', 'UpdateSalesPersonChk', 'CheckMassUpdateCommissionsGroupOnOrders', Test2,2);

end.
