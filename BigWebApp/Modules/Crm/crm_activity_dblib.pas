unit crm_activity_dblib;

{ NOTE:  This unit contains database actions on CRM_ACTIVITY.
  It contains no non-standard IQMS unit declarations.
  That is, there are no CRM unit calls, except for constants.
}

interface

// Limit "uses" declarations to basic Delphi and IQMS units.
uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  System.Variants,
  crm_types,
  Data.SqlExpr,
  crm_rscstr,
  IQMS.Common.PrincipalSource,
  IQMS.Common.PrincipalSourceTypes,
  FireDAC.Comp.DataSet,
  IQMS.Common.DataConst,
  FireDAC.Comp.Client,
  MainModule;

procedure CleanActivities;
procedure UpdateActivityTypeColors;

// Updates the CRM_ACTIVITY fields for principle source display, i.e., company, addr1, etc.
procedure DBUpdatePrincipleDisplay(ACRMActivityID: Real);
procedure ClearPrincipleFields(ACRMActivityID: Real);
// this should only be called
// when the user specifically chooses
// a different principle.
// Short and Long display functions
function GetEmployeeName(APrEmpID: Real): String; overload;
  deprecated 'Use GetEmployeeName instead';
function GetEmployeeName(AUserName: String): String; overload;
  deprecated 'Use GetEmployeeName instead';
function GetEmployeeID(AUserName: String): Real;
  deprecated 'Use GetEmployeeID instead';
function GetAssignedToDisplay(AAssignedTo, ASource: String;
  ASource_ID, AContactID: Real): String;
function GetEmployeeEMail(APrEmpID: Real): String; overload;
  deprecated 'Use GetEmployeeEMailAddress instead';
function GetEmployeeEMail(AUserName: String): String; overload;
  deprecated 'Use GetEmployeeEMailAddress instead';

function GetShortDisplayEx(ACRMActivityID: Real): String;

function GetSourceDisplay_ARINVT(const AID: Real): String;
function GetSourceDisplay_QINVT(const AID: Real): String;

procedure GetLongDisplayEx(const ACRMActivityID: Real; var AList: TStringList);
function GetEMail(ASourceTable: String; ASourceID: Real; AContactID: Real)
  : String; deprecated 'Use GetEmailAddress instead';

// Information about activities
function GetActivityTypeString(ACRMActivityID: Real): String;
function GetActivityTypeInt(ACRMActivityID: Real): Integer;
procedure GetActivityEventInfo(const ACRMActivityEventID: Real;
  var ACRMActivityID: Real;
  var AType: Integer);

procedure DBSetNotification(ACRMActivityID: Real);

// Information related to CRM Mail Merge
function GetCRMMergeDocRegardingString(ACRMWordDocID: Real; ASource: String;
  ASourceID, AContactID: Real): String;

// Support Issues
function GetOpenIssueCount(const ASource: String;
  const ASourceID, AContactID: Real): Integer;

function GetEPlantName(AEplantID: Real): String;

// This method ensures that the current user (running the application) is a
// registered user in the Security Inspector (table S_USER_GENERAL and PR_EMP).
function ValidateCurrentUser(AHeaderText: String = '';
  AShowError: Boolean = TRUE): Boolean;

procedure SetScheduleRequestStatus(ACRMActivityMembersID: Real;
  AStatus: TScheduleRequestStatus);
function HasPendingScheduleRequests: Boolean;

procedure CreateActivity(ANewID: Real;
  AType: TActivityType;
  ASource: TPrincipalSourceType;
  ASourceID: Real;
  AContactID: Real;
  AStartDate,
  AFinishDate: TDateTime;
  AAllDay: Boolean = TRUE;
  ASubject: String = '');

procedure FixActivityFinishDates;

// Is this activity visible under the current CRM Context filter
function ActivityVisibleInCRMContext(const ACRMActivityID: Real): Boolean;

procedure AddSupportEvent(const ASupportID: Real;
  ARegarding: string; AActivityLinkID: Real; out ANewEventID: Real);

procedure AddAssigmentChangeSupportEvent(const ASupportID: Real;
  const AOldAssignedTo, ANewAssignedTo: string; out ANewEventID: Real);

