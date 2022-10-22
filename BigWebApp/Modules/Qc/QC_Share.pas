{ Sequential vs Broadcast

  1. HEADER Table
  "Sequential" - header table seq_workflow = "Y":
  the next element "B" is evaluated only when previous element "A" is completed.
  Note "A" and "B" can be assigned broadcast or sequential in the element table.

  "Broadcast" - header table seq_workflow = "N":
  next element "A" and "B" is evaluated without waiting for A to be completed.
  Likewise "A" and "B" can be assigned broadcast or sequential in the element table.

  2. ELEMENT Table
  "Sequential" - element table seq_workflow = "Y":
  only next responsible team member for this element will be emailed.

  "Broadcast" - element table seq_workflow = "N":
  all responsible team members for this element will be emailed.
}

unit QC_Share;

interface

uses
  SysUtils,
  Db,
  Graphics,
  IQMS.WebVcl.EmailCorrespondence,
  IQMS.WebVcl.Hpick,
  Classes,
  Generics.Collections,
  MainModule,
  IQMS.WebVcl.SecAddItem,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.Oracle;

type
  TSendEmailToApprove = procedure(ATo, ASubject, ABody: string;
    AAttachments: TStringList = nil) of object;
  TConvertToPDF = function(AExternal_Doc_ID: Real;
    ASrcFileName, ATrgFileName: string): Boolean of object;

  { 01-11-2010 add container for all future extra parameters }
  TQCEvalExtraParams = class
    ExpirePendingPeriod: Real;
    ExpireEmailToAddress: string;
    IsExpirePendingBasedOnDueDate: Boolean;
    ConvertToPDF: TConvertToPDF;
    Owner: TObject;
    AttachmentsBatchID: Real;
    Attachments: TStringList;
    AttachmentsSource: string;
    constructor Create; overload;
    constructor Create(AOwner: TObject); overload;
    destructor Destroy; override;
    procedure Reset;
  end;

  { TAttachmentItem }
  TAttachmentItem = class
    FileName: string;
    Source: string;
    SourceID: Real;
    constructor Create(AFileName, ASource: string; ASourceID: Real);
  end;

  { TAttachmentBatch }
  TAttachmentBatch = class(TComponent)
  private
    { Private declarations }
    FAttachments: TList<TAttachmentItem>;
    FAutoDeleteFiles: Boolean;
    FAutoClearBatch: Boolean;
    FAttachmentBatchID: Real;
    FSource: string;
    FSourceID: Real;
    FConnection: TFDConnection;
    procedure AddAttachmentToBatch(const AFileName, ASource: string;
      ASourceID: Real);
    procedure DeleteBatchRecords;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    /// <summary> Add attachments using a string list of file names.
    /// String list values will be added to the existing list of files.
    /// </summary>
    procedure AddAttachments(const AAttachments: TStringList;
      ASource: string; ASourceID: Real);
    /// <summary> Add a file to the attachment list.
    /// </summary>
    procedure AddAttachment(const AFileName, ASource: string; ASourceID: Real);
    /// <summary> Create the attachment batch records.
    /// </summary>
    procedure Execute;
    /// <summary> Clear the batch.  If AutoDeleteFiles is True, then
    /// the files will also be deleted.
    /// </summary>
    procedure ClearBatch;
    /// <summary> FireDAC Connection to use for SQL.</summary>
    property Connection: TFDConnection read FConnection write FConnection;
    /// <summary> Indicates whether to delete files (in the attachment list)
    /// when the component is destroyed.
    /// </summary>
    property AutoClearBatch: Boolean read FAutoClearBatch
      write FAutoClearBatch;
    /// <summary> Indicates whether to delete files (in the attachment list)
    /// when the component is destroyed.
    /// </summary>
    property AutoDeleteFiles: Boolean read FAutoDeleteFiles
      write FAutoDeleteFiles;
    /// <summary> Optional source table name.
    /// </summary>
    property Source: string read FSource write FSource;
    /// <summary> The ID value in source table name, if provided.
    /// </summary>
    property SourceID: Real read FSourceID write FSourceID;
    /// <summary> The batch ID for the list of attachments.  The list of
    /// attachments is stored in table, EMAIL_ATTACHMENT.
    /// </summary>
    property AttachmentBatchID: Real read FAttachmentBatchID;
  end;

  { TWFAttachments }
  TWFAttachments = class(TComponent)
  private
    { Private declarations }
    FHeaderTableName: string;
    FHeaderTableFkIDFieldName: string;
    FElementTableName: string;
    FAttachmentsBatchID: Real;
    FReportNameField: string;
    FTempPath: string;
    FBatchIDList: TList<Real>;
    FConnectionInternal: TFDConnection;
    FConnection: TFDConnection;
    procedure AddBatchID(const ABatchID: Real);
    procedure ClearBatch;
  protected
    { Protected declarations }
    /// <summary>Get temporary directory path.</summary>
    function TemporaryPath: string;
    /// <summary>Get work flow SQL for pending elements.</summary>
    function GetSQL(var AHeaderSQL, AElemSequentialSQL,
      AElemBroadcastSQL: string): Boolean;

    // Virtual methods which must be overridden in descendant class
    /// <summary> Assign default property values for this class.</summary>
    procedure AssignDefaults; virtual;
    /// <summary> Create the physical attachment file, as appropriate for
    /// this class. Each class overrides this method. </summary>
    function CreatAttachmentFile(const AWFHeaderID, AWFElementID: Real;
      const AFileName: string): Boolean; virtual;
    /// <summary> Get the Crystal report name to use for the output.
    /// Uses the ReportNameField property value to query the database.
    /// </summary>
    function GetReportName: string; virtual;
    /// <summary> Get the full name of the file attachment, starting with
    /// the report name as a base, and including the temporary path.
    /// Additional text (WF_HEADER_ID value) will be added to ensure a
    /// unique  file name. </summary>
    /// <param name="AWFHeaderID">ID value of the header table.
    /// </param>
    function GetAttachmentFileName(const AWFHeaderID: Real): string; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateExA(AOwner: TComponent; AHeaderTableName,
      AElementTableName, AHeaderTableFkIDFieldName: string);
    destructor Destroy; override;
    /// <summary> Create attachments for the provided element only. </summary>
    /// <param name="AElementID">ID value of the element table.
    procedure ExecuteSingle(const AElementID: Real);
    /// <summary> Create attachments for all pending work flows. </summary>
    procedure ExecuteAll;
    /// <summary> FireDAC Connection to use for SQL.</summary>
    property Connection: TFDConnection read FConnection write FConnection;
    /// <summary> Header table name; for example, WF_HEADER. </summary>
    property HeaderTableName: string read FHeaderTableName
      write FHeaderTableName;
    /// <summary> Detail or element table name; for example, WF_ELEMENT. </summary>
    property ElementTableName: string read FElementTableName
      write FElementTableName;
    /// <summary>  Foreign key field name in the element table pointing to
    /// the header table; for example, WF_HEADER_ID. </summary>
    property HeaderTableFkIDFieldName: string read FHeaderTableFkIDFieldName
      write FHeaderTableFkIDFieldName;
    /// <summary> System Parameters field, used to return the file name of
    /// the Crystal report used to generate attachments. </summary>
    property ReportNameField: string read FReportNameField
      write FReportNameField;
    /// <summary> The batch ID for the list of attachments.  The list of
    /// attachments is stored in table, EMAIL_ATTACHMENT.
    /// </summary>
    property AttachmentsBatchID: Real read FAttachmentsBatchID;
  end;

  { TWFAttachments_ProjectManager }
  TWFAttachments_ProjectManager = class(TWFAttachments)
  private
    { Private declarations }
    FReportName: string;
  protected
    { Protected declarations }
    procedure AssignDefaults; override;
    function CreatAttachmentFile(const AWFHeaderID, AWFElementID: Real;
      const AFileName: string): Boolean; override;
    /// <summary> Get the Crystal report name to use for the output.
    /// </summary>
  end;

  TEvalProcName = procedure(AElement_ID: Real;
    ADataBaseName: string = 'IQFD';
    ASendEmailToApprove: TSendEmailToApprove = NIL;
    AExtraParams: TQCEvalExtraParams = nil) of object;

  TEvalProcNameEx = procedure(AElement_ID: Real;
    ADataBaseName: string = 'IQFD';
    ASendEmailToApprove: TSendEmailToApprove = NIL;
    AExtraParams: TQCEvalExtraParams = nil) of object;

  TModifyQuery = procedure(var AQuery: TFDQuery) of object;
  TExecAfterProcessingElements = procedure(AWF_Header_ID: Real;
    ADataBaseName: string; ASendEmailToApprove: TSendEmailToApprove) of object;

  { reset 1 responsibility record }
procedure ResetWorkflowRecordForEvaluate(ATableName: string;
  ADataSet: TDataSet;
  AConfirm: Boolean = True;
  AElementTableName: string = '';
  ARefreshQuery: Boolean = True);

{ reset all responsibility records per element }
procedure ResetWorkflowRecordForEvaluate_All(ATableName: string;
  ADataSet: TDataSet;
  AConfirm: Boolean = True;
  AElementTableName: string = '';
  AShowProcessedCount: Boolean = True);

{ reset 1 element }
function RewindWorkflowElement(AHeaderCompleteDateField: TDateTimeField;
  AElementCompleteDateField: TDateTimeField;
  AResponsibilityTableName: string;
  AResponsibilityDataSet: TDataSet;
  AConfirm: Boolean = True;
  AElementTableName: string = '';
  AHeaderTableName: string = ''): Boolean;

{ reset all elements }
function RewindWorkflowElement_ALL(AHeaderCompleteDateField: TDateTimeField;
  AElementCompleteDateField: TDateTimeField;
  AResponsibilityTableName: string;
  AResponsibilityDataSet: TDataSet;
  AConfirm: Boolean = True;
  AElementTableName: string = ''): Boolean;

function CloneTemplate(var ANewTemplate_ID: Real;
  AOldTemplate_ID: Real;
  AHeadTabName,
  AElemTabName,
  ARespTabName,
  AChkListTabName: string): Boolean;

procedure DoWorkflowShell(AHeaderTableName: string;
  AElementTableName: string;
  AEvalProcName: TEvalProcName;
  ADataBaseName: string = 'IQFD';
  ASendEmailToApprove: TSendEmailToApprove = NIL;
  AElementParentFieldName: string = '';
  AModifyHeaderQuery: TModifyQuery = NIL;
  AExecAfterProcessingElements: TExecAfterProcessingElements = NIL;
  AExtraParams: TQCEvalExtraParams = nil);

procedure DoWorkflowShellEx(AHeaderTableName: string;
  AElementTableName: string;
  AEvalProcNameEx: TEvalProcNameEx;
  ADataBaseName: string = 'IQFD';
  ASendEmailToApprove: TSendEmailToApprove = NIL;
  AElementParentFieldName: string = '';
  AModifyHeaderQuery: TModifyQuery = NIL;
  AExecAfterProcessingElements: TExecAfterProcessingElements = NIL;
  AExtraParams: TQCEvalExtraParams = nil);

procedure CheckTerminateDeviation(AHeaderTableName, AElementTableName: string;
  AElement_ID: Real; ADataBaseName: string); forward;

procedure CheckAssignStartDate(DataSet: TDataSet;
  AHeaderTableName, AElementTableName: string);
procedure CalcElementsRequiredDate(AHeader_ID: Real; AStart_Date: TDateTime;
  AHeaderTableName, AElementTableName: string);
procedure PopulateBaselineDates(AHeader_ID: Real;
  AHeaderTableName, AElementTableName: string);
procedure CalcElementsSubsequentRequiredDate(AHeaderTableName: string;
  AHeader_ID: Real; AElementTableName: string; AElements_ID: Real);

function IsNoResponsiblesOrAnyAuthorizeFound(AElement_ID: Real;
  AHeaderTableName, AElementTableName, AResponsibilityTableName: string;
  ADataBaseName: string = 'IQFD'): Boolean;
function IsAnyAuthorizeFound(AElement_ID: Real;
  AHeaderTableName, AElementTableName, AResponsibilityTableName: string;
  ADataBaseName: string = 'IQFD'): Boolean;

procedure ChangeElementSequence(ADelta, AElement_ID, AHeader_ID: Real;
  AElementTableName, AHeaderTableName: string);

procedure AssignResponsibilityGridFontColor(var AFont: TFont;
  AType, ASignOff: string; AEmailSent, ASignOffDate: TDateTime);

procedure CheckClearItemInformationBeforePost(DataSet: TDataSet);

procedure DoOnNewElement(ElementDataSet, ParentDataSet: TDataSet;
  AElementTableName, FK_ParentColumnName: string);
procedure CheckStarted(AHeaderDataSet: TDataSet; AIs_Started_FieldName: string;
  AElementDataSet: TDataSet = nil);
procedure AssignElementsFieldsReadOnly(AHeaderDataSet, AElementDataSet
  : TDataSet; AIs_Started_FieldName: string);
procedure CheckLaunchPendingWorkflowsListViaURL(AModule: string = '');
procedure CloneResponsible(AResponsibleTableName, AElementFieldName: string;
  ASourceElement_ID, ATargetElement_ID: Real);
procedure CloneTemplateResponsible(ASourceTableName: string;
  ASourceElement_ID, ATargetElement_ID: Real);
procedure ResequenceResponsible(AResponsibleTableName, AElementFieldName
  : string; ATargetElement_ID: Real);
procedure ResequenceTemplateResponsible(ASourceTableName: string;
  ATargetElement_ID: Real);
procedure CheckElementCompleted(ACompleteDate: TDateTime);
{ TODO -omugdha -cWEBIQ : Dependancy on TIQEMailCorrespondence
procedure AssignEmailCorrespondenceSource(AEmailCorr: TIQEMailCorrespondence;
  ASource: string); }

// function GetEmailAttachmentBatchID: Integer;
// procedure AddEmailAttachment(const ABatchID: Integer; const AFileName: string);

procedure ReportWorkflowException(E: Exception;
  AHeaderTableName: string;
  AHeader_ID: Real;
  AElementTableName: string;
  AElement_ID: Real;
  ADataBaseName: string);

function IsWorkflowSubmitted(AWorkflow_ID: Real;
  AElementTableName,
  AResponsibleTableName,
  AFK_HeaderFieldName,
  AFK_ElementFieldName: string): Boolean;

procedure CheckWorkflowSubmitted(AWorkflow_ID: Real;
  AElementTableName,
  AResponsibleTableName,
  AFK_HeaderFieldName,
  AFK_ElementFieldName: string);

procedure LaunchPendingWorkflowApprovalViaURL(AResponsibilityTableName: string;
  AResponsibility_ID: Real);

procedure AssignHeaderDataFromElement(AElementTableName: string;
  AElement_ID: Real; var AHeaderTableName: string; var AHeader_ID: Real);
// currently not in use

procedure JumpToPLM(APlm_Links_ID: Real);

function SendAsHTML: Boolean;

function FindDateOfInterestInList(AList: array of TDateTime): TDateTime;

function GetNewWorkflowNo(AModuleName, ATableName: string;
  ANewWorkflow_ID: Real): string;

procedure ShellExecuteWorkflowElement(AElement_ID: Real; AOracleType: string;
  AAttachBatch_ID: Real = 0);
procedure ShellExecuteWorkflowType(AHeaderTableName,
  AElementTableName,
  AOracleType,
  AHeaderID_FieldName: string;
  AExtraParams: TQCEvalExtraParams = nil;
  Db: string = 'IQFD');

procedure CheckProcessAutoEFormVendor(const AOracleType: string);

function GetEPlantDisplayName(AEPlant_ID: Real): string; overload;
function GetEPlantDisplayName(DataSet: TDataSet): string; overload;

procedure CloneTemplateElement(AHeaderTableName: string;
  AElementTableName: string;
  AFK_ParentColumnName: string;
  ATrgHeader_ID: Real;
  ASrcElement_ID: Real;
  AElementDataSet: TDataSet);

function CreateReportAsPDF(const AReportName: string;
  const ASelectionCriteria: TStringList;
  const AFileName: string): Boolean;

