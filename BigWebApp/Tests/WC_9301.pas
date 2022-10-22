unit WC_9301;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  spc_chartwiz_chart_bitmap;

procedure Test1;
var
 Form: TFrmSPCChartWizExportChartBmp;
begin
   Form := TFrmSPCChartWizExportChartBmp.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-9301', 'iqspc_chart', 'spc_chartwiz_chart_bitmap', 'create', Test1);
end.
