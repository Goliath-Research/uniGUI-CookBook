unit WC_8796;

interface

implementation

uses
  TestReg,
  TrLogDat,
  System.SysUtils;

procedure Test1;
var
  DateStart, DateEnd: TDateTime;
begin
  DateStart := StrToDateTime('04/10/2016');
  DateEnd := StrToDateTime('04/25/2016');
  DoTransLogBetweenDates(156735, DateStart , DateEnd);
end;

initialization

  TTestRepo.RegisterTest('WC-8796', 'Trans', 'TrLogDat', 'DoTransLogBetweenDates', Test1);
end.
