program Scan_ID;

uses
  Forms,
  iqmesg,
  iqapps,
  iqsecman,
  IQMS.Common.ResourceStrings,
  ScanID in 'ScanID.pas' {FrmScanIDMain},
  DB_DM in '..\iqshare\Db_dm.pas' {DB_DataModule: TDataModule},
  scanid_rscstr in 'scanid_rscstr.pas',
  scanid_settings in 'scanid_settings.pas',
  scanid_config in 'scanid_config.pas' {FrmScanIDConfig},
  scanid_endprompt in 'scanid_endprompt.pas' {FrmEndPrompt},
  scanid_test in 'scanid_test.pas' {FrmScanIDTest},
  ConsLib in '..\iqrf\ConsLib.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ScanID';
  Application.CreateForm(TDB_DataModule, DB_DataModule);
  if not SecurityManager.SetVisibleIfLicensed( NIL, NIL, NIL, IQAppsNames[apScanID], NIL ) then // in iqapps, iqsecman
  begin
    // 'Please contact IQMS, Inc. to verify the license agreement.'
    IQError( IQMS.Common.ResourceStrings.cTXT0000039 );
    Application.Terminate;
    Exit;
  end;


  Application.CreateForm(TFrmScanIDMain, FrmScanIDMain);
  Application.Run;
end.
