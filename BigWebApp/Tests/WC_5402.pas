unit WC_5402;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  DPPfilt;

procedure Test1;
begin
  DoDppFilter
end;

initialization
  TTestRepo.RegisterTest('WC-5402', 'Capacity',  'DPPfilt', 'DoDppFilter', Test1);
end.
