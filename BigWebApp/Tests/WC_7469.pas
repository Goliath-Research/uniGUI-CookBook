unit WC_7469;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  PkTktChkEx;

procedure Test1;
var
  frm: TFrmOrdOnPkTktExceptionEx;
begin
  frm:= TFrmOrdOnPkTktExceptionEx.Create(uniGUIApplication.uniApplication);
  frm.ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7469', 'OE', 'PkTktChkEx', 'Create', Test1, 1);

end.
