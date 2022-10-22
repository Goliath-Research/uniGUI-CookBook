unit WC_5366;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  LbsK_Dlg;

procedure TestAlterLbsKCalculationDialog;
begin
  AlterLbsKCalculationDialog;
end;

initialization

  TTestRepo.RegisterTest('WC-5366', 'Bom', 'LbsK_Dlg', 'AlterLbsKCalculationDialog', TestAlterLbsKCalculationDialog);

end.
