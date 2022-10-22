unit WC_8971;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wc_conf_cntr_type_costs;

procedure Test1;
begin
  ShowMessage( IntToStr(TConfDfltCntrType.DoShowModal) );
end;

initialization

  TTestRepo.RegisterTest('WC-8971', 'Workcntr', 'wc_conf_cntr_type_costs', 'DoShowModal', Test1, 1);

end.
