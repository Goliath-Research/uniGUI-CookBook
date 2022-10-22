unit WC_6052;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FaBkHist;

procedure TestDoShowModal;
begin
  DoShowBookHist;
end;

initialization
  TTestRepo.RegisterTest('WC-6052', 'Fa', 'FaBkHist', 'DoShowBookHist', TestDoShowModal);
end.
