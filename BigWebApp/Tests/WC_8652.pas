unit WC_8652;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TaSetHol;

procedure TestTFrmTaSetHol;
var
  StartDate : TDateTime;
  EndDate : TDateTime;
begin
  StartDate := 26/05/2015;
  EndDate := 20/03/2016;
  DoTAAssignHolidayDates(StartDate,EndDate);
end;

initialization
  TTestRepo.RegisterTest('WC-8652', 'Ta', 'TaSetHol', 'DoTAAssignHolidayDates', TestTFrmTaSetHol);
end.