procedure CheckUniquePartnerNumber(const APartnerNo: string;
  const ACurrentPartnerID: Real);

type
  TLeadTimeUnit = (ltu0Minutes, ltu5Minutes, ltu10Minutes, ltu15Minutes,
    ltu30Minutes, ltu1Hour, ltu2Hours, ltu3Hours, ltu4Hours, ltu5Hours,
    ltu6Hours, ltu7Hours, ltu8Hours, ltu9Hours, ltu10Hours, ltu11Hours,
    ltuHalfDay, ltu18Hours, ltu1Day, ltu2Days, ltu3Days, ltu4Days, ltu1Week,
    ltu2Weeks);

const
  LeadTimeUnitName: array [TLeadTimeUnit] of string = (
    crm_rscstr.cTXT0001846, // '0 Minutes'
    crm_rscstr.cTXT0001847, // '5 Minutes'
    crm_rscstr.cTXT0001848, // '10 Minutes'
    crm_rscstr.cTXT0001849, // '15 Minutes'
    crm_rscstr.cTXT0001850, // '30 Minutes'
    crm_rscstr.cTXT0001851, // '1 Hour'
    crm_rscstr.cTXT0001852, // '2 Hours'
    crm_rscstr.cTXT0001853, // '3 Hours'
    crm_rscstr.cTXT0001854, // '4 Hours'
    crm_rscstr.cTXT0001855, // '5 Hours'
    crm_rscstr.cTXT0001856, // '6 Hours'
    crm_rscstr.cTXT0001857, // '7 Hours'
    crm_rscstr.cTXT0001858, // '8 Hours'
    crm_rscstr.cTXT0001859, // '9 Hours'
    crm_rscstr.cTXT0001860, // '10 Hours'
    crm_rscstr.cTXT0001861, // '11 Hours'
    crm_rscstr.cTXT0001862, // '0.5 Days'
    crm_rscstr.cTXT0001863, // '18 Hours'
    crm_rscstr.cTXT0001864, // '1 Day'
    crm_rscstr.cTXT0001865, // '2 Days'
    crm_rscstr.cTXT0001866, // '3 Days'
    crm_rscstr.cTXT0001867, // '4 Days'
    crm_rscstr.cTXT0001868, // '1 Week'
    crm_rscstr.cTXT0001869); // '2 Weeks'

function GetAlertDateTime(const AStartDate: TDateTime; const AAllDay: Boolean;
  ALeadTime: TLeadTimeUnit): TDateTime;

implementation

// NOTE:  DO NOT INCLUDE CRM-SPECIFIC IN THE USES CLAUSE.
// Doing so will hook the entire CRM project into IQWin32, SPC,
// and other projects.  The unit, crm, which is the entry point
// into CRM for most applications calls this unit.
uses
  crm_strings,
  IQMS.Common.Boolean,
  IQMS.Common.Dates,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Graphics,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils;

procedure CleanActivities;
begin
  // Called at startup
  with TFDStoredProc.Create(NIL) do
    try
      ConnectionName := cnstFDConnectionName; // IQMS.Common.DataConst;
      StoredProcName := 'IQMS.IQCRM.CLEAN_ACTIVITIES';
      Prepare;
      ExecProc;
    finally
      Free;
    end;
end;

procedure UpdateActivityTypeColors;
var
  AID, AColorF, R, G, B: Integer;
begin
  with TFDQuery.Create(NIL) do
    try
      ConnectionName := cnstFDConnectionName; // IQMS.Common.DataConst;
      SQL.Add('SELECT id, label_color, label_color_r AS r, label_color_g AS g,');
      SQL.Add('       label_color_b AS b');
      SQL.Add('  FROM crm_activity_type');
      SQL.Add(' WHERE label_color IS NOT NULL AND');
      SQL.Add('       (label_color_r IS NULL OR');
      SQL.Add('        label_color_b IS NULL OR');
      SQL.Add('        label_color_b IS NULL)');
      Open;
      while not EOF do
        begin
          AID := FieldByName('id').AsInteger;
          AColorF := FieldByName('label_color').AsInteger;
          if (AColorF > 0) then
            begin
              // Update the RGB values.
              IQMS.Common.Graphics.GetColorToRGB(AColorF, R, G, B);
              ExecuteCommandFmt(
                'UPDATE crm_activity_type'#13 +
                '   SET label_color_r = %d, label_color_g = %d, '#13 +
                '       label_color_b = %d'#13 +
                ' WHERE id = %d',
                [R, G, B, AID]);
            end;
          Next;
        end;
    finally
      Free;
    end;
