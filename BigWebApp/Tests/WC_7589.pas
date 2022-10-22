unit WC_7589;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  ps_sec_conf_kitting;

procedure Test1;
var
 Form: TFrmPS_SecConfirmKitting;
begin
   Form := TFrmPS_SecConfirmKitting.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7589', 'Packslip', 'ps_sec_conf_kitting', 'create', Test1);
end.
