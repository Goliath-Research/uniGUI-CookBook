unit Tlshr;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.HyperLinkDialog,
  IQMS.Common.JumpConstants,
  iqtool_rscstr,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  UniGUIApplication,
  MainModule;

{ Global methods }
function GetNextTaskSeq(AToolRFQ_ID: Real): Real;

{ OutlineNumber parsing routines }
function GetNextOutlineNumberSuffix(AParentOutlineNumber: string;
  AOutlineLevel: Integer): string;
function GetParentOutlineNumber(AParentOutlineNumber: string;
  AOutlineLevel: Integer): string;
function IncOutlineNumber(AOutlineNumber: string; AOutlineLevel: Integer;
  Value: Integer): string;

function PredictOutlineLevel(AOutlineNumber: string): Integer;

//Error related conditions.
//Sequences are duplicated
function HasBadSequences(AToolRFQ_ID: Real): Boolean;
function FixEmptyTasks(AToolRFQ_ID: Real): Boolean;
procedure ReOutline(AToolRFQ_ID: Real);
procedure ReOutlineTemplate(ATemplateHeaderID: Real);
procedure ReSequence(AToolRFQ_ID: Real; AStartTaskID: Real = 0);
procedure ReSequenceTemplate(ATemplateHeaderID: Real; AStartTaskID: Real = 0);
procedure UpdateTaskParents(AToolRfqID: Real);

{ For TOOL_TASK_INFORMATION }
procedure DeleteSubTasks(AToolTaskInformationID: Real);
{ For TOOL_TASK_TEMPLATE }
procedure DeleteSubTasksTemplate(AToolTaskTemplateID: Real);

function HasActualValues(AToolTaskInformationID: Real): Boolean;
function HasActivityValues(AToolTaskInformationID: Real): Boolean;
procedure ClearActualValues(AToolTaskInformationID: Real);

function ValidDate(ADateTime: TDateTime): Boolean;

{ Create a Sales Order }
function LinkOE(AToolRFQ_ID, AArcustoID: Real): Boolean;

{ Microsoft Project98 }
procedure CascadeDelete(ATable: string; AMasterIDField: string;
  AMasterVal: Real);
function DeleteToolingProject(AToolRFQ_ID: Real): Boolean;

{ Filtering and EPlant }
{ Assigns S as filter on top of EPlant filter }
procedure ToolingAssignFilter(ADataSet: TDataSet; S: string; AActive: Boolean);
{ Removes filter, but keeps eplant filter }
procedure ToolingRemoveFilter(ADataSet: TDataSet; AActive: Boolean);
{ Archived filtering, Open or Closed }
procedure SetStatusFilter(AFilter: string);
function GetStatusFilter: string;
procedure SetPK_HIDEFilter(ADataSet: TDataSet; AFiltered: Boolean = TRUE;
  ARefresh: Boolean = FALSE);
procedure SetCRMProspectFilter(ADataSet: TDataSet);

{ Hyperlinks }
procedure OpenHyperlink(ATable: TDataSet);
procedure RenameHyperlink(ATable: TDataSet);
procedure EditHyperlink(ATable: TDataSet);
procedure RemoveHyperlink(ATable: TDataSet);

{ Inventory }
function GetStandardCost(Arinvt_ID: Real): Real;

{ Templates }
procedure ProcessAcceptTemplate(AToolRFQ_ID, AToolTemplateID: Real);

{ Appends all tasks from TOOL_TASK_INFORMATION for a particular project to an existing template }
function CopyToolTaskInformationToTemplate(AToolRFQ_ID, AToolTemplateID
  : Real): Boolean;
{ Appends one task, with subtasks, from TOOL_TASK_INFORMATION to an existing template }
function CopyToolTaskToTemplate(AToolTaskInformation_ID, AToolTemplateID
  : Real): Boolean;
{ Creates a new Template and appends tasks from a tooling project.
  Returns the new template ID.
 iqtool_rscstr.cTXT0000219 = 'New Template' }
