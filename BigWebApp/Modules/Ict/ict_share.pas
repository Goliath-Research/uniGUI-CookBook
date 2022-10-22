unit ict_share;

interface

uses
  Winapi.Windows,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

type
  TICT_Cargo = class
    Arinvt_ID   : Real;
    Qty         : Real;
    Promise_Date: TDateTime;
    constructor Create( AArinvt_ID, AQty: Real; APromise_Date: TDateTime);
  end;

  TICT_Receive_Cargo = class
    Arinvt_ID     : Real;
    Qty           : Real;
    FGMulti_ID_Src: Real;
    FGMulti_ID_Trg: Real;
    FreightPerItem: Real;
    constructor Create( AArinvt_ID, AQty, AFGMulti_ID_Src, AFGMulti_ID_Trg: Real; AFreightPerItem: Real = 0 );
  end;


procedure EnsureTargetShipToEPlantIsSameAsSource( AArcusto_ID_Trg, AShip_To_ID_Src: Real; var AShip_To_ID_Trg: Real );


implementation

uses
  DB;

{ TICT_Cargo }

constructor TICT_Cargo.Create( AArinvt_ID, AQty: Real; APromise_Date: TDateTime);
begin
  Arinvt_ID   := AArinvt_ID;
  Qty         := AQty;
  Promise_Date:= APromise_Date;
end;

{ TICT_Receive_Cargo }

constructor TICT_Receive_Cargo.Create( AArinvt_ID, AQty, AFGMulti_ID_Src, AFGMulti_ID_Trg: Real; AFreightPerItem: Real = 0 );
begin
  Arinvt_ID     := AArinvt_ID;
  Qty           := AQty;
  FGMulti_ID_Src:= AFGMulti_ID_Src;
  FGMulti_ID_Trg:= AFGMulti_ID_Trg;
  FreightPerItem:= AFreightPerItem;
end;


procedure EnsureTargetShipToEPlantIsSameAsSource( AArcusto_ID_Trg, AShip_To_ID_Src: Real; var AShip_To_ID_Trg: Real );
begin
  with TFDStoredProc.Create(nil) do
  try
    Connection:= UniMainModule.FDConnection1;
    PackageName:= 'ICT_PULL';
    StoredProcName:= 'MAKE_TRG_SHIP_TO_EPLANT_AS_SRC';
    Prepare;
    ParamByName('v_arcusto_id_trg').Value:= AArcusto_ID_Trg;
    ParamByName('v_ship_to_id_trg').Value:= AShip_To_ID_Trg;
    ParamByName('v_ship_to_id_src').Value:= AShip_To_ID_Src;
    ExecProc;
    AShip_To_ID_Trg:= ParamByName('v_ship_to_id_trg').asFloat;
  finally
    Free;
  end;
end;

end.
