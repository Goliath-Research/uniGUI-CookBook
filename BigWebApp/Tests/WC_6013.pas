unit WC_6013;

interface

implementation

uses
  MainModule,
  TestReg,
  dng_history;

procedure Test1;
begin
  DoDunningHistory(20156,83);
end;

initialization
  TTestRepo.RegisterTest('WC-6013','Dunning','dng_history', 'DoDunningHistory', Test1);

end.
