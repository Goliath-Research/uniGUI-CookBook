unit WC_5161;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  AP1099NY;

procedure Test1;
begin
  ShowMessage(FloatToStr(DoGetNew1099Year));
end;

initialization

  TTestRepo.RegisterTest('WC-5161', 'Ap', 'AP1099NY', 'DoGetNew1099Year', Test1, 1);

end.
