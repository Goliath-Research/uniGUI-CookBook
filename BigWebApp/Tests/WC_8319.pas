unit WC_8319;

interface

implementation

uses
  MainModule,
  TestReg,
  Dwn_main;

procedure Test1;
begin
  ShowDownCodes;
end;

initialization

  TTestRepo.RegisterTest('WC-8319', 'Rt', 'Dwn_Main', 'ShowDownCodes', Test1);

end.
