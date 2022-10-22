unit WC_5867;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FireDAC.Comp.Client,
  MainModule,
  Data.DB,
  Cust_Level;

procedure Test1;
begin
  TFrmCustomerLevel.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-5867', 'Customer', 'Cust_Level', 'DoShow', Test1);

end.
