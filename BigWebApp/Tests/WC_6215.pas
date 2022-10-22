unit WC_6215;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  rsm_viewconst;

procedure Test1;
begin
  DoViewConst('Test Title','test string');
end;

initialization
  TTestRepo.RegisterTest('WC-6215', 'IQResourceStrMngr', 'FrmRsmViewConst', 'DoViewConst', Test1);
end.
