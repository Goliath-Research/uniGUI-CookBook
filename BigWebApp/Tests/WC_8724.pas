unit WC_8724;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  tag_xfgmulti;

procedure Test1;
begin
//  TFrmTagXFgMulti.DoShowModal(157);
  TFrmTagXFgMulti.DoShowModal(222);
end;

initialization

TTestRepo.RegisterTest('WC-8724', 'Taginv', 'tag_xfgmulti', 'DoShowModal', Test1, 1);

end.
