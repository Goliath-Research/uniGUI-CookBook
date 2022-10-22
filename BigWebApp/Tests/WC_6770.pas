unit WC_6770;

interface

implementation

uses
  TestReg,
  ImpError;

procedure Test1;
begin
  ShowError;
end;

initialization

  TTestRepo.RegisterTest('WC-6770', 'Iqimp', 'ImpError', 'ShowError', Test1);

end.
