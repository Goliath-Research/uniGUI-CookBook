unit WC_6722;

interface

implementation

uses
  TestReg,
  FrSavDlg;

procedure Test1;
begin
  DoBackupRestoreForecast();
end;

initialization

  TTestRepo.RegisterTest('WC_6722', 'Iqforecast', 'FrSavDlg', 'DoBackupRestoreForecast', Test1);

end.
