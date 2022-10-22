unit IQMS.Common.TableSequence;

interface

uses
  Winapi.Windows, System.SysUtils, Winapi.Messages, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Dialogs, Vcl.Forms, System.Variants, Data.DB,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait,
  FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleWrapper, FireDAC.Stan.Intf, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt, FireDAC.DApt.Intf;

{ Contains methods to shift records up or down, based on sequence field. }

procedure MoveUpSequence(ASeqField: TField);
procedure MoveDownSequence(ASeqField: TField);

// Called internally by foregoing methods
// procedure ChangeSequence(ATable: TFDTable;
// ACurrentSeq, ANewSeq: Integer); overload;
procedure ChangeSequence(ADataSet: TDataSet; ATableName: string;
  AMasterIDFieldName: string; ACurrentSeq, ANewSeq: Integer); overload;

// Re-sequences the SEQ numbers, in case there are gaps
// Call it after deleting a record
// procedure ReSequence(ATable: TFDTable); overload;
// You will need to refresh the dataset after this call
procedure ReSequence(ATableName, AMasterFieldName: string;
  AMasterID: Real); overload;

// Resequence using multiple master fields and values.  This is useful
// for source/source_id situations.
procedure ReSequence(ATableName: string; const AMasterFields: array of string;
  const AMasterValues: array of Variant); overload;

implementation

uses
  IQMS.DBTrans.dbtfields,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.DataConst;

function getDataSetValues(const AField: TField; var ADataSet: TDataSet;
  var ATableName, AMasterFieldName: string; var ACurrentSeq: Integer): Boolean;
begin
  // Initialization
  Result := False;
  ADataSet := nil;
  ATableName := '';
  AMasterFieldName := '';
  ACurrentSeq := 0;

  // Validation
  if not Assigned(AField) then
    Exit;
  ACurrentSeq := AField.AsInteger;

  // Get the dataset
  ADataSet := AField.DataSet;
  if not Assigned(ADataSet) then
    Exit;

  if ADataSet is TFDTable then
  begin
    ATableName := TFDTable(ADataSet).TableName;
    if TFDTable(ADataSet).MasterSource <> nil then
    begin
      // yes, has a master dataset
      if IQMS.Common.StringUtils.NumToken(TFDTable(ADataSet).IndexFieldNames,
        ';') > 0 then
        AMasterFieldName :=
          IQMS.Common.StringUtils.GetToken(TFDTable(ADataSet).IndexFieldNames, ';', 1)
      else
        AMasterFieldName := TFDTable(ADataSet).IndexFieldNames;
    end;
  end
  else if ADataSet is TFDQuery then
  begin
    ATableName := TFDQuery(ADataSet).UpdateOptions.UpdateTableName;
    if TFDQuery(ADataSet).MasterSource <> nil then
    begin
      // yes, has a master dataset
      if IQMS.Common.StringUtils.NumToken(TFDQuery(ADataSet).IndexFieldNames,
        ';') > 0 then
        AMasterFieldName :=
          IQMS.Common.StringUtils.GetToken(TFDQuery(ADataSet).IndexFieldNames, ';', 1)
      else
        AMasterFieldName := TFDQuery(ADataSet).IndexFieldNames;
    end;
  end;
  Result := not IQMS.Common.StringUtils.IsEmpty(ATableName) and
    not IQMS.Common.StringUtils.IsEmpty(AMasterFieldName);
end;

{ ---------------------------------------------------------------------------- }
{ ** TIntegerField ** }
{ ---------------------------------------------------------------------------- }

procedure MoveUpSequence(ASeqField: TField);
var
  ADataSet: TDataSet;
  ATableName, AMasterFieldName: string;
  ACurrentSeq: Integer;
begin
  if (IsIntegerFieldType(ASeqField) or
    IsFloatFieldType(ASeqField)) and
    getDataSetValues(ASeqField, ADataSet, ATableName, AMasterFieldName,
    ACurrentSeq) then
    ChangeSequence(ADataSet, ATableName, AMasterFieldName, ACurrentSeq,
      Succ(ACurrentSeq));
end;

