unit WC_5710;

interface

implementation

uses
  MainModule,
  TestReg,
  crm_toolbar,
  uniGUIApplication;
procedure Test1;

var
frm_toolbar:TFrmCRMToolbar_Base;
begin
  frm_toolbar:=TFrmCRMToolbar_Base.Create(UniApplication);
  frm_toolbar.ShowModal();
end;

initialization

  TTestRepo.RegisterTest('WC-5710', 'Crm', 'crm_toolbar', 'ShowModal', Test1);

end.
