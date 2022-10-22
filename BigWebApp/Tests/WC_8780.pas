unit WC_8780;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  SerDrlDn;

procedure Test1;
begin
  DoSerialDrillDown(1);
end;

initialization

  TTestRepo.RegisterTest('WC-8780', 'Tracking ', 'SerDrlDn', 'DoSerialDrillDown', Test1);

end.
