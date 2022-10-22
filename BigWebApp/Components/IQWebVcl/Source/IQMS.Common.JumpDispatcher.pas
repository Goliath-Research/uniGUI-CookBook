unit IQMS.Common.JumpDispatcher;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, System.Variants, System.SysUtils, Vcl.Forms,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys, IQMS.Common.JumpConstants;

procedure DoIQJump( AOwner:TComponent; var Msg :TMessage );
procedure DoCOMJump(AAppNameNoExt:string; APacket: array of Variant );
procedure DoDNETCOMJump(AAssemblyName, ANamespace:string; APacket: array of Variant );
procedure DoIQJumpApprovePO( AOwner:TComponent; APoId: Real = 0 );
procedure DoJumpToGL_Frx_Reports;
procedure DoJumpToScheduleByWorkorder( AWorkorder_ID: Real );
procedure DoJumpToScheduleBySndop_Dispatch_ID( ASndop_Dispatch_ID: Real );
procedure DoJumpToSI_byServerName(Sender : TObject);
procedure DoShipmanLTLwithPicker( AOwner : TComponent );

function CheckExecuteDirectlyLinked(AAppNameNoExt:string; APacket: array of Variant ): Boolean;

type
  TIQWebExecuteJumpEvent = procedure (aClassName: string; aID: integer) of object;

  TIQWebJumpDispatcher = class
  private
    class var FOnExecuteJump: TIQWebExecuteJumpEvent;
    class procedure ExecuteJump(aClassName: string; aID: integer);
  public
    class procedure Initialize(CallBack: TIQWebExecuteJumpEvent);
    class procedure Jump(aJumpTo: TJumpTo; aID: integer); overload;
    class procedure Jump(aJumpTo: TJumpMessage; aID: integer); overload;
  end;

implementation

uses
//    AccruedFreight,
//    Activity,
//    AP_Main,
//    ap_wf_main,
//    AP1099,
//    ApVendSt,
//    APView,
//    Archiver_Main,
//    AssyTrack_Main,
//    AutoCum,
//    bm_main,
//    BMAnalys,
//    BMRecons,
//    Bol,
//    Bom_Shel,
//    cashrec,
//    CD_Main,
//    CDView,
//    ChgPswex,
//    ChooseWF,
//    Cost_Const,
//    cost_elm,
//    Cost_Main,
//    crm,
//    crm_activity_dnet,
//    crm_activity_type_list,
//    crm_const,
//    crm_context,
//    crm_dbtrans_exp,
//    crm_dbtrans_imp,
//    crm_holiday,
//    crm_main,
//    crm_schedcoord,
//    crm_schedule_request,
//    crm_settings,
//    crm_types,
//    cstat,
//    Cust,
//    dhr_main,
//    dm_shipman,
//    DNetComShr,
//    dng_main,
//    EDIConst,
//    eis_query_exec,
//    eis_setup,
//    ExpApprove,
//    ExpReports,
//    ExpUsers,
//    Fab_Const,
//    FAConst,
//    FaReviewDept,
//    FAShare,
//    FGAvail,
//    Fin_Rpt,
//    ForeConst,
//    ForeMainEx,
//    FrlCtrl,
//    GL,
//    GLBudget,
//    GLReval,
//    GLTrialB,
//    heijunka_main,
//    HR_Const,
//    HRApp,
//    HRShare,
//    Web.HTTPApp,
//    ict_main,
//    ict_receive,
//    IFreight,
//    ImpConst,
//    inv_bol_params,
//    inv_by_loc,
//    inv_group,
//    inv_location_type,
//    inv_main,
//    inv_rf_teams,
//    inv_trans_alert,
//    inv_trans_mat_staging,
//    inv_trans_rules,
//    inv_wms_setup,
//    inv_zones,
//    InvProdCode,
//    InvtShel,
//    iqcc,
//    IQComExe,
//    IQFile,
//    IQHelpHk,
      IQMS.Common.DataLib
//    IQMS.PlantLayout,
//    IQMS.ChromeEmbeddedBrowserForm,
//    IQLMEdit,
//    IQLog,
//    IQMesg,
//    IQMisc,
//    IQScreen,
//    IQSecIns,
//    IQSecMan,
//    IQSecSel,
    , IQMS.Common.StringUtils
//    IView,
//    jc_act_pit,
//    Journal,
//    js_main,
//    JumperBase,
//    kb_supermarket,
//    Location,
//    LotTrack,
//    M_Const,
//    M_Main,
//    MainProd,
//    mainsale,
//    MCRates,
//    MPS,
//    MPS_Const,
//    oc_main,
//    oc_manual_receipt,
//    oe_hist,
//    Oe_Main,
//    oe_wf_main,
//    plm_main,
//    pm_main,
//    pm_wo,
//    po_expected_receipts,
//    Po_Hist,
//    po_hist_ex,
//    PO_Requisition,
//    PO_Share,
//    po_wf_main,
//    POMain,
//    PoNotApp,
//    PrConst,
//    Profile_main,
//    prw_main,
//    psMaint,
//    psmanual,
//    PSTicket,
//    Q_log,
//    Q_Shell,
//    QC_Const,
//    QSnd_Lnk,
//    RBom_Main,
//    RebateManager,
//    RebateParam,
//    rec_pend_asn,
//    RecMain,
//    RecMain_ER,
//    repdef_cat,
//    Rma_Const,
//    Rma_Main_Ex,
//    RRfq_Main,
//    rt_hist,
//    RT_Main,
//    rtpcmon_bom_setup,
//    Rtpcmon_cntr_setup,
//    RunsBest,
//    SalesPiv,
//    sched_mat_req_menu_dlg,
//    Sched_Mn,
//    SerReprintRange,
//    SerTrack,
//    shipman_const,
//    Shop_SU,
//    Snd_AS,
//    Snd_Link,
//    spc,
//    spc_const,
//    Src_Wrkc,
//    sys,
//    TAConst,
//    taxmain,
//    Terms,
//    tooling,
//    TranMain,
//    ven_rfq_main,
//    ven_rfq_share,
//    vend_rma,
//    Vendor,
//    VMI_Consume,
//    w_oe,
//    wave_pick,
//    wc_assy2,
//    WhoLoggedIn,
//    WO_Main,
//    Mon_MyAlerts,
//    crm_reminder,
//    HREmpTR

;


// all DCOMs come here
procedure DoCOMJump(AAppNameNoExt:string; APacket: array of Variant );
begin
  // Check if we eliminated this dcom call and replaced with directly linked in code
  if CheckExecuteDirectlyLinked( AAppNameNoExt, APacket ) then
     EXIT;

  // Normal DCOM calls
  Application.ProcessMessages;
  try
//    Com_Exec( AAppNameNoExt, APacket ); // IQComExe.pas
  except on E:Exception do
    // If user clicks Cancel on the picklist,
    // he will get error message, "Operation aborted," unless we capture it.
//    if not IgnoreCOMRaisedEAbort(E) then raise;
  end;
end;

// all .net assemblies that are invoked by IQWin32 as a pass through call(i.e. iqcrm calls iqwin32 then iqwin32 calls .net), come here
// Assembly name without the extension
// Namespace - should be something like IQMS.CRM.IQShell
procedure DoDNETCOMJump(AAssemblyName, ANamespace:string; APacket: array of Variant );
begin
  Application.ProcessMessages;
  try
//   Com_Exec_DNET( AAssemblyName, ANamespace, APacket ); // IQComExe.pas
  except on E:Exception do
    // If user clicks Cancel on the picklist,
    // he will get error message, "Operation aborted," unless we capture it.
//    if not IgnoreCOMRaisedEAbort(E) then raise;
  end;
end;
(*
Called from DoCOMJump above and is intended to gradually replace DCOM calls.
--------------------------------------------------------------------------------
Example of linking in former DCOM: IQMPS
1. add MPS.pas to uses. MPS is the disptacher of the IQMPS dcom. We normally named them <module>_main.pas for instance qc_main.pas
2. add "if CompareText(AAppNameNoExt, 'IQMPS') = 0 then ..." and call the former dcom dispatcher procedure directly: DoMPS( APacket[ 0 ]{kind}, APacket[ 1 ]{id})
3. any reference in IQwin32.exe such as
       Com_Exec( 'IQMps', [MPS_Const.MPS_SHOW_ITEM_TPD, DM.TblArinvtID.asFloat ])
       must be replaced with
       DoCOMJump( 'IQMps', [ MPS_Const.MPS_SHOW_ITEM_TPD, DM.TblArinvtID.asFloat ]);
*)

function CheckExecuteDirectlyLinked(AAppNameNoExt:string; APacket: array of Variant ): Boolean;
var
  APartial: Variant;

  procedure AssignPartialPacket( AStartIndex: Integer = 2);
  var
    I: Integer;
  begin
    if High(APacket) >= AStartIndex then
    begin
      APartial:= VarArrayCreate([ 0, High(APacket) - AStartIndex ], varVariant);
      for I:= AStartIndex to High( APacket ) do
         APartial[I - AStartIndex]:= APacket[ I ];
    end;
  end;

begin
  Result:= TRUE;

  if CompareText(AAppNameNoExt, 'IQMPS') = 0 then
