unit IQMS.Common.JumpConstants;

interface

uses Winapi.Messages;

type
  // TODO -oUXCoreTeam -cDeepLinks: type we will use to idnetify the class of the form to create
  TJumpMessage = integer;

const
  iq_AfterShowMessage           = wm_User + 100;
  iq_RefreshDataSets            = wm_User + 101;
  iq_JumpToInv                  = wm_User + 102;
  iq_JumpToBom                  = wm_User + 103;
  iq_AfterCloseChild            = wm_User + 104;
  iq_JumpToPO                   = wm_User + 105;
  iq_JumpToPOReceipts           = wm_User + 106;
  iq_JumpToWorkOrder            = wm_User + 107;
  iq_JumpToSalesOrder           = wm_User + 108;
  iq_JumpToNewSalesOrder        = wm_User + 364;
  iq_JumpToSalesOrderWorkFlow   = wm_User + 453;
  iq_JumpToCustomer             = wm_User + 109;
  iq_JumpToCustomerCRM          = wm_User + 370; // for CRM only
  iq_JumpToContact              = wm_User + 371; // for CRM only
  iq_JumpToContactCRM           = wm_User + 372; // for CRM only
  iq_Notify                     = wm_User + 110;
  iq_JumpToWorkCenter           = wm_User + 111;
  iq_JumpToVendor               = wm_User + 112;
  iq_JumpToPM                   = wm_User + 113;
  iq_JumpToARInvoice            = wm_User + 114;
  iq_JumpToAPInvoice            = wm_User + 115;
  iq_MCRefreshDataSets          = wm_User + 116;
  iq_JumpToSchedule             = wm_User + 117;
  iq_JumpToTooling              = wm_User + 118;
  iq_JumpToToolingTask          = wm_User + 376;
  iq_JumpToSalesOrderDetail     = wm_User + 119;
  iq_JumpToAvailability         = wm_User + 120;
  iq_ClickNavButton             = wm_User + 121;
  iq_JumpToPackSlip             = wm_User + 122;
  iq_JumpToRMA                  = wm_User + 123;
  iq_JumpToRMAHeader            = wm_User + 358;
  iq_JumpToRMADetail            = wm_User + 359;
  iq_AfterExecute               = wm_User + 124;
  iq_NotifyError                = wm_User + 125;
  iq_LaunchLogin                = wm_User + 126;
  iq_NotifyAfterScroll          = wm_User + 127;
  iq_RequestData                = wm_User + 128;
  iq_AcceptData                 = wm_User + 129;
  iq_DCOM_Internal_Notify       = wm_User + 130;
  iq_AfterPost                  = wm_User + 131;
  iq_JumpToVendorRMADetail      = wm_User + 132;
  iq_JumpToHistSalesOrderDetail = wm_User + 133;
  iq_JumpToQuote                = wm_User + 134;
  iq_DCOM_Internal_Notify_Ex    = wm_User + 135;
  iq_JumpToHistTooling          = wm_User + 136;
  iq_SendEMailAlert             = wm_User + 140;
  iq_RefreshColor               = wm_User + 141;
  iq_JumpToPO_Header            = wm_User + 142;
  iq_SendMoteCOMM_Message       = wm_User + 143;
  iq_JumpToHistSalesOrder       = wm_User + 147;
  iq_NotifySetForegroundWindow  = wm_User + 148;  // post this message to the mainform so it will bring the TopMost windo to the foreground. (HiddenLauncher)
  iq_CloseCOMM_Message          = wm_User + 149;
  iq_AfterCreate_Message        = wm_User + 150;
  iq_JumpToJobShop              = wm_User + 151;
  iq_JumpToARPrepost            = wm_User + 152;


  // Sales/Distribution Tab
  iq_JumpToBOL                  = wm_User + 157;
  iq_JumpToManualPS             = wm_User + 158;
  iq_JumpToPackSlipShipment     = wm_User + 290;
  iq_JumpToSalesPeople          = wm_User + 159;
  iq_JumpToShipVia              = wm_User + 160;
  iq_JumpToPrintLabels          = wm_User + 161;
  iq_JumpToSalesAnalysis        = wm_User + 162;
  iq_JumpToWebOrderImport       = wm_User + 163;
  iq_JumpToVMI                  = wm_User + 164;
  iq_JumpToModalYearReset       = wm_User + 165;
  iq_JumpToICT                  = wm_User + 166;
  iq_JumpToDockScheduler        = wm_User + 429;

  // Mfg Tab
  iq_JumpToPLM                  = wm_User + 167;
  iq_JumpToDHR                  = wm_User + 168;
  iq_JumpToVisualBOM            = wm_User + 169;
  iq_JumpToInvTransLocs         = wm_User + 170;
  iq_JumpToMPS                  = wm_User + 171;
  iq_JumpToFabTrack             = wm_User + 172;
  iq_JumpToFabProcess           = wm_User + 173;
  iq_JumpToAssyTrack            = wm_User + 174;
  iq_JumpToAssyProcess          = wm_User + 175;
  iq_JumpToProdDispo            = wm_User + 176;
  iq_JumpToShopSetup            = wm_User + 177;
  iq_JumpToLotTrack             = wm_User + 178;
  iq_JumpToSerialTrack          = wm_User + 179;
  iq_JumpToInvByLoc             = wm_User + 295;
  iq_JumpToInvGroup             = wm_User + 375;
  iq_JumpToKBSupermkt           = wm_User + 425;
  iq_JumpToSlitOptim            = wm_User + 459;

  // AR Tab
  iq_JumpToCashReceipts         = wm_User + 180;
  iq_JumpToCashRecwithPkr       = wm_User + 458;
  iq_JumpToCustomerStatus       = wm_User + 181;
  iq_JumpToDunningLetters       = wm_User + 182;
  iq_JumpToCreditCardSettlement = wm_User + 183;
  iq_JumpToBillTo               = wm_User + 365;
  iq_JumpToShipTo               = wm_User + 366;
  iq_JumpToRebateManager        = wm_User + 390;
  iq_JumpToRebateParameters     = wm_User + 391;
  iq_JumpToPrior_AR             = wm_User + 440;

  // PO/Receiving Tab
  iq_JumpToApprovePO              = wm_User + 184;
  iq_JumpToICTReceive             = wm_User + 185;
  iq_JumpToPendingASN             = wm_User + 186;
  iq_JumpToOutsourceCentral       = wm_User + 187;
  iq_JumpToDropShipReceipts       = wm_User + 188;
  iq_JumpToReceiptsReceipt        = wm_User + 291;
  iq_JumpToPO_Requisition         = wm_User + 300;
  iq_JumpToPO_Header_Requisition  = wm_User + 301;
  iq_JumpToVendor_RFQ             = wm_User + 302;
  iq_JumpToExpectedPOReceipts     = wm_User + 405;
  iq_JumpToReceivingbyReceiptNum  = wm_User + 406;
  iq_JumpToPO_History             = wm_User + 422;
  iq_JumpToMaterialExceptionMenu  = wm_User + 451;


  // AP Tab
  iq_JumpToCashDisbursements    = wm_User + 189;
  iq_JumpToVendorStatus         = wm_User + 190;
  iq_JumpTo1099Form             = wm_User + 191;
  iq_JumpToAPPosted             = wm_User + 192;
  iq_JumpToCDPosted             = wm_User + 193;
  iq_JumpToCDPrePost            = wm_User + 194;
  iq_JumpToPrior_AP             = wm_User + 441;

  // Estimating tab
  iq_jumpToRFQ_Log              = wm_User + 195;
  iq_jumpToVisualQuoteRouting   = wm_User + 196;
  iq_ExecEngQuoteRecalcOptimPrice   = wm_User + 443; //doesnt show eng. quotes, just recalculates & optimizes by price
  iq_ExecEngQuoteRecalcOptimPercent = wm_User + 444; //"                                                    " by percent
  iq_ExecEngQuoteRecalcOptimMargin  = wm_User + 445; //"                                                    " by margin
  iq_ExecEngQuoteRecalcOptimYield   = wm_User + 446; //"                                                    " by yield
  iq_ExecEngQuoteRecalcOnly         = wm_User + 447; //doesnt show eng. quotes, just recalculates

  // Real Time Monitoring
  iq_jumpToRTMonitor            = wm_User + 197;
  iq_jumpToIQLog                = wm_User + 198;
  iq_jumpToRTMeter              = wm_User + 199;
  iq_jumpToRTPlantEfficiency    = wm_User + 200;
  iq_jumpToRTWorkorderHistory   = wm_User + 201;
  iq_jumpToRTWorkCenter         = wm_User + 292;
  iq_jumpToRTPCMon              = wm_User + 296; //no locate
  iq_jumpToRTPCMonSetup         = wm_User + 297; //obsolete
  iq_jumpToRTPCMonBOMSetup      = wm_User + 298; //by PCMON_BOM.ID
  iq_jumpToPCMonMfgSetup        = wm_User + 416; //by STANDARD.ID


  //  Process Cost
  iq_jumpToProcessCost          =  wm_User + 202;
  iq_jumpToPIT                  =  wm_User + 203;

  // Forecast
  iq_jumpToForecast             =  wm_User + 204;

  // Quality
  iq_jumpToDocumentControl      =  wm_User + 205;
  iq_JumpToCAR                  =  wm_User + 153;
  iq_JumpToAPQP                 =  wm_User + 154;
  iq_JumpToECO                  =  wm_User + 155;
  iq_JumpToPPAP                 =  wm_User + 156;
  iq_jumpToCAPA                 =  wm_User + 206;
  iq_jumpToDev                  =  wm_User + 207;
  iq_jumpToProcPQ               =  wm_User + 208;
  iq_jumpToProdPQ               =  wm_User + 209;
  iq_jumpToMRB                  =  wm_User + 210;
  iq_jumpToTeamMembers          =  wm_User + 211;
  iq_jumpToCostOfQuality        =  wm_User + 276; // Cost of Quality (COQ)
  iq_jumpToQualityProjects      =  wm_User + 277; // Quality Projects
  iq_jumpToControlPlan          =  wm_User + 278; // Control Plan
  iq_jumpToFMEA                 =  wm_User + 279; // FMEA
  iq_jumpToRiskAssessment       =  wm_User + 280; // FMEA (Medical)
  iq_jumpToGagesDevices         =  wm_User + 281; // SPC Gages/Devices
  iq_jumpToInspectionSetup      =  wm_User + 282; // SPC Inspection Setup
  iq_jumpToSPC                  =  wm_User + 283; // Statistical Process Control
  iq_jumpToQuickInspection      =  wm_User + 284; // SPC Quick Inspection
  iq_jumpToInspectionLog        =  wm_User + 285; // SPC In-Process Inspection Log
  iq_jumpToQualityAudit         =  wm_User + 309; // Quality Audit
  iq_jumpToQualityAuditWorkFlow =  wm_User + 377; // CRM Work Flow
  iq_jumpToInspRecordApproval   =  wm_User + 432;

  iq_JumpToDocumentControlInsertNew   =  wm_User + 367; // Qc_Const.QC_DOC_INSERT_NEW_DOC_PROMPT

