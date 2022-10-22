unit WC_7836;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PoRel_Dlg;

procedure Test1;
var
  tmp: TRelInputCargo;
begin
  tmp.Count := 123;
  tmp.Start_Date := 0;
  tmp.Qty_Per := 45.67;

  if DoReleasesDialog(tmp) then
    Showmessage(IntToStr(tmp.Count))
  else
    Showmessage('Cancelled');

end;

initialization

TTestRepo.RegisterTest('WC-7836', 'Po', 'PoRel_Dlg', 'DoReleasesDialog', Test1, 1);

end.
