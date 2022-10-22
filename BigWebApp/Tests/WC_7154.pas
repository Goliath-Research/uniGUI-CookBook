unit WC_7154;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  spc_select;

procedure Test1;
begin
  TFrmSPCSelect.create(uniGUIApplication.uniApplication).showmodal;
end;

initialization

  TTestRepo.RegisterTest('WC_7154', 'Iqspc', 'spc_select', 'FormCreate', Test1);
end.
