unit WC_5410;

interface

implementation

uses
  TestReg,
  Lab_Whiteboard;

procedure Test1;
begin
  TFrmLabWhiteboard.DoShow();
end;

initialization

  TTestRepo.RegisterTest('WC-5410', 'Capacity', 'Lab_Whiteboard', 'DoShow', Test1);

end.
