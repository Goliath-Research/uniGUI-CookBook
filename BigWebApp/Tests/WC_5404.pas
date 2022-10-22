unit WC_5404;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  day_Proj;

procedure Test1;
begin
  DoDailyPartsProj
end;

initialization
  TTestRepo.RegisterTest('WC-5404', 'Capacity',  'day_Proj', 'DoDailyPartsProj', Test1);
end.
