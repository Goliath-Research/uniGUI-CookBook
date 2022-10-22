unit WC_5552;

interface

uses
cc_log;

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_logfilter;

procedure Test1;
var
  m : TLogFilter;
begin
  m.UserID :='A';
  m.HideArchived := True;
  m.AllClasses := True;
  m.AllSources := True;
  GetLogFilter(m);
end;

initialization

  TTestRepo.RegisterTest('WC-5552', 'Creditcard', 'cc_logfilter', 'GetLogFilter', Test1);

end.
