unit WC_DM;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Wwdatsrc,
  //WEBCONVERT IQMS.Common.UserMessages,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

const
  NOTIFY_UPDATE_CNTR_TYPE = 1;
  NOTIFY_SYNC_FROM_CNTR_TYPE = 2;

type
  TDM_WC = class(TDataModule)
    Src_WorkCenter: TDataSource;
    Tbl_Work_Center: TFDTable;
    Tbl_Work_CenterEQNO: TStringField;
    Tbl_Work_CenterCNTR_TYPE: TStringField;
    Tbl_Work_CenterCNTR_DESC: TStringField;
    Tbl_Work_CenterCNTR_RATE: TBCDField;
    Tbl_Work_CenterCNTR_COST: TFMTBCDField;
    Tbl_Work_CenterMFGCELL: TStringField;
    Tbl_Work_CenterMFG_TYPE: TStringField;
    Tbl_Work_CenterSET_UP: TBCDField;
    Tbl_Work_CenterSTART_SHOTS: TBCDField;
    PkWorkCntr: TIQWebHPick;
    PkWorkCntrEQNO: TStringField;
    PkWorkCntrCNTR_DESC: TStringField;
    PkWorkCntrCNTR_TYPE: TStringField;
    PkWorkCntrID: TBCDField;
    Tbl_Work_CenterID: TBCDField;
    SrcILLUM_RT: TDataSource;
    TblILLUM_RT: TFDTable;
    SrcRT_Address: TDataSource;
    TblRT_Address: TFDQuery;
    Tbl_Work_CenterASY_MACH: TStringField;
    Tbl_Work_CenterIS_RT: TStringField;
    Tbl_Work_CenterPMEQMT_ID: TBCDField;
    PkVendor: TIQWebHPick;
    PkVendorVENDORNO: TStringField;
    PkVendorCOMPANY: TStringField;
    PkVendorCITY: TStringField;
    PkVendorSTATE: TStringField;
    PkVendorZIP: TStringField;
    PkVendorID: TBCDField;
    SrcWorkCenterElem: TDataSource;
    TblWorkCenterElem: TFDQuery;
    TblWorkCenterElemID: TBCDField;
    TblWorkCenterElemWORK_CENTER_ID: TBCDField;
    TblWorkCenterElemELEMENTS_ID: TBCDField;
    TblWorkCenterElemSTD_COST: TFMTBCDField;
    Tbl_Work_CenterRTSERVER_NOT_SIGNALED: TStringField;
    Tbl_Work_CenterTIME_FENCE: TBCDField;
    Tbl_Work_CenterRTSERVER_PREFIX: TStringField;
    Tbl_Work_CenterIS_DART: TStringField;
    Tbl_Work_CenterCAPACITY: TBCDField;
    QryEPlant: TFDQuery;
    Tbl_Work_CenterEPLANT_ID: TBCDField;
    Tbl_Work_CenterEPlant_Name: TStringField;
    PkWorkCntrEPLANT_ID: TBCDField;
    wwQryMfgType: TFDQuery;
    wwTblMfgType1: TFDTable;
    wwTblMfgType1MFGTYPE: TStringField;
    wwTblMfgType1DESCRIP: TStringField;
    wwQryMfgTypeMFGTYPE: TStringField;
    wwQryMfgTypeDESCRIP: TStringField;
    wwQryMfgCell: TFDQuery;
    wwQryMfgCellMFGCELL: TStringField;
    wwQryMfgCellDESCRIP: TStringField;
    wwQryMfgCellMFGTYPE: TStringField;
    wwQryMfgCellEPLANT_ID: TBCDField;
    wwQryMfgCellMfgTypeLookup: TStringField;
    Tbl_Work_CenterMFGCELL_ID: TBCDField;
    wwQryMfgCellID: TBCDField;
    PkWorkCntrMFGCELL: TStringField;
    PkWorkCntrDIVISION_NAME: TStringField;
    Tbl_Work_CenterLOCATIONS_ID: TBCDField;
    wwQryLocations: TFDQuery;
    wwQryLocationsID: TBCDField;
    wwQryLocationsLOC_DESC: TStringField;
    wwQryLocationsEPLANT_ID: TBCDField;
    wwQryLocationsEPLANT_NAME: TStringField;
    wwQryLocationsDIVISION_NAME: TStringField;
    Tbl_Work_CenterLOCATIONS_ID_IN: TBCDField;
    PkVendorPK_HIDE: TStringField;
    Tbl_Work_CenterFLOOR_BACKFLUSH: TStringField;
    PkWorkCntrEPLANT_NAME: TStringField;
    Tbl_Work_CenterSNAP_TO_LAST: TBCDField;
    Tbl_Work_CenterPK_HIDE: TStringField;
    PkWorkCntrPK_HIDE: TStringField;
    Tbl_Work_CenterRT_ARCHIVE_CYCLE_TIME: TStringField;
    Tbl_Work_CenterCONNECTED_STATUS_INDICATOR: TStringField;
    Tbl_Work_CenterIS_VIRTUAL: TStringField;
    Tbl_Work_CenterPARENT_ID: TBCDField;
    SrcChildWorkCenter: TDataSource;
    QryChildWorkCenter: TFDQuery;
    QryChildWorkCenterID: TBCDField;
    QryChildWorkCenterEQNO: TStringField;
    QryChildWorkCenterCNTR_DESC: TStringField;
    QryChildWorkCenterCNTR_TYPE: TStringField;
    QryChildWorkCenterCAPACITY: TBCDField;
    QryChildWorkCenterSET_UP: TBCDField;
    QryChildWorkCenterIS_RT: TStringField;
    QryChildWorkCenterRTSERVER_PREFIX: TStringField;
    QryChildWorkCenterRT_ADDRESS: TStringField;
    QryChildWorkCenterPARENT_ID: TBCDField;
    UpdateSQLChildWorkCenter: TFDUpdateSQL;
    QryChildWorkCenterPK_HIDE: TStringField;
    QryChildWorkCenterPMEQMT_ID: TBCDField;
    QryChildWorkCenterIS_VIRTUAL: TStringField;
    Tbl_Work_CenterRT_ADDRESS_OUT: TBCDField;
    Tbl_Work_CenterIS_DEDICATED_LIGHTSTICK_PORT: TStringField;
    Tbl_Work_CenterLIGHTSTICK_OUTPUT_TYPE: TBCDField;
    Tbl_Work_CenterLIGHTSTICK_COM_PORT: TBCDField;
    Tbl_Work_CenterLIGHTSTICK_CLIENT_IP: TStringField;
    Tbl_Work_CenterLIGHTSTICK_HOST_IP: TStringField;
    QryPMLookup: TFDQuery;
    QryPMLookupID: TBCDField;
    QryPMLookupEQNO: TStringField;
    QryPMLookupDESCRIP: TStringField;
    QryPMLookupCLASS: TStringField;
    QryPMLookupLOCATION: TStringField;
    Tbl_Work_CenterLookup_Mfgtype: TStringField;
    Tbl_Work_CenterEXCLUDE_AUTO_LOAD: TStringField;
    PkWorkCntrMFG_TYPE: TStringField;
    Tbl_Work_CenterFIXED_CNTR_COST: TFMTBCDField;
    TblWorkCenterElemFIXED_STD_COST: TFMTBCDField;
    SrcWork_Center_RejectCode: TDataSource;
    TblWork_Center_RejectCode: TFDTable;
    TblWork_Center_RejectCodeReject_Code_Disp: TStringField;
    TblWork_Center_RejectCodeReject_Desc_Disp: TStringField;
    TblWork_Center_RejectCodeID: TBCDField;
    TblWork_Center_RejectCodeREJECT_CODE_ID: TBCDField;
    PkRejectCode: TIQWebHPick;
    PkRejectCodeID: TBCDField;
    PkRejectCodeREJECT_CODE: TStringField;
    PkRejectCodeATTRIBUTE: TStringField;
    PkRejectCodeEPLANT_ID: TBCDField;
    TblWork_Center_RejectCodeWORK_CENTER_ID: TBCDField;
    Tbl_Work_CenterFLOOR_ACT_MTRL: TStringField;
    Tbl_Work_CenterCUSER1: TStringField;
    Tbl_Work_CenterCUSER2: TStringField;
    Tbl_Work_CenterCUSER3: TStringField;
    Tbl_Work_CenterCUSER4: TStringField;
    Tbl_Work_CenterCUSER5: TStringField;
    Tbl_Work_CenterNUSER1: TFMTBCDField;
    Tbl_Work_CenterNUSER2: TFMTBCDField;
    Tbl_Work_CenterNUSER3: TFMTBCDField;
    Tbl_Work_CenterNUSER4: TFMTBCDField;
    Tbl_Work_CenterNUSER5: TFMTBCDField;
    PkRejectCodePK_HIDE: TStringField;
    TblPCMonSrvcGrp: TFDTable;
    Tbl_Work_CenterPCMON_SERVICE_GROUP_ID: TBCDField;
    Tbl_Work_CenterFRAME_ID: TBCDField;
    Tbl_Work_CenterFRAME_ARINVT_ID_MAT: TBCDField;
    Tbl_Work_CenterFrameNo: TStringField;
    Tbl_Work_CenterFrameDescrip: TStringField;
    Tbl_Work_CenterFramePmEqmtNo: TStringField;
    Tbl_Work_CenterFrameMatItemNo: TStringField;
    Tbl_Work_CenterFrameMatDescrip: TStringField;
    Tbl_Work_CenterFrameMatRev: TStringField;
    Tbl_Work_CenterFrameMatClass: TStringField;
    Tbl_Work_CenterRT_Address_Descrip: TStringField;
    Tbl_Work_CenterRT_ADDRESS: TStringField;
    PkFrame: TIQWebHPick;
    PkFrameID: TBCDField;
    PkFrameFRAME_NO: TStringField;
    PkFrameDESCRIP: TStringField;
    PkFrameEQNO: TStringField;
    SrcLogicalMachines: TDataSource;
    QryLogicalMachines: TFDQuery;
    QryLogicalMachinesID: TBCDField;
    QryLogicalMachinesEQNO: TStringField;
    QryLogicalMachinesCNTR_DESC: TStringField;
    QryLogicalMachinesCNTR_TYPE: TStringField;
    QryLogicalMachinesRT_ADDRESS: TStringField;
    PkArinvtPL: TIQWebHPick;
    PkArinvtPLITEMNO: TStringField;
    PkArinvtPLREV: TStringField;
    PkArinvtPLDESCRIP: TStringField;
    PkArinvtPLDESCRIP2: TStringField;
    PkArinvtPLUNIT: TStringField;
    PkArinvtPLID: TBCDField;
    PkArinvtPLEPLANT_ID: TBCDField;
    PkArinvtPLPK_HIDE: TStringField;
    Tbl_Work_CenterFRAME_SET_ID: TBCDField;
    Tbl_Work_CenterFramePMEqmt_ID: TFloatField;
    Tbl_Work_CenterAUTO_LABEL_GROUP_ID: TBCDField;
    QryAutoLabelGroup: TFDQuery;
    QryAutoLabelGroupID: TBCDField;
    QryAutoLabelGroupDESCRIP: TStringField;
    Tbl_Work_CenterUSE_DEFAULT_CNTR_TYPE: TStringField;
    PkCntrType: TIQWebHPick;
    PkCntrTypeID: TBCDField;
    PkCntrTypeNAME: TStringField;
    PkCntrTypeEPLANT_ID: TBCDField;
    Tbl_Work_CenterEXCLUDE_PM: TStringField;
    Tbl_Work_CenterSTAGING_HRS: TFMTBCDField;
    QryWorkCenterDownCode: TFDQuery;
    SrcWorkCenterDownCode: TDataSource;
    QryWorkCenterDownCodeID: TBCDField;
    QryWorkCenterDownCodeWORK_CENTER_ID: TBCDField;
    QryWorkCenterDownCodeDOWN_CODE: TStringField;
    QryWorkCenterDownCodeSEQ: TBCDField;
    QryWorkCenterDownCodeDescrip: TStringField;
    UpdateSQLDownCode: TFDUpdateSQL;
    PkDownCode: TIQWebHPick;
    PkDownCodeDOWN_CODE: TStringField;
    PkDownCodeDOWN_DESCRIP: TStringField;
    PkDownCodeEPLANT_ID: TBCDField;
    PkDownCodePK_HIDE: TStringField;
    Tbl_Work_CenterPICKUP_PACKAGES: TBCDField;
    Tbl_Work_CenterPICKUP_PALLETS: TBCDField;
    Tbl_Work_CenterTRANS_PRIORITY: TBCDField;
    Tbl_Work_CenterTREATMENT_CUBE_CAPACITY: TFMTBCDField;
    FDUpdateSQL_RT_Address: TFDUpdateSQL;
    TblRT_AddressADDRESS: TStringField;
    TblRT_AddressBOARD_POSITION: TStringField;
    TblRT_AddressIS_VIRTUAL: TStringField;
    TblRT_AddressDESCRIP: TStringField;
    FDUpdateSQL_WorkCenterElem: TFDUpdateSQL;
    TblWorkCenterElemDESCRIPTION: TStringField;
    PkElements: TIQWebHPick;
    PkElementsID: TBCDField;
    PkElementsELEM_DESCRIP: TStringField;
    PkElementsELEM_TYPE: TStringField;
    PkElementsGLACCT_ID: TBCDField;
    wwTblMfgType1ID: TBCDField;
    procedure Tbl_Work_CenterBeforeCancel(DataSet: TDataSet);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure HandleError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Tbl_Work_CenterBeforePost(DataSet: TDataSet);
    procedure PkWorkCntrIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure Tbl_Work_CenterNewRecord(DataSet: TDataSet);
    procedure TblWorkCenterElemAfterPost(DataSet: TDataSet);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure Tbl_Work_CenterFLOOR_BACKFLUSHValidate(Sender: TField);
    procedure Tbl_Work_CenterBeforeOpen(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryChildWorkCenterNewRecord(DataSet: TDataSet);
    procedure QryChildWorkCenterBeforePost(DataSet: TDataSet);
    procedure Tbl_Work_CenterBeforeDelete(DataSet: TDataSet);
    procedure PostParentVirtualWorkCenterBeforeEdit(DataSet: TDataSet);
    procedure Tbl_Work_CenterCalcFields(DataSet: TDataSet);
    procedure TblWork_Center_RejectCodeCalcFields(DataSet: TDataSet);
    procedure Tbl_Work_CenterFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure PkRejectCodeBeforeOpen(DataSet: TDataSet);
    procedure PkCntrTypeIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure QryWorkCenterDownCodeCalcFields(DataSet: TDataSet);
    procedure QryWorkCenterDownCodeBeforePost(DataSet: TDataSet);
    procedure QryWorkCenterDownCodeNewRecord(DataSet: TDataSet);
    procedure TblWorkCenterElemBeforeOpen(DataSet: TDataSet);
    procedure TblWorkCenterElemNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SyncWithPMEQMT(DataSet: TDataSet);
    procedure CalculateSTDCost;
    procedure AssignStdTotalCost;
    procedure CheckRTServerPrefix;
    procedure CheckNoAssociatedChildrenFound(AWork_Center_ID: Real);
    procedure AssignMfgType;
    procedure CheckPromptUpdateCntrTypeSystemWide(AOldCntrType,
      ANewCntrType: string; AWork_Center_ID: Real);
    function IsCenterTypeChanged(var AOldCntrType: string): Boolean;
    function NeedsToBeSyncFromMasterCntrType: Boolean;
  public
    { Public declarations }
    FStdCostTotal: Real;
    FFixedCostTotal: Real;
    FOldCntrType: string;
    class function EnsureAssociatedPmEqmtExists(AEqNo,
      ACntr_Desc: string): Real;
    class procedure EnsureCenterTypeEplantCombinationExists(ACntr_Type: string;
      AEPlant_ID: Real);
    class procedure CheckExtraConnectionToRTServerExceedsRTLicense
      (AWork_Center_ID: Real);
    function SelectWorkCenterCostElement: Boolean;
  end;

var
  DM_WC: TDM_WC;

implementation

{$R *.DFM}


uses
  IQMS.Common.Applications,
  IQMS.Common.DataLib,
  IQMS.Common.License,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.MfgShare,
  qk_add_cntr_type,
  IQMS.Common.QuickAddBase,
  RTtypes,
  { TODO -oathite -cWebConvert : Dependent on src_wrkc
  src_wrkc, }
  System.Variants,
  wc_confirm_center_type_change,
  wc_sec_conf_exceed_rt_lic,
  wc_select_mfgtype,
  workcntr_rscstr;

procedure TDM_WC.Tbl_Work_CenterBeforeCancel(DataSet: TDataSet);
begin
  //if MessageDlg('Are you sure you want to Cancel?', mtWarning, [mbYes, mbNo ], 0 ) = mrNo then
  //ABORT;
end;

procedure TDM_WC.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); //in IQLib
end;

