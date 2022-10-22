unit WC_7800;

interface

implementation

uses
  TestReg,
  pm_ref;

procedure Test1;
begin
   DoPMRef(20097);
end;

procedure Test2;
begin
   DoPMRefWhereUsed(20097);
end;

initialization

  TTestRepo.RegisterTest('WC-7800','PM', 'pm_ref', 'DoPMRef', Test1, 1);
  TTestRepo.RegisterTest('WC-7800','PM', 'pm_ref', 'DoPMRefWhereUsed', Test2, 2);

end.
