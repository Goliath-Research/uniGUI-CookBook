unit WC_7012;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_document_list;

procedure Test;
begin
  DoShippingDocuments(1154);
end;

initialization
  TTestRepo.RegisterTest('WC-7012', 'Iqshipman',  'shipman_document_list', 'DoShippingDocuments', Test);
end.
