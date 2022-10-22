unit pra_prod;

{ 03/17/2009:

  1.  Added support for Labor. The method pra_prod.DBAddLaborProd populates
  the table, DAY_EMP, which is required for including labor on the
  production report and updating the trans log. (Reported by Lael)
}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  IQMS.Common.RollbackManager;

function AddProductionReport(const AArinvtID,
  AStandardID,
  AWorkOrderID,
  AWorkCenterID,
  ATotalQty,
  ARejectQty,
  AProductionHours: Real;
  const AProductionDate: TDateTime;
  const AProductionShift: Integer;
  const AFGLotNo: String;
  var ADayProdID: Real): Boolean;
procedure UpdateProductionReportGoodParts(const ADayProdID: Real;
  const AGoodParts: Real);
procedure UpdateProductionReportTotalCycles(const ADayProdID: Real;
  const ATotalCycles: Real);
procedure DeleteProductionReport(const ADayProdID: Real);
procedure CalculateProductionReport(const ADayProdID: Real;
  const ADay_Part_ID: Real = 0);
procedure ReCalculateProductionReport(const ADayProdID: Real;
  const AGoodParts: Real;
  const ATotalParts: Real);

function GetDefaultCenterCost(const AArinvtID,
  AStandardID,
  AWorkCenterID: Real): Real;
function GetTotalCyclesFromProdRep(const ADayProdID: Real;
  ATotalParts: Real; var AActCav: Integer): Real;
function GetTotalCyclesFromBOM(const AStandardID: Real;
  ATotalParts: Real; var AActCav: Integer; AArinvt_ID: Real = 0): Real;

implementation

uses
  IQMS.Common.Proc,
  prodadd,
  IQMS.Common.DataLib;

function AddProductionReport(const AArinvtID,
  AStandardID,
  AWorkOrderID,
  AWorkCenterID,
  ATotalQty,
  ARejectQty,
  AProductionHours: Real;
  const AProductionDate: TDateTime;
  const AProductionShift: Integer;
  const AFGLotNo: String;
  var ADayProdID: Real): Boolean;
var
  AParams: TManualProdParams; // declared in ProdAdd.pas
  AArcustoID,
    ACenterCost,
    AAltStandardID,
    AHistIllumRT_ID,
    ATotalCycles,
    AGoodParts: Real;
  AActCav: Integer;
