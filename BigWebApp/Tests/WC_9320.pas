unit WC_9320;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  oc_in_transit_exceeded_chk;

procedure Test1;
begin
  CheckInTransitQtyExceeded(1, 2, 0);
end;

initialization

  TTestRepo.RegisterTest('WC-9320', 'outsource_central', 'oc_in_transit_exceeded_chk', 'CheckInTransitQtyExceeded', Test1, 1);

end.
