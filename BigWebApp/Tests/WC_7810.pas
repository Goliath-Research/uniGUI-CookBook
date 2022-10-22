unit WC_7810;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  PM_wotypes;

procedure TestTFrmPMWOTypes;
begin
   DoWOTypes;
end;

initialization

  TTestRepo.RegisterTest('WC-7810','PM', 'PM_wotypes', 'DoWOTypes', TestTFrmPMWOTypes);

end.
