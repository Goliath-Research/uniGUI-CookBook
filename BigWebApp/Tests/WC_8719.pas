unit WC_8719;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TypInfo,
  TagOrWs;

procedure Test1;
begin
  showMessage(GetEnumName(TypeInfo(TTagOrWorksheet), Ord(ChooseTagOrWorksheet)));
end;

initialization

TTestRepo.RegisterTest('WC-8719', 'Taginv', 'TagOrWs', 'ChooseTagOrWorksheet', Test1, 1);

end.
