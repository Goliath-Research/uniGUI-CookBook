unit crm_activity_delete;

(* ****************************************************************************
  ***                          Delete CRM Activity                          ***

  This unit handles deleting an activity.  It prompts the user, as needed,
  and removes the record.  This unit may be called outside of CRM, since
  no CRM-specific objects are declared.  This unit was originally added so
  that HR Employee Events could be deleted, without first opening CRM.

  **************************************************************************** *)

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  System.Variants,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf;

type
  { TDeleteRecurrenceOptions }
  /// <summary> Indicates the scope of the recurrence, when deleting.  For
  ///  the current activity only, use droInstance.  To delete the entire
  ///  series, use droSeries.
  /// </summary>
  TDeleteRecurrenceOptions = (droDontCare, droInstance, droSeries);

/// <summary> Delete the activity.  This method displays the required prompts.
/// If a True result is returned, then the activity has been deleted.
/// The calling form will need to refresh the local dataset.
/// </summary>
function DeleteActivity( ACRMActivityID: Real;
  AOptions: TDeleteRecurrenceOptions = droDontCare): Boolean;

implementation

// Note:  The declared units must be inoccuous.  They cannot hook in
// CRM-specific objects. For instance, do not include
// crm_recurrence in the list.
uses
  crm_ref_list,
  crm_rscstr,
  crm_strings,
  crm_types,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils,
  IQMS.Common.DataConst;

{ DeleteActivity }
function DeleteActivity( ACRMActivityID: Real;
  AOptions: TDeleteRecurrenceOptions = droDontCare): Boolean;
var
  AID: Real;
  AList: TStringList;
  ATypeStr: string;
  AType: Integer;
  S: string;
  AHasRecurrences, AIsParent, AHasDependencies,
    AMustDeleteRecurrences: Boolean;
  AParentID: Real;

  // NOTE:  We cannot include crm_recurrence.pas in the uses clause of this
  // unit because it is used outside of CRM.  So, we must limit
  // ourselves to a nested routine that does exactly what
  // crm_recurrence.RemoveRecurrences does.
  // --------------------------------------------------------------------------
  procedure _RemoveRecurrences(AID: Real);
  begin
    // Delete the settings from the parent record
    ExecuteCommandFmt
      ('delete from crm_recurrence where crm_activity_id = %.0f',
      [AID]);
    // Delete child records
    ExecuteCommandFmt
      ('delete from crm_activity where parent_id = %.0f', [AID]);
  end;
// --------------------------------------------------------------------------
  function _HasRecurrenceSettings(AID: Real): Boolean;
  begin
    Result := SelectValueFmtAsInt64(
      'select id from crm_recurrence ' +
      'where crm_activity_id = %.0f and rownum < 2', [AID]) > 0;
  end;

