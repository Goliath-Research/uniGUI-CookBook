unit WC_7191;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Sys_comp;

procedure Test;
begin
  DoEditCompany(2);
end;

initialization

  TTestRepo.RegisterTest('WC-7191', 'Iqsys', 'Sys_comp', 'DoEditCompany', Test);

end.
