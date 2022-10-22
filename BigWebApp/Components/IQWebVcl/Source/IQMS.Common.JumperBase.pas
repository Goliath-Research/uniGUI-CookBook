unit IQMS.Common.JumperBase;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.JumpConstants,
  IQMS.PrintLabels.LabelMatrix,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  UniDBNavigator,
  uniGUIApplication;

type
  TFrmJumperBase = class(TUniForm)
    LMPackSlip1: TIQWebLMPackSlip;
  private
    { Private declarations }

    { Messages handlers }
    procedure IQJumpToInv( var Msg: TMessage ); message iq_JumpToInv;
    procedure IQJumpToPO_Header( var Msg: TMessage ); message iq_JumpToPO_Header;
    procedure IQJumpToBom( var Msg: TMessage ); message iq_JumpToBom;
    procedure IQJumpToPO( var Msg: TMessage ); message iq_JumpToPO;
    procedure IQJumpToPOReceipts( var Msg: TMessage ); message iq_JumpToPOReceipts;
    procedure IQJumpToExpectedPOReceipts( var Msg: TMessage ); message iq_JumpToExpectedPOReceipts;
    procedure IQJumpToReceivingbyReceiptNum( var Msg: TMessage ); message iq_JumpToReceivingbyReceiptNum;
    procedure IQJumpToWorkOrder( var Msg: TMessage ); message iq_JumpToWorkOrder;
    procedure IQJumpToSalesOrder( var Msg: TMessage ); message iq_JumpToSalesOrder;
    procedure IQJumpToNewSalesOrder( var Msg: TMessage ); message iq_JumpToNewSalesOrder;
    procedure IQJumpToSalesOrderDetail( var Msg: TMessage ); message iq_JumpToSalesOrderDetail;
    procedure IQJumpToSalesOrderWorkFlow( var Msg: TMessage ); message iq_JumpToSalesOrderWorkFlow;
    procedure IQJumpToCustomer( var Msg: TMessage ); message iq_JumpToCustomer;
    procedure IQJumpToCustomerCRM( var Msg: TMessage ); message iq_JumpToCustomerCRM;
    procedure IQJumpToContact( var Msg: TMessage ); message iq_JumpToContact;
    procedure IQJumpToContactCRM( var Msg: TMessage ); message iq_JumpToContactCRM;
    procedure IQJumpToWorkCenter( var Msg: TMessage ); message iq_JumpToWorkCenter;
    procedure IQJumpToVendor( var Msg: TMessage ); message iq_JumpToVendor;
    procedure IQJumpToPM( var Msg: TMessage ); message iq_JumpToPM;
    procedure IQJumpToPMWorkOrder( var Msg: TMessage ); message iq_JumpToPMWorkOrder;
    procedure IQJumpToARInvoice( var Msg: TMessage ); message iq_JumpToARInvoice;
    procedure IQJumpToPOHist( var Msg: TMessage ); message iq_JumpToPoHist;
    procedure IQJumpToAPInvoice( var Msg: TMessage ); message iq_JumpToAPInvoice;
    procedure IQJumpToSchedule( var Msg: TMessage ); message iq_JumpToSchedule;
    procedure IQJumpToTooling( var Msg: TMessage ); message iq_JumpToTooling;
    procedure IQJumpToToolingTask( var Msg: TMessage ); message iq_JumpToToolingTask;
    procedure IQJumpToHistTooling(var Msg: TMessage); message iq_JumpToHistTooling;
    procedure IQJumpToHeijunkaBox(var Msg: TMessage); message iq_JumpToHeijunka;

    procedure IQJumpToAvailability( var Msg: TMessage ); message iq_JumpToAvailability;
    procedure IQJumpToPackSlip( var Msg: TMessage ); message iq_JumpToPackSlip;
    procedure IQJumpToPackSlipShipment( var Msg: TMessage ); message iq_JumpToPackSlipShipment;
    procedure IQJumpToRMA( var Msg: TMessage ); message iq_JumpToRMA;
    procedure IQJumpToRMAHeader( var Msg: TMessage ); message iq_JumpToRMAHeader;
    procedure IQJumpToRMADetail( var Msg: TMessage ); message iq_JumpToRMADetail;
    procedure IQJumpToVendorRMADetail( var Msg: TMessage ); message iq_JumpToVendorRMADetail;
    procedure IQJumpToHistSalesOrder( var Msg: TMessage ); message iq_JumpToHistSalesOrder;
    procedure IQJumpToHistSalesOrderDetail( var Msg: TMessage ); message iq_JumpToHistSalesOrderDetail;
    procedure IQJumpToJobShop( var Msg: TMessage ); message iq_JumpToJobShop;
    procedure IQJumpToARPrepost( var Msg: TMessage ); message iq_JumpToARPrepost;
    procedure IQJumpToAPPrepost( var Msg: TMessage ); message iq_JumpToAPPrepost;
    procedure IQJumpToAPPosted( var Msg: TMessage ); message iq_JumpToAPPosted;
    procedure IQJumpToCDPosted( var Msg: TMessage ); message iq_JumpToCDPosted;
    procedure IQJumpToCDPrePost( var Msg: TMessage ); message iq_JumpToCDPrePost;
    procedure IQJumpToAPQP( var Msg: TMessage ); message iq_JumpToAPQP;
    procedure IQJumpToPPAP( var Msg: TMessage ); message iq_JumpToPPAP;
    procedure IQJumpToCAR( var Msg: TMessage ); message iq_JumpToCAR;
    procedure IQJumpToECO( var Msg: TMessage ); message iq_JumpToECO;
    procedure IQJumpToInvGroup( var Msg: TMessage ); message iq_JumpToInvGroup;
    procedure IQJumpToQAccruedFreight( var Msg: TMessage ); message iq_JumpToAccruedFreight;
    procedure IQJumpToKBSupermkt( var Msg: TMessage ); message iq_JumpToKBSupermkt;
    procedure IQJumpToPrior_AR( var Msg: TMessage ); message iq_JumpToPrior_AR;
    procedure IQJumpToPrior_AP( var Msg: TMessage ); message iq_JumpToPrior_AP;
    procedure IQJumpToMaterialExceptionMenu ( var Msg: TMessage ); message iq_JumpToMaterialExceptionMenu;
    procedure IQJumpToAPWorkFlow ( var Msg: TMessage ); message iq_JumpToAPWorkFlow;
    procedure IQJumpToSlitOptim ( var Msg: TMessage ); message iq_JumpToSlitOptim;

    // CRM

    procedure IQJumpToCRMMain( var Msg: TMessage ); message iq_JumpToCRMMain;
    procedure IQJumpToCRMActivity( var Msg: TMessage ); message iq_JumpToCRMActivity;
    procedure IQJumpToCRMCall( var Msg: TMessage ); message iq_JumpToCRMCall;
    procedure IQJumpToCRMTask( var Msg: TMessage ); message iq_JumpToCRMTask;
    procedure IQJumpToCRMMeeting( var Msg: TMessage ); message iq_JumpToCRMMeeting;
    procedure IQJumpToCRMNote( var Msg: TMessage ); message iq_JumpToCRMNote;
    procedure IQJumpToCRMSupport( var Msg: TMessage ); message iq_JumpToCRMSupport;
    procedure IQJumpToCRMQuote( var Msg: TMessage ); message iq_JumpToCRMQuote;
    procedure IQJumpToCustomerCentral( var Msg: TMessage ); message iq_JumpToCustomerCentral;
    procedure IQJumpToVendorCentral( var Msg: TMessage ); message iq_JumpToVendorCentral;
    procedure IQJumpToPartnerCentral( var Msg: TMessage ); message iq_JumpToPartnerCentral;
    procedure IQJumpToOpportunityCentral( var Msg: TMessage ); message iq_JumpToOpportunityCentral;
    procedure IQJumpToServiceCentral( var Msg: TMessage ); message iq_JumpToCRMServiceCentral;
    procedure IQJumpToCampaign( var Msg: TMessage ); message iq_JumpToCRMCampaign;
    procedure IQJumpToCRMGroup( var Msg: TMessage ); message iq_JumpToCRMGroup;
    procedure IQJumpToCRMWorkFlow( var Msg: TMessage ); message iq_JumpToCRMWorkFlow;
    procedure IQJumpToMassMailer( var Msg: TMessage ); message iq_JumpToCRMMassMailer;
    procedure IQJumpToMailMerge( var Msg: TMessage ); message iq_JumpToCRMMailMerge;
    procedure IQJumpToSalesConfigTemplates( var Msg: TMessage ); message iq_JumpToSalesConfigTemplates;
    procedure IQJumpToCRMCalendar( var Msg: TMessage ); message iq_JumpToCRMCalendar;
    procedure JumpToCRMScheduleCoordinator( var Msg: TMessage ); message iq_JumpToCRMScheduleCoordinator;
    procedure JumpToCRMCallTypes( var Msg: TMessage ); message iq_JumpToCallTypes;
    procedure JumpToCRMTaskTypes( var Msg: TMessage ); message iq_JumpToTaskTypes;
    procedure JumpToCRMMeetingTypes( var Msg: TMessage ); message iq_JumpToMeetingTypes;
    procedure JumpToCRMSupportIssueTypes( var Msg: TMessage ); message iq_JumpToSupportStatusTypes;
    procedure JumpToCRMHolidays( var Msg: TMessage ); message iq_JumpToCRMHolidays;
    procedure JumpToCRMPendingActReq( var Msg: TMessage ); message iq_JumpToCRMPendingActReq;
    procedure JumpToCRMReminders ( var Msg: TMessage ); message iq_JumpToCRMReminders;

    //09-12-2008
    procedure IQJumpToBOL( var Msg: TMessage ); message iq_JumpToBOL;
    procedure IQJumpToManualPS( var Msg: TMessage ); message iq_JumpToManualPS;
    procedure IQJumpToSalesPeople( var Msg: TMessage ); message iq_JumpToSalesPeople;
    procedure IQJumpToShipVia( var Msg: TMessage ); message iq_JumpToShipVia;
    procedure IQJumpToPrintLabels( var Msg: TMessage ); message iq_JumpToPrintLabels;
    procedure IQJumpToLabelMaintenance( var Msg: TMessage ); message iq_JumpToLabelMaintenance;
    procedure IQJumpToSalesAnalysis( var Msg: TMessage ); message iq_JumpToSalesAnalysis;
    procedure IQJumpToWebOrderImport( var Msg: TMessage ); message iq_JumpToWebOrderImport;
    procedure IQJumpToVMI( var Msg: TMessage ); message iq_JumpToVMI;
    procedure IQJumpToModalYearReset( var Msg: TMessage ); message iq_JumpToModalYearReset;
    procedure IQJumpToICT( var Msg: TMessage ); message iq_JumpToICT;

    procedure IQJumpToPLM( var Msg: TMessage ); message iq_JumpToPLM;
    procedure IQJumpToDHR( var Msg: TMessage ); message iq_JumpToDHR;
    procedure IQJumpToVisualBOM( var Msg: TMessage ); message iq_JumpToVisualBOM;
    procedure IQJumpToTransactionLocations( var Msg: TMessage ); message iq_JumpToInvTransLocs;
    procedure IQJumpToMPS( var Msg: TMessage ); message iq_JumpToMPS;
    procedure IQJumpToFabTrack( var Msg: TMessage ); message iq_JumpToFabTrack;
    procedure IQJumpToFabProcess( var Msg: TMessage ); message iq_JumpToFabProcess;
    procedure IQJumpToAssyTrack( var Msg: TMessage ); message iq_JumpToAssyTrack;
    procedure IQJumpToAssyProcess( var Msg: TMessage ); message iq_JumpToAssyProcess;
    procedure IQJumpToSndOp( var Msg: TMessage ); message iq_JumpToSndop;
    procedure IQJumpToQSndOp( var Msg: TMessage ); message iq_JumpToQSndop;
    procedure IQJumpToProdDispo( var Msg: TMessage ); message iq_JumpToProdDispo;
    procedure IQJumpToShopSetup( var Msg: TMessage ); message iq_JumpToShopSetup;
    procedure IQJumpToLotTrack( var Msg: TMessage ); message iq_JumpToLotTrack;
    procedure IQJumpToSerialTrack( var Msg: TMessage ); message iq_JumpToSerialTrack;
    procedure IQJumpToWorkCenterAssy2( var Msg: TMessage ); message iq_JumpToWorkCenterAssy2;
    procedure IQJumpToProdCode( var Msg: TMessage ); message iq_JumpToProdCode;
    procedure IQJumpToSerialTrackPrintRange( var Msg: TMessage ); message iq_JumpToSerialTrackPrintRange;

    procedure IQJumpToCashReceipts( var Msg: TMessage ); message iq_JumpToCashReceipts;
    procedure IQJumpToCashRecwithPkr( var Msg: TMessage ); message iq_JumpToCashRecwithPkr;
    procedure IQJumpToCustomerStatus( var Msg: TMessage ); message iq_JumpToCustomerStatus;
    procedure IQJumpToDunningLetters( var Msg: TMessage ); message iq_JumpToDunningLetters;
    procedure IQJumpToCreditCardSettlement( var Msg: TMessage ); message iq_JumpToCreditCardSettlement;
    procedure IQJumpToBillTo( var Msg:TMessage ); message iq_JumpToBillTo;
    procedure IQJumpToShipTo( var Msg:TMessage ); message iq_JumpToShipTo;
    procedure IQJumpToRebateManager( var Msg:TMessage ); message iq_JumpToRebateManager;
    procedure IQJumpToRebateParameters( var Msg:TMessage ); message iq_JumpToRebateParameters;

    procedure IQJumpToApprovePO( var Msg: TMessage ); message iq_JumpToApprovePO;
    procedure IQJumpToICTReceive( var Msg: TMessage ); message iq_JumpToICTReceive;
    procedure IQJumpToPendingASN( var Msg: TMessage ); message iq_JumpToPendingASN;
    procedure IQJumpToOutsourceCentral(var Msg: TMessage); message iq_JumpToOutsourceCentral;
    procedure IQJumpToDropShipReceipts ( var Msg: TMessage ); message iq_JumpToDropShipReceipts;
    procedure IQJumpToReceiptsReceipt ( var Msg: TMessage ); message iq_JumpToReceiptsReceipt;

    procedure IQJumpToCashDisbursements ( var Msg: TMessage ); message iq_JumpToCashDisbursements;
    procedure IQJumpToVendorStatus ( var Msg: TMessage ); message iq_JumpToVendorStatus;
    procedure IQJumpTo1099Form( var Msg: TMessage ); message iq_JumpTo1099Form;

    procedure IQJumpToRFQ_Log( var Msg: TMessage ); message iq_jumpToRFQ_Log;
    procedure IQJumpToVisualQuoteRouting( var Msg: TMessage ); message iq_jumpToVisualQuoteRouting;
    procedure IQJumpToRTMonitor( var Msg: TMessage ); message iq_jumpToRTMonitor;
    procedure IQJumpToRTWorkCenter( var Msg: TMessage ); message iq_jumpToRTWorkCenter;
    procedure IQJumpToIQLog( var Msg: TMessage ); message iq_jumpToIQLog;
    procedure IQJumpToRTMeter( var Msg: TMessage ); message iq_jumpToRTMeter;
    procedure IQJumpToRTPlantEfficiency( var Msg: TMessage ); message iq_jumpToRTPlantEfficiency;
    procedure IQJumpToRTWorkorderHistory( var Msg: TMessage ); message iq_jumpToRTWorkorderHistory;
    procedure IQJumpToRTPCMon(var Msg: TMessage); message iq_jumpToRTPCMon;
    procedure IQJumpToRTPCMonBOMSetup(var Msg: TMessage); message iq_jumpToRTPCMonBOMSetup;
    procedure IQJumpToRTPCMonSetup(var Msg: TMessage); message iq_jumpToRTPCMonSetup;
    procedure IQJumptoRTPCMonBOMSetupbyStandardID(var Msg : TMessage); message iq_jumpToPCMonMfgSetup;
    procedure IQJumpToProcessCost( var Msg: TMessage ); message iq_jumpToProcessCost;
    procedure IQJumpToActualCostPosting( var Msg: TMessage ); message iq_JumpToActualCostPosting;
    procedure IQJumpToPIT( var Msg: TMessage ); message iq_jumpToPIT;
    procedure IQJumpToForecast( var Msg: TMessage ); message iq_jumpToForecast;
    procedure IQJumpToDocumentControl( var Msg: TMessage ); message iq_jumpToDocumentControl;
    procedure IQJumpToCAPA( var Msg: TMessage ); message iq_jumpToCAPA;
    procedure IQJumpToDev( var Msg: TMessage ); message iq_jumpToDev;
    procedure IQJumpToProcPQ( var Msg: TMessage ); message iq_jumpToProcPQ;
    procedure IQJumpToProdPQ( var Msg: TMessage ); message iq_jumpToProdPQ;
    procedure IQJumpToMRB( var Msg: TMessage ); message iq_jumpToMRB;
    procedure IQJumpToTeamMembers( var Msg: TMessage ); message iq_jumpToTeamMembers;
    procedure IQJumpDocumentControlInsertNew( var Msg: TMessage ); message iq_JumpToDocumentControlInsertNew;

    procedure IQJumpToCostOfQuality(var Msg: TMessage ); message iq_jumpToCostOfQuality;
    procedure IQJumpToQualityProjects( var Msg: TMessage ); message iq_jumpToQualityProjects;
    procedure IQJumpToControlPlan(var Msg: TMessage ); message iq_jumpToControlPlan;
    procedure IQJumpToFMEA(var Msg:TMessage ); message iq_jumpToFMEA;
    procedure IQJumpToRiskAssessment(var Msg: TMessage ); message iq_jumpToRiskAssessment;
    procedure IQJumpToGagesDevices(var Msg: TMessage ); message iq_jumpToGagesDevices;
    procedure IQJumpToInspectionSetup( var Msg: TMessage ); message iq_jumpToInspectionSetup;
    procedure IQJumpToSPC(var Msg:TMessage ); message iq_jumpToSPC;
    procedure IQJumpToQuickInspection( var Msg: TMessage ); message iq_jumpToQuickInspection;
    procedure IQJumpToInspectionLog( var Msg: TMessage ); message iq_jumpToInspectionLog;
    procedure IQJumpToQualityAudit( var Msg: TMessage ); message iq_jumpToQualityAudit;
    procedure IQJumpToQualityAuditWorkFlow( var Msg: TMessage ); message iq_jumpToQualityAuditWorkFlow;
    procedure IQJumptoInspRecordApproval( var Msg: TMessage ); message iq_jumpToInspRecordApproval;


  // GL
    procedure IQJumpToGL_ChartofAccounts( var Msg: TMessage ); message iq_JumpToGL_ChartofAccounts;
    procedure IQJumpToGL_AccountActivity( var Msg: TMessage ); message iq_JumpToGL_AccountActivity;
    procedure IQJumpToGJ_GeneralJournal( var Msg: TMessage ); message iq_JumpToGJ_GeneralJournal;
    procedure IQJumpToGL_Financial_Report( var Msg: TMessage ); message iq_JumpToGL_Financial_Report;
    procedure IQJumpToGL_Trial_Balance( var Msg: TMessage ); message iq_JumpToGL_Trial_Balance;
    procedure IQJumpToGL_Cash_Analysis( var Msg: TMessage ); message iq_JumpToGL_Cash_Analysis;
    procedure IQJumpToGL_Budgets( var Msg: TMessage ); message iq_JumpToGL_Budgets;
    procedure IQJumpToGL_Frx_Reports( var Msg: TMessage ); message iq_JumpToGL_Frx_Reports;
    procedure IQJumpToGL_Frx_Structure( var Msg: TMessage ); message iq_JumpToGL_Frx_Structure;
    procedure IQJumpToGL_Account_Revaluation( var Msg: TMessage ); message iq_JumpToGL_Account_Revaluation;
    procedure IQJumpToGL_Bank_Reconciliation( var Msg: TMessage ); message iq_JumpToGL_Bank_Reconciliation;
    procedure IQJumpToGL_Bank_Reconcil_Hist ( var Msg: TMessage ); message iq_JumpToGL_Bank_Reconcil_Hist;

  // Payroll
    procedure IQJumpToPayroll_Emp_Maint( var Msg: TMessage ); message iq_JumpToPayroll_Emp_Maint;
    procedure IQJumpToPayroll_Plugins( var Msg: TMessage ); message iq_JumpToPayroll_Plugins;
    procedure IQJumpToPayroll_Paygroup( var Msg: TMessage ); message iq_JumpToPayroll_Paygroup;
    procedure IQJumpToPayroll_Paytype( var Msg: TMessage ); message iq_JumpToPayroll_Paytype;
    procedure IQJumpToPayroll_Taxes( var Msg: TMessage ); message iq_JumpToPayroll_Taxes;
    procedure IQJumpToPayroll_Deductions( var Msg: TMessage ); message iq_JumpToPayroll_Deductions;
    procedure IQJumpToPayroll_TimeCards( var Msg: TMessage ); message iq_JumpToPayroll_TimeCards;
    procedure IQJumpToPayroll_Prepare( var Msg: TMessage ); message iq_JumpToPayroll_Prepare;
    procedure IQJumpToPayroll_Review( var Msg: TMessage ); message iq_JumpToPayroll_Review;
    procedure IQJumpToPayroll_DD( var Msg: TMessage ); message iq_JumpToPayroll_DD;
    procedure IQJumpToPayroll_Employees( var Msg: TMessage ); message iq_JumpToPayroll_Employees;

  //TA
    procedure IQJumpToTA_ClockInOut( var Msg: TMessage ); message iq_JumpToTA_ClockInOut;
    procedure IQJumpToTA_Shifts( var Msg: TMessage ); message iq_JumpToTA_Shifts;
    procedure IQJumpToTA_Prepost( var Msg: TMessage ); message iq_JumpToTA_Prepost;
    procedure IQJumpToTA_ClockInMaint( var Msg: TMessage ); message iq_JumpToTA_ClockInMaint;
    procedure IQJumpToTA_PayRules( var Msg: TMessage ); message iq_JumpToTA_PayRules;
    procedure IQJumpToTA_ShiftSettings( var Msg: TMessage ); message iq_JumpToTA_ShiftSettings;
    procedure IQJumpToTA_TaskClockIn( var Msg: TMessage ); message iq_JumpToTA_TaskClockIn;
    procedure IQJumpToTA_TaskClockInMaint( var Msg: TMessage ); message iq_JumpToTA_TaskClockInMaint;
    procedure IQJumpToTA_TaskClockInMaint1( var Msg: TMessage ); message iq_JumpToTA_TaskClockInMaint1;
    procedure IQJumpToTA_Incentive( var Msg: TMessage ); message iq_JumpToTA_Incentive;
    procedure IQJumpToTA_TaskMessage( var Msg: TMessage ); message iq_JumpToTA_TaskMessage;
    procedure IQJumpToTA_AbcenseCal( var Msg: TMessage ); message iq_JumpToTA_AbcenseCal;
    procedure IQJumpToTA_ViolationScript( var Msg: TMessage ); message iq_JumpToTA_ViolationScript;
    procedure IQJumpToTA_AttendanceViol( var Msg: TMessage ); message iq_JumpToTA_AttendanceViol;
    procedure IQJumpToTA_WhoIsLoggedIn( var Msg: TMessage ); message iq_JumpToTA_WhoIsLoggedIn;

  // Workforce
    procedure IQJumpToWF_Skills( var Msg: TMessage ); message iq_JumpToWF_Skills;
    procedure IQJumpToWF_Training( var Msg: TMessage ); message iq_JumpToWF_Training;
    procedure IQJumpToWF_EmpTraining( var Msg: TMessage ); message iq_JumpToWF_EmpTraining;
    procedure IQJumpToWF_JobDesc( var Msg: TMessage ); message iq_JumpToWF_JobDesc;
    procedure IQJumpToWF_Applicants( var Msg: TMessage ); message iq_JumpToWF_Applicants;
    procedure IQJumpToWF_Requisitions( var Msg: TMessage ); message iq_JumpToWF_Requisitions;
    procedure IQJumpToWF_Ilness( var Msg: TMessage ); message iq_JumpToWF_Ilness;
    procedure IQJumpToWF_HREmpMaint( var Msg: TMessage ); message iq_JumpToWF_HREmpMaint;
    procedure IQJumpToHREmpWorkflow( var Msg: TMessage ); message iq_JumptoHREmpWorkflow;

  // ECommerce
    procedure IQJumpToEC_EDIMaint( var Msg: TMessage ); message iq_JumpToEC_EDIMaint;
    procedure IQJumpToEC_ArchEDI( var Msg: TMessage ); message iq_JumpToEC_ArchEDI;
    procedure IQJumpToEC_PendEDI( var Msg: TMessage ); message iq_JumpToEC_PendEDI;
    procedure IQJumpToEC_VendEDI( var Msg: TMessage ); message iq_JumpToEC_VendEDI;
    procedure IQJumpToEC_TSMaint( var Msg: TMessage ); message iq_JumpToEC_TSMaint;
    procedure IQJumpToEC_TPMaint( var Msg: TMessage ); message iq_JumpToEC_TPMaint;
    procedure IQJumpToEC_FunckAck( var Msg: TMessage ); message iq_JumpToEC_FunckAck;
    procedure IQJumpToEC_OutLog( var Msg: TMessage ); message iq_JumpToEC_OutLog;
    procedure IQJumpToEC_FileImport( var Msg: TMessage ); message iq_JumpToEC_FileImport;
    procedure IQJumpToEC_SchemaMaint( var Msg: TMessage ); message iq_JumpToEC_SchemaMaint;
    procedure IQJumpToEC_XML_Maint( var Msg: TMessage ); message iq_JumpToEC_XML_Maint;
    procedure IQJumpToEC_XML_Import( var Msg: TMessage ); message iq_JumpToEC_XML_Import;

  // Assets
    procedure IQJumpToAM_FAMaint( var Msg: TMessage ); message iq_JumpToAM_FAMaint;
    procedure IQJumpToAM_FABookTempl( var Msg: TMessage ); message iq_JumpToAM_FABookTempl;
    procedure IQJumpToAM_FAClassLives( var Msg: TMessage ); message iq_JumpToAM_FAClassLives;
    procedure IQJumpToAM_FAGL( var Msg: TMessage ); message iq_JumpToAM_FAGL;
    procedure IQJumpToAM_FAImport( var Msg: TMessage ); message iq_JumpToAM_FAImport;
    procedure IQJumpToAM_ReviewDept( var Msg: TMessage ); message iq_jumpToReviewDept;

    // picktickets
    procedure IQJumpToPickTicket( var Msg: TMessage ); message iq_JumpToPickTicket;

    // Sales Orders Wizard
    procedure IQJumpToSalesOrderConfigWizard( var Msg: TMessage ); message iq_JumpToSalesOrderConfigWizard;
    procedure IQJumpToSalesModelDesignWizard( var Msg: TMessage ); message iq_JumpToSalesModelDesignWizard;

    procedure IQJumpToQuote( var Msg: TMessage ); message iq_JumpToQuote;
    procedure IQJumpToScheduleByWorkorder( var Msg: TMessage ); message iq_JumpToScheduleByWorkorder;
    procedure IQJumpToScheduleBySndop_Dispatch_ID( var Msg: TMessage ); message iq_JumpToScheduleBySndop_Dispatch_ID;

    procedure IQJumpToiq_ExpRep_Users( var Msg: TMessage ); message iq_ExpRep_Users;
    procedure IQJumpToiq_ExpReports( var Msg: TMessage ); message   iq_ExpReports;
    procedure IQJumpToiq_ExpRep_appr( var Msg: TMessage ); message  iq_ExpRep_appr;
    procedure IQJumpToiq_JumpToVendor_RFQ( var Msg: TMessage ); message  iq_JumpToVendor_RFQ;
    procedure IQJumpToiq_JumpToPO_Header_Requisition( var Msg: TMessage ); message iq_JumpToPO_Header_Requisition;
    procedure IQJumpToiq_JumpToInvByLoc( var Msg: TMessage ); message iq_JumpToInvByLoc;
    procedure IQJumpToiq_JumpToShipmanManifest( var Msg: TMessage ); message iq_JumpToShipmanManifest;
    procedure IQJumpToiq_JumpToShipmanCarrierMaint( var Msg: TMessage ); message iq_JumpToShipmanCarrierMaint;
    procedure IQJumpToiq_JumpToShipmanCloseShipments( var Msg: TMessage ); message iq_JumpToShipmanCloseShipments;
    procedure IQJumpToVendorRMAHeader( var Msg: TMessage ); message  iq_JumpToVendorRMAHeader;
    procedure IQJumpToExpReportsDetail( var Msg: TMessage ); message  iq_JumpExpReportsDetail;
    procedure IQJumpToHRApp( var Msg: TMessage ); message  iq_JumpHRApp;
    procedure IQJumpToHREmpTraining( var Msg: TMessage ); message  iq_JumpHREmpTraining;
    procedure IQJumpToProductionReportingByWorkOrder( var Msg: TMessage ); message  iq_JumpToProductionReportingByWorkOrder;
    procedure IQJumpToDockScheduler( var Msg: TMessage ); message iq_JumpToDockScheduler;
    procedure IQJumpToShipmanLTL (var Msg: TMessage ); message iq_JumpToShipmanLTL;

    // System Setup
    procedure IQJumpToRepdef_Cat( var Msg: TMessage ); message iq_JumpToRepdef_Cat;
    procedure IQJumpToBankMain( var Msg: TMessage ); message iq_JumpToBankMaint;
    procedure IQJumpToMultiCurrency( var Msg: TMessage ); message iq_JumpToMultiCurrency;
    procedure IQJumpToTerms( var Msg: TMessage ); message iq_JumpToTerms;
    procedure IQJumpToTaxCodes( var Msg: TMessage ); message iq_JumpToTaxCodes;
    procedure IQJumpToCostElements( var Msg: TMessage ); message iq_JumpToCostElements;
    procedure IQJumpToArchiver( var Msg: TMessage ); message iq_JumpToArchiver;
    procedure IQJumpToChangePW( var Msg: TMessage ); message iq_JumpToChangePW;
    procedure IQJumpToSystemSetupEmpMaint( var Msg: TMessage ); message iq_JumpToSystemSetupEmpMaint;


    procedure IQJumpToLocationType( var Msg: TMessage ); message  iq_JumpToLocationType;
    procedure IQJumpToInvZone( var Msg: TMessage ); message  iq_JumpToInvZone;
    procedure IQJumpToMaserLocations( var Msg: TMessage ); message iq_JumpToMasterLocation;
    procedure IQJumpToSystemParameters( var Msg: TMessage ); message iq_JumpToSystem_Parameters;
    procedure IQJumpToSecurityInspector( var Msg: TMessage ); message iq_JumpToSecurity_Inspector;
    procedure IQJumpToAdHocQuery( var Msg: TMessage ) ; message iq_JumpToAdHocQuery;

    // General
    procedure IQNotifySetForegroundWindow( var Msg: TMessage ); message iq_NotifySetForegroundWindow; {to bring all visible windows to the foreground}

    procedure IQInsertViaNavigator( var Msg: TMessage ); message iq_InsertViaNavigator;

    //WMS Control
    procedure IQJumpToWMSProfile( var Msg: TMessage ); message  iq_JumptoWMSProfile;
    procedure IQJumpToInvTransactionsRules( var Msg: TMessage ); message  iq_JumptoTransactionsRules;
    procedure IQJumpToInvTransactionRuleDetail( var Msg: TMessage ); message  iq_JumptoTransactionRuleDetail;
    procedure IQJumpToPendingTransactions( var Msg: TMessage ); message  iq_JumptoPendingTransactions;
    procedure IQJumpToWMS_Setup( var Msg: TMessage ); message iq_JumptoWMS_Setup;
    procedure IQJumptoWMS_Teams( var Msg: TMessage); message iq_JumptoWMS_Teams;
    procedure IQJumptoWaveMgmtSOPicking( var Msg: TMessage ); message iq_JumptoWaveMgmtSOPicking;
    procedure IQJumptoWaveMgmtWOStaging( var Msg: TMessage ); message iq_JumptoWaveMgmtWOStaging;
    procedure IQJumptoDirTaskMonitoring( var Msg: TMessage ); message iq_JumptoDirTaskMonitoring;

    procedure IQJumpToRunsBest( var Msg: TMessage ); message  iq_JumpToRunsBest;
    procedure IQJumpToBOLParams( var Msg: TMessage ); message  iq_JumpToBOLParams;
    procedure IQJumpToPOHistory( var Msg: TMessage); message iq_JumpToPO_History;

    procedure IQJumpToIQExtensionSetup( var Msg: TMessage); message iq_JumpToIQExtensionSetup;
    procedure IQJumpToMyAlerts( var Msg : TMessage); message iq_JumpToMyAlerts;

    { ***************************E X E C U T E  M E T H O D S *******************************}
    (* Estimating *)
    procedure IQExecEngQuoteRecalcOptimPrice( var Msg: TMessage ); message iq_ExecEngQuoteRecalcOptimPrice;
    procedure IQExecEngQuoteRecalcOptimPercent( var Msg: TMessage ); message iq_ExecEngQuoteRecalcOptimPercent;
    procedure IQExecEngQuoteRecalcOptimMargin( var Msg: TMessage ); message iq_ExecEngQuoteRecalcOptimMargin;
    procedure IQExecEngQuoteRecalcOptimYield( var Msg: TMessage ); message iq_ExecEngQuoteRecalcOptimYield;
    procedure IQExecEngQuoteRecalcOnly( var Msg: TMessage ); message iq_ExecEngQuoteRecalcOnly;
    { ***************************E X E C U T E  M E T H O D S *******************************}

    procedure IQJumpToPlantLayout( var Msg: TMessage); message iq_PlantLayout;

  protected
    { Protected declarations }
    procedure PrintLMPackslip(AOwner: TComponent);

    procedure DispatchMessage(var Msg: TMessage); virtual;

  public
    { Public declarations }
  end;

