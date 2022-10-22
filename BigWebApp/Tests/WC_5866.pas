unit WC_5866;

interface

implementation

uses
  TestReg,
  System.Variants,
  Cust_Category;

procedure Test1;
begin
  TFrmCustCategory.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-5866', 'Customer', 'Cust_Category', 'DoLabelMaintenance', Test1);
end.
