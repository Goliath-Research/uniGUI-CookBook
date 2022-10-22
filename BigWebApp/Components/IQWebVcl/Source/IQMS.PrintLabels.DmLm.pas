unit IQMS.PrintLabels.DmLm;

{Must keep all dataset active = FALSE to avoid AV when TLMBase(self.Owner.Owner) is referenced }

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Data.DB,
  IQMS.WebVcl.Hpick,
//  Vcl.Wwdatsrc,
  Data.DBXOracle,
  System.Generics.Collections,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt;

type
  TLM_DM = class(TDataModule)
    QryVendor: TFDQuery;
    QryVendorCOMPANY: TStringField;
    QryVendorVENDORNO: TStringField;
    QryVendorADDR1: TStringField;
    QryVendorADDR2: TStringField;
    QryVendorCITY: TStringField;
    QryVendorSTATE: TStringField;
    QryVendorZIP: TStringField;
    QryVendorID: TBCDField;
    QryLocation: TFDQuery;
    QryLocationLOC_DESC: TStringField;
    QryLocationLOTNO: TStringField;
    QryLocationONHAND: TBCDField;
    QryLocationID: TBCDField;
    QryPoOrders: TFDQuery;
    QryPoOrdersORDERNO: TStringField;
    QryPoOrdersPONO: TStringField;
    QryPoOrdersORD_QUAN: TBCDField;
    QryPoOrdersID: TBCDField;
    QryLabels: TFDQuery;
    QryLabelsID: TBCDField;
    QryLabelsARCUSTO_ID: TBCDField;
    QryLabelsLABEL_FILE: TStringField;
    QryLabelsLABEL_MENU_NAME: TStringField;
    QryLabelsLABEL_TYPE: TStringField;
    QryLabelCust: TFDQuery;
    QryMfgNo: TFDQuery;
    QryMfgNoMFGNO: TStringField;
    QryMfgNoID: TBCDField;
    QryPoRec: TFDQuery;
    SrcVendor: TDataSource;
    QryPoRecID: TBCDField;
    QryPoRecPONO: TStringField;
    QryPackage: TFDQuery;
    QryBillTo: TFDQuery;
    QrylabelDtl: TFDQuery;
    SrcLabels: TDataSource;
    QryLabelCustID: TBCDField;
    QryLabelCustARCUSTO_ID: TBCDField;
    QryLabelCustLABEL_FILE: TStringField;
    QryLabelCustLABEL_MENU_NAME: TStringField;
    QryLabelCustLABEL_TYPE: TStringField;
    QrylabelDtlLM_LABELS_ID: TBCDField;
    QrylabelDtlFIELD_NAME: TStringField;
    QrylabelDtlFIELD_TYPE: TStringField;
    QrylabelDtlWIDTH: TBCDField;
    QrylabelDtlDEC: TBCDField;
    QrylabelDtlACT_WIDTH: TBCDField;
    SrcPackage: TDataSource;
    QryLabelsREMOTE_SERVER: TStringField;
    QryLabelCustREMOTE_SERVER: TStringField;
    QryLabelsEPLANT_ID: TBCDField;
    QryLabelCustEPLANT_ID: TBCDField;
    QryLabelCustCOMM_PORT: TStringField;
    QryLabelsCOMM_PORT: TStringField;
    wwQryCustomer: TFDQuery;
    wwQryCustomerID: TBCDField;
    wwQryCustomerCUSTNO: TStringField;
    wwQryCustomerCOMPANY: TStringField;
    wwQryCustomerPK_HIDE: TStringField;
    QryLabelCustREPORT_NAME: TStringField;
    QryLabelsREPORT_NAME: TStringField;
    QryLabelsCRW_LABEL_COPIES: TBCDField;
    QryBillToATTN: TStringField;
    QryBillToADDR1: TStringField;
    QryBillToADDR2: TStringField;
    QryBillToCITY: TStringField;
    QryBillToSTATE: TStringField;
    QryBillToZIP: TStringField;
    QryLabelsLABEL_KIND: TStringField;
    QryLabelCustLABEL_KIND: TStringField;
    SrcPORecvLables: TDataSource;
    QryPORecvLables: TFDQuery;
    QryPORecvLablesQTY: TBCDField;
    SrcRMALabels: TDataSource;
    QryRMALabels: TFDQuery;
    QryRMALabelsQTY: TFMTBCDField;
    QryRMALabelsSERIAL: TStringField;
    QryRMALabelsLOC_DESC: TStringField;
    QryRMALabelsLOTNO: TStringField;
    QryRMALabelsREPRINT: TStringField;
    QryRMALabelsID: TBCDField;
    QryRMALabelsFGMULTI_ID: TBCDField;
    QryRMALabelsMASTER_LABEL_ID: TBCDField;
    SrcMasterLabelPlan: TDataSource;
    QryMasterLabelPlan: TFDQuery;
    QryMasterLabelPlanID: TBCDField;
    QryMasterLabelPlanBATCH: TBCDField;
    QryMasterLabelPlanLABELS_COUNT: TBCDField;
    QryMasterLabelPlanQTY: TBCDField;
    QryLabelsORIGIN: TStringField;
    QryLabelCustORIGIN: TStringField;
    QryMasterLabelPlanEXIST_MASTER_LABEL_ID: TBCDField;
    QryPackageWorkorderBOM: TFDQuery;
    QryPackageWorkorderBOMDESCRIP: TStringField;
    QryPackageWorkorderBOMITEMNO: TStringField;
    QryPackageWorkorderBOMWEIGHT: TFMTBCDField;
    QryPackageWorkorderBOMARINVT_ID: TBCDField;
    QryPackageWorkorderBOMPTSPER: TFMTBCDField;
    QryPackageWorkorderBOMSEQ: TBCDField;
    QryPackageWorkorderBOMID: TBCDField;
    QryPackageWorkorderBOMBOXNO: TBCDField;
    QryPackageWorkorderBOMPARTNO_ID: TBCDField;
    QryPackageWorkorderBOMTARE_WEIGHT: TFMTBCDField;
    QryPackageWorkorderBOMVOLUME: TFMTBCDField;
    dbxCalcTotalWeight: TFDStoredProc;
    SrcDimInv: TDataSource;
    QryDimInv: TFDQuery;
    QryDimInvNAME: TStringField;
    QryDimInvNVALUE: TFMTBCDField;
    QryDimInvID: TBCDField;
    UpdateSQLDimInv: TFDUpdateSQL;
    QryShipTo: TFDQuery;
    QryShipToATTN: TStringField;
    QryShipToADDR1: TStringField;
    QryShipToADDR2: TStringField;
    QryShipToCITY: TStringField;
    QryShipToSTATE: TStringField;
    QryShipToZIP: TStringField;
    QryShipToID: TBCDField;
    QryLabelsLABEL_TEMPLATE_ID: TBCDField;
    QryLabelCustLABEL_TEMPLATE_ID: TBCDField;
    QryNonSerialLabels: TFDQuery;
    QryNonSerialLabelsLABEL_MENU_NAME: TStringField;
    QryNonSerialLabelsORIGIN: TStringField;
    QryNonSerialLabelsREMOTE_SERVER: TStringField;
    QryNonSerialLabelsEPLANT_ID: TBCDField;
    QryNonSerialLabelsCOMM_PORT: TStringField;
    QryNonSerialLabelsREPORT_NAME: TStringField;
    QryNonSerialLabelsCRW_LABEL_COPIES: TBCDField;
    QryNonSerialLabelsLABEL_KIND: TStringField;
    QryNonSerialLabelsID: TBCDField;
    QryNonSerialLabelsARCUSTO_ID: TBCDField;
    QryNonSerialLabelsLABEL_FILE: TStringField;
    QryNonSerialLabelsLABEL_TYPE: TStringField;
    QryNonSerialLabelsLABEL_TEMPLATE_ID: TBCDField;
    QryDimInvARINVT_DIM_ID: TBCDField;
    QryDimInvCALCULATED: TStringField;
    QryDimInvFORMULA: TStringField;
    QryPORecvLablesID: TBCDField;
    QryBillToID: TBCDField;
    procedure PkLabelBeforeOpen(DataSet: TDataSet);
    procedure PkAllItemsBeforeOpen(DataSet: TDataSet);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure QryBillToBeforeOpen(DataSet: TDataSet);
    procedure QryLabelCustBeforeOpen(DataSet: TDataSet);
    procedure QryBillToAfterOpen(DataSet: TDataSet);
    procedure PkAllItemsCustomBtn1Click(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure QryPackageWorkorderBOMBeforeOpen(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryDimInvBeforePost(DataSet: TDataSet);
    procedure QryShipToAfterOpen(DataSet: TDataSet);
    procedure wwQryCustomerBeforeOpen(DataSet: TDataSet);
    procedure QryLabelsBeforeOpen(DataSet: TDataSet);
    procedure QryDimInvAfterPost(DataSet: TDataSet);
    procedure SrcDimInvDataChange(Sender: TObject; Field: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure QryShipToBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FDoNotDefaultArcusto: Boolean;
    FIncludeMixedLabelType: Boolean;

  protected
    { Protected declarations }
  public
    { Public declarations }
    IncludeAllCustomersForQryLabelCust: Boolean;
    function WorkCenterPrinterName(const AArinvtID, AWorkCenterID: Real): String;

    procedure CalculateTotalWeight( AAStandard_ID   : Real;
                                    AArinvt_ID      : Real;
                                    AWorkorder_ID   : Real;
                                    AMainQty        : Real;
                                    AHasWorkorderBOM: Boolean;
                                    var AWeight     : Real;
                                    var AVolume     : Real );
    /// <summary> Determine if the dimension list contains calculated
    /// dimensions.
    /// </summary>
    function HasCalculatedDimensions: Boolean;
    /// <summary> Determine if calculated dimensions should be calculated.
    /// Returns true if all values have been entered, but the calculated
    /// values are all NULL.
    /// </summary>
    function CanCalculateDimensions: Boolean;
    /// <summary> Calculate the dimensions.  Overwrites any prior values.
    /// </summary>
    procedure CalculateDimensions;

    property DoNotDefaultArcusto: Boolean read FDoNotDefaultArcusto write FDoNotDefaultArcusto;
    property IncludeMixedLabelType: Boolean read FIncludeMixedLabelType write FIncludeMixedLabelType;
  end;

  function LM_DM : TLM_DM;

implementation

{$R *.DFM}

uses
  uniGUIApplication,
  IQMS.Common.FormulaExpressionEval,
  IQMS.Common.Boolean,
  IQMS.WebVcl.Jump,
  IQMS.Common.DataLib,
  IQMS.PrintLabels.LabelMatrix,
  IQMS.Common.StringUtils,
  IQMS.Common.JumpConstants,
  IQMS.DBTrans.dbtfiredac,
  IQMS.WebVcl.ResourceStrings;

function LM_DM : TLM_DM;
begin
  Result := TLM_DM.Create(uniGUIApplication.UniApplication);
end;

procedure TLM_DM.PkLabelBeforeOpen(DataSet: TDataSet);
begin
  //picklist's param is same as of this query
  AssignQueryParamValue(DataSet, 'cLabelType', QryLabels.ParamByName('cLabelType').asString);
end;

procedure TLM_DM.PkAllItemsBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TLM_DM.PkAllItemsCustomBtn1Click(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrABORT;
  IQMS.WebVcl.Jump.JumpDirect( IQMS.Common.JumpConstants.iq_JumpToSerialTrackPrintRange, -1);  // -1 to bypass the target record ID check
end;

procedure TLM_DM.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TLM_DM.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);
end;

procedure TLM_DM.QryBillToBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'nId', TIQWebLMBase(self.Owner.Owner).FArcusto_ID);
  AssignQueryParamValue(DataSet, 'ForceBillToId', TIQWebLMBase(self.Owner.Owner).FForceBill_To_ID);
end;

procedure TLM_DM.QryDimInvAfterPost(DataSet: TDataSet);
begin
  ApplyUpdates(DataSet);

  if CanCalculateDimensions then
    CalculateDimensions;
end;

procedure TLM_DM.QryDimInvBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'gtt_master_label_dim');
end;

procedure TLM_DM.QryLabelCustBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);

  if not IncludeAllCustomersForQryLabelCust then
    AssignQueryParamValue(DataSet, 'nId', TIQWebLMBase(self.Owner.Owner).FArcusto_ID)
  else
    AssignQueryParamValue(DataSet, 'nId', -1);

  AssignQueryParamValue(DataSet, 'arinvt_id', TIQWebLMBase(self.Owner.Owner).FArinvt_ID);

  if TIQWebLMBase(self.Owner.Owner).FShip_To_ID > 0 then
     AssignQueryParamValue(DataSet, 'ship_to_id', TIQWebLMBase(self.Owner.Owner).FShip_To_ID)
  else
     ClearQueryParamValue(DataSet, 'ship_to_id');
