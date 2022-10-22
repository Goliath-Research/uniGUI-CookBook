unit WC_8644;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Taholday;

procedure TestTFrmTAHolidays;
begin
  DOTAHolidays;
end;

initialization
  TTestRepo.RegisterTest('WC-8644', 'Ta', 'Taholday', 'DOTAHolidays', TestTFrmTAHolidays);
end.
