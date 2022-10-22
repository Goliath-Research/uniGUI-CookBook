unit WC_9451;

interface

implementation

uses
  TestReg,
  System.Variants,
  IQMS.WebVcl.Time;

procedure Test1;
 var
  t: TIQWebTiming;
begin
  t:=TIQWebTiming.Create(nil);
  t.Start('1');
  t.Stop('1');
  t.Display;
end;

initialization

  TTestRepo.RegisterTest('WC-9451', 'vcl', 'IQTime', 'Display', Test1);
end.
