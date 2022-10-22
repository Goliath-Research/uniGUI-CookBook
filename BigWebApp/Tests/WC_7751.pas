unit WC_7751;

interface

implementation

uses
  TestReg,
  Pmcomp;

procedure Test1;
begin
  DoPMComponents(20097);
end;

initialization

  TTestRepo.RegisterTest('WC-7751', 'Pm', 'Pmcomp', 'DoPMComponents', Test1);

end.
