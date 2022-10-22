unit crm_rma;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule;

// ** Add CRM Activity Items to an RMA **
// The following methods add CRM Activity items (CRM_ITEMS) to an RMA.
// You can either create a new RMA or add items to an existing RMA.
// And you can either add all items, by default, or only items that have
// not yet been linked to an RMA.  If the param, AAllItems, is True, then
// all items will be added.  But if the param, AAllItems, is False, then
// only unlinked items will be added.

{$REGION 'RMA method declaration'}
// returns first RMA_DETAIL.ID
function AddCRMActivityToNewRMA(ACRMActivityID: Real;
  AAllItems: Boolean = True): Real;
// returns first RMA_DETAIL.ID
function AddCRMActivityToExistingRMA(ACRMActivityID, ARMA_ID: Real;
  AAllItems: Boolean = True): Real;
function AddCRMItemToExistingRMA(ACRMActivityID, ARMA_ID,
  ACRMItemsID: Real): Real;
function AddCRMItemToNewRMA(ACRMActivityID, ACRMItemsID: Real): Real;
// Helper methods
function CreateRMAHeader(AArcustoID: Real): Real;
function AddRMADetail(ARMA_ID, AArinvtID, AShipmentDtlID, AReturnCodeID: Real;
  AQty: Real; AReason: String): Real;
{$ENDREGION 'RMA method declaration'}

{$REGION 'Vendor RMA method declaration'}
// returns first VENDOR_RMA_DETAIL.ID
function AddCRMActivityToNewVendorRMA(ACRMActivityID: Real;
  AAllItems: Boolean = True): Real;
// returns first VENDOR_RMA_DETAIL.ID
function AddCRMActivityToExistingVendorRMA(ACRMActivityID, AVendorRMA_ID: Real;
  AAllItems: Boolean = True): Real;
function AddCRMItemToExistingVendorRMA(ACRMActivityID, AVendorRMA_ID,
  ACRMItemsID: Real): Real;
function AddCRMItemToNewVendorRMA(ACRMActivityID, ACRMItemsID: Real): Real;
// Helper methods
function CreateVendorRMAHeader(AArcustoID: Real): Real;
function AddVendorRMADetail(AVendorRMA_ID, AArinvtID, APoReceiptsID,
  AReturnCodeID: Real; AQty: Real; AReason: String): Real;
{$ENDREGION 'Vendor RMA method declaration'}

implementation

uses
  crm_lib,
  crm_rscstr,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils;

{$REGION 'Internal methods'}


function GetActivityArcustoID(const ACRMActivityID: Real): Real;
begin
  Result := SelectValueFmtAsFloat(
    'SELECT principle_source_id ' +
    'FROM crm_activity WHERE id = %.0f AND ' +
    'principle_source = ''ARCUSTO'' ', [ACRMActivityID]);
end;

function GetActivityVendorID(const ACRMActivityID: Real): Real;
begin
  Result := SelectValueFmtAsFloat(
    'SELECT principle_source_id ' +
    'FROM crm_activity WHERE id = %.0f AND ' +
    'principle_source = ''VENDOR'' ', [ACRMActivityID]);
end;

function RecordExists(const ATableName: String; const AID: Real): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1 FROM %s WHERE id = %.0f',
    [ATableName, AID]) > 0;
end;

{$ENDREGION 'Internal methods'}

{$REGION 'RMA'}


function AddCRMActivityToNewRMA(ACRMActivityID: Real; AAllItems: Boolean): Real;
var
  // Activity variables
  AArcustoID, ARMA_ID: Real;
begin
  Result := 0;
  AArcustoID := GetActivityArcustoID(ACRMActivityID); // see above
  if (AArcustoID > 0) then
    begin
      ARMA_ID := CreateRMAHeader(AArcustoID);
      // returns the RMA.ID
      Result := AddCRMActivityToExistingRMA(ACRMActivityID, ARMA_ID, AAllItems);
    end;
end;

