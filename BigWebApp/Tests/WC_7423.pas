unit WC_7423;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  MainModule,
  uniStringGrid,
  UniGuiApplication,
  uniGUIForm,
  MCQte_sg;

procedure Testbom_pts_per_check;
var
  stringgrid : TUniStringGrid;
begin
  DoMCQuoteStringGrid(46,stringgrid);
end;

initialization

  TTestRepo.RegisterTest('WC-7423', 'Multicur', 'MCQte_sg', 'DoMCQuoteStringGrid', Testbom_pts_per_check);

end.