end;

procedure TLM_DM.QryLabelsBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'cLabelType', TIQWebLMBase(self.Owner.Owner).LabelType);
  AssignQueryParamValue(DataSet, 'include_mixed', BoolToYN(IncludeMixedLabelType));
  AssignQueryParamValue(DataSet, 'arinvt_id', TIQWebLMBase(self.Owner.Owner).FArinvt_ID);
end;

procedure TLM_DM.QryPackageWorkorderBOMBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'workorder_id', TIQWebLMBase(self.Owner.Owner).Workorder_ID);
end;

procedure TLM_DM.QryShipToAfterOpen(DataSet: TDataSet);
var
  AShip_To_ID: Real;
  AOrders_ID : Real;
begin
  AOrders_ID:= TIQWebLMBase(self.Owner.Owner).Orders_ID;
  if AOrders_ID <> 0 then
  begin
    AShip_To_ID:= SelectValueFmtAsFloat('select ship_to_id from orders where id = %.0f', [ AOrders_ID ]);
    if AShip_To_ID = 0 then
       AShip_To_ID:= SelectValueFmtAsFloat('select ship_to_id from hist_orders where id = %.0f', [ AOrders_ID ]);
    if AShip_To_ID <> 0 then
       QryShipTo.Locate('ID', AShip_To_ID, []);
  end;
