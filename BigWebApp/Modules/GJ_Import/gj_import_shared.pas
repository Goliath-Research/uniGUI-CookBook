unit gj_import_shared;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DBXOracle,
  Data.DB,
  Data.SqlExpr,
  Datasnap.DBClient,
  IQMS.WebVcl.DBExpress,
  Vcl.Menus,
  IQMS.WebVcl.CaptionPanel,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Data.DBXCommon,
  MainModule,
  IQMS.DBTrans.dbttypes,
  IQMS.DBTrans.dbtdb,
  dbtclass,
  { TODO -oathite -cWebConvert : Depends on dbtfieldmap
  dbtfieldmap, }
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf;

type
  { TGLImportSourceType }
  /// <summary> General Journal import type.  Determines the kind of
  /// import to execute.
  /// </summary>
  TGLImportType = (gjiUnknown, gjiFreeForm, gjiRecurring, gjiReversing,
    gjiStatistical, gjiBudget);

  { TGLImportRecurOptions }
  /// <summary> Recurrence options, as set in the user interface.
  /// Pattern indicates the primary type of recurrence.  The remaining
  /// settings are interpreted differently, depending on the pattern value.
  /// </summary>
  TGLImportRecurOptions = record
    Pattern: Byte;
    Count: Integer;
    Start: TDateTime;
    Interval: Byte;
    Number: Integer;
  end;

{$REGION 'Insert, Update, Delete Configuration'}

  /// <summary> Save configuration to a new record.  User import options
  /// are saved to the database table, GJ_IMPORT_CONFIG.
  /// </summary>
procedure SaveConfiguration(
  const AImportType: TGLImportType;
  const AName,
  ADescription: string;
  const AGLYearID,
  AGLPeriodsID,
  ABudgetsID,
  AGLAccountID: Int64;
  const ABatchDescripion: string;
  const AConfiguration: TStringList;
  const ARecurrenceOptions: TGLImportRecurOptions);

/// <summary> Update an existing configuration.  User import options
/// are updated, including import type, dataset settings, field mapping,
/// and the like.
/// </summary>
procedure UpdateConfiguration(
  const AConfigurationID: Int64;
  const AImportType: TGLImportType;
  const AName,
  ADescription: string;
  const AGLYearID,
  AGLPeriodsID,
  ABudgetsID,
  AGLAccountID: Int64;
  const ABatchDescripion: string;
  const AConfiguration: TStringList;
  const ARecurrenceOptions: TGLImportRecurOptions);

/// <summary> Delete a configuration.
/// </summary>
function DeleteConfiguration(const AConfigurationID: Int64): Boolean;

{$ENDREGION 'Insert, Update, Delete Configuration'}

{$REGION 'Batch Operations'}

/// <summary> Copy records from the temporary table (ATempTableName) to
/// the batch table, GJ_IMPORT_BATCH_DETAIL.  The TFieldMap (AFieldMap)
/// is used for mapping the fields.
/// </summary>
procedure LoadFromTemporaryTable(
  const ABatchID: Int64;
  const ATempTableName: string;
  const AFieldMap: TFieldMap;
  const AImportType: TGLImportType);

/// <summary> Check and ensure the Import Batch header record is created.
/// If one does not exist, one will be created using the information
/// provided.
/// </summary>
procedure CheckCreateBatch(
  const AImportType: TGLImportType;
  const AGLYearID, AGLPeriodsID, ABudgetsID, AGLAccountID: Int64;
  const ABatchDescripion: string;
  const ARecurrenceOptions: TGLImportRecurOptions;
  var ABatchID: Int64);

/// <summary> Create the Import Batch header record. If possible, call
/// CheckCreateBatch instead to prevent an additional batch header
/// record from being created.
/// </summary>
procedure CreateBatch(
  const AImportType: TGLImportType;
  const AGLYearID, AGLPeriodsID, ABudgetsID, AGLAccountID: Int64;
  const ABatchDescripion: string;
  const ARecurrenceOptions: TGLImportRecurOptions;
  var ABatchID: Int64);

/// <summary> Raise an exception message if no data could be imported
/// into the batch table from the external file.
/// </summary>
procedure RaiseEmptyTable(const ABatchID: Int64);

