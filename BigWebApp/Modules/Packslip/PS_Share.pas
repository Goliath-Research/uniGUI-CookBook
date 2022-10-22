unit PS_Share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  System.Generics.Collections;

type
  TCancelOverShip = class(Exception);

procedure PS_PrintAfterPostReport(AShipments_ID: Real);
function GetPkTktPOFilter(ATicket_ID: Real; var APOFilter: string): Boolean;
function GetPkTktSOFilter(ATicket_ID: Real; var ASOFilter: string): Boolean;
procedure CheckProcessCoC(AOwner: TComponent; AShipments_ID: Real);
function IsOutsourceShipOrder(AShipment_Dtl_ID: Real): Boolean;
//procedure CheckQtyMatchWhenASNOnPrintLabelAssigned(ATicket_ID: Real);
function UseShipDateInPackslipTransaction: Boolean;

procedure CheckEnforceLotFIFOShipping(AList: TStringList); //List of FGMulti IDs
procedure CheckEnforceLotFIFOAddingToPickTicket(AFGMulti_ID,
  APS_Ticket_Dtl_ID: Real);

procedure CheckPrintCommercialInvoice(AOwner: TComponent; AShipments_ID: Real);
/// <summary> Populates a distinct generic list of each Ship Via (FREIGHT.ID) assigned in the header or release section of a Sales Order.
/// </summary>
procedure GetDistinctShipViasList( const AList : TList<Real>; AOrdersID : Real );

type
  TPackSlipCargo = class
    ID: Real;
    dDate: TDateTime;
    List: TList;
    ShipDtl_ID: Real; //Gets updated during PS creation. Used in RF scanners for adding BOL
    PkTktComment: string; //populated with pkticket detail line comment - goes into shipment_dtl
    PkTktReleases_ID: Real; //populated with pkticket detail line releases_id - goes into shipment_dtl
    PS_Ticket_Dtl_ID: Real; //populated with ps_ticket_dtl_id - goes into shipment_dtl
    Phantom_PS_Ticket_Dtl_ID: Real; //parent phantom ps_ticket_dtl_id. 03-01-2012 - not used!
    PS_Ticket_Dtl_Arinvt_ID: Real; //ps_tcket_dtl arinvt_id
    Phantom_Ord_Detail_ID: Real; //parent phantom order detail id
    VerifyInventory: string; //null or D-default, Y and N

    // special packslip when no inventory transaction is involved
    SpecialSkipInvTrans: Boolean;
    SpecialLoc_Desc: string;
    SpecialFG_LotNo: string;

    constructor Create(AID: Real; ADate: TDateTime; AList: TList);
    destructor Destroy; override;
  end;

  TLocation = class
    ID: Real;
    Qty: Real;
    Counted: Boolean;
    // used to determine if fgmulti qty has been picked up already
    constructor Create(AID: Real; AQTY: Real);
    destructor Destroy; override;
  end;

  TFixOrdExceeded = (foeNone, foeIncRelease, foeSplitShipment, foeCancel);

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  packslip_rscstr,
  { TODO -oathite -cWebConvert : Dependent on prn_commer_invoice
  prn_commer_invoice, }
   { TODO -oathite -cWebConvert : Dependent on Prn_PS
  Prn_PS, }
  { TODO -oathite -cWebConvert : Dependent on PS_CoC
  PS_CoC, }
  System.Variants,
  trans_enforce_lot_fifo;

constructor TPackSlipCargo.Create(AID: Real; ADate: TDateTime; AList: TList);
begin
  ID := AID;
  dDate := ADate;
  // TODO Ensure this is created by this object.  It is freed by this object
  // below in the destructor, so it should be created here.
  List := AList;
  PkTktComment := '';

  SpecialSkipInvTrans := False;
  SpecialLoc_Desc := '';
  SpecialFG_LotNo := '';
end;

destructor TPackSlipCargo.Destroy;
var
  i: Integer;
