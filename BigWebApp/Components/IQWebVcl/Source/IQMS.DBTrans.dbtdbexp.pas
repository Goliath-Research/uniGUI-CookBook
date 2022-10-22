unit IQMS.DBTrans.dbtdbexp;

{ *** DBExpress SQL Methods ***

  This unit contains procedures and functions that employ DBExpress
  components.

  05/29/2009
  This unit added.  We needed a way to import from tables with more
  than 63 fields.
}

interface

uses
  Windows,
  Forms,
  Dialogs,
  Messages,
  SysUtils,
  Classes,
  Controls,
  IQMS.Common.Registry,
  DB,
  Variants,
  Provider,
  DBClient,
  FMTBcd,
  SqlExpr,
  IQMS.DBTrans.dbttypes,
  IQMS.WebVcl.DBExpress,
  IQMS.Common.DataConst;

// Initialize an SQL Connection (TSQLConnection) for the given parameters.
// This is used when preparing a connection for a particular datasource
// for import or export, and also for testing whether or not the connection
// parameters are correct.
function InitConnection(const ASQLConnection: TSQLConnection;
  const ADatabaseName: string; const ADataSourceType: TDataSourceType;
  const ADriverType: TDriverType; const AUserName, APassword: string;
  var AErrorMsg: string): Boolean;

function DBX_GetSQLConnection: TSQLConnection; overload;
function DBX_GetSQLConnection(var AIsNewConnection: Boolean): TSQLConnection; overload;

// Configures all of the relevant settings of an SQL connection
// to connect to the current IQMS Oracle database.  Use this method
// when programmatically creating a TSQLConnection.
function DBX_ConfigureSQLConnection(ASQLConnection: TSQLConnection;
  AMultipleTransactions: Boolean = True; DB: string = cnstFDConnectionName): Boolean; overload;
function DBX_ConfigureSQLConnection(ASQLConnection: TSQLConnection;
  AUserName: string; APassword: string): Boolean; overload;
function DBX_ConfigureSQLConnection(ASQLConnection: TSQLConnection;
  ADatabaseName: string; AUserName: string; APassword: string;
  ADriverName: string; AMultipleTransactions: Boolean = True): Boolean;
  overload;
function DBX_CloneSQLConnection(ASQLConnection: TSQLConnection): TSQLConnection;

// Sets the login properties of an SQL connection, and opens the
// connection.  Set AReOpen = True if you want to close and reopen
// the connection, if it is already open.  By default, the connection
// will not be opened if it is already open (AReOpen = False).
function DBX_OpenSQLConnection(ASQLConnection: TSQLConnection;
  AReOpen: Boolean = False; DB: string = cnstFDConnectionName): Boolean;

// Configures a transaction.  This is used when starting a sequence
// of "action" queries (insert or update), and they are performed within
// a "transaction" and committed at the end of processing.
// Parameters:
// ATransactionID = Pass a unique number that identifies the transaction
// ATransDesc = Pass the TTransactionDesc record object.
// Example:
// ...
// DBX_ConfigureTransaction(Self.Handle, ATransDesc);
// ...
// try
// // Start the transaction ...
// ASQLConnection.StartTransaction(ATransDesc);
// // Run SQL ...
// DBX_RunSQL(ASQLConnection, ASQL, Self.Handle);
// ...
// // Commit changes ...
// ASQLConnection.Commit(ATransDesc);
// finally
// // Check transaction, and rollback changes if necessary ...
// if ASQLConnection.InTransaction then
// ASQLConnection.Rollback(ATransDesc);
// end;
procedure DBX_ConfigureTransaction(const ATransactionID: LongWord;
  var ATransDesc: TTransactionDesc);

// Returns a floating point value using a DBExpress TSQLQuery.
// You must provide an existing TSQLConnection object.
function DBX_GetVal(const ASQL: string): Real; overload;
function DBX_GetVal(const ASQLConnection: TSQLConnection; const ASQL: string)
  : Real; overload;
function DBX_GetValInt(const ASQL: string): Integer; overload;
function DBX_GetValInt(const ASQLConnection: TSQLConnection; const ASQL: string)
  : Integer; overload;
function DBX_GetValFmt(const ASQL: string; const Args: array of const )
  : Real; overload;
function DBX_GetValFmt(const ASQLConnection: TSQLConnection; const ASQL: string;
  const Args: array of const ): Real; overload;
function DBX_GetValIntFmt(const ASQL: string; const Args: array of const )
  : Integer; overload;
function DBX_GetValIntFmt(const ASQLConnection: TSQLConnection;
  const ASQL: string; const Args: array of const ): Integer; overload;
function DBX_GetValStr(const ASQL: string): string; overload;
function DBX_GetValStr(const ASQLConnection: TSQLConnection; const ASQL: string)
  : string; overload;
function DBX_GetValStrFmt(const ASQL: string; const Args: array of const )
  : string; overload;
function DBX_GetValStrFmt(const ASQLConnection: TSQLConnection;
  const ASQL: string; const Args: array of const ): string; overload;
function DBX_GetValStrParam(const ASQL: string;
  const ParamsList: array of string; const ParamValues: array of Variant)
  : string; overload;
function DBX_GetValStrParam(const ASQLConnection: TSQLConnection;
  const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): string; overload;
function DBX_GetValParam(const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): Real; overload;
function DBX_GetValParam(const ASQLConnection: TSQLConnection;
  const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): Real; overload;
function DBX_GetValArray(const ASQL: string): Variant; overload;
function DBX_GetValArray(const ASQLConnection: TSQLConnection;
  const ASQL: string): Variant; overload;
function DBX_GetValArrayFmt(const ASQL: string; const Args: array of const )
  : Variant; overload;
function DBX_GetValArrayFmt(const ASQLConnection: TSQLConnection;
  const ASQL: string; const Args: array of const ): Variant; overload;

// Executes an "action" query using a DBExpress TSQLQuery.
// You must provide an existing TSQLConnection object.
function DBX_RunSQL(const ASQL: string): Boolean; overload;
function DBX_RunSQL(const ASQLConnection: TSQLConnection; const ASQL: string)
  : Boolean; overload;
function DBX_RunSQLFmt(const ASQL: string; const Args: array of const )
  : Boolean; overload;
function DBX_RunSQLFmt(const ASQLConnection: TSQLConnection; const ASQL: string;
  const Args: array of const ): Boolean; overload;

// * Param-Based SQL *
// Note:  These methods currently do not work with the ftLongWord field
// type.  Therefore, these methods should not be used.  I (Byron)
// am hoping that Delphi 2009 will add support of the unicode
// field types.
function DBX_RunSQLParam(const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): Boolean; overload;
function DBX_RunSQLParam(const ASQLConnection: TSQLConnection;
  const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): Boolean; overload;

function DBX_RunSQLParamStrings(const ASQLConnection: TSQLConnection;
  const ASQL: string; const ParamsList: TStringList;
  const ParamValues: TStringList): Boolean;

function DBX_RunSQLParamDataSet(const ASQL: string;
  const ASourceDataSet: TDataSet): Boolean; overload;
function DBX_RunSQLParamDataSet(const ASQLConnection: TSQLConnection;
  const ASQL: string; const ASourceDataSet: TDataSet): Boolean; overload;

