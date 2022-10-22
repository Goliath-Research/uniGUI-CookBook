unit WC_8979;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  wc_select_mfgtype;

procedure Test1;
var
  frm: TFrmWorkCenterSelectMfgType;
begin
  frm:= TFrmWorkCenterSelectMfgType.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8979', 'Workcntr', 'wc_select_mfgtype', 'Create', Test1, 1);

end.