function CreateTemplateFromProject(AToolRFQ_ID: Real; var ATemplateID: Real;
  ATemplateName: string): Boolean;

function PromptConvertIfProspect(const AArcustoID: Real): Boolean;

procedure AddPredecessor(const AToolTaskInfoID: Real;
  const APredecessorID: Real);

var
  { Global variables }
  cToolTaskInfoID: Real; { Used for copy and paste of tasks }

implementation

uses
  IQMS.Common.Dates,
  IQMS.Common.ErrorDialog,
  IQMS.Common.InputQuery,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Registry,
  IQMS.Common.StringUtils,
{ TODO -oGPatil -cWebConvert : Dependency on Files
  msapps,
  oe_share,
  tl_convprospect_dlg,  }
  IQMS.Common.PanelMsg,
  tl_settings;

function GetNextTaskSeq(AToolRFQ_ID: Real): Real;
var
  ARfqID: Real;
begin
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT MAX(seq) FROM tool_task_information');
      SQL.Add(IQFormat(' WHERE tool_rfq_id = %.0f ORDER BY seq',
        [AToolRFQ_ID]));
      Open;
      Result := Fields[0].AsFloat + 1;
    finally
      Free; //free TFDQuery
    end;
end;

function GetNextOutlineNumberSuffix(AParentOutlineNumber: string;
  AOutlineLevel: Integer): string;
var
  i, z: Integer;
  S: string;

begin
  try
    for i := 1 to AOutlineLevel - 1 do
    begin
      S := S + GetToken(AParentOutlineNumber, '.', i);
    end;
    z := StrToInt(GetToken(AParentOutlineNumber, '.', AOutlineLevel));
    Inc(z, 1);
  finally
    Result := S + '.' + IntToStr(z);
  end;
end;

function IncOutlineNumber(AOutlineNumber: string; AOutlineLevel: Integer;
  Value: Integer): string;
var
  AVal: Integer;
  S: string;
begin
  { Increments outline number
    Example:
   1.2.3 would become 1.2.4
   Used for promoting or demoting.  You can supply a negative to decrement.
  }
  try
    if AOutlineLevel > 1 then
    begin
      { Return only the requested level. }
      S := Trim(GetToken(AOutlineNumber, '.', AOutlineLevel));
      if S < ' ' then
        S := '0';
      AVal := StrToInt(S);
      AVal := (AVal + Value);
      S := GetParentOutlineNumber(AOutlineNumber, AOutlineLevel);
      Result := S + '.' + IntToStr(AVal);
    end
    else
    begin
      { Since we are only looking at a level 1 here, we should only
        return the level 1 portion of the outline number. }
      S := Trim(GetToken(AOutlineNumber, '.', 1));
      if S < ' ' then
        S := '0';

      AVal := StrToInt(S);
      Result := IntToStr(AVal + Value);
    end;
  except
    on Exception do
      raise Exception.Create('Outline Number (' + AOutlineNumber +
        ') and Outline Level (' + IntToStr(AOutlineLevel) + ') do not match.');
  end;

end;

function GetParentOutlineNumber(AParentOutlineNumber: string;
  AOutlineLevel: Integer): string;
var
  i, z: Integer;
  S: string;

begin
  {
   In  : 2.3.4
   Out : 2.3
  }
  try
    for i := 1 to AOutlineLevel - 1 do
    begin
      S := S + IQMS.Common.StringUtils.GetToken(AParentOutlineNumber, '.', i) + '.';
    end;
    if RightStr(S, 1) = '.' then
      S := LeftStr(S, Length(S) - 1);
  finally
    Result := S;
  end;
end;

procedure DeleteSubTasks(AToolTaskInformationID: Real);
var
  A: Variant;
  AToolRFQ_ID: Real;
  AOutlineNo: string;
  AOutlineLev: Integer;

  APOut: string;

