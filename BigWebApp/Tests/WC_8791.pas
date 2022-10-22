unit WC_8791;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  OverDispoChk;

procedure Test1;
begin
  CheckOverDispo(88,44);
end;

initialization

  TTestRepo.RegisterTest('WC-8791', 'Trans', 'OverDispoChk', 'CheckOverDispo', Test1);
end.
