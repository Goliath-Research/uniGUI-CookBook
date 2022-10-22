unit WC_7220;

interface

implementation

uses
  TestReg,
  System.Variants,
  webdirect_settings;

procedure TestDoWebDirectSettings;
begin
  TFrmWebDirectSettings.DoWebDirectSettings;
end;

initialization

  TTestRepo.RegisterTest('WC-7220', 'Iqsys ', 'FrmWebDirectSettings ', 'DoWebDirectSettings', TestDoWebDirectSettings);
end.
