unit WC_7591;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  ps_tracking_req_chk;

procedure TestTFrmTrackingRequiredException;
var
  LFrmTrackingRequiredException : TFrmTrackingRequiredException;
begin
  LFrmTrackingRequiredException := TFrmTrackingRequiredException.Create(UniGUIApplication.UniApplication);
end;

initialization
  TTestRepo.RegisterTest('WC-7591', 'Packslip',  'ps_tracking_req_chk', 'Create', TestTFrmTrackingRequiredException);
end.
