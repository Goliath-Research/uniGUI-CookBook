unit IQMS.Data.Lib;

interface

uses
  SysUtils, FireDAC.Comp.Client, Classes, Data.DB, MaskUtils, IQMS.Common.StringUtils;


function FormatTelephoneText(Text: String; AApplyUSAMask: Boolean): String;



procedure CheckCustomRequiredFields(DataSet: TDataSet);

/// <summary> Get the next ID for the given table. </summary>
function GetNextID(const ATableName: string): UInt64;

procedure IQAssignNewID(Field: TField; const TblName:string ); overload;
procedure IQAssignIDBeforePost( DataSet: TDataset; ATableName: string = '' );
function IQSetTablesActive(const SetActive: Boolean; Owner: TComponent): Boolean;


/// <summary></summary>
function SelectValue(const ASQL: string): Variant;


implementation

uses
  IQMS.Common.ResStrings, MainModule;


function FormatTelephoneText(Text: String; AApplyUSAMask: Boolean): String;
const
  USA_PHONE_MASKS: array [Boolean, 9..12] of string =
    ( ('999-9999;0;', '999-999-9999;0;',   '\+9 999-999-9999;0;',   '9 \+9 999-999-9999;0;'),
      ('999-9999;0;', '(999) 999-9999;0;', '\+9 (999) 999-9999;0;', '9 \+9 (999) 999-9999;0;') );

var
  MaskIndex: integer;
  Digits, Mask: String;
  HasParen: Boolean;
begin
  // default
  Result := Text;

  // this is only for formatting US phones numbers
  if not AApplyUSAMask then
    Exit;

  Digits := Numerics(Text); // strip down to only digits

  // A valid range of numbers, accounting for different countries,
  // is 7 to 11.  An additional digit may be included which is a
  // local network switch to obtain an outside line, bringing the
  // count to 12 or more.
  MaskIndex := Digits.Length;
  if MaskIndex in [7, 10..12] then
  begin
    if MaskIndex = 7 then
      MaskIndex := 9;

    HasParen := Text.Contains('(') or Text.Contains(')');
    Mask := USA_PHONE_MASKS[HasParen][MaskIndex];
    Result := FormatMaskText(Mask, Digits); // apply format

    // if the new length is less than the original length, then something went wrong when we applied the mask
    if Length(Result) < Digits.Length then
      Result := Text;
  end;
end;

procedure CheckCustomRequiredFields(DataSet: TDataSet);
var
  i: Integer;
begin
  // TODO -c3rdBucket: review if this is still necessary.
  // 10-29-2013 EIQ-1229: Inventory - failing to enter data in mandatory fields causes record to be lost CRM # 849727
  for i := 0 to DataSet.Fields.Count - 1 do
    with DataSet.Fields[i] do
      if Required and (ConstraintErrorMessage <> '') and (not ReadOnly) and (FieldKind = fkData) and IsNull then
        raise Exception.Create(ConstraintErrorMessage);
end;

function GetNextID(const ATableName: string): UInt64;
var
  AConnection: TFDConnection;
  AUseTableName, ASequenceName:String;
begin
  // Initialize
  AUseTableName := ATableName;

  if (ATableName = '') then
    // Do not translate and do not wrap text.  This is for programmers.
    raise Exception.Create(
      'Application Error:  Cannot retrieve sequence.  Empty table name passed to function.');

  // Get the correct connection
  AConnection := UniMainModule.FDConnection1;

  if Pos('IQMS.', AUseTableName ) > 0 then
     AUseTableName:= Trim(Copy(AUseTableName, 6, Length(ATableName)-5));

  ASequenceName := LowerCase('s_' + AUseTableName);

  repeat
    Result := AConnection.ExecSQLScalar(Format('SELECT %s.NextVal AS newid FROM DUAL', [ASequenceName]));

    if CompareText(AUseTableName, 'MASTER_LABEL') <> 0 then
      Break;

    // A foreign label 12345 that was assigned to some master_label
    // record will cause unique constraint error when master_label
    // trigger will attempt to propagate this ID 12345 to Serial 12345
    if AConnection.ExecSQLScalar( Format( 'SELECT master_label_misc.id_to_serial_exists(%.0f) FROM DUAL', [Result])) <> 1 then
      Break;  // good

  until False;
end;

procedure IQAssignNewID(Field: TField; const TblName:string );
begin
  if Field.IsNull or (Field.Value = 0) then
     Field.Value := GetNextID(TblName);
end;

procedure IQAssignIDBeforePost( DataSet: TDataset; ATableName: string = '' );
var
  IDfield, MirrirIdField  :TField;
  TableName:String;
begin
  IDfield:= DataSet.FindField('ID');
  if ATableName > '' then
     TableName:= ATableName
  else if DataSet is TFDTable then
     TableName:= TFDTable(DataSet).TableName
  else if DataSet is TFDQuery then
     TableName:= TFDQuery(DataSet).UpdateOptions.UpdateTableName
  else
     raise Exception.Create('Unknown table name - unable to execute IQAssignIDBeforePost');

  if IDfield <> nil then
  begin
     IQAssignNewID( TFloatField( IDfield ), TableName );
  end;

  CheckCustomRequiredFields( DataSet );    // 10-29-2013 EIQ-1229: Inventory - failing to enter data in mandatory fields causes record to be lost CRM # 849727
end;



function IQSetTablesActive(const SetActive: Boolean; Owner: TComponent): Boolean;
var
  i: Integer;
begin
  if not Assigned(Owner) then
    Exit;

  for i := 0 to Owner.ComponentCount - 1 do
    if Owner.Components[i] is TDataSet then
      TDataSet(Owner.Components[i]).Active := SetActive;
end;


function SelectValue(const ASQL: string): Variant;
begin
  Result := UniMainModule.FDConnection1.ExecSQLScalar(ASQL);
end;

end.