//     Mps.DoMPS( APacket[ 0 ]{kind}, APacket[ 1 ]{id})                           {mps.pas}

  else if CompareText(AAppNameNoExt, 'IQCOST') = 0 then
//     Cost_Main.DoMain( APacket[ 0 ]{kind}, 0 {id}, APartial{optional} )         {cost_main.pas}

  else if CompareText(AAppNameNoExt, 'IQFORECAST') = 0 then
     begin
       AssignPartialPacket;
//       ForeMainEx.DoForeMain( APacket[ 0 ]{kind}, APacket[ 1 ]{id}, APartial{optional}) {ForeMainEx.pas}
     end

  else if CompareText(AAppNameNoExt, 'IQMeter') = 0 then
     begin
       AssignPartialPacket;
//       M_Main.DoMain( APacket[ 0 ]{kind}, APacket[ 1 ]{id}, APartial{optional}) {M_Main.pas}
     end

  else if CompareText(AAppNameNoExt, 'IQFA') = 0 then
//     FAShare.DoIQFA( Application, APacket[ 0 ], APacket[ 1 ], APacket[ 2 ], APacket[ 3 ], APacket[ 4 ])  {FAShare.pas}

  else if CompareText(AAppNameNoExt, 'IQHR') = 0 then
//     HRShare.DoHR( Application, APacket[ 0 ], APacket[ 1 ])                     {HRShare.pas}

  else if CompareText(AAppNameNoExt, 'DUNNING') = 0 then
//     dng_main.DoDunning                                                         {dng_main.pas}

  else if CompareText(AAppNameNoExt, 'IQRMA') = 0 then
     begin
       AssignPartialPacket;
//       Rma_Main_Ex.DoMain( APacket[ 0 ]{kind}, APacket[ 1 ]{id}, APartial{optional})  {Rma_Main_Ex}
     end

  else
     Result:= FALSE;  {could not link directly}

//  if Result then
//     IQScreen.SetVisibleWindowsToForeground;
end;


procedure DoIQJumpApprovePO( AOwner:TComponent; APoId: Real = 0 );
begin
  Application.ProcessMessages;

//  if PO_Share.IsPOWorkflowTemplateBased then // PO_Share.pas
//     TFrmPOWorkflowMain.DoShow( AOwner, APoId )     // po_wf_main.pas
//  else
//     DoShowUnApprovedPOs( AOwner );          // PoNotApp
end;

procedure DoJumpToGL_Frx_Reports;
var
  StartUpInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  Success    : LongBool;
  CommandLine, IQMSpassword: string;
begin
  try
    FillChar( StartUpInfo, SizeOf(TStartUpInfo), 0 );
    with StartupInfo do
    begin
      cb := SizeOf(TStartupInfo);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
      wShowWindow := sw_SHOWNORMAL;
    end;

    CommandLine := SelectValueAsString('select frx_exe_file from iqsys');
    if CommandLine = '' then
      Exit;

    Success:= CreateProcess( nil, PChar(CommandLine), nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo );

    if not Success then
      raise exception.create('Unable to run Frx. reports');
  except on E:Exception do
    if not E.ClassNameIs( 'EAbort' ) then raise;
  end;
end;

procedure CheckOpenCRMMain(Msg :TMessage);
begin
// 11/25/2013 Do not show the main CRM form for DCOM calls.
// Requested by Jason for SmartPage:
// EIQ-1625  CRM, do not show main crm form with jumping

//  CheckContextObjectCreated;
//  CheckCRMSettingsCreated;

{  if (Msg.Msg = iq_JumpToCRMActivity) or
     (Msg.Msg = iq_JumpToCRMSupport) or
     (Msg.Msg = iq_JumpToCRMQuote) or
     (Msg.Msg = iq_JumpToCustomerCentral) or
     (Msg.Msg = iq_JumpToVendorCentral) or
     (Msg.Msg = iq_JumpToPartnerCentral) or
     (Msg.Msg = iq_JumpToOpportunityCentral) or
     (Msg.Msg = iq_JumpToCRMServiceCentral) or
     (Msg.Msg = iq_JumpToCRMCampaign) or
     (Msg.Msg = iq_JumpToCRMGroup) or
     (Msg.Msg = iq_JumpToCRMWorkFlow) or
     (Msg.Msg = iq_JumpToCRMMassMailer) or
     (Msg.Msg = iq_JumpToCRMMailMerge) or
     (Msg.Msg = iq_JumpToCRMCall) or
     (Msg.Msg = iq_JumpToCRMTask) or
     (Msg.Msg = iq_JumpToCRMMeeting) or
     (Msg.Msg = iq_JumpToCRMNote) or
     (Msg.Msg = iq_JumpToSalesConfigTemplates) then
     //(Msg.Msg = iq_JumpToCRMCalendar) or
     //(Msg.Msg = iq_JumpToCRMScheduleCoordinator) or
     //(Msg.Msg = iq_JumpToCallTypes) or
     //(Msg.Msg = iq_JumpToTaskTypes) or
     //(Msg.Msg = iq_JumpToMeetingTypes) or
     //(Msg.Msg = iq_JumpToSupportStatusTypes) then
     begin
       crm_main.DoCRMMain;
     end; }
end;

procedure DoShipmanLTLwithPicker(AOwner: TComponent);
var
//  AShipmanDM: TShipMan_DM;
  AID: Real;
  ASrc, AURL, AReturnURL: string;
begin
  // EIQ-5150 Shipman LTL Implementation (Spa World) AMB 12-08-14

//  AShipmanDM := TShipMan_DM.create(AOwner); // dm_shipman.pas
//  with AShipmanDM do
//    try
//      with PkShipments do
//      begin
//        OnCustomBtn1Click := nil; // Hide the Return button - we just want to pick an existing packslip record
//        if not Execute then
//          ABORT;
//        AID := GetValue('ID');
//        ASrc := GetValue('SOURCE');
//      end;
//
//      AURL := IQMisc.IQGetIISServerBaseURL;
//      IQAssert(Trim(AURL) <> '',
//        'IIS Server settings have not been configured in System Parameters.  Cannot display page.');
//      // http://localhost:8080/EnterpriseIQ/ShippingManager/Freight?source=test&sourceid=123
//      AReturnURL := Format('/EnterpriseIQ/ShippingManager/Freight?source=%s&sourceid=%.0f', [ASrc, AID]);
//      AURL := Format('%sEnterpriseIQ/Account/ManualLogOn?UserName=%s&Password=%s' + '&returnurl=%s',
//        [AURL, SecurityManager.UserName, CharXOR(SecurityManager.Password), HTTPEncode(AReturnURL)]);
//      // Use Chromium browser
////      DoDNETCOMJump('ChromeEmbeddedFramework', 'ChromeEmbeddedFramework.IQInterface', [AURL,
////                                                                                       iqchmShipmanFrt,
////                                                                                       '23049']); //EIQ-5962 Correct Map ID for Shipping Manager Freight module
//
//      TChromeEmbeddedBrowserForm.DoShow(
//       AURL,
//       iqchmShipmanFrt,
//       '23049',
//       False,
//       False
//       );
//
//    finally
//      AShipmanDM.Free;
//    end;
end;

procedure DoIQJump( AOwner:TComponent; var Msg :TMessage );
var
  AWParam, ALParam: Integer;
//  ACargo: TVendor_RFQ_Cargo;
begin
  // 05/13/2014 Compensate for a Delphi XE5 change where a value of -1
  // cannot be passed.
{$IF CompilerVersion >= 26}  // Delphi XE5
  if Msg.WParam = High(Msg.WParam) then
    AWParam := 0//-1
  else
    AWParam := Msg.WParam;

  if Msg.LParam = High(Msg.LParam) then
    ALParam := 0//-1
  else
    ALParam := Msg.LParam;

{$ELSE}
  AWParam := Msg.WParam;
  ALParam := Msg.LParam;
{$IFEND}

  CheckOpenCRMMain(Msg);
