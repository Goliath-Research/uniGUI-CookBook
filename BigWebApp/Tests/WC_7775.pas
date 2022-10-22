unit WC_7775;

interface

implementation

uses
  TestReg,
  System.Variants,
  pm_archive_batch;

procedure Test1;
begin
  DoBatchArchive;
end;

initialization

  TTestRepo.RegisterTest('WC-7775', 'Pm', 'pm_archive_batch', 'DoBatchArchive', Test1);
end.