/// <summary> Processes the data in the batch, after the external file has
/// been imported.  The records in the batch are used to update the
/// General Ledger.  The logic occurs at the Oracle package level.
/// </summary>
procedure ProcessBatch(AOwner: TComponent; const ABatchID: Int64);

/// <summary> Delete all data in the import batch, including the header
/// record and imported data.
/// </summary>
procedure ClearBatch(const ABatchID: Int64);

/// <summary> Checks for and deletes any batches that are older than five
/// days.  This eliminates batches that were created, but not deleted
/// when the application closed.
/// </summary>
procedure CheckDeleteObsoleteBatches;

{$ENDREGION 'Batch Operations'}

(* **************************************************************************
  * How this works:
  * 1. Import records from the external file (i.e., Excel spreadsheet) into
  *    a temporary table.  The table contains the raw data from the import.
  * 2. Before procesing, add a new "batch" record to GJ_IMPORT_BATCH,
  *    which contains general information necessary for processing.
  * 3. Transfer the data from the temporary table into GJ_IMPORT_BATCH_DETAIL.
  * 4. Call the package procedure to process the data contained in
  *    GJ_IMPORT_BATCH_DETAIL.  This is where the real work takes place because
  *    depending on the type of import (Free Form, Recurring, Reversing,
  *    etc.), the data is imported into the GL tables differently.
  ************************************************************************** *)

//var
//  FBatchID: Integer;

implementation

uses
  dbtcommon,
  IQMS.Common.DataLib,
  gj_import_rscstr,
  iqdbtrans,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.ProgressDialog,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils;

{$REGION 'Insert, Update, Delete Configuration'}


procedure SaveConfiguration(const AImportType: TGLImportType;
  const AName, ADescription: string; const AGLYearID, AGLPeriodsID,
  ABudgetsID, AGLAccountID: Int64; const ABatchDescripion: string;
  const AConfiguration: TStringList;
  const ARecurrenceOptions: TGLImportRecurOptions);
var
  ANewID: Integer;
begin
  // This should never happen, but check anyway
  if not Assigned(AConfiguration) then
    raise Exception.Create('Application Error:  Configuration not provided.');
  try
    // Get values to insert
    ANewID := GetNextID('gj_import_config');
    // Update the record
    ExecuteCommandParam(
      'INSERT INTO gj_import_config(id,                               '#13 +
      '                             name,                             '#13 +
      '                             descrip,                          '#13 +
      '                             import_type,                      '#13 +
      '                             batch_descrip,                    '#13 +
      '                             glyear_id,                        '#13 +
      '                             glperiods_id,                     '#13 +
      '                             budgets_id,                       '#13 +
      '                             glacct_id,                        '#13 +
      '                             recur_pattern,                    '#13 +
      '                             recur_count,                      '#13 +
      '                             recur_start,                      '#13 +
      '                             recur_interval,                   '#13 +
      '                             recur_number,                     '#13 +
      '                             config)                           '#13 +
      '    VALUES (:id,                                               '#13 +
      '            :name,                                             '#13 +
      '            :descrip,                                          '#13 +
      '            :import_type,                                      '#13 +
      '            :batch_descrip,                                    '#13 +
      '            :glyear_id,                                        '#13 +
      '            :glperiods_id,                                     '#13 +
      '            :budgets_id,                                       '#13 +
      '            :glacct_id,                                        '#13 +
      '            :recur_pattern,                                    '#13 +
      '            :recur_count,                                      '#13 +
      '            :recur_start,                                      '#13 +
      '            :recur_interval,                                   '#13 +
      '            :recur_number,                                     '#13 +
      '            :config)                                           ',
      ['ID;INT64', 'NAME;S', 'DESCRIP;S', 'IMPORT_TYPE;I', 'BATCH_DESCRIP;S',
      'GLYEAR_ID;INT64', 'GLPERIODS_ID;INT64', 'BUDGETS_ID;INT64', 'GLACCT_ID;INT64',
      'RECUR_PATTERN;I', 'RECUR_COUNT;I', 'RECUR_START;D', 'RECUR_INTERVAL;I',
      'RECUR_NUMBER;I', 'CONFIG'],
      [ANewID, AName, ADescription, Ord(AImportType), ABatchDescripion,
      IQMS.Common.Numbers.NullIfZero(AGLYearID), IQMS.Common.Numbers.NullIfZero(AGLPeriodsID),
      IQMS.Common.Numbers.NullIfZero(ABudgetsID), IQMS.Common.Numbers.NullIfZero(AGLAccountID),
      ARecurrenceOptions.Pattern, ARecurrenceOptions.Count,
      ARecurrenceOptions.Start, ARecurrenceOptions.Interval,
      ARecurrenceOptions.Number, AConfiguration.Text]);
  except
    on E: Exception do
      // Tame and re-raise with helpful error message
      // gj_import_rscstr.cTXT0000027 = 'Cannot save configuration:  %s';
      raise Exception.CreateFmt(gj_import_rscstr.cTXT0000027, [E.Message]);
  end;