procedure TDM_WC.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit(DataSet);
end;

procedure TDM_WC.HandleError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action := daAbort;
  IQHandleDBEngineError(DataSet, E);
end;

procedure TDM_WC.Tbl_Work_CenterBeforePost(DataSet: TDataSet);
var
  AOldCntrType: string;
begin
  IQAssignIDBeforePost(DataSet); //in IQLib

  //09-17-2010 because of logical work center support we need to keep the eqno at bay. The reason
  //is when we clone the physical parent to create a logical machine we format the eqno as eqno-frame#-seq
  if Tbl_Work_CenterFRAME_SET_ID.asFloat = 0 then
  begin
    IQAssert(Length(Trim(Tbl_Work_CenterEQNO.asString)) <= 25,
      'Work Center # must not exceed 25 chars');
    IQAssert(Length(Trim(Tbl_Work_CenterCNTR_DESC.asString)) <= 100,
      'Work Center Description must not exceed 100 chars');
  end;

  with Tbl_Work_CenterCNTR_TYPE do
    if asString = '' then
      raise Exception.CreateFmt
        (workcntr_rscstr.cTXT0000017 { 'Field %s must have value' } ,
        [DisplayLabel]);

  Tbl_Work_CenterFLOOR_BACKFLUSHValidate(nil);
  //if (Tbl_Work_CenterRTSERVER_NOT_SIGNALED.asString <> 'Y') and (Tbl_Work_CenterFLOOR_BACKFLUSH.asString = 'Y') then
  //raise Exception.Create('RT Server must not be signaled in order to turn Floor Backflush On');

  if (Tbl_Work_CenterPK_HIDE.asString = 'Y') and
    (SelectValueByID('pk_hide', 'work_center', Tbl_Work_CenterID.asFloat) <>
    'Y') and
    (SelectValueFmtAsFloat('select 1 from cntr_sched where work_center_id = %f',
    [Tbl_Work_CenterID.asFloat]) = 1) then
    raise Exception.Create
      (workcntr_rscstr.
      cTXT0000023 { 'Failed to toggle work center to "Inactive" - unschedule everything from the work center and try again' } );

  CheckRTServerPrefix;
  SyncWithPMEQMT(Tbl_Work_Center);

  if Tbl_Work_CenterIS_VIRTUAL.asString <> 'Y' then
    CheckNoAssociatedChildrenFound(Tbl_Work_CenterID.asFloat);

  if Tbl_Work_CenterCONNECTED_STATUS_INDICATOR.asString = 'Y' then
  begin
    IQAssert(Tbl_Work_CenterRT_ADDRESS_OUT.asFloat > 0,
      'Wireless LightStick Address must be entered');

    if Tbl_Work_CenterIS_DEDICATED_LIGHTSTICK_PORT.asString = 'Y' then
    begin
      IQAssert(StrInList(Tbl_Work_CenterLIGHTSTICK_OUTPUT_TYPE.asString,
        ['0', '1']),
        'LightStick Dedicated Output Device Type must be selected');

      if Tbl_Work_CenterLIGHTSTICK_OUTPUT_TYPE.asString = '0' then
        IQAssert(Tbl_Work_CenterLIGHTSTICK_COM_PORT.asFloat > 0,
          'LightStick Dedicated Serial COM Port must be specified');

      if Tbl_Work_CenterLIGHTSTICK_OUTPUT_TYPE.asString = '1' then
      begin
        IQAssert(Tbl_Work_CenterLIGHTSTICK_CLIENT_IP.asString > '',
          'LightStick Dedicated Client IP address must be entered');
        IQAssert(Tbl_Work_CenterLIGHTSTICK_HOST_IP.asString > '',
          'LightStick Dedicated Host IP address must be entered');
      end;
    end;
  end;

  if Tbl_Work_CenterCONNECTED_STATUS_INDICATOR.asString <> 'Y' then
    Tbl_Work_CenterIS_DEDICATED_LIGHTSTICK_PORT.asString := 'N';

  if Tbl_Work_CenterIS_DEDICATED_LIGHTSTICK_PORT.asString <> 'Y' then
    Tbl_Work_CenterLIGHTSTICK_OUTPUT_TYPE.Clear;

  if Tbl_Work_CenterLIGHTSTICK_OUTPUT_TYPE.asString = '' then
  begin
    Tbl_Work_CenterLIGHTSTICK_COM_PORT.Clear;
    Tbl_Work_CenterLIGHTSTICK_CLIENT_IP.Clear;
    Tbl_Work_CenterLIGHTSTICK_HOST_IP.Clear;
  end;

  if (Tbl_Work_CenterIS_RT.asString = 'Y') and
    (SelectValueByID('is_rt', 'work_center', Tbl_Work_CenterID.asFloat) <> 'Y')
  then
    try
      TDM_WC.CheckExtraConnectionToRTServerExceedsRTLicense
        (Tbl_Work_CenterID.asFloat);
    except
      on E: EAbort do
      begin
        Tbl_Work_CenterIS_RT.Clear;
        raise;
      end;
    end;

  if Tbl_Work_CenterLookup_Mfgtype.asString <> 'OUTSOURCE' then
    EnsureCenterTypeEplantCombinationExists
      (Trim(Tbl_Work_CenterCNTR_TYPE.asString),
      Tbl_Work_CenterEPLANT_ID.asFloat);

  if (Tbl_Work_Center.State = dsEdit) and IsCenterTypeChanged(AOldCntrType) then
    CheckPromptUpdateCntrTypeSystemWide(AOldCntrType,
      Trim(Tbl_Work_CenterCNTR_TYPE.asString), Tbl_Work_CenterID.asFloat);
  { TODO -oathite -cWebConvert : Dependent on src_wrkc
  if NeedsToBeSyncFromMasterCntrType() then
    PostMessage(TFrmWorkCenter(Owner).Handle, iq_notify,
      NOTIFY_SYNC_FROM_CNTR_TYPE, Trunc(Tbl_Work_CenterID.asFloat));
  }
