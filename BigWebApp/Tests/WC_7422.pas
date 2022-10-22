unit WC_7422;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  Mcorddet;

procedure TestCreate;
var
  LFrm: TFrmMCOrdDetail;
begin
  LFrm:= TFrmMCOrdDetail.Create(UniGUIApplication.UniApplication);
  LFrm.Show;
end;

initialization

  TTestRepo.RegisterTest('WC-7422', 'Multicur', 'FrmMCOrdDetail', 'Create', TestCreate);
end.
