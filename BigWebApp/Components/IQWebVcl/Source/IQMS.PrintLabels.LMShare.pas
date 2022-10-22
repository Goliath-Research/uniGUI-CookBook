unit IQMS.PrintLabels.LMShare;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniComboBox;

type
  TBeforePrintRec = record
    EQNO: string;
    PressNo: string; // press number
    ProdDate: TDateTime; // production date
  end;

  TOnBeforeMasterLabelInsert = procedure(var ABeforePrintRec: TBeforePrintRec)
    of object;

  TOnAfterMasterLabelInsert = procedure(AMaster_Label_ID: Real) of object;

  TOnGetTotalLabelsCount = procedure(var ACount: Integer) of object;

  TOnBeforePrint = procedure of object;

  TOnBeforeRePrintLabel = procedure( Sender: TObject; AMaster_Label_ID: Real)
    of object;

  TOnCalculateLabelsCount = procedure( Sender: TObject; var ACount: Integer ) of object;

  { TLabelDispositionSetting }
  TLabelDispositionSetting = (ldsSystemDefault, ldsDispositioned,
    ldsNonDispositioned);

  EDimensionalInventoryViolation = class(Exception);


type
  TPrintLMCustomMat = class
      Loc_ID: Real;
      FGMulti_ID: Real;
      AssignDispo_Scan_Y: Boolean;
      ReceiptNo: string;
      Translog_ID: Real;
      OnAfterInsert: TOnAfterMasterLabelInsert;
      OnBeforeRePrintLabel: TOnBeforeRePrintLabel;  {when reprinting allow caller to adjust certian fields}
      Ticket_Dtl_ID: Real;                          {PS Ticket Detail ID for printing shipping labels during bulk repack}
      IsPallet: Boolean;
   end;

const
  LabelDispositionSettingStr: array [TLabelDispositionSetting] of string =
    ('System', 'Dispositioned', 'Non-Dispositioned');

function reassign_label_to_original_on_reprint(var ALM_Labels_ID: Real;
  APrintExist_Master_Label_ID: Real): Boolean;
function use_original_label_on_reprint: Boolean;

// Label Disposition Setting methods
procedure LoadLabelDispositionSettingComboBox(AComboBox: TUniComboBox);
function GetLabelDispositionSettingComboBox(AComboBox: TUniComboBox)
  : TLabelDispositionSetting;

// Get System Parameter settings
// Print all Purchased labels as 'Dispositioned'.  If true, then
// purchased labels are marked Dispo_Scan=Y.
function IsPurchasedLabelDispoY: Boolean;
// Print all Manufactured labels as 'Dispositioned'.  If true, then
// manufactured labels are marked Dispo_Scan=Y.
function IsManufacturedLabelDispoY: Boolean;

// Get the label type for this master label record
function GetMasterLabelType(const AMasterLabelID: Real): string;

function IsMissingMandatoryDimensionalInventoryData( AArinvt_ID: Real; var ADimensionName: string ): Boolean;

function GetLMDirectory: string;
procedure ConfigureLabelMatrixDBFConnection(var AConnection: TFDConnection);

type
  TLMCreateDBF = class(TComponent)
    private
      FDBFDirectory: string;
      FLabelFileName: string;
      FFileName: string;
      FDBFConnection: TFDConnection;
      procedure CheckRequiredFiles;
      function GetDBFConnection: TFDConnection;
    public
      constructor Create(AOwner: TComponent);
      destructor Destroy; override;
      class procedure CreateEmptyDbfFile(ALMLabelsID: Int64; AConfirmOverwrite: Boolean; ALabelFileName: string = '');
      procedure Execute(ALMLabelsID: Int64; AConfirmOverwrite: Boolean; ALabelFileName: string = '');
      property FileName: string read FFileName;
      property LabelFileName: string read FLabelFileName;
  end;

var
  BypassChangingLabelToOriginal: Boolean;
  ForcedLM_Lables_ID: Integer = 0;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  System.Variants,
  IQMS.Common.FileUtils,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.ResourceStrings;

function reassign_label_to_original_on_reprint(var ALM_Labels_ID: Real;
  APrintExist_Master_Label_ID: Real): Boolean;
const
  cLABELS_REPRINT = 'LABELS_REPRINT';
var
  AOriginal_LM_Labels_ID: Real;