end;

function TDM_WC.IsCenterTypeChanged(var AOldCntrType: string): Boolean;
begin
  AOldCntrType := Trim(SelectValueByID('cntr_type', 'work_center',
    Tbl_Work_CenterID.asFloat));
  Result := Trim(Tbl_Work_CenterCNTR_TYPE.asString) <> AOldCntrType;
end;

function TDM_WC.NeedsToBeSyncFromMasterCntrType: Boolean;
var
  A: Variant;
begin
  Result := FALSE;

  if (Tbl_Work_Center.State = dsInsert) and
    (Tbl_Work_CenterUSE_DEFAULT_CNTR_TYPE.asString = 'Y') then
  begin
    Result := TRUE;
    EXIT;
  end;

  if Tbl_Work_CenterUSE_DEFAULT_CNTR_TYPE.asString <> 'Y' then
    EXIT;

  A := SelectValueArrayFmt
    ('select rtrim(cntr_type), use_default_cntr_type from work_center where id = %f',
    [Tbl_Work_CenterID.asFloat]);
  if VarArrayDimCount(A) = 0 then
    EXIT;

  Result := (Trim(Tbl_Work_CenterCNTR_TYPE.asString) <> A[0]) or
    ((Tbl_Work_CenterUSE_DEFAULT_CNTR_TYPE.asString = 'Y') and (A[1] <> 'Y'));