// AP
  iq_JumpToAPPrepost            =  wm_User + 212;
  iq_JumpToAccruedFreight       =  wm_User + 404;
  iq_JumpToAPWorkFlow           =  wm_User + 452;

// GL
  iq_JumpToGL_ChartofAccounts         =  wm_User + 213;
  iq_JumpToGL_AccountActivity         =  wm_User + 214;
  iq_JumpToGJ_GeneralJournal          =  wm_User + 215;
  iq_JumpToGL_Financial_Report        =  wm_User + 216;
  iq_JumpToGL_Trial_Balance           =  wm_User + 217;
  iq_JumpToGL_Cash_Analysis           =  wm_User + 218;
  iq_JumpToGL_Budgets                 =  wm_User + 219;
  iq_JumpToGL_Frx_Reports             =  wm_User + 220;
  iq_JumpToGL_Frx_Structure           =  wm_User + 221;
  iq_JumpToGL_Account_Revaluation     =  wm_User + 402;
  iq_JumpToGL_Bank_Reconciliation     =  wm_User + 403;
  iq_JumpToGL_Bank_Reconcil_Hist      =  wm_User + 449;

// Payroll
  iq_JumpToPayroll_Emp_Maint    =  wm_User + 222;
  iq_JumpToPayroll_Plugins      =  wm_User + 223;
  iq_JumpToPayroll_Paygroup     =  wm_User + 224;
  iq_JumpToPayroll_Paytype      =  wm_User + 225;
  iq_JumpToPayroll_Taxes        =  wm_User + 226;
  iq_JumpToPayroll_Deductions   =  wm_User + 227;
  iq_JumpToPayroll_TimeCards    =  wm_User + 228;
  iq_JumpToPayroll_Prepare      =  wm_User + 229;
  iq_JumpToPayroll_Review       =  wm_User + 230;
  iq_JumpToPayroll_DD           =  wm_User + 231;
  iq_JumpToPayroll_Employees    =  wm_User + 369; // Employee Maintenance

