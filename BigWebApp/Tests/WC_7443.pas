unit WC_7443;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  MTOWorkOrderChk;

procedure TestTFrmMTOOnWorkorderException;
begin
  CheckMTOOrdDetailOnWorkorder(5270);
end;

initialization

  TTestRepo.RegisterTest('WC-7443', 'Oe', 'MTOWorkOrderChk', 'CheckMTOOrdDetailOnWorkorder', TestTFrmMTOOnWorkorderException);

end.