end;

procedure TDM_WC.CheckRTServerPrefix;
var
  ART_Addr: string;
  APrefix: string;
begin
  ART_Addr :=
    Trim(SelectValueFmtAsString
    ('select rt_address from illum_rt where work_center_id = %f',
    [Tbl_Work_CenterID.asFloat]));
  APrefix := Tbl_Work_CenterRTSERVER_PREFIX.asString;

  if (ART_Addr > '') and (APrefix > '') then
    if Copy(ART_Addr, 1, Length(APrefix)) <> APrefix then
      { 'Work Center, %s, is assigned RT Server Prefix, %s.'#13+
        'This prefix does not match RT Address %s, ' +
        'which may prevent the system from matching %s to the DART Work Center name.' }
      IQWarning(Format(workcntr_rscstr.cTXT0000018,
        [Tbl_Work_CenterEQNO.asString, APrefix, ART_Addr, ART_Addr]));
end;

procedure TDM_WC.SyncWithPMEQMT(DataSet: TDataSet);
var
  ID: Real;
  AOldExcludePM: Boolean;
  ANewExcludePM: Boolean;
  S: string;

  procedure Ensure_PMEQMT_IsReset;
  begin
    if DataSet.FieldByName('PMEQMT_ID').asFloat = 0 then
      EXIT;
    { TODO -oathite -cWebConvert : Dependent on src_wrkc
    PostMessage(TFrmWorkCenter(Owner).Handle, iq_notify, 0,
      DataSet.FieldByName('PMEQMT_ID').asInteger);  }
    DataSet.FieldByName('PMEQMT_ID').Clear;
  end;

