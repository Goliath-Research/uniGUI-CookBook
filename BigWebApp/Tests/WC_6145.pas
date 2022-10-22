unit WC_6145;

interface

implementation

uses
  TestReg,
  SysUtils,
  Classes,
  uniGUIDialogs,
  UniGUIApplication,
  budggrp;

procedure Test1;
begin
  TFrmGroups.Create(UniGUIApplication.UniApplication).ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-6145', 'Gl ', 'budggrp', 'ShowModal', Test1);

end.
