unit WC_5227;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  assy_data_check_final_qty;

procedure Test1;
var
 Form: TFrmAssyDataFinalAssembyQtyCheck;
begin
  Form := TFrmAssyDataFinalAssembyQtyCheck.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5227', 'AssyData', 'assy_data_check_final_qty', 'create', Test1);
end.
