unit WC_8125;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MainModule,
  UniGUIApplication,
  Mat_Thermo2_Edit;

procedure TestTMatThermo2Edit;
begin
  TMatThermo2Edit.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8125', 'Quote', 'Mat_Thermo2_Edit', 'Create', TestTMatThermo2Edit);

end.
