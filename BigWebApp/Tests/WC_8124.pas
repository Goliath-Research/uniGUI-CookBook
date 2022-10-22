unit WC_8124;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MainModule,
  UniGUIApplication,
  Mat_MBatch_Edit;

procedure TestTTMatEdit;
begin
  TMatMBatchEdit.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8124', 'Quote', 'Mat_MBatch_Edit', 'Create', TestTTMatEdit);

end.
