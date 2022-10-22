unit WC_6268;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  InvCAS;

procedure Test;
begin
  TFrmInvCAS.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-6268', 'Inv',  'InvCAS', 'DoShow', Test);
end.
