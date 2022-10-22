unit WC_7009;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_debug;

procedure Test1;
begin
  ShowXML('AXMLRequest', 'AXMLResponse');
end;

procedure Test2;
begin
  ShowIQShipManDebug('AError', 'AXMLRequest', 'AXMLResponse');
end;

initialization
  TTestRepo.RegisterTest('WC-7009', 'Iqshipman',  'shipman_debug', 'ShowXML(AXMLRequest, AXMLResponse: String)', Test1,1);
  TTestRepo.RegisterTest('WC-7009', 'Iqshipman',  'shipman_debug', 'ShowIQShipManDebug(AError, AXMLRequest, AXMLResponse: String)', Test2,2);
end.
