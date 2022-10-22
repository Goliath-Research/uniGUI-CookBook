unit spc;

(* *** SPC ***
  *
  *  This unit provides wrappers for SPC.  It can safely be declared in any
  *  application unit.  All wrappers execute a screen through COM.
  *
*)

{ *** History ***

  02/18/2009
  Remmed the lines that hide/show the
  iqcomsrv.IQComSrvList.HidePleaseWaitMessage.
  Although it is desirable to hide the ugly "please wait" message, if the
  application is called from SmartPage, then for some reason (I never
  determined why) it will cause the application to terminate.  In effect,
  the screen will flash momentarily and disappear.
}

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  spc_rscstr,
  FireDAC.Comp.Client;

{$REGION 'Quick Inspection'}


type
  TQuickInspectionSource = (qiUnknown, qiPLM, qiInventory, qiProcess, qiWorkCenter,
    qiPMEqmt, qiEngineeringQuote, qiCRMOpportunity);

  TQuickInspectionParams = packed record
    UserName: string; // Quick Inspection User login name (if known)
    EmployeeID: Int64; // Quick Inspection Employee ID (if known)
    FGLotNo: string;
    SNDOPClass: string;
    // SNDOP Class Filter (if "Processes" is the selected source)
    MFGTypeFilter: string; // For Process Work Orders, filter by MFG Type
    MFGNo: string;
    Cavity: string;

    WORKORDER_ID: Int64; // WorkOrderID
    PO_RECEIPTS_ID: Int64; // POReceiptsID
    PMEQMT_ID: Int64;
    WORKCENTER_ID: Int64;
    STANDARD_ID: Int64;
    FGMULTI_ID: Int64; // Used for Non-Conform Inventory

    // Optional
    Population: Integer;
  end;

const
  QuickInspectionSource: array [TQuickInspectionSource] of string =
    ('', 'ARINVT', 'PLM', 'SNDOP', 'WORK_CENTER', 'PMEQMT', 'QINVT',
    'CRM_OPPORTUNITY');

{$ENDREGION 'Quick Inspection'}

{$REGION 'SPC Source'}


type
  { TSPCSourceType }
  TSPCSourceType = (spcUnknown, spcInventory, spcPLM, spcProcess, spcWorkCenter,
    spcPMEqmt, spcEngineeringQuote, spcCRMOpportunity);

  { TSPCSourceKind }
  TSPCSourceKind = (spkUnknown, spkNonConform, spkAKABuying, spkAKASelling);

  { TScheduleOption }
  TScheduleOption = (scoUnknown, scoRunning, scoScheduled, scoAll);

  { TSPCSource }
  TSPCSource = class
  private
    FSource: TSPCSourceType;
    FKind: TSPCSourceKind;
    FSourceID: Int64;
    FScheduleOption: TScheduleOption;
    function GetSourceTable: string;
    procedure SetKind(const Value: TSPCSourceKind);
    procedure SetSource(const Value: TSPCSourceType);
    procedure SetSourceTable(const Value: string);
  public
    constructor Create;
    function QuickInspectionSource: TQuickInspectionSource;
    procedure Clear;
  published
    property Source: TSPCSourceType read FSource write SetSource;
    property Kind: TSPCSourceKind read FKind write SetKind;
    property ScheduleOption: TScheduleOption read FScheduleOption
      write FScheduleOption;
    property SourceID: Int64 read FSourceID write FSourceID;
    property SourceTableName: string read GetSourceTable write SetSourceTable;
  end;

const
  SPCSourceTable: array [TSPCSourceType] of string =
    ('', 'ARINVT', 'PLM', 'SNDOP', 'WORK_CENTER', 'PMEQMT', 'QINVT',
    'CRM_OPPORTUNITY');
  SPCSourceDisplayName: array [TSPCSourceType] of string =
    ('',
    spc_rscstr.cTXT000000027 { 'Master Inventory' } ,
    spc_rscstr.cTXT000000290 { 'PLM/DHR Items' } ,
    spc_rscstr.cTXT000000028 { 'Processes' } ,
    spc_rscstr.cTXT000000029 { 'Work Centers' } ,
    spc_rscstr.cTXT000000802 { 'Tooling/MRO' } ,
    spc_rscstr.cTXT000000820 { 'Engineering Quote Inventory' } ,
    spc_rscstr.cTXT000000818 { 'CRM Opportunity' }
    );

{$ENDREGION 'SPC Source'}

{$REGION 'Data Group and Sample Types'}


type
  // Sample type takes its value from the table field, SAMPLETYPE.
  TSampleType = (stSubgroup, stIndividuals);

  { Data Group Type is indicated by a couple of things.  First, the switch
    set at the data group level (SPC_SUBGROUP.SAMPLETYPE) tells whether
    the data group is Subgroup (0), or Individuals (1).  But if the
    parameter has been flagged in Inspection Setup as an Attribute
    (SPC_DIMENSION.ISATTRIBUTE), then we must treat the data as
    attribute data, regardless of wether the data group represents
    subgroups or individuals. }
  TDataGroupType = (dgtUnknown, dgtSubgroup, dgtIndividuals, dgtAttribute);
  TSpecLimit = (slLower, slTarget, slUpper);
  TSpecLimits = set of TSpecLimit;

  // 08/20/2014 SPC Parameter Data Type
  TParameterDataType = (pdtUnknown, pdtVariable, pdtAttribute, pdtDateTime,
    pdtText, pdtNumeric, pdtUserDefinedList, pdtImage, pdtCofCLotDocument);

