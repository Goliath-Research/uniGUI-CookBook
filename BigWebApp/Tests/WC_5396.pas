unit WC_5396;

interface

implementation

uses
  TestReg,
  Cap_Whiteboard;

procedure Test1;
begin
  TFrmCapWhiteboard.DoShow();
end;

initialization

  TTestRepo.RegisterTest('WC_5396', 'Capacity', 'Cap_Whiteboard', 'DoShow', Test1);
end.
