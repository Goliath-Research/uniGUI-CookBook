unit Dsp_Cust;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Dsp_Base,
  Data.DB,
  Mask,
  Vcl.DBGrids,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.Trans,
  trans_share,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel, uniBitBtn, uniSpeedButton, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniPageControl, uniScrollBox, uniSplitter, uniButton, uniPanel;

type
  // AArinvtDispocargo: TArinvtDispoCargo;
  // AArinvtDispoCargo.Itemno
  TArinvtDispoCargo = record
    AClass       : string;
    AItemNo      : string;
    ARev         : string;
    ADescrip     : string;
    ADescrip2    : string;
    AUnit        : string;
    AEplant_Name : string;
    AStandard_ID : Real;
  end;

  TFgMultiDispoCargo = record
    ALocation    : string;
    ALotNo       : string;
    ANon_Conform : string;
    AEplant_Name : string;
    ADivision    : string;
  end;

  TFrmDispoCust = class(TFrmDispoBase)
    PkArinvt: TIQWebHPick;
    PkArinvtID: TBCDField;
    PkArinvtCLASS: TStringField;
    PkArinvtITEMNO: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkMasterFGMulti: TIQWebHPick;
    PkMasterFGMultiFGMULTI_ID: TBCDField;
    PkMasterFGMultiLOTNO: TStringField;
    PkMasterFGMultiONHAND: TFMTBCDField;
    PkMasterFGMultiLOC_DESC: TStringField;
    QryFGMulti: TFDQuery;
    QryFGMultiFGMULTI_ID: TBCDField;
    QryFGMultiLOTNO: TStringField;
    QryFGMultiONHAND: TBCDField;
    QryFGMultiLOC_DESC: TStringField;
    PkMasterFGMultiNON_CONFORM: TStringField;
    QryEPlant: TFDQuery;
    PkMasterFGMultiVMI: TStringField;
    PkMasterFGMultiDIVISION_NAME: TStringField;
    lblExtDesc: TUniLabel;
    dbeExtDescription: TUniDBEdit;
    PkMasterFGMultiHARD_ALLOCATED_TO: TStringField;
    PkMasterFGMultiNON_CONFORM_ID: TBCDField;
    PkMasterFGMultiNON_ALLOCATE_ID: TBCDField;
    PkMasterFGMultiSHIPMENT_DTL_ID_IN_TRANSIT: TBCDField;
    PkMasterFGMultiMAKE_TO_ORDER_DETAIL_ID: TBCDField;
    PkMasterFGMultiLOT_DATE: TDateTimeField;
    PkMasterFGMultiSHELF_LIFE: TFMTBCDField;
    PkMasterFGMultiIS_HARD_ALLOC: TStringField;
    PkMasterFGMultiRecDef: TIQWebHPick;
    PkMasterFGMultiRecDefFGMULTI_ID: TBCDField;
    PkMasterFGMultiRecDefLOC_DESC: TStringField;
    PkMasterFGMultiRecDefLOTNO: TStringField;
    PkMasterFGMultiRecDefONHAND: TBCDField;
    PkMasterFGMultiRecDefNON_CONFORM: TStringField;
    PkMasterFGMultiRecDefVMI: TStringField;
    PkMasterFGMultiRecDefDIVISION_ID: TBCDField;
    PkMasterFGMultiRecDefDIVISION_NAME: TStringField;
    PkMasterFGMultiRecDefHARD_ALLOCATED_TO: TStringField;
    PkMasterFGMultiRecDefIS_HARD_ALLOC: TStringField;
    PkMasterFGMultiRecDefNON_CONFORM_ID: TBCDField;
    PkMasterFGMultiRecDefNON_ALLOCATE_ID: TBCDField;
    PkMasterFGMultiRecDefSHIPMENT_DTL_ID_IN_TRANSIT: TBCDField;
    PkMasterFGMultiRecDefMAKE_TO_ORDER_DETAIL_ID: TBCDField;
    PkMasterFGMultiRecDefLOT_DATE: TDateTimeField;
    PkMasterFGMultiRecDefSHELF_LIFE: TFMTBCDField;
    PkMasterFGMultiCOUNTRY: TStringField;
    PkMasterFGMultiRecDefCOUNTRY: TStringField;
    procedure PkMasterFGMultiIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkMasterFGMultiBeforeOpen(DataSet: TDataSet);
    procedure gridTargetLocEditButtonClick(Sender: TObject);
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] Dsp_Cust.pas(117): E2003 Undeclared identifier: 'TNavigateBtn'}
    {procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);}
    procedure TblDetailLocAfterPost(DataSet: TDataSet);
    procedure SrcDetailLocDataChange(Sender: TObject; Field: TField);
    procedure SrcDetailDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    {procedure PkMasterFGMultiIQDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);}
    procedure PkMasterFGMultiIQAfterHPickCreate(Sender: TObject);
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] Dsp_Cust.pas(128): E2003 Undeclared identifier: 'TUniCellAttribs'}
    {procedure PkMasterFGMultiIQDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);}
  private
    procedure AppendConsumedQuanToTable(ATable: TFDTable;  AFGMultiFIFO: TObject);
    { Private declarations }
  protected
    FOrigin: string;
    FVendorId:Real;
    FVendorCountry:String;
    FRECEIVING_UD_LOT_NUM:String;
    FVendorPrefix:String;
    FRECV_DEFAULTLocationID:Real;
    FRECV_DEFAULTArinvtID:Real;
    FRECV_DEFAULTDivision_ID:Real;
    FUseNonConformInspectionLocation: Boolean;

    function DoGetNewLocationByArinvt( ArinvtID:Real; var AFGMultiID: Real ): TModalResult; virtual;
    procedure AddOverhead( const AIN_OUT: string ); virtual;
    procedure AddLabor( const AIN_OUT: string ); virtual;
    function FindWorkorderOnGetNewLocationByArinvt: Real; virtual;
    procedure CheckPopulateProductionData(ATransComponent: TIQWebTransDispoBase; AWork_Center_ID, AWorkorder_ID: Real);
  public
    { Public declarations }
    PO_Receipts_ID: Real;    { PO Receips ID. Assigned only during receiving}

    procedure AppendToLocation( AArinvt_ID,
                                AStandard_ID,
                                AQty,
                                ARGQty: Real;
                                ATable:TFDTable;
                                const ALot,
                                DefaultLocation: string;
                                AWork_Center_ID: Real;
                                AWorkorder_ID: Real = 0;
                                ASub_Batch: Real = 0 );

    procedure AppendToLocationFIFO( AArinvt_ID, AStandard_ID, AQty, ARG_Qty: Real;
                                    ATable:TFDTable;
                                    const DefaultLocation: string;
                                    AWork_Center_ID: Real;
                                    AMandatoryLotNo: string = '';
                                    AShipment_Dtl_ID_In_Transit: Real = 0;
                                    AWorkorder_ID: Real = 0;
                                    AOnHandTransConsumed: TOnHandTransConsumed = nil;  // trans_share.pas
                                    AInTransitArcusto_ID: Real = 0 );

    procedure AppendToLocationFIFO_Rework( AArinvt_ID,
                                           APtOrder_ID,
                                           AQty,
                                           ADivision_ID: Real);

    function  GetArinvtInfo(var  AArinvtDispo: TArinvtDispoCargo):Boolean;
    function  GetFgmultiInfo(var AFgMultiDispo:TFgMultiDispoCargo):Boolean; overload;
    function  GetFgmultiInfo(const AFGMultiID: Real; var AFgMultiDispo:TFgMultiDispoCargo):Boolean; overload;
    function IsFromPo:Boolean;
  end;

