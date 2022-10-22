unit WC_6172;

interface

implementation

uses
  TestReg,
  System.Variants,
  gl_pit_drill_down;

procedure Test1;
begin
  TFrmGLActivityPitDrillDown.DoShow(3363, 223);
end;

initialization

  TTestRepo.RegisterTest('WC-6172', 'Gl', 'FrmGLActivityPitDrillDown', 'DoShow', Test1);
end.