begin
  Result := FALSE;

  if BypassChangingLabelToOriginal then
    // 11-07-2008 used in IQRF reprint ship labels event
    EXIT;

  { check not applicable }
  if APrintExist_Master_Label_ID = 0 then
    EXIT;

  { check not applicable }
  // if SelectValueAsString('select lm_use_original_on_reprint from iqsys') <> 'Y' then
  if not use_original_label_on_reprint() then
    EXIT;

  { get original label id }
  AOriginal_LM_Labels_ID :=
    SelectValueFmtAsFloat('select lm_labels_id from master_label where id = %f',
    [APrintExist_Master_Label_ID]);
  if AOriginal_LM_Labels_ID = 0 then
    begin
      { original label is not assigned }
      ExecuteCommandFmt(
        'insert into eventlog( event_time, userid, text, class ) values ( sysdate, ''%s'', ''%s'', ''%s'')',
        [SecurityManager.UserName,
        Format('Serial # %s - original lm label id is not assigned',
        [SelectValueFmtAsString('select serial from master_label where id = %f',
        [APrintExist_Master_Label_ID])]),
        cLABELS_REPRINT]);
      EXIT;
    end;

  if SelectValueFmtAsFloat('select 1 from lm_labels where id = %f',
    [AOriginal_LM_Labels_ID]) = 0 then
    begin
      { original label is not available }
      ExecuteCommandFmt(
        'insert into eventlog( event_time, userid, text, class ) values ( sysdate, ''%s'', ''%s'', ''%s'')',
        [SecurityManager.UserName,
        Format('Serial # %s - original lm label id %.0f is not available',
        [SelectValueFmtAsString('select serial from master_label where id = %f',
        [APrintExist_Master_Label_ID]),
        AOriginal_LM_Labels_ID]),
        cLABELS_REPRINT]);
      EXIT;
    end;

  { reassign the label }
  ALM_Labels_ID := AOriginal_LM_Labels_ID;
  Result := TRUE;
end;

function use_original_label_on_reprint: Boolean;
begin
  Result := SelectValueAsString('select lm_use_original_on_reprint from iqsys') = 'Y';
end;

procedure LoadLabelDispositionSettingComboBox(AComboBox: TUniComboBox);
var
  o: TLabelDispositionSetting;
begin
  if Assigned(AComboBox) then
    try
      AComboBox.Items.BeginUpdate;
      AComboBox.Items.Clear;
      for o := low(TLabelDispositionSetting)
        to high(TLabelDispositionSetting) do
        AComboBox.Items.Add(LabelDispositionSettingStr[o]);
    finally
      AComboBox.Items.EndUpdate;
    end;
end;

function GetLabelDispositionSettingComboBox(AComboBox: TUniComboBox)
  : TLabelDispositionSetting;
begin
  Result := TLabelDispositionSetting(0);
  if Assigned(AComboBox) then
    begin
      if (AComboBox.ItemIndex in [Ord( low(TLabelDispositionSetting))
        .. Ord( high(TLabelDispositionSetting))]) then
        Result := TLabelDispositionSetting(AComboBox.ItemIndex);
    end;
end;

// Print all Purchased labels as 'Dispositioned'
function IsPurchasedLabelDispoY: Boolean;
begin
  Result := SelectValueAsString('SELECT master_label_on_insert_dispo_y FROM params ' +
    'WHERE ROWNUM < 2') = 'Y';
end;

// Print all Manufactured labels as 'Dispositioned'
function IsManufacturedLabelDispoY: Boolean;
begin
  Result := SelectValueAsString('SELECT mstrlbl_ins_manu_dispo_y FROM params ' +
    'WHERE ROWNUM < 2') = 'Y';
end;

function GetMasterLabelType(const AMasterLabelID: Real): string;
begin
  Result := SelectValueFmtAsString('SELECT a.label_type ' +
    'FROM lm_labels a, master_label b WHERE b.id = %.0f AND ' +
    'a.id = b.lm_labels_id', [AMasterLabelID]);
end;

function IsMissingMandatoryDimensionalInventoryData( AArinvt_ID: Real; var ADimensionName: string ): Boolean;
var
  A: Variant;
begin
  ADimensionName:= '';
  A:= SelectValueArrayFmt( 'select d.id, d.name             '+
                      '  from arinvt a,                '+
                      '       arinvt_class c,          '+
                      '       arinvt_class_dim d,      '+
                      '       gtt_master_label_dim x   '+
                      ' where a.id = %f                '+
                      '   and a.class = c.class        '+
                      '   and c.mandatory_dim = ''Y''  '+
                      '   and c.id = d.arinvt_class_id '+
                      '   and d.name = x.name          '+
                      '   and x.nvalue is null         ',  // 12-05-2014 EIQ-5223 SER# 06231 - SIC Dimensional Characteristics - Allow 0 Value on Mandatory Field
                      [ AArinvt_ID ]);
  Result:= VarArrayDimCount( A ) > 0;

  if Result then
     ADimensionName:= A[ 1 ];
end;

