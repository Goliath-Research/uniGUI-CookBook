unit WC_8972;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  wc_confirm_center_type_change;

procedure Test1;
begin
{ TODO -oLema : I didn't find any valid parameters, so I bypassed the code in order to render the form }
  Showmessage( IntToStr(TFrmWorkCenterConfirmCenterTypeChange.DoShowModal(0, '1', '')) );
end;

initialization

  TTestRepo.RegisterTest('WC-8972', 'Workcntr', 'wc_confirm_center_type_change', 'DoShowModal', Test1, 1);

end.
