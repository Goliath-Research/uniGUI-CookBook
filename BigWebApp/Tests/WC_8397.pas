unit WC_8397;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  rtpcmon_capab_types;

procedure Test1;
begin
  DoPCMonCapabTypesModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8397', 'Rtpcmon', 'rtpcmon_capab_types', 'DoPCMonCapabTypesModal', Test1, 1);

end.
