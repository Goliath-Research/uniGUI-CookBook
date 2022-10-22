unit WC_8126;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MainModule,
  UniGUIApplication,
  Mat_Edit;

procedure TestTTMatEdit;
begin
  TMatEdit.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8126', 'Quote', 'Mat_Edit', 'Create', TestTTMatEdit);

end.
