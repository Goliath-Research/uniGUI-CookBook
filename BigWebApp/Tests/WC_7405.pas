unit WC_7405;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  MCAPDET;

procedure TestCreate;
var
  LFrm: TFrmMCAPDetails;
begin
  LFrm:= TFrmMCAPDetails.Create(UniGUIApplication.UniApplication);
  LFrm.Show;
end;

initialization

  TTestRepo.RegisterTest('WC-7405', 'Multicur', 'FrmMCAPDetails', 'Create', TestCreate);
end.
