unit IQMS.WebVcl.DBExpress;

interface

uses
  Classes,
  Controls,
  Dialogs,
  Forms,
  Messages,
  SysUtils,
  Variants,
  Windows,
  IQMS.Common.Registry,
  Midas,
  DB,
  DBClient,
  FMTBcd,
  Provider,
  SqlExpr,
  SqlTimSt,
  DBCommon,
  SQLConst,
  Math,
  IQMS.DBTrans.dbtdb;

type
  {Forwards}
  TIQWebDbxQuery = class;
  TIQWebDbxTable = class;

  { Enumerations }
  TTableType = (ttDefault, ttParadox, ttDBase, ttASCII, ttFoxPro);

  { Events }
  TUpdateRecordEvent = procedure(DataSet: TDataSet;
   UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction) of object;

  { TDataSetUpdateObject }
  TDataSetUpdateObject = class(TComponent)
  protected
    function GetDataSet: TDataSet; virtual; abstract;
    procedure SetDataSet(ADataSet: TDataSet); virtual; abstract;
    procedure Apply(UpdateKind: TUpdateKind); virtual; abstract;
    property DataSet: TDataSet read GetDataSet write SetDataSet;
  end;

  { TSQLUpdateObject }
  TSQLUpdateObject = class(TDataSetUpdateObject)
  protected
     function GetSQL(UpdateKind: TUpdateKind): TStrings; virtual; abstract;
  end;

  { TInternalSQLDataSet }
  TIQWebInternalSQLDataSet = class(TSQLQuery);
  
  { TCustomDataSet }
  TIQWebDbxCustomDataSet = class(TClientDataSet)
  private
    {Private declarations}
    FConnection: TSQLConnection;
    FInternalConnection: TSQLConnection; { Always points to internal if present }
    FDataSet: TIQWebInternalSQLDataSet;

    FAfterPost: TDataSetNotifyEvent;
    FBeforeRefresh: TDataSetNotifyEvent;
    FOnUpdateError: TResolverErrorEvent;
    FOnGetTableName: TGetTableNameEvent;
    FAfterDelete: TDataSetNotifyEvent;
    FAfterRefresh: TDataSetNotifyEvent;

    // Used during "refresh"
    FRefreshEvent_KeyFieldName: String;
    FRefreshEvent_KeyFieldValue: Variant;

    procedure DoApplyUpdates(DataSet: TDataSet); reintroduce;

    procedure DoOnReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);

    procedure DoOnPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);

    procedure DoUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);