const
  ParameterDataTypeName: array [TParameterDataType] of string =
    ('',
    'Variable',
    'Attribute',
    'Date',
    'Text',
    'Numeric',
    'User-Defined List',
    'Image',
    'CofC Lot Document');

  StatisticalDataTypes = [pdtVariable, pdtAttribute];
  NonStatisticalDataTypes = [pdtDateTime, pdtText, pdtNumeric,
    pdtUserDefinedList, pdtImage, pdtCofCLotDocument];

{$ENDREGION 'Data Group and Sample Types'}

{$REGION 'Charting Types'}


type
  { TControlLimitType }
  TControlLimitType = (clpUknown, clpLower, clpTarget, clpUpper);

  { TControlLimitFormat }
  TControlLimitFormat = (clfCalculated, clfZones);

  { TUserDefinedControlLimit }
  { Used by chart event when updating user-defined control limits. }
  TUserDefinedControlLimit = (udclUknown, udclLSL, udclTarget, udclUSL,
    udclUCLx, udclCLx, udclLCLx, udclLCLr, udclRBar, udclUCLr, udclLCLp,
    udclPBar, udclUCLp, udclLCLnp, udclNPBar, udclUCLnp);

  { TSPCChartType }
  TSPCChartType = (ctUnknown, ctXChart, ctMRChart, ctRChart, ctHistogram,
    ctNPChart, ctPChart, ctTrend, ctXBarChart);

  { TBottomAxisStyle }
  TBottomAxisStyle = (basSubgroupNumber, basSequential, basSubgroupTime,
    basSubgroupDateTime);

{$ENDREGION 'Charting Types'}

{$REGION 'Gage Study Types'}
  { TConfidencePercentile }
  TConfidencePercentile = (cp80, cp90, cp95, cp98, cp99, cp995);

  { TBiasStatus }
  TBiasStatus = (bsIncomplete, bsFail, bsPass);

  { TGageBiasFilter }
  TGageBiasFilter = packed record
    StartDate: TDateTime;
    EndDate: TDateTime;
    AllDates: Boolean;
    ArcustoID: Int64;
    ArinvtID: Int64;
    SPCDimensionID: Int64;
    OperatorID: Int64;
  end;

const
  ConfidencePercentileStr: array [TConfidencePercentile] of string = ('80 %',
    '90 %', '95 %', '98 %', '99 %', '99.5 %');
  ConfidencePercentileFloat: array [TConfidencePercentile] of Real = (0.20,
    0.10, 0.05, 0.02, 0.01, 0.005);
  // Z score
  ConfidenceZScore: array [TConfidencePercentile] of Real = (1.282, 1.645,
    1.960, 2.326, 2.575, 3.290);
  ControlLimitFormatStr: array [TControlLimitFormat] of string =
    ('Calculated', 'Zones');

function GetDefaultConfidencePercentile: TConfidencePercentile;
function GetDefaultConfidenceInterval: Integer;

{$ENDREGION 'Gage Study Types'}

{$REGION 'Inspection Record'}


type
  { TInspectionRec }
  TInspectionRec = record
    Source: string;
    SourceKind: TSPCSourceKind;
    SourceID: Int64;
    UserName: string;
    PR_EMP_ID: Int64;
    FGLotNo: string;
    MFGNo: string;
    DEVICE_ID: Int64;
    SPC_INSPECTION_ID: Int64;
    SPC_SUBGROUP_ID: Int64;
    SNDOPClass: string;
    MFGTypeFilter: string; // For Process Work Orders, filter by MFG Type
    WORKORDER_ID: Int64;
    PO_RECEIPTS_ID: Int64;
    Cavity: string;
    PMEQMT_ID: Int64;
    WORKCENTER_ID: Int64;
    FGMULTI_ID: Int64;
    VariableSampleCount: Boolean;
    ConfidencePercentile: TConfidencePercentile;
    ConfidenceInterval: Integer;
    Population: Integer;
    SampleCount: Integer;
    Serial: string;
    Note: string;
    CUser1: string;
    CUser2: string;
    CUser3: string;
  end;

procedure ClearInspectionParams(var rec: TInspectionRec);
procedure CopyInspectionParams(const ASource: TInspectionRec;
  var ATarget: TInspectionRec);

{$ENDREGION 'Inspection Record'}

{$REGION 'Procedure declarations'}
type
  THasSPCParametersProc = reference to function(const ASource: TSPCSourceType;
    const ASourceID: Int64): Boolean;
  THasSPCInspectionGroupsProc = reference to function(const ASource: TSPCSourceType;
    const ASourceID: Int64): Boolean;

{$ENDREGION 'Procedure declarations'}

{$REGION 'Global Wrappers'}
// Returns true if licensed
function IsLicensed_SPC: Boolean;
function IsLicensed_Quality2: Boolean;
// If not licensed, then System.SysUtils.Abort is called.
procedure CheckSPCIsLicensed;
procedure CheckQuality2IsLicensed;

// Examples:
// DoSPC(spc_const.SHOW_SPCMAIN_ARINVT, TblArinvtID.AsFloat); // spc; spc_const
// DoSPC(spc_const.SHOW_SPC_PART_SETUP, TblArinvtID.AsFloat); // spc; spc_const
// ...
procedure DoSPC(AType: Integer; // pass constant from spc_const.pas
  ASourceID: Int64 = 0; // source id value (i.e., ARINVT.ID)
  AUserName: string = '';
  // Quick Inspection User login name (if known)
  APR_EMP_ID: Int64 = 0; // Quick Inspection Employee ID (if known)
  AFGLotNo: string = ''; // FG Lot number
  ASNDOPClass: string = 'OP, FB, AS';
  // SNDOP Class Filter (if "Processes" is the selected source)
  AMFGTypeFilter: string = ''); // Filter Assembly Work Orders