procedure MoveDownSequence(ASeqField: TField);
var
  ADataSet: TDataSet;
  ATableName, AMasterFieldName: string;
  ACurrentSeq: Integer;
begin
  if (IsIntegerFieldType(ASeqField) or
    IsFloatFieldType(ASeqField)) and
    getDataSetValues(ASeqField, ADataSet, ATableName, AMasterFieldName,
    ACurrentSeq) then
    ChangeSequence(ADataSet, ATableName, AMasterFieldName, ACurrentSeq,
      Pred(ACurrentSeq));
end;

{ ---------------------------------------------------------------------------- }
{ ** Sequence Methods ** }
{ ---------------------------------------------------------------------------- }

procedure ChangeSequence(ADataSet: TDataSet; ATableName: string;
  AMasterIDFieldName: string; ACurrentSeq, ANewSeq: Integer);
var
  i, AInterval, AMaxSeq, ATempSeq: Integer;
  AID: UInt64;
  AMasterID: UInt64;
  AHasMaster: Boolean;
  AField: TField;
  AWhere, AFieldName, AFieldValue: string;
  AMasterFieldList: TStringList;
begin
  // NOTE:  Do not use PL-SQL in this routine, since it is also used
  // with Jet SQL (Microsoft Access)

  AWhere := '';
  AField := nil;
  AMasterID := 0; // initial

  if ADataSet = nil then
    Exit;

  if ADataSet.FindField('ID') = nil then
    raise Exception.Create('Application Error:  Field ID required.');

  if ADataSet.FindField('SEQ') = nil then
    raise Exception.Create('Application Error:  Field SEQ required.');

  if ATableName = '' then
    raise Exception.Create('Application Error:  Table name required.');

  if (ACurrentSeq = ANewSeq) or
    (ANewSeq < 1) then
    Exit;

  AID := ADataSet.FieldByName('ID').AsLargeInt;
  if AID = 0 then
    Exit;

  AHasMaster := AMasterIDFieldName > '';
  if AMasterIDFieldName = '' then
    AMasterIDFieldName := 'ID';
  // if AHasMaster then
  // AMasterID := ADataSet.FieldByName(AMasterIDFieldName).AsFloat;

  AMasterFieldList := TStringList.Create;
  try
    IQMS.Common.StringUtils.StrToStringList(AMasterIDFieldName, AMasterFieldList);

    if AHasMaster then
    begin
      for i := 0 to AMasterFieldList.Count - 1 do
      begin
        AFieldName := AMasterFieldList.Strings[i];
        AField := ADataSet.FindField(AFieldName);

        if (AField = nil) then
          raise Exception.CreateFmt
            ('Application Error:  Master ID field, %s, not found.',
            [AFieldName]);

        // AFieldValue := ADataSet.FieldByName(AFieldName).AsString;
        AFieldValue := GetFormattedDataAsString(AField);
        if AFieldValue = 'NULL' then
          AFieldValue := Format('%s is NULL', [AFieldName, AFieldValue])
        else
          AFieldValue := Format('%s = %s', [AFieldName, AFieldValue]);

        // Master ID = 0? Prevent faulty conditions
        if AFieldValue = '0' then
          Exit;

        if AWhere > '' then
          AWhere := AWhere + ' AND'#13 + AFieldValue
        else
          AWhere := AFieldValue;
      end;

      if AWhere > '' then
        AWhere := '(' + AWhere + ')';
    end;

    // Prevent faulty conditions
    // if (AHasMaster and (AMasterID = 0)) or (AID = 0) then Exit;

    // Get comparison values
    if AHasMaster then
      AMaxSeq := SelectValueFmtAsInteger(
        'SELECT MAX(seq) FROM %s WHERE %s',
        [LowerCase(ATableName), AWhere])
    else
      AMaxSeq := SelectValueFmtAsInteger(
        'SELECT MAX(seq) FROM %s',
        [LowerCase(ATableName)]);

    if (ANewSeq > AMaxSeq) then
      Exit;
    AInterval := ACurrentSeq - ANewSeq; //

    // Fix any anomolies that may occur
    with TFDQuery.Create(nil) do
      try
        ConnectionName := cnstFDConnectionName;
        // Fix sequences below the current sequence
        if AHasMaster then
        begin
          SQL.Add(       '  SELECT id, seq      ');
          SQL.Add(Format('    FROM %s           ', [LowerCase(ATableName)]));
          SQL.Add(Format('   WHERE seq < %d AND ', [ACurrentSeq]));
          SQL.Add(Format('         %s           ', [AWhere]));
          SQL.Add(       'ORDER BY seq          ');
        end
        else
        begin
          SQL.Add(       '  SELECT id, seq    ');
          SQL.Add(Format('    FROM %s         ', [LowerCase(ATableName)]));
          SQL.Add(Format('   WHERE seq < %d   ', [ACurrentSeq]));
          SQL.Add(       'ORDER BY seq        ');
        end;
        Open;
        First;
        ATempSeq := 0;
        while not EOF do
        begin
          Inc(ATempSeq);
          ExecuteCommandFmt(
            'UPDATE %s SET seq = %d WHERE id = %d',
            [LowerCase(ATableName),
            ATempSeq,
            FieldByName('ID').AsInteger]);
          Next;
        end;

        Close;
        SQL.Clear;

        // Fix sequences above the current sequence
        if AHasMaster then
        begin
          SQL.Add(       '  SELECT id, seq      ');
          SQL.Add(Format('    FROM %s           ', [LowerCase(ATableName)]));
          SQL.Add(Format('   WHERE seq > %d AND ', [ACurrentSeq]));
          SQL.Add(Format('         %s           ', [AWhere]));
          SQL.Add(       'ORDER BY seq          ');
        end
        else
        begin
          SQL.Add(       '  SELECT id, seq  ');
          SQL.Add(Format('    FROM %s       ', [LowerCase(ATableName)]));
          SQL.Add(Format('   WHERE seq > %d ', [ACurrentSeq]));
          SQL.Add(       'ORDER BY seq      ');
        end;
        Open;
        First;
        ATempSeq := ACurrentSeq;
        while not EOF do
        begin
          Inc(ATempSeq);
          ExecuteCommandFmt(
            'UPDATE %s SET seq = %d WHERE id = %d',
            [LowerCase(ATableName),
            ATempSeq,
            FieldByName('ID').AsLargeInt]);
          Next;
        end;
      finally
        Free; // free the query
      end;

    // Move the sequence
    if (ANewSeq < ACurrentSeq) and (AInterval > 0) then // Move Down
    begin
      if AHasMaster then
      begin
        ExecuteCommandFmt(
          'UPDATE %s            '#13 +
          '   SET seq=%d        '#13 +
          ' WHERE seq=%d AND    '#13 +
          '       %s            ',
          [LowerCase(ATableName),
          ACurrentSeq,
          ANewSeq,
          AWhere]);
        ExecuteCommandFmt(
          'UPDATE %s SET seq=%d WHERE id=%d',
          [LowerCase(ATableName),
          ANewSeq,
          AID]);
      end
      else
      begin
        ExecuteCommandFmt(
          'UPDATE %s SET seq=%d WHERE seq=%d',
          [LowerCase(ATableName), ACurrentSeq, ANewSeq]);
        ExecuteCommandFmt(
          'UPDATE %s SET seq=%d WHERE id=%d',
          [LowerCase(ATableName), ANewSeq, AID]);
      end;
    end
    else if (ANewSeq > ACurrentSeq) and (AInterval < 0) then // Move Up
    begin
      if AHasMaster then
      begin
        ExecuteCommandFmt(
          'UPDATE %s          '#13 +
          '   SET seq=%d      '#13 +
          ' WHERE seq=%d AND  '#13 +
          '       %s          ',
          [LowerCase(ATableName),
          ACurrentSeq,
          ANewSeq,
          AWhere]);
        ExecuteCommandFmt(
          'UPDATE %s SET seq=%d WHERE id=%d',
          [LowerCase(ATableName), ANewSeq, AID]);
      end
      else
      begin
        ExecuteCommandFmt(
          'UPDATE %s SET seq=%d WHERE seq=%d',
          [LowerCase(ATableName),
          ACurrentSeq,
          ANewSeq]);
        ExecuteCommandFmt(
          'UPDATE %s SET seq=%d WHERE id=%d',
          [LowerCase(ATableName),
          ANewSeq,
          AID]);
      end;
    end;
  finally
    FreeAndNil(AMasterFieldList);
  end;

  // Refresh
  with ADataSet do
  begin
    DisableControls;
    try
      // Although Refresh would be better, sometimes "Record/Key deleted" errors
      // can appear when we try to locate the new record.
      Close;
      Open;
      Locate('ID', AID, []);
    finally
      EnableControls;
    end;
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure ReSequence(ATableName, AMasterFieldName: string; AMasterID: Real);
var
  ANewSeq: Integer;
