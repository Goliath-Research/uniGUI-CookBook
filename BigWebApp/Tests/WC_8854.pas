unit WC_8854;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  trans_master_loc_non_conf_dispo_designated_chk;

procedure Test1;
begin
  CheckMasterLocationNonConformDispoDesignated(20482)
end;

initialization

  TTestRepo.RegisterTest('WC-8854', 'Trans', 'trans_master_loc_non_conf_dispo_designated_chk', 'CheckMasterLocationNonConformDispoDesignated', Test1);

end.
