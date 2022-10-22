unit WC_7588;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ps_archive;

procedure TestTFrmPSArchive;
begin
  TFrmPSArchive.DoShowModal;
end;

initialization
  TTestRepo.RegisterTest('WC-7588', 'Packslip',  'ps_archive', 'DoShowModal', TestTFrmPSArchive);
end.
