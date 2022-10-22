unit WC_7811;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  pmwocode;

procedure TestTFrmPMCode;
begin
   DoPMCode;
end;

initialization

  TTestRepo.RegisterTest('WC-7811','PM', 'pmwocode', 'DoPMCode', TestTFrmPMCode);

end.
