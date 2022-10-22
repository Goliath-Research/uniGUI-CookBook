unit IQMS.CostSource.Types;

interface

uses
  Generics.Collections,
  costsrc_rscstr;

type
  TCostSourceMenuType = (
    None,
    ProjectManagerProject,
    ProjectManagerTask,
    MRO,
    JobShop,
    FixedAssets,
    UnassignCostSource);

  TCostSourceMenuTypes = set of TCostSourceMenuType;

  TCostSourceOwnerType = (
    AccountsReceivable,
    AccountsReceivableArchived,
    AccountsPayable,
    AccountsPayableArchived,
    PurchaseOrders,
    PurchaseOrderArchived,
    SalesOrders,
    SalesOrderHistory,
    GeneralLedger,
    GeneralJournal);

  TExecuteJumpEvent = reference to procedure(const AJumpID: Integer;
    const ARecordID: Int64);

const
  CostSourceFieldName = 'COST_OBJECT_SOURCE';
  CostSourceIDFieldName = 'COST_OBJECT_ID';
  CostSourceString: array[TCostSourceMenuType] of string = (
    '',
    'TOOL_RFQ',
    'TOOL_TASK_INFORMATION',
    'PMWO_DTL',
    'JOBSHOP_TASK',
    'FA_MAIN',
    '');

  //  costsrc_rscstr.cTXT0000006 = 'Project Manager';
  //  costsrc_rscstr.cTXT0000007 = 'MRO';
  //  costsrc_rscstr.cTXT0000008 = 'JobShop';
  //  costsrc_rscstr.cTXT0000009 = 'Fixed Assets';
  CostSourceCaption: array[TCostSourceMenuType] of string = (
    '',
    costsrc_rscstr.cTXT0000006, // 'Project Manager'
    costsrc_rscstr.cTXT0000006, // 'Project Manager'
    costsrc_rscstr.cTXT0000007, // 'MRO'
    costsrc_rscstr.cTXT0000008, // 'JobShop'
    costsrc_rscstr.cTXT0000009, // 'Fixed Assets'
    '');

implementation

end.
