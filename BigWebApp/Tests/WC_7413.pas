unit WC_7413;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGuiApplication,
  MCPoDet;

procedure TestDoShowModal;
var
  LFrmMCPODetails : TFrmMCPODetails;
begin
  LFrmMCPODetails := TFrmMCPODetails.create(UniGuiApplication.UniApplication);
end;

initialization
  TTestRepo.RegisterTest('WC-7413', 'Multicur', 'MCPoDet', 'TFrmMCPODetails.create', TestDoShowModal);
end.