var
  FrmJumperBase: TFrmJumperBase;


procedure DoPrintLMPackslip( AMainFormWithTLMPacklip:TForm );



implementation

{$R *.dfm}

uses
  IQMS.Common.COMExe,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Screen;


procedure DoPrintLMPackslip( AMainFormWithTLMPacklip:TForm );
var
  ALMPackslip1Component:TComponent;
begin
  if not Assigned(AMainFormWithTLMPacklip) then
    EXIT;

  ALMPackslip1Component:= AMainFormWithTLMPacklip.FindComponent( 'LMPackSlip1' );
//  if not Assigned(ALMPackslip1Component) or not (ALMPackslip1Component is TLMPackslip) then
//    EXIT;

//  with (ALMPackslip1Component as TLMPackslip) do Execute;
end;


procedure TFrmJumperBase.DispatchMessage(var Msg:TMessage);
var
  I:Integer;
begin
  try
    Com_Exec( 'IQWIN32', [ Msg.Msg, Msg.WParam ] );    // IQMS.Common.COMExe.pas
  except on E:Exception do // in case Cancel was clicked
    if not IgnoreCOMRaisedEAbort(E) then raise;
  end;
end;

procedure TFrmJumperBase.PrintLMPackslip( AOwner:TComponent );
begin
  LMPackSlip1.Execute;
