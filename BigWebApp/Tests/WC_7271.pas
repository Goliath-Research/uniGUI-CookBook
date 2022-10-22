unit WC_7271;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  tl_param;

procedure TestTFrmTlParam;
begin
  TFrmTlParam.DoShowModal;
end;

initialization
  TTestRepo.RegisterTest('WC-7271', 'Iqtool',  'tl_param', 'DoShowModal', TestTFrmTlParam);
end.