end;

procedure TLM_DM.QryShipToBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'nId', TIQWebLMBase(self.Owner.Owner).FArcusto_ID);
  AssignQueryParamValue(DataSet, 'ForceShipToId', TIQWebLMBase(self.Owner.Owner).FForceShip_To_ID);
end;

procedure TLM_DM.SrcDimInvDataChange(Sender: TObject; Field: TField);
begin
  QryDimInvNVALUE.ReadOnly := (QryDimInvCALCULATED.AsString = 'Y');
end;

procedure TLM_DM.QryBillToAfterOpen(DataSet: TDataSet);
var
  ABill_To_ID: Real;
  AOrders_ID : Real;
begin
  AOrders_ID:= TIQWebLMBase(self.Owner.Owner).Orders_ID;
  if AOrders_ID <> 0 then
  begin
    ABill_To_ID:= SelectValueFmtAsFloat('select bill_to_id from orders where id = %.0f', [ AOrders_ID ]);
    if ABill_To_ID = 0 then
       ABill_To_ID:= SelectValueFmtAsFloat('select bill_to_id from hist_orders where id = %.0f', [ AOrders_ID ]);
    if ABill_To_ID <> 0 then
       QryBillTo.Locate('ID', ABill_To_ID, []);
  end;
end;

function TLM_DM.WorkCenterPrinterName(const AArinvtID,
  AWorkCenterID: Real): String;