//TA
  iq_JumpToTA_ClockInOut        =  wm_User + 232;
  iq_JumpToTA_Shifts            =  wm_User + 233;
  iq_JumpToTA_Prepost           =  wm_User + 234;
  iq_JumpToTA_ClockInMaint      =  wm_User + 235;
  iq_JumpToTA_PayRules          =  wm_User + 236;
  iq_JumpToTA_ShiftSettings     =  wm_User + 237;
  iq_JumpToTA_TaskClockIn       =  wm_User + 238;
  iq_JumpToTA_TaskClockInMaint  =  wm_User + 239;
  iq_JumpToTA_TaskClockInMaint1 =  wm_User + 240;
  iq_JumpToTA_Incentive         =  wm_User + 241;
  iq_JumpToTA_TaskMessage       =  wm_User + 242;
  iq_JumpToTA_AbcenseCal        =  wm_User + 243;
  iq_JumpToTA_ViolationScript   =  wm_User + 244;
  iq_JumpToTA_AttendanceViol    =  wm_User + 245;
  iq_JumpToTA_WhoIsLoggedIn     =  wm_User + 423;

// Workforce
  iq_JumpToWF_Skills            =  wm_User + 246;
  iq_JumpToWF_Training          =  wm_User + 247;
  iq_JumpToWF_EmpTraining       =  wm_User + 248;
  iq_JumpToWF_JobDesc           =  wm_User + 249;
  iq_JumpToWF_Applicants        =  wm_User + 250;
  iq_JumpToWF_Requisitions      =  wm_User + 251;
  iq_JumpToWF_Ilness            =  wm_User + 252;
  iq_JumpToWF_HREmpMaint        =  wm_User + 253;
  iq_JumptoHREmpWorkflow        =  wm_User + 424;

