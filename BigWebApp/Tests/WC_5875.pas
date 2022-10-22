unit WC_5875;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGuiApplication,
  NewCustTemp;

procedure TestDoShowModal;
begin
  DoNewCustTempl;
end;

initialization
  TTestRepo.RegisterTest('WC-5875', 'Customer', 'NewCustTemp', 'DoNewCustTempl', TestDoShowModal);
end.
