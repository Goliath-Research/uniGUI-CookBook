unit WC_5230;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  assy_data_confirm_delete_wo;

procedure TestTFrmAssyDataConfirmDeleteWO;
begin
  TFrmAssyDataConfirmDeleteWO.Create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5230', 'AssyData', 'assy_data_confirm_delete_wo', 'Create', TestTFrmAssyDataConfirmDeleteWO);

end.