{$IF CompilerVersion >= 26}  // Delphi XE5
    procedure DoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
{$ELSE}
    procedure DoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: WideString);
{$IFEND}

    procedure AllocConnection; virtual;
    procedure AllocDataSet; virtual;
    procedure AllocProvider; virtual;

    function GetOnUpdateError: TResolverErrorEvent;
    procedure SetOnUpdateError(const Value: TResolverErrorEvent);
    function GetUpdateMode: TUpdateMode;
    procedure SetUpdateMode(const Value: TUpdateMode);
    function GetBeforeUpdateRecord: TBeforeUpdateRecordEvent;
    procedure SetBeforeUpdateRecord(const Value: TBeforeUpdateRecordEvent);
    procedure SetConnection(const Value: TSQLConnection); virtual;

    property DataSet: TIQWebInternalSQLDataSet read FDataSet;
    procedure CheckActive; override;
    procedure CheckInactive; override;
    procedure CheckParams;
    function GetMasterSource: TDataSource;
    procedure SetMasterSource(const Value: TDataSource);

  protected
    {Protected declarations}
    FProvider: TDataSetProvider;

    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure OpenCursor(InfoQuery: Boolean); override;
    procedure CloseCursor; override;
    procedure InternalBeforeOpen(DataSet: TDataSet); virtual;

    procedure DoAfterDelete(DataSet: TDataSet); virtual;
    procedure DoAfterPost(DataSet: TDataSet); virtual;
    procedure DoBeforeRefresh(DataSet: TDataSet);
    procedure DoAfterRefresh(DataSet: TDataSet);
    procedure CopyFromDelta(const DeltaDS: TCustomClientDataSet;
      var ADataSet: TPacketDataSet);
    procedure FixParamTypes(AParams: TParams);
    procedure CopyFieldDefToQuery;
    procedure SetDefaultDataSetKey;

    procedure FillParams(const ASource: TDataSet; const AParams: TParams);

    function IsFieldInDataSet(const AFieldName: String): Boolean;
    function GetKeyFieldName: String;

    procedure HandleError(AErrorMsg: String); overload;
  public
    {Public declarations}
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RecordCount: Integer; reintroduce;

    // in case we need access from outside to tweak the behaviour
    property InternalDataSet: TIQWebInternalSQLDataSet read FDataSet;
    property InternalProvider: TDataSetProvider read FProvider;
    procedure ResetInternalDataSet;
    procedure HandleError(AHeader, AErrorMsg: String); overload;
    
  published          
    {Published declarations}
    property Active;
    property AutoCalcFields;
    property Constraints;
    property Filter;
    property Filtered;
    property FilterOptions;
    property MasterSource: TDataSource read GetMasterSource write SetMasterSource;
    property ObjectView;
    property PacketRecords;
    property SQLConnection: TSQLConnection read FConnection write SetConnection;
    property Tag;
    property UpdateMode: TUpdateMode read GetUpdateMode write SetUpdateMode default upWhereKeyOnly;

    property AfterApplyUpdates;
    property AfterCancel;
    property AfterClose;
    property AfterDelete: TDataSetNotifyEvent read FAfterDelete write FAfterDelete;
    property AfterEdit;
    property AfterExecute;
    property AfterGetParams;
    property AfterGetRecords;
    property AfterInsert;
    property AfterOpen;
    property AfterPost: TDataSetNotifyEvent read FAfterPost write FAfterPost;
    property AfterRefresh: TDataSetNotifyEvent read FAfterRefresh write FAfterRefresh;
    property AfterRowRequest;
    property AfterScroll;
    property BeforeApplyUpdates;
    property BeforeCancel;
    property BeforeClose;
    property BeforeDelete;
    property BeforeEdit;
    property BeforeExecute;
    property BeforeGetParams;
    property BeforeGetRecords;
    property BeforeInsert;
    property BeforeOpen;
    property BeforePost;
    property BeforeRefresh: TDataSetNotifyEvent read FBeforeRefresh write FBeforeRefresh;
    property BeforeRowRequest;
    property BeforeScroll;
    property BeforeUpdateRecord: TBeforeUpdateRecordEvent
     read GetBeforeUpdateRecord write SetBeforeUpdateRecord;

    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnFilterRecord;
    property OnNewRecord;
    property OnPostError;

    property OnUpdateError: TResolverErrorEvent read GetOnUpdateError write SetOnUpdateError;
    property OnGetTableName: TGetTableNameEvent read FOnGetTableName write FOnGetTableName;
  end;

  { TDbxQuery }
  TIQWebDbxQuery = class(TIQWebDbxCustomDataSet)
  private
    {Private declarations}
    FBeforeRefresh: TDataSetNotifyEvent;
    //function GetMasterSource: TDataSource; reintroduce;
    //procedure SetMasterSource(Value: TDataSource); reintroduce;
    procedure SetSQL(Value: TStrings); reintroduce;
    function GetParamsList: TParams; reintroduce;
    procedure SetParamsList(Value: TParams); reintroduce;
    function GetParamCheck: Boolean; reintroduce;
    procedure SetParamCheck(const Value: Boolean); reintroduce;
    function GetText: string; reintroduce;
    function GetPrepared: Boolean; reintroduce;
    procedure SetPrepared(const Value: Boolean); reintroduce;
    function GetOnGetTableName: TGetTableNameEvent;
    procedure SetOnGetTableName(const Value: TGetTableNameEvent);
    function GetSQL: TStrings; reintroduce;
    function GetActive: Boolean; reintroduce;
    procedure SetActive(const Value: Boolean); reintroduce;
    procedure Disconnect;
    procedure ReadParamData(Reader: TReader);
    procedure WriteParamData(Writer: TWriter);
    //procedure PopulateParamValuesFromDataSource;
  protected
    {Protected declarations}
    function GetParamsCount: Word;
    procedure DefineProperties(Filer: TFiler); override;
  public
    {Public declarations}
    procedure ExecSQL;
    procedure Refresh; reintroduce;
    procedure Open;
    //procedure GetDetailLinkFields(MasterFields, DetailFields: TList); override;
    function ParamByName(const Value: string): TParam;
    property Prepared: Boolean read GetPrepared write SetPrepared;
    property ParamCount: Word read GetParamsCount;
    property Text: string read GetText;
  published
    {Published declarations}
    property SQLConnection;
    property Active: Boolean read GetActive write SetActive;
    property ParamCheck: Boolean read GetParamCheck write SetParamCheck;
    property Params: TParams read GetParamsList write SetParamsList stored False;
    property SQL: TStrings read GetSQL write SetSQL;
    property OnGetTableName: TGetTableNameEvent read GetOnGetTableName write SetOnGetTableName;
    property BeforeRefresh: TDataSetNotifyEvent read FBeforeRefresh write FBeforeRefresh;
  end;

  { TDbxTable }
  TIQWebDbxTable = class(TIQWebDbxQuery)
  private
    {Private declarations}
    FCommand: TStringList;
    FFieldList: TStringList;
    FTableName: String;
{$IF CompilerVersion >= 26}  // Delphi XE5
    procedure DoOnGetTableName(Sender: TObject; DataSet: TDataSet;
      var ATableName: string);
{$ELSE}
    procedure DoOnGetTableName(Sender: TObject; DataSet: TDataSet;
      var ATableName: WideString);
{$IFEND}
    procedure SetTableName(const Value: String);
    procedure SetCommandText; reintroduce;
    function GetIndexFieldNames: String;
    procedure SetIndexFieldNames(const Value: String);
    function GetIndexName: String;
    procedure SetIndexName(const Value: String);
    function GetMasterFields: String;
    procedure SetMasterFields(const Value: String);
    function GetActive: Boolean; reintroduce;
    procedure SetActive(const Value: Boolean); reintroduce;
    procedure Disconnect;
    procedure GetDetailLinkFieldsEx(AMasterFields,
      ADetailFields: TStringList);
  protected
    {Protected declarations}
    procedure InternalBeforeOpen(DataSet: TDataSet); override;
  public
    {Public declarations}
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Refresh; reintroduce;
    //procedure GetDetailLinkFields(MasterFields, DetailFields: TList); override;
    procedure GetBlobFields(var AFields: TStringList);
    procedure GetClobFields(var AFields: TStringList);
    procedure GetLongFields(var AFields: TStringList);
  published
    {Published declarations}
    property Active: Boolean read GetActive write SetActive;
    property FieldDefs;
    property Filter;
    property Filtered;
    property FilterOptions;
    property IndexDefs;
    property IndexFieldNames: String read GetIndexFieldNames write SetIndexFieldNames;
    property IndexName: String read GetIndexName write SetIndexName;
    property MasterFields: String read GetMasterFields write SetMasterFields;
    property MasterSource; 
    property SQLConnection;
    property TableName: String read FTableName write SetTableName;
  end;

  { TSQLGeneratorFieldListOptions }
  TSQLGeneratorFieldListOption = (floStandard, floBlob, floClob, floLong, floModified);
  TSQLGeneratorFieldListOptions = set of TSQLGeneratorFieldListOption;

  { TSQLGenerator }
  { This is the base class for other SQL Generators (in this unit).
    Generates SQL statements using the information supplied through the
    component properties.  This class does not connect to Oracle.}
  TSQLGenerator = class(TComponent)
  private
    FModifySQL: TStringList;
    FInsertSQL: TStringList;
    FDeleteSQL: TStringList;
    FKeyFields: TStringList;
    FFields: TStringList;
    FTableName: String;
    FModifiedFields: TStringList;
    FSourceNullFields: TStringList;
    FModifiedNullFields: TStringList;
    FClobFields: TStringList;
    FBlobFields: TStringList;
    FLongFields: TStringList;
    FFieldMap: TFieldMap; // in dbtdb.pas
    FModifyParams: TStringList;
    FInsertParams: TStringList;
    FDeleteParams: TStringList;
    FDBLink: String;
    function CommaStr(const AList: TStringList;
      const ACurIndex: Integer): String;
    procedure BuildDelete;
    procedure BuildInsert;
    procedure BuildUpdate;
    function GetSQLIndex(const Index: Integer): TStrings;
    function GetParamIndex(const Index: Integer): TStrings;
    procedure GetWhereNoKey(var AFieldList: TStringList;
     var AParamList: TStringList);
    procedure LobClause(var AList: TStringList);
    function BlockWrapText(const S: String;
      const AIndent: Integer): String;
  protected
    procedure ListFields; virtual;
    procedure GetFieldList(AOptions: TSQLGeneratorFieldListOptions;
     var AList: TStringList);
  public
    constructor Create(AOwner: TComponent; ATableName: String); reintroduce;
    destructor Destroy; override;
    procedure Execute;
  published
    // Oracle table name
    property TableName: String read FTableName write FTableName;

    // Returned SQL - These are filled after Execute is called.
    property ModifySQL: TStrings index 0 read GetSQLIndex;
    property InsertSQL: TStrings index 1 read GetSQLIndex;
    property DeleteSQL: TStrings index 2 read GetSQLIndex;

    // Returned SQL - These are filled after Execute is called.
    property ModifyParams: TStrings index 0 read GetParamIndex;
    property InsertParams: TStrings index 1 read GetParamIndex;
    property DeleteParams: TStrings index 2 read GetParamIndex;

    // For updates, indicate which fields are NULL and modified
    property ModifiedFields: TStringList read FModifiedFields write FModifiedFields;
    property SourceNullFields: TStringList read FSourceNullFields write FSourceNullFields;
    property ModifiedNullFields: TStringList read FModifiedNullFields write FModifiedNullFields;

    // Field definitions - These are required for accurate SQL.
    property KeyFields: TStringList read FKeyFields write FKeyFields;
    property BlobFields: TStringList read FBlobFields write FBlobFields;
    property ClobFields: TStringList read FClobFields write FClobFields;
    property LongFields: TStringList read FLongFields write FLongFields;

    // Optional field map in case.  Parameter names will be based on the
    // "source" dataset in the FieldMap.
    property FieldMap: TFieldMap read FFieldMap write FFieldMap;

    // Optional DBLink name
    property DBLink: String read FDBLink write FDBLink;
  end;

  { TSQLGeneratorDataSet }
  { Generates SQL using the supplied dataset and component properties.
    The basic field list is obtained from the DataSet. This component
    does not connect to Oracle.}
  TSQLGeneratorDataSet = class(TSQLGenerator)
  private
    FDataSet: TDataSet;
  protected
    procedure ListFields; override;
  public
    constructor Create(AOwner: TComponent;
                       ADataSet: TDataSet;
                       ATableName,
                       AKeyFields: String);
  published
    property DataSet: TDataSet read FDataSet write FDataSet;
    property TableName;

    property ModifySQL;
    property InsertSQL;
    property DeleteSQL;

    property ModifiedFields;
    property SourceNullFields;
    property ModifiedNullFields;

    property KeyFields;
    property BlobFields;
    property ClobFields;
    property LongFields;
  end;

  { TSQLGeneratorDbxDataSet }
  { Generates SQL using the supplied source and delta datasets.
    Field lists is obtained from the datasets.}
  TSQLGeneratorDbxDataSet = class(TSQLGenerator)
  private
    FDeltaDS: TCustomClientDataSet;
    FSourceDS: TDataSet;
    FSQLConnection: TSQLConnection;
  protected
    procedure ListFields; override;
  public
    constructor Create(AOwner: TComponent;
                       ASQLConnection: TSQLConnection;
                       ASourceDS: TDataSet;
                       ADeltaDS: TCustomClientDataSet;
                       ATableName,
                       AKeyFields: String);
  published
    property SQLConnection: TSQLConnection read FSQLConnection write FSQLConnection;
    property SourceDS: TDataSet read FSourceDS write FSourceDS;
    property DeltaDS: TCustomClientDataSet read FDeltaDS write FDeltaDS;

    property TableName;

    property ModifySQL;
    property InsertSQL;
    property DeleteSQL;
  end;

  { TSQLGeneratorOracle }
  { Connects to Oracle and retrieves all table information which is supplied
    to the base class, which then generates SQL statements. }
  TSQLGeneratorOracle = class(TSQLGenerator)
  private
    FSQLConnection: TSQLConnection;
    FFieldMap: TFieldMap;
    function GetPrimaryKey: String;
  protected
    procedure ListFields; override;
  public
    constructor Create(AOwner: TComponent;
                       ASQLConnection: TSQLConnection;
                       ATableName: String);
  published
    // Table name and SQL Connection are required.
    property TableName;
    property SQLConnection: TSQLConnection read FSQLConnection write FSQLConnection;

    property ModifySQL;
    property InsertSQL;
    property DeleteSQL;

    property ModifiedFields;
    property SourceNullFields;
    property ModifiedNullFields;

    property FieldMap;
  end;

  function ParseFieldListAsWhereSQL(const AValue: String; AFieldMap: TFieldMap;
   var AWhere: TStringList; var AParams: TStringList): Boolean; overload;
  function ParseFieldListAsWhereSQL(const AList: TStringList; AFieldMap: TFieldMap;
   var AWhere: TStringList; var AParams: TStringList): Boolean; overload;
  function ParseFieldListAsWhereSQL(const AFieldList, ANullFields: TStringList;
   AFieldMap: TFieldMap; var AWhere: TStringList;
   var AParams: TStringList): Boolean; overload;

const
  // 11/11/2011 Changed the default to -1 because it seems to
  // solve the 'Key violation' error.
  PACKET_RECORD_COUNT: Integer = -1;

implementation

uses
  IQMS.DBTrans.dbtdbexp,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Dialogs,
  StrUtils,
  IQMS.WebVcl.ResourceStrings;
    
function ParseFieldListAsWhereSQL(const AValue: String; AFieldMap: TFieldMap;
 var AWhere: TStringList; var AParams: TStringList): Boolean;
var
   sl: TStringList;
begin
  // Initialization
  Result := False;
  sl := NIL;
  // Validation
  if not Assigned(AWhere) then Exit;
  // Check if a string has been passed; if not, pass False.
  Result := AValue > '';
  if not Result then Exit;
  // Generate Where clause (without the "WHERE")
  try
     sl := TStringList.Create;
     sl.Text := SysUtils.StringReplace(AValue, ';', #13,
      [rfReplaceAll, rfIgnoreCase]);
     Result := ParseFieldListAsWhereSQL(sl, AFieldMap, AWhere, AParams); // overload, see below
  finally
     if Assigned(sl) then FreeAndNil(sl);
  end;
end;

function ParseFieldListAsWhereSQL(const AList: TStringList; AFieldMap: TFieldMap;
 var AWhere: TStringList; var AParams: TStringList): Boolean;
var
   i, i_map: Integer;
   s_name, s_param, AAnd: String;
begin
  // Initialization
  Result := False;
  i_map := -1;
  
  // Validation
  if not Assigned(AList) then Exit;
  if not Assigned(AWhere) then Exit;
  // Check if a string has been passed; if not, pass False.
  Result := AList.Count > 0;
  if not Result then Exit;
  // Generate Where clause (without the "WHERE")
  for i := 0 to AList.Count - 1 do
   begin
     s_name := AList.Strings[i];
     s_param := UpperCase(s_name);

     // If a map is provided, but this field is not in the map,
     // then do not add this field to the statement.
     if Assigned(AFieldMap) and (AFieldMap.Count > 0) then
        begin
          i_map := AFieldMap.IndexOfTarget(s_name);
          if i_map = -1 then
             Continue;
        end;

     // Get the source field name as the param string
     if (i_map <> -1) and Assigned(AFieldMap) then
        begin
          s_param := UpperCase(AFieldMap.Source(i_map));
          if s_param = '' then s_param := UpperCase(s_name);
        end;

     AAnd := StrUtils.IfThen((AList.Count > 1) and
      (i < AList.Count - 1), ' AND','');
     AWhere.Add(Format('  %s = :%s%s',
      [LowerCase(s_name),
       UpperCase(s_param),
       AAnd]));
     AParams.Add(s_param); 
   end;
  Result := AList.Count > 0;