// ECommerce
  iq_JumpToEC_EDIMaint          =  wm_User + 254;
  iq_JumpToEC_ArchEDI           =  wm_User + 255;
  iq_JumpToEC_PendEDI           =  wm_User + 256;
  iq_JumpToEC_VendEDI           =  wm_User + 257;
  iq_JumpToEC_TSMaint           =  wm_User + 258;
  iq_JumpToEC_TPMaint           =  wm_User + 259;
  iq_JumpToEC_FunckAck          =  wm_User + 260;
  iq_JumpToEC_OutLog            =  wm_User + 261;
  iq_JumpToEC_FileImport        =  wm_User + 262;
  iq_JumpToEC_SchemaMaint       =  wm_User + 263;
  iq_JumpToEC_XML_Maint         =  wm_User + 264;
  iq_JumpToEC_XML_Import        =  wm_User + 265;

  iq_JumpToAM_FAMaint           =  wm_User + 266;   // Assets
  iq_JumpToAM_FABookTempl       =  wm_User + 267;
  iq_JumpToAM_FAClassLives      =  wm_User + 268;
  iq_JumpToAM_FAGL              =  wm_User + 269;
  iq_JumpToAM_FAImport          =  wm_User + 270;
  iq_JumpToPOHist               =  wm_User + 271;
  iq_JumpToPickTicket           =  wm_User + 272;
  iq_JumpToSalesOrderConfigWizard = wm_User + 273;  // sales config wizard
  iq_JumpToSalesModelDesignWizard = wm_User + 274;
  iq_JumpToPMWorkOrder          =  wm_User + 275;
  iq_RedirectCOMCallToIQWIN32   =  wm_User + 286;    // not is use
  iq_JumpToScheduleByWorkorder  =  wm_User + 287;
  iq_JumpToScheduleBySndop_Dispatch_ID = wm_User + 288;
  iq_JumpToWorkCenterAssy2      =  wm_User + 289;
  iq_JumpToSndop                =  wm_User + 293;
  iq_JumpToQSndop               =  wm_User + 373;
  iq_JumpToProdCode             =  wm_User + 374;

