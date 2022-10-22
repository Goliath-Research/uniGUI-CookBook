unit WC_6113;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs, uniGUIApplication,
  Main_Find;

procedure Test1;
begin
  TFrmFindTimes.Create(UniApplication).ShowModal;
end;

initialization
  TTestRepo.RegisterTest('WC-6113', 'FindTimes',  'Main_Find', 'TFrmFindTimes.Create(UniApplication).ShowModal', Test1);
end.
