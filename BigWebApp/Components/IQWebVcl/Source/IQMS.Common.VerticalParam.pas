unit IQMS.Common.VerticalParam;

(* *****************************************************************************
  ***                        Vertical Parameters                             ***
  *                                                                            *
  *  This unit contains a component for storing and retrieving settings,       *
  *  stored as table records, rather than table fields.  Storing options       *
  *  and parameters "vertically," instead of "horizontally" allows for         *
  *  greater flexibility if different parent records require a completely      *
  *  different set of values.
  *                                                                            *
  *  Table must take the following structure:                                  *
  *     ID          NUMBER (Primary Key)                                       *
  *     CODE        VARCHAR2                                                   *
  *     VALUE       VARCHAR2                                                   *
  *     DISPLAYNAME VARCHAR2                                                   *
  *                                                                            *
  *  Example data:                                                             *
  *   ID   CODE               VALUE                   DISPLAYNAME              *
  *   ----------------------------------------------------------------------   *
  *   213  TRANSACTION_TYPE   0                       Transaction Type         *
  *   214  PROCESSING_CLASS   1                       Processing Class         *
  *   215  TEST_ACCOUNT       Y                       Test Account             *
  *   216  LOGIN_NAME         TEST ACCOUNT            Login Name               *
  *   217  TRANS_KEY          123456                  Transaction Key          *
  *   218  HASH_VALUE                                 Hash Value               *
  *   219  TAX_EXEMPT         N                       Tax Exempt               *
  *                                                                            *
  ***************************************************************************** *)

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Variants, IQMS.Common.Registry,
  IQMS.Common.RegFrm,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Phys,
  FireDAC.Phys.Intf, FireDAC.DatS, FireDAC.DApt, FireDAC.DApt.Intf,
  FireDAC.UI.Intf; //, db_dm;

