unit WC_8977;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wc_rtlabel_groups;

procedure Test1;
begin
  TFrmWorkCenterRTLabelGroup.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-8977', 'Workcntr', 'wc_rtlabel_groups', 'DoShow', Test1, 1);

end.
