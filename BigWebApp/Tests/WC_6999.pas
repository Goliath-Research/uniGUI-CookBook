unit WC_6999;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_common,
  shipman_carrier_printers;

procedure Test;
var ALabelPrinterID: Real;
 AReportPrinterID: Real;
begin
  ALabelPrinterID := 745;
  AReportPrinterID := 456;
  DoCarrierPrinters(ctFedExExpress,ALabelPrinterID,AReportPrinterID);
end;

initialization
  TTestRepo.RegisterTest('WC-6999', 'Iqshipman',  'shipman_carrier_printers', 'DoCarrierPrinters', Test);
end.