type
  { Forward declarations }
  TParamList = class;
  TParamDef = class;
  TParamDefs = class;

  { Call back method declarations }
  TOnSetValue = procedure(const ACode, AValue: string) of object;
  TOnGetValues = procedure of object;
  TOnBeforeGetValues = procedure of object;
  TOnAfterRefresh = procedure of object;

  { Options }
  TCustomParamOption = (cpAutoAddSettings,
    // Add a setting, if it doesn't yet exist
    cpErrorNoSettings); // Raise error if no settings are found

  TCustomParamOptions = set of TCustomParamOption;

  { TCustomParams }
  TIQWebCustomParams = class(TComponent)
    private
      { Private declarations }
      FWriteImmediate: Boolean;
      FSavedWriteImmediate: Boolean;
      FOnGetValues: TOnGetValues;
      FOnSetValue: TOnSetValue;
      FTableName: ShortString;
      //FDatabaseName: ShortString;
      FOnBeforeGetValues: TOnBeforeGetValues;
      FOnAfterRefresh: TOnAfterRefresh;
      FOptions: TCustomParamOptions;
      FMasterField: ShortString;
      FMasterFieldValue: string;
      procedure SetWriteImmediate(const Value: Boolean);
      procedure SetOnGetValues(const Value: TOnGetValues);
      procedure SetOnSetValue(const Value: TOnSetValue);
      procedure SetTableName(const Value: ShortString);
      procedure SetBeforeOnGetValues(const Value: TOnBeforeGetValues);
      // procedure SetDatabaseName(const Value: ShortString);
      procedure SetOptions(const Value: TCustomParamOptions);
      procedure SetMasterField(const Value: ShortString);
      procedure SetMasterFieldValue(const Value: string);
      function ConvertStrToUSAFloat(const S: string;
        ADecimals: Integer = 2): string;
    protected
      { Protected declarations }
      FParams: TParamList;

      // This method may be overridden if, for example, you wanted to
      // load additional property values from another table.
      procedure LoadParameters; virtual;

    public
      { Public declarations }
      constructor Create(AOwner: TComponent); virtual;
      destructor Destroy; override;

      procedure Refresh;
      procedure WriteValues;
      procedure WriteChangedValues;
      procedure BeginUpdate;
      procedure EndUpdate;
      procedure GetStrings(AParams: TStrings);

      function ParamByName(ACode: ShortString): TParamDef;

      // Optional, shortcut methods with default values for less coding overhead
      function ValueAsStr(const ACode: ShortString; const ADefault: string = '')
        : string; virtual;
      function ValueAsInt(const ACode: ShortString;
        const ADefault: Integer = 0): Integer;
      function ValueAsDateTime(const ACode: ShortString;
        const ADefault: TDateTime): TDateTime;
      function ValueAsBoolean(const ACode: ShortString;
        const ADefault: Boolean = FALSE): Boolean;
      function ValueAsFloat(const ACode: ShortString;
        const ADefault: Real = 0): Real;
      function ValueAsFloatStr(const ACode: ShortString;
        const ADefault: string = '0.00'; const ADecimals: Integer = 2): string;
      function ValueFormatted(const ACode: string): string;
      property Params: TParamList read FParams;
    published
      { Published declarations }
      // property DatabaseName: ShortString read FDatabaseName write SetDatabaseName;
      property TableName: ShortString read FTableName write SetTableName;
      property MasterField: ShortString read FMasterField write SetMasterField;
      property MasterFieldValue: string read FMasterFieldValue
        write SetMasterFieldValue;

      property Options: TCustomParamOptions read FOptions write SetOptions;
      property OnSetValue: TOnSetValue read FOnSetValue write SetOnSetValue;
      property OnGetValues: TOnGetValues read FOnGetValues write SetOnGetValues;
      property OnBeforeGetValues: TOnBeforeGetValues read FOnBeforeGetValues
        write SetBeforeOnGetValues;
      property OnAfterRefresh: TOnAfterRefresh read FOnAfterRefresh
        write FOnAfterRefresh;
      property WriteImmediate: Boolean read FWriteImmediate
        write SetWriteImmediate;
  end;

  { TSettingsList }
  // TSettingsList = class(TStringList);

  { TParamList }
  TParamList = class(TStringList)
    private
      { Private declarations }
      FParamDefs: TParamDefs;
      FWriteImmediate: Boolean;
      FOnGetValues: TOnGetValues;
      FOnSetValue: TOnSetValue;
      FTableName: ShortString;
      FOnBeforeGetValues: TOnBeforeGetValues;
      // FDatabaseName: ShortString;
      FOptions: TCustomParamOptions;
      FMasterField: ShortString;
      FMasterFieldValue: string;
      procedure SetWriteImmediate(const Value: Boolean);
      procedure SetOnSetValue(const Value: TOnSetValue);
      procedure SetTableName(const Value: ShortString);
      // procedure SetDatabaseName(const Value: ShortString);
      procedure SetOptions(const Value: TCustomParamOptions);
      procedure SetMasterField(const Value: ShortString);
      procedure SetMasterFieldValue(const Value: string);
    public
      { Public declarations }
      constructor Create;
      destructor Destroy; override;
      function Param(const Code: string): TParamDef;
      procedure WriteValues;
      procedure WriteChangedValues;
      procedure AddCodeValuePair(ACode, AValue: string; ADisplayName: string = '');
    protected
      { Protected declarations }
      procedure Update; virtual; { ! }
    published
      { Published declarations }
      //property DatabaseName: ShortString read FDatabaseName write SetDatabaseName;
      property TableName: ShortString read FTableName write SetTableName;
      property MasterField: ShortString read FMasterField write SetMasterField;
      property MasterFieldValue: string read FMasterFieldValue
        write SetMasterFieldValue;

      property Options: TCustomParamOptions read FOptions write SetOptions;
      property WriteImmediate: Boolean read FWriteImmediate
        write SetWriteImmediate;
      property OnSetValue: TOnSetValue read FOnSetValue write SetOnSetValue;
      property OnGetValues: TOnGetValues read FOnGetValues write FOnGetValues;
      property OnBeforeGetValues: TOnBeforeGetValues read FOnBeforeGetValues
        write FOnBeforeGetValues;
  end;

  { TParamDefs }
  TParamDefs = class(TCollection) // TOwnedCollection
    private
      { Private declarations }
      FWriteImmediate: Boolean;
      FOnSetValue: TOnSetValue;
      FTableName: ShortString;
      // FDatabaseName: ShortString;
      FAutoAdd: Boolean;
      FMasterField: ShortString;
      FMasterFieldValue: string;
      function GetItems(index: Integer): TParamDef;
      procedure SetItems(index: Integer; const Value: TParamDef);
      procedure SetWriteImmediate(const Value: Boolean);
      function AddParamDef: TParamDef;
      procedure SetOnSetValue(const Value: TOnSetValue);
      procedure SetTableName(const Value: ShortString);
      // procedure SetDatabaseName(const Value: ShortString);
      procedure SetAutoAdd(const Value: Boolean);
      procedure SetMasterField(const Value: ShortString);
      procedure SetMasterFieldValue(const Value: string);
    public
      { Public declarations }
      function Add(const Code: ShortString; const Value: string): TParamDef;
      function Find(const Code: ShortString): TParamDef;
      property Items[index: Integer]: TParamDef read GetItems
        write SetItems; default;
      function IndexOf(const Code: ShortString): Integer;
    published
      { Published declarations }
      property AutoAdd: Boolean read FAutoAdd write SetAutoAdd;
      // add if setting not found
      // property DatabaseName: ShortString read FDatabaseName write SetDatabaseName;
      property TableName: ShortString read FTableName write SetTableName;
      property MasterField: ShortString read FMasterField write SetMasterField;
      property MasterFieldValue: string read FMasterFieldValue
        write SetMasterFieldValue;
      property WriteImmediate: Boolean read FWriteImmediate
        write SetWriteImmediate;
      property OnSetValue: TOnSetValue read FOnSetValue write SetOnSetValue;
  end;

  { TParamDef }
  TParamDef = class(TCollectionItem)
    private
      { Private declarations }
      FCode: string;
      FValue: string;
      FChanged: Boolean;
      FWriteImmediate: Boolean;
      FOnSetValue: TOnSetValue;
      FTableName: string;
      // FDatabaseName: string;
      FDisplayName: string;
      FAutoAdd: Boolean;
      FMasterField: string;
      FMasterFieldValue: string;
      function GetValue(var AValue: string): Boolean;
      function GetAsBoolean: Boolean;
      function GetAsDateTime: TDateTime;
      function GetAsFloat: Double;
      function GetAsInteger: Longint;
      function GetAsString: string;
      procedure SetAsBoolean(const AValue: Boolean);
      procedure SetAsDateTime(const AValue: TDateTime);
      procedure SetAsFloat(const AValue: Double);
      procedure SetAsInteger(const AValue: Longint);
      procedure SetAsString(const AValue: string);
    protected
      { Protected declarations }
      procedure SetValue(const AValue: string); virtual; { ! }
      procedure DoSetValue(const ACode, AValue: string); virtual;
    public
      { Public declarations }
      property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
      property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
      property AsFloat: Double read GetAsFloat write SetAsFloat;
      property AsInteger: Longint read GetAsInteger write SetAsInteger;
      property AsString: string read GetAsString write SetAsString;
    published
      { Published declarations }
      property AutoAdd: Boolean read FAutoAdd write FAutoAdd;
      // add if setting not found
      property Code: string read FCode write FCode;
      property Value: string read FValue write FValue;
      property DisplayName: string read FDisplayName write FDisplayName;
      // property DatabaseName: string read FDatabaseName write FDatabaseName;
      property TableName: string read FTableName write FTableName;
      property MasterField: string read FMasterField write FMasterField;
      property MasterFieldValue: string read FMasterFieldValue
        write FMasterFieldValue;
      property WriteImmediate: Boolean read FWriteImmediate
        write FWriteImmediate;

      property OnSetValue: TOnSetValue read FOnSetValue write FOnSetValue;
      property Changed: Boolean read FChanged write FChanged;
  end;

