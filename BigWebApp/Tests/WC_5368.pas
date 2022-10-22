unit WC_5368;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Mfg_Add;

procedure TestDoShowModal;
var
  AMfgType, AMfgType_Standard: string;
begin
  TFrmMfg_Add.DoShowModal(AMfgType, AMfgType_Standard);
  Showmessage(AMfgType);
end;

initialization

  TTestRepo.RegisterTest('WC-5368', 'Bom', 'Mfg_Add', 'GetAPReplicate', TestDoShowModal);

end.
