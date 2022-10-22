unit WC_9338;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  oc_vendors;

procedure Test1;
var
  frm: TFrmOutsourceVendors;
begin
  frm:= TFrmOutsourceVendors.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-9338', 'outsource_central', 'oc_vendors', 'Create', Test1, 1);

end.
