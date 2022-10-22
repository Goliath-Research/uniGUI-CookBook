unit WC_8302;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RmaByLotNumber;

procedure Test1;
begin
  Showmessage( FloatToStr(GetShipmentDtlId_ByLotNumber(1)) );
end;

procedure Test2;
var
  tmp: TFrmRmaByLotNumberRec;
begin
  if GetShipmentDtlId_ByLotNumberEx(1, tmp) then
    Showmessage('OK') else
    Showmessage('Cancelled');
  
end;

initialization

  TTestRepo.RegisterTest('WC-8302', 'Rma', 'RmaByLotNumber', 'GetShipmentDtlId_ByLotNumber', Test1, 1);
  TTestRepo.RegisterTest('WC-8302', 'Rma', 'RmaByLotNumber', 'GetShipmentDtlId_ByLotNumberEx', Test2, 2);

end.
