unit WC_5382;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  bom_reject_code;

procedure TestTFrmBomRejectCode;
begin
  TFrmBomRejectCode.DoShow(12);
end;

initialization

  TTestRepo.RegisterTest('WC-5382', 'Bom', 'bom_reject_code', 'DoShow', TestTFrmBomRejectCode);

end.
