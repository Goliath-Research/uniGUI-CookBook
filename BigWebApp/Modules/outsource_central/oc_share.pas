unit oc_share;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes;

function get_estimated_outsource_parent_arrive_date( AFGMulti_ID: Real; var ADate: TDateTime; var AParentQty: Real ): Boolean;
procedure get_estimated_outsource_parent_qty( AIn_Transit_Partno_ID, AArinvt_ID {opmat}, AOnHand {opmat}: Real; var AParentQty: Real );
procedure get_estimated_outsource_child_qty( AIn_Transit_Partno_ID, AArinvt_ID {opmat}, AParentQty: Real; var AChildQty: Real );
function IsOutsourceInventoryBased: Boolean;
function IsOutsourcePOBased: Boolean;

implementation

uses
  IQMS.Common.DataLib;

procedure get_estimated_outsource_partno_po_based( var AIn_Transit_Partno_ID: Real; AShipment_Dtl_ID_In_Transit: Real ); forward;

function get_estimated_outsource_parent_arrive_date( AFGMulti_ID: Real; var ADate: TDateTime; var AParentQty: Real ): Boolean;
var
  A                          : Variant;
  AIn_Transit_Partno_ID      : Real;
  AIn_Transit_Origin         : Real;
  AArinvt_ID                 : Real;
  AOnhand                    : Real;
  AShipment_dtl_id_in_transit: Real;
  APtsPer                    : Real;
  AProdHrs                   : Real;
begin
  Result:= FALSE;
  A:= SelectValueArrayFmt('select in_transit_partno_id, in_transit_origin, arinvt_id, onhand, shipment_dtl_id_in_transit from fgmulti where id = %f', [ AFGMulti_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  AIn_Transit_Partno_ID      := A[ 0 ];
  AIn_Transit_Origin         := A[ 1 ];
  AArinvt_ID                 := A[ 2 ];
  AOnhand                    := A[ 3 ];
  AShipment_dtl_id_in_transit:= A[ 4 ];

  if oc_share.IsOutsourcePOBased then
    get_estimated_outsource_partno_po_based( AIn_Transit_Partno_ID, AShipment_dtl_id_in_transit );

  if (AIn_Transit_Partno_ID  > 0) and (AIn_Transit_Origin = 2) then
  begin
    get_estimated_outsource_parent_qty( AIn_Transit_Partno_ID, AArinvt_ID, AOnHand, AParentQty );

    // {get ptsper of the ARINVT_ID when consumed by IN_TRANSIT_PARTNO_ID}
    // APtsPer:= SelectValueFmtAsFloat('select ptsper from ptoper p, opmat o where p.partno_id = %f and p.sndop_id = o.sndop_id and o.arinvt_id = %f',
    //                     [ AIn_Transit_Partno_ID, AArinvt_ID ]);
    // if APtsPer = 0 then APtsPer:= 1;
    //

    {get standard info}
    A:= SelectValueArrayFmt('select s.cycletm, s.cycle, s.scrap, s.flat_cycletm from standard s, partno p where p.id = %f and s.id = p.standard_id',
                       [ AIn_Transit_Partno_ID ]);
    if VarArrayDimCount( A ) = 0 then
       EXIT;

    //
    // {calc parent qty. Round up}
    // AParentQty:= Trunc( AOnHand / (1 + A[ 2 ]/100 {scrap}) / APtsPer  + 0.9);

    {calc hrs required}
    if A[ 3 ] = 'Y' then
       AProdHrs:= A[ 0 ] / 3600 / (1 - A[ 2 ]/100)
    else if A[1] <> 0 then
       AProdHrs:= AParentQty / A[ 1 ]
    else
       AProdHrs:= 0;

    {get ship date and assign estimated end date}
    ADate:= AProdHrs / 24 +
            SelectValueFmtAsFloat('select s.shipdate + nvl(t.ship_time,1) '+
                      '  from c_ship_hist c,                  '+
                      '       shipments s,                    '+
                      '       ship_to t                       '+
                      ' where c.shipment_dtl_id = %f          '+
                      '   and c.shipments_id = s.id           '+
                      '   and s.ship_to_id = t.id             ',
                      [ AShipment_dtl_id_in_transit ]);

    Result:= TRUE;
  end;
end;


procedure get_estimated_outsource_parent_qty( AIn_Transit_Partno_ID, AArinvt_ID {opmat}, AOnHand {opmat}: Real; var AParentQty: Real );
var
  A      : Variant;
  APtsPer: Real;
  AScrap : Real;
begin
  {get ptsper of the ARINVT_ID when consumed by IN_TRANSIT_PARTNO_ID}
  APtsPer:= SelectValueFmtAsFloat('select ptsper from ptoper p, opmat o where p.partno_id = %f and p.sndop_id = o.sndop_id and o.arinvt_id = %f',
                      [ AIn_Transit_Partno_ID, AArinvt_ID ]);
  if APtsPer = 0 then APtsPer:= 1;

  {get scrap}
  AScrap:= SelectValueFmtAsFloat('select s.scrap from standard s, partno p where p.id = %f and s.id = p.standard_id',
                     [ AIn_Transit_Partno_ID ]);

  {calc parent qty. Round up}
  AParentQty:= Trunc( AOnHand / (1 + AScrap/100 ) / APtsPer  + 0.9);
end;


procedure get_estimated_outsource_child_qty( AIn_Transit_Partno_ID, AArinvt_ID {opmat}, AParentQty: Real; var AChildQty: Real );
var
  A      : Variant;
  APtsPer: Real;
  AScrap : Real;
begin
  {get ptsper of the ARINVT_ID when consumed by IN_TRANSIT_PARTNO_ID}
  APtsPer:= SelectValueFmtAsFloat('select ptsper from ptoper p, opmat o where p.partno_id = %f and p.sndop_id = o.sndop_id and o.arinvt_id = %f',
                      [ AIn_Transit_Partno_ID, AArinvt_ID ]);
  if APtsPer = 0 then APtsPer:= 1;

  {get scrap}
  AScrap:= SelectValueFmtAsFloat('select s.scrap from standard s, partno p where p.id = %f and s.id = p.standard_id',
                     [ AIn_Transit_Partno_ID ]);

  {calc parent qty. Round up}
  AChildQty:= Trunc( AParentQty * (1 + AScrap/100 ) * APtsPer  + 0.9);
end;

function IsOutsourceInventoryBased: Boolean;
begin
  Result:= SelectValueAsFloat('select irv32_misc.is_inventory_based_ex from dual') = 1;
end;

function IsOutsourcePOBased: Boolean;
begin
  Result:= SelectValueAsFloat('select irv32_misc.is_po_based from dual') = 1;
end;


procedure get_estimated_outsource_partno_po_based( var AIn_Transit_Partno_ID: Real; AShipment_Dtl_ID_In_Transit: Real );
var
  AOrd_Detail_ID: Real;
  APossiblePartno_ID: Real;
begin
  AOrd_Detail_ID:= SelectValueFmtAsFloat('select ord_detail_id from c_ship_hist where shipment_dtl_id = %f', [ AShipment_Dtl_ID_In_Transit ]);
  APossiblePartno_ID:= SelectValueFmtAsFloat('select min(partno_id) from po_detail_outsource where ord_detail_id = %f', [ AOrd_Detail_ID ]);
  if APossiblePartno_ID > 0 then
    AIn_Transit_Partno_ID:=  APossiblePartno_ID;
end;

end.