begin
  with SecurityManager do
    if not SetVisibleIfLicensed(nil { speedbtn } , nil { MenuOption } ,
      nil { Separator } , IQAppsNames[apPM], nil) then
      EXIT;

  if DataSet.FieldByName('is_virtual').asString = 'Y' then
  begin
    Ensure_PMEQMT_IsReset;
    EXIT;
  end;

  //11-01-2012 exclude from pm - confirm toggle
  if (DataSet.FindField('EXCLUDE_PM') <> nil) then
  begin
    AOldExcludePM := SelectValueByID('EXCLUDE_PM', 'work_center',
      DataSet.FieldByName('ID').asFloat) = 'Y';
    ANewExcludePM := DataSet.FieldByName('EXCLUDE_PM').asString = 'Y';
    S := '';

    if ANewExcludePM and not AOldExcludePM then
      S := 'This work center will not be associated with MRO - are you sure you want to continue?'

    else if not ANewExcludePM and AOldExcludePM then
      S := 'About to associate this work center with MRO - are you sure you want to continue?';

    //Confirm the toggle
    if (S <> '') and not IQConfirmYN(S) then
      System.SysUtils.Abort;

    //if need to exclude MRO then reset and get out otherwise continue on to update/append pmeqmt
    if ANewExcludePM then
    begin
      Ensure_PMEQMT_IsReset;
      EXIT;
    end;

  end;

  if DataSet.FieldByName('PMEQMT_ID').asFloat > 0 then
  begin
    ExecuteCommandFmt
      ('update pmeqmt set eqno = ''%s'' where id = %f and eqno <> ''%s'' ',
      [FixStr(DataSet.FieldByName('EQNO').asString),
      DataSet.FieldByName('PMEQMT_ID').asFloat,
      FixStr(DataSet.FieldByName('EQNO').asString)]);
    EXIT;
  end;

  ID := EnsureAssociatedPmEqmtExists(DataSet.FieldByName('EQNO').asString,
    DataSet.FieldByName('CNTR_DESC').asString);

  if not (DataSet.State in [dsEdit, dsInsert]) then
    DataSet.Edit;
  DataSet.FieldByName('PMEQMT_ID').asFloat := ID;
