unit WC_6287;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  Invmspcs;

procedure Test;
begin
  DoMasterSpecs;
end;

initialization
  TTestRepo.RegisterTest('WC-6287', 'Inv',  'Invmspcs', 'DoMasterSpecs', Test);
end.