type

  { TWorkflowShell }
  TWorkflowShell = class
  private
  protected
    FHeaderTableName: string;
    FElementTableName: string;
    FEvalProcName: TEvalProcName;
    FDataBaseName: string;
    FSendEmailToApprove: TSendEmailToApprove;
    FElementParentFieldName: string;
    FModifyHeaderQuery: TModifyQuery;
    FExecAfterProcessingElements: TExecAfterProcessingElements;
    FExpirePendingPeriod: Real;
    FExpireEmailToAddress: string;
    FExtraParams: TQCEvalExtraParams;

    procedure Evaluate(AElement_ID: Real); virtual;

    constructor Create(AHeaderTableName: string;
      AElementTableName: string;
      AEvalProcName: TEvalProcName;
      ADataBaseName: string = 'IQFD';
      ASendEmailToApprove: TSendEmailToApprove = NIL;
      AElementParentFieldName: string = '';
      AModifyHeaderQuery: TModifyQuery = NIL;
      AExecAfterProcessingElements: TExecAfterProcessingElements = NIL;
      AExtraParams: TQCEvalExtraParams = nil);

    procedure Execute;
  public
    class procedure PrepareTemporaryWorkflowCalendarWeekends(AHeaderTableName
      : string; AHeader_ID: Real; ADataBaseName: string); // = 'IQ' );
  end;

  { TWorkflowShellEx }
  TWorkflowShellEx = class(TWorkflowShell) // used in document control workflow
    FEvalProcNameEx: TEvalProcNameEx;
    FConvertToPDF: TConvertToPDF;

    procedure Evaluate(AElement_ID: Real); override;

    constructor Create(AHeaderTableName: string;
      AElementTableName: string;
      AEvalProcNameEx: TEvalProcNameEx;
      ADataBaseName: string = 'IQFD';
      ASendEmailToApprove: TSendEmailToApprove = NIL;
      AElementParentFieldName: string = '';
      AModifyHeaderQuery: TModifyQuery = NIL;
      AExecAfterProcessingElements: TExecAfterProcessingElements = NIL;
      AExtraParams: TQCEvalExtraParams = nil);
  end;

function AssignTeamMemberResponsibility(ADataSet: TDataSet;
  ATeamMemberPkList: TIQWebHPick): Boolean;
function AssignDelegateResponsibility(ADataSet: TDataSet;
  ATeamMemberPkList: TIQWebHPick): Boolean;
function IsWeekendsExluded(AHeaderTableName: string; AHeader_ID: Real;
  ADataBaseName: string = 'IQFD'): Boolean;
procedure NotifyDocumentOwnerAboutNewIdea(ADoc_Idea_ID: Real);

implementation

uses
  ActiveX,
  { TODO -omugdha -cWEBIQ : Dependancy EMailUtils
  dhr_main,   }
  Dialogs,
  IQMS.Common.EmailUtils,
  Forms,
  IQMS.WebVcl.Blob,
  IQMS.Common.FileUtils,
  IQMS.Common.JumpFile,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Print,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  { TODO -omugdha -cWEBIQ : Dependancy on UserMessages , plm_main
  IQMS.Common.UserMessages,
  plm_main, }
  po_share,
  Qc_rscstr,
  ShellAPI,
  Variants,
  wf_clone_tmpl,
  Windows;

procedure ResetWorkflowRecordForEvaluate(ATableName: string; ADataSet: TDataSet;
  AConfirm: Boolean = True; AElementTableName: string = '';
  ARefreshQuery: Boolean = True);
var
  AID: Real;
  AKind: string;
begin
  AID := ADataSet.FieldByName('ID').AsFloat;

  //  Qc_rscstr.cTXT000007 =
  // 'This option resets the record so it can be re-evaluated again.'#13#13 +
  //  ' Are you sure you wish to proceed?';
  if AConfirm and not IQConfirmYN(Qc_rscstr.cTXT000007)
  then
    Exit;

  ExecuteCommandFmt(
    'update %s set email_sent = NULL, signoff_date = NULL, signoff = NULL, ' +
    'pending_signoff_expired = NULL, delegate_email_sent = NULL where id = %f',
    [ATableName, AID]);
  if (AElementTableName > '') and
    Assigned(ADataSet.FindField(AElementTableName + '_ID')) then
    begin
      AID := ADataSet.FieldByName(AElementTableName + '_ID').AsFloat;
      ExecuteCommandFmt('update %s set reject_email_sent = null where id = %f',
        [AElementTableName, AID]);

      { check apply current out of office setting }
      AKind := SelectValueFmtAsString(
        'select qc_team.get_workflow_kind_from_element( ''%s'', %f ) from dual',
        [UpperCase(AElementTableName), AID]);
      ExecuteCommandFmt(
        'begin                                             ' +
        '  qc_team.ensure_correct_out_of_office( %f,       ' + // v_responsibility_id
        '                                        ''%s'',   ' + // v_source
        '                                        ''%s'' ); ' + // v_kind
        'end;                                              ',
        [AID,
        ATableName,
        AKind]);
    end;

  if ARefreshQuery then
    RefreshDataSetByID(ADataSet);
end;

procedure ResetWorkflowRecordForEvaluate_All(ATableName: string; ADataSet: TDataSet;
  AConfirm: Boolean = True; AElementTableName: string = '';
  AShowProcessedCount: Boolean = True);
var
  ACount: Integer;
begin
  //  Qc_rscstr.cTXT000008 =
  // 'This option resets ALL records so it can be re-evaluated again.'#13#13 +
  //  ' Are you sure you wish to proceed?';
  if AConfirm and not IQConfirmYN(Qc_rscstr.cTXT000008) then
    Exit;

  ACount := 0;

  with ADataSet do
    begin
      First;

      while not Eof do
        begin
          Inc(ACount);

          // ExecuteCommandFmt('update %s set email_sent = NULL, signoff_date = NULL, signoff = NULL where id = %f', [ ATableName, FieldByName('ID').AsFloat ]);
          ResetWorkflowRecordForEvaluate(ATableName, ADataSet,
            FALSE { AConfirm } , AElementTableName, FALSE { ARefreshQuery } );

          Next;
        end;
    end;

  Reopen(ADataSet);
  if AShowProcessedCount then
    // Qc_rscstr.cTXT000009 =
    // 'Finished processing.'#13#13 +
    //      'Number of processed workflow/approval records: %d';
    IQMS.Common.Dialogs.IQInformation(Format(Qc_rscstr.cTXT000009,
      [ACount]));
end;

function RewindWorkflowElement(AHeaderCompleteDateField: TDateTimeField;
  AElementCompleteDateField: TDateTimeField;
  AResponsibilityTableName: string;
  AResponsibilityDataSet: TDataSet;
  AConfirm: Boolean = True;
  AElementTableName: string = '';
  AHeaderTableName: string = ''): Boolean;
var
  AHeaderDataSet: TDataSet;
  AElementDataSet: TDataSet;
  B: Boolean;
begin
  Result := FALSE;
  // Qc_rscstr.cTXT000010 =
  // 'This option resets the element completion date and its ' +
  // 'workflow approval records so it can be evaluated again.'#13#13 +
  // ' Are you sure you wish to proceed?';
  if AConfirm and not IQConfirmYN(Qc_rscstr.cTXT000010) then
    Exit(False);

  AHeaderDataSet := AHeaderCompleteDateField.DataSet;
  AElementDataSet := AElementCompleteDateField.DataSet;

  { element }
  with AElementDataSet do
    begin
      Edit;
      B := AElementCompleteDateField.ReadOnly;
      AElementCompleteDateField.ReadOnly := FALSE;

      AElementCompleteDateField.Clear;

      AElementCompleteDateField.ReadOnly := B;
      Post;
    end;

  { header }
  if AHeaderCompleteDateField.asDateTime > 0 then
    with AHeaderDataSet do
      begin
        Edit;
        AHeaderCompleteDateField.Clear;
        Post;
      end;

  if (AHeaderTableName = '') and (AHeaderDataSet is TFDTable) then
    AHeaderTableName := TFDTable(AHeaderDataSet).TableName;

  if (AHeaderTableName > '') and (AHeaderDataSet.FindField('ID') <> nil) and
    (AHeaderDataSet.FieldByName('ID').AsFloat > 0) then
    ExecuteCommandFmt('update %s set email_sent_back = null where id = %f',
      [AHeaderTableName, AHeaderDataSet.FieldByName('ID').AsFloat]);

  { responsibility }
  ResetWorkflowRecordForEvaluate_All(AResponsibilityTableName,
    AResponsibilityDataSet, FALSE, AElementTableName); { QC_Share.pas }
  Result := True;
end;

function RewindWorkflowElement_ALL(AHeaderCompleteDateField: TDateTimeField;
  AElementCompleteDateField: TDateTimeField;
  AResponsibilityTableName: string;
  AResponsibilityDataSet: TDataSet;
  AConfirm: Boolean = True;
  AElementTableName: string = ''): Boolean;
var
  AHeaderDataSet: TDataSet;
  AElementDataSet: TDataSet;
  B: Boolean;
begin
  Result := FALSE;
  // Qc_rscstr.cTXT000011 = 'This option resets the completion date for all elements ' +
  //  'along with all workflow approval records so it can be evaluated ' +
  //  'again.'#13#13' Are you sure you wish to proceed?';
  if AConfirm and not IQConfirmYN(Qc_rscstr.cTXT000011) then
    Exit(False);

  AHeaderDataSet := AHeaderCompleteDateField.DataSet;
  AElementDataSet := AElementCompleteDateField.DataSet;

  { header }
  if AHeaderCompleteDateField.asDateTime > 0 then
    with AHeaderDataSet do
      begin
        Edit;
        AHeaderCompleteDateField.Clear;
        Post;
      end;

  { element }
  with AElementDataSet do
    begin
      First;
      while not Eof do
        begin
          Application.ProcessMessages;
          Edit;
          B := AElementCompleteDateField.ReadOnly;
          AElementCompleteDateField.ReadOnly := FALSE;
          AElementCompleteDateField.Clear;
          AElementCompleteDateField.ReadOnly := B;
          Post;

          { responsibility }
          ResetWorkflowRecordForEvaluate_All(AResponsibilityTableName,
            AResponsibilityDataSet, FALSE { AConfirmYN } , AElementTableName,
            FALSE { AShowProcessedCount } ); { QC_Share.pas }

          Next;
        end;
    end;

  Result := True;
end;

function CloneTemplate(var ANewTemplate_ID: Real;
  AOldTemplate_ID: Real;
  AHeadTabName,
  AElemTabName,
  ARespTabName,
  AChkListTabName: string): Boolean;
var
  Db: TFDConnection;
  ANewTemplateCode: string;
  ADescription: string;

  { ------------------------------------------------------------------------- }
  function GetNewName: Boolean;
  begin
    Result := FALSE;
    repeat
      if not TFrmCloneWorkflowTemplate.ExecuteSimple(ANewTemplateCode,
        ADescription) then { wf_clone_tmpl.pas }
        Exit;

      ANewTemplateCode := Trim(UpperCase(ANewTemplateCode));
      if Trim(ANewTemplateCode) = '' then
        Continue;

      if SelectValueFmtAsFloat('select 1 from %s where rtrim(name) = ''%s''',
        [AHeadTabName, ANewTemplateCode]) = 1 then
        begin
          // Qc_rscstr.cTXT000012 =
          //'Duplicated template name found.  Please provide a unique ' +
          //  'template name.';
          IQError(Qc_rscstr.cTXT000012);
          Continue;
        end;

      Result := True;
      Exit;
    until FALSE;
  end;

{ ------------------------------------------------------------------------- }
  procedure CloneHeader;
  begin
    ANewTemplate_ID := GetNextID(AHeadTabName);
    ExecuteCommandFmt('insert into %s                                             ' +
      '     ( id, name, descrip, seq_workflow, exclude_weekends,  ' +
      '       eplant_id )                                         ' +
      'select                                                     ' +
      '       %f, ''%s'', ''%s'', seq_workflow, exclude_weekends, ' +
      '       eplant_id                                           ' +
      '  from %s                                                  ' +
      ' where id = %f                                             ',
      [AHeadTabName,
      ANewTemplate_ID,
      ANewTemplateCode,
      ADescription,
      AHeadTabName,
      AOldTemplate_ID]);

    if SelectValueFmtAsFloat(
      'select 1 from user_tab_columns where table_name = ''%s'' and column_name = ''KIND''',
      [AHeadTabName]) = 1 then
      ExecuteCommandFmt(
        'update %s set kind = (select kind from %s where id = %f) where id = %f',
        [AHeadTabName,
        AHeadTabName,
        AOldTemplate_ID,
        ANewTemplate_ID]);

    ExecuteCommandFmt(
      'begin                                                                            ' +
      '  iqclone.insert_table( ''DOC_USED'',                                            ' +
      '                        ''external_doc_id, source, source_id, seq, print_with'', ' +
      '                        ''external_doc_id, source, %f, seq, print_with'',        ' + // new source_id
      '                        '' where source = ''''%s'''' and source_id = %f'' );     ' + // source table name, old source_id
      'end;                                                                             ',
      [ANewTemplate_ID,
      AHeadTabName,
      AOldTemplate_ID]);
  end;

{ ------------------------------------------------------------------------- }
  procedure CloneElement(AOldElement_ID: Real; var ANewElement_ID: Real);
  begin
    ANewElement_ID := GetNextID(AElemTabName);
    ExecuteCommandFmt(
      'insert into %s          ' + { apqp_type_element }
      '     ( id,              ' +
      '       %s,              ' + { apqp_type_id }
      '       seq,             ' +
      '       descrip,         ' +
      '       duration,        ' +
      '       seq_workflow,    ' +
      '       response_title ) ' +
      'select %f,              ' + { new_element_id }
      '       %f,              ' + { new_apqp_type_id }
      '       seq,             ' +
      '       descrip,         ' +
      '       duration,        ' +
      '       seq_workflow,    ' +
      '       response_title   ' +
      '  from %s               ' +
      ' where ID = %f          ',
      [AElemTabName,
      AHeadTabName + '_ID',
      ANewElement_ID,
      ANewTemplate_ID,
      AElemTabName,
      AOldElement_ID]);
  end;

{ ------------------------------------------------------------------------- }
  procedure ProcessElements;
  var
    ANewElement_ID: Real;
  begin
    with TFDQuery.Create(NIL) do
      try
        Connection := uniMainModule.FDConnection1;
        SQL.Add(IQFormat('select id from %s where %s = %f',
          [AElemTabName,
          AHeadTabName + '_ID',
          AOldTemplate_ID]));
        Open;
        while not Eof do
          begin
            { Element }
            CloneElement(FieldByName('ID').AsFloat, ANewElement_ID);

            { Response }
            ExecuteCommandFmt(
              'begin                            ' +
              '  IQClone.Insert_Child ( ''%s'', ' +
              { TableName         : 'apqp_response_list' }
              '                         %f,     ' +
              { New ParentID      : ANewElement_ID }
              '                         ''%s'', ' +
              { Parent Column Name: 'apqp_type_element_id' }
              '                         %f );   ' +
              { Old Parent ID     : AOldElement_ID }
              'end;                             ',
              [ARespTabName,
              ANewElement_ID,
              AElemTabName + '_ID',
              FieldByName('ID').AsFloat]);

            { Check List }
            ExecuteCommandFmt(
              'begin                            ' +
              '  IQClone.Insert_Child ( ''%s'', ' + { TableName }
              '                         %f,     ' + { New ParentID }
              '                         ''%s'', ' + { Parent Column Name }
              '                         %f );   ' + { Old Parent ID }
              'end;                             ',
              [AChkListTabName,
              ANewElement_ID,
              AElemTabName + '_ID',
              FieldByName('ID').AsFloat]);

            { Team_Member_Template }
            ExecuteCommandFmt(
              'insert into team_member_template  ' +
              '          ( source,               ' +
              '            source_id,            ' +
              '            team_member_id,       ' +
              '            seq,                  ' +
              '            name,                 ' +
              '            title,                ' +
              '            email,                ' +
              '            type,                 ' +
              '            text )                ' +
              '     select source,               ' +
              '            %f,                   ' +
              '            team_member_id,       ' +
              '            seq,                  ' +
              '            name,                 ' +
              '            title,                ' +
              '            email,                ' +
              '            type,                 ' +
              '            text                  ' +
              '       from team_member_template  ' +
              '      where source = ''%s''       ' +
              '        and source_id = %f        ',
              [ANewElement_ID,
              AElemTabName,
              FieldByName('ID').AsFloat]);

            Next;
          end;
      finally
        Free;
      end;
  end;

