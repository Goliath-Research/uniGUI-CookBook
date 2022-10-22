unit WC_7846;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  po_chk_release_received;

procedure Test1;
var
  r : boolean;
begin
  r := DoShowModalPOChkReleaseReceived('test', '');
  ShowMessage(IfThen(r, 'Ok', 'Cancelled'));
end;

initialization

  TTestRepo.RegisterTest('WC-7846', 'Po', 'po_chk_release_received', 'DoShowModalPOChkReleaseReceived', Test1);

end.
