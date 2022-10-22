unit WC_5220;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  V_Basic;

procedure Test1;
var
  Form: TFrmViewBasic;
begin
  Form := TFrmViewBasic.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC_5220', 'Ar', 'V_Basic', 'FormCreate', Test1);
end.
