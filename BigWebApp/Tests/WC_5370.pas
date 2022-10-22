unit WC_5370;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Mfg_Conv_Def_Uom;

procedure TestDoMfgConvDefineUOM;
var
  AUserDefinedUOM: string;
  AFactor: Real;
begin
  AUserDefinedUOM := 'test';
  AFactor := 1;
  DoMfgConvDefineUOM( 'Test' , AUserDefinedUOM, AFactor);
end;

initialization

  TTestRepo.RegisterTest('WC-5370', 'Bom', 'Mfg_Conv_Def_Uom', 'DoMfgConvDefineUOM', TestDoMfgConvDefineUOM);

end.