begin
  try
    A := SelectValueArrayFmt('SELECT outlinenumber, outlinelevel, ' +
      'tool_rfq_id FROM tool_task_information WHERE id = %.0f',
      [AToolTaskInformationID]);
    AOutlineNo := A[0];
    AOutlineLev := A[1];
    AToolRFQ_ID := A[2];

    APOut := AOutlineNo + '.';
    Application.ProcessMessages;

    ExecuteCommandFmt('DELETE FROM tool_task_information  ' +
      'WHERE SUBSTR(outlinenumber, 0, %d) = ''%s''  ' +
      'AND tool_rfq_id = %.0f ', [Length(APOut), APOut, AToolRFQ_ID]);
    Application.ProcessMessages;

  except
    on E: Exception do
      raise Exception.CreateFmt('Encountered error while attempting to ' +
        'delete subtasks [DeleteSubTasks()]:'#13#13'%s', [E.Message]);
  end;
end;

procedure DeleteSubTasksTemplate(AToolTaskTemplateID: Real);
var
  A: Variant;
  AToolTemplateHeaderID: Real;
  AOutlineNo: string;
  AOutlineLev: Integer;

  APOut: string;
begin
  A := SelectValueArrayFmt('SELECT outlinenumber, outlinelevel, ' +
    'tool_template_header_id FROM tool_task_template WHERE id = %.0f',
    [AToolTaskTemplateID]);
  AOutlineNo := A[0];
  AOutlineLev := A[1];
  AToolTemplateHeaderID := A[2];

  APOut := AOutlineNo + '.';

  ExecuteCommandFmt('DELETE FROM tool_task_template                ' +
    'WHERE SUBSTR(outlinenumber, 0, %d) = ''%s''    ' +
    'AND tool_template_header_id = %.0f                             ',
    [Length(APOut), APOut, AToolTemplateHeaderID]);
end;

function PredictOutlineLevel(AOutlineNumber: string): Integer;
begin
  //Returns what ought to be the outline level for this outline number
  Result := NumToken(AOutlineNumber, '.');
end;

function HasActualValues(AToolTaskInformationID: Real): Boolean;
var
  ACnt: Integer;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1 FROM tool_task_information'#13 +
    'WHERE (NVL(act_qty, 0) > 0 OR NVL(act_dollar, 0) > 0) AND'#13 +
    ' id = %.0f',
    [AToolTaskInformationID]) > 0;
end;

function HasActivityValues(AToolTaskInformationID: Real): Boolean;
var
  ACnt: Integer;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1 FROM tool_task_information'#13 +
    'WHERE (NVL(act_qty, 0) > 0 OR NVL(std_qty, 0) > 0 OR'#13 +
    '    NVL(act_dollar, 0) > 0 OR NVL(std_dollar, 0) > 0) AND'#13 +
    '   id = %.0f ',
    [AToolTaskInformationID]) > 0;
end;

procedure ClearActualValues(AToolTaskInformationID: Real);
begin
  ExecuteCommandFmt('BEGIN iqms.project.clear_actuals(%.0f); END;',
    [AToolTaskInformationID]);
end;

function ValidDate(ADateTime: TDateTime): Boolean;
var
  cValidDate: array [256 .. 65535] of Word;
begin
  Result := (Trunc(ADateTime) >= low(cValidDate)) and
    (Trunc(ADateTime) <= high(cValidDate));
end;

function LinkOE(AToolRFQ_ID, AArcustoID: Real): Boolean;
var
  AProjectPrice: Real;
  A: Variant;
  AProject: string;
  AArcusto_ID: Real;
  AContactID: Real;
  ACustPO: string;
  AOrdersID: Real;