end;

procedure UpdateConfiguration(const AConfigurationID: Int64;
  const AImportType: TGLImportType; const AName, ADescription: string;
  const AGLYearID, AGLPeriodsID, ABudgetsID, AGLAccountID: Int64;
  const ABatchDescripion: string; const AConfiguration: TStringList;
  const ARecurrenceOptions: TGLImportRecurOptions);
begin
  // This should never happen, since we evaluate, but check anyway.
  if not Assigned(AConfiguration) or (AConfigurationID = 0) then
    raise Exception.Create('Application Error:  Configuration not provided.');
  try
    // Update the record
    ExecuteCommandParam(
      'UPDATE gj_import_config                                        '#13 +
      '   SET name = :name,                                           '#13 +
      '       descrip = :descrip,                                     '#13 +
      '       import_type = :import_type,                             '#13 +
      '       batch_descrip = :batch_descrip,                         '#13 +
      '       glyear_id = :glyear_id,                                 '#13 +
      '       glperiods_id = :glperiods_id,                           '#13 +
      '       budgets_id = :budgets_id,                               '#13 +
      '       glacct_id = :glacct_id,                                 '#13 +
      '       recur_pattern = :recur_pattern,                         '#13 +
      '       recur_count = :recur_count,                             '#13 +
      '       recur_start = :recur_start,                             '#13 +
      '       recur_interval = :recur_interval,                       '#13 +
      '       recur_number = :recur_number,                           '#13 +
      '       config = :config                                        '#13 +
      ' WHERE id = :id                                                ',
      [':NAME;S', ':DESCRIP;S', 'IMPORT_TYPE;I', 'BATCH_DESCRIP;S',
      ':GLYEAR_ID;INT64', ':GLPERIODS_ID;INT64', ':BUDGETS_ID;INT64', ':GLACCT_ID;INT64',
      'RECUR_PATTERN;I', 'RECUR_COUNT;I', 'RECUR_START;D', 'RECUR_INTERVAL;I',
      'RECUR_NUMBER;I', ':CONFIG', ':ID;F'],
      [AName, ADescription, Ord(AImportType), ABatchDescripion,
      IQMS.Common.Numbers.NullIfZero(AGLYearID), IQMS.Common.Numbers.NullIfZero(AGLPeriodsID),
      IQMS.Common.Numbers.NullIfZero(ABudgetsID), IQMS.Common.Numbers.NullIfZero(AGLAccountID),
      ARecurrenceOptions.Pattern, ARecurrenceOptions.Count,
      ARecurrenceOptions.Start, ARecurrenceOptions.Interval,
      ARecurrenceOptions.Number, AConfiguration.Text, AConfigurationID]);
  except
    on E: Exception do
      // Tame and re-raise with helpful error message
      // gj_import_rscstr.cTXT0000027 = 'Cannot save configuration:  %s';
      raise Exception.CreateFmt(gj_import_rscstr.cTXT0000027, [E.Message]);
  end;
end;

function DeleteConfiguration(const AConfigurationID: Int64): Boolean;
begin
  // Delete the selected configuration
  if (AConfigurationID = 0) then
    Exit(False);

  // gj_import_rscstr.cTXT0000008 =
  // 'Delete selected configuration?'
  if not IQConfirmYN(gj_import_rscstr.cTXT0000008) then
    Exit(False);

  ExecuteCommandFmt(
    'DELETE FROM gj_import_config WHERE id = %d',
    [AConfigurationID]);
  Result := True;
end;

{$ENDREGION 'Insert, Update, Delete Configuration'}

