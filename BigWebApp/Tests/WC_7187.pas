unit WC_7187;

interface

implementation

uses
  TestReg,
  System.Variants,
  OSSrvcCreds;

procedure TestDoOSServiceCredentials;
begin
  TFrmOSSrvcCreds.DoOSServiceCredentials;
end;

initialization

  TTestRepo.RegisterTest('WC-7187', 'Iqsys ', 'FrmOSSrvcCreds', 'DoOSServiceCredentials', TestDoOSServiceCredentials);
end.