begin
  if Assigned(List) then
  begin
    while List.Count > 0 do
    begin
      TLocation(List[0]).Free;
      List.Delete(0);
    end;
    List.Free;
  end;
  inherited;
end;

//  TLocation

constructor TLocation.Create(AID: Real; AQTY: Real);
begin
  ID := AID;
  Qty := AQTY;
end;

destructor TLocation.Destroy;
begin
  inherited;
end;

// AUX Procedures
procedure PS_PrintAfterPostReport(AShipments_ID: Real);
var
  SelectionList: TStringList;
  APackSlipNo: string;
  AArcusto_ID: Real;
  AShip_To_ID: Real;
  ABill_To_ID: Real;
  AReportName: string;
  AList: TStringList;
begin
  //try
  //SelectionList := TStringList.Create;
  //SelectionList.Add( IQFormat('//SHIPMENTS.ID = %f', [ AShipments_ID ]));
  //PrintDefaultReport( Application, 'packslip_report', SelectionList );  //in IqPrint.pas
  //finally
  //SelectionList.Free;
  //end;

  //Switch to Prn_PS so docs will get printed. Jul-24-01 AA
  APackSlipNo := SelectValueByID('packslipno', 'shipments', AShipments_ID);
  { TODO -oathite -cWebConvert : Dependent on Prn_PS
  DoPrintPS_Silent(APackSlipNo, APackSlipNo); //Prn_PS.pas }
end;

function GetPkTktPOFilter(ATicket_ID: Real; var APOFilter: string): Boolean;
var
  AData: Variant;
begin
  Result := False;

  //Attempt to get first avail PO
  AData := SelectValueArrayFmt(
    'select oh.pono                   ' +
    '   from ps_ticket_dtl td,        ' +
    '        ord_detail od,           ' +
    '        orders oh                ' +
    '  where td.ps_ticket_id = %f     ' +
    '    and td.ord_detail_id = od.id ' +
    '    and od.orders_id = oh.id     ' +
    '  order by oh.pono               ',
    [ATicket_ID]);

  //No pkticket details
  if VarArrayDimCount(AData) = 0 then
    Exit;

  //pick first avail PO#
  APOFilter := AData[0];

  Result := True;
end;

function GetPkTktSOFilter(ATicket_ID: Real; var ASOFilter: string): Boolean;
var
  AData: Variant;
begin
  Result := False;

  // Attempt to get first avail SO
  AData := SelectValueArrayFmt(
    'select oh.orderno                ' +
    '   from ps_ticket_dtl td,        ' +
    '        ord_detail od,           ' +
    '        orders oh                ' +
    '  where td.ps_ticket_id = %f     ' +
    '    and td.ord_detail_id = od.id ' +
    '    and od.orders_id = oh.id     ' +
    '  order by oh.orderno            ', [ATicket_ID]);

  // No pkticket details
  if VarArrayDimCount(AData) = 0 then
    Exit;

  // pick first avail PO#
  ASOFilter := AData[0];

  Result := True;
end;

procedure CheckProcessCoC(AOwner: TComponent; AShipments_ID: Real);
var
  ACocRequired: string;
begin
  //arcusto is marked as requires coc
  ACocRequired := SelectValueFmtAsString(
    'select a.coc_required from shipments s, arcusto a where s.id = %f and s.arcusto_id = a.id',
    [AShipments_ID]);

  if ACocRequired <> 'Y' then
  begin
    ACocRequired := SelectValueFmtAsString(
      'select a.coc_required from shipments s, ship_to a where s.id = %f and s.ship_to_id = a.id',
      [AShipments_ID]);
    if ACocRequired <> 'Y' then
      Exit;
  end;

  //at least one arinvt is not marked exclude from coc
  if SelectValueFmtAsInteger(
    'select 1 from c_ship_hist s, arinvt a where s.shipments_id = %f and ' +
    's.arinvt_id = a.id and NVL(a.coc_exclude, ''N'') = ''N'' and rownum < 2',
    [AShipments_ID]) = 0 then
    Exit;

  // packslip_rscstr.cTXT0000191 =
  // 'Certificate of Conformance is required. The system will ' +
  // 'attempt to calculate and print CoC now.'
  if not IsConsole then
    IQInformation(packslip_rscstr.cTXT0000191);

  { TODO -oathite -cWebConvert : Dependent on PS_CoC
  TFrmCoC.DoAutoPrintEntireShipmentCoC(AOwner, AShipments_ID); //PS_CoC.pas }

end;

procedure CheckPrintCommercialInvoice(AOwner: TComponent; AShipments_ID: Real);
var
  ACommerInvoiceRequired: string;
  ACommerInvoiceReport: string;
  AShip_To_ID: Real;
  APackSlipNo: string;
begin
  AShip_To_ID := SelectValueByID('ship_to_id', 'shipments', AShipments_ID);
  if AShip_To_ID = 0 then
    Exit;

  //ship_to is marked commer_invoice_required
  ACommerInvoiceRequired := SelectValueByID('commer_invoice_required',
    'ship_to', AShip_To_ID);

  //arcusto is marked as commer_invoice_required
  if ACommerInvoiceRequired <> 'Y' then
    ACommerInvoiceRequired := SelectValueFmtAsString(
      'select a.commer_invoice_required from shipments s, arcusto a ' +
      'where s.id = %f and s.arcusto_id = a.id',
      [AShipments_ID]);

  if ACommerInvoiceRequired <> 'Y' then
    Exit;

  ACommerInvoiceReport := SelectValueFmtAsString
    ('select COMMER_INVOICE_REPORT from ship_to where id = %f', [AShip_To_ID]);

  if ACommerInvoiceReport = '' then
    ACommerInvoiceReport := SelectValueFmtAsString(
      'select a.COMMER_INVOICE_REPORT from arcusto a, ship_to s ' +
      'where s.id = %f and s.arcusto_id = a.id',
      [AShip_To_ID]);

  if ACommerInvoiceReport = '' then
    ACommerInvoiceReport := SelectValueAsString
      ('select COMMER_INVOICE_REPORT from iqsys2');

  if ACommerInvoiceReport = '' then
    Exit;

  APackSlipNo := SelectValueByID('packslipno', 'shipments', AShipments_ID);
  { TODO -oathite -cWebConvert : Dependent on prn_commer_invoice
  prn_commer_invoice.DoPrintCommercialInvoice(
    APackSlipNo,
    APackSlipNo,
    True); //True = silent }
end;

procedure GetDistinctShipViasList( const AList : TList<Real>; AOrdersID : Real );
var
  aQry : TFDQuery;
  aDbg : String;
begin
  aQry := TFDQuery.Create(nil);
  with aQry do
  try
    Connection:= UniMainModule.FDConnection1;
    SQL.Text:= IQFormat( 'select distinct x.freight_id '+
                         '  from '+

                         '( select distinct freight_id   '+
                         '    from v_backlog_releases_qk '+
                         '   where order_id = %f '+
                         '     and freight_id is not null '+

                         '  UNION '+

                         '  select freight_id from orders where id = %f '+
                         '     and freight_id is not null '+
                         ') x ', [ AOrdersID, AOrdersID ]);
    Open;
    while not Eof do
    begin
      AList.Add(Fields[0].asFloat);
      aDbg := aDbg + Fields[0].asString + ' ';
      Next;
    end;

  finally
    aQry.Free;
  end;
end;

function IsOutsourceShipOrder(AShipment_Dtl_ID: Real): Boolean;
var
  AData: Variant;
  AInTransitWorkorder_ID: Real;
  AInTransitPartno_ID: Real;
  AConsumedArinvt_ID: Real;
begin
  Result := False;

  AData := SelectValueArrayFmt(
    'select d.in_transit_workorder_id, d.in_transit_partno_id, d.arinvt_id ' +
    '  from c_ship_hist s,                                                 ' +
    '       ord_detail d                                                   ' +
    ' where s.shipment_dtl_id = %f                                         ' +
    '   and s.ord_detail_id = d.id                                         ' +
    '   and d.in_transit_workorder_id is not null                          ' +
    '   and d.in_transit_partno_id is not null ',
    [AShipment_Dtl_ID]);
  if VarArrayDimCount(AData) = 0 then
    Exit;

  AInTransitWorkorder_ID := System.Variants.VarAsType(AData[0], varUInt64);
  AInTransitPartno_ID := System.Variants.VarAsType(AData[1], varUInt64);
  AConsumedArinvt_ID := System.Variants.VarAsType(AData[2], varUInt64);

  Result := SelectValueFmtAsInteger(
    'select 1                                     ' +
    '  from                                       ' +
    '       workorder wo, standard s, vendor v,   ' +
    '       ptorder, ptoper, sndop, opmat         ' +
    ' where                                       ' +
    //consider only OUTSOURCE boms
    '        wo.id = %.0f                         ' +
    '    and wo.standard_id = s.id                ' +
    '    and mfg.lookup_mfgtype( s.mfg_type ) = ''OUTSOURCE'' ' +
    //whose cntr_type is vendorno
    '    and s.cntr_type = v.vendorno             ' +
    //link ptorder to get to partno
    '    and wo.id = ptorder.workorder_id         ' +
    //cut directly to ptoper and opmat
    '    and ptorder.partno_id = ptoper.partno_id ' +
    '    and ptorder.partno_id = %.0f             ' +
    '    and ptoper.sndop_id = sndop.id           ' +
    '    and sndop.id = opmat.sndop_id            ' +
    '    and opmat.arinvt_id = %.0f               ',
    [AInTransitWorkorder_ID,
    AInTransitPartno_ID,
    AConsumedArinvt_ID]) = 1
end;

//procedure CheckQtyMatchWhenASNOnPrintLabelAssigned(ATicket_ID: Real);
//begin
//end;

function UseShipDateInPackslipTransaction: Boolean;
begin
  Result := SelectValueAsString(
    'select ps_use_ship_date_on_convert from iqsys2') = 'Y';
end;

procedure CheckEnforceLotFIFOShipping(AList: TStringList); //List of FGMulti IDs
var
  AEnforce: TEnforceLotFifo;
begin
  // Declared in trans_enforce_lot_fifo.
  if not TEnforceLotFifo.EnforcementRequired(AList) then
    Exit;

  AEnforce := TEnforceLotFifo.Create(AList); //trans_enforce_lot_fifo.pas
  try
    //AEnforce.ExcludeNoShip:= True;
    AEnforce.AssignDefaultExclusions;

    if not AEnforce.FindViolation() then
      Exit;

    // Declared in trans_enforce_lot_fifo.
    if not TFrmTransEnforceLotFIFO.DoShowModal(AEnforce) then
      Abort;
  finally
    AEnforce.Free;
  end;
end;

procedure CheckEnforceLotFIFOAddingToPickTicket(AFGMulti_ID,
  APS_Ticket_Dtl_ID: Real);
var
  AList: TFGMultiList; //trans_enforce_lot_fifo.pas
begin
  if TEnforceLotFifo.EnforcementRequired(AFGMulti_ID) then
  //trans_enforce_lot_fifo.pas
  begin
    AList := TFGMultiList.Create;
    try
      //load what we have selected so far
      AList.LoadPickTiketReleases(APS_Ticket_Dtl_ID);

      //add picked fgmulti
      if AList.IndexOf(FloatToStr(AFGMulti_ID)) = - 1 then
        AList.AddToList(AFGMulti_ID);

      PS_Share.CheckEnforceLotFIFOShipping(AList); //this unit
    finally
      AList.Free;
    end;
  end;
end;

end.
