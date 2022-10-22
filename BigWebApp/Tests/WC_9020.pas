unit WC_9020;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  wo_sec_conf_unfirm_wo;

procedure Test1;
var
 Form: TFrmSecuredConfirmUnfirmWO;
begin
   Form := TFrmSecuredConfirmUnfirmWO.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-9020', 'Wrkorder', 'wo_sec_conf_unfirm_wo', 'create', Test1);
end.