{$REGION 'Batch Operations'}


procedure LoadFromTemporaryTable(const ABatchID: Int64; const ATempTableName: string;
  const AFieldMap: TFieldMap; const AImportType: TGLImportType);
var
  AFieldDescrip: string;
  AFieldDetailDate: string;
  AFieldDebit: string;
  AFieldCredit: string;
  AFieldGLAcct: string;
  AOracleDateType: string;
  AFieldCatalog: TFieldCatalog;

  // Get the source (external) field name that is mapped to the IQMS table.
  function _FieldNameFor(const AValue: string): string;
  var
    i: Integer;
  begin
    // Get the item index of the field in GJ_IMPORT_BATCH_DETAIL.
    i := AFieldMap.IndexOfTarget(AValue);
    // Use that index to get the name of the source field mapped to it
    Result := AFieldMap.Source(i);
  end;

begin
  IQAssert(ABatchID > 0, 'Application Error:  Batch ID not provided.');
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SQLConnection'
  AFieldCatalog := TFieldCatalog.Create(UniMainModule.SQLConnection);   }
  try
    AFieldCatalog.AddTableFields(ATempTableName);


  // Get the fields from the source dataset that
  // were mapped to GJ_IMPORT_BATCH_DETAIL.
  AFieldDescrip := _FieldNameFor('DESCRIP');
  AFieldDetailDate := _FieldNameFor('DETAIL_DATE');
  AFieldDebit := _FieldNameFor('DEBIT');
  AFieldCredit := _FieldNameFor('CREDIT');
  AFieldGLAcct := _FieldNameFor('GL_ACCT');

  // Validate
  IQAssert((AFieldGLAcct > ''), gj_import_rscstr.cTXT0000021);

  if (AImportType = gjiBudget) then
    // gj_import_rscstr.cTXT0000023 = 'Field, Credit, must be mapped.';
    IQAssert((AFieldCredit > ''), gj_import_rscstr.cTXT0000023)
  else
    // gj_import_rscstr.cTXT0000022 = 'Fields, Debit and/or Credit, must be mapped.';
    IQAssert((AFieldDebit > '') or (AFieldCredit > ''),
      gj_import_rscstr.cTXT0000022);

  try
    // Load the records from the temporary table into GJ_IMPORT_BATCH_DETAIL
    with TFDCommand.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        CommandText.Add('INSERT INTO gj_import_batch_detail(id,');
        CommandText.Add('                                   gj_import_batch_id,');
        CommandText.Add('                                   descrip,');
        CommandText.Add('                                   detail_date,');
        CommandText.Add('                                   debit,');
        CommandText.Add('                                   credit,');
        CommandText.Add('                                   gl_acct)');
        CommandText.Add('   SELECT s_gj_import_batch_detail.NEXTVAL,');
        CommandText.Add(Format('          %d,', [ABatchID]));

        // descrip
        if AFieldDescrip > '' then
          CommandText.Add(Format('          %s,', [AFieldDescrip]))
        else
          CommandText.Add('          NULL,');

        // detail_date
        if AFieldDetailDate > '' then
        begin
          AOracleDateType := AFieldCatalog.FieldDataTypeFor(ATempTableName, AFieldDetailDate);
          if (CompareText(AOracleDateType, 'VARCHAR2') = 0) or
            (CompareText(AOracleDateType, 'VARCHAR') = 0) or
            (CompareText(AOracleDateType, 'NVARCHAR2') = 0) or
            (CompareText(AOracleDateType, 'CHAR') = 0) then
          begin
            CommandText.Add(Format('          TO_DATE(TRIM(%s), ''MM/DD/RRRR HH24:MI:SS''),', [AFieldDetailDate]));
          end
          else if CompareText(AOracleDateType, 'DATE') = 0 then
          begin
            CommandText.Add(Format('          %s,', [AFieldDetailDate]));
          end
          else
          begin
            CommandText.Add('          NULL,');
          end;
        end
        else
          CommandText.Add('          NULL,');

        // debit
        if AFieldDebit > '' then
        begin
          AOracleDateType := AFieldCatalog.FieldDataTypeFor(ATempTableName, AFieldDebit);
          if (CompareText(AOracleDateType, 'VARCHAR2') = 0) or
            (CompareText(AOracleDateType, 'VARCHAR') = 0)  or
            (CompareText(AOracleDateType, 'NVARCHAR2') = 0) or
            (CompareText(AOracleDateType, 'CHAR') = 0) then
          begin
            CommandText.Add(Format('          TO_NUMBER(TRIM(%s)),', [AFieldDebit]));
          end
          else
          begin
            CommandText.Add(Format('          %s,', [AFieldDebit]));
          end;
        end
        else
        begin
          CommandText.Add('          NULL,');
        end;

        // credit
        if AFieldCredit > '' then
        begin
          AOracleDateType := AFieldCatalog.FieldDataTypeFor(ATempTableName, AFieldCredit);
          if (CompareText(AOracleDateType, 'VARCHAR2') = 0) or
            (CompareText(AOracleDateType, 'VARCHAR') = 0) or
            (CompareText(AOracleDateType, 'NVARCHAR2') = 0) or
            (CompareText(AOracleDateType, 'CHAR') = 0) then
          begin
            CommandText.Add(Format('          TO_NUMBER(TRIM(%s)),', [AFieldCredit]));
          end
          else
          begin
            CommandText.Add(Format('          %s,', [AFieldCredit]));
          end;
        end
        else
        begin
          CommandText.Add('          NULL,');
        end;

        // gl_acct
        if AFieldGLAcct > '' then
          CommandText.Add(Format('          TRIM(%s)', [AFieldGLAcct]))
        else
          CommandText.Add('          NULL');
        // Temporary table - contains records imported directly from
        // the external file.
        CommandText.Add(Format('     FROM %s', [ATempTableName]));
        Execute;
      finally
        Free;
      end;
  except
    on E: Exception do
      // gj_import_rscstr.cTXT0000025 = 'Could not load data into batch:  %s';
      raise Exception.CreateFmt(gj_import_rscstr.cTXT0000025, [E.Message]);
  end;
  finally
    FreeAndNil(AFieldCatalog);
  end;
