unit WC_8233;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RBom_QkPrompt;

procedure Test1;
var
  S1, S2: string;
begin
  if TFrmRBomQuickPrompt.DoShowModal(S1, S2) then
    Showmessage('S1=' + S1 + ' - S2=' + S2)
  else
    Showmessage('Cancelled');
end;

initialization

TTestRepo.RegisterTest('WC-8233', 'Rbom', 'RBom_QkPrompt', 'DoShowModal', Test1, 1);

end.
