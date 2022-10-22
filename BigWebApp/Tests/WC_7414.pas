unit WC_7414;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGuiApplication,
  MCPOTot;

procedure TestDoShowModal;
var
  LFrmMCPOTotals : TFrmMCPOTotals;
begin
  LFrmMCPOTotals := TFrmMCPOTotals.create(UniGuiApplication.UniApplication);
end;

initialization
  TTestRepo.RegisterTest('WC-7414', 'Multicur', 'MCPOTot', 'TFrmMCPOTotals.create', TestDoShowModal);
end.