/// <summary> Jump to SPC.  Pass the type constant and the ID that corresponds
/// to that type.  For example, for ARINVT, pass spc_const.SHOW_SPC_PART_SETUP,
/// and the ARINVT.ID for the Jump ID.
/// </summary>
procedure DoJumpToSPC(AType: Integer;
  // pass constant from spc_const.pas
  AJumpID: Int64); // record ID

// SPC (Main)
procedure DoSPCMain;

// Show SPC Quick Inspection
procedure InitQuickInspectionParams(var AQuickInspectionParams
  : TQuickInspectionParams);
procedure DoSPCQuickInspectionEx;
procedure DoSPCQuickInspection
  (const AQuickInspectionSource: TQuickInspectionSource;
  const ASourceID: Int64;
  const AQuickInspectionParams: TQuickInspectionParams;
  const ATouchScreen: Boolean = False);

procedure DoInProcessInspectionLog
  (const AArinvtID: Int64);
procedure DoControlPlan(const AID: Int64 = 0);
procedure DoFMEA(const AMedical: Boolean = False;
  const AID: Int64 = 0);
procedure DoSPCGages(const AID: Int64 = 0);
procedure DoInspectionSetup
  (const AInspectionSource
  : TSPCSourceType = spcUnknown;
  const ASourceID: Int64 = 0);
procedure DoQualityProjects
  (const AID: Int64 = 0);

function CheckShowInspectionSetup
  (const ASource: TSPCSourceType;
  const ASourceID: Int64;
  AHasSPCParametersProc: THasSPCParametersProc;
  AHasSPCInspectionGroupsProc: THasSPCInspectionGroupsProc
  //const ACheckInspectionGroupsExist
  //: Boolean = False
  ): Boolean;
function HasSPCParameters
  (const ASource: TSPCSourceType;
  const ASourceID: Int64): Boolean;
function HasSPCInspectionGroups
  (const ASource: TSPCSourceType;
  const ASourceID: Int64): Boolean;
function SPCSourceFromTable
  (const ATableName: string)
  : TSPCSourceType;
function SPCQuickInspectionSourceFromTable
  (const ATableName: string)
  : TQuickInspectionSource;

function BOMAssociatedMROEquipmentHasSPCInspectionGroups(const AStandardID: Int64): Boolean;
procedure CheckBOMAssociatedMROEquipmentHasSPCInspectionGroups(const AStandardID: Int64);

procedure InsertSubgroup
  (InspectionParams: TInspectionRec;
  var AGroupID: Integer);

procedure ExecuteAutoChart(AArinvtID: Int64);

procedure CalculateSPCSample(const ASPCSampleID: Int64);

{$ENDREGION 'Global Wrappers'}

implementation

uses
  Data.DB,
  MainModule,
  IQMS.Common.Applications,
  IQMS.Common.ApplicationSet,
  IQMS.Common.Controls,
  IQMS.Common.COMExe,
  IQMS.Common.COMServer,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  System.Math,
  panelmsg,
  spc_const,
  spc_expression_eval;
  { TODO -oathite -cWebConvert : Dependent on touchscrn
  touchscrn;  }

// Returns true if SPC is licensed
function IsLicensed_SPC: Boolean;
begin
  Result := (SecurityManager <> nil) and SecurityManager.IsModuleLicensed
    (IQAppsNames[IQMS.Common.Applications.apSPC]);
end;

function IsLicensed_Quality2: Boolean;
begin
  Result := (SecurityManager <> nil) and SecurityManager.IsModuleLicensed
    (IQAppsNames[IQMS.Common.Applications.apIQAPQP]);
end;

// If SPC is not licensed, then System.SysUtils.Abort is called.
procedure CheckSPCIsLicensed;
begin
  if not IsLicensed_SPC then
    System.SysUtils.Abort;
end;

procedure CheckQuality2IsLicensed;
begin
  if not IsLicensed_Quality2 then
    System.SysUtils.Abort;
end;

procedure DoSPC(
  AType: Integer;
  ASourceID: Int64;
  AUserName: string;
  APR_EMP_ID: Int64;
  AFGLotNo: string;
  ASNDOPClass: string;
  AMFGTypeFilter: string);
begin
  Application.ProcessMessages; // allow repaint
  try
    try
      // 02/18/2009 Remmed these lines.  See historical note above.
      // if Assigned(IQMS.Common.COMServer.IQComSrvList) then
      // IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := True;
      IQMS.Common.COMExe.Com_Exec('IQSPC', [AType,
        ASourceID,
        AUserName,
        APR_EMP_ID,
        AFGLotNo,
        ASNDOPClass,
        0, // WORKORDER_ID
        '', // MFGNo
        '', // Cavity
        AMFGTypeFilter]);
    finally
      // 02/18/2009 Remmed these lines.  See historical note above.
      // if Assigned(IQMS.Common.COMServer.IQComSrvList) then
      // IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := False;
    end;
  except
    on E: Exception do // in case Cancel was clicked
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        raise;
  end;
end;

procedure DoJumpToSPC(AType: Integer; // pass constant from spc_const.pas
  AJumpID: Int64); // record ID
begin
  Application.ProcessMessages; // allow repaint
  try
    try
      // 02/18/2009 Remmed these lines.  See historical note above.
      // if Assigned(IQMS.Common.COMServer.IQComSrvList) then
      // IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := True;
      // in IQMS.Common.COMExe.pas;
      IQMS.Common.COMExe.Com_Exec('IQSPC', [AType,
        AJumpID,
        '', { UserName }
        0, { PR_EMP_ID }
        '', { FGLotNo }
        'OP, FB, AS', { SNDOPClass }
        0, // WORKORDER_ID
        '', // MFGNo
        '', // Cavity
        '']); // MFG Type Filter

    finally
      // 02/18/2009 Remmed these lines.  See historical note above.
      // if Assigned(IQMS.Common.COMServer.IQComSrvList) then
      // IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := False;
    end;
  except
    on E: Exception do // in case Cancel was clicked
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        raise;
  end;
