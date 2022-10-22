unit WC_8484;

interface

implementation

uses
  TestReg,
  sysutils,
  System.Variants,
  SchdTool;

procedure Test1;
begin
  DoShowToolConflict( 1,date,date );
end;

initialization

  TTestRepo.RegisterTest('WC-8484', 'Sched', 'SchdTool', 'DoShowToolConflict', Test1);
end.
