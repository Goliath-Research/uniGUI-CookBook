unit WC_6057;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FaFinalizeNonFin;

procedure Test1;
begin
  DoFinalizeNonFin;
end;

initialization

  TTestRepo.RegisterTest('WC-6057', 'Fa', 'FaFinalizeNonFin', 'DoFinalizeNonFin', Test1, 1);

end.