end;

function ParseFieldListAsWhereSQL(const AFieldList, ANullFields: TStringList;
 AFieldMap: TFieldMap; var AWhere: TStringList;
 var AParams: TStringList): Boolean; overload;
var
   i, i_map: Integer;
   AAnd: String;
   s_name, s_param, s_line: String;
begin
  // Initialization
  Result := False;
  i_map := -1;
  
  // Validation
  if not Assigned(AFieldList) then Exit;
  if not Assigned(ANullFields) then Exit;
  if not Assigned(AWhere) then Exit;
  // Check if a string has been passed; if not, pass False.
  Result := AFieldList.Count > 0;
  if not Result then Exit;
  // Generate Where clause (without the "WHERE")
  for i := 0 to AFieldList.Count - 1 do
   begin
     s_line := '';

     AAnd := StrUtils.IfThen((AFieldList.Count > 1) and
      (i < AFieldList.Count - 1), ' AND','');

     s_name := AFieldList.Strings[i];
     s_param := UpperCase(s_name);

     // If a map is provided, but this field is not in the map,
     // then do not add this field to the statement.
     if Assigned(AFieldMap) and (AFieldMap.Count > 0) then
        begin
          i_map := AFieldMap.IndexOfTarget(s_name);
          if i_map = -1 then
             Continue;
        end;

     // Get the source field name as the param string
     if (i_map <> -1) and Assigned(AFieldMap) then
        begin
          s_param := UpperCase(AFieldMap.Source(i_map));
          if s_param = '' then s_param := UpperCase(s_name);
        end;
        
     if ANullFields.IndexOf(s_name) > -1 then
        s_line := Format('  %s is NULL %s',
         [LowerCase(s_name),
          AAnd])
     else
        s_line := Format('  %s = :%s%s',
         [LowerCase(s_name),
          UpperCase(s_param),
          AAnd]);

     AWhere.Add(s_line);
     AParams.Add(s_param);
   end;
  Result := AFieldList.Count > 0;
end;

{ TDbxCustomDataSet }

constructor TIQWebDbxCustomDataSet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  AllocProvider;
  AllocDataSet;
  //AllocConnection;
  TClientDataSet(Self).AfterPost := DoAfterPost;
  TClientDataSet(Self).AfterDelete := DoAfterDelete;
  TClientDataSet(Self).BeforeRefresh := DoBeforeRefresh;
  TClientDataSet(Self).AfterRefresh := DoAfterRefresh;
  TClientDataSet(Self).OnReconcileError := DoOnReconcileError;
  TClientDataSet(Self).OnPostError := DoOnPostError;
  //TClientDataSet(Self).PacketRecords := PACKET_RECORD_COUNT;
  FProvider.OnGetTableName := DoGetTableName;
  FProvider.OnUpdateError := DoUpdateError;
  FProvider.UpdateMode := upWhereKeyOnly;
end;

destructor TIQWebDbxCustomDataSet.Destroy;
begin
  // In order to free these objects, we have to remove them
  // from the internal component list with RemoveFreeNotification()
  if Assigned(FProvider) then
    begin
      FProvider.RemoveFreeNotification(Self);
      FreeAndNil(FProvider);
    end;
  if Assigned(FDataSet) then
     begin
       FDataSet.RemoveFreeNotification(Self);
       FreeAndNil(FDataSet);
     end;

  inherited Destroy;
end;

procedure TIQWebDbxCustomDataSet.Loaded;
begin
  inherited;
  { Internal connection can now be safely deleted if needed }
  if FInternalConnection <> FConnection then
    FreeAndNil(FInternalConnection);
end;

procedure TIQWebDbxCustomDataSet.AllocConnection;
begin
  FConnection := TSQLConnection.Create(Self);
  FInternalConnection := FConnection;
  FConnection.Name := 'InternalConnection';		{ Do not localize }
  FConnection.SetSubComponent(True);
  FDataSet.SQLConnection := FConnection;
end;

procedure TIQWebDbxCustomDataSet.AllocDataSet;
begin
  FDataSet := TIQWebInternalSQLDataSet.Create(Self);
  FDataSet.Name := 'InternalDataSet';			{ Do not localize }
  FDataSet.SQLConnection := FConnection;
  FDataSet.SetSubComponent(True);
  FProvider.DataSet := FDataSet;
  FDataSet.GetMetadata := False;
  FDataSet.MaxBlobSize := -1;
  // FDataSet.NoMetadata := True;
  FDataSet.BeforeOpen := InternalBeforeOpen;
end;

procedure TIQWebDbxCustomDataSet.AllocProvider;
begin
  FProvider := TDataSetProvider.Create(Self);
  FProvider.DataSet := FDataSet;
  FProvider.Name := 'InternalProvider';			{ Do not localize }
  FProvider.ResolveToDataSet := False;
  FProvider.SetSubComponent(True);
  // 12/13/2011 The option, poRetainServerOrder, is essential or
  // the dataset will display a different set of records depending
  // on the 'order by'.  Yeah, weird, but nevertheless 'by design'.
  FProvider.Options := [poRetainServerOrder,poUseQuoteChar];
  SetProvider(FProvider);
end;

procedure TIQWebDbxCustomDataSet.SetDefaultDataSetKey;
var
   AField: TField;
begin
  // Validate
  if not Assigned(FDataSet) then Exit;
  // Get the ID field
  AField := Self.FindField('ID');
  if (AField = NIL) then Exit;
  // Set the flags
  if (AField is TFMTBCDField) then
     TFMTBCDField(AField).ProviderFlags := TFMTBCDField(AField).ProviderFlags + [pfInKey]
  else if (AField is TBCDField) then
     TBCDField(AField).ProviderFlags := TBCDField(AField).ProviderFlags + [pfInKey];
end;

procedure TIQWebDbxCustomDataSet.CopyFieldDefToQuery;

   procedure _AddField(AField: TField);
   var
      x: Integer;
      AFieldName: String;
   begin
     AFieldName := AField.FieldName;

     // Ensure that the field has not already been created
     if FDataSet.FindField(AFieldName) <> NIL then
        Exit;

     // Add the field from the field definition
     FDataSet.FieldDefs.Update;
     x := FDataSet.FieldDefs.IndexOf(AFieldName);
     if x > -1 then
        begin
          FDataSet.FieldDefs.Items[x].CreateField(FDataSet);
          FDataSet.FieldByName(AFieldName).ProviderFlags := AField.ProviderFlags;
        end;
   end;

var
   i: Integer;
begin
  if not Assigned(FDataSet) or (FDataSet.FieldCount > 0) or (FieldCount = 0) then
     Exit;
  for i := 0 to FieldCount - 1 do
    _AddField(Fields[i]);
end;

procedure TIQWebDbxCustomDataSet.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if not (csDestroying in ComponentState ) and (Operation = opRemove) and
     (AComponent = FConnection) and (AComponent.Owner <> Self) then
    AllocConnection;
end;

procedure TIQWebDbxCustomDataSet.OpenCursor(InfoQuery: Boolean);

  // function _ignoreError(E: Exception): Boolean;
  // begin
  //   Result:= E.ClassNameIs('EDBClient') and
  //     (CompareText(E.Message, 'Key violation.') = 0));
  // end;

begin
  if Assigned(FProvider) then
    SetProvider(FProvider);

  if FProvider.DataSet = Self then
     begin
       // IQMS.WebVcl.ResourceStrings.cTXT0000387 = 'Encountered error opening cursor'
       HandleError(IQMS.WebVcl.ResourceStrings.cTXT0000387,
         SCircularProvider);
       Exit;
     end;

  //try
     CheckParams;
     ResetInternalDataSet;
     inherited OpenCursor(InfoQuery);
  {except on E:Exception do      // this should be handled at the application level, not data access level. JS 
    begin
      // IQMS.WebVcl.ResourceStrings.cTXT0000387 = 'Encountered error opening cursor'
      HandleError(IQMS.WebVcl.ResourceStrings.cTXT0000387, E.Message);
      Exit;
    end;
  end;}

  // Note:  The sequence of these calls is intentional; if this is
  // problematic, then check SetDefaultDataSetKey because it is
  // modifying the TClientDataSet -- in case you need to modify the
  // TSQLQuery instead.
  
  // Set the default primary key in the TClientDataSet first
  SetDefaultDataSetKey;
  // Next, copy the field definition to the TSQLQuery
  CopyFieldDefToQuery;
end;

procedure TIQWebDbxCustomDataSet.SetConnection(const Value: TSQLConnection);
begin
  // Assigning existing value or clearing internal connection is a NOP
  if (Value = FConnection) or ((Value = nil) and Assigned(FInternalConnection)) then
     Exit;

  // Remove FreeNotification from existing external reference
  if (FConnection <> FInternalConnection) and Assigned(FConnection) then
     FConnection.RemoveFreeNotification(Self);

  // Reference to external connection was cleared, recreate internal
  if (Value = nil) then
     AllocConnection
  else
     begin
       // Free the internal connection when assigning an external connection
       if Assigned(FInternalConnection) and
          // but not if we are streaming in, then wait until loaded is called
          not (csLoading in FInternalConnection.ComponentState) then
          FreeAndNil(FInternalConnection);
       FConnection := Value;
       FConnection.FreeNotification(Self);
       FDataSet.SQLConnection := FConnection;
     end;
end;