end;

procedure DoSPCMain;
begin
  DoSPC(spc_const.SHOW_SPC_SPCMAIN);
end;

procedure InitQuickInspectionParams(var AQuickInspectionParams
  : TQuickInspectionParams);
begin
  ZeroMemory(@AQuickInspectionParams, SizeOf(TQuickInspectionParams));
  AQuickInspectionParams.SNDOPClass := 'OP, FB, AS';
end;

procedure DoSPCQuickInspectionEx;
begin
  DoSPC(spc_const.SHOW_SPCQK);
end;

procedure DoSPCQuickInspection
  (const AQuickInspectionSource: TQuickInspectionSource;
  const ASourceID: Int64;
  const AQuickInspectionParams: TQuickInspectionParams;
  const ATouchScreen: Boolean);
var
  AType: Integer;
  ASNDOP_Class: string;
begin
  Application.ProcessMessages; // allow repaint

  if IsLicensed_SPC then
  begin
    // get the type
    case AQuickInspectionSource of
      qiInventory:
        begin
          AType := IfThen(ATouchScreen, spc_const.SHOW_SPCQK_ARINVT_SD,
            spc_const.SHOW_SPCQK_ARINVT);
          // If we show Inspection Setup instead, then exit.
          if CheckShowInspectionSetup(spcInventory, ASourceID, HasSPCParameters, HasSPCInspectionGroups) then
            Exit;
        end;
      qiProcess:
        begin
          AType := IfThen(ATouchScreen, spc_const.SHOW_SPCQK_SNDOP_SD,
            spc_const.SHOW_SPCQK_SNDOP);
          // If we show Inspection Setup instead, then exit.
          if CheckShowInspectionSetup(spcProcess, ASourceID, HasSPCParameters, HasSPCInspectionGroups) then
            Exit;
        end;
      qiWorkCenter:
        begin
          AType := IfThen(ATouchScreen,
            spc_const.SHOW_SPCQK_WORKCENTER_SD,
            spc_const.SHOW_SPCQK_WORKCENTER);
          // If we show Inspection Setup instead, then exit.
          if CheckShowInspectionSetup(spcWorkCenter, ASourceID, HasSPCParameters, HasSPCInspectionGroups) then
            Exit;
        end;
      qiPMEqmt:
        begin
          AType := IfThen(ATouchScreen,
            spc_const.SHOW_SPCQK_PMEQMT_SD,
            spc_const.SHOW_SPCQK_PMEQMT);
          // If we show Inspection Setup instead, then exit.
          if CheckShowInspectionSetup(spcPMEqmt, ASourceID, HasSPCParameters, HasSPCInspectionGroups) then
            Exit;
        end;
    else
      begin
        AType := IfThen(ATouchScreen, spc_const.SHOW_SPCQK_SD,
          spc_const.SHOW_SPCQK);
      end;
    end;

    // ensure we have a SNDOP class
    ASNDOP_Class := AQuickInspectionParams.SNDOPClass;
    if ASNDOP_Class = '' then
      ASNDOP_Class := 'OP, FB, AS';

    try
      try
        // 02/18/2009 Remmed these lines.  See historical note above.
        // if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        // IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := True;
        IQMS.Common.COMExe.Com_Exec
          ('IQSPC',
          [AType, // 4
          ASourceID, // 5
          AQuickInspectionParams.UserName, // 6
          AQuickInspectionParams.EmployeeID, // 7
          AQuickInspectionParams.FGLotNo, // 8
          ASNDOP_Class, // 9
          AQuickInspectionParams.WORKORDER_ID, // 10
          AQuickInspectionParams.MFGNo, // 11
          AQuickInspectionParams.Cavity, // 12
          AQuickInspectionParams.MFGTypeFilter, // 13
          AQuickInspectionParams.PO_RECEIPTS_ID, // 14
          AQuickInspectionParams.WORKCENTER_ID, // 15
          AQuickInspectionParams.PMEQMT_ID, // 16
          AQuickInspectionParams.FGMULTI_ID, // 17
          AQuickInspectionParams.Population]); // 18
      finally
        // 02/18/2009 Remmed these lines.  See historical note above.
        // if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        // IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := False;
      end;
    except
      on E: Exception do // in case Cancel was clicked
        if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
          raise;
    end;
  end;
end;

procedure DoInProcessInspectionLog(const AArinvtID: Int64);
begin
  // if (AArinvtID > 0) and not
  // CheckShowInspectionSetup(spcInventory, AArinvtID, HasSPCParameters, nil) then
  DoJumpToSPC(spc_const.SHOW_SPC_INPROCLOG, AArinvtID);
end;

procedure DoControlPlan(const AID: Int64 = 0);
begin
  DoJumpToSPC(spc_const.SHOW_CONTROL_PLAN, AID);
end;

procedure DoFMEA(const AMedical: Boolean; const AID: Int64);
begin
  if AMedical then
    DoJumpToSPC(spc_const.SHOW_FMEA_MEDICAL, AID)
  else
    DoJumpToSPC(spc_const.SHOW_FMEA, AID);
end;

procedure DoSPCGages(const AID: Int64 = 0);
begin
  DoJumpToSPC(spc_const.SHOW_SPC_GAGEMNGR, AID);
