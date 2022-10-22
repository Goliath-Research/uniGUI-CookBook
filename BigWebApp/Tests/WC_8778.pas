unit WC_8778;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RevTree;

procedure TestTFrmRevLotTree;
begin
   DoRevLotTree;
end;

initialization

  TTestRepo.RegisterTest('WC-8778', 'Tracking', 'RevTree', 'DoRevLotTree', TestTFrmRevLotTree);

end.
