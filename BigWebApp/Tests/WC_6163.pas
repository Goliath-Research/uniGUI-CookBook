unit WC_6163;

interface

implementation

uses
  TestReg,
  SysUtils,
  Classes,
  uniGUIDialogs,
  UniGUIApplication,
  gl_visu;

procedure Test1;
begin
  TFrmGLVisual.Create(UniGUIApplication.UniApplication).ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-6163', 'Gl ', 'gl_visu', 'ShowModal', Test1);

end.
