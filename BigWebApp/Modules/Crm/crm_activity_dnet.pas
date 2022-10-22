unit crm_activity_dnet;

interface

uses
  Vcl.Forms,
  System.Classes,
  System.SysUtils,
  Vcl.Controls,
  crm_types,
  crm_rec,
  IQMS.Common.PrincipalSourceTypes;

procedure DoCRMActivityDNet(const ACRMActivityID: Real);

procedure DoShowOrPickCRMActivityDNet(const ACRMActivityID: Real;
  AType: TActivityType); overload;

function DoNewActivity(AType: TActivityType;
  APrincipalSource: TPrincipalSourceType; APrincipalSourceID: Real;
  AContactID: Real; var ANewID: Real): Boolean;

function DoNewActivityEx(AType: TActivityType; var ANewID: Real): Boolean;

// This method does nothing but create a new activity
function CreateNewActivity(ANewActivityRecord: TNewActivityRecord;
  var AResultValue: Real): Boolean;

function ProcessPickListNewCRMActivity(const AType: TActivityType;
  var ResultValue: Variant): TModalResult;

implementation

uses
//  crm_activity,
  crm_activity_dblib,
  crm_const,
  crm_context,
  crm_rscstr,
  crm_settings,
//  crmsuprt,
  dm_crmpk,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.PanelMsg;

procedure CheckOpenCRMMain;
// var
// AForm: TForm;
begin
  // 11/25/2013 Do not show the main CRM form for DCOM calls.
  // Requested by Jason for SmartPage:
  // EIQ-1625  CRM, do not show main crm form with jumping
  CheckContextObjectCreated;
  CheckCRMSettingsCreated;
  // AForm := iqctrl.FindFormByClassType(TFrmCRMMain);
  // if AForm = NIL then
  // crm_main.DoCRMMain;
end;

procedure DoCRMActivityDNet(const ACRMActivityID: Real);
// var
// AForm: TForm;
begin
  // 11/25/2013 Do not show the main CRM form for DCOM calls.
  // Requested by Jason for SmartPage:
  // EIQ-1625  CRM, do not show main crm form with jumping
  CheckOpenCRMMain;
  // 07/05/2012 Display the main screen only if it does not
  // already exist.
  // AForm := iqctrl.FindFormByClassType(TFrmCRMMain);
  // if AForm = NIL then
  // crm_main.DoCRMMain;
//  crm_activity.DoShowActivity(Application.MainForm, ACRMActivityID);

  { try
    DoDNETCOMJump( dllCRM, namespaceCRM, [ crm_const.CRM_ACTIVITY, Trunc(ACRMActivityID)] );
    except on E:Exception do // in case Cancel was clicked
    if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then raise;
    end; }
end;

procedure DoShowOrPickCRMActivityDNet(const ACRMActivityID: Real;
  AType: TActivityType);
var
  AID: Real;
  dm: TCRMPK_DM;
  AActivityFilter: TActivityFilter;
begin
  AID := SelectValueFmtAsInt64(
    'SELECT id FROM crm_activity WHERE id = %.0f', [ACRMActivityID]);
  if (AID = 0) then
    begin
      dm := TCRMPK_DM.Create(NIL);
      try
        ClearActivityFilter(AActivityFilter);
        AActivityFilter.ActivityType := AType; // declared in crm_types.pas
        AActivityFilter.ClosedType := rsEither;
        if not dm.SelectActivity(AActivityFilter, AID) then
          Exit;
      finally
        FreeAndNil(dm);
      end;
    end;

  if (AID > 0) then
    DoCRMActivityDNet(AID);

end;

function DoNewActivity(AType: TActivityType;
  APrincipalSource: TPrincipalSourceType; APrincipalSourceID: Real;
  AContactID: Real; var ANewID: Real): Boolean;
var
  ANewActivityRecord: TNewActivityRecord; // declared in crm_rec.pas
  ADate: TDateTime;
begin
  Result := False;
  InitActivityRec(ANewActivityRecord); // in crm_rec.pas
  // 05/22/2012 Remmed this.  Instead, pass current date/time.
  // Don't round it, don't make it pretty, don't help.
  // Just present the current date/time.  Requested by Tina.
  // ADate := Trunc(IQOracleAdjustedDate) + IQMS.Common.Dates.TIME_800;
  ADate := IQMS.Common.Dates.IQOracleAdjustedDateTime;
  // IQMS.Common.Dates.RoundDateTime15(IQMS.Common.Dates.IQOracleAdjustedDateTime, ADate);
  ANewActivityRecord.ActivityType := AType;
  ANewActivityRecord.AllDay := False;
  ANewActivityRecord.AssignedTo := SecurityManager.UserName;
  ANewActivityRecord.CampaignID := 0;
  ANewActivityRecord.ContactID := AContactID;
  // 05/22/2012 Instead of 30 minutes, add one hour.  Requested by Tina.
  ANewActivityRecord.EndDate := ADate + IQMS.Common.Dates.TIME_OneHour;
  ANewActivityRecord.SetAlarm := False;
  ANewActivityRecord.Source := CRMContext.TableName(APrincipalSource);
  ANewActivityRecord.SourceID := APrincipalSourceID;
  ANewActivityRecord.StartDate := ADate;
  ANewActivityRecord.WarrantyID := 0;
  Result := CreateNewActivity(ANewActivityRecord, ANewID);
  if Result then
    DoCRMActivityDNet(ANewID);