{ --------------------------------------------------------------------------- }
begin
  Result := FALSE;

  { validate }
  //  Qc_rscstr.cTXT000013 = 'Template not found.  Cannot clone non-existing template.';
  IQAssert(AOldTemplate_ID > 0, Qc_rscstr.cTXT000013);

  ANewTemplateCode := SelectValueByID('name', AHeadTabName, AOldTemplate_ID);
  //  Qc_rscstr.cTXT000014 = 'Invalid template.  Cannot clone.';
  IQAssert(ANewTemplateCode > '', Qc_rscstr.cTXT000014);
  { s/n happen }

  Db := uniMainModule.FDConnection1;
  Db.StartTransaction;
  try
    if not GetNewName then
      Exit(False);

    CloneHeader;
    ProcessElements;

    Result := True;
    Db.Commit;
  finally
    if Db.InTransaction then
      Db.Rollback;
  end;
end;

procedure CheckTerminateDeviation(AHeaderTableName, AElementTableName: string;
  AElement_ID: Real; ADataBaseName: string);
var
  AHeader_ID: Real;
begin
  if not StrInList(AHeaderTableName, ['car', 'eco']) then
    Exit;

  { Get header ID of this CAR/ECO element }
  AHeader_ID := SelectValueFmtAsFloat('select %s from %s where id = %f',
    [AHeaderTableName + '_ID',
    AElementTableName,
    AElement_ID],
    ADataBaseName);

  { Has this CAR or ECO been completed? }
  if SelectValueFmtAsFloat(
    'select 1 from %s where %s = %f and complete_date is NULL and rownum < 2',
    [AElementTableName,
    AHeaderTableName + '_ID',
    AHeader_ID],
    ADataBaseName) = 1 then
    Exit;

  { Terminate any deviations associated with this CAR/ECO }
  ExecuteCommandFmt(
    'begin                                                     ' +
    '  for v in (select id from wf_header                      ' +
    '             where %s = %f and kind = ''DEV''             ' +
    '               and complete_date is NULL )                ' +
    '  loop                                                    ' +
    '    update wf_element set complete_date = sysdate         ' +
    '     where wf_header_id = v.id and complete_date is NULL; ' +

    '    update wf_header set complete_date = sysdate          ' +
    '     where id = v.id;                                     ' +
    '  end loop;                                               ' +
    'end;                                                      ',
    [AHeaderTableName + '_ID',
    AHeader_ID],
    ADataBaseName);
end;

procedure CheckAssignStartDate(DataSet: TDataSet;
  AHeaderTableName, AElementTableName: string);
var
  APriorIsStarted: string;
begin
  { assumes dataset has fields: id, is_started, start_date }
  if (DataSet.FieldByName('is_started').AsString = 'Y') and
  // 09-11-2013 EIQ-701 and EIQ-703: update the Start Date each time user checks the Active box
    (SelectValueByID('is_started', AHeaderTableName, DataSet.FieldByName('id').AsFloat) <> 'Y') and
    Assigned(DataSet.FindField('start_date')) then
    begin
      DataSet.Edit;
      DataSet.FieldByName('start_date').asDateTime := SelectValueAsFloat('select sysdate from dual');

      // 04/30/2014 EIQ-2892 DHR/PLM/CRM workflows - Required Date is reverting after a change is made
      APriorIsStarted := SelectValueFmtAsString(
        'SELECT is_started FROM %s WHERE id = %.0f',
        [AHeaderTableName, DataSet.FieldByName('id').AsFloat]);
//      if (APriorIsStarted = '') then
        CalcElementsRequiredDate(DataSet.FieldByName('id').AsFloat,
          DataSet.FieldByName('start_date').asDateTime,
          AHeaderTableName,
          AElementTableName);
    end;
end;

procedure PopulateBaselineDates(AHeader_ID: Real;
  AHeaderTableName, AElementTableName: string);
begin
  with TFDStoredProc.Create(nil) do
  (*  PROCEDURE calc_elements_required_date
      ( p_header_id       IN NUMBER,
        p_start_date      IN DATE,
        p_header_tblname  IN VARCHAR2,
        p_elem_tblname    IN VARCHAR2 ); *)
  try
    Connection:= uniMainModule.FDConnection1;
    StoredProcName:= 'IQMS.WF_MISC.POP_ELEMENTS_BASELINE_DATES';
    (*IN*)
    Params.CreateParam( ftFMTBcd, 'p_header_id',      ptInput ).AsFMTBCD
      := Trunc(AHeader_ID);
    Params.CreateParam( ftString, 'p_header_tblname', ptInput).AsString
      := AHeaderTableName;
    Params.CreateParam( ftString, 'p_elem_tblname',   ptInput).AsString
      := AElementTableName;
    Prepare;
    Execute;
  finally
    Free;
  end;
end;

procedure CalcElementsRequiredDate(AHeader_ID: Real; AStart_Date: TDateTime;
  AHeaderTableName, AElementTableName: string);
begin
  with TFDStoredProc.Create(nil) do
  (*  PROCEDURE calc_elements_required_date
      ( p_header_id       IN NUMBER,
        p_start_date      IN DATE,
        p_header_tblname  IN VARCHAR2,
        p_elem_tblname    IN VARCHAR2 ); *)
  try
    Connection:= uniMainModule.FDConnection1;
    StoredProcName:= 'IQMS.WF_MISC.CALC_ELEMENTS_REQUIRED_DATE';
    (*IN*)
    Params.CreateParam( ftFMTBcd, 'p_header_id',      ptInput ).AsFMTBCD
      := Trunc(AHeader_ID);
    Params.CreateParam( ftDate,   'p_start_date',     ptInput).AsDateTime
      := AStart_Date;
    Params.CreateParam( ftString, 'p_header_tblname', ptInput).AsString
      := AHeaderTableName;
    Params.CreateParam( ftString, 'p_elem_tblname',   ptInput).AsString
      := AElementTableName;
    Prepare;
    Execute;
  finally
    Free;
  end;

  {  Migrated to SP 07-23-15 for HTML5 - Workflow Validation. AMB


  AExcludeWeekend := IQMS.Common.StringUtils.BoolToYN(IsWeekendsExluded(AHeaderTableName,
    AHeader_ID));
  AParentFieldName := Trim(AHeaderTableName) + '_ID';

  AReqDateBasedOnCompleted:= (AHeaderTableName = 'ECO')
                             and
                             (SelectValueFmtAsString('select qc_eco_misc.req_date_upon_prev_complete( %f ) from  dual',
                                           [ AHeader_ID ]) = 'Y');

  // 08/21/2014 Add TStringList for SQL because it made debugging a little
  // easier since the formatted text can be accessed.  I also formatted the
  // SQL in an attempt to make it easier to read.  (Byron).
  // Change:  Added "IF" statement to evaluate the sequence.  Elements with the
  // same sequence number should be given the same date.  For YouTrack:
  // EIQ-4074 CRM Workflow – Incorrect Required Dates when all Elements share same Sequence# – Rives Manufacturing – CRM# 1019000

  // 02-19-2015 EIQ-6023 SER# 06474 - Have the Required Date on an element update when the previous element is completed

(*
  ASQL := TStringList.Create;
  try
    ASQL.Add(       'DECLARE                                                                    ');
    ASQL.Add(Format('   l_date              DATE := TO_DATE(''%s'', ''mm/dd/yyyy'');            ',   [FormatDateTime('mm/dd/yyyy', AStart_Date)]));
    ASQL.Add(Format('   l_exclude_weekend   VARCHAR2(1) := ''%s'';                              ',   [AExcludeWeekend]));
    ASQL.Add(       '   l_seq               NUMBER;                                             ');
    ASQL.Add(Format('   l_parent_table_name varchar2(30)::= ''%s'';                             ',   [ AHeaderTableName ]));
    ASQL.Add(       '   l_prev_complete     date;                                               ');
    ASQL.Add(Format('   l_req_date_based_on_complete varchar2(1)::= ''%s'';                     ',   [ IQMS.Common.StringUtils.BoolToYN( AReqDateBasedOnCompleted )]));
    ASQL.Add(       'BEGIN                                                                      ');
    ASQL.Add(       '   qc_misc.assign_temp_calendar_weekends(l_date, l_exclude_weekend);       ');
    ASQL.Add(       '   l_seq := 0;                                                             ');
    ASQL.Add(       '   l_prev_complete:= l_date;                                               ');
    ASQL.Add(       '                                                                           ');
    ASQL.Add(       '   FOR ds IN (  SELECT id,                                                 ');
    ASQL.Add(       '                       seq,                                                ');
    ASQL.Add(       '                       NVL(duration, 0) AS duration,                       ');
    ASQL.Add(       '                       complete_date,                                      ');
    ASQL.Add(       '                       required_date                                       ');
    ASQL.Add(Format('                  FROM %s                                                  ',    [AElementTableName]));
    ASQL.Add(Format('                 WHERE %s = %.0f                                           ',    [AParentFieldName, AHeader_ID]));
    ASQL.Add(       '              ORDER BY seq)                                                ');
    ASQL.Add(       '   LOOP                                                                    ');
    ASQL.Add(       '      IF (l_seq <> ds.seq) THEN                                            ');
    ASQL.Add(       '         l_seq := ds.seq;                                                  ');
    ASQL.Add(       '                                                                           ');
    ASQL.Add(       '         IF ds.complete_date IS NULL THEN                                  ');
    ASQL.Add(       '            if l_req_date_based_on_complete = ''Y'' then                   ');
    ASQL.Add(       '               if l_prev_complete is null then                             ');
    ASQL.Add(       '                  l_date:=  null;                                          ');
    ASQL.Add(       '               else                                                        ');
    ASQL.Add(       '                  l_date:= qc_misc.end_date(l_prev_complete, ds.duration * 24);  ');
    ASQL.Add(       '               end if;                                                     ');
    ASQL.Add(       '            else                                                           ');
    ASQL.Add(       '               l_date :=  qc_misc.end_date(l_date, ds.duration * 24);      ');
    ASQL.Add(       '            end if;                                                        ');
    ASQL.Add(       '         ELSIF ds.required_date IS NOT NULL THEN                           ');
    ASQL.Add(       '            l_date := ds.required_date;                                    ');
    ASQL.Add(       '         ELSE                                                              ');
    ASQL.Add(       '            l_date := ds.complete_date;                                    ');
    ASQL.Add(       '         END IF;                                                           ');
    ASQL.Add(       '      END IF;                                                              ');
    ASQL.Add(       '                                                                           ');
    ASQL.Add(       '      IF ds.complete_date IS NULL THEN                                     ');
    ASQL.Add(Format('         UPDATE %s                                                         ',    [AElementTableName]));
    ASQL.Add(       '            SET required_date = l_date                                     ');
    ASQL.Add(       '          WHERE id = ds.id;                                                ');
    ASQL.Add(       '      END IF;                                                              ');
    ASQL.Add(       '                                                                           ');
    ASQL.Add(       '      l_prev_complete:= ds.complete_date;                                  ');
    ASQL.Add(       '   END LOOP;                                                               ');
    ASQL.Add(       '                                                                           ');
    ASQL.Add(       '   COMMIT;                                                                 ');
    ASQL.Add(       'END;                                                                       ');
    ExecuteCommand(ASQL.Text);
  finally
    ASQL.Free;
  end;
*)

  ASQL := TStringList.Create;
  try
    ASQL.Add(       'declare                                                                                 ');
    ASQL.Add(Format('   l_prev_required_date         DATE::= TO_DATE(''%s'', ''mm/dd/yyyy'');                ',  [ FormatDateTime('mm/dd/yyyy', AStart_Date)]));
    ASQL.Add(Format('   l_exclude_weekend            VARCHAR2(1)::= ''%s'';                                  ',  [ AExcludeWeekend ]));
    ASQL.Add(Format('   l_parent_table_name          varchar2(30)::= ''%s'';                                 ',  [ AHeaderTableName ]));
    ASQL.Add(       '   l_prev_complete              date;                                                   ');
    ASQL.Add(Format('   l_req_date_based_on_complete varchar2(1)::= ''%s'';                                  ',  [ IQMS.Common.StringUtils.BoolToYN( AReqDateBasedOnCompleted )]));
    ASQL.Add(       '                                                                                        ');
    ASQL.Add(       '   v_element_required_date date;                                                        ');
    ASQL.Add(       '   v_element_required_max_date date;                                                    ');
    ASQL.Add(       '                                                                                        ');
                        // -----------------------------------------------------                             ');
    ASQL.Add(       '   function get_required_date                                                           ');
    ASQL.Add(       '     ( v_prev_required_date    date,                                                    ');
    ASQL.Add(       '       v_element_complete_date date,                                                    ');
    ASQL.Add(       '       v_element_duration      number,                                                  ');
    ASQL.Add(       '       v_element_required_date date )                                                   ');
    ASQL.Add(       '     return date                                                                        ');
    ASQL.Add(       '   as                                                                                   ');
    ASQL.Add(       '     v_result date;                                                                     ');
    ASQL.Add(       '   begin                                                                                ');
    ASQL.Add(       '     if v_element_complete_date is null then                                            ');
    ASQL.Add(       '        if l_req_date_based_on_complete = ''Y'' then                                    ');
    ASQL.Add(       '           v_result:= qc_misc.end_date( l_prev_complete, v_element_duration * 24 );     ');
    ASQL.Add(       '        else                                                                            ');
    ASQL.Add(       '           v_result:= qc_misc.end_date( v_prev_required_date, v_element_duration * 24); ');
    ASQL.Add(       '        end if;                                                                         ');
    ASQL.Add(       '     elsif v_element_required_date is not null then                                     ');
    ASQL.Add(       '        v_result:= v_element_required_date;                                             ');
    ASQL.Add(       '     else                                                                               ');
    ASQL.Add(       '        v_result:= v_element_complete_date;                                             ');
    ASQL.Add(       '     end if;                                                                            ');
    ASQL.Add(       '                                                                                        ');
    ASQL.Add(       '     return v_result;                                                                   ');
    ASQL.Add(       '   end;                                                                                 ');
    ASQL.Add(       '                                                                                        ');
                    // -----------------------------------------------------                                 ');
    ASQL.Add(       'begin                                                                                   ');
    ASQL.Add(       '   qc_misc.assign_temp_calendar_weekends(l_prev_required_date, l_exclude_weekend);      ');
    ASQL.Add(       '   l_prev_complete:= l_prev_required_date;                                              ');
    ASQL.Add(       '                                                                                        ');
    ASQL.Add(       '   for x in ( select distinct seq                                                       ');
    ASQL.Add(Format('                from %s                                                                 ',  [ AElementTableName ]));
    ASQL.Add(Format('               where %s = %.0f                                                          ',  [ AParentFieldName, AHeader_ID ]));
    ASQL.Add(       '               order by seq )                                                           ');
    ASQL.Add(       '   loop                                                                                 ');
    ASQL.Add(       '     v_element_required_max_date:= l_prev_required_date;                                ');
    ASQL.Add(       '                                                                                        ');
    ASQL.Add(       '     for ds in ( select id,                                                             ');
    ASQL.Add(       '                        seq,                                                            ');
    ASQL.Add(       '                        nvl(duration, 0) as duration,                                   ');
    ASQL.Add(       '                        complete_date,                                                  ');
    ASQL.Add(       '                        required_date                                                   ');
    ASQL.Add(Format('                   from %s                                                              ',  [ AElementTableName ]));
    ASQL.Add(Format('                  where %s = %.0f                                                       ',  [ AParentFieldName, AHeader_ID ]));
    ASQL.Add(       '                    and seq = x.seq )                                                   ');
    ASQL.Add(       '     loop                                                                               ');
    ASQL.Add(       '        -- get this element required date                                               ');
    ASQL.Add(       '        v_element_required_date:= get_required_date( l_prev_required_date,              ');
    ASQL.Add(       '                                                     ds.complete_date,                  ');
    ASQL.Add(       '                                                     ds.duration, ds.required_date );   ');
    ASQL.Add(       '        -- update element                                                               ');
    ASQL.Add(       '        if ds.complete_date is null and ds.required_date is null then                                                ');
    ASQL.Add(Format('           update %s                                                                    ',  [ AElementTableName ]));
    ASQL.Add(       '              set required_date = v_element_required_date                               ');
    ASQL.Add(       '            where id = ds.id;                                                           ');
    ASQL.Add(       '        end if;                                                                         ');
    ASQL.Add(       '                                                                                        ');
    ASQL.Add(       '        -- remember the latest required date                                            ');
    ASQL.Add(       '        if v_element_required_max_date < v_element_required_date then                   ');
    ASQL.Add(       '           v_element_required_max_date:= v_element_required_date;                       ');
    ASQL.Add(       '        end if;                                                                         ');
    ASQL.Add(       '                                                                                        ');
    ASQL.Add(       '        l_prev_complete:= ds.complete_date;                                             ');
    ASQL.Add(       '     end loop;                                                                          ');
    ASQL.Add(       '                                                                                        ');
    ASQL.Add(       '     l_prev_required_date:= v_element_required_max_date;                                ');
    ASQL.Add(       '   end loop;                                                                            ');
    ASQL.Add(       '   commit;                                                                              ');
    ASQL.Add(       'end;                                                                                    ');

    ExecuteCommand(ASQL.Text);
  finally
    ASQL.Free;
  end;
  }