// The following is used when applying cached updates from TDataSetProvider.
// Place this method inside the BeforeUpdateRecord event.
function DBX_UpdateDataSet(const ASQLConnection: TSQLConnection;
  const ASQL: string; const SourceDS: TDataSet;
  const DeltaDS: TCustomClientDataSet): Boolean;

procedure DBX_FillParams(const ASource: TDataSet; const AParams: TParams);
procedure DBX_FillParam(const Param: TParam; const Value: Variant);
procedure DBX_CopyFromDelta(const DeltaDS: TCustomClientDataSet;
  var ADataSet: TPacketDataSet);
procedure DBX_GetDeltaFieldList(const DeltaDS: TCustomClientDataSet;
  var AFieldList: TStringList);

function DBX_GetRecordCount(AQuery: TSQLQuery): Integer; overload;
function DBX_GetRecordCount(ATable: TSQLTable): Integer; overload;
function DBX_GetRecordCount(AQuery: TIQWebDbxQuery): Integer; overload;

function DBX_NextID(const ASQLConnection: TSQLConnection;
  ATableName: string): Real; overload;
function DBX_NextID(ATableName: string): Integer; overload;

procedure DBX_FixParamTypes(const AParams: TParams);

procedure DBX_RefreshDataSet(const ADataSet: TIQWebDbxCustomDataSet;
  AKeyFieldName: string = 'ID');
procedure DBX_RefreshDataSetEx(const ASQLConnection: TSQLConnection;
  const ADataSet: TIQWebDbxCustomDataSet; AKeyFieldName: string = 'ID');

procedure CheckAssign1000Separator(const SQLConnection: TSQLConnection;
  const ADataSet: TIQWebDbxCustomDataSet);
procedure EnsureThousandSeparatorAssigned(ADataSet: TIQWebDbxCustomDataSet);

// Assignes the DB_DM SQLConnection to all dbExpress type datasets
procedure AssignSQLConnections(AOwner: TComponent);

function DBX_AssignCDSIndexName( AClientDataSet: TClientDataSet; AFieldName: string ): Boolean;
function DBX_GetCDSIndexFieldName( cds: TClientDataSet ): string;

implementation

uses
  IQMS.DBTrans.dbtdb,
  IQMS.DBTrans.dbtrscstr,
  IQMS.DBTrans.dbtshare,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.ResStrings,
  IQMS.Common.Dates,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  SqlTimSt,
  StrUtils;

const
  cnstFloat = 'FLOAT';
  cnstInt = 'INT';
  cnstString = 'STRING';
  cnstDate = 'DATE';

procedure CheckAssign1000Separator(const SQLConnection: TSQLConnection;
  const ADataSet: TIQWebDbxCustomDataSet);
begin
  if (SQLConnection = nil) then
    Exit;

  // check switch & ensure numeric fields are assigned thousand separator
  // Note:  We must substring the field within the SQL so that the value
  // returned has a size of 1 only. This compensates for a DBExpress bug
  // where the buffer alocated for the field result is incorrect.  The
  // result is an Access Violation which appears as you attempt to close
  // the main application.  This bug has been reported a couple of times,
  // but has never been resolved.
  if DBX_GetValStr(SQLConnection,
   'SELECT SUBSTR(num_use_1000_separator, 1, 1) AS num_use_1000_separator ' +
   'FROM params WHERE ROWNUM < 2') = 'Y' then
    EnsureThousandSeparatorAssigned(ADataSet);
end;

procedure EnsureThousandSeparatorAssigned(ADataSet: TIQWebDbxCustomDataSet);
const
  DISPLAY_FORMAT_MASK = '#,##0.######';
var
  i: Integer;
begin
  if (ADataSet = nil) then
    Exit;

  for i := 0 to ADataSet.Fields.Count - 1 do
    if (Pos('_ID', ADataSet.Fields[i].FieldName) = 0) and
      (ADataSet.Fields[i].FieldName <> 'ID') and
      (ADataSet.Fields[i].FieldName <> 'BATCH') and
      (ADataSet.Fields[i].Tag <> 1) then
      begin
        if (ADataSet.Fields[i] is TFloatField) then
          begin
            if TFloatField(ADataSet.Fields[i]).Currency then
              Continue;
            if (TFloatField(ADataSet.Fields[i]).DisplayFormat = '') then
              TFloatField(ADataSet.Fields[i]).DisplayFormat :=
                DISPLAY_FORMAT_MASK;
          end

        else if (ADataSet.Fields[i] is TIntegerField) then
          begin
            if (TIntegerField(ADataSet.Fields[i]).DisplayFormat = '') then
              TIntegerField(ADataSet.Fields[i]).DisplayFormat :=
                DISPLAY_FORMAT_MASK;
          end

        else if (ADataSet.Fields[i] is TFMTBcdField) then
          begin
            if TFMTBcdField(ADataSet.Fields[i]).Currency then
              Continue;
            if (TFMTBcdField(ADataSet.Fields[i]).DisplayFormat = '') then
              TFMTBcdField(ADataSet.Fields[i]).DisplayFormat :=
                DISPLAY_FORMAT_MASK;
          end

        else if (ADataSet.Fields[i] is TBcdField) then
          begin
            if TBcdField(ADataSet.Fields[i]).Currency then
              Continue;
            if (TBcdField(ADataSet.Fields[i]).DisplayFormat = '') then
              TBcdField(ADataSet.Fields[i]).DisplayFormat :=
                DISPLAY_FORMAT_MASK;
          end;

      end;

end;

function InitConnection(const ASQLConnection: TSQLConnection;
  const ADatabaseName: string; const ADataSourceType: TDataSourceType;
  const ADriverType: TDriverType; const AUserName, APassword: string;
  var AErrorMsg: string): Boolean;
var
  dvr: string;
begin
  Result := False;

  if (ASQLConnection = nil) then
    Exit;

  try
    if ASQLConnection.Connected then
      ASQLConnection.Connected := False;

    if (ADataSourceType = dstOracleAlias) then
      dvr := 'Oracle'
    else
      case ADriverType of
        dvDB2:
          dvr := 'DB2';
        dvIB:
          dvr := 'Interbase';
        dvInformix:
          dvr := 'Informix';
        dvMicrosoftSQL:
          dvr := 'MSSQL';
        dvMySQL:
          dvr := 'MySQL';
        dvOracle:
          dvr := 'Oracle';
        dvMicrosoftAccess:
          dvr := '';
      end; // end case

    if dvr = '' then
      Exit;

    DBX_ConfigureSQLConnection(ASQLConnection, ADatabaseName, AUserName,
      APassword, dvr);

    ASQLConnection.Connected := True;
    Result := ASQLConnection.Connected;

  except
    on E: Exception do
      begin
        Result := False;
        AErrorMsg := E.Message;
      end;
  end;
end;

function _GetTypeFromStr(AValue: string): TFieldType;
begin
  if (AValue = 'F') or (AValue = cnstFloat) then
    Result := ftFloat
  else if (AValue = 'I') or (AValue = cnstInt) then
    Result := ftInteger
  else if (AValue = 'S') or (AValue = cnstString) then
    Result := ftString
  else if (AValue = 'D') or (AValue = cnstDate) then
    Result := ftDateTime
  else
    Result := ftString;