function GetLMDirectory: string;
begin
  Result := IncludeTrailingPathDelimiter(
    SelectValueAsString('select LM_DIRECTORY from PARAMS'));
end;

procedure ConfigureLabelMatrixDBFConnection(var AConnection: TFDConnection);
begin
  if Assigned(AConnection) then
  begin
    AConnection.Params.Clear;
    // See the following for documentation on how to configure the connection:
    // http://docwiki.embarcadero.com/RADStudio/Berlin/en/Connect_to_Advantage_Database_Server_(FireDAC)
    AConnection.Params.Add('DriverID=ADS');
    AConnection.Params.Add(Format('Database=%s', [GetLMDirectory]));
    AConnection.Params.Add('ServerTypes=Local');
    AConnection.Params.Add('TableType=CDX'); // CDX, VFP
  end;
end;

{$REGION 'TLMCreateDBF' }

constructor TLMCreateDBF.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

class procedure TLMCreateDBF.CreateEmptyDbfFile(ALMLabelsID: Int64;
  AConfirmOverwrite: Boolean; ALabelFileName: string);
begin
  with TLMCreateDBF.Create(nil) do
  try
    Execute(ALMLabelsID, AConfirmOverwrite, ALabelFileName);
  finally
    Free;
  end;
end;

procedure TLMCreateDBF.CheckRequiredFiles;
begin
  IQAssert(
    FileExists(IQMS.Common.Miscellaneous.IQGetLocalHomePath + 'ace32.dll'),
    'Required DLL, ace32.dll, not found.');

  IQAssert(
    FileExists(IQMS.Common.Miscellaneous.IQGetLocalHomePath + 'adsloc32.dll'),
    'Required DLL, adsloc32.dll, not found.');

  IQAssert(
    FileExists(IQMS.Common.Miscellaneous.IQGetLocalHomePath + 'aicu32.dll'),
    'Required DLL, aicu32.dll, not found.');

  IQAssert(
    FileExists(IQMS.Common.Miscellaneous.IQGetLocalHomePath + 'axcws32.dll'),
    'Required DLL, axcws32.dll, not found.');

end;

destructor TLMCreateDBF.Destroy;
begin
  if Assigned(FDBFConnection) then
    FreeAndNil(FDBFConnection);
  inherited Destroy;
end;

function TLMCreateDBF.GetDBFConnection: TFDConnection;
begin
  if not Assigned(FDBFConnection) then
    FDBFConnection := TFDConnection.Create(nil);
  ConfigureLabelMatrixDBFConnection(FDBFConnection);
  Result := FDBFConnection;
end;

procedure TLMCreateDBF.Execute(ALMLabelsID: Int64; AConfirmOverwrite: Boolean;
  ALabelFileName: string);
var
  FDBFConnection: TFDConnection;
  ALabelType: string;
  ALMDetailQuery: TFDQuery;
  ATable: TFDTable;
