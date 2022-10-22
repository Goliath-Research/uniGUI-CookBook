unit WC_6634;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  EdiExprt;

procedure Test1;
var
  A, B, C, D : string;
begin
  if GetEdiDBFNames(A, B, C, D) then
    ShowMessage(
      Format(
        'A=%s, B=%s, C=%s, D=%s',
        [
          A,
          B,
          C,
          D
        ]));
end;

initialization

  TTestRepo.RegisterTest('WC-6634', 'IqEdi', 'EdiExprt', 'GetEdiDBFNames', Test1);

end.
