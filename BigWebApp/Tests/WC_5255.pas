unit WC_5255;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  assy_work_center_pklist;

procedure Test1;
var
 Form: TFrmAssyWorkCenterPickList;
begin
  Form := TFrmAssyWorkCenterPickList.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5255', 'AssyData', 'assy_work_center_pklist', 'create', Test1);
end.
