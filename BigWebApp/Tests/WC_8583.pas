unit WC_8583;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  sd_webview;

procedure Test1;
begin
  TFrmSDWebView.create(UniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8583', 'Shopdata', 'sd_webview', 'create', Test1);
end.