function AddCRMActivityToExistingRMA(ACRMActivityID, ARMA_ID: Real;
  AAllItems: Boolean): Real;
var
  // RMA variables
  ARMA_Detail_ID: Real;
  AArinvtID: Real;
  AReturnCodeID: Real;
  AQty: Real;
  aConnection : TFDConnection;
begin
  if ARMA_ID = 0 then
    raise Exception.Create('Application Error:  RMA ID not provided.');
  Result := 0;
  try
    aConnection := FDManager.FindConnection('IQFD') as TFDConnection;
    aConnection.StartTransaction; // start transaction
    with TFDQuery.Create(NIL) do
      try
        ConnectionName := 'IQFD';
//        SQL.Add(Format(
//          'SELECT * FROM crm_items WHERE crm_activity_id = %.0f',
//          [ACRMActivityID]));
        SQL.Add('SELECT a.id,                               ');
        SQL.Add('       a.crm_activity_id,                  ');
        SQL.Add('       a.shipment_dtl_id,                  ');
        SQL.Add('       a.rma_detail_id,                    ');
        SQL.Add('       b.rma_id,                           ');
        SQL.Add('       a.return_code_id,                   ');
        SQL.Add('       a.arinvt_id,                        ');
        SQL.Add('       a.qtyreturned,                      ');
        SQL.Add('       a.misc_reason,                      ');
        SQL.Add('       a.car_id,                           ');
        SQL.Add('       a.wf_header_id,                     ');
        SQL.Add('       a.po_receipts_id,                   ');
        SQL.Add('       a.rma_table_name                    ');
        SQL.Add('  FROM crm_items a, rma_detail b           ');
        SQL.Add(Format(' WHERE a.crm_activity_id = %.0f AND ',[ACRMActivityID]));
        SQL.Add('       b.id(+) = a.rma_detail_id           ');
        // filter items so we only return unlinked items
        if not AAllItems then
          SQL.Add(' AND a.rma_detail_id IS NULL');
        Open;
        First;
        while not EOF do
          begin
            AArinvtID := FieldByName('ARINVT_ID').AsLargeInt;
            AReturnCodeID := FieldByName('RETURN_CODE_ID').AsLargeInt;
            AQty := FieldByName('QTYRETURNED').AsFloat;
            if RecordExists('ARINVT', AArinvtID) or
              RecordExists('RETURN_CODE', AReturnCodeID) or (AQty > 0) then
              begin
                ARMA_Detail_ID := AddRMADetail(ARMA_ID, AArinvtID,
                  FieldByName('SHIPMENT_DTL_ID').AsLargeInt, AReturnCodeID, AQty,
                  FieldByName('misc_reason').AsString);
                // Provide the result with the first detail added
                if Result = 0 then
                  Result := ARMA_Detail_ID;
                // 02/16/2007 Additional
                if FieldByName('CAR_ID').AsFloat > 0 then
                  ExecuteCommandFmt(
                    'UPDATE rma_detail SET car_id = %d WHERE id = %.0f',
                    [FieldByName('CAR_ID').AsLargeInt, ARMA_Detail_ID]);
                // update the crm_items.rma_detail_id for future reference
                if (ARMA_Detail_ID > 0) and (FieldByName('ID').AsLargeInt > 0) then
                  ExecuteCommandFmt(
                    'UPDATE crm_items SET rma_detail_id = %.0f, ' +
                    'rma_table_name = ''RMA'' WHERE id = %d',
                    [ARMA_Detail_ID, FieldByName('ID').AsLargeInt]);
              end;
            Next;
          end;
      finally
        Free;
      end;
    AddCRMActivitySourceDoc(ACRMActivityID, 'RMA', ARMA_ID);
    aConnection.Commit; // commit changes
  finally
    if aConnection.InTransaction then
     begin
        Result := 0;
        aConnection.RollBack; // rollback if there was a problem
      end;
  end;
end;

