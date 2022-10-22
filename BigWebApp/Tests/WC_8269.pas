unit WC_8269;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  Under_Recv_Chk;

procedure Test;
begin
  TFrmUnderRecvCheck.DoExecute(8105);
end;

initialization

  TTestRepo.RegisterTest('WC-8269', 'Receive', 'Under_Recv_Chk', 'DoExecute', Test);

end.
