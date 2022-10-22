unit WC_8609;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  Snd_Link;

procedure Test1;
begin
    ShowSndOper('OP',112);
end;
procedure Test2;
begin
    ShowSndOper('OV',112);
end;
procedure Test3;
begin
    ShowSndOper('IN',112);
end;
procedure Test4;
begin
    ShowSndOper('PK',112);
end;
procedure Test5;
begin
    ShowSndOper('BL',112);
end;
procedure Test6;
begin
    ShowSndOper('PR',112);
end;


initialization

  TTestRepo.RegisterTest('WC-8609', 'SNDOP', 'ShowSndOper', 'OP', Test1, 1);
  TTestRepo.RegisterTest('WC-8609', 'SNDOP', 'ShowSndOper', 'OV', Test2,2);
  TTestRepo.RegisterTest('WC-8609', 'SNDOP', 'ShowSndOper', 'IN', Test3,3);
  TTestRepo.RegisterTest('WC-8609', 'SNDOP', 'ShowSndOper', 'PK', Test4,4);
  TTestRepo.RegisterTest('WC-8609', 'SNDOP', 'ShowSndOper', 'BL', Test5,5);
  TTestRepo.RegisterTest('WC-8609', 'SNDOP', 'ShowSndOper', 'PR', Test6,6);

end.