end;

procedure DoInspectionSetup
  (const AInspectionSource: TSPCSourceType;
  const ASourceID: Int64);
var
  AType: Integer;
begin
  if IsLicensed_SPC then
  begin
    case AInspectionSource of
      spcInventory:
        AType := spc_const.SHOW_SPC_PART_SETUP;
      spcPLM:
        AType := spc_const.SHOW_SPC_PLM_SETUP;
      spcProcess:
        AType := spc_const.SHOW_SPC_SNDOP_SETUP;
      spcWorkCenter:
        AType := spc_const.SHOW_SPC_WORKCENTER_SETUP;
      spcPMEqmt:
        AType := spc_const.SHOW_SPC_PMEQMT_SETUP;
    else
      AType := spc_const.SHOW_SPC_SETUP;
    end;

    DoJumpToSPC(AType, ASourceID);
  end;
end;

procedure DoQualityProjects(const AID: Int64 = 0);
begin
  DoJumpToSPC(spc_const.SHOW_SPC_PROCESS, AID);
end;

function HasSPCParameters(const ASource: TSPCSourceType;
  const ASourceID: Int64): Boolean;
var
  ASourceTableName: string;
begin
  // Initialize the result to False
  Result := False;

  // Get the source table name based on the type
  ASourceTableName := SPCSourceTable[ASource];
  if Length(ASourceTableName) = 0 then
    Exit;

  // To check processes, we only need to look at source.
  // There is no source_id value for processes
  if ASource = spcProcess then
    Result := SelectValueAsInteger(
      'SELECT 1                           '#13 +
      '  FROM spc_dimension               '#13 +
      ' WHERE source = ''SNDOP'' AND      '#13 +
      '       ROWNUM < 2                  ') = 1
    // Standard check for all other sources
  else
    Result := SelectValueFmtAsInteger(
      'SELECT 1                           '#13 +
      '  FROM spc_dimension               '#13 +
      ' WHERE source = ''%s'' AND         '#13 +
      '       source_id = %d AND          '#13 +
      '       ROWNUM < 2                  ',
      [ASourceTableName, ASourceID]) = 1;
end;

function HasSPCInspectionGroups(
  const ASource: TSPCSourceType; const ASourceID: Int64): Boolean;
var
  ASourceTableName: string;
begin
  // Initialize the result to False
  Result := False;

  // Get the source table name based on the type
  ASourceTableName := SPCSourceTable[ASource];
  if Length(ASourceTableName) = 0 then
    Exit;

  // Query the database:  does this source have SPC Inspection Groups?
  // To check processes, we only need to look at source.
  // There is no source_id value for processes
  if ASource = spcProcess then
    Result := SelectValueAsInteger(
      'SELECT 1                                             '#13 +
      '  FROM spc_inspection a                              '#13 +
      ' WHERE a.source = ''SNDOP'' AND                      '#13 +
      '       EXISTS (SELECT 1                              '#13 +
      '                 FROM spc_inspection_detail          '#13 +
      '                WHERE spc_inspection_id = a.id) AND  '#13 +
      '       ROWNUM < 2                                    ') = 1
    // Standard check for all other sources
  else
    Result := SelectValueFmtAsInteger(
      'SELECT 1                                             '#13 +
      '  FROM spc_inspection a                              '#13 +
      ' WHERE a.source = ''%s'' AND                         '#13 +
      '       a.source_id = %d AND                          '#13 +
      '       EXISTS (SELECT 1                              '#13 +
      '                 FROM spc_inspection_detail          '#13 +
      '                WHERE spc_inspection_id = a.id) AND  '#13 +
      '       ROWNUM < 2                                    ',
      [ASourceTableName, ASourceID]) = 1;
end;

procedure CheckBOMAssociatedMROEquipmentHasSPCInspectionGroups(const AStandardID: Int64);
begin
  if (AStandardID > 0) and not BOMAssociatedMROEquipmentHasSPCInspectionGroups(AStandardID) then
   // spc_rscstr.cTXT000000873 =
   // 'None of MRO equipment associated to the BOM have been assigned Inspection Groups.';
   raise Exception.Create(spc_rscstr.cTXT000000873);
end;

function BOMAssociatedMROEquipmentHasSPCInspectionGroups(const AStandardID: Int64): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1                                       '#13 +
    '  FROM standard_pmeqmt a, pmeqmt b             '#13 +
    ' WHERE a.standard_id = %d AND                  '#13 +
    '       b.id = a.pmeqmt_id AND                  '#13 +
    '       EXISTS (SELECT NULL                     '#13 +
    '                 FROM spc_inspection           '#13 +
    '                WHERE source = ''PMEQMT'' AND  '#13 +
    '                      source_id = b.id AND     '#13 +
    '                      ROWNUM < 2)              ',
    [AStandardID]) = 1;
end;

function CheckShowInspectionSetup
  (const ASource: TSPCSourceType;
  const ASourceID: Int64;
  AHasSPCParametersProc: THasSPCParametersProc;
  AHasSPCInspectionGroupsProc: THasSPCInspectionGroupsProc
  //const ACheckInspectionGroupsExist
  //: Boolean = False
  ): Boolean;
var
  AShow: Boolean;
