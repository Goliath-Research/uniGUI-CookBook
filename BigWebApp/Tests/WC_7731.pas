unit WC_7731;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  System.Classes,
  pm_capacity;

procedure TestTFrmPMCapacity;
begin
  TFrmPMCapacity.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-7731', 'PM', 'pm_capacity', 'DoShow', TestTFrmPMCapacity);

end.
