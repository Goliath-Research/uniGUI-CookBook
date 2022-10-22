unit WC_7460;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  OeUnArchive;

procedure Test;
begin
  TFrmOeUnArchive.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-7460', 'OE', 'OeUnArchive', 'DoShow', Test);

end.