end;

procedure _GetParamAndType(const AValue: string; var AParamName: string;
  var AParamTypeStr: string; var AParamType: TFieldType);
begin
  if (Pos(';', AValue) > 0) then
    begin
      AParamName := Trim(Copy(AValue, 0, Pos(';', AValue) - 1));
      AParamTypeStr := Trim(Copy(AValue, Pos(';', AValue) + 1, Length(AValue)));
      AParamType := _GetTypeFromStr(AParamTypeStr);
    end
  else begin
      AParamName := AValue;
      AParamType := ftString;
    end;
end;

procedure _AddParam(const AParams: TParams; const AName: string;
  const AValue: Variant; AType: TFieldType = ftString);
var
  AParam: TParam;
begin
  if not Assigned(AParams) then
    raise Exception.Create('Application Error:  Params object not created.');
  AParam := TParam.Create(AParams);
  AParam.Name := AName;
  AParam.ParamType := ptInput;
  AParam.DataType := AType; // i.e., ftString
  AParams.AddParam(AParam);
  // AParam.Value := AValue;
  DBX_FillParam(AParam, AValue);
end;

function DBX_GetSQLConnection: TSQLConnection;
begin
  Result := NIL;
//  if Assigned(IQMS.Common.DBDM.DB_DataModule) and
//    Assigned(IQMS.Common.DBDM.DB_DataModule.SQLConnection) then
//    Result := IQMS.Common.DBDM.DB_DataModule.SQLConnection;
end;

function DBX_GetSQLConnection(var AIsNewConnection: Boolean): TSQLConnection;
begin
  Result := nil;
//  AIsNewConnection := False;
//  if Assigned(IQMS.Common.DBDM.DB_DataModule) and
//    Assigned(IQMS.Common.DBDM.DB_DataModule.SQLConnection) then
//    Result := IQMS.Common.DBDM.DB_DataModule.SQLConnection
//  else
//    begin
//      Result := TSQLConnection.Create(nil);
//      DBX_ConfigureSQLConnection(Result);
//      AIsNewConnection := True;
//    end;
end;

function DBX_ConfigureSQLConnection(ASQLConnection: TSQLConnection;
  AMultipleTransactions: Boolean; DB: string): Boolean;
begin
  Result := False;

  if not Assigned(ASQLConnection) then
    Exit;

  Result := DBX_ConfigureSQLConnection(ASQLConnection,
    IQMS.Common.Miscellaneous.IQGetServerName(DB), IQMS.Common.Miscellaneous.IQGetUID(DB), IQMS.Common.Miscellaneous.IQGetPassword(DB),
    'Oracle', AMultipleTransactions);
end;

function DBX_ConfigureSQLConnection(ASQLConnection: TSQLConnection;
  AUserName: string; APassword: string): Boolean; overload;
begin
  Result := False;

  if not Assigned(ASQLConnection) then
    Exit;

  Result := DBX_ConfigureSQLConnection(ASQLConnection,
    IQMS.Common.Miscellaneous.IQGetServerName('IQFD'), AUserName, APassword, 'Oracle', False);
end;

function DBX_ConfigureSQLConnection(ASQLConnection: TSQLConnection;
  ADatabaseName: string; AUserName: string; APassword: string;
  ADriverName: string; AMultipleTransactions: Boolean): Boolean; overload;
begin
  Result := False;

  if not Assigned(ASQLConnection) then
    Exit;

  if ASQLConnection.Connected then
    ASQLConnection.Connected := False;

  // Setting connection name will automatically load related properties
  ASQLConnection.DriverName := ADriverName;
  if ADriverName = 'Oracle' then
    begin
      if ASQLConnection.ConnectionName = '' then
        ASQLConnection.ConnectionName := 'OracleConnection';
      if ASQLConnection.GetDriverFunc = '' then
        ASQLConnection.GetDriverFunc := 'getSQLDriverORACLE';
      if ASQLConnection.LibraryName = '' then
{$IF CompilerVersion >= 26}  // Delphi XE5
        ASQLConnection.LibraryName := 'dbxora.dll';
{$ELSE}
        ASQLConnection.LibraryName := 'dbexpora.dll';
{$IFEND}
      if ASQLConnection.VendorLib = '' then
        ASQLConnection.VendorLib := 'oci.dll';
    end
  else if ADriverName = 'DB2' then
    begin
      if ASQLConnection.ConnectionName = '' then
        ASQLConnection.ConnectionName := 'DB2Connection';
      if ASQLConnection.GetDriverFunc = '' then
        ASQLConnection.GetDriverFunc := 'getSQLDriverDB2';
      if ASQLConnection.LibraryName = '' then
        ASQLConnection.LibraryName := 'dbexpdb2.dll';
      if ASQLConnection.VendorLib = '' then
        ASQLConnection.VendorLib := 'db2cli.dll';
    end
  else if ADriverName = 'Interbase' then
    begin
      if ASQLConnection.ConnectionName = '' then
        ASQLConnection.ConnectionName := 'IBConnection';
      if ASQLConnection.GetDriverFunc = '' then
        ASQLConnection.GetDriverFunc := 'getSQLDriverINTERBASE';
      if ASQLConnection.LibraryName = '' then
        ASQLConnection.LibraryName := 'dbexpint.dll';
      if ASQLConnection.VendorLib = '' then
        ASQLConnection.VendorLib := 'gds32.dll';
    end
  else if ADriverName = 'Informix' then
    begin
      if ASQLConnection.ConnectionName = '' then
        ASQLConnection.ConnectionName := 'InformixConnection';
      if ASQLConnection.GetDriverFunc = '' then
        ASQLConnection.GetDriverFunc := 'getSQLDriverINFORMIX';
      if ASQLConnection.LibraryName = '' then
        ASQLConnection.LibraryName := 'dbexpinf.dll';
      if ASQLConnection.VendorLib = '' then
        ASQLConnection.VendorLib := 'isqlb09a.dll';
    end
  else if ADriverName = 'MSSQL' then
    begin
      if ASQLConnection.ConnectionName = '' then
        ASQLConnection.ConnectionName := 'MSSQLConnection';
      if ASQLConnection.GetDriverFunc = '' then
        ASQLConnection.GetDriverFunc := 'getSQLDriverMSSQL';
      if ASQLConnection.LibraryName = '' then
        ASQLConnection.LibraryName := 'dbexpmss.dll';
      if ASQLConnection.VendorLib = '' then
        ASQLConnection.VendorLib := 'oledb';
    end
  else if ADriverName = 'MySQL' then
    begin
      if ASQLConnection.ConnectionName = '' then
        ASQLConnection.ConnectionName := 'MySQLConnection';
      if ASQLConnection.GetDriverFunc = '' then
        ASQLConnection.GetDriverFunc := 'getSQLDriverMYSQL';
      if ASQLConnection.LibraryName = '' then
        ASQLConnection.LibraryName := 'dbexpmysql.dll';
      if ASQLConnection.VendorLib = '' then
        ASQLConnection.VendorLib := 'libmysql.dll';
    end;

  ASQLConnection.LoginPrompt := False;
  ASQLConnection.Params.Values['Database'] := ADatabaseName;
  ASQLConnection.Params.Values['User_Name'] := AUserName;
  ASQLConnection.Params.Values['Password'] := APassword;
  ASQLConnection.Params.Values[Format('%s TransIsolation', [ADriverName])] :=
    'ReadCommited';
  ASQLConnection.Params.Values['RowsetSize'] := '0';
  ASQLConnection.Params.Values['BlobSize'] := '-1';
  // Set this to True to allow transactions
  ASQLConnection.Params.Values['Multiple Transaction'] :=
    IQMS.Common.Numbers.sIIf(AMultipleTransactions, 'True', 'False');
  Result := True;
