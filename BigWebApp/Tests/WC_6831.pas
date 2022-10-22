unit WC_6831;

interface

implementation

uses
  TestReg,
  TPD_WO_Manager,
  System.SysUtils;

procedure Test1;
begin
  TFrmTPD_WO_Manager.DoShowModal(155516);
end;

initialization

  TTestRepo.RegisterTest('WC_6831', 'Iqmps', 'TPD_WO_Manager', 'DoShowModal', Test1);
end.
