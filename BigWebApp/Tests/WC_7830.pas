unit WC_7830;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Paste_Rel_PO;

procedure Test1;
begin
  DoGetPasteReleasesMode_PO(586);
end;

initialization

  TTestRepo.RegisterTest('WC-7830', 'Po', 'Paste_Rel_PO', 'DoGetPasteReleasesMode_PO', Test1);

end.