end;

function DBX_CloneSQLConnection(ASQLConnection: TSQLConnection): TSQLConnection;
begin
  Result := TSQLConnection.Create(nil);
  with Result do
    begin
      DriverName := 'Oracle';
      LoginPrompt := False;
      Params.Values['Database'] := ASQLConnection.Params.Values['Database'];
      Params.Values['User_Name'] := ASQLConnection.Params.Values['User_Name'];
      Params.Values['Password'] := ASQLConnection.Params.Values['Password'];
    end;
end;

function DBX_OpenSQLConnection(ASQLConnection: TSQLConnection; AReOpen: Boolean;
  DB: string): Boolean;
begin
  Result := False;

  if not Assigned(ASQLConnection) then
    Exit;

  Result := ASQLConnection.Connected;

  // Do not configure the connection if it is already open
  if not AReOpen and ASQLConnection.Connected then
    Exit;

  if ASQLConnection.Connected then
    ASQLConnection.Connected := False;

  ASQLConnection.Params.Values['Database'] := IQMS.Common.Miscellaneous.IQGetServerName(DB);
  ASQLConnection.Params.Values['User_Name'] := IQMS.Common.Miscellaneous.IQGetUID(DB);
  ASQLConnection.Params.Values['Password'] := IQMS.Common.Miscellaneous.IQGetPassword(DB);
  ASQLConnection.Connected := True;
  Result := ASQLConnection.Connected;
end;

procedure DBX_ConfigureTransaction(const ATransactionID: LongWord;
  var ATransDesc: TTransactionDesc);
begin
  // Note:  IsolationLevel, xilDIRTYREAD, is unavailable for Oracle!
  ATransDesc.TransactionID := ATransactionID;
  ATransDesc.GlobalID := ATransactionID;
  ATransDesc.IsolationLevel := xilREADCOMMITTED;
  ATransDesc.CustomIsolation := 0;
end;

function DBX_GetVal(const ASQL: string): Real;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_GetVal(AConnection, ASQL);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_GetVal(const ASQLConnection: TSQLConnection;
  const ASQL: string): Real;
var
  AAlias: string;
begin
  Result := 0;
  if Assigned(ASQLConnection) and (ASQL > '') then
    try
      AAlias := ASQLConnection.Params.Values['Database'];
      with TSQLQuery.Create(nil) do
        try
          SQLConnection := ASQLConnection;
          SQL.Add(ASQL);
          Open;
          if not EoF then
            Result := Fields[0].AsFloat
          else
            Result := 0;
        finally
          Free;
        end;
    except
      on E: Exception do
        RaiseGetValStandardException(E, ASQL, AAlias);
    end;
end;

function DBX_GetValInt(const ASQL: string): Integer;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_GetValInt(AConnection, ASQL);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_GetValInt(const ASQLConnection: TSQLConnection;
  const ASQL: string): Integer;
begin
  Result := Trunc(DBX_GetVal(ASQLConnection, ASQL));
end;

function DBX_GetValFmt(const ASQL: string; const Args: array of const ): Real;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_GetValFmt(AConnection, ASQL, Args);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_GetValFmt(const ASQLConnection: TSQLConnection; const ASQL: string;
  const Args: array of const ): Real;
begin
  Result := 0;

  if not Assigned(ASQLConnection) then
    Exit;

  Result := DBX_GetVal(ASQLConnection, IQMS.Common.NLS.IQFormat(ASQL, Args));
end;

function DBX_GetValIntFmt(const ASQL: string;
  const Args: array of const ): Integer;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_GetValIntFmt(AConnection, ASQL, Args);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_GetValIntFmt(const ASQLConnection: TSQLConnection;
  const ASQL: string; const Args: array of const ): Integer;
begin
  Result := 0;

  if not Assigned(ASQLConnection) then
    Exit;

  Result := Trunc(DBX_GetVal(ASQLConnection, IQMS.Common.NLS.IQFormat(ASQL, Args)));
end;

function DBX_GetValStr(const ASQL: string): string;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_GetValStr(AConnection, ASQL);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_GetValStr(const ASQLConnection: TSQLConnection;
  const ASQL: string): string;
var
  AAlias: string;
begin
  Result := '';

  if not Assigned(ASQLConnection) then
    Exit;

  if Assigned(ASQLConnection) and (ASQL > '') then
    try
      AAlias := ASQLConnection.Params.Values['Database'];
      with TSQLQuery.Create(nil) do
        try
          SQLConnection := ASQLConnection;
          SQL.Add(ASQL);
          Open;
          if not EoF then
            Result := Fields[0].AsString
          else
            Result := '';
        finally
          Free;
        end;
    except
      on E: Exception do
        RaiseGetValStandardException(E, ASQL, AAlias);
    end;
end;

function DBX_GetValStrFmt(const ASQL: string;
  const Args: array of const ): string;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_GetValStrFmt(AConnection, ASQL, Args);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_GetValStrFmt(const ASQLConnection: TSQLConnection;
  const ASQL: string; const Args: array of const ): string;
begin
  Result := '';

  if not Assigned(ASQLConnection) then
    Exit;

  Result := DBX_GetValStr(ASQLConnection, IQMS.Common.NLS.IQFormat(ASQL, Args));
end;

function DBX_RunSQL(const ASQL: string): Boolean;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_RunSQL(AConnection, ASQL);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_RunSQL(const ASQLConnection: TSQLConnection;
  const ASQL: string): Boolean;
var
  AAlias: string;
begin
  Result := False;

  if not Assigned(ASQLConnection) then
    Exit;

  if Assigned(ASQLConnection) and (ASQL > '') then
    try
      AAlias := ASQLConnection.Params.Values['Database'];
      with TSQLQuery.Create(nil) do
        try
          SQLConnection := ASQLConnection;

{$IF CompilerVersion >= 26}  // Delphi XE5
          ParamCheck := False; // 10-18-2011 XE
          SQL.Text := StrUtils.ReplaceStr(ASQL, '::=', ':='); // 10-18-2011 XE
{$ELSE}
          SQL.Text := ASQL;
{$IFEND}
          Prepared := True;
          Result := ExecSQL() > 0;
        finally
          Free;
        end;
    except
      on E: Exception do
        RaiseGetValStandardException(E, ASQL, AAlias);
    end;
end;

function DBX_RunSQLFmt(const ASQL: string; const Args: array of const )
  : Boolean;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_RunSQLFmt(AConnection, ASQL, Args);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_RunSQLFmt(const ASQLConnection: TSQLConnection; const ASQL: string;
  const Args: array of const ): Boolean;
begin
  Result := False;

  if not Assigned(ASQLConnection) then
    Exit;

  Result := DBX_RunSQL(ASQLConnection, IQMS.Common.NLS.IQFormat(ASQL, Args));
