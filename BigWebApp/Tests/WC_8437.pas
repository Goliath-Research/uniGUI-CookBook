unit WC_8437;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  SalPRTC;

procedure Test1;
begin
  DoShowPRCommissionsTimecards;
end;

initialization

  TTestRepo.RegisterTest('WC-8437', 'Salesmen', 'SalPRTC', 'DoShowPRCommissionsTimecards', Test1);

end.