end;

procedure DBUpdatePrincipleDisplay(ACRMActivityID: Real);
begin
  ExecuteCommandFmt(
    'begin iqms.iqcrm.update_principle_disp(%.0f); end;',
    [ACRMActivityID]);
end;

procedure ClearPrincipleFields(ACRMActivityID: Real);
begin
  ExecuteCommandFmt(
    'begin iqms.iqcrm.clear_principle_source_fields(%.0f); end;',
    [ACRMActivityID]);
end;

function GetShortDisplayEx(ACRMActivityID: Real): String;
begin
  with TFDQuery.Create(NIL) do
    try
      ConnectionName := cnstFDConnectionName; // IQMS.Common.DataConst;
      SQL.Add('select principle_source, principle_source_id, contact_id ');
      SQL.Add('from crm_activity ');
      SQL.Add(Format('where id = %.0f', [ACRMActivityID]));
      Open;
      Result := IQMS.Common.PrincipalSource.GetShortDisplay(
        FieldByName('PRINCIPLE_SOURCE').AsString,
        FieldByName('PRINCIPLE_SOURCE_ID').AsFloat,
        FieldByName('CONTACT_ID').AsFloat);
    finally
      Free;
    end;
end;

procedure GetLongDisplayEx(const ACRMActivityID: Real; var AList: TStringList);
// -------------------------------------------------------------------------
  procedure _ListAdd(ALabel, AText: String);
  begin
    if not IsEmpty(Trim(AText)) then
      begin
        if not IsEmpty(Trim(ALabel)) then
          AList.Add(Format('%s  %s', [ALabel, AText]))
        else
          AList.Add(AText);
      end;
  end;

// -------------------------------------------------------------------------
var
  AName, AFax, ACityStateZip: String;
  AStart, AEnd: Integer;