end;

class function TDM_WC.EnsureAssociatedPmEqmtExists(AEqNo,
  ACntr_Desc: string): Real;
begin
  Result := SelectValueFmtAsFloat
    ('select id from pmeqmt where class = ''%s'' and eqno = ''%s''',
    ['MT', FixStr(AEqNo)]);
  if Result = 0 then
  begin
    Result := GetNextID('PMEQMT');
    ExecuteCommandFmt
      ('insert into pmeqmt (id, class, eqno, descrip) values( %f, ''MT'', ''%s'', ''%s'')',
      [Result,
      FixStr(AEqNo),
      FixStr(ACntr_Desc)]);
  end;
end;

procedure TDM_WC.PkWorkCntrIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action := mrOK;
  ResultValue := 0;
  { TODO -oathite -cWebConvert : Dependent on src_wrkc
  PostMessage(TFrmWorkCenter(Owner).Handle, wm_Command,
    TFrmWorkCenter(Owner).Add1.Command, 0); }
end;

procedure TDM_WC.Tbl_Work_CenterNewRecord(DataSet: TDataSet);
begin
  Tbl_Work_CenterID.AsLargeInt := GetNextID('WORK_CENTER');
  { TODO -oathite -cWebConvert : Dependent on src_wrkc
  TFrmWorkCenter(Owner).Caption := workcntr_rscstr.cTXT0000019;
  //'New Work Center'
  AssignMfgType;
  TFrmWorkCenter(Owner).ShowChangeOverTabBasedOnMfgType();  }
  if SecurityManager.EPlant_ID_AsInteger > 0 then
    Tbl_Work_CenterEPLANT_ID.AsLargeInt := SecurityManager.EPlant_ID_AsInteger;
end;

procedure TDM_WC.AssignMfgType;
var
  MfgCellRecord: TCellMfgType; //RTtypes.pas
begin
  if not (Tbl_Work_Center.State in [dsEdit, dsInsert]) then
    Tbl_Work_Center.Edit;

  if TFrmWorkCenterSelectMfgType.Execute(MfgCellRecord) then
  //wc_select_mfgtype.pas
  begin
    Tbl_Work_CenterMFG_TYPE.asString := MfgCellRecord.MfgType;
    Tbl_Work_CenterMFGCELL.asString := MfgCellRecord.Cell;
    if MfgCellRecord.MfgCell_ID > 0 then
      Tbl_Work_CenterMFGCELL_ID.asFloat := MfgCellRecord.MfgCell_ID
    else
      Tbl_Work_CenterMFGCELL_ID.Clear;
  end
  else
    Abort;
end;

procedure TDM_WC.TblWorkCenterElemAfterPost(DataSet: TDataSet);
begin
  CalculateSTDCost;
  AssignStdTotalCost;
  //update the work center form's group box
  { TODO -oathite -cWebConvert : Dependent on src_wrkc
  if (Owner is TFrmWorkCenter) then
    with (Owner as TFrmWorkCenter) do
      UpdateCenterCostLabel;   }
end;

procedure TDM_WC.TblWorkCenterElemBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', Tbl_Work_CenterID.AsLargeInt);
end;

procedure TDM_WC.TblWorkCenterElemNewRecord(DataSet: TDataSet);
begin
  if not SelectWorkCenterCostElement then
    System.SysUtils.Abort;
end;

function TDM_WC.SelectWorkCenterCostElement: Boolean;
begin
  Result := FALSE;
  with PkElements do
    if Execute then
    begin
      Result := TRUE;
      TblWorkCenterElemID.AsLargeInt := GetNextID('WORK_CENTER_ELEMENTS');
      TblWorkCenterElemWORK_CENTER_ID.AsLargeInt :=
        Tbl_Work_CenterID.AsLargeInt;
      TblWorkCenterElemELEMENTS_ID.AsLargeInt :=
        System.Variants.VarAsType(GetValue('ID'), varInt64);
      ForceValue(SrcWorkCenterElem, TblWorkCenterElemDESCRIPTION,
        System.Variants.VarToStr(GetValue('ELEM_DESCRIP')));
    end;
end;

procedure TDM_WC.CalculateSTDCost;
var
  A: Variant;
begin
  FStdCostTotal := 0;
  FFixedCostTotal := 0;

  A := SelectValueArrayFmt
    ('select sum(std_cost), sum(fixed_std_cost) from work_center_elements where work_center_id = %f',
    [Tbl_Work_CenterID.asFloat]);
  if VarArrayDimCount(A) = 0 then
    EXIT;

  FStdCostTotal := A[0];
  FFixedCostTotal := A[1];
