unit WC_8806;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  TranAssoc;

procedure Test1;
var ATransLog_ID: Real; AStandard_ID: Real;
begin
  AStandard_ID:=2;
  GetTransLogAssociatedID(ATransLog_ID,AStandard_ID);
end;

initialization

  TTestRepo.RegisterTest('WC-8806', 'Trans', 'TranAssoc', 'DoShowModal', Test1);

end.