// CRM
  iq_JumpToCRMMain              = wm_User + 388;  // CRM Call, Task, Meeting or Note
  iq_JumpToCRMActivity          = wm_User + 137;  // CRM Call, Task, Meeting or Note
  iq_JumpToCRMSupport           = wm_User + 138;  // CRM Support Issue
  iq_JumpToCRMQuote             = wm_User + 139;  // CRM Quotation
  iq_JumpToCustomerCentral      = wm_User + 144;  // CRM Customer Central
  iq_JumpToVendorCentral        = wm_User + 145;  // CRM Vendor Central
  iq_JumpToPartnerCentral       = wm_User + 146;  // CRM Partner Central
  iq_JumpToOpportunityCentral   = wm_User + 294;  // CRM Opportunity Central
  //iq_JumpToCRMNote               = wm_User + 310; // CRM Note
  iq_JumpToCRMServiceCentral     = wm_User + 311; // Service Central
  iq_JumpToCRMCampaign           = wm_User + 312; // Campaign
  iq_JumpToCRMGroup              = wm_User + 313; // CRM Group
  iq_JumpToCRMWorkFlow           = wm_User + 314; // CRM Work Flow
  iq_JumpToCRMMassMailer         = wm_User + 315; // CRM Mass Mailer
  iq_JumpToCRMMailMerge          = wm_User + 368; // CRM Mass Mailer

  iq_JumpToCRMCall               = wm_User + 360; // CRM Call
  iq_JumpToCRMTask               = wm_User + 361; // CRM Task
  iq_JumpToCRMMeeting            = wm_User + 362; // CRM Meeting
  iq_JumpToCRMNote               = wm_User + 363; // CRM Note

  iq_JumpToCRMImport             = wm_User + 397; // CRM Note
  iq_JumpToCRMExport             = wm_User + 398; // CRM Note
  iq_JumpToCRMPendingActReq      = wm_User + 456; // Pending Activity Requests
  iq_JumpToCRMReminders          = wm_User + 461; // CRM Reminder

  // Add new task (no principle source assigned)
  // iq_NewCRMCall                  = wm_User + 317; // Add new CRM Call
  // iq_NewCRMTask                  = wm_User + 318; // Add new CRM Task
  // iq_NewCRMMeeting               = wm_User + 319; // Add new CRM Meeting
  // iq_NewCRMNote                  = wm_User + 320; // Add new CRM Note
  // iq_NewCRMSupportIssue          = wm_User + 321; // Add new CRM Support Issue

  // Add new CRM Call for a given source.  The message param holds source ID.
  // iq_NewCRMCallForCustomer       = wm_User + 322;
  // iq_NewCRMCallForContact        = wm_User + 323;
  // iq_NewCRMCallForVendor         = wm_User + 324;
  // iq_NewCRMCallForVendorContact  = wm_User + 325;
  // iq_NewCRMCallForPartner        = wm_User + 326;
  // iq_NewCRMCallForPartnerContact = wm_User + 327;
  // iq_NewCRMCallForEmployee       = wm_User + 328;

  // Add new CRM Task for a given source.  The message param holds source ID.
  // iq_NewCRMTaskForCustomer       = wm_User + 329;
  // iq_NewCRMTaskForContact        = wm_User + 330;
  // iq_NewCRMTaskForVendor         = wm_User + 331;
  // iq_NewCRMTaskForVendorContact  = wm_User + 332;
  // iq_NewCRMTaskForPartner        = wm_User + 333;
  // iq_NewCRMTaskForPartnerContact = wm_User + 334;
  // iq_NewCRMTaskForEmployee       = wm_User + 335;

  // Add new CRM Meeting for a given source.  The message param holds source ID.
  // iq_NewCRMMeetingForCustomer        = wm_User + 336;
  // iq_NewCRMMeetingForContact         = wm_User + 337;
  // iq_NewCRMMeetingForVendor          = wm_User + 338;
  // iq_NewCRMMeetingForVendorContact   = wm_User + 339;
  // iq_NewCRMMeetingForPartner         = wm_User + 340;
  // iq_NewCRMMeetingForPartnerContact  = wm_User + 341;
  // iq_NewCRMMeetingForEmployee        = wm_User + 342;

  // Add new CRM Note for a given source.  The message param holds source ID.
  // iq_NewCRMNoteForCustomer       = wm_User + 343;
  // iq_NewCRMNoteForContact        = wm_User + 344;
  // iq_NewCRMNoteForVendor         = wm_User + 345;
  // iq_NewCRMNoteForVendorContact  = wm_User + 346;
  // iq_NewCRMNoteForPartner        = wm_User + 347;
  // iq_NewCRMNoteForPartnerContact = wm_User + 348;
  // iq_NewCRMNoteForEmployee       = wm_User + 349;

  // Add new CRM Support Issue for a given source.  The message param holds source ID.
  // iq_NewCRMSupportIssueForCustomer       = wm_User + 350;
  // iq_NewCRMSupportIssueForContact        = wm_User + 351;
  // iq_NewCRMSupportIssueForVendor         = wm_User + 352;
  // iq_NewCRMSupportIssueForVendorContact  = wm_User + 353;
  // iq_NewCRMSupportIssueForPartner        = wm_User + 354;
  // iq_NewCRMSupportIssueForPartnerContact = wm_User + 355;
  // iq_NewCRMSupportIssueForEmployee       = wm_User + 356;

  iq_DeleteCRMActivity           = wm_User + 357;

  iq_JumpToSalesConfigTemplates  = wm_User + 378;
  iq_JumpToCRMCalendar           = wm_User + 379;
  iq_JumpToCRMScheduleCoordinator = wm_User + 383;

  iq_JumpToCallTypes             = wm_User + 384;
  iq_JumpToTaskTypes             = wm_User + 385;
  iq_JumpToMeetingTypes          = wm_User + 386;
  iq_JumpToSupportStatusTypes    = wm_User + 387;

  iq_JumpToCRMHolidays           = wm_User + 389;

