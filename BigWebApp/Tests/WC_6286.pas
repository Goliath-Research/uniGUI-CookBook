unit WC_6286;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  InvItspc;

procedure Test;
begin
  DoInvItemSpec;
end;

initialization
  TTestRepo.RegisterTest('WC-6286', 'Inv', 'InvItspc', 'DoInvItemSpec', Test);
end.
