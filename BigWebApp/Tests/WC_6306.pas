unit WC_6306;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FireDAC.Comp.Client,
  MainModule,
  PeriodVal;

procedure Test1;
begin
  DoInvPeriodVal;
end;

initialization

TTestRepo.RegisterTest('WC-6306', 'Inv', 'PeriodVal', 'DoInvPeriodVal', Test1);

end.
