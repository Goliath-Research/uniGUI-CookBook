unit WC_8640;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  SuperTV,
  System.SysUtils;

procedure Test1;
var
  ID: Real;
begin
  ID := DoEmpSuper();
  if (ID > 0) then
    ShowMessage('Result ID: ' + FloatToStr(ID));
end;

initialization

  TTestRepo.RegisterTest('WC_8640', 'Ta', 'SuperTV', 'DoEmpSuper', Test1);

end.
