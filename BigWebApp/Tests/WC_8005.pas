unit WC_8005;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  prw_sec_conf_wo_prcnt_complete;

procedure Test1;
var
 Form: TFrmPRWConfSecWOPrcntComplete;
begin
   Form := TFrmPRWConfSecWOPrcntComplete.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8005', 'Prw', 'prw_sec_conf_wo_prcnt_complete', 'create', Test1);
end.
