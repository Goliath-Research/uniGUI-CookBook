unit WC_8826;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  uniGUIDialogs,
  TranOffs;

procedure Test1;
 var AID: Real;
begin
  if GetTransLogOffsetID(AID) then
    ShowMessage(FloatToStr(AID));
end;

initialization

  TTestRepo.RegisterTest('WC-8826', 'Trans', 'TranOffs', 'GetTransLogOffsetID', Test1);

end.
