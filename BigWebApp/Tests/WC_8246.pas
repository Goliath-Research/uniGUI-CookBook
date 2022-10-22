unit WC_8246;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RD_Share,
  RD_Options;

procedure Test1;
var
  tmp: TRDDispOptions;
begin
  tmp.ShowOnHand      := TRUE;
  tmp.ShowNonComitted := FALSE;
  tmp.ShowStdCost     := TRUE;
  tmp.ShowExtCost     := FALSE;

  if SetRoutingDiagramOptions(tmp) then
    Showmessage('ShowStdCost = ' + BoolToStr(tmp.ShowStdCost, True) )
  else
    Showmessage('Cancelled');

end;

initialization

TTestRepo.RegisterTest('WC-8246', 'Rd', 'RD_Options', 'SetRoutingDiagramOptions', Test1, 1);

end.
