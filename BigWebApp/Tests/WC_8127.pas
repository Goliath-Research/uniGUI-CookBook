unit WC_8127;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MainModule,
  UniGUIApplication,
  PK_Edit;

procedure TestTTMatEdit;
begin
  TPackEdit.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8127', 'Quote', 'PK_Edit', 'Create', TestTTMatEdit);

end.