begin
  if not Assigned(AList) then
    Exit;

  with TFDQuery.Create(NIL) do
    try
      ConnectionName := cnstFDConnectionName; // IQMS.Common.DataConst;
      SQL.Add('select                          ');
      SQL.Add('     principle_first_name,      ');
      SQL.Add('     principle_last_name,       ');
      SQL.Add('     principle_title,           ');
      SQL.Add('     principle_contact_phone,   ');
      SQL.Add('     principle_contact_ext,     ');
      SQL.Add('     principle_contact_fax,     ');
      SQL.Add('     principle_contact_email,   ');
      SQL.Add('     principle_company,         ');
      SQL.Add('     principle_addr1,           ');
      SQL.Add('     principle_addr2,           ');
      SQL.Add('     principle_addr3,           ');
      SQL.Add('     principle_city,            ');
      SQL.Add('     principle_state,           ');
      SQL.Add('     principle_zip,             ');
      SQL.Add('     principle_company_phone,   ');
      SQL.Add('     principle_company_ext,     ');
      SQL.Add('     principle_company_fax,     ');
      SQL.Add('     principle_crm_prospect,    ');
      SQL.Add('     principle_pk_hide,         ');
      SQL.Add('     principle_source,          ');
      SQL.Add('     principle_source_id,       ');
      SQL.Add('     contact_id                 ');
      SQL.Add('from                            ');
      SQL.Add('     crm_activity               ');
      SQL.Add('where                           ');
      SQL.Add(IQFormat('     id=%.0f                    ',
        [ACRMActivityID]));
      Open;

      AName := FieldByName('principle_first_name').AsString + ' ' +
        FieldByName('principle_last_name').AsString;
      ACityStateZip := Format('%s, %s %s',
        [FieldByName('principle_city').AsString,
        FieldByName('principle_state').AsString,
        FieldByName('principle_zip').AsString]);

      // Add lines to the list
      AList := TStringList.Create;
      _ListAdd('', AName);
      _ListAdd('', FieldByName('principle_company').AsString);
      _ListAdd('', FieldByName('principle_addr1').AsString);
      _ListAdd('', FieldByName('principle_addr2').AsString);
      _ListAdd('', FieldByName('principle_addr3').AsString);
      _ListAdd('', ACityStateZip);

      _ListAdd(crm_rscstr.cTXT0000431 { 'Company Telephone:' } ,
        FieldByName('principle_company_phone').AsString);
      _ListAdd(crm_rscstr.cTXT0000432 { 'Company Extension:' } ,
        FieldByName('principle_company_ext').AsString);
      _ListAdd(crm_rscstr.cTXT0000433 { 'Company Fax:' } ,
        FieldByName('principle_company_fax').AsString);

      // 05/13/2008 (Requested by Nancy) Do not show personal information if
      // the source is an employee.
      if (FieldByName('principle_source').AsString <> 'PR_EMP') then
        begin
          _ListAdd(crm_rscstr.cTXT0000440 { 'Contact Title:' } ,
            FieldByName('principle_title').AsString);
          _ListAdd(crm_rscstr.cTXT0000435 { 'Contact Telephone:' } ,
            FieldByName('principle_contact_phone').AsString);
          _ListAdd(crm_rscstr.cTXT0000436 { 'Contact Extension:' } ,
            FieldByName('principle_contact_ext').AsString);
          _ListAdd(crm_rscstr.cTXT0000438 { 'Contact Fax:' } ,
            FieldByName('principle_contact_fax').AsString);
          _ListAdd(crm_rscstr.cTXT0000439 { 'Contact EMail:' } ,
            'mailto:' + FieldByName('principle_contact_email').AsString);
        end;

    finally
      Free;
    end;
end;

function GetEmployeeName(APrEmpID: Real): String;
begin
  Result := IQMS.Common.DataLib.GetEmployeeName(APrEmpID);
end;

function GetEmployeeName(AUserName: String): String;
begin
  Result := IQMS.Common.DataLib.GetEmployeeName(AUserName);
end;

function GetEmployeeID(AUserName: String): Real;
begin
  Result := IQMS.Common.DataLib.GetEmployeeID(AUserName);
end;

function GetAssignedToDisplay(AAssignedTo, ASource: String;
  ASource_ID, AContactID: Real): String;
begin
  // Simplifies what we display to the user in a calculated field for
  // the display
  if (ASource = '') and (AAssignedTo > '') then
    Result := AAssignedTo
  else
    Result := IQMS.Common.PrincipalSource.GetShortDisplay(ASource, ASource_ID, AContactID);
end;

function GetEmployeeEMail(APrEmpID: Real): String; overload;
begin
  Result := GetEmployeeEMailAddress(APrEmpID);
end;

function GetEmployeeEMail(AUserName: String): String; overload;
begin
  Result := GetEmployeeEMailAddress(AUserName);
end;

function GetEMail(ASourceTable: String; ASourceID: Real;
  AContactID: Real): String;
begin
  Result := GetEMailAddress(ASourceTable, ASourceID, AContactID);
end;

function GetActivityTypeInt(ACRMActivityID: Real): Integer;
begin
  // returns the number in the type field
  Result := Trunc(SelectValueFmtAsInteger(
    'select NVL(type, 0) from crm_activity where id = %.0f',
    [ACRMActivityID]));
end;

function GetActivityTypeString(ACRMActivityID: Real): String;
var
  i: Integer;
begin
  i := GetActivityTypeInt(ACRMActivityID);
  Result := crm_strings.GetTypeString(i);
end;

procedure GetActivityEventInfo(const ACRMActivityEventID: Real;
  var ACRMActivityID: Real;
  var AType: Integer);
var
  A: Variant;
