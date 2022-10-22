unit WC_6814;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  M_Viewer;

procedure TestDoShowModal;
begin
  TFrmM_Viewer.DoShow(12);
end;

initialization
  TTestRepo.RegisterTest('WC-6814', 'Iqmeter', 'M_Viewer', 'DoShow', TestDoShowModal);
end.
