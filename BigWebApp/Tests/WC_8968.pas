unit WC_8968;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  View_Cel;

procedure Test1;
begin
  DoEditCells;
end;

initialization

  TTestRepo.RegisterTest('WC-8968', 'Workcntr', 'View_Cel', 'DoEditCells', Test1, 1);

end.
