unit WC_9075;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  IQMS.Common.Period;

procedure Test1;
begin
  ShowMessage('Period = ' + IntToStr(round(DoFindPeriod)));
end;

initialization

  TTestRepo.RegisterTest('WC-9075', 'WebIQ', 'IQWebVcl', 'DoFindPeriod', Test1);

end.
