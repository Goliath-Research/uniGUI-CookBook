unit WC_7834;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  PoManAdj;

procedure Test1;
begin
  if DoManualReceivedQuantityAdjustment(1, 'test') then
    Showmessage('TRUE') else
    Showmessage('FALSE');
end;

initialization

  TTestRepo.RegisterTest('WC-7834', 'Po', 'PoManAdj', 'DoManualReceivedQuantityAdjustment', Test1, 1);

end.
