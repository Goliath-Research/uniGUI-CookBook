unit WC_7023;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_logfrm;

procedure Test;
begin
  TFrmShipManLog.Create(UniGUIApplication.UniApplication).showmodal;
end;

initialization
  TTestRepo.RegisterTest('WC-7023', 'Iqshipman',  'shipman_logfrm', 'DoShowModal', Test);
end.
