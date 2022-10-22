unit WC_8787;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  CheckMrb;

procedure Test1;
var
  Res : boolean;
begin
  Res := DoShowModalCheckMrb('test','');
  ShowMessage(IfThen(Res, 'Yes', 'No'));
end;


initialization

  TTestRepo.RegisterTest('WC-8787', 'trans', 'CheckMrb', 'DoShowModalCheckMrb', Test1);

end.
