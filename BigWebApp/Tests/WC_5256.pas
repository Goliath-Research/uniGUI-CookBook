unit WC_5256;

interface

implementation

uses
  TestReg,
  AssyGroup_Lab_Whiteboard;

procedure Test1;
begin
  TFrmAssyGroupLabWhiteboard.DoShow();
end;

initialization

  TTestRepo.RegisterTest('WC-5256', 'AssyTrack', 'AssyGroup_Lab_Whiteboard', 'DoShow', Test1);

end.
