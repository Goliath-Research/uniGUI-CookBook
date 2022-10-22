unit Mon_Types;

interface

uses
  System.SysUtils,
  IQAlert_rscstr;

(* *****************************************************************************
  * HOW TO ADD TO THE LIST OF ACTIONS:
  *
  * 1. Add a new type to TIQAlertActionType in this unit, below.  Place the
  *    the new type where it would appear alphabetically in the combo box list.
  *    Doing so may change the numeric value of the enumeration, but that is
  *    perfectly acceptable since it is a string constant that is saved to
  *    the database, and not a numeric value.
  *
  * 2. Update the TIQAlertAction array in this unit, below.
  *
  *    Elements:
  *       0:  String constant, in all-caps, that is saved to the database.
  *       1:  DisplayLabel. The display text that appears the
  *           combo box list. Use a resource string so the text can be
  *           translated. Add a new resource string to IQAlert_rscstr.pas.
  *
  * 3. Update the set of types according to application.  Add the new type
  *    (which you just added in Step # 1 above) to either the "IQAlert" or the
  *    "EServer" set, as follows:
  *
  *       a.) For IQAlert.exe, update the set, IQAlertActions.
  *       b.) For EServer.exe, update the set, EServerActions.
  *
  *    These lists determine what will be displayed in the combo box list
  *    per application.
  *
  *  4.  In either IQAlert or EServer, on the "Actions" form, locate and
  *      modify the virtual method, UpdateControlsForSelectedAction.
  *      Add logic to display the correct tabsheet, etc.
  *
  *  5.  In Mon_Thrd.pas, add a new protected procedure to handle the
  *      action.  This method will fire when the action is queued for
  *      execution.
  *
  *  6.  In Mon_Thrd.pas, in method, ProcessActionList(), add your new
  *      action method to the case statement.
  *
  *************************************************************************** *)

type
  /// <summary> IQAlert action type. </summary>
  TIQAlertActionType = (
    actNone,
    actAccruedFreight,
    actAnnounce,                            
    actAutoDisposition,
    actAutoEform,
    actAutoEformVendor,
    actAutoEmailExpenseReports,
    actAutoLoad,
    actCostCalculation_MFGItems,
    actCreateProductionBackup,
    actCreateProductionBackupDp,
    actCreateRepositoryBackup,
    actCreateRepositoryBackupDp,
    actCreditCardRetentionPurge,
    actCRMMassMailing,
    actCRMNotifications,
    actEDIAutoOutbound,
    actEmail,
    actEmailFileList,
    actEmailFiles,
    actEvalWorkflow,
    actEvaluateCreditStatus,
    actExportToFile,
    actFTPDownload,
    actFTPUpload,
    actHTTPSUpload,
    actHubspotSync,
    actHubspotUploadSync,
    actImportToyotaLabels,
    actIQGateExport,
    actIQMSPasswordExpiredGrace,
    actMROActivitySummary,
    actMROWorkOrders,
    actMSDSSync,
    actOutboundCustomerStatement,
    actPIT,
    actPollDir,
    actPopulateDataForSSS,
    actProjectActivitySummary,
    actReindexDocuments,
    actReindexKnowledgeCenter,
    actReport,
    actRollTmpToStd,
    actRunExe,
    actSalesforceSync,
    actSpotRateSync,
    actTaxCodeSync,
    actUpdateFRL,
    actUpdateMROCapacity,
    actUpdateSchedule,
    actVendorEDI,
    actVendorEDIReport);

