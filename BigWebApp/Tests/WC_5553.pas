unit WC_5553;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_logfrm;

procedure Test1;
var
  LFrmCCLog : TFrmCCLog;
begin
  LFrmCCLog := TFrmCCLog.create(uniguiapplication.uniapplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5553', 'Creditcard', 'cc_logfrm', 'create', Test1);

end.
