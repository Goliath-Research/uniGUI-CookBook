unit WC_5529;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MultiSelectEplants;

procedure Test1;
begin
  DoMultiSelectEplants('PASO');
end;

initialization

  TTestRepo.RegisterTest('WC-5529', 'Cr', 'MultiSelectEplants', 'DoMultiSelectEplants', Test1);

end.
