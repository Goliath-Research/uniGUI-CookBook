unit WC_9318;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  oc_boms;

procedure Test1;
var
  frm: TFrmOutsourceBOMs;
begin
  frm:= TFrmOutsourceBOMs.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-9318', 'outsource_central', 'oc_boms', 'Create', Test1, 1);

end.
