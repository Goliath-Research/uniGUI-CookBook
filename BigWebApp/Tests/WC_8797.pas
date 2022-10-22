unit WC_8797;

interface

implementation

uses
  TestReg,
  TrLogEle,
  System.SysUtils;

procedure Test1;
var
  DateStart, DateEnd: TDateTime;
  Element: string;
begin
  DateStart := StrToDateTime('04/10/2016');
  DateEnd := StrToDateTime('04/25/2016');
  Element:= 'HN-REGRESSION                 ';
  DoTransLogByElementBetweenDates(156735, DateStart , DateEnd, Element);
end;

initialization

  TTestRepo.RegisterTest('WC-8797', 'Trans', 'TrLogEle', 'DoTransLogByElementBetweenDates', Test1);
end.