// --------------------------------------------------------------------------
begin
  {
    When deleting a CRM activity, we must account for recurrences and for
    dependencies.  If a record is the parent of recurrences, then the child
    recurrences will be deleted.  But if the record is a recurrence (child),
    we delete it only; we do not clear any other recurrence.

    In this method we use several boolean variables to clarify what we are
    doing:  AHasRecurrences, AIsParent, AHasDependencies, and
    AMustDeleteRecurrences.  We could easily have bypassed these variables,
    but using them makes the logic easier to understand.

  }

  // Initialize result
  Result := FALSE;

  // Initialize variables
  AList := nil;
  AType := 0;
  AParentID := 0;
  AHasRecurrences := FALSE;
  AIsParent := FALSE;
  AHasDependencies := FALSE;

  AList := TStringList.Create;
  try
    // Activity type
    AType := SelectValueFmtAsInteger(
      'select type from crm_activity where id = %.0f',
      [ACRMActivityID]);

    if (TActivityType(AType) = atSalesStage) then
      begin
        if SelectValueAsString(
          'SELECT NVL(can_delete_sales_stage_notes, ''N'')  '#13 +
          '  FROM s_user_general                            '#13 +
          ' WHERE user_name = misc.getusername              ') = 'N' then
          // crm_rscstr.cTXT0000115 =
          // 'Access Denied.  You do not have permission to delete Sales Stage change notes.';
          raise Exception.Create(crm_rscstr.cTXT0000115);
       end;

    // Get a list of dependencies
    with TFDQuery.Create(nil) do
      try
        ConnectionName := cnstFDConnectionName;
        SQL.Add('  SELECT b.id, b.type, b.subject');
        SQL.Add('    FROM crm_activity_events a, crm_activity b');
        SQL.Add('   WHERE b.id = a.crm_activity_id AND');
        SQL.Add(Format('         a.activity_link_id = %.0f', [ACRMActivityID]));
        SQL.Add('ORDER BY b.id');
        Open;
        First;
        while not EOF do
          begin
            ATypeStr := GetTypeString(Fields[1].AsInteger); // crm_strings.pas
            S := Format('%s %d - %s', [ATypeStr, Fields[0].AsInteger,
              FixStrMemo(Fields[2].AsString)]); // iqstring
            AList.Add(S);
            Next;
          end;
        Close;
      finally
        Free;
      end;

    // Set local variable
    AHasDependencies := AList.Count > 0;
    // prompt for dependencies
    if AHasDependencies and not
      DoPromptHasReferences(AList, '', '',
      crm_rscstr.cTXT0000408 { 'Continue' } ) then // in crm_ref_list.pas
      Exit(FALSE);
  finally
    if Assigned(AList) then
      FreeAndNil(AList);
  end;

  // If we are not deleting the current item only, check for recurrence
  if (AOptions <> droInstance) and (AType in [1, 2, 3]) then
    begin
      // Check recurrences
      // NOTE:  This is the same logic as crm_recurrence.HasRecurrence().
      // 1.) Does activity have recurrences?  If so, then this is the parent
      // for recurrences.  Delete this activity, and you must delete
      // all recurrences.
      AHasRecurrences := _HasRecurrenceSettings(ACRMActivityID);

      // 2.) Does this activity have a parent with recurrences?  If so, this
      // is a recurrence, and may be deleted individually.
      if not AHasRecurrences then
        begin
          AParentID := SelectValueFmtAsInt64(
            'select parent_id from crm_activity ' +
            'where id = %.0f', [ACRMActivityID]);
          AHasRecurrences := _HasRecurrenceSettings(AParentID);
        end;

      // Set local variable
      AIsParent := AParentID = 0;

    end;

  // Do we have to delete recurrences? If these conditions are met (True),
  // then we must at least attempt to delete recurrences.  Otherwise, we
  // must leave them alone; we are only deleting the selected activity.
  AMustDeleteRecurrences := (AType in [1, 2, 3]) and AHasRecurrences and
    (AIsParent or (AOptions = droSeries));

  // If we have to delete the recurrences, inform the user that recurrences
  // will also be removed.
  if AMustDeleteRecurrences then
    // 'Delete this item?  Deleting this item will also delete ' +
    // 'recurrences.  This is a permanent and irreversible action.'
    Result := IQConfirmYN(crm_rscstr.cTXT0001444)
    // Display the standard prompt.  We are only deleting the current item.
  else
    // 'Delete this item?  This is a permanent and irreversible action.'
    Result := IQConfirmYN(crm_rscstr.cTXT0000407);

  // If the user has chosen to continue and delete the item, then take the
  // appropriate action below.
  if Result then
    begin
      // Remove occurrances
      if AMustDeleteRecurrences then
        begin
          // We use the nested routines below instead of the crm_recurrence
          // method because this unit is used external to CRM.
          if AParentID > 0 then
            _RemoveRecurrences(AParentID)
          else
            _RemoveRecurrences(ACRMActivityID);
        end;

      // Remove notifications
      ExecuteCommandFmt(
        'DELETE FROM crm_notify                                         '#13 +
        '      WHERE crm_activity_id IN (SELECT id                      '#13 +
        '                                  FROM crm_activity            '#13 +
        '                                 WHERE parent_id = %.0f) OR    '#13 +
        '            crm_activity_id = %.0f                             ',
        [AParentID, ACRMActivityID]);

      // delete the activity
      ExecuteCommandFmt('delete from crm_activity where id = %.0f',
        [ACRMActivityID]);

      // 01/13/2009 Also delete the parent if we are deleting recurrences
      if AMustDeleteRecurrences and (AParentID > 0) then
        ExecuteCommandFmt('delete from crm_activity where id = %.0f',
          [AParentID]);
    end;
end;

end.