function AddCRMItemToNewRMA(ACRMActivityID, ACRMItemsID: Real): Real;
var
  // Activity variables
  AArcustoID, ARMA_ID: Real;
begin
  Result := 0;
  AArcustoID := GetActivityArcustoID(ACRMActivityID); // see above
  if (AArcustoID > 0) then
    begin
      ARMA_ID := CreateRMAHeader(AArcustoID);
      Result := AddCRMItemToExistingRMA(ACRMActivityID, ARMA_ID, ACRMItemsID);
    end;
end;

function AddCRMItemToExistingRMA(ACRMActivityID, ARMA_ID,
  ACRMItemsID: Real): Real;
var
  // RMA variables
  ARMA_Detail_ID: Real;
  AArinvtID, AShipmentDetailID: Real;
  AReturnCodeID: Real;
  AQty: Real;
  aConnection : TFDConnection;

  procedure _findRMADetail;
  var
    ALocalArinvtID: Real;

  begin
    with TFDQuery.Create(NIL) do
      try
        ConnectionName := 'IQFD';
        SQL.Add('SELECT a.id, a.arinvt_id, a.shipment_dtl_id');
        SQL.Add('  FROM rma_detail a');
        SQL.Add(Format(' WHERE a.rma_id = %.0f', [ARMA_ID]));
        Open;
        while not EOF do
          begin
            if (Fields[1].AsFloat = AArinvtID) then
              begin
                ARMA_Detail_ID := Fields[0].AsFloat;
                Break;
              end
            else
              begin
                ALocalArinvtID :=
                  SelectValueFmtAsFloat('SELECT b.arinvt_id'#13 +
                  '  FROM shipment_dtl a, ord_detail b'#13 +
                  ' WHERE a.id = %.0f AND'#13 +
                  '       b.id = a.order_dtl_id'#13 +
                  'UNION'#13 +
                  'SELECT b.arinvt_id'#13 +
                  '  FROM shipment_dtl a, hist_ord_detail b'#13 +
                  ' WHERE a.id = %.0f AND'#13 +
                  '       b.id = a.order_dtl_id',
                  [Fields[2].AsFloat, Fields[2].AsFloat]);
                if (ALocalArinvtID > 0) and (ALocalArinvtID = AArinvtID) then
                  begin
                    ARMA_Detail_ID := Fields[0].AsFloat;
                    Break;
                  end;
              end;
            Next;
          end;
      finally
        Free;
      end;
  end;

begin
  if ARMA_ID = 0 then
    raise Exception.Create('Application Error:  RMA ID not provided.');
  if (ACRMItemsID = 0) then
    Exit;
  Result := 0;
  try
    aConnection := FDManager.FindConnection('IQFD') as TFDConnection;
    aConnection.StartTransaction; // start transaction

    with TFDQuery.Create(NIL) do
      try
        ConnectionName := 'IQFD';