// Expense Reports
  iq_ExpRep_Users                = wm_User + 303;
  iq_ExpReports                  = wm_User + 304;
  iq_ExpRep_appr                 = wm_User + 305;

// System Setup
  iq_JumpToSystem_Parameters     = wm_User + 410; //SER# 4271 jump to sys params/security inspector from smart page
  iq_JumpToSecurity_Inspector    = wm_User + 411; //SER# 4171 " "
  iq_JumpToAdHocQuery            = wm_User + 421;
  iq_JumpToBankMaint             = wm_User + 433;
  iq_JumpToMultiCurrency         = wm_User + 434;
  iq_JumpToTerms                 = wm_User + 435;
  iq_JumpToTaxCodes              = wm_User + 436;
  iq_JumpToCostElements          = wm_User + 437;
  iq_JumpToArchiver              = wm_User + 438;
  iq_JumpToChangePW              = wm_User + 439;
  iq_JumpToSystemSetupEmpMaint   = wm_User + 442;

// Shipman
  iq_JumpToShipmanManifest       = wm_User + 306;
  iq_JumpToShipmanCarrierMaint   = wm_User + 307;
  iq_JumpToShipmanCloseShipments = wm_User + 308;
  iq_JumpToShipmanLTL            = wm_User + 450;

  iq_JumpToLabelMaintenance      = wm_User + 316;
  iq_JumpToVendorRMAHeader       = wm_User + 380;
  iq_JumpExpReportsDetail        = wm_User + 381;
  iq_JumpHRApp                   = wm_User + 382;

  iq_JumpToRepdef_Cat            = wm_User + 392;
  iq_jumpToActualCostPosting     = wm_User + 393;
  iq_jumpToReviewDept            = wm_User + 394;
  iq_JumpToHeijunka              = wm_User + 395;

  iq_JumpToSerialTrackPrintRange = wm_User + 396;
  iq_JumpToProductionReportingByWorkOrder = wm_User + 399;

  iq_JumpToLocationType          = wm_User + 400;
  iq_JumpToInvZone               = wm_User + 401;

  iq_InsertViaNavigator          = wm_User + 407;
  iq_JumpToMasterLocation        = wm_User + 408;

  iq_RefreshWMSEquipment         = wm_User + 409;
  iq_GenerateWMSLocationPlan     = wm_User + 412;