end;

procedure CheckCreateBatch(const AImportType: TGLImportType;
  const AGLYearID, AGLPeriodsID, ABudgetsID, AGLAccountID: Int64;
  const ABatchDescripion: string;
  const ARecurrenceOptions: TGLImportRecurOptions;
  var ABatchID: Int64);
begin
  // Note:  If the batch ID is zero, then guaranteed, this session has
  // not created a batch record.
  if ABatchID = 0 then
    CreateBatch(AImportType, AGLYearID, AGLPeriodsID, ABudgetsID, AGLAccountID,
      ABatchDescripion, ARecurrenceOptions, ABatchID);
end;

procedure CreateBatch(const AImportType: TGLImportType;
  const AGLYearID, AGLPeriodsID, ABudgetsID, AGLAccountID: Int64;
  const ABatchDescripion: string;
  const ARecurrenceOptions: TGLImportRecurOptions;
  var ABatchID: Int64);
begin
  // Delete the old batch, if it exists
  // - Clear prior records
  ClearBatch(ABatchID);
  // Delete any obsolete batches
  CheckDeleteObsoleteBatches;
  // Get the next batch number
  ABatchID := Trunc(IQMS.Common.Sequence.GetNextSequenceNumber('S_GJ_IMPORT_BATCH'));
  try
    // Add the batch, header record
    ExecuteCommandParam(
      'INSERT INTO gj_import_batch(id,               '#13 +
      '                            glyear_id,        '#13 +
      '                            glperiods_id,     '#13 +
      '                            budgets_id,       '#13 +
      '                            glacct_id,        '#13 +
      '                            import_type,      '#13 +
      '                            batch_descrip,    '#13 +
      '                            recur_pattern,    '#13 +
      '                            recur_count,      '#13 +
      '                            recur_start,      '#13 +
      '                            recur_interval,   '#13 +
      '                            recur_number)     '#13 +
      '    VALUES (:id,                              '#13 +
      '            :glyear_id,                       '#13 +
      '            :glperiods_id,                    '#13 +
      '            :budgets_id,                      '#13 +
      '            :glacct_id,                       '#13 +
      '            :import_type,                     '#13 +
      '            :batch_descrip,                   '#13 +
      '            :recur_pattern,                   '#13 +
      '            :recur_count,                     '#13 +
      '            :recur_start,                     '#13 +
      '            :recur_interval,                  '#13 +
      '            :recur_number)                    ',
      ['ID;INT64', 'GLYEAR_ID;INT64', 'GLPERIODS_ID;INT64', 'BUDGETS_ID;INT64', 'GLACCT_ID;INT64',
      'IMPORT_TYPE;I', 'BATCH_DESCRIP', 'RECUR_PATTERN;I', 'RECUR_COUNT;I',
      'RECUR_START;D', 'RECUR_INTERVAL;I', 'RECUR_NUMBER;I'],
      [ABatchID, IQMS.Common.Numbers.NullIfZero(AGLYearID),
      IQMS.Common.Numbers.NullIfZero(AGLPeriodsID), IQMS.Common.Numbers.NullIfZero(ABudgetsID),
      IQMS.Common.Numbers.NullIfZero(AGLAccountID), Ord(AImportType), ABatchDescripion,
      ARecurrenceOptions.Pattern, ARecurrenceOptions.Count,
      ARecurrenceOptions.Start, ARecurrenceOptions.Interval,
      ARecurrenceOptions.Number]);
    ExecuteCommandFmt(
      'BEGIN iqms.gj_import.session_batch := %d; END;',
      [ABatchID]);
  except
    on E: Exception do
      begin
        // Ensure this is set to zero first
        ABatchID := 0;
        // gj_import_rscstr.cTXT0000026 = 'Could not create batch:  %s';
        raise Exception.CreateFmt(gj_import_rscstr.cTXT0000026, [E.Message]);
      end;
  end;
