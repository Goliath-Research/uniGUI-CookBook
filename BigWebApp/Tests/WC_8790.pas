unit WC_8790;

interface

implementation

uses
  TestReg,
  LocWOHardAllocChk,
  System.SysUtils;

procedure Test1;
begin
  CheckLocationWorkOrderHardAllocated(189828);
end;

initialization

  TTestRepo.RegisterTest('WC-8790', 'Trans', 'LocWOHardAllocChk', 'CheckLocationWorkOrderHardAllocated', Test1);
end.