begin
  // Note:  Calling form is responsible for deleting the old production
  // report first, before creating a new one.

  // Standard ID is required
  if AStandardID = 0 then
    raise Exception.Create('Application Error: Manufacturing # not selected.');

  AArcustoID := SelectValueByID('arcusto_id', 'workorder', AWorkOrderID);
  AGoodParts := ATotalQty - ARejectQty;

  // Fill params
  AParams.Custno := SelectValueFmtAsString(
    'select custno from arcusto where id = %.0f',
    [AArcustoID]);
  AParams.DayProd_ID := 0;
  AParams.Eqno := SelectValueByID('eqno', 'work_center', AWorkCenterID);
  AParams.MfgCell := '';
  AParams.OrderNo := '';
  AParams.ProdDate := AProductionDate;
  // TDateTime(SelectValueAsFloat('select prod_date from params where rownum < 2'));
  AParams.Shift := AProductionShift;
  // Trunc(SelectValueAsFloat('select prod_shift from params where rownum < 2'));
  AParams.Standard_ID := AStandardID;
  AParams.WorkOrder_ID := AWorkOrderID;
  AParams.Arinvt_ID := AArinvtID;

  // 07/02/2009 Get the actcav value from the BOM.  Requested by Lael.
  // The total cycles (for DAYPROD.TOTAL_CYCLES) must be good parts divided
  // by the actual cavities. Requested by Lael.
  ATotalCycles := GetTotalCyclesFromBOM(AStandardID, ATotalQty, AActCav,
    AArinvtID);

  // Add the new production report
  Result := DoAppendSilentProd(Application, AParams, ADayProdID); // ProdAdd.pas
  Result := Result and (ADayProdID > 0);

  if not Result then
    Exit;

  // Update the lot number
  if AFGLotNo > '' then
    ExecuteCommandParam(
      'update dayprod set fg_lotno = :FG_LOTNO where id = :ID',
      ['FG_LOTNO', 'ID;F'],
      [AFGLotNo, ADayProdID]);

  // Update the cycle count
  // 03/17/2009 Moved routine from here to procedure below.  Nothing
  // has changed internally; only the method has been moved and
  // available to other methods.
  // 07/02/2009 Previously we passed ATotalQty.  Instead, we must pass
  // total cycles.  See calculation above.  Requested by Lael.
  UpdateProductionReportTotalCycles(ADayProdID, ATotalCycles);

  // 03/17/2009 Update the total cavities to just 1.  I ran this idea by
  // Arik, Nancy and Lael.  Nancy approved this change. (Requested by Lael).
  // Always assume for PRA that we are working with only 1 cavity only.
  // 07/02/2009 The cavities must be obtained from the BOM; specifically,
  // we need to check the PARTNO table for the BOM.
  ExecuteCommandFmt(
    'update day_part set actcav = %d where dayprod_id = %.0f',
    [AActCav, ADayProdID]);

  // Update the production hours
  // 09/16/2015 (Byron, EIQ-8628) Allow negative
  // if AProductionHours > 0 then
  ExecuteCommandParam(
    'update dayprod set prod_hrs = :PROD_HRS ' +
    'where id = :ID',
    ['PROD_HRS;F', 'ID;F'],
    [AProductionHours, ADayProdID]);

  // Update the center cost
  ACenterCost := GetDefaultCenterCost(AArinvtID,
    AStandardID,
    AWorkCenterID); // see below
  ExecuteCommandParam(
    'update dayprod set'#13 +
    ' cntr_cost = :CNTR_COST '#13 +
    'where id = :ID',
    ['CNTR_COST;F', 'ID;F'],
    [ACenterCost, ADayProdID]); // iqlib

  // --------------------------------------------------------------------------
  // Update DayProd for StandardID
  // Get the phantom BOM
  AAltStandardID := SelectValueFmtAsInt64(
    'select standard_id from arinvt'#13 +
    'where id = (select arinvt_id_mat from standard where id = %.0f)',
    [AStandardID]);
  // If not a phantom BOM, then just use the provided Standard ID
  if AAltStandardID = 0 then
    AAltStandardID := AStandardID;

  // Update these values based on the BOM
  if AAltStandardID > 0 then
    ExecuteCommandParam(
      'update dayprod set'#13 +
      ' reuse = (select reuse from standard where id = :STANDARD_ID), '#13 +
      ' reuse_sprue = (select reuse_sprue from standard where id = :STANDARD_ID) '#13 +
      'where id = :ID',
      ['STANDARD_ID;F', 'STANDARD_ID;F', 'ID;F'],
      [AAltStandardID, AAltStandardID, ADayProdID]); // iqlib
  // --------------------------------------------------------------------------
  // Update DayProd ProdDate;
  // 12/08/2008 Update the production date on the production report.  This
  // must be correct before we attempt to process it.
  ExecuteCommandFmt(
    'update dayprod set prod_date = to_date(''%s'', ''MM/DD/RRRR''), ' +
    'shift = %d where id = %.0f',
    [FormatDateTime('mm/dd/yyyy', AProductionDate), AProductionShift,
    ADayProdID]);

  // --------------------------------------------------------------------------
  // Update good parts quantity
  UpdateProductionReportGoodParts(ADayProdID, AGoodParts);
  // see below, this unit

  // --------------------------------------------------------------------------
  // Update WorkOrderID;
  if AWorkOrderID > 0 then
    begin
      AHistIllumRT_ID := SelectValueFmtAsInt64(
        'select HIST_ILLUM_RT_ID from dayprod where id = %.0f',
        [ADayProdID]);
      ExecuteCommandFmt(
        'update hist_illum_rt set workorder_id = %.0f where id = %.0f',
        [AWorkOrderID, AHistIllumRT_ID]);
    end;

end;

procedure UpdateProductionReportGoodParts(const ADayProdID: Real;
  const AGoodParts: Real);