end;

procedure CalcElementsSubsequentRequiredDate(AHeaderTableName: string;
  AHeader_ID: Real; AElementTableName: string; AElements_ID: Real);
var
  AExcludeWeekend: string;
  ASQL: TStringList;
begin
  if (AElements_ID = 0) then
    Exit;

  AExcludeWeekend := IQMS.Common.StringUtils.BoolToYN(IsWeekendsExluded(AHeaderTableName,
    AHeader_ID));
(*
  ExecuteCommandFmt(
    'declare                                                              ' +
    '  v_date date;                                                       ' +
    '  v_this_seq  number;                                                ' +
    '  v_exclude_weekend varchar2(1)::= ''%s'';                           ' +
    'begin                                                                ' +
    // get the required date and sequence of the element we are on
    '  begin                                                              ' +
    '    select required_date, seq into v_date, v_this_seq                ' +
    '      from %s where id = %f;                                         ' +
    '  exception when no_data_found then                                  ' +
    '    return;                                                          ' +
    '  end;                                                               ' +
    '  if v_date is null or v_this_seq is null then                       ' +
    '     return;                                                         ' +
    '  end if;                                                            ' +

    // it is very important to call assign_temp_calendar_weekends before using qc_misc.end_date
    '  qc_misc.assign_temp_calendar_weekends( v_date, v_exclude_weekend ); ' +

    '  for v in (select id,                                               ' +
    '                   NVL(duration,0) as duration                       ' +
    '              from %s                                                ' +
    '             where %s = %f                                           ' +
    '               and seq > v_this_seq                                  ' +
    '             order by seq )                                          ' +
    '  loop                                                               ' +
    '     v_date::= qc_misc.end_date( v_date, v.duration * 24 );          ' +
    // relies on assign_temp_calendar_weekends
    '     update %s set required_date = v_date where id = v.id;           ' +
    '  end loop;                                                          ' +
    'end;',
    [AExcludeWeekend,
    AElementTableName,
    AElements_ID,
    AElementTableName,
    AHeaderTableName + '_ID',
    AHeader_ID,
    AElementTableName]);
*)

  ASQL := TStringList.Create;
  try
    ASQL.Add(       'declare                                                                    ');
    ASQL.Add(       '  v_date date;                                                             ');
    ASQL.Add(       '  v_this_seq  number;                                                      ');
    ASQL.Add(Format('  v_exclude_weekend varchar2(1)::= ''%s'';                                 ',  [ AExcludeWeekend ]));
    ASQL.Add(       '  v_element_required_max_date date;                                        ');
    ASQL.Add(       '  v_prev_required_date date;                                               ');
    ASQL.Add(       'begin                                                                      ');
                    // get the required date and sequence of the element we are on
    ASQL.Add(       '  begin                                                                    ');
    ASQL.Add(       '    select seq into v_this_seq                                             ');
    ASQL.Add(Format('      from %s                                                              ',  [ AElementTableName ]));
    ASQL.Add(Format('     where id = %f;                                                        ',  [ AElements_ID ]));
    ASQL.Add(       '  exception when no_data_found then                                        ');
    ASQL.Add(       '    return;                                                                ');
    ASQL.Add(       '  end;                                                                     ');
                    // max required date for this sequence
    ASQL.Add(       '  select max(required_date) into v_date                                    ');
    ASQL.Add(Format('      from %s                                                              ',  [ AElementTableName ]));
    ASQL.Add(Format('     where %s = %f                                                         ',  [ AHeaderTableName + '_ID', AHeader_ID ]));
    ASQL.Add(       '       and seq = v_this_seq;                                               ');
    ASQL.Add(       '  if v_date is null or v_this_seq is null then                             ');
    ASQL.Add(       '     return;                                                               ');
    ASQL.Add(       '  end if;                                                                  ');
    ASQL.Add(       '  if v_date is null or v_this_seq is null then                             ');
    ASQL.Add(       '     return;                                                               ');
    ASQL.Add(       '  end if;                                                                  ');

                    // it is very important to call assign_temp_calendar_weekends  before using qc_misc.end_date
    ASQL.Add(       '  qc_misc.assign_temp_calendar_weekends( v_date, v_exclude_weekend );      ');
    ASQL.Add(       '                                                                           ');
    ASQL.Add(       '  v_prev_required_date::= v_date;                                          ');
    ASQL.Add(       '  for x in ( select distinct seq                                           ');
    ASQL.Add(Format('               from %s                                                     ',  [ AElementTableName ]));
    ASQL.Add(Format('              where %s = %f                                                ',  [ AHeaderTableName + '_ID', AHeader_ID ]));
    ASQL.Add(       '                and seq > v_this_seq                                       ');
    ASQL.Add(       '              order by seq )                                               ');
    ASQL.Add(       '  loop                                                                     ');
    ASQL.Add(       '    v_element_required_max_date::= null;                                   ');
    ASQL.Add(       '    for v in ( select id,                                                  ');
    ASQL.Add(       '                      nvl(duration,0) as duration                          ');
    ASQL.Add(Format('                 from %s                                                   ',  [ AElementTableName ]));
    ASQL.Add(Format('                where %s = %f                                              ',  [ AHeaderTableName + '_ID', AHeader_ID ]));
    ASQL.Add(       '                  and seq = x.seq                                          ');
    ASQL.Add(       '                order by seq )                                             ');
    ASQL.Add(       '    loop                                                                   ');
    ASQL.Add(       '       v_date::= qc_misc.end_date( v_prev_required_date, v.duration * 24 );');
    ASQL.Add(Format('       update %s set required_date = v_date where id = v.id;               ',  [ AElementTableName ]));
    ASQL.Add(       '                                                                           ');
    ASQL.Add(       '       if v_element_required_max_date is null or v_element_required_max_date < v_date then ');
    ASQL.Add(       '          v_element_required_max_date::= v_date;                           ');
    ASQL.Add(       '       end if;                                                             ');
    ASQL.Add(       '    end loop;                                                              ');
    ASQL.Add(       '                                                                           ');
    ASQL.Add(       '    v_prev_required_date::= v_element_required_max_date;                   ');
    ASQL.Add(       '  end loop;                                                                ');
    ASQL.Add(       'end;                                                                       ');

    ExecuteCommand(ASQL.Text);
  finally
    ASQL.Free;
  end;
end;

function IsWeekendsExluded(AHeaderTableName: string; AHeader_ID: Real;
  ADataBaseName: string = 'IQFD'): Boolean;
var
  ATemplateTableName: string;
  ATemplateFK_Name: string;
  ATemplate_ID: Real;
begin
  Result := FALSE;

   Result:= 'Y' = SelectValueFmtAsString( 'select iqms.wf_misc.YN_is_weekends_excluded( ''%s'', %f ) from dual', [ AHeaderTableName, AHeader_ID ], ADatabaseName );

{ Migrated to SP 07-23-15 for HTML5 - Workflow Validation. AMB

  ATemplateTableName := '';
  if UpperCase(AHeaderTableName) = 'CAR' then
    begin
      ATemplateTableName := 'car_type';
      ATemplateFK_Name := 'car_type_id';
    end
  else if UpperCase(AHeaderTableName) = 'APQP' then
    begin
      ATemplateTableName := 'apqp_type';
      ATemplateFK_Name := 'apqp_type_id';
    end
  else if UpperCase(AHeaderTableName) = 'PPAP' then
    begin
      ATemplateTableName := 'ppap_type';
      ATemplateFK_Name := 'ppap_type_id';
    end
  else if UpperCase(AHeaderTableName) = 'ECO' then
    begin
      ATemplateTableName := 'eco_type';
      ATemplateFK_Name := 'eco_type_id';
    end
  else if Pos('WF_HEADER', UpperCase(AHeaderTableName)) > 0 then
    begin
      ATemplateTableName := 'wf_type';
      ATemplateFK_Name := 'wf_type_id';
    end;

  if ATemplateTableName > '' then
    begin
      ATemplate_ID := SelectValueByID(ATemplateFK_Name, AHeaderTableName, AHeader_ID,
        ADataBaseName);
      Result := SelectValueByID('exclude_weekends', ATemplateTableName, ATemplate_ID,
        ADataBaseName) = 'Y';
    end;

  }
end;

function IsNoResponsiblesOrAnyAuthorizeFound(AElement_ID: Real;
  AHeaderTableName, AElementTableName, AResponsibilityTableName: string;
  ADataBaseName: string = 'IQFD'): Boolean;
begin
  Result := True;

  { check if no responsibility records are found for this element }
  if SelectValueFmtAsFloat('select count(*) from %s where %s = %f',
    [AResponsibilityTableName,
    AElementTableName + '_ID',
    AElement_ID],
    ADataBaseName) = 0 then
    Exit;

  Result := IsAnyAuthorizeFound(AElement_ID, AHeaderTableName,
    AElementTableName, AResponsibilityTableName, ADataBaseName);
end;

function IsAnyAuthorizeFound(AElement_ID: Real;
  AHeaderTableName, AElementTableName, AResponsibilityTableName: string;
  ADataBaseName: string = 'IQFD'): Boolean;
var
  AHeader_ID: Real;
begin
  { get header_id }
  AHeader_ID := SelectValueFmtAsFloat('select %s from %s where id = %f',
    [AHeaderTableName + '_ID',
    AElementTableName,
    AElement_ID],
    ADataBaseName);

  { check ALL elements belonging to this header - if any responsibility of type Authorize is found - return TRUE }
  Result := SelectValueFmtAsFloat(
    'select count(*) from %s                                ' +
    ' where %s in                                           ' +
    '       (select id from %s where %s = %f)               ' +
    '   and Upper(NVL(type, ''Authorize'')) = ''AUTHORIZE'' ',
    [AResponsibilityTableName,
    AElementTableName + '_ID',
    AElementTableName,
    AHeaderTableName + '_ID',
    AHeader_ID], ADataBaseName) > 0;
end;

procedure ChangeElementSequence(ADelta, AElement_ID, AHeader_ID: Real;
  AElementTableName, AHeaderTableName: string);
begin
  // if some complete_date is filled in - just ensure ascending sequnce - do not change the order}
  // if SelectValueFmtAsFloat('select 1 from %s where %s_id = %f and complete_date is not null and rownum < 2', [ AElementTableName, AHeaderTableName, AHeader_ID ]) > 0 then
  // ADelta:= 0;

  ExecuteCommandFmt(
    'declare                                                              ' +
    '  v_delta       number::= %f;                                        ' +
    '  v_element_id  number::= %f;                                        ' +
    '  v_header_id   number::= %f;                                        ' +
    '  v_seq         number;                                              ' +
    '                                                                     ' +
    '  procedure Ensure_Proper_Ascending_Order                            ' +
    '  as                                                                 ' +
    '  begin                                                              ' +
    '     v_seq::= 1;                                                     ' +
    '     for v in (select id, NVL(seq,0) as seq from %s                  ' +
    // apqp_type_element
    '                where %s = v_header_id order by NVL(seq,0), id )     ' +
    // apqp_type_id
    '     loop                                                            ' +
    '       if v.seq <> v_seq then                                        ' +
    '          update %s set seq = v_seq where id = v.id;                 ' +
    // apqp_type_element
    '       end if;                                                       ' +
    '       v_seq::= v_seq + 1;                                           ' +
    '     end loop;                                                       ' +
    '  end;                                                               ' +
    '                                                                     ' +
    'begin                                                                ' +
    '  if v_element_id = 0 then                                           ' +
    '     return;                                                         ' +
    '  end if;                                                            ' +

    '  Ensure_Proper_Ascending_Order;                                     ' +

    '  if v_delta = 0 then                                                ' +
    '     return;                                                         ' +
    '  end if;                                                            ' +

    '  update %s set seq = NVL(seq, 0) + v_delta where id = v_element_id; ' +
    // apqp_type_element
    '                                                                     ' +
    '  begin                                                              ' +
    '    select seq into v_seq from %s where id = v_element_id;           ' +
    // apqp_type_element
    '  exception when no_data_found then                                  ' +
    '    return;                                                          ' +
    '  end;                                                               ' +
    '                                                                     ' +
    // moving up - push all beneath 1 below
    '  if v_delta < 0 then                                                ' +
    '     update %s set seq = NVL(seq, 0) + 1                             ' +
    // apqp_type_element
    '      where %s = v_header_id                                         ' +
    // apqp_type_id
    '        and NVL(seq,0) >= v_seq                                      ' +
    '        and id <> v_element_id;                                      ' +
    '                                                                     ' +
    '  else                                                               ' +
    // moving down - push all above 1 up
    '      update %s set seq = NVL(seq, 0) - 1                            ' +
    // apqp_type_element
    '       where %s = v_header_id                                        ' +
    // apqp_type_id
    '         and NVL(seq,0) <= v_seq                                     ' +
    '         and id <> v_element_id;                                     ' +
    '  end if;                                                            ' +
    '                                                                     ' +
    '  Ensure_Proper_Ascending_Order;                                     ' +
    'end;                                                                 ',
    [ADelta, // v_delta
    AElement_ID, // v_element_id
    AHeader_ID, // v_header_id
    AElementTableName,
    AHeaderTableName + '_ID',
    AElementTableName,
    AElementTableName,
    AElementTableName,
    AElementTableName,
    AHeaderTableName + '_ID',
    AElementTableName,
    AHeaderTableName + '_ID']);
end;

procedure AssignResponsibilityGridFontColor(var AFont: TFont;
  AType, ASignOff: string; AEmailSent, ASignOffDate: TDateTime);
begin
  if CompareText(AType, 'Review') = 0 then
    begin
      AFont.Style := AFont.Style + [fsItalic];
    end;

  if AEmailSent = 0 then
    begin
      AFont.Color := clBlack;
      Exit;
    end;

  if ASignOffDate = 0 then
    begin
      AFont.Color := clBlue;
      Exit;
    end;

  if ASignOff = 'Y' then
    AFont.Color := clGreen
  else
    AFont.Color := clRed;
end;

procedure CheckClearItemInformationBeforePost(DataSet: TDataSet);
begin
  with DataSet do
    begin
      if Trim(FieldByName('arinvt_itemno').AsString) <> '' then
        Exit;
      FieldByName('ARINVT_ID').Clear;
      FieldByName('ARINVT_CLASS').Clear;
      FieldByName('ARINVT_REV').Clear;
      FieldByName('ARINVT_DESCRIP').Clear;
      FieldByName('ARINVT_DESCRIP2').Clear;
    end;