begin
  AProjectPrice := SelectValueFmtAsFloat(
    'SELECT iqms.project.get_project_price(%.0f) AS price FROM dual',
    [AToolRFQ_ID]);

  //Prompt user if project price is zero.
  { 'The project price is 0.00.  Do you wish to create a sales order anyway?' }
  if (AProjectPrice = 0) and not IQConfirmYN(iqtool_rscstr.cTXT0000198) then
    Exit;

  //Create the order
  AOrdersID := GetNextID('ORDERS');
  ExecuteCommandFmt('BEGIN iqms.project.add_order(%.0f, %.0f); END;',
    [AToolRFQ_ID, AOrdersID]);
{ TODO -oGPatil -cWebConvert : Dependency on oe_share.pas file
  PopupSOInfo(AArcustoID); //in oe_share.pas    }

  try
    PostMessage(Application.MainForm.Handle, //Main Window Handle
      iq_JumpToSalesOrder, //Message ID, declared in IQMS.Common.JumpConstants.pas
      Trunc(AOrdersID), 0); //ID
  except
    on E: Exception do //in case Cancel was clicked
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        raise;
  end;
end;

procedure CascadeDelete(ATable: string; AMasterIDField: string;
  AMasterVal: Real);
begin
  try
    ExecuteCommandFmt('DELETE FROM %s WHERE %s = %.0f', [ATable, AMasterIDField,
      AMasterVal]);
  except
    on Exception do
    begin
      { iqtool_rscstr.cTXT0000227 =
        'Attempt to delete dependent records for (%s) failed for value %.0f'; }
      raise Exception.CreateFmt(iqtool_rscstr.cTXT0000227,
        [ATable, AMasterVal]);
      System.SysUtils.ABORT;
    end;
  end;
end;

function DeleteToolingProject(AToolRFQ_ID: Real): Boolean;
begin
  Result := FALSE; { initialize }
  { First, we need to remove the labor references from emp_labor }
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add(IQFormat
        ('SELECT id FROM tool_task_information WHERE tool_rfq_id = %.0f',
        [AToolRFQ_ID]));
      First;
      while not EOF do
      begin
        ExecuteCommandFmt('DELETE FROm emp_labor ' +
          'WHERE source = ''TOOL_TASK_INFORMATION'' AND source_id = %.0f',
          [Fields[0].AsFloat]);
        Next;
      end;
    finally
      Free; //free TFDQuery
    end;
  { Now, delete task records }
  CascadeDelete('TOOL_TASK_INFORMATION', 'TOOL_RFQ_ID', AToolRFQ_ID); { local }
  { Finally, delete main record }
  ExecuteCommandFmt('DELETE FROM tool_rfq WHERE id = %.0f', [AToolRFQ_ID]);
  Result := TRUE;
end;

procedure ToolingAssignFilter(ADataSet: TDataSet; S: string; AActive: Boolean);
{ Assigns S as filter on top of EPlant filter }
begin
  with ADataSet do
    try
      ADataSet.DisableControls;
      //Close;
      { Assign EPlant Filter }
      Filter := '';
      IQAssignEPlantFilter(ADataSet);
      { We are adding a filter }
      if Trim(S) > ' ' then
      begin
        if Filter > ' ' then
          Filter := Filter + ' AND ' + S
        else
          Filter := S;
      end;

      if ADataSet.Filter > ' ' then
        Filtered := TRUE;
    finally
      ADataSet.EnableControls;
    end;
end;

procedure ToolingRemoveFilter(ADataSet: TDataSet; AActive: Boolean);
{ Removes filter, but keeps eplant filter }
begin
  with ADataSet do
    try
      ADataSet.DisableControls;
      Close;
      Filter := '';
      Filtered := FALSE;
      { Assign EPlant Filter }
      IQAssignEPlantFilter(ADataSet);

      { Open only if passing method wants it open }
      if AActive then
        Open;
    finally
      ADataSet.EnableControls;
    end;
end;

procedure OpenHyperlink(ATable: TDataSet);
begin
  with ATable do
  begin
    { If there is nothing visual then Exit }
    if Trim(FieldByName('HYPERLINK').AsString) < ' ' then
      Exit;
    { If we have visual, but no substance, then raise friendly error }
    if Trim(FieldByName('HYPERLINKADDRESS').AsString) < ' ' then
    begin
      { Friendly exception }
      { iqtool_rscstr.cTXT0000225 =
        'The link has either been broken or no longer exists.
       Please verify the link and try again.' }
      IQError(iqtool_rscstr.cTXT0000225);
      Exit;
    end
    else
    begin
(* TODO -oGPatil -cWebConvert : Dependency on MSApps.pas file
      ExecuteApplication(Trim(FieldByName('HYPERLINKADDRESS').AsString),
        { File name }
        PChar(Trim(FieldByName('HYPERLINKSUBADDRESS').AsString))
        { Parameters }
        ); { MSApps.pas }    *)
    end;
  end;
end;

procedure RenameHyperlink(ATable: TDataSet);
var
  S: string;
begin
  with ATable do
  begin
    S := FieldByName('HYPERLINK').AsString;
    { iqtool_rscstr.cTXT0000223 = 'Rename Hyperlink';
      iqtool_rscstr.cTXT0000224 = 'Enter new name:'; }
    if IQMS.Common.InputQuery.IQInputQuery(iqtool_rscstr.cTXT0000223,
      iqtool_rscstr.cTXT0000224, S) then
    begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('HYPERLINK').AsString := S;
    end;
  end;
end;

procedure EditHyperlink(ATable: TDataSet);
var
  S: string;
begin
  with TIQWebHyperDlg.Create(UniGUIApplication.UniApplication) do
    try
      with ATable do
      begin
        { Initial values when dlg opens }
        HyperLinkAddress := FieldByName('HYPERLINKADDRESS').AsString;
        HyperLinkSubAddress := FieldByName('HYPERLINKSUBADDRESS').AsString;

        if Execute then
        begin
          { Put dataset in edit mode }
          if not (State in [dsInsert, dsEdit]) then
            Edit;
          { Get the values from the dlg }
          FieldByName('HYPERLINKADDRESS').AsString := HyperLinkAddress;
          FieldByName('HYPERLINKSUBADDRESS').AsString :=
            HyperLinkSubAddress;
          { Modify the display name for the hyperlink only if it is empty }
          if Trim(FieldByName('HYPERLINK').AsString) < ' ' then
            FieldByName('HYPERLINK').AsString := HyperLinkAddress;
        end;
      end;
    finally
      Free;
    end;
end;

procedure RemoveHyperlink(ATable: TDataSet);
begin
  //iqtool_rscstr.cTXT0000228 = 'Are you sure you want to remove the link?'
  if IQConfirmYN(iqtool_rscstr.cTXT0000228) then
    with ATable do
    begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('HYPERLINKADDRESS').Clear;
      FieldByName('HYPERLINKSUBADDRESS').Clear;
      FieldByName('HYPERLINK').Clear;
    end;
end;

function GetStandardCost(Arinvt_ID: Real): Real;
begin
  Result := 0; { initialize }
  Result := SelectValueFmtAsFloat(
    'SELECT NVL(std_cost, 0) FROM arinvt WHERE id = %.0f',
    [Arinvt_ID]);
end;

procedure ProcessAcceptTemplate(AToolRFQ_ID, AToolTemplateID: Real);
begin
  ExecuteCommandFmt(
    'BEGIN'#13 +
    '   iqms.project_template.append_from_template(%.0f, %.0f);'#13 +
    'END;',
    [AToolRFQ_ID, AToolTemplateID]);
end;

function CopyToolTaskInformationToTemplate(AToolRFQ_ID, AToolTemplateID
  : Real): Boolean;
var
  ANewTaskID: Real;
  AQuery: TFDQuery;
  ACurTaskID: Real;
  AOutlineNumber: string;
  ANextSeq: Real;
begin
  Result := FALSE;
  { Appends all the tasks for a project to a particular template }
  if (AToolRFQ_ID = 0) or (AToolTemplateID = 0) then
    Exit;

  ExecuteCommandFmt(
    'BEGIN'#13 +
    '   iqms.project_template.append_tree_to_template(%.0f, %.0f);'#13 +
    'END;',
    [AToolRFQ_ID, AToolTemplateID]);
  Result := TRUE;
end;

function CopyToolTaskToTemplate(AToolTaskInformation_ID, AToolTemplateID
  : Real): Boolean;
var
  ANewTaskID: Real;
  AQuery: TFDQuery;
  ACurTaskID: Real;
  AOutlineNumber: string;
  ANextSeq: Real;
begin
  Result := FALSE;

  { Appends all the tasks for a project to a particular template }
  if (AToolTaskInformation_ID = 0) or (AToolTemplateID = 0) then
    Exit;

  ExecuteCommandFmt(
    'BEGIN'#13 +
    '   iqms.project_template.append_task_to_template(%.0f, %.0f); '#13 +
    'END;',
    [AToolTaskInformation_ID, AToolTemplateID]);

  Result := TRUE;
end;

function CreateTemplateFromProject(AToolRFQ_ID: Real; var ATemplateID: Real;
  ATemplateName: string): Boolean;
var
  hMsg: TPanelMesg;
begin
  try
    //Initialize
    hMsg := nil;
    { iqtool_rscstr.cTXT0000226 =
      'Saving Project as new Tooling Template.  Please wait.' }
    hMsg := hPleaseWait(iqtool_rscstr.cTXT0000226);
    Result := FALSE;

    { Create the new Template header }
    ATemplateID := GetNextID('TOOL_TEMPLATE_HEADER');

    ExecuteCommandFmt(
      'BEGIN'#13 +
      '   iqms.project_template.create_template_from_project(' +
      '%.0f, %.0f, ''%s'');'#13 +
      'END;',
      [AToolRFQ_ID, ATemplateID, ATemplateName]);

    //Pass the result
    Result := TRUE;

  finally
    if (hMsg <> nil) and Assigned(hMsg) then
      hMsg.Free;
  end;

end;

procedure SetStatusFilter(AFilter: string);
var
  AFormPath, AKey: string;
begin
  AKey := 'ScalarValue';
  AFormPath :=
    '\Software\IQMS\IQWin32\IQWin32.exe\FrmToolingMain\TOOLING_FILTER';
  SaveStrToCurrentUserRegistry(AFormPath, AKey, AFilter); { IQMS.Common.Registry.pas }
end;

function GetStatusFilter: string;
var
  AFormPath, AKey: string;
begin
  Result := ''; { Initialize }
  AKey := 'ScalarValue';
  AFormPath :=
    '\Software\IQMS\IQWin32\IQWin32.exe\FrmToolingMain\TOOLING_FILTER';
  Result := UpperCase(Trim(LoadStrFromCurrentUserRegistry(AFormPath, AKey)));
  { IQMS.Common.Registry.pas }
end;

function HasBadSequences(AToolRFQ_ID: Real): Boolean;
begin
  //Returns TRUE if there are values for SEQ that are duplicated among
  //the tasks for the Tooling project.
  Result := IsFoundFmt('SELECT DISTINCT MIN(seq) AS seq, COUNT(seq) AS dups  ' +
    'FROM tool_task_information  WHERE tool_rfq_id = %.0f ' +
    'GROUP BY seq  HAVING COUNT(seq) > 1 ', [AToolRFQ_ID]);
end;

function FixEmptyTasks(AToolRFQ_ID: Real): Boolean;
begin
  //If the name of the task is empty, it is replaced with ?????
  Result := IsFoundFmt('SELECT id FROM tool_task_information ' +
    'WHERE tool_rfq_id = %.0f AND TRIM(name) IS NULL ', [AToolRFQ_ID]);
  if Result = TRUE then
    ExecuteCommandFmt('UPDATE tool_task_information            ' +
      'SET name = ''?????''                    ' +
      'WHERE tool_rfq_id = %.0f AND TRIM(name) IS NULL', [AToolRFQ_ID]);
end;

procedure ReOutline(AToolRFQ_ID: Real);
begin
  ExecuteCommandFmt('BEGIN iqms.project.reoutline(%.0f); END;', [AToolRFQ_ID]);
end;

procedure ReOutlineTemplate(ATemplateHeaderID: Real);
begin
  ExecuteCommandFmt('BEGIN iqms.project_template.reoutline(%.0f); END;',
    [ATemplateHeaderID]);
end;

procedure ReSequence(AToolRFQ_ID: Real; AStartTaskID: Real = 0);
//if 0 then all tasks will be checked
begin
  ExecuteCommandFmt('BEGIN iqms.project.resequence(%.0f, %.0f); END;',
    [AToolRFQ_ID, AStartTaskID]);
end;

procedure ReSequenceTemplate(ATemplateHeaderID: Real; AStartTaskID: Real = 0);
begin
  ExecuteCommandFmt('BEGIN iqms.project_template.resequence(%.0f, %.0f); END;',
    [ATemplateHeaderID, AStartTaskID]);
end;

procedure UpdateTaskParents(AToolRfqID: Real);
begin
  ExecuteCommandFmt('BEGIN iqms.project_task.update_has_subtasks_yn(%.0f); END;',
    [AToolRfqID]);
end;

procedure SetPK_HIDEFilter(ADataSet: TDataSet; AFiltered: Boolean;
  ARefresh: Boolean);
begin
  with ADataSet do
    if FindField('PK_HIDE') <> nil then
    begin
      if AFiltered then
      begin
        if not Empty(Filter) then
          Filter := Format('(%s) AND (PK_HIDE IS NULL OR ' +
            'PK_HIDE <> ''Y'')', [Filter])
        else
          Filter := 'PK_HIDE IS NULL OR PK_HIDE <> ''Y''';
      end;
      Filtered := not Empty(Filter);
      if ARefresh then
        ReOpen(ADataSet);
    end;
end;

procedure SetCRMProspectFilter(ADataSet: TDataSet);
begin
  with ADataSet do
    if FindField('CRM_PROSPECT') <> nil then
    begin
      if not ToolingSettings.ShowCRMProspects then
      begin
        if not Empty(Filter) then
          Filter := Format('(%s) AND (CRM_PROSPECT IS NULL OR ' +
            'CRM_PROSPECT <> ''Y'')', [Filter])
        else
          Filter := 'CRM_PROSPECT IS NULL OR CRM_PROSPECT <> ''Y''';
      end;
      Filtered := not Empty(Filter);
    end;
end;

function PromptConvertIfProspect(const AArcustoID: Real): Boolean;
var
  AIsProspect: Boolean;
begin
  //Initialization
  Result := FALSE;
  AIsProspect := FALSE;

  if (AArcustoID = 0) then
    raise Exception.Create
      (iqtool_rscstr.cTXT0000128 { 'Customer not specified.' } );

  //Is this customer a CRM Prospect?  If so, convert; else, exit.
  AIsProspect := SelectValueFmtAsString('SELECT NVL(crm_prospect, ''N'') ' +
    'AS crm_prospect FROM arcusto WHERE id = %.0f', [AArcustoID]) = 'Y';

  if AIsProspect then
  begin
    //Check to see if the logged-in user has rights to convert

{ TODO -oGPatil -cWebConvert : Dependency on tl_convprospect_dlg file
    if PromptConvertCRMProspectForIQTool then //in tl_convprospect_dlg.pas
    begin
      ExecuteCommandFmt('UPDATE arcusto SET crm_prospect = ''N'', ' +
        'cust_since = TO_DATE(''%s'', ''MM/DD/RRRR HH24:MI'') ' +
        'WHERE id = %.0f', [FormatDateTime('mm/dd/yyyy hh:nn',
        IQOracleAdjustedDateTime), AArcustoID]);
      Result := TRUE;
    end
    else
      Exit; //Do not create Sales Order for prospects   }
  end
  else
    Result := TRUE; //customer is not a prospect; all clear

end;

procedure AddPredecessor(const AToolTaskInfoID: Real;
  const APredecessorID: Real);
var
  ANewID: Real;
begin
  if (AToolTaskInfoID = 0) or (APredecessorID = 0) then
    Exit;
  ANewID := GetNextID('TOOL_PREDECESSOR');
  ExecuteCommandFmt(
    'BEGIN'#13 +
    '   iqms.project_predecessor.add_predecessor(%.0f, %.0f, %.0f);'#13 +
    'END;',
    [ANewID, AToolTaskInfoID, APredecessorID]);
end;

end.