begin
  // required fields: ID and SEQ

  // 06/13/2008
  if (ATableName = '') then
    Exit;

  // 06/13/2008 If we are expected to update records with a master field ID,
  // but the field value is 0, then exit early.
  if (AMasterFieldName > '') and (AMasterID = 0) then
    Exit;

  with TFDQuery.Create(nil) do
    try
      ConnectionName := cnstFDConnectionName;
      if (AMasterFieldName > '') then
        SQL.Add(Format('SELECT id FROM %s WHERE %s = %.0f ORDER BY seq, id',
          [ATableName, AMasterFieldName, AMasterID]))
      else
        SQL.Add(Format('SELECT id FROM %s ORDER BY seq, id', [ATableName]));
      Open;
      ANewSeq := 1;
      while not EOF do
      begin
        ExecuteCommandFmt('UPDATE %s SET seq = %d WHERE id = %.0f',
          [ATableName, ANewSeq, FieldByName('ID').AsFloat]);
        Inc(ANewSeq);
        Next;
      end;
    finally
      Free;
    end;
end;

procedure ReSequence(ATableName: string; const AMasterFields: array of string;
  const AMasterValues: array of Variant);
var
  ANewSeq: Integer;
  i: Integer;
  AWhereList: TStringList;
  AWhere, AFieldName, AFieldValue, AFieldWhere: string;