end;

procedure DoOnNewElement(ElementDataSet, ParentDataSet: TDataSet;
  AElementTableName, FK_ParentColumnName: string);
begin
  IQAssignIDBeforePost(ElementDataSet, AElementTableName);
  ElementDataSet.FieldByName(FK_ParentColumnName).AsFloat :=
    ParentDataSet.FieldByName('ID').AsFloat;
  ElementDataSet.FieldByName('seq').AsFloat :=
    1 + SelectValueFmtAsFloat('select max(seq) from %s where %s = %f',
    [AElementTableName,
    FK_ParentColumnName,
    ParentDataSet.FieldByName('ID').AsFloat]);
end;

procedure CheckStarted(AHeaderDataSet: TDataSet; AIs_Started_FieldName: string;
  AElementDataSet: TDataSet = nil);
begin
  if (AHeaderDataSet.FieldByName(AIs_Started_FieldName).AsString = 'Y') then
    // Qc_rscstr.cTXT000015 =
    // 'Active is checked.  Changes to elements are not allowed.';
    raise Exception.Create(Qc_rscstr.cTXT000015);

  if Assigned(AElementDataSet) and (AElementDataSet.FieldByName('complete_date').asDateTime > 0) then
    // Qc_rscstr.cTXT000016 =
    // 'Complete date is assigned.  Changes to elements are not allowed.';
    raise Exception.Create(Qc_rscstr.cTXT000016);
end;

procedure AssignElementsFieldsReadOnly(AHeaderDataSet, AElementDataSet
  : TDataSet; AIs_Started_FieldName: string);
var
  AReadOnly: Boolean;
begin
  AReadOnly := (AElementDataSet.FieldByName('complete_date').asDateTime > 0)
    or
    (AHeaderDataSet.FieldByName(AIs_Started_FieldName).AsString = 'Y');

  if (AHeaderDataSet.State = dsBrowse) then
    begin
      AElementDataSet.FieldByName('seq').ReadOnly := AReadOnly;
      AElementDataSet.FieldByName('descrip').ReadOnly := AReadOnly;
      AElementDataSet.FieldByName('baseline_date').ReadOnly := AReadOnly;
      AElementDataSet.FieldByName('required_date').ReadOnly := AReadOnly;
      AElementDataSet.FieldByName('duration').ReadOnly := AReadOnly;
      AElementDataSet.FieldByName('seq_workflow').ReadOnly := AReadOnly;
    end;
end;

procedure CheckLaunchPendingWorkflowsListViaURL(AModule: string = '');
var
  AURL: string;
  ALink: string;

  function MapModuleNameToGetCountFunctionName: string;
  begin
    Result := Format('', [AModule]);
  end;

begin

  if AModule <> '' then
    begin
      { add to this list if the workflow uses web_approvals_query.get_count_share }
      if StrInList( AModule, [ 'CRM', 'PLM', 'DEV', 'MRB', 'DHR', 'AUDIT', 'APP', 'EMP', 'AP', 'OE' ]) then
      begin
        if SelectValueFmtAsFloat('select web_approvals_query.get_count_share(''%s'', 1, 0) from dual',
          [AModule]) = 0 then
          begin
            // Qc_rscstr.cTXT000017 = 'No outstanding workflows were found.';
            IQConfirm(Qc_rscstr.cTXT000017);
            ABORT;
          end
      end
      else
        if SelectValueFmtAsFloat('select web_approvals_query.get_count_%ss(1, 0) from dual',
          [AModule]) = 0 then
          begin
            // Qc_rscstr.cTXT000017 = 'No outstanding workflows were found.';
            IQConfirm(Qc_rscstr.cTXT000017);
            ABORT;
          end;
    end;

  AURL := SelectValueAsString('select app_server_url from iqsys');
  // Qc_rscstr.cTXT000018 = 'Application Server URL is not assigned.';
  IQAssert(AURL > '', Qc_rscstr.cTXT000018);
  if AURL[Length(AURL)] <> '/' then
    AURL := AURL + '/';

  if AModule <> '' then
    ALink := Format('%siqms/web_approvals.get_data?v_module=%s',
      [AURL, AModule])
  else
    ALink := Format('%siqms/web_approvals.get_data', [AURL]);

  ShellExecute(Application.MainForm.Handle, 'open', PChar(ALink), nil, nil,
    SW_SHOWNORMAL);
end;

procedure CloneResponsible(AResponsibleTableName, AElementFieldName: string;
  ASourceElement_ID, ATargetElement_ID: Real);
begin
  ExecuteCommandFmt(
    'begin                                ' +
    '  wf_misc.clone_responsible( ''%s'', ' + // v_table_name
    '                             ''%s'', ' + // v_fk_field_name
    '                             %f,     ' + // v_src_fk_id
    '                             %f );   ' + // v_trg_fk_id
    'end;                                 ',
    [AResponsibleTableName,
    AElementFieldName,
    ASourceElement_ID,
    ATargetElement_ID]);

  ResequenceResponsible(AResponsibleTableName, AElementFieldName,
    ATargetElement_ID);
end;

procedure ResequenceResponsible(AResponsibleTableName, AElementFieldName
  : string; ATargetElement_ID: Real);
begin
  ExecuteCommandFmt(
    'declare                                                                  ' +
    '  v_element_id number::= %f;                                             ' +
    '  v_index number::= 0;                                                   ' +
    'begin                                                                    ' +
    '  for v in (select id, seq from %s where %s = v_element_id order by id ) ' +
    '  loop                                                                   ' +
    '    v_index::= v_index + 1;                                              ' +
    '    if v_index <> v.seq then                                             ' +
    '       update %s set seq = v_index where id = v.id;                      ' +
    '    end if;                                                              ' +
    '  end loop;                                                              ' +
    'end;                                                                     ',
    [ATargetElement_ID,
    AResponsibleTableName,
    AElementFieldName,
    AResponsibleTableName]);
end;

procedure CloneTemplateResponsible(ASourceTableName: string;
  ASourceElement_ID, ATargetElement_ID: Real);
begin
  ExecuteCommandFmt(
    'begin                                         ' +
    '  wf_misc.clone_template_responsible( ''%s'', ' + // v_source_name
    '                                      %f,     ' + // v_src_fk_id
    '                                      %f );   ' + // v_trg_fk_id
    'end;',
    [ASourceTableName,
    ASourceElement_ID,
    ATargetElement_ID]);

  ResequenceTemplateResponsible(ASourceTableName, ATargetElement_ID);
end;

procedure ResequenceTemplateResponsible(ASourceTableName: string;
  ATargetElement_ID: Real);
begin
  ExecuteCommandFmt(
    'declare                                                                ' +
    '  v_element_id number::= %f;                                           ' +
    '  v_index number::= 0;                                                 ' +
    'begin                                                                  ' +
    '  for v in (select id, seq from team_member_template where source = ''%s'' and source_id = v_element_id order by id ) ' +
    '  loop                                                                 ' +
    '    v_index::= v_index + 1;                                            ' +
    '    if v_index <> v.seq then                                           ' +
    '       update team_member_template set seq = v_index where id = v.id;  ' +
    '    end if;                                                            ' +
    '  end loop;                                                            ' +
    'end;                                                                   ',
    [ATargetElement_ID,
    ASourceTableName]);
end;

procedure CheckElementCompleted(ACompleteDate: TDateTime);
begin
  // Qc_rscstr.cTXT000019 =
  // 'Element is marked as ''Completed''.  Operation aborted.';
  IQAssert(ACompleteDate = 0, Qc_rscstr.cTXT000019);
end;
 { TODO : Dependancy on TIQEMailCorrespondence
procedure AssignEmailCorrespondenceSource(AEmailCorr: TIQEMailCorrespondence;
  ASource: string);
begin
  AEmailCorr.Active := FALSE;
  AEmailCorr.Source := UpperCase(ASource);
  AEmailCorr.Active := True;
end; }

procedure ReportWorkflowException(E: Exception;
  AHeaderTableName: string;
  AHeader_ID: Real;
  AElementTableName: string;
  AElement_ID: Real;
  ADataBaseName: string);
var
  S: string;
begin
  // Qc_rscstr.cTXT000020 =
  // 'Exception encountered while processing a workflow:';
  S := Qc_rscstr.cTXT000020 + #13 + E.Message + #13#13;

  if AHeaderTableName > '' then
  // Qc_rscstr.cTXT000021 = 'Workflow header table: %s';
    S := S + ' ' + Format(Qc_rscstr.cTXT000021, [AHeaderTableName]) + #13;
  if AHeader_ID > 0 then
  // Qc_rscstr.cTXT000022 = 'Header ID: %.0f';
    S := S + ' ' + Format(Qc_rscstr.cTXT000022, [AHeader_ID]) + #13;
  if AElementTableName > '' then
  // Qc_rscstr.cTXT000023 = 'Workflow Element table: %s';
    S := S + ' ' + Format(Qc_rscstr.cTXT000023, [AElementTableName]) + #13;
  if AElement_ID > 0 then
  // Qc_rscstr.cTXT000024 = 'Element ID: %.0f';
    S := S + ' ' + Format(Qc_rscstr.cTXT000024, [AElement_ID]) + #13;

  ExecuteCommandFmt('begin write_class_eventlog( ''%s'', ''%s''); end;',
    ['WORKFLOW ERROR', S], ADataBaseName);
end;

{ general wrapper used for general workflows except of doc control.
See DoWorkflowShellEx below }
procedure DoWorkflowShell(AHeaderTableName: string;
  AElementTableName: string;
  AEvalProcName: TEvalProcName;
  ADataBaseName: string = 'IQFD';
  ASendEmailToApprove: TSendEmailToApprove = NIL;
  AElementParentFieldName: string = '';
  AModifyHeaderQuery: TModifyQuery = NIL;
  AExecAfterProcessingElements: TExecAfterProcessingElements = NIL;
  AExtraParams: TQCEvalExtraParams = nil);
begin
  with TWorkflowShell.Create(AHeaderTableName,
    AElementTableName,
    AEvalProcName,
    ADataBaseName,
    ASendEmailToApprove,
    AElementParentFieldName,
    AModifyHeaderQuery,
    AExecAfterProcessingElements,
    AExtraParams) do
    try
      Execute;
    finally
      Free;
    end;
end;

{ wrapper used in doc control when workflow is by templates.
The difference is AEvalProcName signature is changed to accommodate
extra param AConvertToPDF }
procedure DoWorkflowShellEx(AHeaderTableName: string;
  AElementTableName: string;
  AEvalProcNameEx: TEvalProcNameEx;
  ADataBaseName: string = 'IQFD';
  ASendEmailToApprove: TSendEmailToApprove = NIL;
  AElementParentFieldName: string = '';
  AModifyHeaderQuery: TModifyQuery = NIL;
  AExecAfterProcessingElements: TExecAfterProcessingElements = NIL;
  AExtraParams: TQCEvalExtraParams = nil);
begin
  with TWorkflowShellEx.Create(AHeaderTableName,
    AElementTableName,
    AEvalProcNameEx,
    ADataBaseName,
    ASendEmailToApprove,
    AElementParentFieldName,
    AModifyHeaderQuery,
    AExecAfterProcessingElements,
    AExtraParams) do
    try
      Execute;
    finally
      Free;
    end;
end;

{ TWorkflowShell class }
constructor TWorkflowShell.Create(AHeaderTableName: string;
  AElementTableName: string;
  AEvalProcName: TEvalProcName;
  ADataBaseName: string = 'IQFD';
  ASendEmailToApprove: TSendEmailToApprove = NIL;
  AElementParentFieldName: string = '';
  AModifyHeaderQuery: TModifyQuery = NIL;
  AExecAfterProcessingElements: TExecAfterProcessingElements = NIL;
  AExtraParams: TQCEvalExtraParams = nil);
begin
  FHeaderTableName := AHeaderTableName;
  FElementTableName := AElementTableName;
  FEvalProcName := AEvalProcName;
  FDataBaseName := ADataBaseName;
  FSendEmailToApprove := ASendEmailToApprove;
  FElementParentFieldName := AElementParentFieldName;
  FModifyHeaderQuery := AModifyHeaderQuery;
  FExecAfterProcessingElements := AExecAfterProcessingElements;
  FExtraParams := AExtraParams;
  if Assigned(FExtraParams) then
    begin
      FExpirePendingPeriod := AExtraParams.ExpirePendingPeriod;
      FExpireEmailToAddress := AExtraParams.ExpireEmailToAddress;
    end;
end;

procedure TWorkflowShell.Execute;
var
  H, E1, E2: TFDQuery;
  E: TFDQuery;
  procedure InitQueries;
  begin
    H.Connection := uniMainModule.FDConnection1;

    E1.Connection := uniMainModule.FDConnection1;

    E2.Connection := uniMainModule.FDConnection1;

    { Header }
    H.SQL.Add(IQFormat(
      'select id, NVL(seq_workflow, ''N'') as workflow_type ' +
      '  from %s x                                          ' +
      ' where exists( select 1 from %s where %s = x.id and complete_date is NULL) ' +
      '   and nvl(x.archived, ''N'') <> ''Y'' and nvl(x.is_started, ''N'') = ''Y''',
      [FHeaderTableName, FElementTableName, FElementParentFieldName]));

    { used in Deviation and Doc to change the query }
    if Assigned(FModifyHeaderQuery) then
      FModifyHeaderQuery(H);

    { Sequential - we process next element only when previous is completed }
    E1.SQL.Add(IQFormat(
      'select id from %s where %s = :id and complete_date is NULL                     ' +
      '   and seq = (select min(seq) from %s where complete_date is NULL and %s = :id)',
      [FElementTableName, FElementParentFieldName,
      FElementTableName, FElementParentFieldName]));

    { Broadcast - every element is getting processed }
    E2.SQL.Add(IQFormat(
      'select id from %s where %s = :id and complete_date is NULL ',
      [FElementTableName, FElementParentFieldName]));
  end;

begin
  H := TFDQuery.Create(NIL);
  E1 := TFDQuery.Create(NIL);
  E2 := TFDQuery.Create(NIL);
  E := NIL;
  try
    if FElementParentFieldName = '' then
      FElementParentFieldName := FHeaderTableName + '_ID';

    ExecuteCommand('begin execute immediate ''truncate table gtt_wf_calendar''; end;',
      FDataBaseName);
    InitQueries;

    { Header query - apqp, car, eco, ppap }
    H.Open;
    while not H.Eof do
      begin
        try
          if Assigned(E) then
            E.Close;

          if (H.FieldByName('workflow_type').AsString = 'Y') or
            (H.FieldByName('workflow_type').AsString = 'L') then
            // Sequential or Sequential PO Limit
            E := E1 { sequential - only 1 element }
          else
            E := E2; { broadcast - all elements }

//          E.ParamByName('ID').AsFloat := H.FieldByName('ID').AsFloat;
          AssignQueryParamValue(E, 'ID', H.FieldByName('ID').AsFloat);
          E.Open;

          { check template requires to exclude weekends - reset/populate temp gtt_wf_calendar table }
          PrepareTemporaryWorkflowCalendarWeekends(FHeaderTableName,
            H.FieldByName('id').AsFloat, FDataBaseName);

          { Process Element(s) }
          while not E.Eof do
            begin
              try
                Evaluate(E.FieldByName('ID').AsFloat);
                // call passed FEvalProcName
              except
                on Err: Exception do
                  ReportWorkflowException(Err, FHeaderTableName,
                    H.FieldByName('id').AsFloat, FElementTableName,
                    E.FieldByName('id').AsFloat, FDataBaseName);
              end;

              E.Next;
            end;

          { extra processing - used in deviation }
          if Assigned(FExecAfterProcessingElements) then
            FExecAfterProcessingElements(H.FieldByName('ID').AsFloat,
              FDataBaseName, FSendEmailToApprove);

        except
          on Err: Exception do
            ReportWorkflowException(Err, FHeaderTableName,
              H.FieldByName('id').AsFloat, '', 0, FDataBaseName);
        end;

        H.Next;
      end;
  finally
    H.Free;
    E1.Free;
    E2.Free;
  end;
