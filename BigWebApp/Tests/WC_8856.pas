unit WC_8856;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  trans_non_conf_dispo_designated_chk;

procedure Test1;
begin
  CheckLocationNonConformDispoDesignated(170668, tntLocationToNonConform);
end;

initialization

  TTestRepo.RegisterTest('WC-8856', 'trans', 'trans_non_conf_dispo_designated_chk', 'CheckLocationNonConformDispoDesignated', Test1);

end.