end;

function DBX_RunSQLParam(const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): Boolean;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    DBX_RunSQLParam(AConnection, ASQL, ParamsList, ParamValues);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_RunSQLParam(const ASQLConnection: TSQLConnection;
  const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): Boolean;
var
  i: Integer;
  oParams: TParams;
  AParamName: string;
  AParamTypeStr: string;
  AParamType: TFieldType;
begin
  Result := False;

  if not Assigned(ASQLConnection) then
    Exit;

  if high(ParamsList) <> high(ParamValues) then
    raise Exception.Create
      ('Application Error: Params and Values do not match.');

  with TSQLQuery.Create(nil) do
    try
      SQLConnection := ASQLConnection;
      oParams := TParams.Create;
      SQL.Add(ASQL);
      for i := 0 to high(ParamsList) do
        begin
          _GetParamAndType(ParamsList[i], AParamName, AParamTypeStr,
            AParamType);
          _AddParam(oParams, AParamName, ParamValues[i], AParamType);
        end;
      Params.Assign(oParams);
      Result := ExecSQL() > 0;
    finally
      Free;
      if Assigned(oParams) then
        FreeAndNil(oParams);
    end;
end;

function DBX_RunSQLParamStrings(const ASQLConnection: TSQLConnection;
  const ASQL: string; const ParamsList: TStringList;
  const ParamValues: TStringList): Boolean;
var
  i: Integer;
  oParams: TParams;
  AParamName: string;
  AParamTypeStr: string;
  AParamType: TFieldType;
  // s_sql: String;
  q: TSQLQuery;
begin
  Result := False;

  if not Assigned(ASQLConnection) then
    Exit;

  if (ParamsList.Count <> ParamValues.Count) then
    raise Exception.CreateFmt
      ('Application Error: Params (%d) and Values (%d) do not match.',
      [ParamsList.Count, ParamValues.Count]);

  // with TSQLQuery.Create(NIL) do
  try
    q := TSQLQuery.Create(nil);
    q.SQLConnection := ASQLConnection;
    oParams := TParams.Create;
    q.SQL.Add(ASQL);
    for i := 0 to ParamsList.Count - 1 do
      begin
        _GetParamAndType(ParamsList.Strings[i], AParamName, AParamTypeStr,
          AParamType);
        _AddParam(oParams, AParamName, ParamValues.Strings[i], AParamType);
      end;
    q.Params.Assign(oParams);
    try
      Result := q.ExecSQL() > 0;
    except
      on E: Exception do
        begin
          raise Exception.CreateFmt('%s'#13'%s', [E.Message, ASQL]);
        end
    end;
  finally
    if Assigned(q) then
      FreeAndNil(q);
    if Assigned(oParams) then
      FreeAndNil(oParams);
  end;
end;

function DBX_RunSQLParamDataSet(const ASQL: string;
  const ASourceDataSet: TDataSet): Boolean;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  Result := False;

  if not Assigned(ASourceDataSet) then
    Exit;

  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    DBX_RunSQLParamDataSet(AConnection, ASQL, ASourceDataSet);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_RunSQLParamDataSet(const ASQLConnection: TSQLConnection;
  const ASQL: string; const ASourceDataSet: TDataSet): Boolean;
begin
  Result := False;

  if not Assigned(ASourceDataSet) then
    Exit;

  with TSQLQuery.Create(nil) do
    try
      SQLConnection := ASQLConnection;
      SQL.Add(ASQL);
      DBX_FillParams(ASourceDataSet, Params); // see this unit, below
      Result := ExecSQL() > 0;
    finally
      Free;
    end;
end;

procedure DBX_CopyFromDelta(const DeltaDS: TCustomClientDataSet;
  var ADataSet: TPacketDataSet);
var
  i: Integer;
  FieldDelta, FieldDataSet: TField;
begin
  // Initialization
  FieldDelta := nil;
  FieldDataSet := nil;

  // Validation
  if not Assigned(DeltaDS) then
    Exit;
  if not Assigned(ADataSet) then
    Exit;

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
      if (FieldDataSet = nil) then
        Continue;
      // Assign the field value if the delta has a "new value"
      if not VarIsEmpty(FieldDelta.NewValue) then
        // if (FieldDelta.NewValue <> Unassigned) then
        FieldDataSet.Assign(FieldDelta);
    end;
  // Post the target dataset
  ADataSet.Post;
end;

procedure DBX_GetDeltaFieldList(const DeltaDS: TCustomClientDataSet;
  var AFieldList: TStringList);
var
  i: Integer;
begin
  // Validation
  if not Assigned(DeltaDS) then
    Exit;
  if not Assigned(AFieldList) then
    Exit;
  AFieldList.Clear;
  // Cycle dataset, and apply updated field values
  for i := 0 to DeltaDS.FieldCount - 1 do
    // if (DeltaDS.Fields[i].NewValue <> Unassigned) then
    if not VarIsEmpty(DeltaDS.Fields[i].NewValue) then
      AFieldList.Add(DeltaDS.Fields[i].FieldName);
end;

function DBX_UpdateDataSet(const ASQLConnection: TSQLConnection;
  const ASQL: string; const SourceDS: TDataSet;
  const DeltaDS: TCustomClientDataSet): Boolean;
var
  i: Integer;
  Param: TParam;
  PName: string;
  FieldSource, FieldDelta, UseField: TField;
begin
  Result := False;

  if not Assigned(ASQLConnection) or not Assigned(SourceDS) or
    not Assigned(DeltaDS) then
    Exit;

  with TSQLQuery.Create(nil) do
    try
      SQLConnection := ASQLConnection;
      SQL.Add(ASQL);

      for i := 0 to Params.Count - 1 do
        begin
          Param := Params[i];
          PName := Param.Name;
          FieldSource := SourceDS.FindField(PName);
          FieldDelta := DeltaDS.FindField(PName);
          if not Assigned(FieldSource) or not Assigned(FieldDelta) then
            Continue;
          if Assigned(FieldDelta) and not VarIsEmpty(FieldDelta.NewValue) then
            UseField := FieldDelta
          else
            UseField := FieldSource;

          if (FieldSource.DataType in [ftSmallint, ftInteger, ftWord,
            ftCurrency, ftAutoInc]) then
            Param.DataType := ftBCD
          else if (FieldSource.DataType = ftString) and
            TWideStringField(FieldSource).FixedChar then
            Param.DataType := ftFixedChar
          else if (FieldSource.DataType = ftMemo) and
            (FieldSource.Size > 255) then
            Param.DataType := ftString
          else if (FieldSource.DataType in [ftWideString, ftFmtMemo]) then
            Param.DataType := ftString
          else if (FieldSource.DataType in [ftFloat, ftLargeint]) then
            Param.DataType := ftFMTBcd
          else
            Param.DataType := FieldSource.DataType;

          // Assign value
          if (Param.DataType in [ftDate, ftTime, ftDateTime, ftTimeStamp]) then
            begin
              Param.AsSQLTimeStamp := SqlTimSt.DateTimeToSQLTimeStamp
                (UseField.AsDateTime);
              if VarIsNull(UseField.Value) then
                Param.Clear;
            end
          else begin
              if VarIsNull(UseField.Value) then
                Param.Clear
              else
                Param.Value := UseField.Value;
              Param.Size := UseField.DataSize;
              if UseField.DataType in [ftBCD, ftFMTBcd] then
                Param.NumericScale := UseField.Size;
            end;
        end;

      // 07/23/2012 dbExpress will trap and not display a trigger exception.
      // We trap it here, display it, and then call SystUils.Abort;
      try
        Result := ExecSQL() > 0;
      except on E:Exception do
        begin
          IQMS.Common.Dialogs.IQError(E.Message);
          SysUtils.Abort;
        end;
      end;
    finally
      Free;
    end;
end;

function DBX_GetValStrParam(const ASQL: string;
  const ParamsList: array of string;
  const ParamValues: array of Variant): string;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_GetValStrParam(AConnection, ASQL, ParamsList, ParamValues);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_GetValStrParam(const ASQLConnection: TSQLConnection;
  const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): string;
var
  i: Integer;
  oParams: TParams;
  AParamName: string;
  AParamTypeStr: string;
  AParamType: TFieldType;
begin
  Result := '';

  if not Assigned(ASQLConnection) then
    Exit;

  if high(ParamsList) <> high(ParamValues) then
    raise Exception.Create
      ('Application Error: Params and Values do not match.');

  with TSQLQuery.Create(nil) do
    try
      SQLConnection := ASQLConnection;
      oParams := TParams.Create;
      SQL.Add(ASQL);
      for i := 0 to high(ParamsList) do
        begin
          // AParamName AParamType
          _GetParamAndType(ParamsList[i], AParamName, AParamTypeStr,
            AParamType);
          _AddParam(oParams, AParamName, ParamValues[i], AParamType);
        end;
      Params.Assign(oParams);
      Open;
      Result := Fields[0].AsString;
    finally
      Free;
      if Assigned(oParams) then
        FreeAndNil(oParams);
    end;
end;

function DBX_GetValParam(const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): Real;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_GetValParam(AConnection, ASQL, ParamsList, ParamValues);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_GetValParam(const ASQLConnection: TSQLConnection;
  const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): Real;
var
  i: Integer;
  oParams: TParams;
  AParamName: string;
  AParamTypeStr: string;
  AParamType: TFieldType;
begin
  Result := 0;

  if not Assigned(ASQLConnection) then
    Exit;

  if high(ParamsList) <> high(ParamValues) then
    raise Exception.Create
      ('Application Error: Params and Values do not match.');

  with TSQLQuery.Create(nil) do
    try
      SQLConnection := ASQLConnection;
      oParams := TParams.Create;
      SQL.Add(ASQL);
      for i := 0 to high(ParamsList) do
        begin
          _GetParamAndType(ParamsList[i], AParamName, AParamTypeStr,
            AParamType);
          _AddParam(oParams, AParamName, ParamValues[i], AParamType);
        end;
      Params.Assign(oParams);
      Open;
      Result := Fields[0].AsFloat;
    finally
      Free;
      if Assigned(oParams) then
        FreeAndNil(oParams);
    end;
end;

function DBX_GetRecordCount(AQuery: TSQLQuery): Integer;
var
  i: Integer;
  ASQLText: string;
begin
  Result := 0; // Initialization
  if Assigned(AQuery) then
    try
      with TSQLQuery.Create(nil) do
        try
          SQLConnection := AQuery.SQLConnection;
          ASQLText := Trim(AQuery.SQL.Text);
          SQL.Add('select count(*) as IQCOUNT from');
          SQL.Add('(');
          SQL.Add(ASQLText);
          SQL.Add(')');

          // Assign parameters
          if (Params.Count > 0) and (Params.Count = AQuery.Params.Count) then
            begin
              for i := 0 to Params.Count - 1 do
                begin
                  Params[i].DataType := AQuery.Params[i].DataType;
                  Params[i].ParamType := AQuery.Params[i].ParamType;
                end;
              BeforeOpen := AQuery.BeforeOpen;
            end;
          DataSource := AQuery.DataSource;
          Open;
          Result := Fields[0].AsInteger;

        finally
          Free;
        end;
    except
      on E: Exception do
        // 'Encountered error while retrieving record count:'#13#13'%s'
        raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000197, [E.Message]);
    end;