begin
  if ALMLabelsID = 0 then
    EXIT;

  CheckRequiredFiles;

  // Get basic, top-level label information
  with TFDQuery.Create(nil) do
    try
      ConnectionName := 'IQFD';
      SQL.Add('SELECT label_file,');
      SQL.Add('       label_type');
      SQL.Add('  FROM lm_labels');
      SQL.Add(Format(' WHERE id = %d', [ALMLabelsID]));
      Open;
      if not (Bof and Eof) then
      begin
        FLabelFileName := Fields[0].AsString;
        ALabelType := Fields[1].AsString;
      end
      else
        raise Exception.Create('Label not found.');
    finally
      Free;
    end;

  // If overriding the default label file name, assign it here.
  if ALabelFileName > '' then
    FLabelFileName := ALabelFileName;

  // Assign private fields
  FDBFDirectory := GetLMDirectory;
  FFileName := FDBFDirectory + FLabelFileName;

  if FileExists(FFileName) then
  begin
    if AConfirmOverwrite and
    // IQMS.WebVcl.ResourceStrings.cTXT0000141 =
    // 'Do you wish to overwrite the existing template?'
      not IQConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000141) then
      EXIT;
    DeleteFile(FFileName);
  end;

  // Notes:
  // This page discusses "create table" syntax:
  // https://devzone.advantagedatabase.com/dz/webhelp/Advantage9.0/supported_statements/create_table.htm
  //
  // See the following for supported data types:
  // https://devzone.advantagedatabase.com/dz/webhelp/Advantage9.0/supported_statements/supported_data_types_in_the_advantage_sql_engine.htm
  // https://devzone.advantagedatabase.com/dz/webhelp/Advantage9.0/server1/adt_field_types_and_specifications.htm

  ALMDetailQuery := TFDQuery.Create(nil);
  try
    ALMDetailQuery.ConnectionName := 'IQFD';
    ALMDetailQuery.SQL.Add('  SELECT field_name,');
    ALMDetailQuery.SQL.Add('         field_type,');
    ALMDetailQuery.SQL.Add('         width,');
    ALMDetailQuery.SQL.Add('         dec,');
    ALMDetailQuery.SQL.Add('         act_width');
    ALMDetailQuery.SQL.Add('    FROM lm_labels_detail');
    ALMDetailQuery.SQL.Add(Format('   WHERE lm_labels_id = %d', [ALMLabelsID]));
    ALMDetailQuery.SQL.Add('ORDER BY field_name');
    ALMDetailQuery.Open;

    // Validation
    if ALMDetailQuery.Bof and ALMDetailQuery.Eof then
      // IQMS.WebVcl.ResourceStrings.cTXT0000115 =
      // 'Incomplete Label Information.  ' + #13 +
      // 'Please execute the Create DBF File option ' +
      // '(when positioned on that label) in the Label Maintenance form.'
      raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000115);

    with TFDCommand.Create(nil) do
      try
        Connection := GetDBFConnection;
        Connection.Connected := TRUE;
        CommandText.Add(Format('CREATE TABLE %s ', [FileNameNoExt(FLabelFileName)]));
        CommandText.Add('(');
        while not ALMDetailQuery.Eof do
        begin
          if (ALMDetailQuery.FieldByName('FIELD_TYPE').AsString = 'Character') then
            CommandText.Add(Format('%s Char(%d),',
              [ALMDetailQuery.FieldByName('FIELD_NAME').AsString,
              // TblLabelsDtl.FieldByName('FIELD_TYPE').asString,
              ALMDetailQuery.FieldByName('WIDTH').asInteger]))
          else if (ALMDetailQuery.FieldByName('FIELD_TYPE').AsString = 'Numeric') then
            CommandText.Add(Format('%s Numeric(%d, %d),',
              [ALMDetailQuery.FieldByName('FIELD_NAME').AsString,
              // TblLabelsDtl.FieldByName('FIELD_TYPE').asString,
              ALMDetailQuery.FieldByName('WIDTH').asInteger,
              ALMDetailQuery.FieldByName('DEC').asInteger]))
          else if (ALMDetailQuery.FieldByName('FIELD_TYPE').AsString = 'Date') then
            CommandText.Add(Format('%s Date,', [ALMDetailQuery.FieldByName('FIELD_NAME').AsString]))
            // TblLabelsDtl.FieldByName('FIELD_TYPE').asString]));
          else
            CommandText.Add(Format('%s %s,', [ALMDetailQuery.FieldByName('FIELD_NAME').AsString,
              ALMDetailQuery.FieldByName('FIELD_TYPE').AsString]));

          ALMDetailQuery.Next;
        end;
        CommandText[CommandText.Count - 1] := Copy(CommandText[CommandText.Count - 1], 1,
          Length(CommandText[CommandText.Count - 1]) - 1);
        CommandText.Add(')');

        Execute;
      finally
        Free;
      end;

    ALMDetailQuery.First;
    with TFDTable.Create(nil) do
      try
        Connection := GetDBFConnection;
        Connection.Connected := TRUE;
        TableName := FileNameNoExt(FLabelFileName);
        Open;
        Insert;
        while not ALMDetailQuery.Eof do
        begin
          if CompareText(ALMDetailQuery.FieldByName('Field_Type').AsString, 'Character') = 0 then
            FieldByName(ALMDetailQuery.FieldByName('Field_name').AsString).AsString :=
              Repl('X', ALMDetailQuery.FieldByName('Act_width').asInteger)
          else if CompareText(ALMDetailQuery.FieldByName('Field_Type').AsString, 'Numeric') = 0 then
          begin
            if ALMDetailQuery.FieldByName('Dec').asInteger = 0 then
              FieldByName(ALMDetailQuery.FieldByName('Field_name').AsString).AsString :=
                Repl('9', ALMDetailQuery.FieldByName('Act_width').asInteger - 1)
            else
              FieldByName(ALMDetailQuery.FieldByName('Field_name').AsString).AsString :=
                Repl('9', ALMDetailQuery.FieldByName('Act_width').asInteger -
                ALMDetailQuery.FieldByName('Dec').asInteger - 2) +
                FormatSettings.DecimalSeparator +
                Repl('9', ALMDetailQuery.FieldByName('Dec').asInteger);
          end;

          ALMDetailQuery.Next;
        end;
        Post;
      finally
        Free;
      end;
  finally
    if Assigned(ALMDetailQuery) then
      FreeAndNil(ALMDetailQuery);
  end;
end;

{$ENDREGION 'TLMCreateDBF' }

end.
