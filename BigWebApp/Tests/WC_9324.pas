unit WC_9324;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  oc_inventory_rejects;

procedure Test1;
var
  R: Real;
  S1,S2: string;
begin
  TFrmOutsourceInvReject.DoShowModal(R, S1, S2);
  ShowMessage( FloatToStr(R) + ' - ' + S1 + ' - ' + S2 );
end;

initialization

  TTestRepo.RegisterTest('WC-9324', 'outsource_central', 'oc_inventory_rejects', 'CheckInTransitQtyExceeded', Test1, 1);

end.