begin
//    02/23/2012 Added as part of "SCR #2380  RT Production Monitoring -> add
//    jump to In-Process Inspection Log."  Requested by Randy.
//
//    Objective of this function (from Randy):
//    "If there is no in-process log setup for the RT Monitoring Item -
//    popup a dialog box asking them if they want to set up the inspection
//    (Inspection Setup).  If they say No – just return to RT. If they
//    say yes – go to inspection setup and add the item# and whatever other
//    info you know to the inspection setup."
//    Function results:
//    True  = yes, inspection setup is required before proceeding.  So,
//    even if the end user decides not to show Inspection Setup,
//    we still need to pass true.
//    False = no, we do not need to show inspection setup; all is well.
//    This means that this source has parameters and/or
//    inspection groups.


  // Initialize the result.  By default, it is false.
  Result := False;
  AShow := False;
  if IsLicensed_SPC and Assigned(AHasSPCParametersProc) then
  begin
    if (ASource = spcUnknown) or (ASourceID = 0) then
      Exit;

    // If the inventory item does not have parameters, then we need to
    // prompt immediately.
    Result := not AHasSPCParametersProc(ASource, ASourceID);

    if Result and not IQMS.Common.ApplicationSet.IsTouchScreen then
    begin
      { spc_rscstr.cTXT000000742 = 'The selected Inventory Item has not been configured ' +
        'for SPC.  Would you like to show Inspection Setup?';
        spc_rscstr.cTXT000000744 = 'The selected Process has not been configured ' +
        'for SPC.  Would you like to show Inspection Setup?';
        spc_rscstr.cTXT000000746 = 'The selected Work Center has not been configured ' +
        'for SPC.  Would you like to show Inspection Setup?';
        spc_rscstr.cTXT000000748 = 'The selected PLM Item has not been configured ' +
        'for SPC.  Would you like to show Inspection Setup?';
        spc_rscstr.cTXT000000867 = 'The selected MRO Equipment has not been configured ' +
        'for SPC.  Would you like to show Inspection Setup?';
      }
      case ASource of
        spcInventory:
          AShow := IQMS.Common.Dialogs.IQConfirmYN(spc_rscstr.cTXT000000742);
        spcPLM:
          AShow := IQMS.Common.Dialogs.IQConfirmYN(spc_rscstr.cTXT000000748);
        spcProcess:
          AShow := IQMS.Common.Dialogs.IQConfirmYN(spc_rscstr.cTXT000000744);
        spcWorkCenter:
          AShow := IQMS.Common.Dialogs.IQConfirmYN(spc_rscstr.cTXT000000746);
        spcPMEqmt:
          AShow := IQMS.Common.Dialogs.IQConfirmYN(spc_rscstr.cTXT000000867);
      end;

      // If the user wants to show Inspection Setup, do it now.
      if AShow then
        spc.DoInspectionSetup(ASource, ASourceID);

      // We are done prompting; exit now.
      Exit;
    end
    else if Result and IQMS.Common.ApplicationSet.IsTouchScreen then
    begin
      // spc_rscstr.cTXT000000791 =
      // 'The selected Inventory Item has not been configured ' +
      // 'for SPC.';
      // spc_rscstr.cTXT000000792 =
      // 'The selected PLM Item has not been configured ' +
      // 'for SPC.';
      // spc_rscstr.cTXT000000793 =
      // 'The selected Process has not been configured ' +
      // 'for SPC.';
      // spc_rscstr.cTXT000000794 =
      // 'The selected Work Center has not been configured ' +
      // 'for SPC.';
      // spc_rscstr.cTXT000000868 =
      // 'The selected MRO Equipment has not been configured ' +
      // 'for SPC.';
      { TODO -oathite -cWebConvert : Dependent on touchscrn
      case ASource of
        spcInventory:
          touchscrn.TouchScreen_Msg_Warning(spc_rscstr.cTXT000000791);
        spcPLM:
          touchscrn.TouchScreen_Msg_Warning(spc_rscstr.cTXT000000792);
        spcProcess:
          touchscrn.TouchScreen_Msg_Warning(spc_rscstr.cTXT000000793);
        spcWorkCenter:
          touchscrn.TouchScreen_Msg_Warning(spc_rscstr.cTXT000000794);
        spcPMEqmt:
          touchscrn.TouchScreen_Msg_Warning(spc_rscstr.cTXT000000868);
      end; }
      Exit;
    end;

    // If we get here, then the Inventory Item does have parameters,
    // so we probably do not need to show Inspection Setup.  But if
    // we also need to check if Inspections have been created --
    // as would be important for Quick Inspection -- then check if
    // SPC Inspections exist for this item.
    // If the item does not have inspections, then prompt.
    if Assigned(AHasSPCInspectionGroupsProc) then
      Result := not AHasSPCInspectionGroupsProc(ASource, ASourceID);
    if Result then
    begin
      { spc_rscstr.cTXT000000743 = 'SPC Inspection Groups have not been created for the ' +
        'selected Inventory Item.  Would you like to show Inspection Setup?';
        spc_rscstr.cTXT000000745 = 'SPC Inspection Groups have not been created for the ' +
        'selected Process.  Would you like to show Inspection Setup?';
        spc_rscstr.cTXT000000747 = 'SPC Inspection Groups have not been created for the ' +
        'selected Work Center.  Would you like to show Inspection Setup?';
        spc_rscstr.cTXT000000749 = 'SPC Inspection Groups have not been created for the ' +
        'selected PLM Item.  Would you like to show Inspection Setup?';
        spc_rscstr.cTXT000000867 = 'The selected MRO Equipment has not been configured ' +
        'for SPC.  Would you like to show Inspection Setup?';
      }
      case ASource of
        spcInventory:
          AShow := IQMS.Common.Dialogs.IQConfirmYN(spc_rscstr.cTXT000000743);
        spcPLM:
          AShow := IQMS.Common.Dialogs.IQConfirmYN(spc_rscstr.cTXT000000749);
        spcProcess:
          AShow := IQMS.Common.Dialogs.IQConfirmYN(spc_rscstr.cTXT000000745);
        spcWorkCenter:
          AShow := IQMS.Common.Dialogs.IQConfirmYN(spc_rscstr.cTXT000000747);
        spcPMEqmt:
          AShow := IQMS.Common.Dialogs.IQConfirmYN(spc_rscstr.cTXT000000867);
      end;
      // If the user wants to show Inspection Setup, do it now.
      if AShow then
        spc.DoInspectionSetup(ASource, ASourceID);
    end;
  end;
