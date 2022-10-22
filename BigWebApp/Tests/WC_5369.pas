unit WC_5369;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Mfg_Conv;

procedure TestDoShowMfgConv;
begin
   DoShowMfgConv(nil);
end;

initialization

  TTestRepo.RegisterTest('WC-5369', 'Bom', 'Mfg_Conv', 'DoShowMfgConv', TestDoShowMfgConv);

end.