end;

procedure TDM_WC.AssignStdTotalCost;
var
  SaveState: TDataSetState;
begin
  with Tbl_Work_Center do
    try
      SaveState := State;
      if not (State in [dsEdit, dsInsert]) then
        Edit;
      Tbl_Work_CenterCNTR_COST.asFloat := FStdCostTotal;
      Tbl_Work_CenterFIXED_CNTR_COST.asFloat := FFixedCostTotal;

      if SaveState = dsBrowse then
        Post;
    except
      if (SaveState = dsBrowse) then
        Cancel;
      raise;
    end;
end;

procedure TDM_WC.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet); { pas }
end;

procedure TDM_WC.Tbl_Work_CenterFLOOR_BACKFLUSHValidate(Sender: TField);
begin
  if (Tbl_Work_CenterRTSERVER_NOT_SIGNALED.asString <> 'Y') and
    (Tbl_Work_CenterFLOOR_BACKFLUSH.asString = 'Y') then
  begin
    Tbl_Work_CenterFLOOR_BACKFLUSH.asString := 'N';
    { TODO -oathite -cWebConvert : Dependent on src_wrkc
    TFrmWorkCenter(Owner).chkFloorDispo.Checked := FALSE; }
    raise Exception.Create
      (workcntr_rscstr.
      cTXT0000020 { 'RT Server must not be signaled in order to turn Floor Backflush on.' } );
  end;
end;

procedure TDM_WC.Tbl_Work_CenterBeforeOpen(DataSet: TDataSet);
begin
  AssignEPlantFilter(DataSet);
end;

procedure TDM_WC.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TDM_WC.QryWorkCenterDownCodeBeforePost(DataSet: TDataSet);
begin
  IQAssert(QryWorkCenterDownCodeDOWN_CODE.asString > '',
    'Downtime code must be entered - operation aborted');
  IQAssignIDBeforePost(DataSet, 'WORK_CENTER_DOWN_CODE');
end;

procedure TDM_WC.QryWorkCenterDownCodeCalcFields(DataSet: TDataSet);
begin
  if QryWorkCenterDownCodeDOWN_CODE.asString > '' then
    QryWorkCenterDownCodeDescrip.asString :=
      SelectValueFmtAsString
      ('select down_descrip from down_code where rtrim(down_code) = ''%s''',
      [QryWorkCenterDownCodeDOWN_CODE.asString]);
end;

procedure TDM_WC.QryWorkCenterDownCodeNewRecord(DataSet: TDataSet);
begin
  QryWorkCenterDownCodeID.AsLargeInt :=
    GetNextID('WORK_CENTER_DOWN_CODE');
  QryWorkCenterDownCodeWORK_CENTER_ID.asFloat := Tbl_Work_CenterID.asFloat;
  QryWorkCenterDownCodeSEQ.asFloat := 1 + SelectValueFmtAsFloat
    ('select max(seq) from work_center_down_code where work_center_id = %f',
    [Tbl_Work_CenterID.asFloat]);
end;

procedure TDM_WC.QryChildWorkCenterNewRecord(DataSet: TDataSet);
begin
  QryChildWorkCenterPARENT_ID.AsLargeInt := Tbl_Work_CenterID.AsLargeInt;
  QryChildWorkCenterPK_HIDE.asString := 'Y';
end;

procedure TDM_WC.QryChildWorkCenterBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'WORK_CENTER');
  SyncWithPMEQMT(DataSet);
end;

procedure TDM_WC.CheckNoAssociatedChildrenFound(AWork_Center_ID: Real);
begin
  try
    //workcntr_rscstr.cTXT0000045 =
    //'This is a virtual work center with associated work centers.  Operation aborted.';
    IQAssert(
      SelectValueFmtAsFloat(
      'select 1 from work_center where parent_id = %f and rownum < 2',
      [AWork_Center_ID]) = 0,
      workcntr_rscstr.cTXT0000045);
  except
    if Tbl_Work_Center.State in [dsEdit, dsInsert] then
      Tbl_Work_Center.Cancel;
    raise;
  end;
end;

procedure TDM_WC.Tbl_Work_CenterBeforeDelete(DataSet: TDataSet);
begin
  CheckNoAssociatedChildrenFound(Tbl_Work_CenterID.asFloat);
end;

procedure TDM_WC.PostParentVirtualWorkCenterBeforeEdit(DataSet: TDataSet);
begin
  Tbl_Work_Center.CheckBrowseMode;
end;

