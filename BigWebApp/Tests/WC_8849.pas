unit WC_8849;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  sec_conf_insp_violation;

procedure Test1;
var
 Form: TFrmSecConfInspectionViolation;
begin
   Form := TFrmSecConfInspectionViolation.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8849', 'Trans', 'sec_conf_insp_violation', 'create', Test1);
end.