begin
  Result := SelectValueFmtAsString(
     'SELECT iqms.print_label.work_center_printer(%.0f, %.0f) FROM DUAL',
     [AArinvtID, AWorkCenterID]);
end;

procedure TLM_DM.wwQryCustomerBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'do_not_default_arcusto',
    Integer(self.DoNotDefaultArcusto));
end;

procedure TLM_DM.CalculateTotalWeight( AAStandard_ID   : Real;
                                       AArinvt_ID      : Real;
                                       AWorkorder_ID   : Real;
                                       AMainQty        : Real;
                                       AHasWorkorderBOM: Boolean;
                                       var AWeight     : Real;
                                       var AVolume     : Real );
begin
  // 11/25/2015 (Byron) Changed from TSQLStoredProc to TFDStoredProc.
  // Tested and confirmed param datatypes are valid.
  with dbxCalcTotalWeight do
  begin
    ParamByName('v_standard_id').AsFMTBCD := Trunc(AAStandard_ID);
    ParamByName('v_arinvt_id').AsFMTBCD   := Trunc(AArinvt_ID);
    ParamByName('v_workorder_id').AsFMTBCD:= Trunc(AWorkorder_ID);
    ParamByName('v_main_qty').AsFMTBCD    := AMainQty;
    ParamByName('v_is_workorder_bom').AsString := TIQBoolean.AsYN(AHasWorkorderBOM);

    Prepare;
    ExecProc;

    AWeight:= ParamByName('v_weight').AsFloat;
    AVolume:= ParamByName('v_volume').AsFloat;
  end;
