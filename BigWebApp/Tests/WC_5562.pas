unit WC_5562;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_purge_base;

procedure Test1;
var
  LFrmCCPurgeBase : TFrmCCPurgeBase;
begin
  LFrmCCPurgeBase := TFrmCCPurgeBase.create(uniguiapplication.uniapplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5562', 'Creditcard', 'cc_purge_base', 'create', Test1);

end.
