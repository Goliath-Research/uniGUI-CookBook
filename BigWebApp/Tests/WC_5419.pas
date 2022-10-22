unit WC_5419;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  uniGUIDialogs,
  openpos;

procedure Test1;
var
  AArinvt_ID: Real;
begin
  AArinvt_ID:= UniMainModule.FDConnection1.ExecSQLScalar('select max(id) from arinvt');
  DoShowOpenPOs(AArinvt_ID,  now);
end;

initialization

  TTestRepo.RegisterTest('WC-5419', 'Capacity', 'FrmOpenPOs', 'DoShowOpenPOs', Test1);

end.
