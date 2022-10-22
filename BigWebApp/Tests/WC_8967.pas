unit WC_8967;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  qk_cntr_type;

procedure Test1;
var
 Form: TFrmQuickAddCntrType;
begin
   Form := TFrmQuickAddCntrType.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8967', 'Workcntr', 'qk_cntr_type', 'create', Test1);
end.
