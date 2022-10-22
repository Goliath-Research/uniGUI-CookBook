unit WC_8349;

interface

implementation

uses
  TestReg,
  System.SysUtils,
  uniGUIApplication,
  RtdwnAdd;

procedure TestDoShowModal;
begin
  TFrmRTDwnAdd.DoShowModal(147536, Now ,4);
end;

initialization

  TTestRepo.RegisterTest('WC_8349', 'Rt', 'RtdwnAdd', 'DoShowModal', TestDoShowModal);
end.