// WMS Control

  iq_JumptoWMSProfile            = wm_User + 413;
  iq_JumptoTransactionsRules     = wm_User + 414;
  iq_JumptoPendingTransactions   = wm_User + 415;

  iq_JumpToRunsBest              = wm_User + 417;
  iq_JumpToRunsBestBOM           = wm_User + 418;

  iq_JumpToBOLParams             = wm_User + 419;
  iq_JumptoTransactionRuleDetail = wm_User + 420;
  iq_JumptoWMS_Setup             = wm_User + 426;
  iq_JumptoWMS_Teams             = wm_User + 427;
  iq_JumptoDirTaskMonitoring     = wm_User + 431;

  //WMS Wave Mgmt
  iq_JumptoWaveMgmtSOPicking     = wm_User + 428;
  iq_JumptoWaveMgmtWOStaging     = wm_User + 430;

  //Launcher Menus
  iq_JumpToMyAlerts              = wm_User + 460;

  // IQExtension Setup (a.k.a., EIS)
  iq_JumpToIQExtensionSetup      = wm_User + 448;

  iq_ExecShopDataModalDispo      = wm_User + 454;
  iq_ExecShopDataTransFloorDispo = wm_User + 455;
  iq_ExecShopDataQuickInspMROWO  = wm_User + 462;

  iq_PlantLayout                 = wm_User + 457;
  iq_JumpHREmpTraining           = wm_User + 462;

//  NOTE:
//  Please update the "Last Value Added" after adding new constants !!

(*
  Ex:
   Message: iq_RefreshDataSets;
   Handler: procedure IQRefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;
*)

  {WParam passed in PostMessage to IQLauncher in case of the SMART_PAGE calls}
  SMART_PAGE_HIDE_IQLAUNCHER = 11;

type
  TJumpTo = (jtInventory,
             jtBom,
             jtPO,
             jtPOReceipts,
             jtWorkOrder,
             jtSalesOrder,
             jtSalesOrderDetail,
             jtCustomer,
             jtWorkCenter,
             jtVendor,
             jtPM,
             jtARInvoice,
             jtAPInvoice,
             jtSchedule,
             jtTooling,
             jtAvailability,
             jtJumpToPackSlip,
             jtVendorRMADetail,
             jtHistSalesOrderDetail,
             jtHistTooling,
             jtQuote,
             jtPO_Header,
             jtCRMActivity,
             jtCRMSupport,
             jtCRMQuote,
             jtCustomerCentral,
             jtVendorCentral,
             jtPartnerCentral,
             jtJumpToJobShop,
             jtRTWorkCenter,
             jtEmployeeMaint,
             jtProcessCost,
             jtMasterLocation,
             jtCustomerShipTo,
             jtJumpHREmpTraining);


const
  {Note: keep this in sync with TJumpTo type above}
  JumpMessageMap: array[ TJumpTo ] of Integer = ( iq_JumpToInv,
                                                  iq_JumpToBom,
                                                  iq_JumpToPO,
                                                  iq_JumpToPOReceipts,
                                                  iq_JumpToWorkOrder,
                                                  iq_JumpToSalesOrder,
                                                  iq_JumpToSalesOrderDetail,
                                                  iq_JumpToCustomer,
                                                  iq_JumpToWorkCenter,
                                                  iq_JumpToVendor,
                                                  iq_JumpToPM,
                                                  iq_JumpToARInvoice,
                                                  iq_JumpToAPInvoice,
                                                  iq_JumpToSchedule,
                                                  iq_JumpToTooling,
                                                  iq_JumpToAvailability,
                                                  iq_JumpToPackSlip,
                                                  iq_JumpToVendorRMADetail,
                                                  iq_JumpToHistSalesOrderDetail,
                                                  iq_JumpToHistTooling,
                                                  iq_JumpToQuote,
                                                  iq_JumpToPO_Header,
                                                  iq_JumpToCRMActivity,
                                                  iq_JumpToCRMSupport,
                                                  iq_JumpToCRMQuote,
                                                  iq_JumpToCustomerCentral,
                                                  iq_JumpToVendorCentral,
                                                  iq_JumpToPartnerCentral,
                                                  iq_JumpToJobShop,
                                                  iq_jumpToRTWorkCenter,
                                                  iq_JumpToWF_HREmpMaint,
                                                  iq_jumpToProcessCost,
                                                  iq_JumpToMasterLocation,
                                                  iq_JumpToShipTo,
                                                  iq_JumpHREmpTraining);

implementation

end.