implementation

uses
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.StringUtils;

{ TCustomParams }

constructor TIQWebCustomParams.Create(AOwner: TComponent);
begin
  // Initial
  FParams := nil;

  // Create object
  inherited Create(AOwner);

  // Default values
  // FConnection := db_dm.FDConnection;
  FOptions := [cpAutoAddSettings];

  // Create settings object
  FParams := TParamList.Create;

  // Load all parameters at once
  LoadParameters;
end;

destructor TIQWebCustomParams.Destroy;
begin
  if Assigned(FParams) then
    FreeAndNil(FParams);
  inherited Destroy;
end;

procedure TIQWebCustomParams.BeginUpdate;
begin
  FSavedWriteImmediate := WriteImmediate;
  WriteImmediate := FALSE;
end;

procedure TIQWebCustomParams.EndUpdate;
begin
  WriteValues;
  WriteImmediate := FSavedWriteImmediate;
end;

procedure TIQWebCustomParams.GetStrings(AParams: TStrings);
begin
  if Assigned(AParams) then
    AParams.AddStrings(Params);
end;

procedure TIQWebCustomParams.LoadParameters;
begin
  Params.Update;
end;

function TIQWebCustomParams.ParamByName(ACode: ShortString): TParamDef;
begin
  Result := Params.Param(ACode);
