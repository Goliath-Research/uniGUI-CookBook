unit WC_9021;

interface

implementation

uses
  TestReg,
  w_email,
  System.SysUtils;

procedure Test1;
var
  WEB_ORDERS_ID: Real;
  Email: String;
begin
  WEB_ORDERS_ID := 42;
  Email := 'test123@test.com';
  DoW_Email(Email, Format('Web Order Ref# %s', [FloatToStr(WEB_ORDERS_ID)]),
                 Format('Web Order Ref# %s', [FloatToStr(WEB_ORDERS_ID)]) );
end;

initialization

  TTestRepo.RegisterTest('WC_9021', 'Www_Oe', 'w_email', 'DoW_Email', Test1);

end.
