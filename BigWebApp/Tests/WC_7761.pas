unit WC_7761;

interface

implementation

uses
  TestReg,
  Pmoption;

procedure Test1;
begin
  DoPMOptions;
end;

initialization

  TTestRepo.RegisterTest('WC-7761', 'Pm', 'Pmoption', 'DoPMOptions', Test1);

end.
