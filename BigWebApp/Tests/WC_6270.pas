unit WC_6270;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  FireDAC.Comp.Client,
  MainModule,
  InvEnvReg;

procedure Test;
begin
  TFrmInvEnvRegulation.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-6270', 'Inv', 'InvEnvReg', 'DoShow', Test);

end.
