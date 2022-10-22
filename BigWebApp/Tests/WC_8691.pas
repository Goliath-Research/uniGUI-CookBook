unit WC_8691;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TaTaskMsg;

procedure Test1;
begin
  DoTaTaskMsg('WO', '175060');
end;

initialization

  TTestRepo.RegisterTest('WC-8691', 'Ta', 'TaTaskMsg', ' DoTaTaskMsg', Test1, 1);

end.
