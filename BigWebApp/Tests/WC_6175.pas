unit WC_6175;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  heijunka_conf_move;

procedure Test1;
var
tmp: integer;
begin
  TFrmHeijunkaConfirmMove.DoShowModal(nil, nil, 1, tmp);
  ShowMessage(IntToStr(tmp));
end;

initialization

  TTestRepo.RegisterTest('WC-6175', 'Heijunka', 'heijunka_conf_move', 'DoShowModal', Test1, 1);

end.
