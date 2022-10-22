unit WC_7013;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_edit_importer;

procedure Test;
begin
  DoEditImporter(1154);
end;

initialization
  TTestRepo.RegisterTest('WC-7013', 'Iqshipman',  'shipman_edit_importer', 'DoEditImporter', Test);
end.
