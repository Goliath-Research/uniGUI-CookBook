unit WC_8395;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  rtpcmon_addRTModbus;

procedure Test1;
begin
  TFrmAddRTModbusDevice.create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8395', 'Rtpcmon', 'rtpcmon_addRTModbus', 'create', Test1);
end.