end;

function DBX_GetRecordCount(AQuery: TIQWebDbxQuery): Integer;
var
  i: Integer;
  ASQLText: string;
begin
  Result := 0; // Initialization
  if Assigned(AQuery) then
    try
      with TSQLQuery.Create(nil) do
        try
          SQLConnection := AQuery.SQLConnection;
          ASQLText := AQuery.SQL.Text;
          SQL.Add('select count(*) as IQCOUNT from');
          SQL.Add('(');
          SQL.Add(AQuery.SQL.Text);
          SQL.Add(')');

          // Assign parameters
          if (Params.Count > 0) and (Params.Count = AQuery.Params.Count) then
            for i := 0 to Params.Count - 1 do
              begin
                Params[i].DataType := AQuery.Params[i].DataType;
                Params[i].ParamType := AQuery.Params[i].ParamType;
              end;

          BeforeOpen := AQuery.BeforeOpen;
          DataSource := AQuery.DataSource;
          Open;
          Result := Fields[0].AsInteger;

        finally
          Free;
        end;
    except
      on E: Exception do
        // 'Encountered error while retrieving record count:'#13#13'%s'
        raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000197, [E.Message]);
    end;

end;

function DBX_GetRecordCount(ATable: TSQLTable): Integer;
var
  ATableName: string;
  AExt: string;
begin
  Result := 0; // Initialization
  if Assigned(ATable) then
    try
      ATableName := ATable.TableName;
      if (ATableName = '') then
        Exit;

      // Is this a physical file?
      AExt := Trim(UpperCase(ExtractFileExt(ATableName)));
      // Only these database files support SQL.  For example, .CSV, does
      // not support SQL.
      if (AExt > '') and not IQMS.Common.StringUtils.StrInList(AExt, ['.DB', '.DBF']) then
        begin
          Result := ATable.RecordCount;
          Exit;
        end;

      with TSQLQuery.Create(nil) do
        try
          SQLConnection := ATable.SQLConnection;
          SQL.Add('select count(*) as IQCOUNT from');

          // 01/21/2008 If the table name has spaces, such as a DBF file name,
          // then wrap it in quotation marks.
          if (Pos(' ', ATableName) > 0) then
            SQL.Add('"' + ATableName + '"')
          else
            SQL.Add(ATableName);

          if (ATable.Filtered = True) and (Trim(ATable.Filter) > '') then
            begin
              SQL.Add('where');
              SQL.Add(Format('%s', [ATable.Filter]));
            end;
          Open;
          Result := Fields[0].AsInteger;
        finally
          Free; // free query
        end;

    except
      on E: Exception do
        // 'Encountered error while retrieving record count:'#13#13'%s'
        raise Exception.CreateFmt(IQMS.DBTrans.dbtrscstr.cTXT0000197, [E.Message]);
    end;

end;

function DBX_GetValArray(const ASQL: string): Variant;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_GetValArray(AConnection, ASQL);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_GetValArray(const ASQLConnection: TSQLConnection;
  const ASQL: string): Variant;
