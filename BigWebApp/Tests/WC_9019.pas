unit WC_9019;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  wo_sec_conf_hard_alloc_prcnt_calc;

procedure Test1;
var
 Form: TFrmWOSecConfHardAllocPrcntCalc;
begin
   Form := TFrmWOSecConfHardAllocPrcntCalc.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-9019', 'Wrkorder', 'wo_sec_conf_hard_alloc_prcnt_calc', 'create', Test1);
end.
