unit WC_6976;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  qk_importer;

procedure Test;
begin
  TQuickAddImporter.Create(UniGUIApplication.UniApplication);
end;

initialization
  TTestRepo.RegisterTest('WC-6976', 'Iqshipman',  'qk_importer', 'Create', Test);
end.