end;

class procedure TWorkflowShell.PrepareTemporaryWorkflowCalendarWeekends
  (AHeaderTableName: string; AHeader_ID: Real; ADataBaseName: string);
// = 'IQ' );
var
  AExcludeWeekends: Boolean;
  ACalendarPopulated: Boolean;
begin
  AExcludeWeekends := IsWeekendsExluded(AHeaderTableName, AHeader_ID,
    ADataBaseName);
  ACalendarPopulated := SelectValueAsFloat('select 1 from gtt_wf_calendar where rownum < 2',
    ADataBaseName) = 1;

  // ensure when AExcludeWeekends = TRUE populate gtt_wf_calendar with the weekends otherwise truncate the table
  if AExcludeWeekends and not ACalendarPopulated or not AExcludeWeekends and ACalendarPopulated
  then
    ExecuteCommandFmt(
      'begin qc_misc.assign_temp_calendar_weekends( sysdate, ''%s'' ); end;',
      [IQMS.Common.StringUtils.BoolToYN(AExcludeWeekends)],
      ADataBaseName);
end;

procedure TWorkflowShell.Evaluate(AElement_ID: Real);
// call passed FEvalProcName
begin
  FEvalProcName(AElement_ID, FDataBaseName, FSendEmailToApprove, FExtraParams);
end;

{ TWorkflowShellEx }

constructor TWorkflowShellEx.Create(AHeaderTableName: string;
  AElementTableName: string;
  AEvalProcNameEx: TEvalProcNameEx;
  ADataBaseName: string = 'IQFD';
  ASendEmailToApprove: TSendEmailToApprove = NIL;
  AElementParentFieldName: string = '';
  AModifyHeaderQuery: TModifyQuery = NIL;
  AExecAfterProcessingElements: TExecAfterProcessingElements = NIL;
  AExtraParams: TQCEvalExtraParams = nil);

begin
  inherited Create(AHeaderTableName,
    AElementTableName,
    nil, // AEvalProcName is going to be replaced by AEvalProcNameEx
    ADataBaseName,
    ASendEmailToApprove,
    AElementParentFieldName,
    AModifyHeaderQuery,
    AExecAfterProcessingElements,
    AExtraParams);

  FEvalProcNameEx := AEvalProcNameEx;
  if Assigned(FExtraParams) then
    FConvertToPDF := FExtraParams.ConvertToPDF;
end;

procedure TWorkflowShellEx.Evaluate(AElement_ID: Real);
begin
  // FEvalProcNameEx( AElement_ID, FDataBaseName, FSendEmailToApprove, FExpirePendingPeriod, FExpireEmailToAddress, FConvertToPDF );
  FEvalProcNameEx(AElement_ID, FDataBaseName, FSendEmailToApprove,
    FExtraParams);
end;

function IsWorkflowSubmitted(AWorkflow_ID: Real;
  AElementTableName,
  AResponsibleTableName,
  AFK_HeaderFieldName,
  AFK_ElementFieldName: string): Boolean;
begin
  // Example:
  // select 1
  // from wf_elements e,
  // wf_responsibility r
  // where e.wf_header_id = %f
  // and e.id = r.wf_elements_id
  // and email_sent is not null

  Result := SelectValueFmtAsFloat(
    'select 1                       ' +
    '  from %s e,                   ' + // wf_elements
    '       %s r                    ' + // wf_responsibility
    ' where e.%s = %f               ' + // wf_header_id
    '   and e.id = r.%s             ' + // wf_elements_id
    '   and email_sent is not null  ' +
    '   and rownum < 2              ',
    [AElementTableName,
    AResponsibleTableName,
    AFK_HeaderFieldName,
    AWorkflow_ID,
    AFK_ElementFieldName]) = 1;
end;

procedure CheckWorkflowSubmitted(AWorkflow_ID: Real;
  AElementTableName,
  AResponsibleTableName,
  AFK_HeaderFieldName,
  AFK_ElementFieldName: string);
begin
  // Qc_rscstr.cTXT000025 =
  // 'Workflow has been submitted.  Operation is not allowed.';
  IQAssert(not IsWorkflowSubmitted(AWorkflow_ID,
    AElementTableName,
    AResponsibleTableName,
    AFK_HeaderFieldName,
    AFK_ElementFieldName),
    Qc_rscstr.cTXT000025);
end;

{$REGION 'TQCEvalExtraParams'}

{ TQCEvalExtraParams }

constructor TQCEvalExtraParams.Create;
begin
  Attachments := TStringList.Create;
  Reset;
end;

constructor TQCEvalExtraParams.Create(AOwner: TObject);
begin
  Create;
  if Assigned(AOwner) then
    Owner := AOwner;
end;

destructor TQCEvalExtraParams.Destroy;
begin
  if Assigned(Attachments) then
    FreeAndNil(Attachments);
  inherited Destroy;
end;

procedure TQCEvalExtraParams.Reset;
begin
  ExpirePendingPeriod := 0;
  ExpireEmailToAddress := '';
  IsExpirePendingBasedOnDueDate := FALSE;
  ConvertToPDF := nil; { used in external docs }
  AttachmentsBatchID := 0;
  AttachmentsSource := '';
  Attachments.Clear;
end;

{$ENDREGION 'TQCEvalExtraParams'}


function AssignTeamMemberResponsibility(ADataSet: TDataSet;
  ATeamMemberPkList: TIQWebHPick): Boolean;
var
  A: Variant;
  I: Integer;
begin
  // Qc_rscstr.cTXT000026 =
  // 'The Workflow is in either progress or is finished. ' +
  //  'The team member cannot be changed.';
  IQAssert(ADataSet.FieldByName('EMAIL_SENT').asDateTime = 0,
    Qc_rscstr.cTXT000026);

  with ATeamMemberPkList do
    begin
      Result := ExecuteEx('ID');
      if not Result then
        Exit;

      for I := 0 to ResultList.Count - 1 do
        begin
          // validate
          A := SelectValueArrayFmt(
            'select id, name, email, title, nvl(type, ''Authorize'') ' +
            'from team_member where id = %s',
            [ATeamMemberPkList.ResultList[I]]);
          // Qc_rscstr.cTXT000027 = 'Invalid Team Member ID.';
          IQAssert(VarArrayDimCount(A) > 0, Qc_rscstr.cTXT000027);
          { s/n happen }

          // if user selected just one team member - replace the current one otherwise append
          if ResultList.Count = 1 then
            ADataSet.Edit
          else
            ADataSet.Append;

          ADataSet.FieldByName('TEAM_MEMBER_ID').AsFloat := A[0];
          ADataSet.FieldByName('NAME').AsString := A[1];
          ADataSet.FieldByName('EMAIL').AsString := A[2];
          ADataSet.FieldByName('TITLE').AsString := A[3];
          ADataSet.FieldByName('TYPE').AsString := A[4];
        end;
    end;
end;

function AssignDelegateResponsibility(ADataSet: TDataSet;
  ATeamMemberPkList: TIQWebHPick): Boolean;
var
  A: Variant;
begin
  // Qc_rscstr.cTXT000026 =
  // 'The Workflow is in either progress or is finished. ' +
  //  'The team member cannot be changed.';
  IQAssert(ADataSet.FieldByName('EMAIL_SENT').asDateTime = 0,
    Qc_rscstr.cTXT000026);

  with ATeamMemberPkList do
    begin
      Result := Execute;
      if not Result then
        Exit;

      A := SelectValueArrayFmt(
        'select id, name, email, title from team_member where id = %f',
        [DtoF(GetValue('ID'))]);
      IQAssert(VarArrayDimCount(A) > 0, 'Invalid Team Member ID');
      { s/n happen }

      ADataSet.Edit;

      ADataSet.FieldByName('DELEGATE_TEAM_MEMBER_ID').AsFloat := A[0];
      ADataSet.FieldByName('DELEGATE_NAME').AsString := A[1];
      ADataSet.FieldByName('DELEGATE_EMAIL').AsString := A[2];
    end;
end;

procedure LaunchPendingWorkflowApprovalViaURL(AResponsibilityTableName: string;
  AResponsibility_ID: Real);
var
  ALink: string;
begin
  ALink := SelectValueByID('signoff_link', AResponsibilityTableName,
    AResponsibility_ID);
  // Qc_rscstr.cTXT000028 =
  // 'The pending approval record signoff link is blank.  ' +
  //  'Operation aborted.';
  IQAssert(ALink > '', Qc_rscstr.cTXT000028);
  IQMS.Common.Miscellaneous.ExecuteProgram(ALink, SW_SHOWNORMAL, 'open');
end;

{ 11-22-2010 future use }
procedure AssignHeaderDataFromElement(AElementTableName: string;
  AElement_ID: Real; var AHeaderTableName: string; var AHeader_ID: Real);
begin
  if UpperCase(AElementTableName) = 'CAR_ELEMENT' then
    begin
      AHeaderTableName := 'CAR';
      AHeader_ID := SelectValueByID('car_id', AElementTableName, AElement_ID);
    end
  else if UpperCase(AElementTableName) = 'APQP_ELEMENT' then
    begin
      AHeaderTableName := 'apqp';
      AHeader_ID := SelectValueByID('apqp_id', AElementTableName, AElement_ID);
    end
  else if UpperCase(AElementTableName) = 'PPAP_ELEMENT' then
    begin
      AHeaderTableName := 'ppap';
      AHeader_ID := SelectValueByID('ppap_id', AElementTableName, AElement_ID);
    end
  else if UpperCase(AElementTableName) = 'ECO_ELEMENT' then
    begin
      AHeaderTableName := 'eco';
      AHeader_ID := SelectValueByID('eco_id', AElementTableName, AElement_ID);
    end
  else if UpperCase(AElementTableName) = 'WF_ELEMENT' then
    begin
      AHeaderTableName := 'wf_header';
      AHeader_ID := SelectValueByID('wf_header_id', AElementTableName, AElement_ID);
    end
  else
    begin
      AHeaderTableName := '';
      AHeader_ID := 0;
    end;
end;

procedure JumpToPLM(APlm_Links_ID: Real);
var
  APLM_ID: Real;
begin
  APLM_ID := SelectValueFmtAsFloat(
    'select plm_id from v_plm_item_links where plm_links_id = %f',
    [APlm_Links_ID]);
  if APLM_ID = 0 then
    Exit;

  if (SelectValueByID('kind', 'plm', APLM_ID) = 'DHR') then
  { TODO -omugdha -cWEBIQ :  Dependency on dhr_main
    TFrmDHR_Main.DoShow(Application, APLM_ID)} { dhr_main.pas }
  else
  { TODO -omugdha -cWEBIQ :  Dependency on dhr_main
    TFrmPlm_Main.DoShow(Application, APLM_ID); }{ plm_main.pas }
end;

function SendAsHTML: Boolean;
begin
  Result := True;
end;

function FindDateOfInterestInList(AList: array of TDateTime): TDateTime;
var
  I: Integer;
begin
  for I := 0 to High(AList) do
    if AList[I] > 0 then
      begin
        Result := AList[I];
        Exit;
      end;

  Result := 0;
end;

procedure NotifyDocumentOwnerAboutNewIdea(ADoc_Idea_ID: Real);
var
  A: Variant;
  ARecipient, ASubject, ABodyText: string;
  AAttachments: TStringList;
  AJumpFileName: string;
  AExternal_Doc_ID: Real;
  sl: TStringList;
begin
  A := SelectValueArrayFmt(
    'select doc.id,                                 ' +
    '       doc.docno,                              ' +
    '       doc.descrip,                            ' +
    '       doc.status,                             ' +
    '       (select max(trans_date) from doc_log where trans_in_out = ''IN'' and external_doc_id = doc.id) as date_last_modified, ' +
    '       idea_member.name,                       ' +
    '       idea.text,                              ' +
    '       owner_member.email as owner_email       ' +
    '  from                                         ' +
    '       doc_idea idea,                          ' +
    '       doc_revision rev,                       ' +
    '       external_doc doc,                       ' +
    '       team_member idea_member,                ' +
    '       team_member owner_member                ' +
    '                                               ' +
    ' where                                         ' +
    '       idea.id = %f                            ' +
    '   and idea.doc_revision_id = rev.id           ' +
    '   and rev.external_doc_id = doc.id            ' +
    '   and doc.team_member_id = owner_member.id(+) ' +
    '   and idea.team_member_id = idea_member.id(+) ',
    [ADoc_Idea_ID]);
  if VarArrayDimCount(A) = 0 then
    Exit;

  AExternal_Doc_ID := A[0];
  ARecipient := Trim(A[7]);
  // Qc_rscstr.cTXT000029 = 'Document # %s: New idea submitted.';
  ASubject := Format(Qc_rscstr.cTXT000029, [Variants.VarToStr(A[1])]);

  if (ARecipient = '') or (AExternal_Doc_ID = 0) then
    Exit;

  // Create email body
  sl := TStringList.Create;
  try
    // Qc_rscstr.cTXT000030 = 'Document #: %s';
    sl.Add(Format(Qc_rscstr.cTXT000030,[Variants.VarToStr(A[1])]));
    // Qc_rscstr.cTXT000031 = 'Document Description: %s';
    sl.Add(Format(Qc_rscstr.cTXT000031,[Variants.VarToStr(A[2])]));
    // Qc_rscstr.cTXT000032 = 'Status: %s';
    sl.Add(Format(Qc_rscstr.cTXT000032,[Variants.VarToStr(A[3])]));
    // Qc_rscstr.cTXT000033 = 'Last Modified: %s';
    sl.Add(Format(Qc_rscstr.cTXT000033,[Variants.VarToStr(A[4])]));
    // Qc_rscstr.cTXT000034 = 'Submitted By: %s';
    sl.Add(Format(Qc_rscstr.cTXT000034,[Variants.VarToStr(A[5])]));
    // Qc_rscstr.cTXT000035 = 'The Idea: %s';
    sl.Add(Format(Qc_rscstr.cTXT000035,[Variants.VarToStr(A[6])]));
    // Qc_rscstr.cTXT000036 = 'Thank you.';
    sl.Add(Qc_rscstr.cTXT000036);
    ABodyText := sl.Text;
  finally
    FreeAndNil(sl);
  end;
{
  ABodyText := Format(
    'Doc #: %s', [A[1]]) + #13 +
    Format('Doc Description: %s', [A[2]]) + #13 +
    Format('Status: %s', [A[3]]) + #13 +
    Format('Last Modified: %s', [A[4]]) + #13 +
    Format('Submitted By: %s', [A[5]]) + #13 +
    Format('The Idea: %s', [A[6]]) + #13 + #13 +
    'Thank you.';
}
  // jump file
  AJumpFileName := IQMS.Common.Miscellaneous.IQGetLocalHomePath + Format('IQExtDoc_%.0f.eiq',
    [AExternal_Doc_ID]);
    { TODO -omugdha'UserMessages' is not the name of a unit
  IQMS.Common.JumpFile.CreateEIQJumpFile(AJumpFileName, IQMS.Common.UserMessages.iq_jumpToDocumentControl,
    Trunc(AExternal_Doc_ID)); }

  // send email
  AAttachments := TStringList.Create;
  try
    AAttachments.Add(AJumpFileName);
    IQMS.Common.EmailUtils.IQSendMailA(ARecipient,
      ASubject,
      ABodyText,
      AAttachments,
      True { SendNow } );
  finally
    AAttachments.Free;
    if FileExists(AJumpFileName) then
      SysUtils.DeleteFile(AJumpFileName);
  end;
end;

function GetNewWorkflowNo(AModuleName, ATableName: string;
  ANewWorkflow_ID: Real): string;
// Example: GetNewWorkflowNo( 'CAR', 'CAR', TblCarID.AsFloat );    {note TblCarID.AsFloat already represents new id}
// AModuleName: CAR, ECO, APQP, PPAP, WORKFLOW
var
  AEPlant_ID: string;
