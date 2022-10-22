unit WC_5415;

interface

implementation

uses
  TestReg,
  Mat_Xcpt;

procedure Test1;
begin
  DoMatException;
end;

procedure Test2;
begin
  DoIQJumpToMatException(1);
end;

initialization

TTestRepo.RegisterTest('WC-5415', 'Capacity', 'Mat_Xcpt', 'DoMatException', Test1, 1);
TTestRepo.RegisterTest('WC-5415', 'Capacity', 'Mat_Xcpt', 'DoIQJumpToMatException', Test2, 2);

end.
