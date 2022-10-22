unit WC_5381;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  bom_pts_per_check;

procedure Testbom_pts_per_check;
var
  LVar: Real;
begin
  CheckBOMPtsPerIsZero(12,85,0);
end;

initialization

  TTestRepo.RegisterTest('WC-5381', 'Bom', 'bom_pts_per_check', 'CheckBOMPtsPerIsZero', Testbom_pts_per_check);

end.