procedure TIQWebDbxCustomDataSet.CheckInactive;
begin
  if (Self.SQLConnection <> nil) and
     (csDesigning in ComponentState) then
      Self.Close;
end;

procedure TIQWebDbxCustomDataSet.CheckParams;
var
  i: Integer;
begin
  // Checks parameter list
  for i := 0 to FDataSet.Params.Count - 1 do
   if FDataSet.Params[i].DataType = ftUnknown then
     raise Exception.CreateFmt(
       'Unknown datatype (ftUnknown) for parameter, %s.  Please ensure ' +
       'parameters have been assigned a datatype.',
       [FDataSet.Params[i].Name]);
end;

procedure TIQWebDbxCustomDataSet.CloseCursor;
begin
  // 02/16/2012 Although we may close the TDbxCustomDataSet --
  // by calling the Close method -- we need to make sure the
  // internal dataset connection is also closed.  We must do
  // this first, before calling inherited CloseCursor.
  if Assigned(FDataSet) and FDataSet.Active then
    FDataSet.Active := False;

  inherited CloseCursor;

end;

procedure TIQWebDbxCustomDataSet.CheckActive;
begin
  if Self.SQLConnection <> nil then
     Self.Open;
end;

procedure TIQWebDbxCustomDataSet.DoAfterPost(DataSet: TDataSet);
begin
  // Required:  After posting with the TDBNavigator, the ChangeCount will be 1.
  // Call ApplyUpdates to apply changes to the database.  This calls the
  // BeforeUpdateRecord method.
  // Note:  DataSetProvider.ResolveToDataset must equal True.
  DoApplyUpdates(DataSet);

  // Execute the calling application "AfterPost"
  if Assigned(FAfterPost) then
     FAfterPost(DataSet);
end;

procedure TIQWebDbxCustomDataSet.DoAfterDelete(DataSet: TDataSet);
begin
  // Required:  After posting with the TDBNavigator, the ChangeCount will be 1.
  // Call ApplyUpdates to apply changes to the database.  This calls the
  // BeforeUpdateRecord method.
  // Note:  DataSetProvider.ResolveToDataset must equal True.
  DoApplyUpdates(DataSet);

  // Execute the calling application event
  if Assigned(FAfterDelete) then
     FAfterDelete(DataSet);
end;

procedure TIQWebDbxCustomDataSet.DoBeforeRefresh(DataSet: TDataSet);
begin
  // Cancel any changes to this point.  This is default behavior
  // for our software.
  Self.Cancel;
  Self.CancelUpdates;
  
  // Get key information before refreshing; this allows to relocate the
  // record
  FRefreshEvent_KeyFieldName := GetKeyFieldName;
  FRefreshEvent_KeyFieldValue := Unassigned;
  if (FRefreshEvent_KeyFieldName > '') and Self.Active then
     FRefreshEvent_KeyFieldValue := Self.FieldByName(FRefreshEvent_KeyFieldName).Value;

  // Execute the calling application event
  if Assigned(FBeforeRefresh) then
     FBeforeRefresh(DataSet);
end;

procedure TIQWebDbxCustomDataSet.DoAfterRefresh(DataSet: TDataSet);
begin

  if Self.Active and
     (FRefreshEvent_KeyFieldName > '') and
     not Variants.VarIsNull(FRefreshEvent_KeyFieldValue) then
     Self.Locate(FRefreshEvent_KeyFieldName, FRefreshEvent_KeyFieldValue, []);

  // Execute the calling application event
  if Assigned(FAfterRefresh) then
     FAfterRefresh(DataSet);

end;

