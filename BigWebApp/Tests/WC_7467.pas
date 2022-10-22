unit WC_7467;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TypInfo,
  Paste_SEG_OE;

procedure Test1;
var
  tmp: TPasteMode;
begin
  tmp := DoGetPasteReleasesMode_SEG(5014);
  showMessage(GetEnumName(TypeInfo(TPasteMode), Ord(tmp)));
end;

initialization

TTestRepo.RegisterTest('WC-7467', 'Oe', 'Paste_SEG_OE', 'DoGetPasteReleasesMode_SEG', Test1, 1);

end.
