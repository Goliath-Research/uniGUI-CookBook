unit WC_7825;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  PO_ChkStatusChange,
  uniGUIApplication;

procedure Test1;
var
  Res : boolean;
begin
  Res := DoShowModalPOChkStatusChange('test','');
  ShowMessage(IfThen(Res, 'Continue', 'Cancelled'));
end;

initialization

  TTestRepo.RegisterTest('WC-7825', 'Po', 'PO_ChkStatusChange', 'DoShowModalPOChkStatusChange', Test1);

end.
