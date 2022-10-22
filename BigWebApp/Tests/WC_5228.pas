unit WC_5228;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  assy_data_check_final_qty_zero;

procedure TestTFrmAssyDataChkFinalAssyZero;
begin
  TFrmAssyDataChkFinalAssyZero.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5228', 'AssyData', 'assy_data_check_final_qty_zero', 'Create', TestTFrmAssyDataChkFinalAssyZero);

end.
