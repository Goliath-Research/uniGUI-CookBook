unit WC_6271;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  FireDAC.Comp.Client,
  MainModule,
  InvEnvRegComponents;

procedure Test;
begin
  TFrmInvEnvRegComponents.DoShowModal(148995);
end;

initialization
  TTestRepo.RegisterTest('WC-6271', 'Inv', 'InvEnvRegComponents', 'DoShow', Test);

end.
