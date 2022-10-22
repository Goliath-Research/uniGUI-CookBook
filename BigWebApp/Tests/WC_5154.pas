unit WC_5154;

interface

implementation

uses
  MainModule,
  TestReg,
  APRec;

procedure TestDrillDown;
//var
//  Po_Detail_ID : Real;
begin
//  Po_Detail_ID := UniMainModule.FDConnection1.ExecSQLScalar('');
  DoApRecDrillDown(9459);
end;

initialization

  TTestRepo.RegisterTest('WC-5154', 'Ap', 'APRec', 'DoApRecDrillDown', TestDrillDown);

end.