procedure TIQWebDbxCustomDataSet.DoOnReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  // Display the error, and then cancel updates.  Cancelling the edits
  // is the only way to get out of this condition gracefully.  Any other
  // action type besides raCancel will appear to the user that it was
  // posted successfully, which it hasn't; and the updates will remain in
  // the buffer, so if the user tries to refresh an error will occur.
  // IQMS.WebVcl.ResourceStrings.cTXT0000384 = 'Your changes will be cancelled.'
  IQError(E.Message + #13#13 + IQMS.WebVcl.ResourceStrings.cTXT0000384);
  Action := raCancel;
end;

procedure TIQWebDbxCustomDataSet.DoOnPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  // From Help: "Abort the operation that led to an error and display an
  //             error message."
  IQError(E.Message);
  Action := daFail;
end;

procedure TIQWebDbxCustomDataSet.DoUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  Response := rrAbort;
end;

function TIQWebDbxCustomDataSet.GetOnUpdateError: TResolverErrorEvent;
begin
  Result := FOnUpdateError;
end;

procedure TIQWebDbxCustomDataSet.SetOnUpdateError(
  const Value: TResolverErrorEvent);
begin
  FOnUpdateError := Value;
  FProvider.OnUpdateError := FOnUpdateError;
end;

function TIQWebDbxCustomDataSet.GetUpdateMode: TUpdateMode;
begin
  Result := FProvider.UpdateMode;
end;

procedure TIQWebDbxCustomDataSet.SetUpdateMode(const Value: TUpdateMode);
begin
  FProvider.UpdateMode := Value;
end;

procedure TIQWebDbxCustomDataSet.CopyFromDelta(const DeltaDS: TCustomClientDataSet;
 var ADataSet: TPacketDataSet);
var
   i: Integer;
   FieldDelta, FieldDataSet: TField;
begin
  // Initialization
  FieldDelta := NIL;
  FieldDataSet := NIL;

  // Validation
  if not Assigned(DeltaDS) then Exit;
  if not Assigned(ADataSet) then Exit;

  // Configure target dataset
  ADataSet.ObjectView := True;
  ADataSet.FieldDefs.HiddenFields := True;
  ADataSet.Data := DeltaDS.Data;

  // Place the dataset in "edit mode" so we can modify field values
  ADataSet.Edit;

  // Cycle dataset, and apply updated field values
  for i := 0 to DeltaDS.FieldCount - 1 do
   begin
     // Get TField variables
     FieldDelta := DeltaDS.Fields[i];
     FieldDataSet := ADataSet.FindField(FieldDelta.FieldName);
     // If the field does not exist in the target dataset,
     // then continue looping; this should never happen.
     if (FieldDataSet = NIL) then Continue;
     // Assign the field value if the delta has a "new value"
     if (FieldDelta.NewValue <> Unassigned) then
        FieldDataSet.Assign(FieldDelta);
   end;
  // Post the target dataset
  ADataSet.Post;
end;

function TIQWebDbxCustomDataSet.GetBeforeUpdateRecord: TBeforeUpdateRecordEvent;
begin
  Result := FProvider.BeforeUpdateRecord;
end;

procedure TIQWebDbxCustomDataSet.SetBeforeUpdateRecord(
  const Value: TBeforeUpdateRecordEvent);
begin
  FProvider.BeforeUpdateRecord := Value;
end;

procedure TIQWebDbxCustomDataSet.FixParamTypes(AParams: TParams);
var
   i: Integer;
begin
  if Assigned(AParams) then
  for i := 0 to AParams.Count - 1 do
   begin
     {if (AParams.Items[i].DataType in [ftSmallint, ftInteger, ftWord,
        ftCurrency, ftAutoInc]) then
       AParams.Items[i].DataType := ftBCD
     else} if (AParams.Items[i].DataType in [ftWideString, ftFmtMemo]) then
        AParams.Items[i].DataType := ftString
     else if (AParams.Items[i].DataType in [ftFloat, ftLargeint]) then
        AParams.Items[i].DataType := ftFMTBcd
     else if (AParams.Items[i].DataType in [ftDate, ftTime, ftDateTime]) then
        AParams.Items[i].DataType := ftTimeStamp;
   end;
end;

function TIQWebDbxCustomDataSet.RecordCount: Integer;
begin
  if Assigned(FDataSet) then
     Result := DBX_GetRecordCount(FDataSet as TSQLQuery)
  else
     Result := 0;
end;

procedure TIQWebDbxCustomDataSet.ResetInternalDataSet;
begin
  // close and reset internal dataset - used when query structure is changing on-fly
  if not Assigned(FDataSet) then
    Exit;
  FDataSet.Close;
  while FDataSet.FieldCount > 0 do FDataSet.Fields[ 0 ].Free;
  FDataSet.FieldDefs.Clear;
end;

function TIQWebDbxCustomDataSet.IsFieldInDataSet(
  const AFieldName: String): Boolean;
var
   i: Integer;
begin
  Result := False;
  for i := 0 to FieldCount - 1 do
   if UpperCase(Fields[i].FieldName) = Trim(UpperCase(AFieldName)) then
      begin
        Result := True;
        Break;
      end;
end;

procedure TIQWebDbxCustomDataSet.InternalBeforeOpen(DataSet: TDataSet);
begin
  if FDataSet.CommandText = '' then
     begin
       // IQMS.WebVcl.ResourceStrings.cTXT0000385 = 'Missing SQL statement.'
       HandleError('Encountered error opening dataset.',
        IQMS.WebVcl.ResourceStrings.cTXT0000385);
       Exit;
     end;
end;

procedure TIQWebDbxCustomDataSet.HandleError(AErrorMsg: String);
begin
  HandleError('Encountered dataset error.', AErrorMsg);
end;

procedure TIQWebDbxCustomDataSet.HandleError(AHeader, AErrorMsg: String);
var
   AOwnerName, ADetails: String;
begin
  AOwnerName := '___';
  if (Owner <> NIL) and (Owner is TWinControl) then
     begin
       AOwnerName := TWinControl(Owner).Name;
       if AOwnerName = '' then
          AOwnerName := TWinControl(Owner).ClassName;
     end;
  ADetails := Format('%s.%s (%s)',
   [AOwnerName, TComponent(Self).GetNamePath,
    Self.ClassName]);
  ShowIQErrorMessageB(AHeader, AErrorMsg, ADetails);
end;

procedure TIQWebDbxCustomDataSet.FillParams(const ASource: TDataSet;
  const AParams: TParams);
var
   i: Integer;
   Param: TParam;
   PName: String;
   Field: TField;
begin
  if not Assigned(ASource) or not Assigned(AParams) then Exit;

{ Conversion functions:
   function StrToBcd(const AValue: string): TBcd;
   function TryStrToBcd(const AValue: string; var Bcd: TBcd): Boolean;
   function DoubleToBcd(const AValue: Double): TBcd; overload;
   procedure DoubleToBcd(const AValue: Double; var bcd: TBcd); overload;
   function IntegerToBcd(const AValue: Longint): TBcd;
   function VarToBcd(const AValue: Variant): TBcd;
   function CurrToBCD(const Curr: Currency; var BCD: TBcd; Precision: Integer; Decimals: Integer): Boolean;
 }
 
  for i := 0 to AParams.Count - 1 do
  begin
    Param := AParams[i];
    PName := Param.Name;
    Field := ASource.FindField(PName);
    if not Assigned(Field) then
       Continue;

    if (Field.DataType = ftString) and TStringField(Field).FixedChar then
      Param.DataType := ftFixedChar
    else if (Field.DataType = ftMemo) and (Field.Size > 255) then
      Param.DataType := ftString
    else if (Field.DataType in [ftWideString, ftFmtMemo]) then
      Param.DataType := ftString
    else if (Field.DataType in [ftFloat, ftLargeint]) then
      Param.DataType := ftFMTBcd
    else
      Param.DataType := Field.DataType;

    // Adjust "Integer" params
    {if (Param.DataType in [ftSmallint, ftInteger, ftWord, ftCurrency,
         ftAutoInc]) then
       Param.DataType := ftBCD; }

    if (Field.DataType in [ftDate, ftTime, ftDateTime, ftTimeStamp]) then
       begin
         Param.AsSQLTimeStamp := SqlTimSt.DateTimeToSQLTimeStamp(Field.AsDateTime);
         if VarIsNull(Field.Value) or (Field.AsDateTime = 0) then
           Param.Clear;
       end
    else if (Field.DataType in [ftBcd, ftFMTBcd]) then
       begin
         if (Field is TFloatField) then
            Param.AsFMTBCD := DoubleToBcd(Field.AsFloat)
         else
            Param.AsFMTBCD := IntegerToBcd(Field.AsInteger);
       end
    else
       begin
         if VarIsNull(Field.Value) then
           Param.Clear
         else
           Param.Value := Field.Value;
         Param.Size := Field.DataSize;
         if Field.DataType in [ftBcd, ftFMTBcd] then
            Param.NumericScale := Field.Size;
      end;
  end;
end;

procedure TIQWebDbxCustomDataSet.DoGetTableName;
begin
  if Assigned(FOnGetTableName) then
     FOnGetTableName(Sender, DataSet, TableName)
  else
     TableName := UpperCase(Trim(TableName));
end;

procedure TIQWebDbxCustomDataSet.DoApplyUpdates(DataSet: TDataSet);
begin
  if Self.ChangeCount > 0 then
     try
       if Self.ApplyUpdates(0) > 0 then
          Self.CancelUpdates;
       except on E:Exception do
        if (Pos('MISMATCH IN DATAPACKET',UpperCase(E.Message)) = 0) then
          raise;
     end;
end;

function TIQWebDbxCustomDataSet.GetKeyFieldName: String;
var
   i: Integer;
begin
  // Initialize the result value
  Result := '';
  // If the 'ID' field is available, use it
  if IsFieldInDataSet('ID') then
     Result := 'ID'
  // Otherwise, get first key field in dataset
  else
     for i := 0 to FieldCount - 1 do
         if (pfInKey in Fields[i].ProviderFlags) then
         begin
           Result := Fields[i].FieldName;
           Break;
         end;
end;

function TIQWebDbxCustomDataSet.GetMasterSource: TDataSource;
begin
  Result := TClientDataSet(Self).MasterSource;
end;

procedure TIQWebDbxCustomDataSet.SetMasterSource(const Value: TDataSource);
begin
  TClientDataSet(Self).MasterSource := Value;
  FDataSet.DataSource := Value;
  if Assigned(TClientDataSet(Self).MasterSource) then
     TClientDataSet(Self).PacketRecords := 0
  else
     TClientDataSet(Self).PacketRecords := PACKET_RECORD_COUNT;
end;

{ TDbxQuery }

procedure TIQWebDbxQuery.DefineProperties(Filer: TFiler);

  function WriteData: Boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not Params.IsEqual(TIQWebDbxQuery(Filer.Ancestor).Params) else
      Result := Params.Count > 0;
  end;

begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('ParamData', ReadParamData, WriteParamData, WriteData);
end;

procedure TIQWebDbxQuery.ReadParamData(Reader: TReader);
begin
  Reader.ReadValue;
  Reader.ReadCollection(Params);
end;

procedure TIQWebDbxQuery.Refresh;
begin
  try
    DisableControls;
    DoBeforeRefresh(Self);
    Close;
    Open;
    DoAfterRefresh(Self);
  finally
    EnableControls;
  end;
end;

procedure TIQWebDbxQuery.WriteParamData(Writer: TWriter);
begin
  Writer.WriteCollection(Params);
end;

procedure TIQWebDbxQuery.ExecSQL;
begin
  DataSet.ExecSQL();
end;

procedure TIQWebDbxQuery.Open;
begin
  if not Assigned(SQLConnection) then
     Exit;

  if not SQLConnection.Connected then
     SQLConnection.Connected := True;

  if not SQLConnection.Connected then
     Exit;

  TIQWebDbxCustomDataSet(Self).Open;
  if not DataSet.Active then
     DataSet.Open;
end;

{procedure TDbxQuery.GetDetailLinkFields(MasterFields, DetailFields: TList);

  function AddFieldToList(const FieldName: string; DataSet: TDataSet;
    List: TList): Boolean;
  var
    Field: TField;
  begin
    Field := DataSet.FindField(FieldName);
    if (Field <> nil) then
      List.Add(Field);
    Result := Field <> nil;
  end;

var
  i: Integer;
begin
  MasterFields.Clear;
  DetailFields.Clear;
  if (MasterSource <> nil) and (MasterSource.DataSet <> nil) then
    for i := 0 to Params.Count - 1 do
      if AddFieldToList(Params[i].Name, MasterSource.DataSet, MasterFields) then
         AddFieldToList(Params[i].Name, Self, DetailFields);
end;
}

function TIQWebDbxQuery.GetParamsCount: Word;
begin
  // Surface property from dataset
  Result := DataSet.Params.Count;
end;

function TIQWebDbxQuery.ParamByName(const Value: string): TParam;
begin
  // Surface property from dataset
  Result := DataSet.ParamByName(Value);
end;

function TIQWebDbxQuery.GetParamsList: TParams;
begin
  // Surface property from dataset
  FixParamTypes(DataSet.Params);
  Result := DataSet.Params;
end;

procedure TIQWebDbxQuery.SetParamsList(Value: TParams);
begin
  // Surface property from dataset
  DataSet.Params.Assign(Value);
  FixParamTypes(DataSet.Params);
end;

function TIQWebDbxQuery.GetSQL: TStrings;
begin
  // Surface property from dataset
  Result := TSQLQuery(DataSet).SQL;
end;

procedure TIQWebDbxQuery.SetSQL(Value: TStrings);
begin
  // Surface property from dataset
  TSQLQuery(DataSet).SQL.Clear;
  TSQLQuery(DataSet).SQL.AddStrings(Value);
end;

function TIQWebDbxQuery.GetParamCheck: Boolean;
begin
  // Surface property from dataset
  Result := DataSet.ParamCheck;
end;

procedure TIQWebDbxQuery.SetParamCheck(const Value: Boolean);
begin
  // Surface property from dataset
  DataSet.ParamCheck := Value;
end;

function TIQWebDbxQuery.GetText: string;
begin
  // Surface property from dataset
  Result := DataSet.CommandText;
end;

function TIQWebDbxQuery.GetPrepared: Boolean;
begin
  // Surface property from dataset
  Result := DataSet.Prepared;
end;

procedure TIQWebDbxQuery.SetPrepared(const Value: Boolean);
begin
  // Surface property from dataset
  DataSet.Prepared := Value;
end;

function TIQWebDbxQuery.GetOnGetTableName: TGetTableNameEvent;
begin
  // Surface property from provider
  Result := FProvider.OnGetTableName;
end;

procedure TIQWebDbxQuery.SetOnGetTableName(const Value: TGetTableNameEvent);
begin
  // Surface property from provider
  FProvider.OnGetTableName := Value;
end;

function TIQWebDbxQuery.GetActive: Boolean;
begin
  Result := TClientDataSet(Self).Active;
end;

procedure TIQWebDbxQuery.SetActive(const Value: Boolean);
begin
  if Value then
     Self.Open
  else
     Disconnect;
end;

procedure TIQWebDbxQuery.Disconnect;
begin
  TClientDataSet(Self).Active := False;
  DataSet.Active := False;
end;

{
procedure TDbxQuery.PopulateParamValuesFromDataSource;
begin
  // Developer Note:  This was intended as a way to populate the
  // parameters based on a parent datasource.  While it does work,
  // the detail dataset would need to be refreshed after scrolling.
  // So, this method is currently not called.
  
  if Assigned(DataSource) and Assigned(DataSource.DataSet) then
     FillParams(DataSource.DataSet, Self.DataSet.Params);
end;
}

{ TDbxTable }

constructor TIQWebDbxTable.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFieldList := TStringList.Create;
  FCommand:= TStringList.Create;

  // Set the internal event; this is required for updating data.
  FProvider.OnGetTableName := Self.DoOnGetTableName;

  // Since this is working as a table (not a query), this
  // must be set to false or the dataset is considered read-only.
  FProvider.ResolveToDataSet := False;
end;

destructor TIQWebDbxTable.Destroy;
begin
  if Assigned(FFieldList) then FreeAndNil(FFieldList);
  if Assigned(FCommand) then FreeAndNil(FCommand);
  inherited Destroy;
end;

{procedure TDbxTable.GetDetailLinkFields(MasterFields, DetailFields: TList);
var
  i: Integer;
  Idx: TIndexDef;
begin
  MasterFields.Clear;
  DetailFields.Clear;
  if (MasterSource <> nil) and (MasterSource.DataSet <> nil) and
     (Self.MasterFields <> '') then
  begin
    Idx := nil;
    MasterSource.DataSet.GetFieldList(MasterFields, Self.MasterFields);
    UpdateIndexDefs;
    if IndexName <> '' then
      Idx := IndexDefs.Find(IndexName)
    else if IndexFieldNames <> '' then
      Idx := IndexDefs.GetIndexForFields(IndexFieldNames, False)
    else
      for i := 0 to IndexDefs.Count - 1 do
        if ixPrimary in IndexDefs[i].Options then
        begin
          Idx := IndexDefs[i];
          break;
        end;
    if Idx <> nil then
      GetFieldList(DetailFields, Idx.Fields);
  end;
end;}

procedure TIQWebDbxTable.GetDetailLinkFieldsEx(AMasterFields, ADetailFields: TStringList);
var
   i: Integer;
   sl: TStringList;
begin
  if Assigned(AMasterFields) and Assigned(ADetailFields) then
  try
     sl := TStringList.Create;
     
     AMasterFields.Clear;
     ADetailFields.Clear;

     sl.Text := SysUtils.StringReplace(Self.MasterFields, ';', #13, [rfReplaceAll,rfIgnoreCase]);
     for i := 0 to sl.Count - 1 do
      if Trim(sl.Strings[i]) > '' then
         AMasterFields.Add(sl.Strings[i]);
     sl.Clear;
     
     sl.Text := SysUtils.StringReplace(Self.IndexFieldNames, ';', #13, [rfReplaceAll,rfIgnoreCase]);
     for i := 0 to sl.Count - 1 do
      if Trim(sl.Strings[i]) > '' then
         ADetailFields.Add(sl.Strings[i]);

  finally
     if Assigned(sl) then FreeAndNil(sl);
  end;
end; 

function TIQWebDbxTable.GetActive: Boolean;
begin
  Result := TClientDataSet(Self).Active;
end;

procedure TIQWebDbxTable.SetActive(const Value: Boolean);
begin
  if Value then
     Self.Open
  else
     Disconnect;
end;

procedure TIQWebDbxTable.Disconnect;
begin
  TClientDataSet(Self).Active := False;
end;

procedure TIQWebDbxTable.InternalBeforeOpen(DataSet: TDataSet);
begin
  // Check the table name property; it must exist.
  if (TableName = '') then
     raise Exception.Create('Table name not provided.');

  SetCommandText;

  inherited InternalBeforeOpen(DataSet);
end;

procedure TIQWebDbxTable.Refresh;
begin
  try
    DisableControls;
    DoBeforeRefresh(Self);
    Close;
    Open;
    DoAfterRefresh(Self);
  finally
    EnableControls;
  end;
end;

procedure TIQWebDbxTable.SetTableName(const Value: String);
begin
  FTableName := UpperCase(Value);
  if not (csLoading in ComponentState) then
     SetCommandText;
end;

procedure TIQWebDbxTable.SetCommandText;
var
   AOrderBy: String;

   AMaster, ADetail: TStringList;
   i, x: Integer;
   s_and: String;
begin
  FCommand.Clear;
  if TableName = '' then Exit;
  FCommand.Add('SELECT * ');
  FCommand.Add(Format('  FROM %s', [LowerCase(TableName)]));

  try
     AMaster := TStringList.Create;
     ADetail := TStringList.Create;
     GetDetailLinkFieldsEx(AMaster, ADetail);
     x := Min(AMaster.Count, ADetail.Count);
     if x > 0 then
        begin
          for i := 0 to x - 1 do
          begin
            if i < x - 1 then
               s_and := 'AND'
            else
               s_and := '';
            FCommand.Add(Format('WHERE %s = :%s %s',
             [ADetail.Strings[i], AMaster.Strings[i], s_and]));
          end;
        end;
  finally
     FreeAndNil(AMaster);
     FreeAndNil(ADetail);
  end;

  // Add the data order based on index field names
  AOrderBy := '';
  if (IndexFieldNames > '') and (Self.FindField('ID') <> NIL) then
     AOrderBy := SysUtils.StringReplace(LowerCase(IndexFieldNames), ';', ', ', [rfReplaceAll, rfIgnoreCase]) + ', id'
  else if (Self.FindField('ID') <> NIL) then
     AOrderBy := 'id'
  else if (IndexFieldNames > '') and (Self.FindField('ID') = NIL) then
     AOrderBy := SysUtils.StringReplace(LowerCase(IndexFieldNames), ';', ', ', [rfReplaceAll, rfIgnoreCase]);

  if AOrderBy > '' then
     FCommand.Add('ORDER BY ' + AOrderBy);

  DataSet.CommandText := FCommand.Text;
end;

function TIQWebDbxTable.GetIndexFieldNames: String;
begin
  // Return property value
  Result := TClientDataSet(Self).IndexFieldNames;
end;

procedure TIQWebDbxTable.SetIndexFieldNames(const Value: String);
begin
  // After setting this property, update the SQL command statement.
  TClientDataSet(Self).IndexFieldNames := Value;
  SetCommandText;
end;

function TIQWebDbxTable.GetIndexName: String;
begin
  // Return property value
  Result := TClientDataSet(Self).IndexName;
end;

procedure TIQWebDbxTable.SetIndexName(const Value: String);
begin
  // After setting this property, update the SQL command statement.
  TClientDataSet(Self).IndexName := Value;
  SetCommandText;
end;

function TIQWebDbxTable.GetMasterFields: String;
begin
  // Return property value
  Result := TClientDataSet(Self).MasterFields;
end;

procedure TIQWebDbxTable.SetMasterFields(const Value: String);
begin
  // After setting this property, update the SQL command statement.
  TClientDataSet(Self).MasterFields := Value;
  SetCommandText;
end;

procedure TIQWebDbxTable.GetBlobFields(var AFields: TStringList);
var
   q: TSQLQuery;
begin
  if FTableName = '' then Exit;
  if not Assigned(SQLConnection) then Exit;
  if not Assigned(AFields) then Exit;
  AFields.Clear;
  q := TSQLQuery.Create(NIL);
  try
     q.SQLConnection := Self.SQLConnection;
     q.SQL.Add('SELECT column_name');
     q.SQL.Add('FROM cols');
     q.SQL.Add('WHERE');
     q.SQL.Add(' data_type = ''BLOB''');
     q.SQL.Add(Format(' AND table_name = ''%s''',[FTableName]));
     q.Open;
     while not q.EOF do
      begin
        AFields.Add(q.FieldByName('COLUMN_NAME').AsString);
        q.Next;
      end;
  finally
     q.Free;
  end;
end;

procedure TIQWebDbxTable.GetClobFields(var AFields: TStringList);
var
   q: TSQLQuery;
begin
  if FTableName = '' then Exit;
  if not Assigned(SQLConnection) then Exit;
  if not Assigned(AFields) then Exit;
  AFields.Clear;
  q := TSQLQuery.Create(NIL);
  try
     q.SQLConnection := Self.SQLConnection;
     q.SQL.Add('SELECT column_name');
     q.SQL.Add('FROM cols');
     q.SQL.Add('WHERE');
     q.SQL.Add(' data_type = ''CLOB''');
     q.SQL.Add(Format(' AND table_name = ''%s''',[FTableName]));
     q.Open;
     while not q.EOF do
      begin
        AFields.Add(q.FieldByName('COLUMN_NAME').AsString);
        q.Next;
      end;
  finally
     q.Free;
  end;
end;

procedure TIQWebDbxTable.GetLongFields(var AFields: TStringList);
var
   q: TSQLQuery;
begin
  if FTableName = '' then Exit;
  if not Assigned(SQLConnection) then Exit;
  if not Assigned(AFields) then Exit;
  AFields.Clear;
  q := TSQLQuery.Create(NIL);
  try
     q.SQLConnection := Self.SQLConnection;
     q.SQL.Add('SELECT column_name');
     q.SQL.Add('FROM cols');
     q.SQL.Add('WHERE');
     q.SQL.Add(' (data_type = ''LONG''');
     q.SQL.Add('  OR data_type = ''LONG RAW''');
     q.SQL.Add('  OR data_type = ''RAW'')');
     q.SQL.Add(Format(' AND table_name = ''%s''',[FTableName]));
     q.Open;
     while not q.EOF do
      begin
        AFields.Add(q.FieldByName('COLUMN_NAME').AsString);
        q.Next;
      end;
  finally
     q.Free;
  end;
end;

procedure TIQWebDbxTable.DoOnGetTableName;
begin
  ATableName := UpperCase(Trim(Self.TableName));
end;

{ TSQLGenerator }

constructor TSQLGenerator.Create(AOwner: TComponent; ATableName: String);
begin
  inherited Create(AOwner);
  FTableName := ATableName;
  FFields := TStringList.Create;
  FKeyFields := TStringList.Create;
  FModifySQL := TStringList.Create;
  FInsertSQL := TStringList.Create;
  FDeleteSQL := TStringList.Create;
  FModifiedFields := TStringList.Create;
  FSourceNullFields := TStringList.Create;
  FModifiedNullFields := TStringList.Create;
  FClobFields := TStringList.Create;
  FBlobFields := TStringList.Create;
  FLongFields := TStringList.Create;
  FFieldMap := TFieldMap.Create(Self);
  FModifyParams := TStringList.Create;
  FInsertParams := TStringList.Create;
  FDeleteParams := TStringList.Create;
end;

destructor TSQLGenerator.Destroy;
begin
  if Assigned(FFields) then FreeAndNil(FFields);
  if Assigned(FModifySQL) then FreeAndNil(FModifySQL);
  if Assigned(FInsertSQL) then FreeAndNil(FInsertSQL);
  if Assigned(FDeleteSQL) then FreeAndNil(FDeleteSQL);
  if Assigned(FModifiedFields) then FreeAndNil(FModifiedFields);
  if Assigned(FSourceNullFields) then FreeAndNil(FSourceNullFields);
  if Assigned(FModifiedNullFields) then FreeAndNil(FModifiedNullFields);
  if Assigned(FKeyFields) then FreeAndNil(FKeyFields);
  if Assigned(FClobFields) then FreeAndNil(FClobFields);
  if Assigned(FBlobFields) then FreeAndNil(FBlobFields);
  if Assigned(FLongFields) then FreeAndNil(FLongFields);
  if Assigned(FFieldMap) then FreeAndNil(FFieldMap);
  if Assigned(FModifyParams) then FreeAndNil(FModifyParams);
  if Assigned(FInsertParams) then FreeAndNil(FInsertParams);
  if Assigned(FDeleteParams) then FreeAndNil(FDeleteParams);
  inherited Destroy;
end;

procedure TSQLGenerator.Execute;
begin
  if (TableName = '') then
     raise Exception.Create('SQL Generator Table Name unassigned.  ' +
      'Please assign a table name.');
  ListFields;
  BuildInsert;
  BuildUpdate;
  BuildDelete;
end;

procedure TSQLGenerator.ListFields;
begin
  // provided by descendent
end;

function TSQLGenerator.CommaStr(const AList: TStringList;
 const ACurIndex: Integer): String;
begin
  // Returns a comma, if required
  if Assigned(AList) then
     Result := StrUtils.IfThen((AList.Count > 1) and
               (ACurIndex < AList.Count - 1), ', ','');
end;

procedure TSQLGenerator.BuildInsert;
var
  sl: TStringList;

  procedure _GetFieldList(const AParams: Boolean);
  var
     i, i_map: Integer;
     s_name, s_param, s_comma: String;
  begin
    // Initialization
    s_name := '';
    s_param := '';
    s_comma := '';
    i_map := -1;
    // Clear list
    sl.Clear;
    // Cycle main field list, and build SQL field list
    for i := 0 to FFields.Count - 1 do
      begin
        i_map := -1; // reset map index; used below.
        s_name := FFields.Strings[i]; // Oracle field name
        s_param := s_name;
        s_comma := CommaStr(FFields, i);

        // If a map is provided, but this field is not in the map,
        // then do not add this field to the statement.
        if Assigned(FFieldMap) and (FFieldMap.Count > 0) then
           begin
             i_map := FFieldMap.IndexOfTarget(s_name);
             if i_map = -1 then
                Continue;
           end;

        if AParams then
           begin
             // Get the source field name as the param string
             if (i_map <> -1) then
                begin
                  s_param := FFieldMap.Source(i_map);
                  if s_param = '' then s_param := s_name;
                end;
             if FBlobFields.IndexOf(s_name) > -1 then
                sl.Add(Format('  EMPTY_BLOB()%s', [s_comma]))
             else if FClobFields.IndexOf(s_name) > -1 then
                sl.Add(Format('  EMPTY_CLOB()%s', [s_comma]))
             else if FSourceNullFields.IndexOf(s_name) > -1 then
                sl.Add(Format('  NULL%s', [s_comma]))
             else sl.Add(Format('  :%s%s', [UpperCase(s_param), s_comma]));

             FInsertParams.Add(s_param);
                          
           end
        else
           sl.Add(Format('  %s%s', [LowerCase(s_name), s_comma]));
      end;
  end;

begin
  try
     sl := TStringList.Create;
     FInsertParams.Clear;
     FInsertSQL.Clear;
     if FDBLink > '' then
        FInsertSQL.Add(Format('INSERT INTO %s@%s ',
         [LowerCase(TableName), LowerCase(FDBLink)]))
     else
        FInsertSQL.Add(Format('INSERT INTO %s ', [LowerCase(TableName)]));
     FInsertSQL.Add('(');
     _GetFieldList(False {Params});
     FInsertSQL.AddStrings(sl);
     FInsertSQL.Add(')');
     FInsertSQL.Add('VALUES');
     FInsertSQL.Add('(');
     sl.Clear;
     _GetFieldList(True {Params});
     FInsertSQL.AddStrings(sl);
     FInsertSQL.Add(')');
     LobClause(sl);
     if sl.Count > 0 then
        FInsertSQL.AddStrings(sl);
  finally
     if Assigned(sl) then FreeAndNil(sl);
  end;
end;

procedure TSQLGenerator.BuildUpdate;
var
  sl: TStringList;

  function _GetFieldList: Boolean;
  var
    i, i_map: Integer;
    s_name, s_param, s_comma: String;
    sl_use: TStringList;
  begin
    // Initialization
    Result := False;
    s_name := '';
    s_param := '';
    s_comma := '';
    i_map := -1;
    // Clear list
    sl.Clear;
    // Cycle main field list, and build SQL field list
    try
       sl_use := TStringList.Create;
       if FModifiedFields.Count > 0 then
          sl_use.AddStrings(FModifiedFields)
       else
          sl_use.AddStrings(FFields);
       for i := 0 to sl_use.Count - 1 do
         begin
           s_comma := CommaStr(sl_use, i);
           s_name := sl_use.Strings[i];
           s_param := s_name;
           
           // If a map is provided, but this field is not in the map,
           // then do not add this field to the statement.
           if Assigned(FFieldMap) and (FFieldMap.Count > 0) then
              begin
                i_map := FFieldMap.IndexOfTarget(s_name);
                if i_map = -1 then
                   Continue;
                s_param := FFieldMap.Source(i_map);
              end;

           if FKeyFields.IndexOf(s_name) > -1 then Continue;
           if FBlobFields.IndexOf(s_name) > -1 then
              sl.Add(Format('  %s = EMPTY_BLOB()%s', [s_name, s_comma]))
           else if FClobFields.IndexOf(s_name) > -1 then
              sl.Add(Format('  %s = EMPTY_CLOB()%s', [s_name, s_comma]))
           else if FModifiedNullFields.IndexOf(s_name) > -1 then
              sl.Add(Format('  %s = NULL%s', [s_name, s_comma]))
           else sl.Add(Format('  %s = :%s%s', [s_name, UpperCase(s_param), s_comma]));

           FModifyParams.Add(s_param);
         end;
       Result := sl.Count > 0;
    finally
       if Assigned(sl_use) then FreeAndNil(sl_use);
    end;
  end;

begin
  try
     sl := TStringList.Create;
     FModifyParams.Clear;
     FModifySQL.Clear;
     if not _GetFieldList then Exit;

     if FDBLink > '' then
        FModifySQL.Add(Format('UPDATE %s@%s SET',
         [LowerCase(TableName), LowerCase(FDBLink)]))
     else
        FModifySQL.Add(Format('UPDATE %s SET', [LowerCase(TableName)]));
     FModifySQL.AddStrings(sl);
     sl.Clear;

     if FKeyFields.Count = 0 then
        GetWhereNoKey(sl, FModifyParams) // see below
     else
        ParseFieldListAsWhereSQL(FKeyFields, FFieldMap, sl, FModifyParams);

     if sl.Count > 0 then
        begin
          FModifySQL.Add('WHERE');
          FModifySQL.AddStrings(sl);
        end
     else
        begin
          FModifySQL.Clear;
          Exit;
        end;
     sl.Clear;

     LobClause(sl);
     FModifySQL.AddStrings(sl);
  finally
     if Assigned(sl) then FreeAndNil(sl);
  end;
end;

procedure TSQLGenerator.BuildDelete;
var
   where: TStringList;
begin
  try
     where := TStringList.Create;
     FDeleteParams.Clear;
     FDeleteSQL.Clear;

     if FDBLink > '' then
        FDeleteSQL.Add(Format('DELETE FROM %s@%s',
          [LowerCase(TableName), LowerCase(FDBLink)]))
     else
        FDeleteSQL.Add(Format('DELETE FROM %s', [LowerCase(TableName)]));

     if FKeyFields.Count = 0 then
        GetWhereNoKey(where, FDeleteParams) // see below
     else
        ParseFieldListAsWhereSQL(FKeyFields, FFieldMap, where, FDeleteParams);

     if where.Count = 0 then
        begin
          FDeleteSQL.Clear;
          FDeleteParams.Clear;
          Exit;
        end;

     if where.Count > 0 then
        begin
          FDeleteSQL.Add('WHERE');
          FDeleteSQL.AddStrings(where);
        end
     else FDeleteSQL.Clear;
     
  finally
     if Assigned(where) then FreeAndNil(where);
  end;
end;

procedure TSQLGenerator.GetFieldList(
 AOptions: TSQLGeneratorFieldListOptions; var AList: TStringList);
var
   i: Integer;
   AFieldName: String;
begin
  // Build list of update fields
  if not Assigned(AList) then Exit;

  AList.Clear;

  for i := 0 to FFields.Count - 1 do
    begin
      // Set the field name var
      AFieldName := FFields.Strings[i];
      if AFieldName = '' then Continue;

      if not (floModified in AOptions) and
         (FModifiedFields.Count > 0) and
         (FModifiedFields.IndexOf(AFieldName) > -1) then
         Continue;

      if not (floBlob in AOptions) and
         (FBlobFields.Count > 0) and
         (FBlobFields.IndexOf(AFieldName) > -1) then
         Continue;

      if not (floClob in AOptions) and
         (FClobFields.Count > 0) and
         (FClobFields.IndexOf(AFieldName) > -1) then
         Continue;

      if not (floLong in AOptions) and
         (FLongFields.Count > 0) and
         (FLongFields.IndexOf(AFieldName) > -1) then
         Continue;

      AList.Add(AFieldName);
    end;
end;

procedure TSQLGenerator.GetWhereNoKey(var AFieldList: TStringList;
 var AParamList: TStringList);
var
   fields, nulls: TStringList;
begin
  try
     fields := TStringList.Create;
     nulls := TStringList.Create;
     GetFieldList([floStandard], fields);
     if Self.FSourceNullFields.Count > 0 then
        nulls.AddStrings(Self.FSourceNullFields);
     ParseFieldListAsWhereSQL(fields, nulls, FFieldMap, AFieldList, AParamList);
  finally
     if Assigned(fields) then FreeAndNil(fields);
     if Assigned(nulls) then FreeAndNil(nulls);
  end;
end;

function TSQLGenerator.GetSQLIndex(const Index: Integer): TStrings;
begin
  case Index of
   0: Result := FModifySQL;
   1: Result := FInsertSQL;
   2: Result := FDeleteSQL;
  else Result := NIL;
  end;
end;

function TSQLGenerator.GetParamIndex(const Index: Integer): TStrings;
begin
  case Index of
   0: Result := FModifyParams;
   1: Result := FInsertParams;
   2: Result := FDeleteParams;
  else Result := NIL;
  end;
end;

procedure TSQLGenerator.LobClause(var AList: TStringList);
var
  i, i_map: Integer;
  s_name, s_param, s_comma: String;
  sl: TStringList;
  s_fld, s_par: String;
begin
  // This method returns a "RETURNING" for LOB fields.  This additional
  // clause at the end of an INSERT or UPDATE statement is required
  // when updating a BLOB or CLOB field.
  //
  // For Example:
  //   RETURNING Field1, Field2 INTO :FIELD1, :FIELD2
  //
  // If not BLOB or CLOB fields are in the table, then an empty
  // string list will be returned.

  // Initialization
  sl := NIL;
  s_fld := '';
  s_par := '';
  s_name := '';
  s_param := '';
  s_comma := '';

  // Validation
  if not Assigned(AList) then Exit;
  // Clear list
  AList.Clear;
  // Build SQL
  try
     sl := TStringList.Create;
     if FModifiedFields.Count > 0 then
        sl.AddStrings(FModifiedFields)
     else
        sl.AddStrings(FFields);

     for i := 0 to sl.Count - 1 do
       begin
         s_comma := CommaStr(sl, i);
         s_name := Trim(sl.Strings[i]);
         s_param := s_name;
         if s_name = '' then Continue;
         
         // Skip NULL fields - we want to keep these as EMPTY_BLOB() or EMPTY_CLOB()
         if FModifiedNullFields.IndexOf(s_name) > -1 then
            Continue;

         // If a map is provided, but this field is not in the map,
         // then do not add this field to the statement.
         if Assigned(FFieldMap) and (FFieldMap.Count > 0) then
            begin
              i_map := FFieldMap.IndexOfTarget(s_name);
              if i_map = -1 then
                 Continue;
              s_param := FFieldMap.Source(i_map);
            end;

         if (FBlobFields.IndexOf(s_name) > -1) or
            (FClobFields.IndexOf(s_name) > -1) then
            begin
              s_fld := s_fld + LowerCase(s_name) + s_comma;
              s_par := s_par + ':'+UpperCase(s_param) + s_comma;
            end;
       end;

     if (Trim(s_fld) > '') and (Trim(s_par) > '') then
        begin
          s_fld := BlockWrapText(s_fld, 2);
          s_par := BlockWrapText(s_par, 2);
          AList.Add('RETURNING ');
          AList.Add(s_fld);
          AList.Add('INTO ');
          AList.Add(s_par); 
        end;
  finally
     if Assigned(sl) then FreeAndNil(sl);
  end;
end;

function TSQLGenerator.BlockWrapText(const S: String; const AIndent: Integer): String;
var
   sl: TStringList;
   tmp: String;
   i: Integer;
begin
  // Initialization
  Result := S;
  sl := NIL;
  // Get the wrapped text
  try
     sl := TStringList.Create;
     tmp := WrapText(S, #13, ['.', ',', ' ', #9, '-'], 65);
     sl.Text := tmp;
     if AIndent > 0 then
        for i := 0 to sl.Count - 1 do
            sl.Strings[i] := StrUtils.DupeString(' ', AIndent) + Trim(sl.Strings[i]);
     Result := SysUtils.TrimRight(sl.Text);
  finally
     if Assigned(sl) then FreeAndNil(sl);
  end;
end;

{ TSQLGeneratorOracle }

constructor TSQLGeneratorOracle.Create(AOwner: TComponent;
  ASQLConnection: TSQLConnection; ATableName: String);
begin
  inherited Create(AOwner, ATableName);
  FSQLConnection := ASQLConnection;
end;

procedure TSQLGeneratorOracle.ListFields;
var
   q: TSQLQuery;
   fld, dat: String;
begin
  q := NIL;
  
  if not Assigned(FSQLConnection) then
     raise Exception.Create('Application Error: SQL Connection not provided.');

  //inherited;
  try
     q := TSQLQuery.Create(NIL);
     q.SQLConnection := Self.SQLConnection;
     q.SQL.Add('SELECT column_name, data_type');
     q.SQL.Add('FROM cols');
     q.SQL.Add(Format('WHERE table_name = ''%s''', [FTableName]));
     q.Open;
     while not q.EOF do
      begin
        fld := q.Fields[0].AsString;
        dat := q.Fields[1].AsString;
        FFields.Add(fld);
        if dat = 'BLOB' then
           FBlobFields.Add(fld)
        else if dat = 'CLOB' then
           FClobFields.Add(fld)
        else if (dat = 'LONG') or (dat = 'LONG RAW') or (dat = 'RAW') then
           FLongFields.Add(fld);
        q.Next;
      end;

     FKeyFields.Text := GetPrimaryKey;

  finally
     if Assigned(q) then FreeAndNil(q);
  end;
end;

function TSQLGeneratorOracle.GetPrimaryKey: String;
begin
  Result := '';

  if (FTableName = '') or (Self.SQLConnection = NIL) then Exit;

  Result := DBX_GetValStrFmt(
   Self.SQLConnection,
   'SELECT cols.column_name'#13 +
   'FROM all_constraints cons, all_cons_columns cols'#13 +
   'WHERE cols.table_name = ''%s'' AND'#13 +
   '      cons.constraint_type = ''P'' AND'#13 +
   '      cons.constraint_name = cols.constraint_name AND'#13 +
   '      cons.owner = cols.owner'#13 +
   'ORDER BY cols.table_name, cols.position',
   [Trim(UpperCase(FTableName))]);
end;

{ TSQLGeneratorDataSet }

constructor TSQLGeneratorDataSet.Create(AOwner: TComponent;
  ADataSet: TDataSet; ATableName, AKeyFields: String);
begin
 inherited Create(AOwner, ATableName);
 if AKeyFields > '' then
     FKeyFields.Text := SysUtils.StringReplace(AKeyFields, ';', #13,
      [rfReplaceAll, rfIgnoreCase]);
 FDataSet := ADataSet;
end;

procedure TSQLGeneratorDataSet.ListFields;
var
   i: Integer;
begin
  if not Assigned(FDataSet) then
     raise Exception.Create('SQL Generator Dataset unassigned.  ' +
      'Please assign a dataset.');
  // Build basic list of fields
  FFields.Clear;
  for i := 0 to DataSet.FieldCount - 1 do
   FFields.Add(DataSet.Fields[i].FieldName);
end;

{ TSQLGeneratorDbxDataSet }

constructor TSQLGeneratorDbxDataSet.Create(AOwner: TComponent;
  ASQLConnection: TSQLConnection; ASourceDS: TDataSet;
  ADeltaDS: TCustomClientDataSet; ATableName, AKeyFields: String);
begin
 inherited Create(AOwner, ATableName);
 SQLConnection := ASQLConnection;
 if AKeyFields > '' then
     FKeyFields.Text := SysUtils.StringReplace(AKeyFields, ';', #13,
      [rfReplaceAll, rfIgnoreCase]);
 FSourceDS := ASourceDS;
 FDeltaDS := ADeltaDS;
end;

procedure TSQLGeneratorDbxDataSet.ListFields;
var
   i: Integer;
   sl: TStringList;
begin
  if not Assigned(SourceDS) then
     raise Exception.Create('Application Error: SQL Generator source ' +
      'dataset unassigned.  Please assign a dataset.');
  if not Assigned(FSQLConnection) then
     raise Exception.Create('Application Error: SQL Connection unassigned.');

  // Build basic list of fields
  FFields.Clear;
  for i := 0 to SourceDS.FieldCount - 1 do
   FFields.Add(SourceDS.Fields[i].FieldName);

  sl := TStringList.Create;
  try
     BlobFields.Clear;
     ClobFields.Clear;
     LongFields.Clear;
     ModifiedFields.Clear;
     SourceNullFields.Clear;
     ModifiedNullFields.Clear;
     GetFieldListByDataType(FSQLConnection, TableName, ['BLOB'], sl);
     BlobFields.AddStrings(sl);
     GetFieldListByDataType(FSQLConnection, TableName, ['CLOB'], sl);
     ClobFields.AddStrings(sl);
     GetFieldListByDataType(FSQLConnection, TableName, ['LONG','LONG RAW','RAW'], sl);
     LongFields.AddStrings(sl);
     // Modified fields
     sl.Clear;
     DBX_GetDeltaFieldList(DeltaDS, sl);
     if sl.Count > 0 then
        ModifiedFields.AddStrings(sl);
     // Null fields
     for i := 0 to SourceDS.FieldCount - 1 do
      if SourceDS.Fields[i].IsNull then
         SourceNullFields.Add(SourceDS.Fields[i].FieldName);
     for i := 0 to DeltaDS.FieldCount - 1 do
      if (DeltaDS.Fields[i].NewValue <> Unassigned) and
         (((DeltaDS.Fields[i].DataType in [ftString, ftOraClob]) and
           (DeltaDS.Fields[i].AsString = '')) or
           DeltaDS.Fields[i].IsNull) then
           ModifiedNullFields.Add(DeltaDS.Fields[i].FieldName);
  finally
     if Assigned(sl) then FreeAndNil(sl);
  end;
end;

end.