begin
  // Update DAY_PART.  Since we only work with 1 inventory item, there
  // will always be only 1 record.
  // 03/30/2009 Added field, floor_dispo_qty.  The value must be zero or
  // the user will not be able to disposition.  I (Byron) notified Nancy
  // and Lael of this problem, and received confirmation to make the change.
  ExecuteCommandParam(
    'update day_part set'#13 +
    ' good_pts = :GOOD_PTS,'#13 +
    ' floor_dispo_qty = 0'#13 +
    'where dayprod_id = :DAYPROD_ID',
    ['GOOD_PTS;F', 'DAYPROD_ID;F'],
    [AGoodParts, ADayProdID]);
end;

procedure UpdateProductionReportTotalCycles(const ADayProdID: Real;
  const ATotalCycles: Real);
begin
  // 03/17/2009 This method added.  This routine was being called internally
  // by AddProductionReport().  I moved it here so it could also be called
  // by ReCalculateProductionReport() below.
  // Update the cycle count
  // 07/09/2010 Allow negative values (Byron).  Requested by Nancy.
  // if ATotalCycles > 0 then
  ExecuteCommandParam(
    'update dayprod set total_cycles = :TOTAL_CYCLES, ' +
    'total_cycles_disp = :TOTAL_CYCLES_DISP where id = :ID',
    ['TOTAL_CYCLES;F', 'TOTAL_CYCLES_DISP;F', 'ID;F'],
    [ATotalCycles, ATotalCycles, ADayProdID]);
end;

procedure DeleteProductionReport(const ADayProdID: Real);
var
  RB: TFDRollbackManager;

  procedure _DBDeleteRejectsProd;
  begin
    // Cycle day_part and delete the rejects record
    with TFDQuery.Create(NIL) do
      try
        Connection := uniMainModule.FDConnection1;
        SQL.Add(Format('select id from day_part where dayprod_id = %.0f',
          [ADayProdID]));
        Open;
        while not EOF do
          begin
            ExecuteCommandFmt('delete from rejects where day_part_id = %.0f',
              [FieldByName('ID').AsFloat]);
            Next;
          end;
      finally
        Free;
      end;
  end;

begin
  if Trunc(ADayProdID) > 0 then
    begin
    { TODO -omugdha -cWEBIQ : Dependancy on TFDIQMS
      RB := TFDIQMS.Common.RollbackManager.Create('RB_IQPRA'); }
      try
        RB.Associate(True);
        // Remove associated rejects
        _DBDeleteRejectsProd;
        // Deletes "virtual children"
        RB.ExecuteCommandFmt(
          'delete from dayprod where parent_id = %.0f',
          [ADayProdID]);
        // Delete the main record will cascade delete all child records
        RB.ExecuteCommandFmt(
          'delete from dayprod where id = %.0f',
          [ADayProdID]);
        RB.Commit;
      finally
        RB.CheckRollBack;
        FreeAndNil(RB);
      end;
    end;
end;

function GetDefaultCenterCost(const AArinvtID,
  AStandardID,
  AWorkCenterID: Real): Real;
begin
  // ** This method returns the center cost based on the overall wizard values **
  // Use this method to return center cost for non-FAB production hours.

  Result := 0;

  // If we have a Work Center ID, then get Center Cost from the Work Center
  if (AWorkCenterID > 0) then
    Result := SelectValueFmtAsFloat(
      'select cntr_cost from work_center where id = %.0f',
      [AWorkCenterID])
    // Otherwise, if we have a Standard ID, then get it from the BOM
  else if (AStandardID > 0) then
    Result := Get_Center_Rate(AStandardID) // in IQMS.Common.Proc.pas
    // Otherwise get it from the BOM associated with the Inventory item
  else
    Result := Get_Center_Rate(SelectValueFmtAsFloat(
      'select standard_id from arinvt where id = %.0f',
      [AArinvtID])); // in IQMS.Common.Proc.pas

end;

procedure CalculateProductionReport(const ADayProdID: Real;
  const ADay_Part_ID: Real = 0);