//        SQL.Add(Format('SELECT * FROM crm_items WHERE id = %.0f AND ROWNUM < 2',
//          [ACRMItemsID]));
        SQL.Add('SELECT a.id,                       ');
        SQL.Add('       a.crm_activity_id,          ');
        SQL.Add('       a.shipment_dtl_id,          ');
        SQL.Add('       a.rma_detail_id,            ');
        SQL.Add('       b.rma_id,                   ');
        SQL.Add('       a.return_code_id,           ');
        SQL.Add('       a.arinvt_id,                ');
        SQL.Add('       a.itemno,                   ');
        SQL.Add('       a.descrip,                  ');
        SQL.Add('       a.descrip2,                 ');
        SQL.Add('       a.class,                    ');
        SQL.Add('       a.rev,                      ');
        SQL.Add('       a.qtyreturned,              ');
        SQL.Add('       a.misc_reason,              ');
        SQL.Add('       a.car_id,                   ');
        SQL.Add('       a.wf_header_id,             ');
        SQL.Add('       a.po_receipts_id,           ');
        SQL.Add('       a.rma_table_name            ');
        SQL.Add('  FROM crm_items a, rma_detail b   ');
        SQL.Add(Format(' WHERE a.id = %.0f AND      ',[ACRMItemsID]));
        SQL.Add('       b.id(+) = a.rma_detail_id   ');
        Open;
        AArinvtID := FieldByName('ARINVT_ID').AsLargeInt;
        AShipmentDetailID := FieldByName('SHIPMENT_DTL_ID').AsLargeInt;
        AReturnCodeID := FieldByName('RETURN_CODE_ID').AsLargeInt;
        AQty := FieldByName('QTYRETURNED').AsFloat;
        ARMA_Detail_ID :=  FieldByName('RMA_DETAIL_ID').AsLargeInt;
        // Do not add the item, if it already exists on the RMA
{        if AShipmentDetailID > 0 then
          ARMA_Detail_ID :=
            SelectValueFmtAsFloat(
            'SELECT id FROM rma_detail WHERE shipment_dtl_id = %.0f AND ' +
            'rma_id = %.0f', [AShipmentDetailID, ARMA_ID])
        else if AArinvtID > 0 then
          ARMA_Detail_ID :=
            SelectValueFmtAsFloat(
            'SELECT id FROM rma_detail WHERE arinvt_id = %.0f AND ' +
            'rma_id = %.0f', [AArinvtID, ARMA_ID])
        else
          ARMA_Detail_ID := 0;
        if (ARMA_Detail_ID = 0) then
          _findRMADetail;
}
        if {(ARMA_Detail_ID = 0) and} (RecordExists('ARINVT', AArinvtID) or
          RecordExists('SHIPMENT_DTL', AShipmentDetailID) or
          RecordExists('RETURN_CODE', AReturnCodeID) or (AQty > 0)) then
          ARMA_Detail_ID := AddRMADetail(ARMA_ID, AArinvtID, AShipmentDetailID,
            AReturnCodeID, AQty, FieldByName('MISC_REASON').AsString);
        // Provide the result with the first detail added
        Result := ARMA_Detail_ID;
        if ARMA_Detail_ID = 0 then
          Exit;
        // 02/16/2007 Additional
        if FieldByName('CAR_ID').AsFloat > 0 then
          ExecuteCommandFmt
            ('UPDATE rma_detail SET car_id = %.0f WHERE id = %.0f',
            [FieldByName('CAR_ID').AsFloat, ARMA_Detail_ID]);
        // update the crm_items.rma_detail_id for future reference
        if (ARMA_Detail_ID > 0) then
          ExecuteCommandFmt('UPDATE crm_items SET rma_detail_id = %.0f, ' +
            'rma_table_name = ''RMA'' WHERE id = %.0f',
            [ARMA_Detail_ID, ACRMItemsID]);
      finally
        Free;
      end;
    AddCRMActivitySourceDoc(ACRMActivityID, 'RMA', ARMA_ID);
    aConnection.Commit; // commit changes
  finally
    if aConnection.InTransaction then
      begin
        Result := 0;
        aConnection.RollBack; // rollback if there was a problem
      end;
  end;
end;

function CreateRMAHeader(AArcustoID: Real): Real;
var
  AEPlant_ID_Str: String; // var param
  AEPlant_ID: Real;
  ARMANO: String;
  ASuffix: String;
begin
  Result := 0;
  ASuffix := SelectValueAsString
    ('SELECT rma_suffix FROM iqsys WHERE ROWNUM < 2');
  ARMANO := GetEPlantNextSequenceNumber(AEPlant_ID_Str, 'RMA', 'S_RMANO');
  if Empty(ARMANO) then
    System.SysUtils.Abort;
  Result := GetNextID('RMA');
  if AEPlant_ID_Str <> 'NULL' then
    AEPlant_ID := StrToFloat(AEPlant_ID_Str)
  else
    AEPlant_ID := 0;
  ExecuteCommandFmt(
    'INSERT INTO rma (id, rmano, arcusto_id, rma_date, userid, closed, rma_suffix, eplant_id) '
    +
    'VALUES (%.0f, ''%s'', %.0f, SYSDATE, ''%s'', ''N'', ''%s'', DECODE(NVL(%.0f, 0), 0, NULL, %.0f)) ',
    [Result, ARMANO, AArcustoID, SecurityManager.UserName, ASuffix, AEPlant_ID,
    AEPlant_ID]);
