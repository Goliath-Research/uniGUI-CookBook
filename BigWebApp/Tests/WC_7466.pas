unit WC_7466;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  Paste_Rel_OE;

procedure TestTFrmPasteReleases_OE;
begin
  DoGetPasteReleasesMode_OE(1255);
end;

initialization

  TTestRepo.RegisterTest('WC-7466', 'Oe', 'Paste_Rel_OE', 'DoGetPasteReleasesMode_OE', TestTFrmPasteReleases_OE);

end.
