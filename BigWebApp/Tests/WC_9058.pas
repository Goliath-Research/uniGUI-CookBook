unit WC_9058;

interface

implementation


uses
  TestReg,
  SysUtils,
  uniGUIDialogs,uniGUIApplication,
  IQMS.Common.DatesDlg2;

procedure Test1;
var AShowAll: Boolean;
    AFrom, ATo: TDateTime;
begin
  AFrom := Date - 30;
  ATo   := Date;
  TFrmDatesDialog2.GetDatesDialog2( AShowAll, AFrom, ATo );
end;

initialization

  TTestRepo.RegisterTest('WC-9058', 'IQWebVcl', 'DatesDlg2', 'GetDatesDialog2', Test1);

end.
