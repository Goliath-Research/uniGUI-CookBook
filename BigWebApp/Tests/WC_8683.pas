unit WC_8683;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TaMessages;

procedure TestTFrmTaMessages;
begin
  DoTAMessages;
end;

initialization
  TTestRepo.RegisterTest('WC-8683', 'Ta', 'TaMessages', 'DoTAMessages', TestTFrmTaMessages);
end.
