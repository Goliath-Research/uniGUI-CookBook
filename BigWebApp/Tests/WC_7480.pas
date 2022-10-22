unit WC_7480;

interface

implementation

uses
  TestReg,
  oe_archive_batch;

procedure Test1;
begin

  TFrmOEArchiveBatch.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-7480', 'Oe', 'oe_archive_batch', 'DoShow', Test1, 1);
end.
