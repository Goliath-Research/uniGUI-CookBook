unit WC_6829;

interface

implementation

uses
  TestReg,
  TPD_Jump_Planned,
  System.SysUtils;

procedure Test1;
var
  Week_Start: TDateTime;
begin
  Week_Start := StrToDateTime('05/29/2016');
  DoTPD_Jump_PlannedMPS(147536, Week_Start);
end;

initialization

  TTestRepo.RegisterTest('6829', 'Iqmps', 'TPD_Jump_Planned', 'DoTPD_Jump_PlannedMPS', Test1);
end.