end;

procedure TFrmJumperBase.IQJumpToActualCostPosting(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAdHocQuery(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAM_FABookTempl(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAM_FAClassLives(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAM_FAGL(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAM_FAImport(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAM_FAMaint(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAM_ReviewDept(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_ArchEDI(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_EDIMaint(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_FileImport(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_FunckAck(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_OutLog(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_PendEDI(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_SchemaMaint(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_TPMaint(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_TSMaint(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_VendEDI(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_XML_Import(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToEC_XML_Maint(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGJ_GeneralJournal(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGL_AccountActivity(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGL_Account_Revaluation(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGL_Bank_Reconciliation(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGL_Bank_Reconcil_Hist(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGL_Budgets(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGL_Cash_Analysis(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGL_ChartofAccounts(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGL_Financial_Report(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGL_Frx_Reports(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGL_Frx_Structure(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGL_Trial_Balance(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPayroll_DD(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPayroll_Deductions(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPayroll_Employees(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPayroll_Emp_Maint(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPayroll_Paygroup(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPayroll_Paytype(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPayroll_Plugins(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPayroll_Prepare(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPayroll_Review(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPayroll_Taxes(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPayroll_TimeCards(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTaxCodes(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_AbcenseCal(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_AttendanceViol(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_ClockInMaint(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_ClockInOut(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_Incentive(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_PayRules(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_Prepost(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_Shifts(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_ShiftSettings(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_TaskClockIn(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_TaskClockInMaint(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_TaskClockInMaint1(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_TaskMessage(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_ViolationScript(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTA_WhoIsLoggedIn(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWF_Applicants(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWF_EmpTraining(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWF_HREmpMaint(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWF_Ilness(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWF_JobDesc(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWF_Requisitions(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWF_Skills(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWF_Training(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWMSProfile(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWMS_Setup(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumptoWMS_Teams(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpTo1099Form(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToApprovePO(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAssyProcess(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAssyTrack(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCAPA(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCashDisbursements(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCashReceipts(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCashRecwithPkr(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCreditCardSettlement(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCustomerStatus(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToDev(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToDockScheduler(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToDocumentControl(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToDropShipReceipts(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRebateManager(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRebateParameters(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToReceiptsReceipt(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToReceivingbyReceiptNum(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRepdef_Cat(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToDunningLetters(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToFabProcess(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToFabTrack(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToForecast(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToICTReceive(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToIQExtensionSetup(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToIQLog(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToLocationType(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToLotTrack(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToMRB(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToMultiCurrency(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToMyAlerts(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToOutsourceCentral(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPendingASN(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPendingTransactions(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPickTicket(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPIT(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPlantLayout(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToProcessCost(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToProcPQ(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToProdCode(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToProdDispo(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToProdPQ(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToProductionReportingByWorkOrder(
  var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRFQ_Log(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRTMeter(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRTMonitor(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRTWorkCenter(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRTPlantEfficiency(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRTWorkorderHistory(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRunsBest(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRTPCMon(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRTPCMonSetup(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRTPCMonBOMSetup(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumptoRTPCMonBOMSetupbyStandardID(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSalesModelDesignWizard(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSalesOrderConfigWizard(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSecurityInspector(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSerialTrack(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSerialTrackPrintRange(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToShopSetup(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSlitOptim(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTeamMembers(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTerms(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQExecEngQuoteRecalcOnly(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQExecEngQuoteRecalcOptimMargin(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQExecEngQuoteRecalcOptimPercent(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQExecEngQuoteRecalcOptimPrice(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQExecEngQuoteRecalcOptimYield(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQInsertViaNavigator(var Msg: TMessage);
var
  ADBNav: TUniDBNavigator;
begin
  ADBNav:= Pointer(Msg.WParam);
  ADBNav.DataSource.DataSet.Insert;
end;

procedure TFrmJumperBase.IQJumpDocumentControlInsertNew(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAPInvoice(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAPPosted(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAPPrepost(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAPQP(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToArchiver(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToARInvoice(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToARPrepost(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAvailability(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToBOL(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToBOLParams(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToBom(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCAR(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCDPosted(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCDPrePost(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToChangePW(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCRMActivity(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCRMQuote(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCRMSupport(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCustomer(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCustomerCentral(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCustomerCRM(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToDHR(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumptoDirTaskMonitoring(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToECO(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToHeijunkaBox(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToHistSalesOrder(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToHistSalesOrderDetail(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToHistTooling(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToICT(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToInv(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToInvGroup(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToInvTransactionRuleDetail(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToInvTransactionsRules(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToInvZone(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToJobShop(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToKBSupermkt(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToManualPS(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToModalYearReset(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToMPS(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPackSlip(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPackSlipShipment(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPartnerCentral(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToOpportunityCentral(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCampaign(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCRMGroup(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCRMWorkFlow(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToMaserLocations(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToMassMailer(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToMaterialExceptionMenu(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToMailMerge(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToServiceCentral(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPLM(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPM(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPMWorkOrder(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPO(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPOHist(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPOHistory(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPOReceipts(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPPAP(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPrintLabels(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPrior_AP(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPrior_AR(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToLabelMaintenance(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRMA(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSalesAnalysis(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSalesConfigTemplates(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSalesOrder(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToNewSalesOrder(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSalesOrderDetail(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSalesPeople(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSchedule(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToShipVia(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTooling(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToToolingTask(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToTransactionLocations(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToVendor(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToVendorCentral(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToVendorRMADetail(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToVisualBOM(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToVMI(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumptoWaveMgmtSOPicking(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumptoWaveMgmtWOStaging(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWebOrderImport(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWorkCenter(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWorkOrder(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQNotifySetForegroundWindow(var Msg: TMessage);
begin
//    DispatchMessage( Msg );
  // 02-13-2012 AA. If iq_NotifySetForegroundWindow is posted in IQQC (or other than IQWin32) it will result in IQwin32 launched as a DCOM
  // that in turn will raise exception No Jump Information available. This jump does not require any additional param nor should we launch IQWin32
  SetVisibleWindowsToForegroundEx; {IQMS.Common.Screen.pas}
end;

procedure TFrmJumperBase.JumpToCRMCallTypes(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.JumpToCRMHolidays(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.JumpToCRMMeetingTypes(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.JumpToCRMPendingActReq(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.JumpToCRMReminders(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.JumpToCRMScheduleCoordinator(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.JumpToCRMSupportIssueTypes(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.JumpToCRMTaskTypes(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToVendorStatus(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToVisualQuoteRouting(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToContact(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToContactCRM(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToControlPlan(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCostElements(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCostOfQuality(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToFMEA(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToGagesDevices(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToInspectionLog(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToQAccruedFreight(var Msg: TMessage);
begin
  DispatchMessage ( Msg );
end;

procedure TFrmJumperBase.IQJumpToQSndOp(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToQualityAudit(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToQualityAuditWorkFlow(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToInspectionSetup(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumptoInspRecordApproval(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToQualityProjects(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToQuickInspection(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRiskAssessment(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSPC(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSystemParameters(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSystemSetupEmpMaint(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToPO_Header(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToQuote(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToScheduleByWorkorder(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToScheduleBySndop_Dispatch_ID(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToWorkCenterAssy2(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSndOp(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToiq_ExpRep_Users( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToiq_ExpReports( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToiq_ExpRep_appr( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToiq_JumpToVendor_RFQ( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToiq_JumpToPO_Header_Requisition( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToiq_JumpToInvByLoc( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToiq_JumpToShipmanManifest( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToiq_JumpToShipmanCarrierMaint( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToiq_JumpToShipmanCloseShipments( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRMADetail(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToRMAHeader(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCRMCalendar(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCRMCall(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCRMMain(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCRMMeeting(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCRMNote(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToCRMTask(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToBankMain(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToBillTo(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToShipmanLTL(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToShipTo(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToVendorRMAHeader( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToExpectedPOReceipts(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToExpReportsDetail( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToHRApp( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToHREmpTraining( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToHREmpWorkflow(var Msg: TMessage);
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToAPWorkFlow ( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

procedure TFrmJumperBase.IQJumpToSalesOrderWorkFlow ( var Msg: TMessage );
begin
  DispatchMessage( Msg );
end;

end.
