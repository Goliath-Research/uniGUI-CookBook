unit WC_6159;

interface

implementation

uses
  TestReg,
  SysUtils,
  Classes,
  uniGUIDialogs,
  UniGUIApplication,
  GLrepeat;

procedure Test1;
begin
  TFrmRepeat.Create(UniGUIApplication.UniApplication).ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-6159', 'Gl ', 'GLrepeat', 'ShowModal', Test1);

end.
