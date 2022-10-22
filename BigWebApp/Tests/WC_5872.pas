unit WC_5872;

interface

implementation

uses
  TestReg,
  Importers;

procedure Test1;
begin
  TFrmImporters.DoShow;
end;

initialization

TTestRepo.RegisterTest('WC-5872', 'Customer', 'Importers', 'DoShow', Test1, 1);

end.
