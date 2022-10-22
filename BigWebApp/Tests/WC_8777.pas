unit WC_8777;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  LotTree;

procedure TestTFrmLotTree;
begin
   DoLotTree;
end;

initialization

  TTestRepo.RegisterTest('WC-8777', 'Tracking', 'LotTree', 'DoLotTree', TestTFrmLotTree);

end.