end;

function TLM_DM.HasCalculatedDimensions: Boolean;
begin
  // 10/26/2015 (Byron, EIQ-9205) Determine if there are any calculated
  // dimensions.  Note: must use BDE because this is a GTT -- until
  // fully converted to FireDAC.
  Result := SelectValueAsInteger(
    'SELECT 1'#13 +
    '  FROM gtt_master_label_dim'#13 +
    ' WHERE NVL(calculated, ''N'') = ''Y'' AND'#13 +
    '       formula IS NOT NULL AND'#13 +
    '       ROWNUM < 2') = 1;
end;

function TLM_DM.CanCalculateDimensions: Boolean;
var
  AHasNullValues: Boolean;
begin
  // 10/26/2015 (Byron, EIQ-9205) Determine if it is time to calculate
  // the dimensions.  Note: must use BDE because this is a GTT -- until
  // fully converted to FireDAC.
  Result := HasCalculatedDimensions;
(*
  // If there are no calculated dimensions, exit now
  if not HasCalculatedDimensions then
    Exit(False);

  // Are there still NULL values?
  Result := SelectValueAsInteger(
    'SELECT 1                                       '#13 +
    '  FROM gtt_master_label_dim                    '#13 +
    ' WHERE NVL(calculated, ''N'') = ''N'' AND      '#13 +
    '       nvalue IS NULL                          '
    ) = 0;
*)
end;

procedure TLM_DM.DataModuleCreate(Sender: TObject);
begin
  AssignDefaultConnectionName( self );
end;

procedure TLM_DM.CalculateDimensions;
type
  TParamRec = record
   nvalue: Real;
   arinvt_dim_id: Int64;
   is_null: Boolean;
  end;