procedure TDM_WC.Tbl_Work_CenterCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  Tbl_Work_CenterLookup_Mfgtype.asString :=
    IQMS.Common.MfgShare.lookup_mfgtype(Tbl_Work_CenterMFG_TYPE.asString);

  if Tbl_Work_CenterFRAME_ID.asFloat > 0 then
  begin
    A := SelectValueArrayFmt
      ('select f.frame_no, f.descrip, p.eqno, f.pmeqmt_id from frame f, pmeqmt p where f.id = %f and f.pmeqmt_id = p.id(+)',
      [Tbl_Work_CenterFRAME_ID.asFloat]);
    if VarArrayDimCount(A) > 0 then
    begin
      Tbl_Work_CenterFrameNo.asString := A[0];
      Tbl_Work_CenterFrameDescrip.asString := A[1];
      Tbl_Work_CenterFramePmEqmtNo.asString := A[2];
      Tbl_Work_CenterFramePMEqmt_ID.asFloat := A[3];
    end;
  end;

  if Tbl_Work_CenterFRAME_ARINVT_ID_MAT.asFloat > 0 then
  begin
    A := SelectValueArrayFmt
      ('select itemno, descrip, rev, class from arinvt where id = %f',
      [Tbl_Work_CenterFRAME_ARINVT_ID_MAT.asFloat]);
    if VarArrayDimCount(A) > 0 then
    begin
      Tbl_Work_CenterFrameMatItemNo.asString := A[0];
      Tbl_Work_CenterFrameMatDescrip.asString := A[1];
      Tbl_Work_CenterFrameMatRev.asString := A[2];
      Tbl_Work_CenterFrameMatClass.asString := A[3];
    end;
  end;

  if Tbl_Work_CenterRT_ADDRESS.asString > '' then
    Tbl_Work_CenterRT_Address_Descrip.asString :=
      SelectValueFmtAsString
      ('select descrip from rt_address where address = ''%s''',
      [Tbl_Work_CenterRT_ADDRESS.asString]);
end;

procedure TDM_WC.TblWork_Center_RejectCodeCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if TblWork_Center_RejectCodeREJECT_CODE_ID.asFloat = 0 then
    EXIT;

  A := SelectValueArrayFmt
    ('select reject_code, attribute from reject_code where id = %f',
    [TblWork_Center_RejectCodeREJECT_CODE_ID.asFloat]);
  if VarArrayDimCount(A) = 0 then
    EXIT;

  TblWork_Center_RejectCodeReject_Code_Disp.asString := A[0];
  TblWork_Center_RejectCodeReject_Desc_Disp.asString := A[1];
end;

procedure TDM_WC.Tbl_Work_CenterFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := not StrInList(IQMS.Common.MfgShare.lookup_mfgtype
    (Tbl_Work_CenterMFG_TYPE.asString), ['ASSY2', 'ASSY3', 'COMPLEX']);
  if not Accept then
    EXIT;

  Accept := (Tbl_Work_CenterPARENT_ID.asFloat = 0);
  if Accept then
    EXIT;

  Accept := SelectValueFmtAsFloat
    ('select mfg.work_center_belong_to_complex( %f ) from dual',
    [Tbl_Work_CenterID.asFloat]) = 1;
end;

procedure TDM_WC.PkRejectCodeBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'mfgcell_id',
    Tbl_Work_CenterMFGCELL_ID.AsLargeInt);
end;

procedure TDM_WC.CheckPromptUpdateCntrTypeSystemWide(AOldCntrType,
  ANewCntrType: string; AWork_Center_ID: Real);
begin
  case TFrmWorkCenterConfirmCenterTypeChange.DoShowModal(AWork_Center_ID,
    AOldCntrType, ANewCntrType) of
    //0-abort, 1-continue, 2-continue and update boms/processes. wc_confirm_center_type_change.pas
    0:
      Abort;
    1:
      ; { do nothing }
    2:
      begin
        FOldCntrType := Trim(AOldCntrType);
        { TODO -oathite -cWebConvert : Dependent on src_wrkc
        PostMessage(TFrmWorkCenter(Owner).Handle, iq_notify,
          NOTIFY_UPDATE_CNTR_TYPE, Trunc(AWork_Center_ID)); }
      end;
  end;
end;

procedure TDM_WC.PkCntrTypeIQModify(Sender: TObject; var Action: TModalResult;
  var ResultValue: Variant);
var
  AID: Variant;
  ID: Real;
begin
  inherited; { nothing }
  Action := DoQuickAppend(TQuickAddCntrType, AID);
  //IQMS.Common.QuickAddBase.pas, qk_add_cntr_type.pas
  if Action = mrOK then
  begin
    ID := AID;
    ResultValue := SelectValueFmtAsString
      ('select name from cntr_type where id = %f', [ID]);
  end;
end;

class procedure TDM_WC.EnsureCenterTypeEplantCombinationExists
  (ACntr_Type: string; AEPlant_ID: Real);
begin
  ACntr_Type := FixStr(ACntr_Type);

  if SelectValueFmtAsFloat
    ('select 1 from cntr_type where name = ''%s'' and nvl(eplant_id,0) = %f',
    [ACntr_Type, AEPlant_ID]) = 1 then
    EXIT;

  ExecuteCommandFmt('insert into cntr_type    ' +
    '     ( name, eplant_id ) ' +
    'values                   ' +
    '     ( ''%s'',           ' +
    '       %f )              ',
    [ACntr_Type,
    AEPlant_ID]);

  IQInformation
    (Format('Master Center Type was added the combination representing center type = ''%s'' and eplant_id = %s',
    [ACntr_Type,
    IQMS.Common.StringUtils.FloatToStr0asNull(AEPlant_ID, 'null')]));
end;

class procedure TDM_WC.CheckExtraConnectionToRTServerExceedsRTLicense
  (AWork_Center_ID: Real);
var
  RTLic, RTCount: Real;
begin
  RTCount := RT_Illum_RT_Count; { IQMS.Common.License.pas }
  RTLic := RT_Licensed_Count; { IQMS.Common.License.pas }

  if RTCount + 1 { note 1 extra! } > RTLic then
    if TFrmSecConfExceedRTLic.DoShowModal <> mrYes then
      //wc_sec_conf_exceed_rt_lic.pas
      Abort
end;

end.
