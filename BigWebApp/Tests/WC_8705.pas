unit WC_8705;

interface

implementation

uses
  TestReg,
  WhoLoggedIn;

procedure Test1;
begin
  FindWhoLoggedIn(['AS', 'WO', 'JS']);
end;

initialization

  TTestRepo.RegisterTest('WC-8705', 'Ta', 'WhoLoggedIn', 'FindWhoLoggedIn', Test1);

end.