var
  AExprEval: TExprParams; // declared in IQMS.Common.FormulaExpressionEval.pas
  AValue: Real;
  AParams: TList<TParamRec>;

  // Build a TList of param values.
  // This cuts down on how many times the database is hit.
  procedure _InitParams;
  var
    ARec: TParamRec;
  begin
    if Assigned(AParams) then
      begin
        AParams.Clear;
        // Set the parameter values
        with TFDQuery.Create(nil) do
          try
            ConnectionName := 'IQFD';
            SQL.Add('  SELECT nvalue,');
            SQL.Add('         arinvt_dim_id');
            SQL.Add('    FROM gtt_master_label_dim');
            SQL.Add('   WHERE NVL(calculated,''N'') <> ''Y''');
            SQL.Add('ORDER BY arinvt_dim_id');
            Open;
            while not Eof do
              begin
                ARec.nvalue := FieldByName('nvalue').AsFloat;
                ARec.arinvt_dim_id := FieldByName('arinvt_dim_id').AsLargeInt;
                ARec.is_null := FieldByName('nvalue').IsNull;
                AParams.Add(ARec);
                Next;
              end;
          finally
            Free;
          end;
      end;
  end;

  procedure _SetParams;
  var
    i: Integer;
  begin
    if Assigned(AParams) and Assigned(AExprEval) then
      begin
        for i := 0 to AParams.Count - 1 do
          AExprEval.SetParam(
            AParams[i].arinvt_dim_id,
            AParams[i].nvalue);
      end;
  end;

  function _IndexOfID(const AID: Int64): Integer;
  var
    i: Integer;
  begin
    Result := -1;
    for i := 0 to AParams.Count - 1 do
     if (AParams[i].arinvt_dim_id = AID) and
      not AParams[i].is_null then
       begin
         Result := i;
         Break;
       end;
  end;

  function _CheckFormulaValues(const AFormula: string): Boolean;
  var
    AList: TList<Int64>;
    i: Integer;
  begin
    AList := TList<Int64>.Create;
    try
      // Populates a TList with the ID values in the formula
      Result := IQMS.Common.FormulaExpressionEval.ListFormulaIDValuesEx(AFormula,
        {var} AList);
      // Now, determine if all of the ID's referenced in the formula
      // actually exist in the dataset
      if Result then
        for i := 0 to AList.Count - 1 do
          if _IndexOfID(AList.Items[i]) = -1 then
          begin
            // False = The formula references an ID value that is not
            // in the dataset; the nvalue will be unavailable.
            Result := False;
            // If it isn't found, then just add the value as zero
            AExprEval.SetParam(
              AList.Items[i],
              0);
            //Break;
          end;
    finally
      AList.Free;
    end;
  end;

begin
  // 10/26/2015 (Byron, EIQ-9205) Calculate the dimension values.
  // Note:  gtt_master_label_dim.arinvt_dim_id is used to obtain
  // values.
  // Note: must use BDE because this is a GTT -- until
  // fully converted to FireDAC
  AParams := TList<TParamRec>.Create;
  try
    // Initialize the parameter TList
    _InitParams;
    // Create the expression evaluator (IQMS.Common.FormulaExpressionEval.pas)
    AExprEval := TExprParams.Create(nil);
    try
      with TFDQuery.Create(nil) do
        try
          ConnectionName := 'IQFD';
          SQL.Add('  SELECT id,');
          SQL.Add('         nvalue,');
          SQL.Add('         arinvt_dim_id,');
          SQL.Add('         uom,');
          SQL.Add('         calculated,');
          SQL.Add('         formula');
          SQL.Add('    FROM gtt_master_label_dim');
          SQL.Add('   WHERE NVL(calculated,''N'') = ''Y''');
          SQL.Add('ORDER BY arinvt_dim_id');
          Open;
          while not Eof do
            begin
              // First, assign formula
              AExprEval.Formula := FieldByName('formula').AsString;
              // Second, assign params
              _SetParams;
              // If the formula references ID values that are not in
              // the dataset, just force them to zero (0).
              if _CheckFormulaValues(FieldByName('formula').AsString) then
              // Get value
                try
                  AValue := AExprEval.Execute;
                  // Get and update value
                  ExecuteCommandFmt(
                   'UPDATE gtt_master_label_dim SET nvalue = %.15f WHERE id = %d',
                   [AValue, FieldByName('id').AsLargeInt]);
                except on E: Exception do
                  // IQMS.WebVcl.ResourceStrings.cTXT0000509 =
                  // 'Could not calculate field value for UOM, %s. Encountered ' +
                  // 'error: %s';
                  raise Exception.CreateFmt(IQMS.WebVcl.ResourceStrings.cTXT0000509,
                    [FixStr(FieldByName('uom').AsString), E.Message]);
                end
              else
                // Get and update value
                ExecuteCommandFmt(
                 'UPDATE gtt_master_label_dim SET nvalue = NULL WHERE id = %d',
                 [FieldByName('id').AsLargeInt]);
              Next;
            end;
        finally
          Free;
        end;
    finally
      FreeAndNil(AExprEval);
    end;
  finally
    AParams.Free;
  end;

  RefreshDataSetByID(QryDimInv);
end;

end.