end;

procedure TIQWebCustomParams.Refresh;
begin
  LoadParameters;
  if Assigned(FOnAfterRefresh) then
    FOnAfterRefresh;
end;

procedure TIQWebCustomParams.SetWriteImmediate(const Value: Boolean);
begin
  FWriteImmediate := Value;
  Params.WriteImmediate := Value;
end;

procedure TIQWebCustomParams.WriteValues;
begin
  Params.WriteValues;
end;

procedure TIQWebCustomParams.WriteChangedValues;
begin
  Params.WriteChangedValues;
end;

procedure TIQWebCustomParams.SetOnGetValues(const Value: TOnGetValues);
begin
  FOnGetValues := Value;
  if Assigned(Params) then
    Params.OnGetValues := Value;
end;

procedure TIQWebCustomParams.SetOnSetValue(const Value: TOnSetValue);
begin
  FOnSetValue := Value;
  if Assigned(Params) then
    Params.OnSetValue := Value;
end;

procedure TIQWebCustomParams.SetTableName(const Value: ShortString);
begin
  FTableName := Value;
  if Assigned(Params) then
    Params.TableName := Value;
end;

procedure TIQWebCustomParams.SetBeforeOnGetValues(const Value: TOnBeforeGetValues);
begin
  FOnBeforeGetValues := Value;
  if Assigned(Params) then
    Params.OnBeforeGetValues := Value;
end;

//procedure TCustomParams.SetDatabaseName := db_dm.FDConnection;
//begin
//  FConnection := db_dm.FDConnection;
//  if Assigned(Params) then
//    Params.Connection := db_dm.FDConnection;
//end;

procedure TIQWebCustomParams.SetOptions(const Value: TCustomParamOptions);
begin
  FOptions := Value;
  if Assigned(Params) then
    Params.Options := Value;
end;

procedure TIQWebCustomParams.SetMasterField(const Value: ShortString);
begin
  FMasterField := Value;
  if Assigned(Params) then
    Params.MasterField := Value;
end;

procedure TIQWebCustomParams.SetMasterFieldValue(const Value: string);
begin
  FMasterFieldValue := Value;
  if Assigned(Params) then
    Params.MasterFieldValue := Value;
end;

function TIQWebCustomParams.ValueAsStr(const ACode: ShortString;
  const ADefault: string): string;
begin
  if Params.IndexOf(ACode) = - 1 then
    Result := ADefault
  else
    Result := ParamByName(ACode).AsString;
end;

function TIQWebCustomParams.ValueAsBoolean(const ACode: ShortString;
  const ADefault: Boolean): Boolean;
begin
  if Params.IndexOf(ACode) = - 1 then
    Result := ADefault
  else
    Result := ParamByName(ACode).AsBoolean;
end;

function TIQWebCustomParams.ValueAsDateTime(const ACode: ShortString;
  const ADefault: TDateTime): TDateTime;
begin
  if Params.IndexOf(ACode) = - 1 then
    Result := ADefault
  else
    Result := ParamByName(ACode).AsDateTime;
end;

function TIQWebCustomParams.ValueAsFloat(const ACode: ShortString;
  const ADefault: Real): Real;
begin
  if Params.IndexOf(ACode) = - 1 then
    Result := ADefault
  else
    Result := ParamByName(ACode).AsFloat;
end;

function TIQWebCustomParams.ValueAsFloatStr(const ACode: ShortString;
  const ADefault: string; const ADecimals: Integer): string;
var
  R: Double;
  S: string;
begin
  if Params.IndexOf(ACode) = - 1 then
    S := ADefault
  else
    S := ParamByName(ACode).AsString;

  S := StrToStrFloat(S);
  if (S = '') or not System.SysUtils.TryStrToFloat(S, R) then
    Result := ADefault
  else
    Result := ConvertStrToUSAFloat(S, ADecimals);

end;

function TIQWebCustomParams.ValueAsInt(const ACode: ShortString;
  const ADefault: Integer): Integer;
begin
  if Params.IndexOf(ACode) = - 1 then
    Result := ADefault
  else
    Result := ParamByName(ACode).AsInteger;