begin
  // * Calculate the Production Report *

  // By this point, the DAYPROD record should already be created.
  if ADayProdID = 0 then
    Exit;

  // Now, calculate.  Same as \PROD\ProdView.pas, DoOneJobProdMatSum.
  with TFDStoredProc.Create(NIL) do
    try
      Connection := uniMainModule.FDConnection1;
      StoredProcName := 'IQMS.PROD_REP.PROD_MATSUM';
      Prepare;
      ParamByName('V_DAYPROD_ID').Value := Trunc(ADayProdID);
      ParamByName('V_DAY_PART_ID').Value := Trunc(ADay_Part_ID);
      ExecProc;
      Close;
    finally
      Free;
    end
end;

procedure ReCalculateProductionReport(const ADayProdID: Real;
  const AGoodParts: Real;
  const ATotalParts: Real);
var
  AActCav: Integer;
  AStandardID: Real;
  ATotalCycles: Real;
begin
  if Trunc(ADayProdID) = 0 then
    Exit;

  // 07/02/2009 Get the actcav value from the BOM.  Requested by Lael.
  // The total cycles (for DAYPROD.TOTAL_CYCLES) must be total parts divided
  // by the actual cavities. The parts quantity must also include
  // rejects.  Requested by Lael.
  ATotalCycles := GetTotalCyclesFromProdRep(ADayProdID, ATotalParts, AActCav);

  // update the good parts quantity
  UpdateProductionReportGoodParts(ADayProdID, AGoodParts);
  // 03/17/2009 Update total cycles.  This was added because Lael found
  // that when recalculating a blend, the main material was not being
  // updated. I (Byron) added this because "total cycles" is part of the
  // production report quantity, and is required for an accurate recalculation.
  UpdateProductionReportTotalCycles(ADayProdID, ATotalCycles);
  // Calculate the report
  CalculateProductionReport(ADayProdID);
end;

function GetTotalCyclesFromProdRep(const ADayProdID: Real;
  ATotalParts: Real; var AActCav: Integer): Real;
var
  AHistIllumRtID,
    AStandardID: Real;
begin
  // Initialization
  Result := ATotalParts;
  AActCav := 1;

  // Validation
  if Trunc(ADayProdID) = 0 then
    Exit;

  // 07/02/2009 Get the standard ID.  Used below.
  AHistIllumRtID := SelectValueFmtAsInt64(
    'select hist_illum_rt_id from dayprod ' +
    'where id = %.0f',
    [ADayProdID]);
  AStandardID := SelectValueFmtAsInt64(
    'select standard_id from hist_illum_rt ' +
    'where id = %.0f',
    [AHistIllumRtID]);

  // 02-04-2015 needs arinvt_id for family tools
  Result := GetTotalCyclesFromBOM(AStandardID, ATotalParts, AActCav);
end;

function GetTotalCyclesFromBOM(const AStandardID: Real;
  ATotalParts: Real; var AActCav: Integer; AArinvt_ID: Real = 0): Real;
var
  APartno_ID: Real;
begin
  // Initialization
  Result := ATotalParts;
  AActCav := 1;

  // Validation
  if Trunc(AStandardID) = 0 then
    Exit;

  if AArinvt_ID > 0 then
    APartno_ID := SelectValueFmtAsInt64(
      'select id from partno where standard_id = %f and arinvt_id = %f',
      [AStandardID, AArinvt_ID])
  else
    APartno_ID := SelectValueFmtAsInt64(
      'select id from partno where standard_id = %f',
      [AStandardID]);

  // 07/02/2009 Get the standard ID.  Used below.
  // AStandardID := SelectValueFmtAsFloat('select standard_id from dayprod ' +
  // 'where id = %.0f', [ADayProdID]);

  // 07/02/2009 Get the actcav value from the BOM.  Requested by Lael.
  // AActCav := Trunc(SelectValueFmtAsFloat('select actcav from partno ' +
  // 'where standard_id = %.0f',[AStandardID]));

  // 02/04/2015 EIQ-5881 PRW – When processing a family tool work order in PRW,
  // components for any item after sequence 1 on the BOM are incorrect.
  AActCav := SelectValueFmtAsInteger(
    'SELECT actcav FROM partno WHERE id = %.0f',
    [APartno_ID]);
  if AActCav = 0 then
    AActCav := 1;

  // 07/02/2009
  // The total cycles (for DAYPROD.TOTAL_CYCLES) must be good parts divided
  // by the actual cavities. Requested by Lael.
  Result := ATotalParts / AActCav;
end;

end.