end;

function AddRMADetail(ARMA_ID, AArinvtID, AShipmentDtlID, AReturnCodeID: Real;
  AQty: Real; AReason: String): Real;
begin
  Result := 0;
  if ARMA_ID = 0 then
    // crm_rscstr.cTXT0000327 =
    // 'Parent RMA not supplied.  Cannot add detail item.'
    raise Exception.Create(crm_rscstr.cTXT0000327);

  if SelectValueFmtAsInteger(
    'SELECT 1 FROM rma WHERE id = %.0f AND ROWNUM < 2',
    [ARMA_ID]) = 0 then
    // crm_rscstr.cTXT0000328 =
    // 'Parent RMA not found.  Cannot add detail item.' }
    raise Exception.Create(crm_rscstr.cTXT0000328);
  Result := GetNextID('RMA_DETAIL');
  ExecuteCommandParam('INSERT INTO rma_detail ' +
    '(id, rma_id, qtyreturned, misc_reason) ' +
    'VALUES (:ID, :RMA_ID, :QTYRETURNED, :MISC_REASON)',
    ['ID;F', 'RMA_ID;F', 'QTYRETURNED;F', 'MISC_REASON'],
    [Result, ARMA_ID, AQty, AReason]);
  // 03/11/2009 Update the return code ID if available
  if AReturnCodeID > 0 then
    ExecuteCommandFmt
      ('UPDATE rma_detail SET return_code_id = %.0f WHERE id = %.0f',
      [AReturnCodeID, Result]);
  // 03/11/2009 Update the link ID values.  We update one or the other,
  // but not both.  Requested by Nancy.
  if AShipmentDtlID > 0 then
    ExecuteCommandFmt
      ('UPDATE rma_detail SET shipment_dtl_id = %.0f WHERE id = %.0f',
      [AShipmentDtlID, Result])
  else if AArinvtID > 0 then
    ExecuteCommandFmt('UPDATE rma_detail SET arinvt_id = %.0f WHERE id = %.0f',
      [AArinvtID, Result]);
end;

{$ENDREGION 'RMA'}

{$REGION 'Vendor RMA'}


function AddCRMActivityToNewVendorRMA(ACRMActivityID: Real; AAllItems: Boolean)
  : Real; // returns the RMA.ID
var
  // Activity variables
  AVendorID, AVendorRMA_ID: Real;
begin
  Result := 0;
  AVendorID := GetActivityVendorID(ACRMActivityID); // see above
  if (AVendorID > 0) then
    begin
      AVendorRMA_ID := CreateVendorRMAHeader(AVendorID);
      Result := AddCRMActivityToExistingVendorRMA(ACRMActivityID, AVendorRMA_ID,
        AAllItems);
    end;
end;

function AddCRMActivityToExistingVendorRMA(ACRMActivityID, AVendorRMA_ID: Real;
  AAllItems: Boolean): Real;
var
  // RMA variables
  ARMA_Detail_ID: Real;
  AArinvtID: Real;
  AReturnCodeID: Real;
  AQty: Real;
  aConnection : TFDConnection;