end;

function TIQWebCustomParams.ValueFormatted(const ACode: string): string;
var
  S: string;
begin
  S := ParamByName(ACode).AsString;
  // Convert "boolean" values
  if S = 'N' then
    S := 'False'
  else if S = 'Y' then
    S := 'True';
  // return formatted
  Result := Format('%s=%s', [ACode, S]);
end;

function TIQWebCustomParams.ConvertStrToUSAFloat(const S: string;
  ADecimals: Integer): string;
var
  AMask: string;
  R: Double;
begin
  // get real
  if not System.SysUtils.TryStrToFloat(S, R) then
    R := 0;
  // get mask
  AMask := '###0';
  if ADecimals > 0 then
    AMask := AMask + '.' + Repl('0', ADecimals);
  // apply mask
  Result := FormatFloat(AMask, R);
end;

{ TParamDefs }

function TParamDefs.Add(const Code: ShortString; const Value: string): TParamDef;
begin
  try
    BeginUpdate;
    Result := AddParamDef;
    Result.Code := Code;
    Result.Value := Value;
    Result.WriteImmediate := Self.WriteImmediate;
    Result.OnSetValue := Self.OnSetValue;
    Result.DisplayName := Code;
    // Result.Connection := db_dm.FDConnection;
    Result.TableName := Self.TableName;
    Result.MasterField := Self.MasterField;
    Result.MasterFieldValue := Self.MasterFieldValue;
    Result.AutoAdd := Self.AutoAdd;
  finally
    EndUpdate;
  end;
end;

function TParamDefs.AddParamDef: TParamDef;
begin
  Result := TParamDef( inherited Add);
end;

function TParamDefs.Find(const Code: ShortString): TParamDef;
var
  I: Integer;
begin
  I := IndexOf(Code);
  if I < 0 then
    Result := nil
  else
    Result := TParamDef(Items[I]);
end;

function TParamDefs.GetItems(index: Integer): TParamDef;
begin
  Result := TParamDef( inherited Items[index]);
end;

function TParamDefs.IndexOf(const Code: ShortString): Integer;
var
  I: Integer;
begin
  I := - 1;
  for I := 0 to Count - 1 do
    if TParamDef(Items[I]).Code = Code then
      begin
        Result := I;
        Break;
      end;
end;

procedure TParamDefs.SetAutoAdd(const Value: Boolean);
var
  I: Integer;
begin
  FAutoAdd := Value;
  for I := 0 to Count - 1 do
    Items[I].AutoAdd := Value;
end;

//procedure TParamDefs.SetDatabaseName
//var
//  I: Integer;
//begin
//  FConnection := db_dm.FDConnection;
//  for I := 0 to Count - 1 do
//    Items[I].Connection := db_dm.FDConnection;
//end;

procedure TParamDefs.SetItems(index: Integer; const Value: TParamDef);
begin
  inherited Items[index] := Value;
end;

procedure TParamDefs.SetMasterField(const Value: ShortString);
var
  I: Integer;
begin
  FMasterField := Value;
  for I := 0 to Count - 1 do
    Items[I].MasterField := Value;
end;

procedure TParamDefs.SetMasterFieldValue(const Value: string);
var
  I: Integer;
begin
  FMasterFieldValue := Value;
  for I := 0 to Count - 1 do
    Items[I].MasterFieldValue := Value;
end;

procedure TParamDefs.SetOnSetValue(const Value: TOnSetValue);
var
  I: Integer;
begin
  FOnSetValue := Value;
  for I := 0 to Count - 1 do
    Items[I].OnSetValue := Value;
end;

procedure TParamDefs.SetTableName(const Value: ShortString);
var
  I: Integer;
begin
  FTableName := Value;
  for I := 0 to Count - 1 do
    Items[I].TableName := Value;
end;

procedure TParamDefs.SetWriteImmediate(const Value: Boolean);
var
  I: Integer;
begin
  FWriteImmediate := Value;
  for I := 0 to Count - 1 do
    Items[I].WriteImmediate := Value;
end;

{ TParamDef }

function TParamDef.GetValue(var AValue: string): Boolean;
begin
  Result := FALSE;
  if (TParamDef(Self) <> nil) then
    try
      AValue := Value;
      Result := True;
    except
      Result := FALSE;
    end;
end;

function TParamDef.GetAsBoolean: Boolean;
var
  S: string;
