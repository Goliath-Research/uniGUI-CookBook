unit WC_6797;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  IQLOG;

procedure TestTIQCenterLog;
var
  AMfgType, AMfgType_Standard: string;
begin
  DoIQLog([2,4,5,3]);
end;

initialization

  TTestRepo.RegisterTest('WC-6797', 'Iqlog', 'IQLOG', 'DoIQLog', TestTIQCenterLog);

end.
