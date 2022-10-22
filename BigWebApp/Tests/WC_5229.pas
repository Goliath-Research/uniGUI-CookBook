unit WC_5229;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  assy_data_chk_final_qty_above_wo;

procedure Test1;
var
 Form: TFrmAssyDataChkFinalAssyAboveWO;
begin
  Form := TFrmAssyDataChkFinalAssyAboveWO.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5229', 'AssyData', 'assy_data_chk_final_qty_above_wo', 'create', Test1);
end.
