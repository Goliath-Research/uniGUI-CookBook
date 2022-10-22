unit WC_7788;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  pm_conf;

procedure TestTFrmPMConf;
begin
  DoPMConfirmYN('TEST',TRUE);
end;

initialization

  TTestRepo.RegisterTest('WC-7788', 'PM', 'pm_conf', 'DoPMConfirmYN', TestTFrmPMConf);

end.
