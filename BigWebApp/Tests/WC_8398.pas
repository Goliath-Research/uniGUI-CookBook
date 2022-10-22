unit WC_8398;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  rtpcmon_pkCapab;

procedure Test1;
begin
  doShowModal(1, '');
end;

initialization

  TTestRepo.RegisterTest('WC-8398', 'Rtpcmon', 'rtpcmon_pkCapab', 'doShowModal', Test1, 1);

end.
