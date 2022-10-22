unit WC_5322;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  BOM_TYPE;

procedure Test1;
var
 Form: TMFG_Type;
begin
  Form := TMFG_Type.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5322', 'Bom', 'BOM_TYPE', 'create', Test1);
end.
