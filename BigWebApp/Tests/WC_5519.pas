unit WC_5519;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  CRConfAppl;

procedure Test1;
var
  r : boolean;
begin
  r := DoShowModalCrConfAppl('test','');
  ShowMessage(IfThen(r, 'Ok', 'Cancel'));
end;

initialization

  TTestRepo.RegisterTest('WC-5519', 'Cr', 'CRConfAppl', 'DoShowModalCrConfAppl', Test1);

end.