begin
  S := GetAsString;
  Result := (Length(S) > 0) and (S[1] in ['T', 't', 'Y', 'y']);
end;

function TParamDef.GetAsDateTime: TDateTime;
var
  AValue: string;
begin
  AValue := GetAsString;
  IsStringValidDate(AValue, Result);
end;

function TParamDef.GetAsFloat: Double;
var
  AValue: string;
  R: Double;
begin
  AValue := GetAsString;
  Result := 0;
  if System.SysUtils.TryStrToFloat(AValue, R) then
    Result := R;
end;

function TParamDef.GetAsInteger: Longint;
var
  AValue: string;
begin
  Result := 0;
  AValue := GetAsString;
  System.SysUtils.TryStrToInt(AValue, Result);
end;

function TParamDef.GetAsString: string;
begin
  if not GetValue(Result) then
    Result := '';
end;

procedure TParamDef.SetAsBoolean(const AValue: Boolean);
begin
  SetAsString(BoolToYN(AValue));
end;

procedure TParamDef.SetAsDateTime(const AValue: TDateTime);
begin
  SetAsString(FormatDateTime('ddddd tt', AValue));
end;

procedure TParamDef.SetAsFloat(const AValue: Double);
begin
  SetAsString(FloatToStr(AValue));
end;

procedure TParamDef.SetAsInteger(const AValue: Longint);
begin
  SetAsString(IntToStr(AValue));
end;

procedure TParamDef.SetAsString(const AValue: string);
begin
  if (Self = nil) then
    Exit;

  // if it has changed, then FChanged cant be reverted until written or refreshed.
  if not FChanged then
    FChanged := Value <> AValue;

  Value := AValue;
  if WriteImmediate then
    SetValue(AValue);
end;

procedure TParamDef.SetValue(const AValue: string);
var
  AID: Real;
begin
  // If a method for OnSetValue has been provided, execute it
  if Assigned(FOnSetValue) then
    FOnSetValue(FCode, AValue)
    // Otherwise, execute the default method below
  else
    DoSetValue(FCode, AValue);

  FChanged := FALSE;
end;

procedure TParamDef.DoSetValue(const ACode, AValue: string);
var
  AID: Real;
begin
  if TableName > '' then
    try
      if (MasterField > '') and (MasterFieldValue > '') then
        AID := SelectValueParam
          (Format('select id from %s where ' +
          'code = :CODE and rownum < 2 and %s = :MASTER_VAL',
          [TableName, MasterField]), ['CODE', 'MASTER_VAL'],
          [FCode, MasterFieldValue])

      else
        AID := SelectValueParam
          (Format('select id from %s where ' + 'code = :CODE and rownum < 2',
          [TableName]), ['CODE'], [FCode]);

      if AID > 0 then
        begin
          ExecuteCommandParam(Format('update %s set value = :VALUE ' +
            'where id = :ID', [TableName]), ['VALUE', 'ID;F'], [AValue, AID]);
        end
      else if FAutoAdd then
        begin
          AID := GetNextID(TableName);

          if (MasterField > '') and (MasterFieldValue > '') then
            ExecuteCommandParam(Format('insert into %s (id, %s, code, value) ' +
              'values (:ID, :MASTER_VAL, :CODE, :VALUE)',
              [TableName, MasterField]), ['ID;F', 'MASTER_VAL', 'CODE',
              'VALUE'], [AID, MasterFieldValue, FCode, AValue])
          else
            ExecuteCommandParam(Format('insert into %s (id, code, value) ' +
              'values (:ID, :CODE, :VALUE)', [TableName]),
              ['ID;F', 'CODE', 'VALUE'], [AID, FCode, AValue]);
        end;
    except
      on E: Exception do
        raise Exception.CreateFmt('Error setting code, %s:'#13#13'%s',
          [FCode, E.Message]);
    end;
end;

{ TParamList }

constructor TParamList.Create;
begin
  FParamDefs := nil;
  inherited Create;
  FParamDefs := TParamDefs.Create(TParamDef);
  FParamDefs.OnSetValue := Self.OnSetValue;
  FWriteImmediate := True;
  FParamDefs.WriteImmediate := FWriteImmediate;
  // FParamDefs.Connection := db_dm.FDConnection;
  FParamDefs.TableName := FTableName;
  FParamDefs.AutoAdd := (cpAutoAddSettings in FOptions);
end;

