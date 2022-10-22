unit WC_8535;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  StdLabor;

procedure Test;
begin
  DoSetStdLaborHrs;
end;

initialization

  TTestRepo.RegisterTest('WC-8535', 'Shop_Su', 'StdLabor', 'DoSetStdLaborHrs', Test);

end.
