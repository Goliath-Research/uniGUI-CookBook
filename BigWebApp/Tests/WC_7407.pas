unit WC_7407;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  MCARDET;

procedure TestCreate;
var
  LFrm: TFrmMCARDetails;
begin
  LFrm:= TFrmMCARDetails.Create(UniGUIApplication.UniApplication);
  LFrm.Show;
end;

initialization

  TTestRepo.RegisterTest('WC-7407', 'Multicur', 'FrmMCARDetails', 'Create', TestCreate);
end.