begin
  AEPlant_ID := SecurityManager.EPlant_ID;
  if AEPlant_ID <> 'NULL' then
    Result := GetEPlantNextSequenceNumber(AEPlant_ID, AModuleName,
      'S_' + ATableName)
  else
    begin
      if ANewWorkflow_ID = 0 then
        ANewWorkflow_ID := GetNextID(ATableName);
      Result := FloatToStr(ANewWorkflow_ID);
      IQAppend_EPlant_Suffix(AEPlant_ID, Result);
    end;
end;

procedure ShellExecuteWorkflowElement(AElement_ID: Real; AOracleType: string;
  AAttachBatch_ID: Real = 0);
begin
  // we want to construct this
  { declare
    wf wf_eval_dev:= wf_eval_dev();
    begin
    wf.shell_execute( v_element_id );
    end;
  }
  ExecuteCommandFmt(
    'declare                        ' +
    '  wf %s:= %s();                ' + // wf wf_eval_dev:= wf_eval_dev();
    ' begin                         ' +
    '  wf.shell_execute( %f, %f );  ' +
    ' end;                          ',
    [AOracleType,
    AOracleType,
    AElement_ID,
    AAttachBatch_ID]);

  CheckProcessAutoEFormVendor(AOracleType);
end;

procedure ShellExecuteWorkflowType(AHeaderTableName,
  AElementTableName,
  AOracleType,
  AHeaderID_FieldName: string;
  AExtraParams: TQCEvalExtraParams = nil; // future use
  Db: string = 'IQFD');
var
  _expire_pending_period,
    _attachments: Real;
  _expire_email_to_address: string;
  _expire_pending_based_duedate: Boolean;
  _attachmentsBatchID: Real;
  _attachmentsSource: string;
begin
  _expire_pending_period := 0;
  _expire_email_to_address := '';
  _expire_pending_based_duedate := FALSE;
  _attachments := 0;
  _attachmentsSource := '';
  if Assigned(AExtraParams) then
    begin
      _expire_pending_period := AExtraParams.ExpirePendingPeriod;
      _expire_email_to_address := AExtraParams.ExpireEmailToAddress;
      _expire_pending_based_duedate :=
        AExtraParams.IsExpirePendingBasedOnDueDate;
      // Note:  If you need to create a list of attachments, this must be
      // done first, before calling this method so that the physical files
      // exist and the are listed in EMAIL_ATTACHMENT for the provided
      // attachment BatchID.  See EvalWorkflow() in wf_main_project_manager.pas
      // for an example.
      _attachmentsBatchID := AExtraParams.AttachmentsBatchID;
      _attachmentsSource := AExtraParams.AttachmentsSource;
      // populated in IQAlert
    end;

  // 10/16/2015 (Byron, EIQ-8940) Ensure the EPLANT_ID and USER_NAME variables
  // are up-to-date for this DB.
  ExecuteCommandFmt('BEGIN '#13 +
            '  iqms.misc.set_eplant_id(%d, ''%s''); '#13 +
            'END; ',
            [SecurityManager.EPlant_ID_AsInteger, SecurityManager.EPlant_Name],
            Db);
  ExecuteCommandFmt('BEGIN iqms.misc.set_username(''%s''); END;',
    [SecurityManager.UserName], Db);

  ExecuteCommandFmt(
    'declare                                                        '#13 +
    // main object parameters
    '  v_header_tablename    varchar2(30)::= ''%s'';                '#13 +
    '  v_element_tablename   varchar2(30)::= ''%s'';                '#13 +
    '  v_ora_type            varchar2(30)::= ''%s'';                '#13 +
    '  v_header_id_fieldname varchar2(30)::= ''%s'';                '#13 +
    // extra parameters
    '  v_expire_pending_period        number::= %f;                 '#13 +
    '  v_expire_email_to_address      varchar2(2000)::= ''%s'';     '#13 +
    '  v_expire_pending_based_duedate varchar2(1)::= ''%s'';        '#13 +
    '  v_attachments                  number::= %.0f;               '#13 +
    '  v_attachments_source           varchar2(30)::= ''%s'';       '#13 +
    // param object
    '  v_param  wf_extra_param;                                     '#13 +
    // main object
    '  v_wf     wf_eval_shell;                                      '#13 +
    'begin                                                          '#13 +
    // create param object
    '  v_param:= wf_extra_param( v_expire_pending_period,           '#13 +
    '                            v_expire_email_to_address,         '#13 +
    '                            v_expire_pending_based_duedate);   '#13 +
    // assign some extra params to the wf_extra_param object
    '  v_param.attachments::= v_attachments;                        '#13 +
    '  v_param.attachments_source::= v_attachments_source;          '#13 +

    // create main object
    '  v_wf:= wf_eval_shell( v_header_tablename,                    '#13 +
    '                        v_element_tablename,                   '#13 +
    '                        v_ora_type,                            '#13 +
    '                        v_header_id_fieldname,                 '#13 +
    '                        v_param );                             '#13 +
    // execute!
    '  v_wf.do_execute;                                             '#13 +
    ' end;                                                          ',
    [AHeaderTableName,
    AElementTableName,
    AOracleType,
    AHeaderID_FieldName,
    _expire_pending_period,
    _expire_email_to_address,
    IQMS.Common.StringUtils.BoolToYN(_expire_pending_based_duedate),
    _attachmentsBatchID,
    _attachmentsSource],
    Db);

  CheckProcessAutoEFormVendor(AOracleType);
end;


procedure CheckProcessAutoEFormVendor(const AOracleType: string);
begin
  if CompareText(AOracleType, 'wf_eval_po') = 0 then
     po_share.CheckExecuteAutoEFormPOQueue;
end;

function GetEPlantDisplayName(AEPlant_ID: Real): string;
var
  AName: string;
begin
  if AEPlant_ID > 0 then
    AName := SelectValueByID('name', 'eplant', AEPlant_ID);

  if AEPlant_ID > 0 then
    Result := Format('[%.0f] %s', [AEPlant_ID, AName])
  else
    Result := '';
end;

function GetEPlantDisplayName(DataSet: TDataSet): string;
begin
  Result := '';

  if DataSet.FindField('eplant_id') = nil then
    Exit;

  Result := GetEPlantDisplayName(DataSet.FieldByName('eplant_id').AsFloat);
end;

procedure CloneTemplateElement(AHeaderTableName: string;
  AElementTableName: string;
  AFK_ParentColumnName: string;
  ATrgHeader_ID: Real;
  ASrcElement_ID: Real;
  AElementDataSet: TDataSet);
var
  ATrgElement_ID: Real;
begin
  ATrgElement_ID := GetNextID(AElementTableName);

  ExecuteCommandFmt(
    'declare                                                    ' +
    '  v_header_table_name varchar2(30)::= ''%s'';              ' +
    '  v_element_table_name varchar2(30)::= ''%s'';             ' +
    '  v_fk_parent_column_name varchar2(30)::= ''%s'';          ' +
    '  v_trg_header_id number::= %f;                            ' +
    '  v_trg_element_id number::= %f;                           ' +
    '  v_src_element_id number::= %f;                           ' +
    'begin                                                      ' +
    '  qc_misc.clone_template_element( v_header_table_name,     ' +
    '                                  v_element_table_name,    ' +
    '                                  v_fk_parent_column_name, ' +
    '                                  v_trg_header_id,         ' +
    '                                  v_trg_element_id,        ' +
    '                                  v_src_element_id );      ' +
    'end;                                                       ',
    [AHeaderTableName,
    AElementTableName,
    AFK_ParentColumnName,
    ATrgHeader_ID,
    ATrgElement_ID,
    ASrcElement_ID]);

  Reopen(AElementDataSet);
  AElementDataSet.Locate('ID', ATrgElement_ID, []);
end;

function CreateReportAsPDF(const AReportName: string;
  const ASelectionCriteria: TStringList;
  const AFileName: string): Boolean;
const
  C_MUTEX_NAME: string = 'TQCEvalWorkflowBase.CreateReportPDF';
var
  APath: string;
  AMutex: Cardinal;
  AFileNameModified: string;
begin
  // Initialization
  Result := FALSE;
  AFileNameModified := AFileName;
  APath := '';
  // If no report is provided, exit early.
  if AReportName > '' then
    begin
      // Ensure the file name has a valid path; ideally, this will be
      // the temporary folder.
      APath := ExtractFilePath(AFileName);
      if APath = '' then
        begin
          APath := IQMS.Common.Miscellaneous.GetSpecialPath(evTemp);
          AFileNameModified := IQMS.Common.FileUtils.PathCombineEx([APath, AFileName]);
        end;
      // Ensure the file extension is PDF.
      AFileNameModified := ChangeFileExt(AFileName, '.pdf');
      // Create the PDF file
      AMutex := CreateMutex(nil, FALSE, PWideChar(C_MUTEX_NAME));
      try
        // take ownership of our mutex
        if WaitforSingleObject(AMutex, INFINITE) = WAIT_OBJECT_0 then
          begin
            ActiveX.CoInitialize(nil);
            try
              IQMS.Common.Print.SaveReportAsPDF(Application, AReportName,
                ASelectionCriteria,
                AFileName);
            finally
              ActiveX.CoUninitialize;
            end;
          end;
      finally
        ReleaseMutex(AMutex);
      end;
      // Pass the result
      Result := FileExists(AFileName);
    end;
end;

{$REGION 'TAttachmentBatch'}

{ TAttachmentItem }

constructor TAttachmentItem.Create(AFileName, ASource: string; ASourceID: Real);
begin
  FileName := AFileName;
  Source := ASource;
  SourceID := ASourceID;
end;

{ TAttachmentBatch }

constructor TAttachmentBatch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAttachments := TList<TAttachmentItem>.Create;
  FAutoClearBatch := FALSE;
  FAutoDeleteFiles := FALSE;
  FConnection := uniMainModule.FDConnection1;
end;

destructor TAttachmentBatch.Destroy;
begin
  ClearBatch;
  if Assigned(FAttachments) then
    FreeAndNil(FAttachments);
  inherited Destroy;
end;

procedure TAttachmentBatch.ClearBatch;
begin
  if FAttachmentBatchID > 0 then
    begin
      // Delete attachement files, if requested
      if FAutoDeleteFiles then
        begin
          with TFDQuery.Create(nil) do
            try
              Connection := FConnection;
              SQL.Add('SELECT unc_file_name');
              SQL.Add('FROM email_attachment');
              SQL.Add(Format('WHERE batch_id = %.0f', [FAttachmentBatchID]));
              Open;
              while not Eof do
                begin
                  SysUtils.DeleteFile(Fields[0].AsString);
                  Next;
                end;
            finally
              Free;
            end;
        end;
      // Clear the batch data
      if FAutoClearBatch then
        DeleteBatchRecords;
    end;
end;

procedure TAttachmentBatch.DeleteBatchRecords;
begin
  // Clear the batch data
  with TFDCommand.Create(nil) do
    try
      Connection := FConnection;
      CommandText.Text := Format(
        'DELETE FROM email_attachment WHERE batch_id = %.0f',
        [FAttachmentBatchID]);
      Execute;
    finally
      Free;
    end;
end;

procedure TAttachmentBatch.AddAttachment(const AFileName, ASource: string;
  ASourceID: Real);
begin
  FAttachments.Add(TAttachmentItem.Create(AFileName, ASource, ASourceID));
end;

procedure TAttachmentBatch.AddAttachments(const AAttachments: TStringList;
  ASource: string; ASourceID: Real);
var
  I: Integer;
begin
  if Assigned(AAttachments) and (AAttachments.Count > 0) then
    for I := 0 to AAttachments.Count - 1 do
      AddAttachment(AAttachments.Strings[I], ASource, ASourceID);
end;

procedure TAttachmentBatch.AddAttachmentToBatch(const AFileName,
  ASource: string; ASourceID: Real);
var
  AMemoryStream: TMemoryStream;
  AID: Real;
  AUNCFileName, AShortFileName, AExt: string;
  o: TFDCommand;
begin
  if (FAttachmentBatchID > 0) and FileExists(AFileName) then
    begin
      AMemoryStream := TMemoryStream.Create;
      try
        // Load the file to a memory stream
        AMemoryStream.LoadFromFile(AFileName);
        // Assign the UNC file name.  Since the field is limited to 2000
        // (at this point), ensure the string will fit.
        AUNCFileName := AFileName;
        if Length(AUNCFileName) > 2000 then
          AUNCFileName := IQMS.Common.FileUtils.ShortDirectoryAndFileName(AFileName);
        // Get the file extension, without the period (max 5 char).
        // Note:  The java side does not want the period in the extension.
        AExt := LeftStr(Trim(IQMS.Common.StringUtils.StrAfterDot(ExtractFileExt(AFileName))),
          5);
        // Get the file name without the path or the extension (max 255 char).
        // Note:  The java side does not want the path or ext on the file name.
        AShortFileName := LeftStr(Trim(IQMS.Common.FileUtils.FileNameNoExt(AFileName)), 255);
        // Get next ID for the attachment table
        AID := GetNextID('EMAIL_ATTACHMENT');
        // Add the base record
        with TFDCommand.Create(niL) do
          try
            Connection := FConnection;
            CommandText.Add('INSERT INTO email_attachment(id,');
            CommandText.Add('                             batch_id,');
            CommandText.Add('                             file_name,');
            CommandText.Add('                             file_extension,');
            CommandText.Add('                             unc_file_name,');
            CommandText.Add('                             source,');
            CommandText.Add('                             source_id,');
            CommandText.Add('                             file_data)');
            CommandText.Add('    VALUES (:id,');
            CommandText.Add('            :batch_id,');
            CommandText.Add('            :file_name,');
            CommandText.Add('            :file_extension,');
            CommandText.Add('            :unc_file_name,');
            CommandText.Add('            :source,');
            CommandText.Add('            :source_id,');
            CommandText.Add('            EMPTY_BLOB())');
            Params.ParamByName('id').AsFloat := AID;
            Params.ParamByName('batch_id').AsFloat := FAttachmentBatchID;
            Params.ParamByName('file_name').AsString := AShortFileName;
            Params.ParamByName('file_extension').AsString := AExt;
            Params.ParamByName('unc_file_name').AsString := AUNCFileName;
            Params.ParamByName('source').AsString := ASource;
            if ASourceID > 0 then
              Params.ParamByName('source_id').AsFloat := ASourceID;
            Execute;
          finally
            Free;
          end;
        (*
          ExecuteCommandParam(
          'INSERT INTO email_attachment(id,'#13 +
          '                             batch_id,'#13 +
          '                             file_name,'#13 +
          '                             file_extension,'#13 +
          '                             unc_file_name,'#13 +
          '                             source,'#13 +
          '                             source_id,'#13 +
          '                             file_data)'#13 +
          '    VALUES (:id,'#13 +
          '            :batch_id,'#13 +
          '            :file_name,'#13 +
          '            :file_extension,'#13 +
          '            :unc_file_name,'#13 +
          '            :source,'#13 +
          '            :source_id,'#13 +
          '            EMPTY_BLOB())',
          ['ID;F', 'BATCH_ID;F', 'FILE_NAME;S', 'FILE_EXTENSION;S',
          'UNC_FILE_NAME;S', 'SOURCE;S', 'SOURCE_ID;F'],
          [AID, FAttachmentBatchID, AShortFileName, AExt, AUNCFileName,
          ASource, IQMS.Common.Numbers.NullIfZero(ASourceID)]); *)
        // Save the BLOB, passing the ID value of the new record.
        { TODO -omugdha -cWEBIQ : Undeclared identifier: 'TIQMS'
        TIQMS.WebVcl.Blob.SaveBlob('file_data',
          'email_attachment',
          AID,
          AMemoryStream); }// iqblob
      finally
        if Assigned(AMemoryStream) then
          FreeAndNil(AMemoryStream);
      end;
    end;
end;

procedure TAttachmentBatch.Execute;
var
  I: Integer;
  AAttachments: TStringList;