var
  FrmDispoCust: TFrmDispoCust;

implementation

{$R *.DFM}

uses
  IQMS.Common.InventoryLotDocs,
  IQMS.Common.Dispo,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  spc,
  { TODO -oSanketG -cWC : Need to revisit }
  //Trans,
  IQMS.Common.TransMisc,
  { TODO -oSanketG -cWC : Need to revisit }
  {TrNewLoc,
  TrNewLocRecv,}
  dispo_rscstr,
  IQMS.WebVcl.HpickFrm;


procedure TFrmDispoCust.PkMasterFGMultiIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
var
  AFGMultiID : Real;
begin
  // Initialize
  Action := mrNone;
  ResultValue := 0;

  inherited;  {nothing}

  {Create new FGMulti}
  Action:= DoGetNewLocationByArinvt(
    DispoTableFromEditedGrid.FieldByName('ARINVT_ID').AsLargeInt,
    {var} AFGMultiID );

  if Action = mrOK then
  begin
     ResultValue:= AFGMultiID;
     QryFGMulti.Close;
     QryFGMulti.Open;
  end;
end;


function TFrmDispoCust.DoGetNewLocationByArinvt( ArinvtID:Real; var AFGMultiID: Real ): TModalResult;
var
  AResult: Boolean;
  { TODO -oSanketG -cWC : Need to revisit , dependent on TrNewLoc}
  {AParamsIn: TNewLocationParamsIn;
  AParamsOut: TNewLocationParamsOut;}
begin
  { TODO -oSanketG -cWC : Need to revisit , dependent on TrNewLoc}
  (*AParamsIn.Clear;
  AParamsIn.ArinvtID := ArinvtID;
  AParamsIn.DivisionID := FDivision_ID;
  AParamsIn.RECEIVING_UD_LOT_NUM := FRECEIVING_UD_LOT_NUM;
  AParamsIn.VendorPrefix := FVendorPrefix;
  AParamsIn.POReceiptsID := PO_Receipts_ID;
  AParamsOut.Clear;
  if IsFromPO then
    AResult:= TFrmTranNewLocationRecv.DoShowModal(Self,
      AParamsIn, {var} AParamsOut)
//     Result:= TFrmTranNewLocationRecv.DoShowModalEx( self, ArinvtID, AFGMultiID,
//     FDivision_ID, '', '', FRECEIVING_UD_LOT_NUM, FVendorPrefix, PO_Receipts_ID ) {TrNewLocRecv.pas}
  else
    begin
      AParamsIn.RECEIVING_UD_LOT_NUM := 'N';
      AParamsIn.VendorPrefix := '';
      AParamsIn.WorkorderID := FindWorkorderOnGetNewLocationByArinvt;
      // Result:= TFrmTranNewLocation.DoShowModal( self, ArinvtID, AFGMultiID, FDivision_ID, AWorkoder_ID );
      AResult:= TFrmTranNewLocationRecv.DoShowModal(Self, AParamsIn, {var} AParamsOut)
//     Result:= TFrmTranNewLocation.DoShowModal( self,               // {TrNewLoc.pas}
//                                               ArinvtID,
//                                               AFGMultiID,
//                                               FDivision_ID,
//                                               '',                 // ALoc_Desc
//                                               '',                 // ALotNo
//                                               'N',                // AReceiving_UD_Lot_Num
//                                               '',                 // AVendorPrefix
//                                               FindWorkorderOnGetNewLocationByArinvt());  // normally returns 0 unless we ar ecoming from prod rep in which case we need to check for cascade_parent_mto
    end;
  if AResult then
    begin
      AFGMultiID := AParamsOut.FGMultiID;
      if AParamsOut.Country > '' then
        FVendorCountry := AParamsOut.Country;
      Result := mrOk;
    end;*)
