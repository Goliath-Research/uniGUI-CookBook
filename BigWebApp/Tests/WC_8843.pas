unit WC_8843;

interface

implementation

uses
  TestReg,
  TrLgDtAl,
  System.SysUtils;

procedure Test1;
var
  DateStart, DateEnd: TDateTime;
begin
  DateStart := StrToDateTime('04/10/2016');
  DateEnd := StrToDateTime('04/25/2016');
  DoTransLogBetweenDatesAll(156735, DateStart , DateEnd);
end;

initialization

  TTestRepo.RegisterTest('WC-8843', 'Trans', 'TrLgDtAl', 'DoTransLogBetweenDatesAll', Test1);
end.
