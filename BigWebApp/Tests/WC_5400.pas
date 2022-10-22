unit WC_5400;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  Day_Part;

procedure Test1;
begin
  DoShowDayParts(1);
end;

initialization

  TTestRepo.RegisterTest('WC-5400', 'Capacity', 'Day_Part', 'DoShowDayParts', Test1);

end.
