unit WC_7206;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  sys_ccadvanced;

procedure Test;
begin
  AdvancedCreditCardOptions(Low(int64));
end;

initialization

  TTestRepo.RegisterTest('WC-7206', 'Iqsys', 'sys_ccadvanced', 'AdvancedCreditCardOptions', Test);

end.
