unit WC_8981;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wc_srvc_grp;

procedure Test1;
begin
  TFrmServiceGroups.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8981', 'Workcntr', 'wc_srvc_grp', 'DoShowModal', Test1, 1);

end.
