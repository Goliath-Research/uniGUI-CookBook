unit WC_8336;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  Rej_main;

procedure Test1;
begin
  ShowRejectList;
end;

initialization

  TTestRepo.RegisterTest('WC-8336', 'Rt', 'Rej_main', 'ShowRejectList', Test1);

end.
