unit WC_5379;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  bom_down_code;

procedure TestTFrmBomDownTimeCode;
begin
  TFrmBomDownTimeCode.DoShow(12);
end;

initialization

  TTestRepo.RegisterTest('WC-5379', 'Bom', 'bom_down_code', 'DoShow', TestTFrmBomDownTimeCode);

end.
