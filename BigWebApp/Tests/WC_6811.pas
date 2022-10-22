unit WC_6811;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  M_RTEff;

procedure TestDoShowModal;
begin
  TFrmM_RTEff.DoShow(55974);
end;

initialization
  TTestRepo.RegisterTest('WC-6811', 'Iqmeter', 'M_RTEff', 'DoShow', TestDoShowModal);
end.