begin
  Result := 0;
  if AVendorRMA_ID = 0 then
    raise Exception.Create('Application Error:  Vendor RMA ID not provided.');
  try
    aConnection := FDManager.FindConnection('IQFD') as TFDConnection;
    aConnection.StartTransaction; // start transaction
    with TFDQuery.Create(NIL) do
      try
        ConnectionName := 'IQFD';
        SQL.Add(Format('SELECT * FROM crm_items WHERE crm_activity_id = %.0f ',
          [ACRMActivityID]));
        // filter items so we only return unlinked items
        if not AAllItems then
          SQL.Add(' AND rma_detail_id IS NULL');
        Open;
        First;
        while not EOF do
          begin
            AArinvtID := FieldByName('ARINVT_ID').AsFloat;
            AReturnCodeID := FieldByName('RETURN_CODE_ID').AsFloat;
            AQty := FieldByName('QTYRETURNED').AsFloat;
            if RecordExists('ARINVT', AArinvtID) or
              RecordExists('RETURN_CODE', AReturnCodeID) or (AQty > 0) then
              begin
                ARMA_Detail_ID := AddVendorRMADetail(AVendorRMA_ID, AArinvtID,
                  FieldByName('PO_RECEIPTS_ID').AsFloat, AReturnCodeID, AQty,
                  FieldByName('MISC_REASON').AsString);
                // Provide the result with the first detail added
                if Result = 0 then
                  Result := ARMA_Detail_ID;
                // 02/16/2007 Additional
                if FieldByName('CAR_ID').AsFloat > 0 then
                  ExecuteCommandFmt(
                    'UPDATE vendor_rma_detail SET car_id = %.0f WHERE id = %.0f',
                    [FieldByName('CAR_ID').AsFloat, ARMA_Detail_ID]);
                // update the crm_items.rma_detail_id for future reference
                if (ARMA_Detail_ID > 0) and (FieldByName('ID').AsFloat > 0) then
                  ExecuteCommandFmt(
                    'UPDATE crm_items SET rma_detail_id = %.0f, ' +
                    'rma_table_name = ''VENDOR_RMA'' WHERE id = %.0f',
                    [ARMA_Detail_ID, FieldByName('ID').AsFloat]);
              end;
            Next;
          end;
      finally
        Free;
      end;
    AddCRMActivitySourceDoc(ACRMActivityID, 'VENDOR_RMA', AVendorRMA_ID);
    aConnection.Commit; // commit changes
  finally
    if aConnection.InTransaction then
      begin
        Result := 0;
        aConnection.RollBack; // rollback if there was a problem
      end;
  end;
end;

function AddCRMItemToNewVendorRMA(ACRMActivityID, ACRMItemsID: Real): Real;
var
  // Activity variables
  AVendorID, AVendorRMA_ID: Real;
begin
  Result := 0;
  AVendorID := GetActivityVendorID(ACRMActivityID); // see above
  if (AVendorID > 0) then
    begin
      AVendorRMA_ID := CreateVendorRMAHeader(AVendorID);
      Result := AddCRMItemToExistingVendorRMA(ACRMActivityID, AVendorRMA_ID,
        ACRMItemsID);
    end;
end;

function AddCRMItemToExistingVendorRMA(ACRMActivityID, AVendorRMA_ID,
  ACRMItemsID: Real): Real;
var
  // RMA variables
  ARMA_Detail_ID: Real;
  AArinvtID, APoReceiptsID: Real;
  AReturnCodeID: Real;
  AQty: Real;
  aConnection : TFDConnection;

  procedure _findRMADetail;
  var
    ALocalArinvtID: Real;
  begin
    with TFDQuery.Create(NIL) do
      try
        ConnectionName := 'IQFD';
        SQL.Add('SELECT a.id, a.arinvt_id, a.po_receipts_id');
        SQL.Add('  FROM vendor_rma_detail a');
        SQL.Add(Format(' WHERE a.vendor_rma_id = %.0f', [AVendorRMA_ID]));
        Open;
        while not EOF do
          begin
            if (Fields[1].AsFloat = AArinvtID) then
              begin
                ARMA_Detail_ID := Fields[0].AsFloat;
                Break;
              end
            else
              begin
                ALocalArinvtID :=
                  SelectValueFmtAsFloat('SELECT b.arinvt_id'#13 +
                  '  FROM po_receipts a, po_detail b'#13 +
                  ' WHERE a.id = %.0f AND'#13 +
                  '       b.id = a.po_detail_id'#13 +
                  'UNION'#13 +
                  'SELECT b.arinvt_id'#13 +
                  '  FROM po_receipts a, po_detail_hist b'#13 +
                  ' WHERE a.id = %.0f AND'#13 +
                  '       b.id = a.po_detail_id',
                  [Fields[2].AsFloat, Fields[2].AsFloat]);
                if (ALocalArinvtID > 0) and (ALocalArinvtID = AArinvtID) then
                  begin
                    ARMA_Detail_ID := Fields[0].AsFloat;
                    Break;
                  end;
              end;
            Next;
          end;
      finally
        Free;
      end;
  end;

