unit IQMS.PackSlip.VMIShared;

interface

uses
  Classes;

type
  TVMI_TransMode = (vtmUnknown, vtmConsume, vtmReturn, vtmVoid);

  TVMI_Consume_Params = record
    Master_Label_List: TStringList;
    NativeQty: Real;
    VMI_FGMulti_ID: Real;
    Shipment_DTL_ID: Real;
    Reason: string;
    TransDate: TDateTime;
    Phantom: Boolean;
    Shipment_releases_fgmulti_id: Real;
    TransMode: TVMI_TransMode;
    UOM_FACTOR: Real;
    constructor Create(AVMI_FGMulti_ID: Real);
  end;

implementation

{ TVMI_Consume_Params }

constructor TVMI_Consume_Params.Create(AVMI_FGMulti_ID: Real);
begin
  NativeQty := 0;
  VMI_FGMulti_ID := AVMI_FGMulti_ID;
  Shipment_DTL_ID := 0;
  Reason := '';
  TransDate := 0;
  Phantom := False;
  Shipment_releases_fgmulti_id := 0;
  TransMode := vtmConsume;
  UOM_FACTOR := 1;
end;

end.
