unit WC_8706;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  WhoLoggedInLarge;

procedure Test1;
var
  MyArray : Array of string;
begin
  FindWhoLoggedInLarge(MyArray);
end;

initialization

  TTestRepo.RegisterTest('WC-8706', 'Ta', 'WhoLoggedInLarge', 'IQGetConvertedUOM_SD', Test1);
end.
