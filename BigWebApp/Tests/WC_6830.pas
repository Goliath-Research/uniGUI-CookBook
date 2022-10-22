unit WC_6830;

interface

implementation

uses
  TestReg,
  TPD_Jump_SO,
  System.SysUtils;

procedure Test1;
var
  Week_Start: TDateTime;
begin
  Week_Start := StrToDateTime('05/29/2016');
  DoTPD_Jump_SO(147536, Week_Start);
end;

initialization

  TTestRepo.RegisterTest('WC_6830', 'Iqmps', 'TPD_Jump_SO', 'DoTPD_Jump_SO', Test1);
end.
