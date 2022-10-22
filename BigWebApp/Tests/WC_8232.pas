unit WC_8232;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RBom_Pick_Comp;

procedure Test1;
var
  R1: Real;
  S1: string;
begin
  if DoRouteBom_Pick_Component(R1, S1) then
    Showmessage('R1=' + FloatToStr(R1) + ' - S1=' + S1)
  else
    Showmessage('Cancelled');
end;

initialization

TTestRepo.RegisterTest('WC-8232', 'Rbom', 'RBom_Pick_Comp', 'DoShowModal', Test1, 1);

end.