begin
  // Initialization
  ACRMActivityID := 0;
  AType := 0;
  // Get data
  A := SelectValueArrayFmt(
    'SELECT crm_activity_id, NVL (type, 0) as type'#13 +
    '  FROM crm_activity_events'#13 +
    ' WHERE ID = %.0f',
    [ACRMActivityEventID]);
  // Populate var params
  if System.Variants.VarArrayDimCount(A) > 0 then
    begin
      ACRMActivityID := A[0];
      AType := A[1];
    end;
end;

procedure DBSetNotification(ACRMActivityID: Real);
begin
  // NOTE:  The CRM_ACTIVITY.SETALARM flag must be set to True;
  // otherwise, it will be deleted (if it exists).
  ExecuteCommandFmt(
    'BEGIN IQMS.IQCRM.SET_NOTIFY_ACTIVITY(%.0f); END;',
    [ACRMActivityID]);
end;

function GetCRMMergeDocRegardingString(ACRMWordDocID: Real; ASource: String;
  ASourceID, AContactID: Real): String;
var
  ATemp,
    AName,
    AFileName,
    ADescription: String;
  AID: Real;
  AList: TStringList;
begin
  // Returns the text that will be inserted in a CRM Note when a Mail Merge
  // document is printed.
  if ACRMWordDocID = 0 then
    Exit;

  with TFDQuery.Create(NIL) do
    try
      ConnectionName := cnstFDConnectionName; // IQMS.Common.DataConst;
      SQL.Add(IQFormat('select * from crm_word_doc where id = %.0f',
        [ACRMWordDocID]));
      Open;
      AName := FieldByName('NAME').AsString;
      AFileName := FieldByName('FILENAME').AsString;
      ADescription := FieldByName('DESCRIPTION').AsString;
    finally
      Free;
    end;

  AList := TStringList.Create;
  with AList do
    try
      // First, get the contact information
      if (ASource > '') and (ASourceID > 0) then
        GetLongDisplay(ASource, ASourceID, AContactID, AList);
      // AList.Insert( 0, crm_rscstr.cTXT0000256 {'Recipient:'} );

      ATemp := Format(crm_rscstr.cTXT0000257 { 'Description: %s' } ,
        [FixStr(ADescription)]);
      AList.Insert(0, ATemp);

      ATemp := Format
        (crm_rscstr.cTXT0000258 { 'Document printed: %s (file name, %s)' } ,
        [FixStr(AName), AFileName]);
      AList.Insert(0, ATemp);

      ATemp := Format(crm_rscstr.cTXT0000259 { 'Printed by: %s' } ,
        [SecurityManager.UserName]); // IQMS.WebVcl.SecurityManager.pas
      AList.Add(ATemp);

      // Give the result
      Result := AList.Text;
    finally
      Free;
    end;
end;

function GetEPlantName(AEplantID: Real): String;
begin
  if AEplantID > 0 then
    Result := SelectValueFmtAsString(
      'select name from eplant where id = %.0f',
      [AEplantID])
  else
    Result := '';
end;

function GetOpenIssueCount(const ASource: String;
  const ASourceID, AContactID: Real): Integer;
begin
  // Returns number of Open Support Issues for Principal
  if AContactID = 0 then
    Result := SelectValueFmtAsInteger(
      'select count(id) from crm_activity ' +
      'where type = 4 and NVL( archived, ''N'' ) <> ''Y'' ' +
      '  and principle_source = ''%s'' ' +
      '  and principle_source_id = %.0f ',
      [ASource, ASourceID])
  else
    Result := SelectValueFmtAsInteger(
      'select count(id) from crm_activity ' +
      'where type = 4 and NVL( archived, ''N'' ) <> ''Y'' ' +
      '  and principle_source = ''%s'' ' +
      '  and principle_source_id = %.0f ' +
      '  and contact_id = %.0f ',
      [ASource, ASourceID, AContactID]);
end;

function ValidateCurrentUser(AHeaderText: String = '';
  AShowError: Boolean = TRUE): Boolean;