destructor TParamList.Destroy;
begin
  if Assigned(FParamDefs) then
    FreeAndNil(FParamDefs);

  inherited Destroy;
end;

function TParamList.Param(const Code: string): TParamDef;
var
  I: Integer;
begin
  Result := nil;
  I := IndexOf(Code);
  if I > - 1 then
    Result := TParamDef(GetObject(I))
end;

//procedure TParamList.SetDatabaseName(const Value: ShortString);
//begin
//  FConnection := db_dm.FDConnection;
//  if Assigned(FParamDefs) then
//    FParamDefs.Connection := db_dm.FDConnection;
//end;

procedure TParamList.SetMasterField(const Value: ShortString);
begin
  FMasterField := Value;
  if Assigned(FParamDefs) then
    FParamDefs.MasterField := Value;
end;

procedure TParamList.SetMasterFieldValue(const Value: string);
begin
  FMasterFieldValue := Value;
  if Assigned(FParamDefs) then
    FParamDefs.MasterFieldValue := Value;
end;

procedure TParamList.SetOnSetValue(const Value: TOnSetValue);
begin
  FOnSetValue := Value;
  if Assigned(FParamDefs) then
    FParamDefs.OnSetValue := Value;
end;

procedure TParamList.SetOptions(const Value: TCustomParamOptions);
begin
  FOptions := Value;
  if Assigned(FParamDefs) then
    FParamDefs.AutoAdd := (cpAutoAddSettings in FOptions);
end;

procedure TParamList.SetTableName(const Value: ShortString);
begin
  FTableName := Value;
  if Assigned(FParamDefs) then
    FParamDefs.TableName := Value;
end;

procedure TParamList.SetWriteImmediate(const Value: Boolean);
begin
  FWriteImmediate := Value;
  FParamDefs.WriteImmediate := Value;
end;

procedure TParamList.Update;
begin
  if Assigned(FOnGetValues) then
    FOnGetValues
  else if TableName > '' then
    try
      BeginUpdate;
      ClearStringListOfObjects(TStringList(Self));
      Clear;
      FParamDefs.Clear;

      with TFDQuery.Create(nil) do
        try
          ConnectionName := 'IQFD';
          SQL.Add('SELECT id, code, value, displayname');
          SQL.Add(Format('FROM %s', [TableName]));
          if (MasterField > '') and (MasterFieldValue > '') then
            SQL.Add(Format('WHERE %s = ''%s''',
              [MasterField, MasterFieldValue]));

          Open;

          // If we need to pre-populate the table with default values before
          // getting settings, then this is where that would happen.
          // Ensure that the basic table values have been created
          if (BOF and EOF) and Assigned(FOnBeforeGetValues) then
            begin
              Close;
              FOnBeforeGetValues;
              Open;
            end;

          if (BOF and EOF) then
            begin
              if (cpErrorNoSettings in FOptions) then
                raise Exception.Create('Parameters could not be created.')
              else
                Exit;
            end;

          while not EOF do
            begin
              AddCodeValuePair(FieldByName('CODE').AsString,
                FieldByName('VALUE').AsString,
                FieldByName('DISPLAYNAME').AsString);
              Next;
            end;
        finally
          Free;
        end;
    finally
      EndUpdate;
    end;
end;

procedure TParamList.WriteValues;
var
  I: Integer;
begin
  // Writes all values back to the database
  for I := 0 to FParamDefs.Count - 1 do
    FParamDefs.Items[I].SetValue(FParamDefs.Items[I].Value);
end;

procedure TParamList.WriteChangedValues;
var
  I: Integer;
begin
  // Writes changed values back to the database
  for I := 0 to FParamDefs.Count - 1 do
    if FParamDefs[I].Changed then
      FParamDefs[I].SetValue(FParamDefs[I].Value);
end;

procedure TParamList.AddCodeValuePair(ACode, AValue, ADisplayName: string);
var
  o: TParamDef;
begin
  o := FParamDefs.Add(ACode, AValue);
  try
    if ADisplayName > '' then
      o.DisplayName := ADisplayName
    else
      o.DisplayName := ACode;
    // o.Connection := db_dm.FDConnection;
    o.TableName := TableName;
    o.MasterField := MasterField;
    o.MasterFieldValue := MasterFieldValue;
    o.Changed := False;
    AddObject(ACode, o);
  finally
    o := nil; // dereference
  end;
end;

end.
