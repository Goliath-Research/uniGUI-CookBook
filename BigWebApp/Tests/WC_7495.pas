unit WC_7495;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  oe_new_pick_wave;

procedure Test;
var
  a : Real;
begin
  a := 21759;
  TFrmOENewPickWave.DoShowModal(3343,a);
end;

initialization

  TTestRepo.RegisterTest('WC-7495', 'Oe', 'oe_new_pick_wave', 'TFrmOENewPickWave.DoShowModal', Test);

end.
