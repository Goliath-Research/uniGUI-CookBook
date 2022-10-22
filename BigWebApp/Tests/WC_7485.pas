unit WC_7485;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  oe_confirm_rel_dates_past;

procedure TestTFrmOEConfirmReleaseDateInPast;
begin
  TFrmOEConfirmReleaseDateInPast.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7485', 'Oe', 'oe_confirm_rel_dates_past', 'Create', TestTFrmOEConfirmReleaseDateInPast);

end.