var
  i: Integer;
  AAlias: string;
begin
  Result := Unassigned;

  if not Assigned(ASQLConnection) then
    Exit;

  try
    AAlias := ASQLConnection.Params.Values['Database'];
    with TSQLQuery.Create(nil) do
      try
        SQLConnection := ASQLConnection;
        SQL.Add(ASQL);
        Open;
        if not Eof then
          begin
            Result := VarArrayCreate([0, FieldCount - 1], varVariant);
            for i := 0 to FieldCount - 1 do
              if Fields[i].DataType = ftFloat then
                Result[i] := Fields[i].AsFloat
              else if Fields[i].DataType = ftString then
                Result[i] := Fields[i].AsString
              else
                Result[i] := Fields[i].Value;
          end
        else
          Result := varNull;
      finally
        Free;
      end;
  except
    on E: Exception do
      RaiseGetValStandardException(E, ASQL, AAlias);
  end;
end;

function DBX_GetValArrayFmt(const ASQL: string;
  const Args: array of const ): Variant;
var
  AConnection: TSQLConnection;
  AFreeConnection: Boolean;
begin
  Result := Unassigned;

  try
    AConnection := DBX_GetSQLConnection(AFreeConnection);
    Result := DBX_GetValArrayFmt(AConnection, ASQL, Args);
  finally
    if AFreeConnection and Assigned(AConnection) then
      FreeAndNil(AConnection);
  end;
end;

function DBX_GetValArrayFmt(const ASQLConnection: TSQLConnection;
  const ASQL: string; const Args: array of const ): Variant;
begin
  Result := DBX_GetValArray(ASQLConnection, IQFormat(ASQL, Args));
end;

function DBX_NextID(const ASQLConnection: TSQLConnection;
  ATableName: string): Real;
var
  Query: TSQLQuery;
  SeqName: string;

  function _SameSerialLikeIDExists(AMaster_Label_ID: Real): Boolean;
  begin
    Result := False;
    // do not lock master_label for now for performance reasons -
    // I do not anticipate racing problem
    try
      Result := DBX_GetValFmt(ASQLConnection,
        'select master_label_misc.id_to_serial_exists( %f ) from dual',
        [AMaster_Label_ID]) = 1;
    except
    end;
  end;

begin
  Result := 0;

  if not Assigned(ASQLConnection) then
    Exit;

  if ATableName = '' then
    Exit;

  if Pos('IQMS.', ATableName) > 0 then
    ATableName := Copy(ATableName, 6, Length(ATableName) - 5);

  SeqName := 'S_' + ATableName + '.NextVal';
  // Ex: sequence name is S_QSNDOP.NextVal

  try
    try
      Query := TSQLQuery.Create(nil);
      Query.SQLConnection := ASQLConnection;
      Query.SQL.Add(Format('SELECT %s AS NewID FROM dual', [SeqName]));

      repeat
        Query.Open;

        Result := Query.Fields[0].AsFloat;

        if CompareText(ATableName, 'MASTER_LABEL') <> 0 then
          Break;

        { A foreign label 12345 that was assigned to some master_label
          record will cause unique constraint error when master_label
          trigger will attempt to propagate this ID 12345 to Serial 12345 }
        if not _SameSerialLikeIDExists(Result) then
          Break; // good

      until False;

    except
      on E: Exception do
        if not IsConsole then
          ShowIQErrorMessage(Format(IQMS.Common.ResStrings.cTXT0000128, [ATableName]),
            E.Message, '') // 'Unable to get next ID key for table, %s.'
        else
          raise
    end;
  finally
    if Assigned(Query) then
      FreeAndNil(Query);
  end;
end;

function DBX_NextID(ATableName: string): Integer;
begin
  Result := 0;
//  Result := Trunc(DBX_NextID(IQMS.Common.DBDM.SQLConnection, ATableName));
end;

procedure DBX_FillParams(const ASource: TDataSet; const AParams: TParams);
var
  i: Integer;
  Param: TParam;
  PName: string;
  Field: TField;
  AFieldData: TFieldData; // in IQMS.DBTrans.dbttypes.pas
  AFieldDataDef: TFieldDataDef; // in IQMS.DBTrans.dbttypes.pas
begin
  if not Assigned(ASource) or not Assigned(AParams) then
    Exit;

  for i := 0 to AParams.Count - 1 do
    begin
      Param := AParams[i];
      PName := Param.Name;
      Field := ASource.FindField(PName);
      if not Assigned(Field) then
        Continue;

      if (Field.DataType = ftString) and TWideStringField(Field).FixedChar then
        Param.DataType := ftFixedChar
      else if (Field.DataType = ftMemo) and (Field.Size > 255) then
        Param.DataType := ftString
      else if (Field.DataType in [ftFloat, ftCurrency, ftLargeint,
        ftAutoInc]) then
        Param.DataType := ftFMTBcd
      else if (Param.DataType in [ftSmallint, ftInteger, ftWord]) then
        Param.DataType := ftBCD
      else
        Param.DataType := Field.DataType;

      AFieldData.FieldName := PName;
      AFieldData.FieldSize := Field.DataSize;
      AFieldData.DataType := Param.DataType;
      AFieldData.DisplayLabel := PName;
      AFieldData.Visible := True;
      AFieldData.Index := i;

      if not IQMS.DBTrans.dbtshare.GetFieldDataDefinition(AFieldData,
        { var } AFieldDataDef) then
        Continue;

      if (Field.DataType in [ftDate, ftTime, ftDateTime, ftTimeStamp]) then
        begin
          Param.AsSQLTimeStamp := SqlTimSt.DateTimeToSQLTimeStamp
            (Field.AsDateTime);
          if VarIsNull(Field.Value) or (Field.AsDateTime = 0) then
            Param.Clear;
        end
      else if (Field.DataType in [ftString, ftFixedChar]) then
        begin
          Param.Size := AFieldDataDef.OraSize;

          if VarIsNull(Field.Value) then
            Param.Clear
          else
            Param.AsString := Field.AsString;
        end
      else if (Field.DataType in [ftWideString, ftFixedWideChar,
        ftWideMemo]) then
        begin
          Param.Size := AFieldDataDef.OraSize;

          if VarIsNull(Field.Value) then
            Param.Clear
          else
            Param.AsWideString := Field.AsWideString;
        end
      else if (Field.DataType in [ftInteger, ftWord, ftSingle, ftLongWord]) then
        begin
          Param.Size := AFieldDataDef.OraSize;
          if VarIsNull(Field.Value) then
            Param.Clear
          else
            Param.AsInteger := Field.AsInteger;
        end
      else if (Field.DataType in [ftFloat, ftCurrency, ftBCD, ftFMTBcd,
        ftExtended]) then
        begin
          Param.Size := AFieldDataDef.OraSize;
          if VarIsNull(Field.Value) then
            Param.Clear
          else
            Param.AsFloat := Field.AsFloat;
        end
      else begin
          if VarIsNull(Field.Value) then
            Param.Clear
          else
            Param.Value := Field.Value;

          Param.Size := AFieldDataDef.OraSize;
          if Field.DataType in [ftBCD, ftFMTBcd] then
            Param.NumericScale := Field.Size;
        end;
    end;
end;

