unit WC_8958;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Data.DB,
  MainModule,
  FireDAC.Comp.Client,
  RT_addr;

procedure Test1;
begin
  DoRTAddress(1);
end;

initialization
  TTestRepo.RegisterTest('WC-8958', 'Workcntr', 'RT_addr', 'DoRTAddress', Test1,1);
end.