end;

function DoNewActivityEx(AType: TActivityType; var ANewID: Real): Boolean;
begin
  Result := DoNewActivity(AType,
    srctNone, // Principal Source
    0, // Principal SourceID
    0, // Contact ID
    ANewID);
end;

function CreateNewActivity(ANewActivityRecord: TNewActivityRecord;
  var AResultValue: Real): Boolean;
var
  ASQL: String;
  ASourceTable: String;
  APrincipalDisplay: String;
  ASourceType: TPrincipalSourceType;
begin
  Result := False; // initial result
  AResultValue := 0;

  // 'Cannot add or edit CRM activities.'
  if not ValidateCurrentUser(crm_rscstr.cTXT0001304) then
    System.SysUtils.Abort;

  CheckContextObjectCreated; // crm_context

  // 05/24/2007 We only update the principle data, if a valid principle source
  // is provided.
  if (ANewActivityRecord.Source = '') and
    (CRMContext.GlobalContext.SourceTable > '') and
    (CRMContext.GlobalContext.SourceID > 0) then
    begin
      ANewActivityRecord.Source := CRMContext.GlobalContext.SourceTable;
      ANewActivityRecord.SourceID := CRMContext.GlobalContext.SourceID;
      ANewActivityRecord.ContactID := CRMContext.GlobalContext.ContactID;
    end;

  // 09/08/2006 Make sure we have an ASSIGNEDTO user
  if ANewActivityRecord.AssignedTo = '' then
    ANewActivityRecord.AssignedTo := SecurityManager.UserName;

  AResultValue := GetNextID('CRM_ACTIVITY');
  ASourceType := CRMContext.SourceType(ANewActivityRecord.Source);

  // add the activity record
  crm_activity_dblib.CreateActivity(AResultValue,
    ANewActivityRecord.ActivityType,
    ASourceType,
    ANewActivityRecord.SourceID,
    ANewActivityRecord.ContactID,
    ANewActivityRecord.StartDate,
    ANewActivityRecord.EndDate,
    ANewActivityRecord.AllDay,
    ANewActivityRecord.Subject);

  if ANewActivityRecord.AssignedTo <> SecurityManager.UserName then
    ExecuteCommandParam(
      'update crm_activity set assignedto = :ASSIGNEDTO ' +
      'where id = :ID', ['ASSIGNEDTO', 'ID;F'],
      [ANewActivityRecord.AssignedTo, AResultValue]);

  if ANewActivityRecord.SetAlarm then
    ExecuteCommandFmt('update crm_activity set setalarm = ''Y'' ' +
      'where id = %.0f', [AResultValue]);

  crm_activity_dblib.DBSetNotification(AResultValue);
  crm_activity_dblib.DBUpdatePrincipleDisplay(AResultValue);

  if ANewActivityRecord.CampaignID > 0 then
    ExecuteCommandFmt(
      'update crm_activity set campaign_id = %.0f where id = %.0f',
      [ANewActivityRecord.CampaignID, AResultValue]);

  if ANewActivityRecord.WarrantyID > 0 then
    ExecuteCommandFmt(
      'update crm_activity set crm_warranty_id = %.0f where id = %.0f',
      [ANewActivityRecord.WarrantyID, AResultValue]);

  if ANewActivityRecord.OpportunityID > 0 then
    ExecuteCommandFmt(
      'update crm_activity set crm_opportunity_id = %.0f where id = %.0f',
      [ANewActivityRecord.OpportunityID, AResultValue]);

  if ANewActivityRecord.OrderDetailID > 0 then
    ExecuteCommandFmt(
      'update crm_activity set order_dtl_id = %.0f where id = %.0f',
      [ANewActivityRecord.OrderDetailID, AResultValue]);

  if ANewActivityRecord.CRMQuoteID > 0 then
    ExecuteCommandFmt(
      'update crm_activity set crm_quote_id = %.0f where id = %.0f',
      [ANewActivityRecord.CRMQuoteID, AResultValue]);

  Result := True;
end;

function ProcessPickListNewCRMActivity(const AType: TActivityType;
  var ResultValue: Variant): TModalResult;
var
  ANewID: Real;
begin
  // Initialization
  ANewID := 0;
  ResultValue := 0;

  // Always returne OK because there are no prompts; we create it, and show it.
  Result := mrOk;

  if AType = atSupport then
    // Create the support issue
//    crmsuprt.DoNewCRMSupportFor(Application.MainForm,
//      CRMContext.GlobalContext.SourceTable, CRMContext.GlobalContext.SourceID,
//      CRMContext.GlobalContext.ContactID)
  else
    // Create the new activity
    DoNewActivity(AType, CRMContext.GlobalContext.Source,
      CRMContext.GlobalContext.SourceID, CRMContext.GlobalContext.ContactID,
      ANewID);

  ResultValue := ANewID;
end;

end.