procedure DBX_FillParam(const Param: TParam; const Value: Variant);
var
  PName: string;
  ADateTime: TDateTime;
begin
  if not Assigned(Param) then
    Exit;
  PName := Param.Name;

  if (Param.DataType in [ftMemo, ftWideString, ftFmtMemo]) then
    Param.DataType := ftString
  else if (Param.DataType in [ftFloat, ftLargeint]) then
    Param.DataType := ftFMTBcd
  else if (Param.DataType in [ftSmallint, ftInteger, ftWord, ftCurrency,
    ftAutoInc]) then
    Param.DataType := ftBCD;

  if (Param.DataType in [ftDate, ftTime, ftDateTime, ftTimeStamp]) then
    begin
      if VarIsClear(Value) or VarIsNull(Value) then
        Param.Clear

      else if TryStrToDate(Value, ADateTime) then
        Param.AsSQLTimeStamp := SqlTimSt.DateTimeToSQLTimeStamp(ADateTime)
      else
        Param.Clear;
    end
    { else if (Param.DataType in [ftBCD, ftFMTBcd]) then
      begin
      if VarIsNull(Value) then
      Param.Clear
      else
      begin
      if SysUtils.TryStrToFloat(Variants.VarToStr(Value), d) then
      Param.Value := d
      else
      Param.Clear;
      end;
      end }
  else
    begin
      if VarIsType(Value, varString) and (Value = '') then
        Param.Clear
      else if VarIsEmpty(Value) or VarIsNull(Value) then
        Param.Clear
      else
        Param.Value := Value;
    end;
end;

procedure DBX_FixParamTypes(const AParams: TParams);
var
  i: Integer;
begin
  if Assigned(AParams) then
    for i := 0 to AParams.Count - 1 do
      begin
        if (AParams.Items[i].DataType in [ftSmallint, ftInteger, ftWord,
          ftCurrency, ftAutoInc]) then
          AParams.Items[i].DataType := ftBCD
        else if (AParams.Items[i].DataType in [ftWideString, ftFmtMemo]) then
          AParams.Items[i].DataType := ftString
        else if (AParams.Items[i].DataType in [ftFloat, ftLargeint]) then
          AParams.Items[i].DataType := ftFMTBcd
        else if (AParams.Items[i].DataType in [ftDate, ftTime, ftDateTime]) then
          AParams.Items[i].DataType := ftTimeStamp;
      end;
end;

procedure DBX_RefreshDataSet(const ADataSet: TIQWebDbxCustomDataSet;
  AKeyFieldName: string);
var
  ASQLConnection: TSQLConnection;
begin
  ASQLConnection := ADataSet.SQLConnection;
  DBX_RefreshDataSetEx(ASQLConnection, ADataSet, AKeyFieldName);
end;

procedure DBX_RefreshDataSetEx(const ASQLConnection: TSQLConnection;
  const ADataSet: TIQWebDbxCustomDataSet; AKeyFieldName: string);
var
  AID: Integer;
  fld: TField;
begin

  if not Assigned(ASQLConnection) then
    Exit;

  try
    AID := 0;
    fld := nil;
    ADataSet.DisableControls;
    if (AKeyFieldName > '') then
      begin
        fld := ADataSet.FindField(AKeyFieldName);
        if (fld <> nil) and (fld is TFMTBcdField) or (fld is TBcdField) then
          AID := fld.AsInteger;
      end;

    if ADataSet is TIQWebDbxQuery then
      begin
        TIQWebDbxQuery(ADataSet).Close;
        TIQWebDbxQuery(ADataSet).SQLConnection := ASQLConnection;
        TIQWebDbxQuery(ADataSet).Open;
      end
    else if ADataSet is TIQWebDbxTable then
      begin
        TIQWebDbxTable(ADataSet).Close;
        TIQWebDbxTable(ADataSet).SQLConnection := ASQLConnection;
        TIQWebDbxTable(ADataSet).Open;
      end;

    CheckAssign1000Separator(ASQLConnection, ADataSet);

    if (fld <> nil) and (AID <> 0) then
      ADataSet.Locate(AKeyFieldName, AID, []);

  finally
    ADataSet.EnableControls;
  end;
end;

procedure AssignSQLConnections(AOwner: TComponent);
var
  i: Integer;
  o: TComponent;
begin
//  for i := 0 to AOwner.ComponentCount - 1 do
//    begin
//      o := AOwner.Components[i];
//      if (o is TIQWebDbxCustomDataSet) then
//        TIQWebDbxCustomDataSet(o).SQLConnection := IQMS.Common.DBDM.DB_DataModule.SQLConnection
//      else if (o is TSQLQuery) then
//        TSQLQuery(o).SQLConnection := IQMS.Common.DBDM.DB_DataModule.SQLConnection
//      else if (o is TSQLStoredProc) then
//        TSQLStoredProc(o).SQLConnection := IQMS.Common.DBDM.DB_DataModule.SQLConnection
//      else if (o is TSQLTable) then
//        TSQLTable(o).SQLConnection := IQMS.Common.DBDM.DB_DataModule.SQLConnection;
//    end;
end;


function DBX_AssignCDSIndexName( AClientDataSet: TClientDataSet; AFieldName: string ): Boolean;
var
  i: Integer;
  ANewIndexName: String;
  AIndexOptions: TIndexOptions;
  Field: TField;
begin
  Result:= False;
  if not AClientDataSet.Active then
     EXIT;
  
  Field := AClientDataSet.Fields.FindField( AFieldName );
  if Field = nil then 
     EXIT;
  
  // if invalid field type - exit.
  if (Field is TObjectField) or (Field is TBlobField) or (Field is TAggregateField) or (Field is TVariantField) or (Field is TBinaryField) then 
      EXIT;
     
  // Ensure IndexDefs is up-to-date
  AClientDataSet.IndexDefs.Update;
  
  // If an ascending index is already in use, switch to a descending index
  if AClientDataSet.IndexName = AFieldName + '__IdxA'
  then
    begin
      ANewIndexName := AFieldName + '__IdxD';
      AIndexOptions := [ixDescending];
    end
  else
    begin
      ANewIndexName := AFieldName + '__IdxA';
      AIndexOptions := [];
    end;
    
  // Look for existing index
  for i:= 0 to Pred( AClientDataSet.IndexDefs.Count ) do
    if AClientDataSet.IndexDefs[i].Name = ANewIndexName then
      begin
        Result := True;
        Break;
      end;
  
  // If existing index not found, create one
  if not Result then
  begin
    AClientDataSet.AddIndex(ANewIndexName, AFieldName, AIndexOptions);
    Result := True;
  end;
     
  // Set the index
  AClientDataSet.IndexName:= ANewIndexName;
end;


function DBX_GetCDSIndexFieldName( cds: TClientDataSet ): string;
var
  i: Integer;
begin
  if cds.IndexFieldNames > '' then
     Exit(cds.IndexFieldNames);
  
  if (cds.IndexName = '') then
     Exit('');
  
  cds.IndexDefs.Update;
  
  for i:= 0 to Pred( cds.IndexDefs.Count ) do
    if cds.IndexDefs[i].Name = cds.IndexName then
       Exit( cds.IndexDefs[i].Fields);

  Exit('');     
end;


end.
