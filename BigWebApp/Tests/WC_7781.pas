unit WC_7781;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  System.Classes,
  pm_capacity_params;

procedure TestTFrmPM_Capacity_Params;
begin
  TFrmPM_Capacity_Params.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7781', 'PM', 'pm_capacity_params', 'DoShowModal', TestTFrmPM_Capacity_Params);

end.