//
//  case Msg.Msg of // IQUsrMsg
//    iq_JumpToInv                  : DoIQJumpToInv( AOwner, AWParam );                            // InvtShel.pas
//    iq_JumpToBom                  : DoIQJumpToBom( AOwner, AWParam );                            // Bom_Shel.pas
//    iq_JumpToPO                   : DoIQJumpToPO( AOwner, AWParam );                      // POMain.pas
//    iq_JumpToPO_Requisition       : DoIQJumpToPO_Requisition( AOwner, AWParam );                 // PO_Requisition.pas
//    iq_JumpToPO_Header_Requisition: DoIQJumpToPo_Header_Requisition( AOwner, AWParam );          // PO_Requisition.pas
//    iq_JumpToPOReceipts           : DoIQJumpToPOReceipts( AOwner, AWParam );                     // RecMain.pas
//    iq_JumpToWorkOrder            : DoIQJumpToWorkOrder( AOwner, AWParam );                      // WO_Main.pas
//    iq_JumpToSalesOrder           : DoIQJumpOrders( AOwner, AWParam );                           // Oe_Main.pas
//    iq_JumpToNewSalesOrder        : DoIQJumpOrders( AOwner, AWParam, False, True );              // Oe_Main.pas
//    iq_JumpToSalesOrderWorkFlow   : begin
//                                      TFrmOEWorkflowMain.EnsureWorkflowExists( AOwner, AWParam );     // oe_wf_main.pas
//                                      TFrmOEWorkflowMain.DoShowAssociatedWorkflow( AOwner, AWParam ); // oe_wf_main.pas
//                                    end;
//    iq_JumpToCustomer             : DoIQJumpToCustomer( AOwner, AWParam );                       // Cust.pas
//    iq_JumpToCustomerCRM          : DoIQJumpToCustomer_CRM( AOwner, AWParam );                   // Cust.pas
//    iq_JumpToContact              : DoIQJumpToContact( AOwner, 0, AWParam );                     // Cust.pas
//    iq_JumpToContactCRM           : DoIQJumpToContact_CRM( AOwner, AWParam );                    // Cust.pas
//    iq_JumpToWorkCenter           : DoIQJumpToWorkCenter( AOwner, AWParam );                     // Src_Wrkc.pas
//    iq_JumpToVendor               : DoJumpToVendor( AOwner, AWParam );                           // Vendor.pas
//    iq_JumpToPM                   : //DoCOMJump( 'IQPM', [ PM_Const.PM_SHOW_ALL, AWParam ] );      // PM_Const.pas
//     pm_main.DoJumpToPM(AOwner, AWParam);
//    iq_JumpToARInvoice            : DoJumpToInvoice( AOwner, AWParam );                          // IView.pas
////    iq_JumpToAPInvoice            : DoViewAPInvoices( AOwner, AWParam );                         // APView.pas
//    iq_JumpToAPInvoice            : DoViewAPfromCD( AOwner, AWParam );                         // APView.pas
//    iq_JumpToSchedule             : DoIQJumpToIQSchedule( AWParam );                             // Sched_Mn.pas
//    iq_JumpToScheduleByWorkorder  : DoJumpToScheduleByWorkorder( AWParam );                      // this unit
//    iq_JumpToScheduleBySndop_Dispatch_ID: DoJumpToScheduleBySndop_Dispatch_ID( AWParam );        // this unit
//    iq_JumpToTooling              : // DoCOMJump( 'IQTool', [TL_Const.SHOW_ALL_OPEN, AWParam]);     // TL_Const.pas
//      tooling.DoJumpToTooling(AOwner, AWParam);
//    iq_JumpToToolingTask          : // DoCOMJump( 'IQTool', [TL_Const.SHOW_TASK, AWParam]);     // TL_Const.pas
//      tooling.DoJumpToToolingTask(AOwner, AWParam);
//    iq_JumpToSalesOrderDetail     : DoIQJumpOrderDetail( AOwner, AWParam  );                     // Oe_Main.pas
//    iq_JumpToAvailability         : DoFGAvail( AWParam );                                        // FGAvail.pas
//    iq_JumpToInvByLoc             : TFrmInventoryByLocations.DoShow( AOwner, AWParam );          // inv_by_loc.pas
//    iq_JumpToInvGroup             : TFrmInvGroup.DoShow( AOwner, AWParam );                      // inv_group.pas
//
//    iq_JumpToLocationType         :  TFrmInvLocationType.DoShow( AOwner, AWParam );              // inv_location_type.pas
//    iq_JumpToInvZone              :  TFrmInvZones.DoShow( AOwner, AWParam );                     // inv_zones.pas
// // iq_JumpToMasterLocation       :  Location.DoLocations( AWParam );                            // Location.pas
//    iq_JumpToMasterLocation       :  TLocationsTable.DoShow( AOwner, AWParam );                  // Location.pas
//
//    iq_JumpToPackSlip             : DoJumptoPackingSlipMaintenance( AWParam );                   // psMaint.pas
//    iq_JumpToPackSlipShipment     : DoJumptoPackingSlipShipment( AWParam );                      // psMaint.pas
//    iq_JumpToRMA                  : DoCOMJump( 'IQRMA', [ Rma_Const.RMA_SHOW, AWParam ]);        // Rma_Const
//    iq_JumpToRMAHeader            : DoCOMJump( 'IQRMA', [ Rma_Const.RMA_SHOW_HEADER, AWParam ]); // Rma_Const
//    iq_JumpToRMADetail            : DoCOMJump( 'IQRMA', [ Rma_Const.RMA_SHOW_DETAIL, AWParam ]); // Rma_Const
//    iq_JumpToVendorRMADetail      : Vend_RMA.DoJumpToRMADetail( AOwner, AWParam );               // vend_rma
//    iq_JumpToHistSalesOrderDetail : DoIQJumpHistOrderDetail( AOwner, AWParam );                  // oe_hist.pas
//    iq_JumpToQuote                : DoIQJumpToQuote( AWParam  );                                 // Q_Shell.pas
//    iq_JumpToHistTooling          : // DoCOMJump( 'IQTool', [ TL_Const.SHOW_ARCHIVED, AWParam ] );  // TL_Const.pas
//      tooling.DoJumpToToolingHist(AOwner, AWParam );
//    iq_JumpToPO_Header            : DoIQJumpToPo_Header( AOwner, AWParam );    // POMain.pas
//
//    // CRM
//    iq_JumpToCRMMain:
//      crm_main.DoCRMMain;
//    iq_JumpToCRMActivity:
//      //DoDNETCOMJump( dllCRM, namespaceCRM, [ crm_const.CRM_ACTIVITY, AWParam ] );
//      crm_activity_dnet.DoCRMActivityDNet(AWParam);
//    iq_JumpToCRMCall:
//      crm_activity_dnet.DoShowOrPickCRMActivityDNet(AWParam, atCall);
//    iq_JumpToCRMTask:
//      crm_activity_dnet.DoShowOrPickCRMActivityDNet(AWParam, atTask);
//    iq_JumpToCRMMeeting:
//      crm_activity_dnet.DoShowOrPickCRMActivityDNet(AWParam, atMeeting);
//    iq_JumpToCRMNote:
//      crm_activity_dnet.DoShowOrPickCRMActivityDNet(AWParam, atNote);
//    iq_JumpToCallTypes:
//      //DoDNETCOMJump( dllCRM, namespaceCRM, [ crm_const.CRM_CALL_TYPES, AWParam ] );
//      DoActivityTypes(Application.MainForm, atCall);
//    iq_JumpToTaskTypes:
//      //DoDNETCOMJump( dllCRM, namespaceCRM, [ crm_const.CRM_TASK_TYPES, AWParam ] );
//      DoActivityTypes(Application.MainForm, atTask);
//    iq_JumpToMeetingTypes:
//      //DoDNETCOMJump( dllCRM, namespaceCRM, [ crm_const.CRM_MEETING_TYPES, AWParam ] );
//      DoActivityTypes(Application.MainForm, atMeeting);
//    iq_JumpToSupportStatusTypes:
//      //DoDNETCOMJump( dllCRM, namespaceCRM, [ crm_const.CRM_SUPPORT_TYPES, AWParam ] );
//      DoActivityTypes(Application.MainForm, atSupport);
//
//    iq_JumpToCRMSupport           : crm.DoCRM(crm_const.CRM_SUPPORT, AWParam);    // crm_const.pas   // CRM Support Issue
//
//    iq_JumpToCRMQuote             : crm.DoCRM(crm_const.CRM_QUOTE, AWParam);      // crm_const.pas   // CRM Quotation
//    iq_JumpToCRMMailMerge         : crm.DoCRM(crm_const.CRM_MAIL_MERGE, AWParam);      // crm_const.pas   //
//    iq_JumpToCustomerCentral      : crm.DoCRM(crm_const.CUSTOMER_CENTRAL, AWParam); // crm_const.pas // CRM Customer Central
//    iq_JumpToVendorCentral        : crm.DoCRM(crm_const.VENDOR_CENTRAL, AWParam); // crm_const.pas   // CRM Vendor Central
//    iq_JumpToPartnerCentral       : crm.DoCRM(crm_const.PARTNER_CENTRAL, AWParam);// crm_const.pas   // CRM Partner Central
//    iq_JumpToOpportunityCentral   : crm.DoCRM(crm_const.CRM_OPPORTUNITY, AWParam);// crm_const.pas   // CRM Opportunity Central
//    iq_JumpToCRMServiceCentral    : crm.DoCRM(crm_const.CRM_SERVICE_CENTRAL, AWParam);// crm_const.pas
//    iq_JumpToCRMCampaign          : crm.DoCRM(crm_const.CRM_CAMPAIGN, AWParam);// crm_const.pas
//    iq_JumpToCRMGroup             : crm.DoCRM(crm_const.CRM_GR0UPS, AWParam);// crm_const.pas
//    iq_JumpToCRMWorkFlow          : crm.DoCRM(crm_const.CRM_WORKFLOW, AWParam);// crm_const.pas
//    iq_JumpToCRMMassMailer        : crm.DoCRM(crm_const.CRM_MASS_MAIL, AWParam);// crm_const.pas
//    // iq_NewCRMCall                 : crm.DoNewCRMCall;// crm_const.pas
//    // iq_NewCRMTask                 : crm.DoNewCRMTask;// crm_const.pas
//    // iq_NewCRMMeeting              : crm.DoNewCRMMeeting;// crm_const.pas
//    // iq_NewCRMNote                 : crm.DoNewCRMNote;// crm_const.pas
//    // iq_NewCRMSupportIssue         : crm.DoNewCRMSupport;// crm_const.pas
//
//    // The following are unused anywhere:
//    //iq_NewCRMCallForCustomer      : crm.DoCRM(crm_const.CRM_CUSTOMER_CALL_NEW, AWParam);// crm_const.pas
//    //iq_NewCRMCallForContact       : crm.DoCRM(crm_const.CRM_CONTACT_CALL_NEW, AWParam);// crm_const.pas
//    //iq_NewCRMCallForVendor        : crm.DoCRM(crm_const.CRM_VENDOR_CALL_NEW, AWParam);// crm_const.pas
//    //iq_NewCRMCallForVendorContact : crm.DoCRM(crm_const.CRM_VENDOR_CONTACT_CALL_NEW, AWParam);// crm_const.pas
//    //iq_NewCRMCallForPartner       : crm.DoCRM(crm_const.CRM_PARTNER_CALL_NEW, AWParam);// crm_const.pas
//    //iq_NewCRMCallForPartnerContact: crm.DoCRM(crm_const.CRM_PARTNER_CONTACT_CALL_NEW, AWParam);// crm_const.pas
//    //iq_NewCRMCallForEmployee      : crm.DoCRM(crm_const.CRM_EMPLOYEE_CALL_NEW, AWParam);// crm_const.pas
//    //iq_NewCRMTaskForCustomer      : crm.DoCRM(crm_const.CRM_CUSTOMER_TASK_NEW, AWParam);// crm_const.pas
//    //iq_NewCRMTaskForContact       : crm.DoCRM(crm_const.CRM_CONTACT_TASK_NEW, AWParam);// crm_const.pas
//    //iq_NewCRMTaskForVendor        : crm.DoCRM(crm_const.CRM_VENDOR_TASK_NEW, AWParam);// crm_const.pas
//    //iq_NewCRMTaskForVendorContact : crm.DoCRM(crm_const.CRM_VENDOR_CONTACT_TASK_NEW, AWParam);// crm_const.pas
//    //iq_NewCRMTaskForPartner       : DoCOMJump( 'IQCRM', [ crm_const.CRM_PARTNER_TASK_NEW        , AWParam ] );// crm_const.pas
//    //iq_NewCRMTaskForPartnerContact: DoCOMJump( 'IQCRM', [ crm_const.CRM_PARTNER_CONTACT_TASK_NEW, AWParam ] );// crm_const.pas
//    //iq_NewCRMTaskForEmployee      : DoCOMJump( 'IQCRM', [ crm_const.CRM_EMPLOYEE_TASK_NEW       , AWParam ] );// crm_const.pas
//    //iq_NewCRMMeetingForCustomer      : DoCOMJump( 'IQCRM', [ crm_const.CRM_CUSTOMER_MEETING_NEW       , AWParam ] );// crm_const.pas
//    //iq_NewCRMMeetingForContact       : DoCOMJump( 'IQCRM', [ crm_const.CRM_CONTACT_MEETING_NEW        , AWParam ] );// crm_const.pas
//    //iq_NewCRMMeetingForVendor        : DoCOMJump( 'IQCRM', [ crm_const.CRM_VENDOR_MEETING_NEW         , AWParam ] );// crm_const.pas
//    //iq_NewCRMMeetingForVendorContact : DoCOMJump( 'IQCRM', [ crm_const.CRM_VENDOR_CONTACT_MEETING_NEW , AWParam ] );// crm_const.pas
//    //iq_NewCRMMeetingForPartner       : DoCOMJump( 'IQCRM', [ crm_const.CRM_PARTNER_MEETING_NEW        , AWParam ] );// crm_const.pas
//    //iq_NewCRMMeetingForPartnerContact: DoCOMJump( 'IQCRM', [ crm_const.CRM_PARTNER_CONTACT_MEETING_NEW, AWParam ] );// crm_const.pas
//    //iq_NewCRMMeetingForEmployee      : DoCOMJump( 'IQCRM', [ crm_const.CRM_EMPLOYEE_MEETING_NEW       , AWParam ] );// crm_const.pas
//    //iq_NewCRMNoteForCustomer      : DoCOMJump( 'IQCRM', [ crm_const.CRM_CUSTOMER_NOTE_NEW       , AWParam ] );// crm_const.pas
//    //iq_NewCRMNoteForContact       : DoCOMJump( 'IQCRM', [ crm_const.CRM_CONTACT_NOTE_NEW        , AWParam ] );// crm_const.pas
//    //iq_NewCRMNoteForVendor        : DoCOMJump( 'IQCRM', [ crm_const.CRM_VENDOR_NOTE_NEW         , AWParam ] );// crm_const.pas
//    //iq_NewCRMNoteForVendorContact : DoCOMJump( 'IQCRM', [ crm_const.CRM_VENDOR_CONTACT_NOTE_NEW , AWParam ] );// crm_const.pas
//    //iq_NewCRMNoteForPartner       : DoCOMJump( 'IQCRM', [ crm_const.CRM_PARTNER_NOTE_NEW        , AWParam ] );// crm_const.pas
//    //iq_NewCRMNoteForPartnerContact: DoCOMJump( 'IQCRM', [ crm_const.CRM_PARTNER_CONTACT_NOTE_NEW, AWParam ] );// crm_const.pas
//    //iq_NewCRMNoteForEmployee      : DoCOMJump( 'IQCRM', [ crm_const.CRM_EMPLOYEE_NOTE_NEW       , AWParam ] );// crm_const.pas
//    //iq_NewCRMSupportIssueForCustomer      : DoCOMJump( 'IQCRM', [ crm_const.CRM_CUSTOMER_SUPPORT_NEW       , AWParam ] );// crm_const.pas
//    //iq_NewCRMSupportIssueForContact       : DoCOMJump( 'IQCRM', [ crm_const.CRM_CONTACT_SUPPORT_NEW        , AWParam ] );// crm_const.pas
//    //iq_NewCRMSupportIssueForVendor        : DoCOMJump( 'IQCRM', [ crm_const.CRM_VENDOR_SUPPORT_NEW         , AWParam ] );// crm_const.pas
//    //iq_NewCRMSupportIssueForVendorContact : DoCOMJump( 'IQCRM', [ crm_const.CRM_VENDOR_CONTACT_SUPPORT_NEW , AWParam ] );// crm_const.pas
//    //iq_NewCRMSupportIssueForPartner       : DoCOMJump( 'IQCRM', [ crm_const.CRM_PARTNER_SUPPORT_NEW        , AWParam ] );// crm_const.pas
//    //iq_NewCRMSupportIssueForPartnerContact: DoCOMJump( 'IQCRM', [ crm_const.CRM_PARTNER_CONTACT_SUPPORT_NEW, AWParam ] );// crm_const.pas
//    //iq_NewCRMSupportIssueForEmployee      : DoCOMJump( 'IQCRM', [ crm_const.CRM_EMPLOYEE_SUPPORT_NEW       , AWParam ] );// crm_const.pas
//
//    iq_DeleteCRMActivity          :
//     if AWParam > 0 then crm.DoCRM(crm_const.CRM_DELETE_ACTIVITY, AWParam);// crm_const.pas
//    iq_JumpToSalesConfigTemplates : crm.DoCRM(crm_const.CRM_SALES_CONFIG, AWParam);
//    iq_JumpToCRMCalendar:
//      DoDNETCOMJump( dllCRMCalendar, namespaceCRMCalendar, [crm_const.CRM_CALENDAR, AWParam] );
//    iq_JumpToCRMScheduleCoordinator:
//      //DoDNETCOMJump( dllCRM, namespaceCRM, [crm_const.CRM_SCHEDULE_COORDINATOR, AWParam] );
//      crm_schedcoord.DoScheduleCoordinator(Application.MainForm);
//    iq_JumpToCRMHolidays:
//      //DoDNETCOMJump( dllCRM, namespaceCRM, [crm_const.CRM_HOLIDAYS, AWParam] );
//      crm_holiday.DoCRMHolidays;
//    iq_JumpToCRMPendingActReq:
//      DoCheckMeetingRequestStatus; //crm_schedule_request.pas
//    iq_JumpToCRMReminders:
//      DoAlertSummary( AOwner ); //crm_reminder.pas
//
//    // 06/15/2012 CRM Import/Export
//    iq_JumpToCRMImport: crm_dbtrans_imp.DoCRMImport;
//    iq_JumpToCRMExport: crm_dbtrans_exp.DoCRMExport;
//
//    iq_JumpToHistSalesOrder       : DoIQJumpArchivedOrders( AOwner, AWParam );                   // oe_hist.pas
//    iq_JumpToJobShop              : DoJobShop( AWParam );                                        // js_main.pas
//    iq_JumpToARPrepost            : DoInvoiceJump( AWParam );                                    // inv_main.pas
//    iq_JumpToCAR                  : DoCOMJump( 'IQQC', [ QC_Const.QC_CAR_MAINT,  AWParam ] );    // QC_Const.pas
//    iq_JumpToAPQP                 : DoCOMJump( 'IQQC', [ QC_Const.QC_APQP_MAINT, AWParam ] );    // QC_Const.pas
//    iq_JumpToECO                  : DoCOMJump( 'IQQC', [ QC_Const.QC_ECO_MAINT, AWParam ] );     // QC_Const.pas
//    iq_JumpToPPAP                 : DoCOMJump( 'IQQC', [ QC_Const.QC_PPAP_MAINT, AWParam ] );    // QC_Const.pas
//    iq_jumpToQualityAudit         : DoCOMJump( 'IQQC', [ QC_Const.QC_AUDIT, AWParam ] );         // QC_Const.pas
//    iq_jumpToQualityAuditWorkFlow : DoCOMJump( 'IQQC', [ QC_Const.QC_AUDIT_WORKFLOW, AWParam ] );         // QC_Const.pas
//
//    // Sales/Distribution Tab
//    iq_JumpToBOL                  : DoJumpToBOL( AOwner, AWParam );                              // Bol.pas
//    iq_JumpToManualPS             : DOManualPackSlipJump( AWParam );                             // psmanual.pas
//    iq_JumpToShipVia              : DoEditFreight( AOwner );                                        // IFreight.pas
//    iq_JumpToPrintLabels          : DoPrintLMPackslip( Application.MainForm );
//    iq_JumpToLabelMaintenance     : DoLabelMaintenance( AOwner );                                   // IQLMEdit.pas
//    iq_JumpToSalesAnalysis        : DoSalesAnalysisViaPivotTable;                                   // SalesPiv.pas
//    iq_JumpToWebOrderImport       : DoWeb_Oe;                                                       // w_oe.pas
//    iq_JumpToVMI                  : DoVMI_Consume;                                                  // VMI_Consume.pas
//    iq_JumpToModalYearReset       : DoAutoCum( AOwner );                                            // AutoCum.pas
//    iq_JumpToICT                  : TFrmICT_Main.DoShow;                                            // ict_main.pas
//
//    // Mfg Tab
//    iq_JumpToPLM                  : TFrmPlm_Main.DoShow( AOwner, AWParam );                      // plm_main.pas
//    iq_JumpToDHR                  : TFrmDHR_Main.DoShow( AOwner, AWParam  );                     // dhr_main.pas
//    iq_JumpToVisualBOM            : EditRoutingBOM( AOwner,                                         // RBom_Main.pas
//                                                    AWParam ,   // Arinvt_ID
//                                                    ALParam ); // Standard_ID
//    iq_JumpToInvTransLocs         : DoTransactions( AOwner, AWParam  );                          // TranMain.pas
//    iq_JumpToMPS                  : DoCOMJump( 'IQMps', [ MPS_Const.MPS_SHOW_EXCEPTIONS, 0 ] );     // MPS_Const.pas
//    iq_JumpToFabTrack             : DoCOMJump( 'FabTrack', [ FAB_Const.FAB_TRACK_MAINT, 0 ] );      // Fab_Const.pas
//    iq_JumpToFabProcess           : DoCOMJump( 'FabTrack', [ FAB_Const.FAB_SNDOP_MAINT, 0 ] );      // Fab_Const.pas
//    iq_JumpToAssyTrack            : TFrmAssyTrackMain.DoShow( AOwner );                             // AssyTrack_Main.pas
//    iq_JumpToAssyProcess          : TSnd_Assembly.DoShow( AWParam );                             // Snd_AS.pas
//    iq_JumpToSndop                : ShowSndOperModaless( AOwner, AWParam, ''  );                 // Snd_Link.pas
//    iq_JumpToQSndop               : QShowSndOperModaless( AOwner, AWParam, '' );                 // QSnd_Lnk.pas
//
//    iq_JumpToProdDispo            : DoIQProdRep( AWParam );                                      // MainProd.pas
//    iq_JumpToShopSetup            : ShopSetUpEx;                                                    // Shop_SU.pas
//    iq_JumpToLotTrack             : DoLotTracking( AOwner );                                        // LotTrack.pas
//    iq_JumpToSerialTrack          : DoSerialTracking( AOwner );                                     // SerTrack.pas
//    iq_JumpToWorkCenterAssy2      : TFrmWorkCenterAssy2.DoShow( AOwner, AWParam );               // wc_assy2.pas
//    iq_JumpToProdCode             : TFrmInvProdCode.DoShowModal( AWParam );                      // InvProdCode.pas
//    iq_JumpToSerialTrackPrintRange: TFrmSerialPrintRange.DoShow( Application );                     // SerReprintRange.pas
//    iq_JumpToProductionReportingByWorkOrder: TFrmPRW_Main.DoShow( AOwner, AWParam );
//    iq_JumpToSlitOptim            :  DoCOMJump( 'IQSLIT', [ 0 ]);                               {jumperDispatcher.pas}
//
//    // AR Tab
//    iq_JumpToCustomerStatus       : DoCustStat( AOwner, AWParam );                               // cstat.pas
//    iq_JumpToDunningLetters       : DoCOMJump( 'DUNNING', [ 0,  0 ] );
//    iq_JumpToCreditCardSettlement : iqcc.CC_DoSettleCreditCharges;                                  // iqcc.pas
//    iq_JumpToBillTo               : DoIQJumpToBillTo( AOwner, AWParam );
//    iq_JumpToShipTo               : DoIQJumpToShipTo( AOwner, AWParam );
//    iq_JumpToRebateManager        : DoRebateManager( AOwner );  {RebateManager.pas}
//    iq_JumpToRebateParameters     : DoRebateParams( AOwner ); {RebateParam.pas}
//    iq_JumpToPrior_AR             : DoInvoice('PRIOR'); //Inv_Main.pas
//
//    // PO/Receiving Tab
//    iq_JumpToApprovePO            : DoIQJumpApprovePO( AOwner, AWParam );
//    iq_JumpToICTReceive           : TFrmICT_Receive.DoShow;                                         // ict_receive.pas
//    iq_JumpToPendingASN           : TFrmRecvPendAsn.DoShow( AOwner );                               // rec_pend_asn.pas
//    iq_JumpToOutsourceCentral     : TFrmOutsourceCentralMain.DoShow( AOwner );                      // oc_main.pas
//    iq_JumpToDropShipReceipts     : TFrmOutsourceManualReceipt.DoShow( AOwner );                    // oc_manual_receipt.pas
//    iq_JumpToReceiptsReceipt      : DoIQJumpToPOReceiptReceipt(AOwner, AWParam);                 // RecMain.pas
//    iq_JumpToExpectedPOReceipts   : TFrmPOExpectedReceipts.DoShow( AOwner, AWParam );            // po_expected_receipts.pas
//    iq_JumpToReceivingbyReceiptNum : TFrmReceiveER.DoShow( AOwner );                                // recmain_er.pas
//    iq_JumpToPO_History           :  TFrmPO_Hist_Ex.DoShowModal;                                    // po_hist_ex.pas PO History, not archived POs
//    iq_JumpToMaterialExceptionMenu : TFrmSchedMatReqMenuDlg.DoShow( AOwner );                       // sched_mat_req_menu_dlg
//
//    // AP Tab
//    iq_JumpToCashDisbursements    : DoIQCD;                                                         // CD_Main.pas
//    iq_JumpToVendorStatus         : DoVendStat( AOwner, 0 );                                        // ApVendSt.pas
//    iq_JumpTo1099Form             : Do1099;                                                         // AP1099.pas
//    iq_JumpToAPPosted             : DoJumptoAPPosted( AWParam );                                 // APView.pas
//    iq_JumpToCDPosted             : DoJumptoCD( AWParam );                                       // CDView.pas
//    iq_JumpToCDPrePost            : JumpToCD( AOwner, AWParam );                                 // CD_Main.pas
//    iq_JumpToPrior_AP             : DoIQAP('PRIOR'); //AP_Main.pas
//
//    // Estimating tab
//    iq_jumpToRFQ_Log              : TFrmQ_Log.DoShow( AOwner );                                     // Q_log.pas
//    iq_jumpToVisualQuoteRouting   : EditRoutingRFQ( AOwner,                                         // RRfq_Main.pas
//                                                    0,    // Qinvt_ID
//                                                    0 );  // Quote_ID
//
//    // Real Time Monitoring
//    iq_jumpToRTMonitor            : DoIQRT( AWParam );  // RT_Main.pas
//    iq_jumpToIQLog                : DoIQLog( AOwner, [ NIL ] );  // IQLog.pas
//    iq_jumpToRTMeter              : DoCOMJump( 'IQMeter', [ M_Const.M_RT_EFFICIENCY , 0 ] );        // M_Const.pas
//    iq_jumpToRTPlantEfficiency    : DoCOMJump( 'IQMeter', [ M_Const.M_RT_EFFICIENCY_VIEW, 0, 0 ] ); // M_Const.pas
//    iq_jumpToRTWorkorderHistory   : TFrmRT_Hist.DoShow;                                             // rt_hist.pas
//    iq_jumpToRTWorkCenter         : RTShowIndividualWorkCenter( AWParam );  // RT_Main.pas
//    // {Obsolete} iq_jumpToRTPCMonSetup         : DoRTProcMonWorkCenterSetup; // Rtpcmon_cntr_setup.pas
//    //Now calling .NET form
//    iq_jumpToRTPCMonSetup         : DoDNETCOMJump( 'IQCapabMapper', 'IQCapabMapper.IQInterface', [] );
//    iq_jumpToRTPCMonBOMSetup      : TFrmRTPcMonBOMSetup.DoPCMonMfgSetupDevice( AOwner, AWParam ); // rtpcmon_bom_setup.pas {PCMON_BOM.ID passed}
//    iq_jumpToRTPCMon              : TFrmRTPcmonWrkCntrSetup.DoRTProcessMonitor( AOwner ); // rtpcmon_bom_setup.pas
//    iq_jumpToPCMonMfgSetup        : TFrmRTPcMonBOMSetup.DoPCMonMfgSetup( AOwner, AWParam ); //rtpcmon_bom_setup.pas {STANDARD.ID passed}
//
//
//    //  Process Cost
//    iq_jumpToProcessCost          : DoCOMJump( 'IQCost', [ Cost_Const.COST_PROCESS_COST, 0 ] );     // Cost_Const.pas
//    iq_jumpToPIT                  : DoCOMJump( 'IQCost', [ Cost_Const.COST_TRANACCT, 0 ] );         // Cost_Const.pas
//
//    // Forecast
//    iq_jumpToForecast             : DoCOMJump( 'IQForecast', [ ForeConst.FORE_SHOW_MAIN, 0 ] );     // ForeConst.pas
//
//    // Quality
//    iq_jumpToDocumentControl      : DoCOMJump( 'IQQC', [ QC_Const.QC_DOC_MAINT, AWParam ] );     // QC_Const.pas
//    iq_jumpToCAPA                 : DoCOMJump( 'IQQC', [ QC_Const.QC_CAPA_MAINT, AWParam ] );    // QC_Const.pas
//    iq_jumpToDev                  : DoCOMJump( 'IQQC', [ QC_Const.QC_DEVIATION_MAINT, AWParam ]);// QC_Const.pas
//    iq_jumpToProcPQ               : DoCOMJump( 'IQQC', [ QC_Const.QC_PROC_PQ_MAINT, AWParam ] ); // QC_Const.pas
//    iq_jumpToProdPQ               : DoCOMJump( 'IQQC', [ QC_Const.QC_PROD_PQ_MAINT, AWParam ] ); // QC_Const.pas
//    iq_jumpToMRB                  : DoCOMJump( 'IQQC', [ QC_Const.QC_MRB_MAINT, AWParam ] );     // QC_Const.pas
//    iq_jumpToTeamMembers          : DoCOMJump( 'IQQC', [ QC_DOC_TEAM_MAINT, AWParam ] );         // QC_Const.pas
//    iq_jumpToCostOfQuality        : DoCOMJump( 'IQQC', [ QC_Const.QC_GENERAL_COQ, AWParam ] );
//    iq_jumpToQualityProjects      : spc.DoQualityProjects( AWParam );                            // spc.pas
//    iq_jumpToControlPlan          : spc.DoControlPlan( AWParam );                                // spc.pas
//    iq_jumpToFMEA                 : spc.DoFMEA( False,        // Medical                            // spc.pas
//                                                AWParam ); // FMEA.ID
//    iq_jumpToRiskAssessment       : spc.DoFMEA( True,         // Medical                            // spc.pas
//                                                AWParam ); // FMEA.ID
//    iq_jumpToGagesDevices         : spc.DoSPCGages( AWParam );                                   // spc.pas
//    iq_jumpToInspectionSetup      : spc.DoInspectionSetup();                                        // spc.pas
//    iq_jumpToSPC                  : spc.DoSPCMain;                                                  // spc.pas
//    iq_jumpToQuickInspection      : spc.DoSPCQuickInspectionEx;                                     // spc.pas
//    iq_jumpToInspectionLog        : spc.DoInProcessInspectionLog(AWParam);                       // spc.pas
//    //Com_Exec( 'IQQC', [ QC_Const.QC_DOC_INSERT_NEW_DOC_PROMPT, FDoc_Library_ID, AExternal_Doc_ID ]); {iqcomexe.pas}
//    iq_JumpToDocumentControlInsertNew : DoCOMJump( 'IQQC',
//      [ QC_Const.QC_DOC_INSERT_NEW_DOC_PROMPT, AWParam, ALParam] );     // QC_Const.pas          // spc.pas
//    iq_jumpToInspRecordApproval   : spc.DoSPC(spc_const.SHOW_INSPECTION_APPROVAL);
//
//    // AP
//    iq_JumpToAPPrepost            : DoIQAP( 'AP', AWParam );                                     // AP_Main.pas
//    iq_JumpToAccruedFreight       : DoAccruedFreight( AOwner );                                     // AccruedFreight.pas
//    iq_JumpToAPWorkFlow           : begin
//                                      TFrmAPWorkflowMain.EnsureAPWorkflowExists( AOwner, AWParam );                 // ap_wf_main.pas
//                                      TFrmAPWorkflowMain.DoShowWorkflowAssociatedWithAPInvoice( AOwner, AWParam );  // ap_wf_main.pas
//                                    end;
//
//    // GL
//    iq_JumpToGL_ChartofAccounts   : DoIQGL;                                                         // GL.pas
//    iq_JumpToGL_AccountActivity   : DoActivity( AOwner );                                           // Activity.pas
//    iq_JumpToGJ_GeneralJournal    : DoGeneralJournal( AOwner );                                     // Journal.pas
//    iq_JumpToGL_Financial_Report  : DoFinancialReport;                                              // Fin_Rpt.pas
//    iq_JumpToGL_Trial_Balance     : DoTrialBalance( AOwner );                                       // GLTrialB.pas
//    iq_JumpToGL_Cash_Analysis     : DOBMAnalysis;                                                   // BMAnalys.pas
//    iq_JumpToGL_Budgets           : DoGLBudget;                                                     // GLBudget.pas
//    iq_JumpToGL_Frx_Reports       : DoJumpToGL_Frx_Reports;
//    iq_JumpToGL_Frx_Structure     : DoFrlSysCtrl;                                                   // FrlCtrl.pas
//    iq_JumpToGL_Account_Revaluation : DoAccuntRevaluation;                                          // GLReval.pas
//    iq_JumpToGL_Bank_Reconciliation : DoReconcile( AOwner );                                        // BMRecons.pas
//    iq_JumpToGL_Bank_Reconcil_Hist  :  DoReconcileHist;                                              // BMRecons.pas
//    // Payroll
//    iq_JumpToPayroll_Emp_Maint    : DoCOMJump( 'IQPR', [ prconst.SHOW_PR_EMPLOYEES, 0 ] );          // PrConst.pas
//    iq_JumpToPayroll_Plugins      : DoCOMJump( 'IQPR', [ prconst.SHOW_PLUGINS, 0 ] );               // PrConst.pas
//    iq_JumpToPayroll_Paygroup     : DoCOMJump( 'IQPR', [ prconst.SHOW_PAYGROUPS, 0 ] );             // PrConst.pas
//    iq_JumpToPayroll_Paytype      : DoCOMJump( 'IQPR', [ prconst.SHOW_PR_PAYTYPES, 0 ] );           // PrConst.pas
//    iq_JumpToPayroll_Taxes        : DoCOMJump( 'IQPR', [ prconst.SHOW_PR_TAXES, 0 ] );              // PrConst.pas
//    iq_JumpToPayroll_Deductions   : DoCOMJump( 'IQPR', [ prconst.SHOW_PR_DEDUCTIONS, 0 ] );         // PrConst.pas
//    iq_JumpToPayroll_TimeCards    : DoCOMJump( 'IQPR', [ prconst.SHOW_PR_TIMECARDS, 0 ] );          // PrConst.pas
//    iq_JumpToPayroll_Prepare      : DoCOMJump( 'IQPR', [ prconst.SHOW_PR_CHECK_PAYROLL, 0 ] );      // PrConst.pas
//    iq_JumpToPayroll_Review       : DoCOMJump( 'IQPR', [ prconst.SHOW_PAYROLL, 0 ] );               // PrConst.pas
//    iq_JumpToPayroll_DD           : DoCOMJump( 'IQPR', [ prconst.SHOW_POSTED_DD, 0 ] );             // PrConst.pas
//    iq_JumpToPayroll_Employees    : DoCOMJump( 'IQPR', [ prconst.SHOW_EMPLOYEES, AWParam ] );    // PrConst.pas
//
//    //TA
//    iq_JumpToTA_ClockInOut        : DoCOMJump( 'IQTA', [ SHOW_TA_CLOCK_IN_OUT_LAUNCHER, 0 ]);       // TAConst.pas
//    iq_JumpToTA_Shifts            : DoCOMJump( 'IQTA', [ SHOW_TA_SHIFTS, 0 ] );                     // TAConst.pas
//    iq_JumpToTA_Prepost           : DoCOMJump( 'IQTA', [ SHOW_TA_PREPOST, 0 ] );                    // TAConst.pas
//    iq_JumpToTA_ClockInMaint      : DoCOMJump( 'IQTA', [ SHOW_TA_EMP_CLOCK, 0 ] );                  // TAConst.pas
//    iq_JumpToTA_PayRules          : DoCOMJump( 'IQTA', [ SHOW_TA_PAYRULES, 0 ] );                   // TAConst.pas
//    iq_JumpToTA_ShiftSettings     : DoCOMJump( 'IQTA', [ SHOW_TA_SETTINGS, 0 ] );                   // TAConst.pas
//    iq_JumpToTA_TaskClockIn       : DoCOMJump( 'IQTA', [ SHOW_TA_TASK_CLOCK_LAUNCHER, 0 ] );        // TAConst.pas
//    iq_JumpToTA_TaskClockInMaint  : DoCOMJump( 'IQTA', [ SHOW_TA_EMP_TASK, 0 ] );                   // TAConst.pas
//    iq_JumpToTA_TaskClockInMaint1 : DoCOMJump( 'IQTA', [ SHOW_TA_EMP_TASK_ONE, 0 ] );               // TAConst.pas
//    iq_JumpToTA_Incentive         : DoCOMJump( 'IQTA', [ SHOW_TA_INC_PAY, 0 ] );                    // TAConst.pas
//    iq_JumpToTA_TaskMessage       : DoCOMJump( 'IQTA', [ SHOW_TA_MESSAGES, 0 ] );                   // TAConst.pas
//    iq_JumpToTA_AbcenseCal        : DoCOMJump( 'IQTA', [ SHOW_TA_EMP_CAL, 0 ] );                    // TAConst.pas
//    iq_JumpToTA_ViolationScript   : DoCOMJump( 'IQTA', [ SHOW_TA_VIOLATION_SCRIPT, 0 ] );           // TAConst.pas
//    iq_JumpToTA_AttendanceViol    : DoCOMJump( 'IQTA', [ SHOW_TA_EMP_VIOLATION, 0 ] );              // TAConst.pas
//    iq_JumpToTA_WhoIsLoggedIn     : FindWhoLoggedIn(AOwner, []);                                    // WhoLoggedIn.pas
//
//    // Workforce
//    iq_JumpToWF_Skills            : DoCOMJump( 'IQHR', [ SHOW_PM_SKILLS, 0 ] );                     // HR_Const.pas
//    iq_JumpToWF_Training          : DoCOMJump( 'IQHR', [ SHOW_TRAINING_ITEMS, 0 ] );                // HR_Const.pas
//    iq_JumpToWF_EmpTraining       : DoCOMJump( 'IQHR', [ SHOW_EMP_TRAINING, 0 ] );                  // HR_Const.pas
//    iq_JumpToWF_JobDesc           : DoCOMJump( 'IQHR', [ SHOW_JOB_DESCRIP, 0 ] );                   // HR_Const.pas
//    iq_JumpToWF_Applicants        : DoCOMJump( 'IQHR', [ SHOW_HRAPP, 0 ] );                         // HR_Const.pas
//    iq_JumpToWF_Requisitions      : DoCOMJump( 'IQHR', [ SHOW_HRREQUISITION, 0 ] );                 // HR_Const.pas
//    iq_JumpToWF_Ilness            : DoCOMJump( 'IQHR', [ SHOW_INJURY_LOG, 0 ] );                    // HR_Const.pas
////    iq_JumpToWF_HREmpMaint        : DoCOMJump( 'IQHR', [ SHOW_PR_HR, 0 ] );                         // HR_Const.pas
//    iq_JumpToWF_HREmpMaint        : DoCOMJump( 'IQPR', [ SHOW_PR_HR, 0 ]);                          {PrConst, jumpDispatcher.pas}
//    iq_JumptoHREmpWorkflow        : DOChooseWF(AOwner);                                             // ChooseWF.pas
//
//
//    // ECommerce
//    iq_JumpToEC_EDIMaint          : DoCOMJump( 'IQEDI', [ SHOW_EDI_PARSE, '', 0, 0, 0 ] );          // EDIConst.pas
//    iq_JumpToEC_ArchEDI           : DoCOMJump( 'IQEDI', [ SHOW_EDI_ARCHIVED, '', 0, 0, 0 ] );       // EDIConst.pas
//    iq_JumpToEC_PendEDI           : DoCOMJump( 'IQEDI', [ SHOW_EDI_PEND, '', 0, 0, 0 ] );           // EDIConst.pas
//    iq_JumpToEC_VendEDI           : DoCOMJump( 'IQEDI', [ SHOW_EDI_VENDOR, '', 0, 0, 0 ] );         // EDIConst.pas
//    iq_JumpToEC_TSMaint           : DoCOMJump( 'IQEDI', [ SHOW_EDI_TR_SET, '', 0, 0, 0 ] );         // EDIConst.pas
//    iq_JumpToEC_TPMaint           : DoCOMJump( 'IQEDI', [ SHOW_EDI_PARTNERS, '', 0, 0, 0 ] );       // EDIConst.pas
//    iq_JumpToEC_FunckAck          : DoCOMJump( 'IQEDI', [ SHOW_EDI_997, '', 0, 0, 0 ] );            // EDIConst.pas
//    iq_JumpToEC_OutLog            : DoCOMJump( 'IQEDI', [ SHOW_EDI_OUTBOUND_LOG, '', 0, 0, 0 ] );   // EDIConst.pas
//    iq_JumpToEC_FileImport        : DoCOMJump( 'IQIMP', [ SHOW_IMP_MAIN, '', 0, 0, 0 ] );           // ImpConst.pas
//    iq_JumpToEC_SchemaMaint       : DoCOMJump( 'IQIMP', [ SHOW_SCHEMA_MAIN, '', 0, 0, 0 ] );        // ImpConst.pas
//    iq_JumpToEC_XML_Maint         : DoCOMJump( 'IQEDI', [ SHOW_EDI_XML_TEMPL, '', 0, 0, 0 ] );      // EDIConst.pas
//    iq_JumpToEC_XML_Import        : DoCOMJump( 'IQIMP', [ SHOW_XML_SETUP, '', 0, 0, 0 ] );          // ImpConst.pas
//
//    // Assets
//    iq_JumpToAM_FAMaint           : DoCOMJump( 'IQFA', [ SHOW_FA_MAIN, '', AWParam, 0, 0 ] );    // FAConst.pas
//    iq_JumpToAM_FABookTempl       : DoCOMJump( 'IQFA', [ SHOW_FA_BOOKS, '', 0, 0, 0 ] );            // FAConst.pas
//    iq_JumpToAM_FAClassLives      : DoCOMJump( 'IQFA', [ SHOW_FA_CLASS, '', 0, 0, 0 ] );            // FAConst.pas
//    iq_JumpToAM_FAGL              : DoCOMJump( 'IQFA', [ SHOW_FA_GL, '', 0, 0, 0 ] );               // FAConst.pas
//    iq_JumpToAM_FAImport          : DoCOMJump( 'IQFA', [ SHOW_IMP_FA, '', 0, 0, 0 ] );              // FAConst.pas
//    iq_JumpToPOHist               : DoIQJumpToPoHist( AOwner, AWParam );                         // Po_Hist.pas {archived POs}
//    iq_JumpToPMWorkOrder          : // DoCOMJump( 'IQPM', [ PM_Const.PM_JUMP_WO, AWParam ]);        // PM_Const.pas
//      pm_wo.DoJumpToPMWO(AOwner, AWParam );
//
//    // pickticket
//    iq_JumpToPickTicket           : DoPSTickets( AWParam );                                               // PSTicket.pas
//
//    // 05-04-2015 EIQ-7008 Sales and Distribution - hide Configuration Wizard and Model Wizard from launcher - Internal
//    // sales config wizard
//    // iq_JumpToSalesOrderConfigWizard : DoCOMJump( 'IQConfig', [ Cnf_Const.CNF_SHOW_MODELER, 0 ] );   // Cnf_Const.pas
//    // iq_JumpToSalesModelDesignWizard : DoCOMJump( 'IQConfig', [ Cnf_Const.CNF_SHOW_WIZARD, 0 ] );    // Cnf_Const.pas
//
//    iq_JumpToVendor_RFQ :
//       begin
//         ACargo.Source   := '';         // ven_rfq_share.pas
//         ACargo.Arinvt_ID:= 0;          // all blank values will cause the picklist to come up
//         ACargo.Qinvt_ID := 0;
//         ACargo.PmEqmt_ID:= 0;
//         TFrmVendorRFQMain.DoShow( AOwner, ACargo, AWParam ); // ven_rfq_main.pas
//       end;
//    iq_ExpRep_Users                : DoExpReportUsers(AOwner);
//    iq_ExpReports                  : DoExpenseReports(AOwner);
//    iq_ExpRep_appr                 : DoApproveExpense(AOwner);
//
//    iq_JumpToShipmanManifest       : DoCOMJump( 'IQSHIPMAN', [shipman_const.SHIP_MANIFEST, 0 {SHIPMENTS.ID}, '' ]);
//    iq_JumpToShipmanCarrierMaint   : DoCOMJump( 'IQSHIPMAN', [shipman_const.SHIP_CARRIER, 0, '' {Nothing} ]);
//    iq_JumpToShipmanCloseShipments : DoCOMJump( 'IQSHIPMAN', [shipman_const.SHIP_CLOSE, 0, '' {Nothing} ]);
//    iq_JumpToDockScheduler         : DoDNETCOMJump( 'IQMS.IQShipman', 'IQMS.IQShipman.DockScheduler.IQShell', [] );
//    iq_JumpToShipmanLTL            : DoShipmanLTLwithPicker( AOwner );
//
//
//    iq_JumpToSalesPeople             : DoJumpToSalesPeople(AOwner, AWParam  );                       // mainsale.pas
//    iq_JumpToCashReceipts            : DoCrJumpToCrPrepost(AOwner, AWParam  );                       // CashRec.pas
//    iq_JumpToCashRecwithPkr          : DoCr(AOwner);                                                 // CashRec.pas
//    iq_JumpToVendorRMAHeader         : Vend_RMA.DoJumpToRMAHeader(AOwner, AWParam);
//    iq_JumpExpReportsDetail          : DoJumpToExpenseReportsDetail(AOwner, AWParam);
//    iq_JumpHRApp                     : DOHRApp(AOwner, AWParam);                                     //HRApp.pas
//    iq_JumpHREmpTraining             : DoJumpHREmpTraining(AOwner, AWParam);   // HREmpTR.pas
//
//    iq_JumpToRepdef_Cat              : TFrmRepDef_Cat.DoShow;  // repdef_cat.pas
//    iq_jumpToActualCostPosting       : TFrmActPit.DoShow( AOwner );  //jc_act_pit.pas  changed to new form EIQ-1694 12/09/13 AB
//
//    iq_JumpToHeijunka                : TFrmHeijunkaMain.DoShow( AOwner );    // heijunka_main.pas
//
//    iq_JumpToKBSupermkt              : TFrmKB_Supermarket.DoShow( AOwner );   // kb_supermarket.pas
//
//    iq_NotifySetForegroundWindow     : SetVisibleWindowsToForeground; {IQScreen.pas}
//
//    iq_jumpToReviewDept              : DoReviewDepr(AOwner); {FaReviewDept.pas}
//
//    // System Setup
//    iq_JumpToSystem_Parameters       : DoSysParameters( AOwner, nil );    // sys.pas
//    iq_JumpToSecurity_Inspector      : DoJumptoSI_byServerName( AOwner );      // IQSecIns.pas
//    iq_JumpToAdHocQuery              : TFrmEISQueryExec.DoShow( AOwner, AWParam ); //eis_query_exec.pas
//    iq_JumpToBankMaint               : DoIQBM;   // bm_main.pas
//    iq_JumpBM                : DoJumpToBM(AWParam);  // Bm_Main.pas
//    iq_JumpToMultiCurrency           : begin
//                                         Application.ProcessMessages; //allow click to finish
//                                         if SelectValueAsString('select multicurrency from iqsys') <> 'Y' then
//                                         begin
//                                           if IQConfirmYN('You must enable multi-currency in system parameters - would yo like to do so now?') then
//                                             DoSysParameters(AOwner, nil);
//                                           EXIT;
//                                         end;
//                                         DoMultiCurrencyModal; // MCRates.pas
//                                       end;
//    iq_JumpToTerms                   : DoTerms( AOwner, NIL ); //Terms.pas
//    iq_JumpToTaxCodes                : DoTaxCode( AOwner ); // taxmain.pas
//    iq_JumpToCostElements            : DoCostElem;   // cost_elm.pas
//    iq_JumpToArchiver                : DoEIQArchiver( AOwner );
//    iq_JumpToChangePW                : DoChangePassword;          {ChgPswex.pas}
//    iq_JumpToSystemSetupEmpMaint     :  DoCOMJump( 'IQPR', [ SHOW_EMPLOYEES, 0 ]);    {PRConst, JumperDispatcher.pas}
//
//    //WMS Control
//    iq_JumptoWMSProfile              : TFrmProfile_Main.ShowModeless; //profile_main.pas
//    iq_JumptoTransactionsRules       : TFrmInvTransRules.DoShow( AOwner, AWParam  );  // inv_trans_rules.pas
//    iq_JumptoTransactionRuleDetail   : TFrmInvTransRules.DoShowDetail( AOwner, AWParam );  // inv_trans_rules.pas, AWParam is inv_trans_rule_detail_id
//    iq_JumptoPendingTransactions     : TFrmInvTransAlert.DoShow( AOwner ); // inv_trans_alert.pas
//    iq_JumptoWMS_Setup               : TFrmInvWmsSetup.DoShow( AOwner ); //inv_wms_setup
//    iq_JumptoWMS_Teams               : TFrmInvRFTeams.DoShow( AOwner );  // inv_rf_teams.pas
//    iq_JumptoWaveMgmtSOPicking       : TFrmWavePick.DoShow( AOwner, AWParam );  // wave_pick.pas
//    iq_JumptoWaveMgmtWOStaging       : TFrmInvTransMatStaging.DoShow( AOwner );  // inv_trans_mat_staging.pas
//    iq_JumptoDirTaskMonitoring       : TFrmInvTransAlert.DoShow( AOwner ); // inv_trans_alert.pas
//
//    // Jump to Runs Best by RUNS_BEST.ID
//    iq_JumpToRunsBest                : RunsBest.DoRunsTheBestExA(AOwner, AWParam);
//    // Jump to Runs Best by STANDARD.ID
//    iq_JumpToRunsBestBOM             : RunsBest.DoRunsTheBestEx(AOwner, AWParam);
//
//    iq_JumpToBOLParams               : TFrmInvBOLParams.DoShow( AOwner, AWParam {arinvt_id});  // inv_bol_params.pas
//
//    iq_JumpToIQExtensionSetup        : TFrmEIS_SetUp.DoShowModal(AOwner); // eis_setup.pas
//
//    iq_JumpToMyAlerts                : TFrmIQMonMyAlerts.DoShowModal( AOwner );  // Mon_MyAlerts.pas
//
//
//
//    { ***************************E X E C U T E  M E T H O D S *******************************}
//    (* Estimating *)
//    iq_ExecEngQuoteRecalcOptimPrice            : DoSilentQuoteRecalcandOptimization( AOwner, AWParam, TRUE, -1 (*optimize by price*)  ); // Q_Shell.pas
//    iq_ExecEngQuoteRecalcOptimPercent          : DoSilentQuoteRecalcandOptimization( AOwner, AWParam, TRUE, 0  (*optimize by percent*)); // Q_Shell.pas
//    iq_ExecEngQuoteRecalcOptimMargin           : DoSilentQuoteRecalcandOptimization( AOwner, AWParam, TRUE, 1  (*optimize by margin*) ); // Q_Shell.pas
//    iq_ExecEngQuoteRecalcOptimYield            : DoSilentQuoteRecalcandOptimization( AOwner, AWParam, TRUE, 2  (*optimize by yield*)  ); // Q_Shell.pas
//    iq_ExecEngQuoteRecalcOnly                  : DoSilentQuoteRecalcandOptimization( AOwner, AWParam, FALSE,   (*no optimization*) -1); // Q_Shell.pas
//
//    { ***************************E X E C U T E  M E T H O D S *******************************}
//
//    iq_PlantLayout                   : //TDNetPlantLayout.Show(); // in DNetComShr.pas
//      // DoDNETCOMJump( dllPlantLayout, namespacePlantLayout, [1] );
//      TPlantLayout.ShowPlantLayout
//    else
//      raise Exception.CreateFmt( 'Jump IQ %d Not Implemented!', [ Msg.Msg ] );
//  end;
end;


