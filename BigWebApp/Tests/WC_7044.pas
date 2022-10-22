unit WC_7044;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_quantum_view;

procedure Test;
begin
  TFrmQuantumView.Execute(45454);
end;

initialization
  TTestRepo.RegisterTest('WC-7044', 'Iqshipman',  'shipman_quantum_view', 'Execute', Test);
end.