const
  { TIQAlertAction }
  /// <summary> Array of IQAlert actions.  Element 0 = string constant.
  /// Element 1 = DisplayLabel.
  /// </summary>
  /// <remarks> Except for the first element ('NONE'), the list must be
  /// alphabetical.
  /// </remarks>
  TIQAlertAction: array [TIQAlertActionType] of array [0..1] of string = (
    ('NONE',                           IQAlert_rscstr.cRsc000109), // 'None'
    ('ACCRUED FREIGHT',                IQAlert_rscstr.cRsc000158), // 'Accrued Freight'
    ('ANNOUNCE',                       IQAlert_rscstr.cRsc000110), // 'Announce'
    ('AUTO DISPOSITION',               IQAlert_rscstr.cRsc000111), // 'Auto Disposition'
    ('AUTO EFORM',                     IQAlert_rscstr.cRsc000112), // 'Auto Eform'
    ('AUTO EFORM VENDOR',              IQAlert_rscstr.cRsc000113), // 'Auto Eform Vendor'
    ('AUTO EMAIL EXPENSE REPORTS',     IQAlert_rscstr.cRsc000114), // 'Auto Email Expense Reports'
    ('AUTO LOAD',                      IQAlert_rscstr.cRsc000115), // 'Auto Load'
    ('COST CALCULATION MFG ITEMS',     IQAlert_rscstr.cRsc000159), // 'Cost Calculations - MFG Items';
    ('CREATE PRODUCTION BACKUP',       IQAlert_rscstr.cRsc000116), // 'Create Production Backup'
    ('CREATE PRODUCTION BACKUP-DP',    IQAlert_rscstr.cRsc000117), // 'Create Production Backup-Dp'
    ('CREATE REPOSITORY BACKUP',       IQAlert_rscstr.cRsc000118), // 'Create Repository Backup'
    ('CREATE REPOSITORY BACKUP-DP',    IQAlert_rscstr.cRsc000119), // 'Create Repository Backup-Dp'
    ('CREDIT CARD RETENTION PURGE',    IQAlert_rscstr.cRsc000120), // 'Credit Card Retention Purge'
    ('CRM MASS MAILING',               IQAlert_rscstr.cRsc000121), // 'CRM Mass Mailing'
    ('CRM NOTIFICATIONS',              IQAlert_rscstr.cRsc000122), // 'CRM Notifications'
    ('EDI AUTO OUTBOUND',              IQAlert_rscstr.cRsc000123), // 'Edi Auto Outbound'
    ('EMAIL',                          IQAlert_rscstr.cRsc000124), // 'Email'
    ('EMAIL FILE LIST',                IQAlert_rscstr.cRsc000125), // 'Email File List'
    ('EMAIL FILES',                    IQAlert_rscstr.cRsc000126), // 'Email Files'
    ('EVAL WORKFLOW',                  IQAlert_rscstr.cRsc000127), // 'Eval Workflow'
    ('EVALUATE CREDIT STATUS',         IQAlert_rscstr.cRsc000128), // 'Evaluate Credit Status'
    ('EXPORT TO FILE',                 IQAlert_rscstr.cRsc000129), // 'Export To File'
    ('FTP DOWNLOAD',                   IQAlert_rscstr.cRsc000130), // 'FTP Download'
    ('FTP UPLOAD',                     IQAlert_rscstr.cRsc000131), // 'FTP Upload'
    ('HTTPS UPLOAD',                   IQAlert_rscstr.cRsc000132), // 'HTTPS Upload'
    ('HUBSPOT SYNC',                   IQAlert_rscstr.cRsc000133), // 'Hubspot Sync'
    ('HUBSPOT UPLOAD SYNC',            IQAlert_rscstr.cRsc000134), // 'Hubspot Upload Sync'
    ('IMPORT TOYOTA LABELS',           IQAlert_rscstr.cRsc000135), // 'Import Toyota Labels'
    ('IQGATE EXPORT',                  IQAlert_rscstr.cRsc000136), // 'Iqgate Export'
    ('IQMS PASSWORD EXPIRED GRACE',    IQAlert_rscstr.cRsc000137), // 'IQMS Password Expired Grace'
    ('MRO ACTIVITY SUMMARY',           IQAlert_rscstr.cRsc000138), // 'MRO Activity Summary'
    ('MRO WORK ORDERS',                IQAlert_rscstr.cRsc000156), // 'MRO Work Orders'
    ('MSDS SYNC',                      IQAlert_rscstr.cRsc000139), // 'MSDS Sync'
    ('OUTBOUND CUSTOMER STATEMENT',    IQAlert_rscstr.cRsc000140), // 'Outbound Customer Statement'
    ('PIT',                            IQAlert_rscstr.cRsc000141), // 'PIT'
    ('POLL DIR',                       IQAlert_rscstr.cRsc000142), // 'Poll Dir'
    ('POPULATE DATA FOR SSS',          IQAlert_rscstr.cRsc000143), // 'Populate Data For SSS'
    ('PROJECT ACTIVITY SUMMARY',       IQAlert_rscstr.cRsc000144), // 'Project Activity Summary'
    ('REINDEX DOCUMENTS',              IQAlert_rscstr.cRsc000145), // 'Reindex Documents'
    ('REINDEX KNOWLEDGE CENTER',       IQAlert_rscstr.cRsc000146), // 'Reindex Knowledge Center'
    ('REPORT',                         IQAlert_rscstr.cRsc000147), // 'Report'
    ('ROLL ALL TEMP TO STD',           IQAlert_rscstr.cRsc000160), // 'Roll All Temp Items to Standard Cost';
    ('RUN EXE',                        IQAlert_rscstr.cRsc000148), // 'Run Exe'
    ('SALESFORCE SYNC',                IQAlert_rscstr.cRsc000163), // 'Salesforce Sync'
    ('SPOT RATE SYNC',                 IQAlert_rscstr.cRsc000149), // 'Spot Rate Sync'
    ('TAX CODE SYNC',                  IQAlert_rscstr.cRsc000150), // 'Tax Code Sync'
    ('UPDATE FRL',                     IQAlert_rscstr.cRsc000151), // 'Update FRL'
    ('UPDATE MRO CAPACITY',            IQAlert_rscstr.cRsc000152), // 'Update MRO Capacity'
    ('UPDATE SCHEDULE',                IQAlert_rscstr.cRsc000153), // 'Update Schedule'
    ('VENDOR EDI',                     IQAlert_rscstr.cRsc000154), // 'Vendor EDI'
    ('VENDOR EDI REPORT',              IQAlert_rscstr.cRsc000155)  // 'Vendor EDI Report'
    );

  /// <summary> The list of actions displayed in IQAlert. </summary>
  IQAlertActions =
    [actNone,
    actAccruedFreight,
    actAnnounce,
    actAutoDisposition,
    actAutoEform,
    actAutoEformVendor,
    actAutoEmailExpenseReports,
    actAutoLoad,
    actCostCalculation_MFGItems,
    actCreateProductionBackup,
    actCreateProductionBackupDp,
    actCreateRepositoryBackup,
    actCreateRepositoryBackupDp,
    actCreditCardRetentionPurge,
    actCRMMassMailing,
    actCRMNotifications,
    actEmail,
    actEmailFileList,
    actEmailFiles,
    actEvalWorkflow,
    actEvaluateCreditStatus,
    actExportToFile,
    actFTPDownload,
    actFTPUpload,
    actHTTPSUpload,
    actHubspotSync,
    actHubspotUploadSync,
    actImportToyotaLabels,
    actIQGateExport,
    actIQMSPasswordExpiredGrace,
    actMROActivitySummary,
    actMROWorkOrders,
    actMSDSSync,
    actOutboundCustomerStatement,
    actPIT,
    actPollDir,
    actPopulateDataForSSS,
    actProjectActivitySummary,
    actReindexDocuments,
    actReindexKnowledgeCenter,
    actReport,
    actRollTmpToStd,
    actRunExe,
    actSalesforceSync,
    actSpotRateSync,
    actTaxCodeSync,
    actUpdateFRL,
    actUpdateMROCapacity,
    actUpdateSchedule];

  /// <summary> The list of actions displayed in EServer. </summary>
  EServerActions =
    [actNone,
    actEDIAutoOutbound,
    actEmail,
    actEmailFileList,
    actEmailFiles,
    actFTPDownload,
    actFTPUpload,
    actHTTPSUpload,
    actPollDir,
    actReport,
    actRunExe,
    actUpdateSchedule,
    actVendorEDI,
    actVendorEDIReport];

/// <summary> Get the TIQAlertActionType for a string constant. </summary>
function GetIQAlertActionType(const AValue: string): TIQAlertActionType;

implementation

function GetIQAlertActionType(const AValue: string): TIQAlertActionType;
var
  o: TIQAlertActionType;
begin
  Result := TIQAlertActionType(0);
  for o := Low(TIQAlertActionType) to High(TIQAlertActionType) do
    if CompareText(TIQAlertAction[o][0], AValue) = 0 then
      begin
        Result := o;
        Break;
      end;
end;


end.
