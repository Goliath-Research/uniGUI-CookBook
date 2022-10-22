unit WC_8496;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  SchdDown;

procedure Test1;
var
 Form: TAddDownTime;
begin
  Form := TAddDownTime.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8496', 'Sched', 'SchdDown', 'TAddDownTime', Test1);
end.
