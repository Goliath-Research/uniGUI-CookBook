unit WC_7683;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  PrHol;

procedure Test1;
var
  ADate:TDateTime;
  APay_Type_id:Real;
  AHrs:Real;
begin
  GetTimeCardHoliday(ADate,APay_Type_id,AHrs);
end;

initialization

  TTestRepo.RegisterTest('WC-7683', 'Payroll', 'PrHol', 'GetTimeCardHoliday', Test1);

end.
