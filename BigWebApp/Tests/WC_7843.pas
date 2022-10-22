unit WC_7843;

interface

implementation

uses
  TestReg,
  SysUtils,
  System.StrUtils,
  uniGUIDialogs,
  UnArchivePos;

procedure Test1;
begin
  TFrmUnArchivePos.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-7843', 'Po', 'UnArchivePos', 'DoShow', Test1);

end.