end;

procedure RaiseEmptyTable(const ABatchID: Int64);
begin
  if SelectValueFmtAsInteger(
    'SELECT COUNT(*) FROM gj_import_batch_detail WHERE gj_import_batch_id = %d',
    [ABatchID]) = 0 then
    // gj_import_rscstr.cTXT0000007 =
    // 'There are no records to import.  Process aborted.';
    raise Exception.Create(gj_import_rscstr.cTXT0000007);
end;

procedure ProcessBatch(AOwner: TComponent; const ABatchID: Int64);
(* TODO -oathite -cWebConvert : Undeclared identifier: 'TProgressDialog'
var

  hPrg: TProgressDialog; // in IQMS.Common.ProgressDialog.pas }  *)
begin
  (* TODO -oathite -cWebConvert : Undeclared identifier: 'TProgressDialog'
  // Check if we have records
  // gj_import_rscstr.cTXT0000012 = 'Processing General Journal data ...';
  hPrg := hProgressDlg(1, gj_import_rscstr.cTXT0000012);
  try
    hPrg.CancelBtnEnabled := False;
    hPrg.Marquee := True;
    // Process the batch
    // gj_import_rscstr.cTXT0000014 = 'Updating tables ...';
    hPrg.Status2 := gj_import_rscstr.cTXT0000014;
    Application.ProcessMessages;
    try
      RaiseEmptyTable(ABatchID);
      ExecuteCommandFmt(
        'BEGIN iqms.gj_import.proc_batch(%d); END;',
        [ABatchID]);
      // Clear the batch records; we're done with them.
      ClearBatch(ABatchID);
    except
      on E: Exception do
        begin
          // Clear the batch records; we're done with them.
          ClearBatch(ABatchID);
          raise;
        end;
    end;
  finally
    if Assigned(hPrg) then
      FreeAndNil(hPrg);
  end;*)
end;

procedure ClearBatch(const ABatchID: Int64);
begin
  if ABatchID > 0 then
    begin
      ExecuteCommandFmt(
        'DELETE FROM gj_import_batch_detail WHERE gj_import_batch_id IS NULL ' +
        'OR gj_import_batch_id = %d',
        [ABatchID]);
      ExecuteCommandFmt(
        'DELETE FROM gj_import_batch WHERE id IS NULL OR id = %d',
        [ABatchID]);
      // FBatchID := 0;
    end;
end;

procedure CheckDeleteObsoleteBatches;
begin
  // Delete any batch that was created 5 or more days ago
  ExecuteCommand(
    'DELETE FROM gj_import_batch WHERE created <= SYSDATE - 5 OR ' +
    'created IS NULL');
end;

{$ENDREGION 'Batch Operations'}

end.
