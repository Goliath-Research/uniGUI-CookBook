unit WC_5414;

interface

implementation

uses
  TestReg,
  Mat_Stag;

procedure Test1;
begin
  DoMatStaging;
end;

initialization

TTestRepo.RegisterTest('WC-5414', 'Capacity', 'Mat_Stag', 'DoMatStaging', Test1, 1);

end.
