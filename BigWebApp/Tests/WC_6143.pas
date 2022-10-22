unit WC_6143;

interface

implementation

uses
  TestReg,
  SysUtils,
  Classes,
  uniGUIDialogs,
  UniGUIApplication,
  budgcomp;

procedure Test1;
begin
  TFrmBudgComp.Create(UniGUIApplication.UniApplication).ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-6143', 'Gl ', 'budgcomp', 'ShowModal', Test1);

end.
