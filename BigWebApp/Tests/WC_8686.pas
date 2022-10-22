unit WC_8686;

interface

implementation

uses
  TestReg,
  TaPayTypeSet;

procedure Test1;
begin
  EditPayTypeSettings();
end;

initialization

  TTestRepo.RegisterTest('WC_8686', 'Ta', 'TaPayTypeSet', 'EditPayTypeSettings', Test1);

end.