begin
  // This method ensures that the current user (running the application) is a
  // registered user in the Security Inspector (table S_USER_GENERAL and PR_EMP).

  // Has the user been associated with an employee record in the Security Inspector?
  Result := SelectValueFmtAsInt64(
    'select pr_emp_id from s_user_general where user_name = ''%s'' ',
    [SecurityManager.UserName]) > 0;
  if not Result and AShowError then
    begin
      if Trim(AHeaderText) = '' then
        AHeaderText := crm_rscstr.cTXT0001303; // 'Unrecognized User.'

      ShowIQErrorMessage(AHeaderText,
        crm_rscstr.cTXT0001301,
        // 'Your user name is not associated with an employee record.',
        // * standard message about associating user_name and pr_emp_id
        Format(crm_rscstr.cTXT0001299, [SecurityManager.UserName]));
    end;
end;

procedure SetScheduleRequestStatus(ACRMActivityMembersID: Real;
  AStatus: TScheduleRequestStatus);
begin
  ExecuteCommandFmt(
    'update crm_activity_members set schedule_request_status = %d where id = %.0f',
    [Ord(AStatus), ACRMActivityMembersID]);
end;

function HasPendingScheduleRequests: Boolean;
var
  ACursor: Integer;
  AID: Real;
begin
  Result := False;
    AID := GetEmployeeID(SecurityManager.UserName);
    if AID > 0 then
      Result := SelectValueFmtAsFloat(
        'SELECT 1 FROM crm_activity_members ' +
        'WHERE source = ''PR_EMP'' AND source_id = %.0f AND ' +
        'NVL(schedule_request_status, 0) = 1 AND ROWNUM < 2',
        [AID]) = 1;
end;

procedure CreateActivity(ANewID: Real;
  AType: TActivityType;
  ASource: TPrincipalSourceType;
  ASourceID: Real;
  AContactID: Real;
  AStartDate,
  AFinishDate: TDateTime;
  AAllDay: Boolean;
  ASubject: String);
begin
  if ANewID = 0 then
    ANewID := GetNextID('CRM_ACTIVITY');

  with TFDStoredProc.Create(NIL) do
    try
      ConnectionName := cnstFDConnectionName; // IQMS.Common.DataConst;
      StoredProcName := 'IQMS.IQCRM.CREATE_ACTIVITY';
      Prepare;
      ParamByName('v_new_id').Value := ANewID;
      ParamByName('v_type').Value := Ord(AType);
      ParamByName('v_source').Value :=
        IQMS.Common.PrincipalSourceTypes.PrincipalSourceTableName[ASource];
      ParamByName('v_source_id').Value := ASourceID;
      ParamByName('v_contact_id').Value := AContactID;
      if (Trunc(AStartDate) < 100) or (Trunc(AFinishDate) < 100) then
        begin
          AStartDate := IQMS.Common.Dates.IQOracleAdjustedDateTime;
          AFinishDate := AStartDate + (IQMS.Common.Dates.TIME_OneMinute * 5);
        end;
      ParamByName('v_start_date').Value := AStartDate;
      ParamByName('v_finish_date').Value := AFinishDate;
      ParamByName('v_allday').Value := IQMS.Common.Boolean.BoolToYN(AAllDay);
      ParamByName('v_assigned_to').Value := SecurityManager.UserName;
      ParamByName('v_subject').Value := ASubject;
      ParamByName('v_eplant_id').Value := SecurityManager.EPlant_ID_AsInteger;
      ExecProc;
    finally
      Free;
    end;

  // Update the principle contact display
  DBUpdatePrincipleDisplay(ANewID);

end;

procedure FixActivityFinishDates;
var
  ACursor: Integer;
begin
    ExecuteCommand(
      'begin                                    '#13 +
      '  for v_1 in                             '#13 +
      '   (select id                            '#13 +
      '    from crm_activity                    '#13 +
      '    where                                '#13 +
      '      finishdate is not NULL             '#13 +
      '      and finishdate < startdate         '#13 +
      '      and type in (1,2,3,5)              '#13 +
      '    order by id)                         '#13 +
      '  loop                                   '#13 +
      '    update crm_activity                  '#13 +
      '    set startdate = finishdate           '#13 +
      '    where id = v_1.id;                   '#13 +
      '    commit;                              '#13 +
      '  end loop;                              '#13 +
      'end;                                     ');
end;

