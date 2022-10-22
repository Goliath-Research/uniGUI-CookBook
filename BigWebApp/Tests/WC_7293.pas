unit WC_7293;

interface

implementation

uses
  TestReg,
  VGroup;

procedure Test1;
begin
  TFrmVGroup.Configure();
end;

initialization

  TTestRepo.RegisterTest('WC-7293', 'Iqvoice', 'VGroup', 'Execute', Test1);

end.