end;

function SPCSourceFromTable(const ATableName: string): TSPCSourceType;
begin
  if CompareText(ATableName, 'ARINVT') = 0 then
    Result := spcInventory
  else if CompareText(ATableName, 'PLM') = 0 then
    Result := spcPLM
  else if CompareText(ATableName, 'SNDOP') = 0 then
    Result := spcProcess
  else if CompareText(ATableName, 'WORK_CENTER') = 0 then
    Result := spcWorkCenter
  else if CompareText(ATableName, 'PMEQMT') = 0 then
    Result := spcPMEqmt
  else if CompareText(ATableName, 'QINVT') = 0 then
    Result := spcEngineeringQuote
  else if CompareText(ATableName, 'CRM_OPPORTUNITY') = 0 then
    Result := spcCRMOpportunity
  else
    Result := spcUnknown;
end;

function SPCQuickInspectionSourceFromTable(const ATableName: string)
  : TQuickInspectionSource;
begin
  if CompareText(ATableName, 'ARINVT') = 0 then
    Result := qiInventory
  else if CompareText(ATableName, 'SNDOP') = 0 then
    Result := qiProcess
  else if CompareText(ATableName, 'WORK_CENTER') = 0 then
    Result := qiWorkCenter
  else if CompareText(ATableName, 'PMEQMT') = 0 then
    Result := qiPMEqmt
  else if CompareText(ATableName, 'QINVT') = 0 then
    Result := qiEngineeringQuote
  else if CompareText(ATableName, 'CRM_OPPORTUNITY') = 0 then
    Result := qiCRMOpportunity
  else
    Result := qiUnknown;
end;

procedure InsertSubgroup(InspectionParams: TInspectionRec;
  var AGroupID: Integer);
var
  bTmp: Boolean;
begin
  AGroupID := 0;
  if (InspectionParams.SPC_INSPECTION_ID > 0) then
    with TFDStoredProc.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        StoredProcName := 'IQMS.IQSPC.CREATE_QUICK_INSPECTION';
        Prepare;
        ParamByName('p_source').Value := InspectionParams.Source;
        ParamByName('p_source_id').Value := InspectionParams.SourceID;
        ParamByName('p_inspection_id').Value := InspectionParams.SPC_INSPECTION_ID;
        ParamByName('p_pr_emp_id').Value := InspectionParams.PR_EMP_ID;
        ParamByName('p_user_name').Value := InspectionParams.UserName;
        ParamByName('p_sample_count').Value := InspectionParams.SampleCount;
        ParamByName('p_population').Value := InspectionParams.Population;
        ParamByName('p_fglotno').Value := InspectionParams.FGLotNo;
        ParamByName('p_mfgno').Value := InspectionParams.MFGNo;
        ParamByName('p_workorder_id').Value := InspectionParams.WORKORDER_ID;
        ParamByName('p_po_receipts_id').Value := InspectionParams.PO_RECEIPTS_ID;
        ParamByName('p_pmeqmt_id').Value := InspectionParams.PMEQMT_ID;
        ParamByName('p_workcenter_id').Value := InspectionParams.WORKCENTER_ID;
        ExecProc;
        // Get the returned subgroup ID
        AGroupID := ParamByName('p_new_subgroup_id').AsLargeInt;
      finally
        Free;
      end;
  // If we do not have a subgroup at this point, exit early.
  if AGroupID = 0 then
    Exit;
  // 08/09/2012
  if InspectionParams.VariableSampleCount then
    ExecuteCommandParam(
      'UPDATE spc_subgroup SET confidence_level = :CONFIDENCE_LEVEL, ' +
      'confidence_interval = :CONFIDENCE_INTERVAL WHERE id = :ID',
      ['CONFIDENCE_LEVEL;I', 'CONFIDENCE_INTERVAL;I', 'ID;INT64'],
      [Ord(InspectionParams.ConfidencePercentile),
      InspectionParams.ConfidenceInterval, AGroupID]);

  // 09/05/2013 Non-conforming inventory
  if InspectionParams.FGMULTI_ID > 0 then
    ExecuteCommandFmt(
      'UPDATE fgmulti SET spc_subgroup_id = %d ' +
      'WHERE id = %d',
      [AGroupID,
      InspectionParams.FGMULTI_ID]);

  // 02/28/2014
  if InspectionParams.Serial > '' then
    ExecuteCommandParam(
      'UPDATE spc_subgroup SET serial = :SERIAL WHERE id = :ID',
      ['SERIAL;S', 'ID;INT64'], [InspectionParams.Serial, AGroupID]);

  // 02/28/2014
  ExecuteCommandParam(
    'UPDATE spc_subgroup SET serial = :SERIAL, note = :NOTE, ' +
    'cuser1 = :CUSER1, cuser2 = :CUSER2, cuser3 = :CUSER3 ' +
    'WHERE id = :ID',
    ['SERIAL;S', 'NOTE;S', 'CUSER1;S', 'CUSER2;S', 'CUSER3;S', 'ID;F'],
    [InspectionParams.Serial, InspectionParams.Note, InspectionParams.CUser1,
    InspectionParams.CUser2, InspectionParams.CUser3, AGroupID]);
end;