function GetSourceDisplay_ARINVT(const AID: Real): String;
var
  AData: Variant;
  AItemno, ADescrip, ADescrip2, AClass, ARev: String;
  AClassStr, ARevStr: String;
begin
  // Initialization
  Result := '';
  AData := Unassigned;
  AClassStr := '';
  ARevStr := '';
  // Validation
  if AID = 0 then
    Exit;
  // Get data
  AData := SelectValueArrayFmt(
    'select itemno, descrip, descrip2, ' +
    'class, rev from arinvt where id = %.0f', [AID]);
  if System.Variants.VarArrayDimCount(AData) = 0 then
    Exit;
  AItemno := Trim(AData[0]);
  ADescrip := Trim(AData[1]);
  ADescrip2 := Trim(AData[2]);
  AClass := Trim(AData[3]);
  ARev := Trim(AData[4]);


  // 10/13/2009 Remmed these lines.  Requested by Randy.
  // 07/10/2009 Include additional information.  Requested by Susan.
  { if AClass > '' then
    AClassStr := Format('[%s]',[AClass]);
    if ARev > '' then
    ARevStr := Format('[%s]',[ARev]);
    if ADescrip2 > '' then
    Result := Format('%s - %s, %s %s%s',
    [AItemno, ADescrip, ADescrip2, AClassStr, ARevStr])
    else
    Result := Format('%s - %s %s%s',
    [AItemno, ADescrip, AClassStr, ARevStr]); }

  // 10/13/2009 Return a simple description for the item.
  // Requested by Randy.
  Result := Format('%s - %s',
    [Trim(AItemno), Trim(ADescrip)]);

end;

function GetSourceDisplay_QINVT(const AID: Real): String;
var
  AData: Variant;
  AItemno, ADescrip, ADescrip2, AClass, ARev: String;
begin
  // Initialization
  Result := '';
  AData := Unassigned;
  // Validation
  if AID = 0 then
    Exit;
  // Get data
  AData := SelectValueArrayFmt(
    'select itemno, descrip, descrip2, ' +
    'class, rev from qinvt where id = %.0f', [AID]);
  if System.Variants.VarArrayDimCount(AData) = 0 then
    Exit;
  AItemno := Trim(AData[0]);
  ADescrip := Trim(AData[1]);
  ADescrip2 := Trim(AData[2]);
  AClass := Trim(AData[3]);
  ARev := Trim(AData[4]);
  if ADescrip2 > '' then
    Result := Format('%s - %s, %s',
      [AItemno, ADescrip, ADescrip2])
  else
    Result := Format('%s - %s',
      [AItemno, ADescrip]);
end;

function ActivityVisibleInCRMContext(const ACRMActivityID: Real): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1                                                                 '#13 +
    '  FROM crm_activity                                                      '#13 +
    ' WHERE iqms.iqcrm.principle_filter(principle_source, principle_source_id,'#13 +
    '       contact_id, principle_crm_prospect) = 1 AND                       '#13 +
    '       iqms.iqcrm.assignedto_filter(assignedto) = 1 AND                  '#13 +
    '       id = %.0f                                                         ',
    [ACRMActivityID]) = 1;
end;

procedure AddSupportEvent(const ASupportID: Real;
  ARegarding: string; AActivityLinkID: Real; out ANewEventID: Real);
begin
  if ASupportID = 0 then
    Exit;

  with TFDStoredProc.Create(NIL) do
    try
      ConnectionName := cnstFDConnectionName; // IQMS.Common.DataConst;
      StoredProcName := 'IQMS.IQCRM.ADD_SUPPORT_EVENT';
      Prepare;
      ParamByName('v_support_id').Value := ASupportID;
      ParamByName('v_regarding').Value := ARegarding;
      ParamByName('v_activity_link_id').Value := AActivityLinkID;
      ExecProc;
      ANewEventID := ParamByName('v_new_id').AsLargeInt;
    finally
      Free;
    end;
end;

procedure AddAssigmentChangeSupportEvent(const ASupportID: Real;
  const AOldAssignedTo, ANewAssignedTo: string; out ANewEventID: Real);
var
  AEmployee1, AEmployee2, AMsgText: string;
