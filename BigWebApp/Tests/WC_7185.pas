unit WC_7185;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FrmPlug;

procedure Test1;
var
  S1,S2: string;
begin
  S1 := 'ACCOUNT';
  S2 := 'test';
  GetGLPlugInValue(S1, S2);
end;

initialization

  TTestRepo.RegisterTest('WC-7185', 'Iqsys', 'FrmPlug', 'GetGLPlugInValue', Test1, 1);

end.