begin
  // required fields: ID and SEQ

  // 06/13/2008
  if (ATableName = '') then
    Exit;

  if high(AMasterFields) <> high(AMasterValues) then
    raise Exception.Create('Application Error: inconsistent array counts ' +
      'in call to resequence method.');

  AWhereList := TStringList.Create;
  try
    AWhere := '';
    for i := low(AMasterFields) to high(AMasterFields) do
    begin
      // get the field and value as strings
      AFieldName := AMasterFields[i];
      if System.Variants.VarIsNull(AMasterValues[i]) then
        AFieldValue := 'NULL'
      else
        AFieldValue := System.Variants.VarToStr(AMasterValues[i]);
      if AFieldValue = '' then
        AFieldValue := 'NULL';
      // get the where section for this field and value
      if AFieldValue = 'NULL' then
        AFieldWhere := Format('%s is NULL', [AFieldName, AFieldValue])
      else if System.Variants.VarIsStr(AMasterValues[i]) then
        AFieldWhere := Format('%s = ''%s''', [AFieldName, AFieldValue])
      else
        AFieldWhere := Format('%s = %s', [AFieldName, AFieldValue]);
      // append to where clause
      if AWhere > '' then
        AWhere := AWhere + ' AND'#13 + AFieldWhere
      else
        AWhere := AFieldWhere;
    end;
  finally
    FreeAndNil(AWhereList);
  end;

  // Update the sequences
  with TFDQuery.Create(nil) do
    try
      ConnectionName := cnstFDConnectionName;
      if (AWhere > '') then
        SQL.Add(Format('SELECT id FROM %s WHERE %s ORDER BY seq, id',
          [ATableName, AWhere]))
      else
        SQL.Add(Format('SELECT id FROM %s ORDER BY seq, id', [ATableName]));
      Open;
      ANewSeq := 1;
      while not EOF do
      begin
        ExecuteCommandFmt('UPDATE %s SET seq = %d WHERE id = %d',
          [ATableName, ANewSeq, Fields[0].AsInteger]);
        Inc(ANewSeq);
        Next;
      end;
    finally
      Free;
    end;
end;

end.
