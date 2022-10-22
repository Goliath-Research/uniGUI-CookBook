unit WC_5420;

interface

implementation

uses

  TestReg,
  SysUtils,
  uniGUIDialogs,
  OrdersDRP;

procedure Test1;
var
  a,b,c : string;
  d,e : Real;
  f : TDateTime;
begin
a := 'a';
b := 'b';
c := 'c';
d := 151120;
e := 2;
f := 06-01-15;
TFrmSalesOrderDRP.CreateModaless(d,f);
end;

initialization

  TTestRepo.RegisterTest('WC-5420', 'Capacity',  'OrdersDRP', 'CreateModaless', Test1);

end.