begin
  if AVendorRMA_ID = 0 then
    raise Exception.Create('Application Error:  RMA ID not provided.');
  if (ACRMItemsID = 0) then
    Exit;
  Result := 0;
  try
    aConnection := FDManager.FindConnection('IQFD') as TFDConnection;
    aConnection.StartTransaction; // start transaction

    with TFDQuery.Create(NIL) do
      try
        ConnectionName := 'IQFD';
        SQL.Add(Format('SELECT * FROM crm_items WHERE id = %.0f AND ROWNUM < 2',
          [ACRMItemsID]));
        Open;
        AArinvtID := FieldByName('ARINVT_ID').AsFloat;
        APoReceiptsID := FieldByName('PO_RECEIPTS_ID').AsFloat;
        AReturnCodeID := FieldByName('RETURN_CODE_ID').AsFloat;
        AQty := FieldByName('QTYRETURNED').AsFloat;
        // Do not add the item, if it already exists on the RMA
        if APoReceiptsID > 0 then
          ARMA_Detail_ID :=
            SelectValueFmtAsFloat(
            'SELECT id FROM vendor_rma_detail WHERE po_receipts_id = %.0f AND ' +
            'vendor_rma_id = %.0f', [APoReceiptsID, AVendorRMA_ID])
        else if AArinvtID > 0 then
          ARMA_Detail_ID :=
            SelectValueFmtAsFloat(
            'SELECT id FROM vendor_rma_detail WHERE arinvt_id = %.0f AND ' +
            'vendor_rma_id = %.0f', [AArinvtID, AVendorRMA_ID])
        else
          ARMA_Detail_ID := 0;
        if (ARMA_Detail_ID = 0) then
          _findRMADetail;
        if (ARMA_Detail_ID = 0) and (RecordExists('ARINVT', AArinvtID) or
          RecordExists('PO_RECEIPTS', APoReceiptsID) or
          RecordExists('RETURN_CODE', AReturnCodeID) or (AQty > 0)) then
          ARMA_Detail_ID := AddVendorRMADetail(AVendorRMA_ID, AArinvtID,
            APoReceiptsID, AReturnCodeID, AQty, FieldByName('MISC_REASON')
            .AsString);
        // Provide the result with the first detail added
        Result := ARMA_Detail_ID;
        if ARMA_Detail_ID = 0 then
          Exit;
        // 02/16/2007 Additional
        if FieldByName('CAR_ID').AsFloat > 0 then
          ExecuteCommandFmt
            ('UPDATE rma_detail SET car_id = %.0f WHERE id = %.0f',
            [FieldByName('CAR_ID').AsFloat, ARMA_Detail_ID]);
        // update the crm_items.rma_detail_id for future reference
        if (ARMA_Detail_ID > 0) then
          ExecuteCommandFmt('UPDATE crm_items SET rma_detail_id = %.0f, ' +
            'rma_table_name = ''VENDOR_RMA'' WHERE id = %.0f',
            [ARMA_Detail_ID, ACRMItemsID]);
      finally
        Free;
      end;
    AddCRMActivitySourceDoc(ACRMActivityID, 'VENDOR_RMA', AVendorRMA_ID);
    aConnection.Commit; // commit changes
  finally
    if aConnection.InTransaction then
      begin
        Result := 0;
        aConnection.RollBack; // rollback if there was a problem
      end;
  end;