end;

function TFrmDispoCust.FindWorkorderOnGetNewLocationByArinvt: Real;
begin
  Result:= 0;
end;


procedure TFrmDispoCust.PkMasterFGMultiBeforeOpen(DataSet: TDataSet);
begin
  inherited; {nothing}

  {Filter out FGMulti locations based on Arinvt_ID}
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('arinvt_id').Value := DispoTableFromEditedGrid.FieldByName('Arinvt_ID').asFloat;
  //   ParamByName('AVMI').asString    := 'N';
  //   ParamByName('ADummy').asInteger := 1;
  //
  //   {outsource central support. default value so the picklist won't bomb out}
  //   if Params.FindParam('filter_in_transit') <> nil then ParamByName('filter_in_transit').Value := 0;
  //   if Params.FindParam('parent_arinvt_id') <> nil  then ParamByName('parent_arinvt_id').Value := 0;
  //
  //   {hard allocated support}
  //   if (Params.FindParam('workorder_id') <> nil) and (TblMaster.FindField('workorder_id') <> nil) then
  //       ParamByName('workorder_id').Value := TblMaster.FieldByName('workorder_id').asFloat;
  //
  //   {Vendor VMI support}
  //   if Params.FindParam('vmi_locations_id') <> nil then
  //      Params.ParamByName('vmi_locations_id').Value := 0;
  //
  //   if Params.FindParam('vmi_po_detail_id') <> nil then
  //      Params.ParamByName('vmi_po_detail_id').Value := 0;
  //
  //   if Params.FindParam('AVendorId') <> nil then
  //      Params.ParamByName('AVendorId').Value := 0;
  // end;

  AssignQueryParamValue(DataSet, 'arinvt_id', DispoTableFromEditedGrid.FieldByName('Arinvt_ID').asFloat );
  AssignQueryParamValue(DataSet, 'AVMI', 'N');
  AssignQueryParamValue(DataSet, 'ADummy', 1);
  AssignQueryParamValue(DataSet, 'filter_in_transit', 0);
  AssignQueryParamValue(DataSet, 'parent_arinvt_id', 0);
  if TblMaster.FindField('workorder_id') <> nil then
     AssignQueryParamValue(DataSet, 'workorder_id', TblMaster.FieldByName('workorder_id').asFloat);
  AssignQueryParamValue(DataSet, 'vmi_locations_id', 0);
  AssignQueryParamValue(DataSet, 'vmi_po_detail_id', 0);
  AssignQueryParamValue(DataSet, 'AVendorId', 0);
  AssignQueryParamValue(DataSet, 'kind', 0, ftInteger);  // 05-23-2016 EQI-8255  Added in TransDlg to support void outsource receipt
end;