begin
  AEmployee1 := crm_activity_dblib.GetEmployeeName(AOldAssignedTo);
  AEmployee2 := crm_activity_dblib.GetEmployeeName(ANewAssignedTo);
  // crm_rscstr.cTXT0001903 =
  // 'Support issue Assigned To was changed from %s (%s) to %s (%s).';
  AMsgText := Format(crm_rscstr.cTXT0001903,
    [AEmployee1, AOldAssignedTo, AEmployee2, ANewAssignedTo]);
  AddSupportEvent(ASupportID, AMsgText, 0,
    { out } ANewEventID);
end;

function GetAlertDateTime(const AStartDate: TDateTime; const AAllDay: Boolean;
  ALeadTime: TLeadTimeUnit): TDateTime;
var
  ADifference: Real;
begin
  case ALeadTime of
    ltu0Minutes:
      ADifference := 0; // 0 Minutes
    ltu5Minutes:
      ADifference := 5 * IQMS.Common.Dates.TIME_OneMinute; // 5 Minutes
    ltu10Minutes:
      ADifference := 10 * IQMS.Common.Dates.TIME_OneMinute; // 10 Minutes
    ltu15Minutes:
      ADifference := IQMS.Common.Dates.TIME_15Mins; // 15 Minutes
    ltu30Minutes:
      ADifference := IQMS.Common.Dates.TIME_30Mins; // 30 Minutes
    ltu1Hour:
      ADifference := IQMS.Common.Dates.TIME_OneHour; // 1 Hour
    ltu2Hours:
      ADifference := 2 * IQMS.Common.Dates.TIME_OneHour; // 2 Hours
    ltu3Hours:
      ADifference := 3 * IQMS.Common.Dates.TIME_OneHour; // 3 Hours
    ltu4Hours:
      ADifference := 4 * IQMS.Common.Dates.TIME_OneHour; // 4 Hours
    ltu5Hours:
      ADifference := 5 * IQMS.Common.Dates.TIME_OneHour; // 5 Hours
    ltu6Hours:
      ADifference := 6 * IQMS.Common.Dates.TIME_OneHour; // 6 Hours
    ltu7Hours:
      ADifference := 7 * IQMS.Common.Dates.TIME_OneHour; // 7 Hours
    ltu8Hours:
      ADifference := 8 * IQMS.Common.Dates.TIME_OneHour; // 8 Hours
    ltu9Hours:
      ADifference := 9 * IQMS.Common.Dates.TIME_OneHour; // 9 Hours
    ltu10Hours:
      ADifference := 10 * IQMS.Common.Dates.TIME_OneHour; // 10 Hours
    ltu11Hours:
      ADifference := 11 * IQMS.Common.Dates.TIME_OneHour; // 11 Hours
    ltuHalfDay:
      ADifference := 12 * IQMS.Common.Dates.TIME_OneHour; // 0.5 Days
    ltu18Hours:
      ADifference := 18 * IQMS.Common.Dates.TIME_OneHour; // 18 Hours
    ltu1Day:
      ADifference := 1; // 1 Day
    ltu2Days:
      ADifference := 2; // 2 Days
    ltu3Days:
      ADifference := 3; // 3 Days
    ltu4Days:
      ADifference := 4; // 4 Days
    ltu1Week:
      ADifference := 7; // 1 Week
    ltu2Weeks:
      ADifference := 14; // 2 Weeks
  else
    ADifference := 0;
  end;

  if AAllDay then
    Result := Trunc(AStartDate) - ADifference
  else
    Result := AStartDate - ADifference;

end;

procedure CheckUniquePartnerNumber(const APartnerNo: string;
  const ACurrentPartnerID: Real);
begin
  // Vendor Number is unique?
  if Integer(SelectValueParam(
    'SELECT 1 FROM partner WHERE TRIM(partnerno)= :PARTNERNO AND id <> :ID',
    ['PARTNERNO;STRING', 'ID;INT64'],
    [Trim(APartnerNo), ACurrentPartnerID])) = 1 then
    // 'The Partner Number you entered is already used.  Please enter a different Partner Number.'
    raise Exception.Create(crm_rscstr.cTXT0000612);
end;

end.