end;

function CreateVendorRMAHeader(AArcustoID: Real): Real;
var
  AEPlant_ID_Str: String; // var param
  AEPlant_ID: Real;
begin
  Result := GetNextID('VENDOR_RMA');
  AEPlant_ID := SecurityManager.EPlant_ID_AsFloat;
  ExecuteCommandFmt('INSERT INTO vendor_rma ' +
    '(id, rmano, vendor_id, rma_date, userid, closed, eplant_id) ' +
    'VALUES (%.0f, ''%s'', %.0f, SYSDATE, ''%s'', ''N'', DECODE(NVL(%.0f, 0), 0, NULL, %.0f)) ',
    [Result, IntToStr(Trunc(Result)), AArcustoID, SecurityManager.UserName,
    AEPlant_ID,
    AEPlant_ID]);
end;

function AddVendorRMADetail(AVendorRMA_ID, AArinvtID, APoReceiptsID,
  AReturnCodeID: Real; AQty: Real; AReason: String): Real;
var
  ANewID: Real;
begin
  if AVendorRMA_ID = 0 then
    // crm_rscstr.cTXT0000327 =
    // 'Parent RMA not supplied.  Cannot add detail item.'
    raise Exception.Create(crm_rscstr.cTXT0000327);
  if SelectValueFmtAsInteger(
    'SELECT 1 FROM vendor_rma WHERE id = %.0f AND ROWNUM < 2',
    [AVendorRMA_ID]) = 0 then
    // crm_rscstr.cTXT0000328 =
    // 'Parent RMA not found.  Cannot add detail item.' }
    raise Exception.Create(crm_rscstr.cTXT0000328);
  ANewID := GetNextID('VENDOR_RMA_DETAIL');
  Result := ANewID;
  ExecuteCommandParam('INSERT into vendor_rma_detail ' +
    '(id, vendor_rma_id, qty_to_return, comment1) ' +
    'VALUES (:ID, :VENDOR_RMA_ID, :QTY_TO_RETURN, :COMMENT1)',
    ['ID;F', 'VENDOR_RMA_ID;F', 'QTY_TO_RETURN;F', 'COMMENT1'],
    [ANewID, AVendorRMA_ID, AQty, AReason]);
  // 03/11/2009 Update the return code ID if available
  if AReturnCodeID > 0 then
    ExecuteCommandFmt(
      'UPDATE vendor_rma_detail SET return_code_id = %.0f WHERE id = %.0f',
      [AReturnCodeID, ANewID]);
  // 03/11/2009 Update the link ID values.  We update one or the other,
  // but not both.  Requested by Nancy.
  // 06/05/2014 Updated both the link ID and Inventory fields.
  // Requested by Beth as part of "EIQ-2203 SER #05110 - CRM - Add Items tab
  // to Vendor Support Issues with a link to Vendor RMA".
  if APoReceiptsID > 0 then
    ExecuteCommandFmt(
      'UPDATE vendor_rma_detail SET po_receipts_id = %.0f WHERE id = %.0f',
      [APoReceiptsID, ANewID]);
  if AArinvtID > 0 then
    ExecuteCommandFmt(
      'UPDATE vendor_rma_detail     '#13 +
      '   SET (arinvt_id,           '#13 +
      '        arinvt_itemno,       '#13 +
      '        arinvt_descrip,      '#13 +
      '        arinvt_class,        '#13 +
      '        arinvt_rev) =        '#13 +
      '   (SELECT id,               '#13 +
      '           itemno,           '#13 +
      '           descrip,          '#13 +
      '           class,            '#13 +
      '           rev               '#13 +
      '      FROM arinvt            '#13 +
      '     WHERE id = %.0f)        '#13 +
      ' WHERE id = %.0f             ',
      [AArinvtID, ANewID]);
end;

{$ENDREGION 'Vendor RMA'}

end.