begin
  // Delete the prior batch; don't delete files.
  DeleteBatchRecords;
  // Get the next available attachment batch ID
  with TFDQuery.Create(nil) do
    try
      Connection := FConnection;
      SQL.Text := 'SELECT wf_share.new_attach_batch_id FROM DUAL';
      Open;
      FAttachmentBatchID := Fields[0].AsFloat;
    finally
      Free;
    end;
  // Cycle the list and add each file to the email_attachment table.
  for I := 0 to FAttachments.Count - 1 do
    AddAttachmentToBatch(FAttachments[I].FileName, FAttachments[I].Source,
      FAttachments[I].SourceID);
end;

{$ENDREGION 'TAttachmentBatch'}

{$REGION 'TWFAttachments'}

{ TWFAttachments }

constructor TWFAttachments.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // Create internal, multi-threaded connection.  This connection
  // is owned by this component, and is therefore freed in the
  // destructor.  The property value is left alone, since this
  // may be owned by the owner component.
  FConnectionInternal := TFDConnection.Create(nil);
  { TODO -omugdha -cWEBIQ :  Undeclared identifier: 'AssignFDPooledConnectionTo'
  MainModule.AssignFDPooledConnectionTo(FConnectionInternal); }

  // Assign default property value as the internal connection.  This
  // may be changed by the owner component.
  FConnection := FConnectionInternal;

  // Create an internal list to keep track of the email attachment
  // batches that are created.  This is used later to clear records.
  FBatchIDList := TList<Real>.Create;

  // Assign default property values.  This method can be overridden
  // by descendent classes.
  AssignDefaults;
end;

constructor TWFAttachments.CreateExA(AOwner: TComponent; AHeaderTableName,
  AElementTableName, AHeaderTableFkIDFieldName: string);
begin
  Create(AOwner); // see constuctor above

  // Assign property values with parameters
  HeaderTableName := AHeaderTableName;
  ElementTableName := AElementTableName;
  HeaderTableFkIDFieldName := AHeaderTableFkIDFieldName;
end;

destructor TWFAttachments.Destroy;
begin
  // Remove email attachment batch records.
  ClearBatch;

  // Free the internal list of email attachment batches.
  if Assigned(FBatchIDList) then
    FreeAndNil(FBatchIDList);

  // Dereference the property variable first, before freeing
  // the internal connection.
  FConnection := nil;

  // Free the internal connection
  if Assigned(FConnectionInternal) then
    FreeAndNil(FConnectionInternal);

  inherited Destroy;
end;

procedure TWFAttachments.AddBatchID(const ABatchID: Real);
begin
  // This method adds to the internal list of batches that
  // were created.  It used to delete batches, when the component
  // is freed.  See destructor above.
  if not Assigned(FBatchIDList) then
    FBatchIDList := TList<Real>.Create;
  FBatchIDList.Add(ABatchID);
end;

procedure TWFAttachments.AssignDefaults;
begin
  HeaderTableName := 'WF_HEADER';
  ElementTableName := 'WF_ELEMENT';
  HeaderTableFkIDFieldName := 'WF_HEADER_ID';
  // Note:  The report field name should be populated either by
  // the calling component, or by the descendent class in an
  // overridden AssignDefaults procedure.
  ReportNameField := '';
end;

function TWFAttachments.GetAttachmentFileName(const AWFHeaderID: Real): string;
var
  AReportName: string;
begin
  // This method returns a default file name, but this should
  // be overridden by the descendent class.
  AReportName := GetReportName;
  // If the property has not been assigned, then a random file name will be
  // returned.  See the AssignDefaults method of the descendent class.
  if AReportName > '' then
    begin
      // Get a file name that uses the report name and the header ID
      // value.  This helps enforce file names unique to a given record.
      if (AWFHeaderID > 0) then
        AReportName := Format('%s_%s', [FileNameNoExt(AReportName),
          IQMS.Common.StringUtils.LPadZero(FloatToStr(AWFHeaderID), 6)])
      else
        AReportName := FileNameNoExt(AReportName);
      // Add the temporary file path to the file name.
      Result := IQMS.Common.FileUtils.PathCombineEx([TemporaryPath, AReportName]);
      // Ensure the file extension is PDF.
      Result := ChangeFileExt(Result, '.pdf');
    end
  else
    // Return a random file name
    Result := IQMS.Common.Miscellaneous.GetTempFileName('.pdf');
end;

function TWFAttachments.GetReportName: string;
  function _TableFieldExists(ATableName, AFieldName: string): Boolean;
  begin
    with TFDQuery.Create(nil) do
      try
        Connection := FConnection;
        SQL.Text := Format('SELECT 1 FROM cols WHERE table_name = ' +
          'TRIM(UPPER(''%s'')) AND column_name = TRIM(UPPER(''%s'')) AND ' +
          'ROWNUM < 2', [ATableName, AFieldName]);
        Open;
        Result := Fields[0].AsInteger = 1;
      finally
        Free;
      end;
  end;

begin
  // Returns the report name, using the System Parameters field,
  // as noted by the ReportNameField property.  This method
  // can be overridden by the descendent class.
  // Result := IQMS.Common.Print.GetReportName(ReportNameField);
  try
    with TFDQuery.Create(nil) do
      try
        Connection := FConnection;
        if _TableFieldExists('IQSYS', ReportNameField) then
          SQL.Text := Format('SELECT %s FROM iqsys', [ReportNameField])
        else if _TableFieldExists('IQSYS2', ReportNameField) then
          SQL.Text := Format('SELECT %s FROM iqsys2', [ReportNameField])
        else
          Exit('');
        Open;
        Result := Fields[0].AsString;
      finally
        Free;
      end;
  except
    Result := '';
  end;
end;

function TWFAttachments.GetSQL(var AHeaderSQL, AElemSequentialSQL,
  AElemBroadcastSQL: string): Boolean;
begin
  with TFDStoredProc.Create(nil) do
    try
      Connection := FConnection;
      { procedure wf_eval_sql(p_header_tablename IN VARCHAR2,
        p_element_tablename IN VARCHAR2,
        p_header_fk_id_fieldname IN VARCHAR2,
        p_header_sql IN OUT VARCHAR2,
        p_elem_sql_sequential IN OUT VARCHAR2,
        p_elem_sql_broadcast IN OUT VARCHAR2) }
      StoredProcName := 'IQMS.WF_SHARE.WF_EVAL_SQL';
      with Params.CreateParam(ftString, 'p_header_tablename', ptInput) do
        AsString := HeaderTableName;
      with Params.CreateParam(ftString, 'p_element_tablename', ptInput) do
        AsString := ElementTableName;
      with Params.CreateParam(ftString, 'p_header_fk_id_fieldname', ptInput) do
        AsString := HeaderTableFkIDFieldName;
      Params.CreateParam(ftString, 'p_header_sql', ptOutput);
      Params.CreateParam(ftString, 'p_elem_sql_sequential', ptOutput);
      Params.CreateParam(ftString, 'p_elem_sql_broadcast', ptOutput);
      Prepare;
      ExecProc;
      AHeaderSQL := ParamByName('p_header_sql').AsString;
      AElemSequentialSQL := ParamByName('p_elem_sql_sequential').AsString;
      AElemBroadcastSQL := ParamByName('p_elem_sql_broadcast').AsString;
    finally
      Free;
    end;
  Result := (AHeaderSQL > '') and (AElemSequentialSQL > '') and
    (AElemBroadcastSQL > '');
end;

function TWFAttachments.TemporaryPath: string;
begin
  if FTempPath = '' then
    FTempPath := IQMS.Common.Miscellaneous.GetSpecialPath(evTemp);
  Result := FTempPath
end;

procedure TWFAttachments.ExecuteSingle(const AElementID: Real);
var
  AFileName: string;
  AWFHeaderID: Real;
  AttachmentBatch: TAttachmentBatch;
begin
  if AElementID > 0 then
    begin
      AttachmentBatch := TAttachmentBatch.Create(Self);
      try
        AttachmentBatch.Connection := FConnection;
        AttachmentBatch.AutoDeleteFiles := FALSE;
        AttachmentBatch.AutoClearBatch := FALSE;
        with TFDQuery.Create(nil) do
          try
            Connection := FConnection;
            // SELECT wf_header_id
            SQL.Add(Format('SELECT %s', [HeaderTableFkIDFieldName]));
            // FROM wf_element
            SQL.Add(Format('FROM %s', [ElementTableName]));
            // WHERE id = 123
            SQL.Add(Format('WHERE id = %.0f', [AElementID]));
            Open;
            // Get the parent ID
            AWFHeaderID := Fields[0].AsFloat;
            AFileName := GetAttachmentFileName(AWFHeaderID);
            if CreatAttachmentFile(AWFHeaderID, AElementID,
              AFileName) then
              // Add to EMAIL_ATTACHMENTS
              AttachmentBatch.AddAttachment(AFileName, ElementTableName,
                AElementID);
            // Create the table records.
            AttachmentBatch.Execute;
            // Add batch to the list
            AddBatchID(AttachmentBatch.AttachmentBatchID);
            // Return the Batch ID value
            FAttachmentsBatchID := AttachmentBatch.AttachmentBatchID
          finally
            Free;
          end;
      finally
        FreeAndNil(AttachmentBatch);
      end;
    end;
end;

procedure TWFAttachments.ExecuteAll;
var
  AHeaderSQL, AElemSequentialSQL, AElemBroadcastSQL: string;
  AHeaderQuery, AElemQuery: TFDQuery;
  AFileName: string;
  AWFHeaderID: Real;
  AFileCreated: Boolean;
  AttachmentBatch: TAttachmentBatch;
begin
  if GetSQL(AHeaderSQL, AElemSequentialSQL, AElemBroadcastSQL) then
    begin
      AHeaderQuery := TFDQuery.Create(nil);
      try
        AHeaderQuery.Connection := FConnection;
        AHeaderQuery.SQL.Text := AHeaderSQL;
        AHeaderQuery.Open;
        AElemQuery := TFDQuery.Create(nil);
        try
          AElemQuery.Connection := FConnection;
          while not AHeaderQuery.Eof do
            begin
              AElemQuery.Close;
              if (AHeaderQuery.FieldByName('workflow_type').AsString = 'Y') or
                (AHeaderQuery.FieldByName('workflow_type').AsString = 'L')
              then
                AElemQuery.SQL.Text := AElemSequentialSQL
              else
                AElemQuery.SQL.Text := AElemBroadcastSQL;
//              AElemQuery.Params.ParamByName('ID').AsFloat :=
//                AHeaderQuery.FieldByName('id').AsFloat;
              AssignQueryParamValue(AElemQuery, 'ID', AHeaderQuery.FieldByName('id').AsFloat);
              AElemQuery.Open;

              // Create an attachment batch for this element.
              AttachmentBatch := TAttachmentBatch.Create(nil);
              try
                AttachmentBatch.Connection := FConnection;
                AttachmentBatch.AutoDeleteFiles := FALSE;
                AttachmentBatch.AutoClearBatch := FALSE;
                while not AElemQuery.Eof do
                  begin
                    // Create the report
                    AFileName := GetAttachmentFileName
                      (AHeaderQuery.FieldByName('id').AsFloat);
                    // If the file has not already been created,
                    // save time (enhance speed), by not adding it again.
                    if CreatAttachmentFile(
                      AHeaderQuery.FieldByName('id').AsFloat,
                      AElemQuery.FieldByName('ID').AsFloat,
                      AFileName) then
                      begin
                        // Add to EMAIL_ATTACHMENTS
                        AttachmentBatch.AddAttachment(AFileName,
                          ElementTableName,
                          AElemQuery.FieldByName('ID').AsFloat);
                      end;
                    // Next detail record
                    AElemQuery.Next;
                  end;
                // Create the batch records for this element
                AttachmentBatch.Execute;
                // Add batch to the list
                AddBatchID(AttachmentBatch.AttachmentBatchID);
              finally
                FreeAndNil(AttachmentBatch);
              end;
              // Next header record
              AHeaderQuery.Next;
            end;
        finally
          FreeAndNil(AElemQuery);
        end;
      finally
        FreeAndNil(AHeaderQuery);
      end;
    end;
end;

procedure TWFAttachments.ClearBatch;
var
  I: Integer;
  ACommand: TFDCommand;
begin
  if Assigned(FBatchIDList) and (FBatchIDList.Count > 0) then
    begin
      ACommand := TFDCommand.Create(nil);
      try
        ACommand.Connection := FConnection;
        for I := 0 to FBatchIDList.Count - 1 do
          begin
            // Delete the physical file
            with TFDQuery.Create(nil) do
              try
                Connection := FConnection;
                SQL.Add('SELECT unc_file_name');
                SQL.Add('FROM email_attachment');
                SQL.Add(Format('WHERE batch_id = %.0f',
                  [FBatchIDList.Items[I]]));
                Open;
                while not Eof do
                  begin
                    SysUtils.DeleteFile(Fields[0].AsString);
                    Next;
                  end;
              finally
                Free;
              end;
            // Clear the batch records
            ACommand.CommandText.Text := Format(
              'DELETE FROM email_attachment WHERE batch_id = %.0f',
              [FBatchIDList.Items[I]]);
            ACommand.Execute;
          end;
      finally
        FreeAndNil(ACommand);
      end;
    end;
end;

function TWFAttachments.CreatAttachmentFile(const AWFHeaderID,
  AWFElementID: Real; const AFileName: string): Boolean;
begin
  // provided by descendent class
  Result := FALSE;
end;

{$ENDREGION 'TWFAttachments'}

{$REGION 'TWFAttachments_ProjectManager'}

{ TWFAttachments_ProjectManager }

procedure TWFAttachments_ProjectManager.AssignDefaults;
begin
  inherited;
  // Overwrite the header table name with the view
  HeaderTableName := 'V_WF_HEADER_PROJECT';
  // The IQSYS field name that holds the Crystal report
  ReportNameField := 'TL_PRJ_REPORT';
  // For the sake of speed, assign the name of the Crystal report
  // to this variable.
  // Note: We're using the project report for this.
  // Although, it is possible to use 2 other reports, which
  // can be obtained with 'TL_RFQ_REPORT' and 'TL_WO_REPORT',
  // if desired.
  FReportName := GetReportName;
end;

function TWFAttachments_ProjectManager.CreatAttachmentFile(const AWFHeaderID,
  AWFElementID: Real; const AFileName: string): Boolean;
var
  ASelectionCriteria: TStringList;
  AToolRfqID: Real;
begin
  // Description:  This method saves the Crystal report as a PDF
  // file.  We obtain the report name, create the selection criteria,
  // and then call the base class method to save the report as a PDF.
  // We return a function result of true, if a file was created.

  // Initialization
  Result := FALSE;

  // Get the project ID (TOOL_RFQ.ID).  This is what we use to
  // filter the Crystal report.
  if AWFHeaderID > 0 then
    begin
      // Get the TOOL_RFQ.ID.  Note that the SQL hard-links the
      // ID to the work flow to ensure the Project exists.
      with TFDQuery.Create(nil) do
        try
          Connection := FConnection;
          SQL.Add('SELECT a.tool_rfq_id');
          SQL.Add('  FROM wf_header a, tool_rfq b');
          SQL.Add(Format(' WHERE a.id = %.0f AND',[AWFHeaderID]));
          SQL.Add('       b.id = a.tool_rfq_id');
          Open;
          AToolRfqID := Fields[0].AsFloat;
        finally
          Free;
        end;

      // If we have an ID value and a report name, then
      // save the report as a PDF.
      if (AToolRfqID > 0) and (FReportName > '') then
        begin
          // The "selection criteria" is used to filter the Crystal report.
          ASelectionCriteria := TStringList.Create;
          try
            // Populate the "selection criteria" with the parent ID
            ASelectionCriteria.Add(Format('{V_TOOL_RFQ.ID}=%.0f',
              [AToolRfqID]));
            // Export as a PDF.  This method is located in the base
            // class (in qc_eval_share.pas).  A .PDF file name is returned.
            // Note:  the file should be deleted when the process is complete.
            Result := CreateReportAsPDF(FReportName, ASelectionCriteria,
              AFileName);
          finally
            ASelectionCriteria.Free;
          end;
        end;
    end;
end;

{$ENDREGION 'TWFAttachments_ProjectManager'}

end.

