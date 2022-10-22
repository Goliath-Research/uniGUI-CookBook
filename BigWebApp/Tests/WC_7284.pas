unit WC_7284;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  tl_whiteboard_drilldown;

procedure TestTFrmToolingReportLaborByEmployee;
begin
  TFrmToolingWhiteboardDrillDown.DoShow(524, 2114, 25/04/2015, 16/05/2016);
end;

initialization

  TTestRepo.RegisterTest('WC-7284', 'Iqtool', 'tl_whiteboard_drilldown', 'DoShow', TestTFrmToolingReportLaborByEmployee);

end.
