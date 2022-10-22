unit WC_8980;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  wc_select_mfgtype_assy2;

procedure Test1;
var
  frm: TFrmWorkCenterSelectMfgTypeAssy2;
begin
  frm:= TFrmWorkCenterSelectMfgTypeAssy2.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8980', 'Workcntr', 'wc_select_mfgtype_assy2', 'Create', Test1, 1);

end.