procedure DoJumpToScheduleByWorkorder( AWorkorder_ID: Real );
var
  AMfgType: string;
begin
  AMfgType:= SelectValueFmtAsString('select mfg.lookup_mfgtype(s.mfg_type) from workorder w, standard s where w.id = %f and w.standard_id = s.id', [AWorkorder_ID]);

//  if AMfgType = 'ASSY1' then
//     AssyTrack_Main.TFrmAssyTrackMain.DoShow( Application, AWorkorder_ID )
//
//  else if AMfgType = 'FAB' then
//     DoCOMJump( 'FabTrack', [ FAB_Const.FAB_TRACK_MAINT_BY_WORKORDER, AWorkorder_ID ])
//
//  else
//     Sched_Mn.DoIQJumpToIQScheduleByWorkorder( AWorkorder_ID )
end;


procedure DoJumpToScheduleBySndop_Dispatch_ID( ASndop_Dispatch_ID: Real );
begin
//  Sched_Mn.DoIQJumpToIQScheduleBySndop_Dispatch_ID( ASndop_Dispatch_ID );
end;

procedure DoJumptoSI_byServerName( Sender : TObject );
var
  AServerName: string;
begin
//  if GetIQCOMServerName( AServerName ) then                      {IQSecSel}
//     if AServerName = FileNameNoExt( Application.ExeName ) then  {IQFile}
//        CreateSecurityInspector                                  {IQSecIns.pas}
//     else
//        Com_LaunchSecurityInspector( AServerName );              {IQComExe}
end;

{ TIQWebJumpDispatcher }

class procedure TIQWebJumpDispatcher.ExecuteJump(aClassName: string; aID: integer);
const
  JumpDispatcherNotInitialized = 'The jump engine was called before it was initialized.';
begin
  if Assigned(FOnExecuteJump) then
    FOnExecuteJump(ClassName, aID)
  else
    raise Exception.Create(JumpDispatcherNotInitialized);
end;

class procedure TIQWebJumpDispatcher.Initialize(CallBack: TIQWebExecuteJumpEvent);
begin
  FOnExecuteJump := CallBack;
end;

class procedure TIQWebJumpDispatcher.Jump(aJumpTo: TJumpTo; aID: integer);
begin
  Jump(JumpMessageMap[aJumpTo], aID);
end;

class procedure TIQWebJumpDispatcher.Jump(aJumpTo: TJumpMessage; aID: integer);
begin
  ExecuteJump(IntToStr(aJumpTo), aID);
end;


end.