procedure TFrmDispoCust.gridTargetLocEditButtonClick(Sender: TObject);
var
  AFgmultiId:Real;
  Action: TModalResult;
  ADivision_ID, ANewArinvtLotDocID: Real;
  ACount:Real;
  { TODO -oSanketG -cWC : Need to revisit , dependent on TrNewLoc}
  {ANewLocationParamsIn: TNewLocationParamsIn;
  ANewLocationParamsOut: TNewLocationParamsOut;}

  procedure _AssignUsingDefaultRecvLocation;
  var
    ALotNo: string;
  begin
    {05-07-2014 EIQ-3005: Receiving – use lot # entered manually to create a new location if a receive designator location already exists}
    ALotNo:= SelectValueByID('lotno', 'po_receipts', PO_Receipts_ID);
    ACount:= SelectValueFmtAsFloatWhere( Format('select count(id) from fgmulti where loc_id = %.0f and arinvt_id = %.0f',
                                                [ FRECV_DEFAULTLocationID, FRECV_DEFAULTArinvtID ]),
                                        ['lotno', ALotNo]);
    case Trunc(ACount) of
       0: begin
            // 01/30/2015 (Byron) the following was added or changed to
            // fulfill the request made in YouTrack issue:
            // EIQ-5542 Receiving - Add Country of Origin if Lot # exists SER #
            // Prepare parameter records

            { TODO -oSanketG -cWC : Need to revisit , dependent on TrNewLoc}
            (*ANewLocationParamsIn.Clear;
            ANewLocationParamsIn.ArinvtID := FRECV_DEFAULTArinvtID;
            ANewLocationParamsIn.DivisionID := fIIf( FRECV_DEFAULTDivision_ID = 0, FDivision_ID, FRECV_DEFAULTDivision_ID );
            ANewLocationParamsIn.LotNumber := ALotNo;
            ANewLocationParamsIn.RECEIVING_UD_LOT_NUM := FRECEIVING_UD_LOT_NUM;
            ANewLocationParamsIn.VendorPrefix := FVendorPrefix;
            ANewLocationParamsIn.LocationID := FRECV_DEFAULTLocationID;
            ANewLocationParamsIn.POReceiptsID := PO_Receipts_ID;
            ANewLocationParamsOut.Clear;
            // Show the form to "Assign New Receiving Location" (TrNewLocRecv.pas)
            if TFrmTranNewLocationRecv.DoShowModal(Self, ANewLocationParamsIn,
              ANewLocationParamsOut) then
              begin
                LocationTableFromEditedGrid.FieldByName('FGMulti_ID').asFloat :=
                  ANewLocationParamsOut.FGMultiID;
                // 01/30/2015 (Byron) If a lot number and country is provided,
                // then add to the lot documents.
                if (ANewLocationParamsOut.LotNumber > '') and
                  (ANewLocationParamsOut.Country > '') then
                  begin
                    // Add the lot document record
                    IQMS.Common.InventoryLotDocs.AddInventoryLotDocumentEx(
                      ANewLocationParamsIn.ArinvtID,
                      ANewLocationParamsOut.LotNumber,
                      ANewLocationParamsOut.Country,
                      {var} ANewArinvtLotDocID);
                    // Ensure the country value is updated in the table.
                    if LocationTableFromEditedGrid.FindField('arinvt_lot_docs_id') <> nil then
                      begin
                        if not (LocationTableFromEditedGrid.State in
                          [dsEdit, dsInsert]) then
                          LocationTableFromEditedGrid.Edit;
                        LocationTableFromEditedGrid
                          .FieldByName('arinvt_lot_docs_id').AsFloat :=
                          ANewArinvtLotDocID;
                      end;
                  end;
              end;*)

            (*
            ADivision_ID:= fIIf( FRECV_DEFAULTDivision_ID = 0, FDivision_ID, FRECV_DEFAULTDivision_ID );
            Action := TFrmTranNewLocationRecv.DoShowModal2( self,
                                                            FRECV_DEFAULTArinvtID,
                                                            AFgmultiId,
                                                            ADivision_ID,
                                                            '',
                                                            ALotNo,
                                                            FRECEIVING_UD_LOT_NUM,
                                                            FVendorPrefix,
                                                            FRECV_DEFAULTLocationID); {TrNewLocRecv.pas}
            if Action = mrOk then
               LocationTableFromEditedGrid.FieldByName('FGMulti_ID').asFloat := AFgmultiId;
            *)
          end;

       1: begin
            AFgmultiId:= SelectValueFmtAsFloatWhere( Format('select id from fgmulti where loc_id = %.0f and arinvt_id = %.0f',
                                                            [ FRECV_DEFAULTLocationID, FRECV_DEFAULTArinvtID ]),
                                                    [ 'lotno', ALotNo ]);
            if not (LocationTableFromEditedGrid.State in [dsEdit, dsInsert]) then
               LocationTableFromEditedGrid.Insert;
            LocationTableFromEditedGrid.FieldByName('FGMulti_ID').asFloat := AFgmultiId;
          end

    else
          begin
            IQPickAndReplace( LocationTableFromEditedGrid.FieldByName('FGMulti_ID'),
                              PkMasterFGMultiRecDef,
                              'FGMulti_ID' );
          end;
    end;

    FRECV_DEFAULTLocationID := 0;
    FRECV_DEFAULTArinvtID   := 0;
    FRECV_DEFAULTDivision_ID:= 0;
  end;


  procedure _CreateQuickInspection();
  var
    AGroup_ID: Integer;
    InspectionParams: spc.TInspectionRec;
    APO_Qty: Real;
    AArinvt_ID: Real;
    AStandard_ID: Real;
  begin
    AArinvt_ID:= LocationTableFromEditedGrid.FieldByName('arinvt_id').asFloat;
    AStandard_ID:= SelectValueByID('standard_id', 'arinvt', AArinvt_ID );

    AGroup_ID:= 0;
    APO_Qty:= SelectValueFmtAsFloat('select Round(UOM.IQConvert( d.unit, a.unit, r.qty_received, a.id, ''Y'' ),2) '+
                        '  from po_receipts r,                                               '+
                        '       po_detail d,                                                 '+
                        '       arinvt a                                                     '+
                        ' where r.id = %f                                                    '+
                        '   and r.po_detail_id = d.id                                        '+
                        '   and d.arinvt_id = a.id(+)                                        ',
                        [ PO_Receipts_ID ]);

    spc.ClearInspectionParams(InspectionParams);
    InspectionParams.Source   := 'ARINVT';
    InspectionParams.SourceID := LocationTableFromEditedGrid.FieldByName('arinvt_id').AsLargeInt;
    InspectionParams.UserName := SecurityManager.UserName;
    InspectionParams.PR_EMP_ID:= Trunc(GetEmployeeID(SecurityManager.UserName));
    InspectionParams.FGLotNo  := SelectValueByID( 'lotno', 'fgmulti', AFGMultiID );
    InspectionParams.SPC_INSPECTION_ID:= Trunc(SelectValueByID('spc_inspection_id', 'arinvt', LocationTableFromEditedGrid.FieldByName('arinvt_id').asFloat));
    InspectionParams.FGMULTI_ID := Trunc(AFGMultiID);
    InspectionParams.VariableSampleCount := SelectValueFmtAsString('SELECT NVL(variable_sample_count, ''N'') FROM spc_inspection ' +
                                                               ' WHERE id = %.0f',
                                                               [ InspectionParams.SPC_INSPECTION_ID ]) = 'Y';
    InspectionParams.ConfidencePercentile:= spc.GetDefaultConfidencePercentile;
    InspectionParams.ConfidenceInterval  := spc.GetDefaultConfidenceInterval;
    InspectionParams.Population          := Round(APO_Qty);
    InspectionParams.SampleCount         := SelectValueFmtAsInteger('SELECT sample_count FROM spc_inspection WHERE id = %.0f',
                                                               [ InspectionParams.SPC_INSPECTION_ID ]);
    InspectionParams.MfgNo               := SelectValueByID('mfgno', 'standard', AStandard_ID);
    InspectionParams.PO_Receipts_ID      := Trunc(PO_Receipts_ID);

    spc.InsertSubgroup(InspectionParams, { var } AGroup_ID);

    if AGroup_ID > 0 then
       ExecuteCommandFmt('update fgmulti set spc_subgroup_id = %d where id = %f', [ AGroup_ID, AFgmultiID ]);
  end;

  { TODO -oSanketG -cWC : Need to revisit , dependent on TrNewLoc}
  (*procedure _AssignUsingNonConformInspectionLocation;
  var
    AParamsIn: TNewLocationParamsIn;
    AParamsOut: TNewLocationParamsOut;
  begin
    ADivision_ID:= IQMS.Common.Numbers.iIIf( FRECV_DEFAULTDivision_ID = 0, FDivision_ID,
      FRECV_DEFAULTDivision_ID );
    // Assign param values
    AParamsIn.Clear;
    AParamsIn.ArinvtID := FRECV_DEFAULTArinvtID;
    AParamsIn.DivisionID := ADivision_ID;
    AParamsIn.RECEIVING_UD_LOT_NUM := FRECEIVING_UD_LOT_NUM;
    AParamsIn.VendorPrefix := FVendorPrefix;
    AParamsIn.LocationID := FRECV_DEFAULTLocationID;
    AParamsOut.Clear;
    if TFrmTranNewLocationRecv.DoShowModal(Self, AParamsIn, {var} AParamsOut) then
      Action := mrOk
    else
      Action := mrCancel;

    if Action = mrOk then
    begin
      if spc.IsLicensed_SPC then
         _CreateQuickInspection();
      LocationTableFromEditedGrid.FieldByName('FGMULTI_ID').AsFloat := AParamsOut.FGMultiID;
    end;
  end; *)

begin  // main of gridTargetLocEditButtonClick

  inherited;  {Assign LocationTableFromEditedGrid based on Sender}

  {Get FGMulti_ID from the picklist}
  if SelectValueFmtAsInt64('select id from locations where id = %f', [FRECV_DEFAULTLocationID]) > 0 then
     begin
       if FUseNonConformInspectionLocation then
          { TODO -oSanketG -cWC : Need to revisit }
          //_AssignUsingNonConformInspectionLocation
       else
          _AssignUsingDefaultRecvLocation;
     end
  else
     IQPickAndReplace( LocationTableFromEditedGrid.FieldByName('FGMULTI_ID'),
                       PkMasterFGMulti,
                       'FGMULTI_ID' );

  {refresh lookup fields}
  DispoTableFromEditedGrid.CursorPosChanged;
end;

procedure TFrmDispoCust.AddOverhead( const AIN_OUT: string );
begin
end;

procedure TFrmDispoCust.AddLabor( const AIN_OUT: string );
begin
end;

{ TODO -oSanketG -cWC : Need to revisit,[dcc32 Error] Dsp_Cust.pas(541): E2003 Undeclared identifier: 'DBNavigator1Click' }
{procedure TFrmDispoCust.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
var
  I:Integer;
begin
  inherited;  // nothing
  if Button = nbInsert then
    for I:= 0 to ComponentCount - 1 do
      if Components[ I ] is TUniDBGrid then with Components[ I ] as TUniDBGrid do
         if DataSource = (Sender as TUniDBNavigator).DataSource then
            if Assigned( OnEditButtonClick ) then
            begin
              OnEditButtonClick( self.Components[ I ]);
              EXIT;
            end;
end;}


procedure TFrmDispoCust.AppendToLocation( AArinvt_ID,
                                          AStandard_ID,
                                          AQty,
                                          ARGQty: Real;
                                          ATable:TFDTable;
                                          const ALot,
                                          DefaultLocation: string;
                                          AWork_Center_ID: Real;
                                          AWorkorder_ID: Real = 0;
                                          ASub_Batch: Real = 0 );
var
  AField: TField;
begin
  with ATable do
  begin
    Append;
    FieldByName('quan').asFloat:= AQty;

    AField:= FindField('RG_QUAN');
    if Assigned(AField) then
       AField.AsFloat:= ARGQty;

    AField:= FindField('BATCH_ID');
    if Assigned(AField) and ( Batch_ID > 0) then
       AField.AsFloat:= Batch_ID;

    FieldByName('fgmulti_id').asFloat:= IQMS.Common.Dispo.GetAutoDispoFGMultiID( AArinvt_ID,
                                                                       AStandard_ID,
                                                                       DefaultLocation,
                                                                       ALot,
                                                                       AWork_Center_ID,
                                                                       FDivision_ID,
                                                                       AWorkorder_ID,
                                                                       0,       //  AOrd_Detail_ID
                                                                       ASub_Batch );
    Post;
  end;
end;


procedure TFrmDispoCust.AppendToLocationFIFO( AArinvt_ID, AStandard_ID, AQty, ARG_Qty: Real;
                                              ATable:TFDTable;
                                              const DefaultLocation: string;
                                              AWork_Center_ID: Real;
                                              AMandatoryLotNo: string = '';
                                              AShipment_Dtl_ID_In_Transit: Real = 0;
                                              AWorkorder_ID: Real = 0;
                                              AOnHandTransConsumed: TOnHandTransConsumed = nil;  // trans_share.pas
                                              AInTransitArcusto_ID: Real = 0 );
var
  AList: TList;
  I    : Integer;
begin
  // 05/11/2012  If the table is read-only, then don't attempt to
  // append data to it because an exception will be raised. (Byron)
  // Added in response to bug reported by Susan.
  // E-Mail: T&A Tasks - Disposition Hierarchy not followed Hughes
  //   Brothers CRM#  601247
  // E-Mail Sent: Wednesday, May 09, 2012 2:37 PM
  if not Assigned(ATable) or ATable.UpdateOptions.ReadOnly then
    Exit;

  AList:= TList.Create;
  try
     GetAutoDispoFGMultiFIFO( AList,                         {IQMS.Common.Dispo.pas}
                              AQty,
                              ARG_Qty,
                              AArinvt_ID,
                              AStandard_ID,
                              DefaultLocation,
                              AWork_Center_ID,
                              FDivision_ID,
                              FALSE,                         {AInclude_All_Locations}
                              AMandatoryLotNo,
                              AShipment_Dtl_ID_In_Transit,   {passed from receiving pending outsource asns. See oc_transfer_pend_asn.pas}
                              AWorkorder_ID,                 {pass workorder_id to check for hardallocated materials}
                              AOnHandTransConsumed,          {reduce onhand by already consumed during this transaction}
                              AInTransitArcusto_ID );        {outsource arcusto_id - this is where we ship to an receive back from vendor that arcusto.vendor_id_outsource = vendor.id}

     for I:= 0 to AList.Count - 1 do with TFGMultiFIFO( AList[ I ]) do
        with ATable do
        begin
          Append;
          FieldByName('quan').asFloat      := Qty;
          if not FieldByName('rg_quan').ReadOnly then
             FieldByName('rg_quan').asFloat:= RG_Qty;
          FieldByName('fgmulti_id').asFloat:= FGMulti_ID;
          Post;
        end;
        // 07-31-2008 developed to solve the bottleneck that later was found to be because of the lookup fields.
        // Left as an alternative in the future.
        // AppendConsumedQuanToTable( ATable, TFGMultiFIFO( AList[ I ]));
        // ATable.Refresh;

  finally
     while AList.Count > 0 do
     begin
       TFGMultiFIFO( AList[ 0 ]).Free;
       AList.Delete( 0 );
     end;
     AList.Free;
  end;
end;


procedure TFrmDispoCust.AppendToLocationFIFO_Rework( AArinvt_ID,
                                                     APtOrder_ID,
                                                     AQty,
                                                     ADivision_ID: Real );
var
  AList: TList;
  I    : Integer;
begin
  AList:= TList.Create;
  try
    IQMS.Common.Dispo.GetReworkFGMultiFIFO( AList,           // list of locations
                                  AQty,            // Qty
                                  0,               // ARG_Qty
                                  AArinvt_ID,      // arinvt_id
                                  APtOrder_ID,     // ptorder_id
                                  ADivision_ID );  // division_id

    for I:= 0 to AList.Count - 1 do with TFGMultiFIFO( AList[ I ]) do
       with TblDetailLoc do
       begin
         Append;
         FieldByName('quan').asFloat      := Qty;
         FieldByName('fgmulti_id').asFloat:= FGMulti_ID;
         Post;
       end;

  finally
     while AList.Count > 0 do
     begin
       TFGMultiFIFO( AList[ 0 ]).Free;
       AList.Delete( 0 );
     end;
     AList.Free;
  end;
end;

function TFrmDispoCust.GetArinvtInfo(var AArinvtDispo:TArinvtDispoCargo):Boolean;
begin
  Result := True;
  with TFDQuery.Create(NIL) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(Format('select a.class,                                                      ' +
                   '        a.itemno,                                                    ' +
                   '        a.rev,                                                       ' +
                   '        a.unit,                                                      ' +
                   '        a.descrip,                                                   ' +
                   '        a.descrip2,                                                  ' +
                   '        ''['' || e.ID || '']  '' || e.name as Eplant_name,           ' +
                   '        a.standard_id                                                ' +
                   ' from arinvt a, eplant e where a.eplant_id = e.id(+) and a.id = %.0f ',
                   [TblDetail.FieldByName('arinvt_id').asFloat]));
    Open;
    AArinvtDispo.Aclass       := FieldByName('class').asString;
    AArinvtDispo.Aitemno      := FieldByName('itemno').asString;
    AArinvtDispo.Arev         := FieldByName('rev').asString;
    AArinvtDispo.Aunit        := FieldByName('unit').asString;
    AArinvtDispo.Adescrip     := FieldByName('descrip').asString;
    AArinvtDispo.Adescrip2    := FieldByName('descrip2').asString;
    AArinvtDispo.Aeplant_name := FieldByName('eplant_name').asString;
    AArinvtDispo.AStandard_ID := FieldByName('standard_id').asFloat;
  finally
    Free;
  end;

end;

function TFrmDispoCust.GetFgmultiInfo(var AFgMultiDispo: TFgMultiDispoCargo):Boolean;
begin
  // 02/03/2015 (Byron) calls overload below
  Result := GetFgmultiInfo(TblMasterLoc.FieldByName('fgmulti_id').asFloat,
    {var} AFgMultiDispo);
{  Result := True;
  with TFDQuery.Create(NIL) do
  try
    Connection := MainModule.FDConnection;
    Sql.Add(Format('select f.lotno,                                                     ' +
                   '       f.division_id,                                                ' +
                   '       d.name as division,                                          ' +
                   '       loc.loc_desc,                                                ' +
                   '       nc.descrip as non_conform,                                   ' +
                   '       ''['' || e.ID || '']  '' || e.name as Eplant_name            ' +
                   '  from fgmulti f,                                                   ' +
                   '       division d,                                               ' +
                   '       locations loc,                                               ' +
                   '       non_conform nc,                                              ' +
                   '       eplant e                                                     ' +
                   ' where f.loc_id = loc.id                                            ' +
                   '  and f.non_conform_id = nc.id(+)                                   ' +
                   '  and f.division_id = d.id(+)                                         ' +
                   '  and f.eplant_id = e.id(+)                                         ' +
                   '  and f.id = %.0f                                                   ',
                   [TblMasterLoc.FieldByName('fgmulti_id').asFloat]));
    Open;
    AFgMultiDispo.Alocation    := FieldByName('loc_desc').asString;
    AFgMultiDispo.Alotno       := FieldByName('lotno').asString;
    AFgMultiDispo.Anon_conform := FieldByName('non_conform').asString;
    AFgMultiDispo.Aeplant_name := FieldByName('eplant_name').asString;
    AFgMultiDispo.ADivision    := FieldByName('division').asString;
  finally
    Free;
  end; }
end;

function TFrmDispoCust.GetFgmultiInfo(const AFGMultiID: Real;
  var AFgMultiDispo: TFgMultiDispoCargo): Boolean;
begin
  Result := True;
  with TFDQuery.Create(NIL) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(Format('select f.lotno,                                                     ' +
                   '       f.division_id,                                                ' +
                   '       d.name as division,                                          ' +
                   '       loc.loc_desc,                                                ' +
                   '       nc.descrip as non_conform,                                   ' +
                   '       ''['' || e.ID || '']  '' || e.name as Eplant_name            ' +
                   '  from fgmulti f,                                                   ' +
                   '       division d,                                               ' +
                   '       locations loc,                                               ' +
                   '       non_conform nc,                                              ' +
                   '       eplant e                                                     ' +
                   ' where f.loc_id = loc.id                                            ' +
                   '  and f.non_conform_id = nc.id(+)                                   ' +
                   '  and f.division_id = d.id(+)                                         ' +
                   '  and f.eplant_id = e.id(+)                                         ' +
                   '  and f.id = %.0f                                                   ',
                   [AFGMultiID]));
    Open;
    AFgMultiDispo.Alocation    := FieldByName('loc_desc').asString;
    AFgMultiDispo.Alotno       := FieldByName('lotno').asString;
    AFgMultiDispo.Anon_conform := FieldByName('non_conform').asString;
    AFgMultiDispo.Aeplant_name := FieldByName('eplant_name').asString;
    AFgMultiDispo.ADivision    := FieldByName('division').asString;
  finally
    Free;
  end;
end;

procedure TFrmDispoCust.TblDetailLocAfterPost(DataSet: TDataSet);
begin
  TblDetailLoc.Refresh;
end;

function TFrmDispoCust.IsFromPo:Boolean;
begin
  Result := FOrigin = 'FROM_PO';
end;

procedure TFrmDispoCust.AppendConsumedQuanToTable( ATable: TFDTable; AFGMultiFIFO: TObject );
var
  AMasterTable    : TDataSet;
  AFK_Name        : string;
  AFK_Value       : Real;
  ADay_Part_ID_Str: string;
  AArinvt_ID_Str  : string;
begin
  AMasterTable    := ATable.MasterSource.DataSet;
  AFK_Name        := ATable.IndexFieldNames;
  AFK_Value       := AMasterTable.FieldByName( ATable.MasterFields ).asFloat;
  ADay_Part_ID_Str:= 'NULL';
  AArinvt_ID_Str  := 'NULL';

  if AMasterTable.FindField('DAY_PART_ID') <> nil then
     ADay_Part_ID_Str:= AMasterTable.FieldByName('DAY_PART_ID').asString;

  if AMasterTable.FindField('ARINVT_ID') <> nil then
     AArinvt_ID_Str:= AMasterTable.FieldByName('ARINVT_ID').asString;

  ExecuteCommandFmt('declare                                         '+
            '   v_id           number::= null;               '+
            '   v_fk_value     number::= %f;                 '+
            '   v_qty          number::= %.6f;               '+
            '   v_rg_qty       number::= %.6f;               '+
            '   v_fgmulti_id   number::= %f;                 '+
            '   v_day_part_id  number::= %s;                 '+
            '   v_arinvt_id    number::= %s;                 '+
            'begin                                           '+
            '   insert into %s                               '+
            '        ( %s, quan, rg_quan, fgmulti_id )       '+
            '   values                                       '+
            '        ( v_fk_value,                           '+
            '          v_qty,                                '+
            '          v_rg_qty,                             '+
            '          v_fgmulti_id )                        '+
            '   returning id                                 '+
            '        into v_id;                              '+
            '                                                '+
            '   if upper(''%s'') = ''MATPROD_LOCATION'' then '+
            '      update matprod_location                   '+
            '         set day_part_id = v_day_part_id,       '+
            '             arinvt_id = v_arinvt_id            '+
            '       where id = v_id;                         '+
            '   end if;                                      '+
            'end;                                            ',
            [
              AFK_Value,
              TFGMultiFIFO( AFGMultiFIFO ).Qty,
              TFGMultiFIFO( AFGMultiFIFO ).RG_Qty,
              TFGMultiFIFO( AFGMultiFIFO ).FGMulti_ID,
              ADay_Part_ID_Str,
              AArinvt_ID_Str,
              ATable.TableName,
              AFK_Name,
              ATable.TableName ]);
end;


procedure TFrmDispoCust.SrcDetailLocDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if Assigned(TblDetail.FindField('class')) and Assigned(TblDetailLoc.FindField('rg_quan')) then
     TblDetailLoc.FieldByName('rg_quan').ReadOnly:= TblDetail.FieldByName('class').asString <> 'PL';
end;

procedure TFrmDispoCust.SrcDetailDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if Assigned(TblDetail.FindField('class')) and Assigned(TblDetail.FindField('rg_qty')) then
     TblDetail.FieldByName('rg_qty').ReadOnly:= TblDetail.FieldByName('class').asString <> 'PL';
end;

procedure TFrmDispoCust.FormCreate(Sender: TObject);
begin
  inherited;
  IQRegFormRead( self, [ self, Panel7, gridMatReq, gridMatLoc, gridTargetLoc, ScrollBoxCarrierLeft01 ]);
end;

procedure TFrmDispoCust.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IQRegFormWrite( self, [ self, Panel7, gridMatReq, gridMatLoc, gridTargetLoc, ScrollBoxCarrierLeft01 ]);
end;

{ TODO -oSanketG -cWC : Need to revisit }
{procedure TFrmDispoCust.PkMasterFGMultiIQDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  //PS: Code added in procedure TFrmDispoCust.PkMasterFGMultiIQDrawColumnCell
end; }

procedure TFrmDispoCust.PkMasterFGMultiIQAfterHPickCreate(Sender: TObject);
begin
  inherited;
  THyperPick(Sender).AddLegendImages( IQMS.Common.TransMisc.LocationsColorLegendArray );
end;

{ TODO -oSanketG -cWC : Need to revisit }
(*procedure TFrmDispoCust.PkMasterFGMultiIQDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  { TODO -oSanketG -cWC : Need to revisit , dependent on trans}
  //TTransCustom.AssignFgMultiDrawColumnCell( Sender, Rect, DataCol, Column, State, TUniDBGrid(Sender).DataSource.DataSet );  // trans.pas

  // with Sender as TDBGrid do
  // begin
  //   if DataSource.DataSet.FieldByName('Non_Conform').asString <> '' then
  //   with Canvas do
  //     if gdSelected in State then
  //     begin
  //       Brush.Color:= clBlack;
  //       Font.Color := clYellow;
  //     end
  //     else
  //     begin
  //       Brush.Color:= clMaroon;
  //       Font.Color := clWhite;
  //     end;
  //   DefaultDrawColumnCell( Rect, DataCol, Column, State );
  // end;
end;*)

procedure TFrmDispoCust.CheckPopulateProductionData( ATransComponent: TIQWebTransDispoBase; AWork_Center_ID, AWorkorder_ID: Real );
begin
  if ATransComponent.Work_Center_ID = 0 then
     ATransComponent.Work_Center_ID:= AWork_Center_ID;
  if ATransComponent.Workorder_ID = 0 then
     ATransComponent.Workorder_ID:= AWorkorder_ID;
end;


end.
