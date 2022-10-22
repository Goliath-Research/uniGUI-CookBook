unit WC_8401;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  PS_Share,
  rtpcmon_templates;

procedure Test1;
begin
  TFrmDeviceTemplate.Execute;
end;

initialization

  TTestRepo.RegisterTest('WC-8401', 'Rtpcmon', 'rtpcmon_templates', 'CheckOverDispo', Test1);
end.
