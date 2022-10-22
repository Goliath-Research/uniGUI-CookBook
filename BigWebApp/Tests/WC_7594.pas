unit WC_7594;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  ps_voided;

procedure TestTFrmPSVoided;
begin
  TFrmPSVoided.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-7594', 'Packslip',  'ps_voided', 'DoShow', TestTFrmPSVoided);
end.
