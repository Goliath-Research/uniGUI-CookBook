unit WC_7411;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  MCORDREL;

procedure TestCreate;
var
  LFrm: TFrmMCOrdReleases;
begin
  LFrm:= TFrmMCOrdReleases.Create(UniGUIApplication.UniApplication);
  LFrm.Show;
end;

initialization

  TTestRepo.RegisterTest('WC-7411', 'Multicur', 'FrmMCOrdReleases', 'Create', TestCreate);
end.
