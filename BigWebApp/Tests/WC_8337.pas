unit WC_8337;

interface

implementation

uses
  TestReg,
  Rt_RejRep,
  System.SysUtils;

procedure Test1;
var
  a : Real;
begin
  TFrmRT_RejRep.DoShow(Now,2, 16651);
end;

initialization

  TTestRepo.RegisterTest('WC-8337', 'Rt', 'Rt_RejRep', 'IQGetConvertedUOM_SD', Test1);
end.