procedure ClearInspectionParams(var rec: TInspectionRec);
begin
  ZeroMemory(@rec, SizeOf(TInspectionRec));
  with rec do
  begin
    ConfidencePercentile := TConfidencePercentile(0);
    SourceKind := TSPCSourceKind(0);
  end;
end;

procedure CopyInspectionParams(const ASource: TInspectionRec;
  var ATarget: TInspectionRec);
  function _chkNan(const AValue: Extended): Double;
  begin
    try
      if IsNan(AValue) then
        Result := 0
      else
        Result := AValue;
      if Trunc(Result) <= 0 then
        Result := 0;
    except
      Result := 0;
    end;
  end;

begin
  // 10/04/2013 Do not use FillChar() and Move() to copy data
  // from one record to the next.  Kernel32 errors could result.
  // FillChar(ATarget, SizeOf(ATarget), 0);
  // Move(ASource, ATarget, System.Math.Min(SizeOf(TInspectionRec),
  // SizeOf(TInspectionRec)));

  ATarget.Source := ASource.Source;
  ATarget.SourceKind := ASource.SourceKind;
  ATarget.SourceID := ASource.SourceID;
  ATarget.UserName := ASource.UserName;
  ATarget.PR_EMP_ID := ASource.PR_EMP_ID;
  ATarget.FGLotNo := ASource.FGLotNo;
  ATarget.MFGNo := ASource.MFGNo;
  ATarget.DEVICE_ID := ASource.DEVICE_ID;
  ATarget.SPC_INSPECTION_ID := ASource.SPC_INSPECTION_ID;
  ATarget.SPC_SUBGROUP_ID := ASource.SPC_SUBGROUP_ID;
  ATarget.SNDOPClass := ASource.SNDOPClass;
  ATarget.MFGTypeFilter := ASource.MFGTypeFilter;
  ATarget.WORKORDER_ID := ASource.WORKORDER_ID;
  ATarget.PO_RECEIPTS_ID := ASource.PO_RECEIPTS_ID;
  ATarget.Cavity := ASource.Cavity;
  ATarget.PMEQMT_ID := ASource.PMEQMT_ID;
  ATarget.WORKCENTER_ID := ASource.WORKCENTER_ID;
  ATarget.FGMULTI_ID := ASource.FGMULTI_ID;
  ATarget.VariableSampleCount := ASource.VariableSampleCount;
  ATarget.ConfidencePercentile := ASource.ConfidencePercentile;
  ATarget.ConfidenceInterval := ASource.ConfidenceInterval;
  ATarget.Population := ASource.Population;
  ATarget.SampleCount := ASource.SampleCount;
end;

function GetDefaultConfidenceInterval: Integer;
begin
  Result := 0;
  try
    Result := SelectValueAsInteger('SELECT confidence_interval FROM spc_param ' +
      'WHERE ROWNUM < 2');
  except
  end;
end;

function GetDefaultConfidencePercentile: TConfidencePercentile;
var
  i: Integer;
begin
  Result := cp95;
  try
    i := SelectValueAsInteger('SELECT confidence_level FROM spc_param ' +
      'WHERE ROWNUM < 2');
    if (i > 0) and (i <= Ord(high(TConfidencePercentile))) then
      Result := TConfidencePercentile(i);
  except
  end;
end;

{ TSPCSource }

constructor TSPCSource.Create;
begin
  inherited Create;
  Clear;
end;

procedure TSPCSource.Clear;
begin
  Source := TSPCSourceType(0);
  Kind := TSPCSourceKind(0);
  SourceID := 0;
end;

function TSPCSource.GetSourceTable: string;
begin
  Result := SPCSourceTable[Source];
end;

function TSPCSource.QuickInspectionSource: TQuickInspectionSource;
begin
  case Source of
    spcUnknown:
      Result := qiUnknown;
    spcInventory:
      Result := qiInventory;
    spcPLM:
      Result := qiUnknown;
    spcProcess:
      Result := qiProcess;
    spcWorkCenter:
      Result := qiWorkCenter;
    spcPMEqmt:
      Result := qiPMEqmt;
  else
    Result := qiUnknown;
  end;
end;

procedure TSPCSource.SetKind(const Value: TSPCSourceKind);
begin
  FKind := Value;
  if Value in [spkNonConform, spkAKABuying, spkAKASelling] then
    Source := spcInventory;
end;

procedure TSPCSource.SetSource(const Value: TSPCSourceType);
begin
  FSource := Value;
end;

procedure TSPCSource.SetSourceTable(const Value: string);
begin
  if CompareText(Value, 'ARINVT') = 0 then
    FSource := spcInventory
  else if CompareText(Value, 'PLM') = 0 then
    FSource := spcPLM
  else if CompareText(Value, 'SNDOP') = 0 then
    FSource := spcProcess
  else if CompareText(Value, 'WORK_CENTER') = 0 then
    FSource := spcWorkCenter
  else if CompareText(Value, 'PMEQMT') = 0 then
    FSource := spcPMEqmt
  else if CompareText(Value, 'QINVT') = 0 then
    FSource := spcEngineeringQuote
  else if CompareText(Value, 'CRM_OPPORTUNITY') = 0 then
    FSource := spcCRMOpportunity
  else
    FSource := spcUnknown;
end;

procedure ExecuteAutoChart(AArinvtID: Int64);
begin
  if IsLicensed_SPC then
    DoSPC(spc_const.SPC_AUTOCHART_ARINVT, AArinvtID);
end;

procedure CalculateSPCSample(const ASPCSampleID: Int64);
begin
  spc_expression_eval.CalculateSPCSample(ASPCSampleID);
end;

end.
