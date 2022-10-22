unit WC_8451;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  scanid_config;

procedure Test1;
begin
     DoScanIDConfig;
end;

initialization

  TTestRepo.RegisterTest('WC-8451', 'Scan_Id', 'scanid_config', 'DoScanIDConfig', Test1);

end.
