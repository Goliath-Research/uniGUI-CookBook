unit IQMS.Common.DataLib;

interface

// TODO -oGabe -cDBLib: Move the FireDac error parsing stuff into its own unit.
// TODO -oGabe -cDBLib: Move all the FireDac specific DB access code into the IQMS.Common.DataServices stuff.


uses
  Winapi.Windows, System.SysUtils, Winapi.Messages, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Forms, Vcl.ComCtrls, System.MaskUtils, StrUtils,
  System.TypInfo, System.SyncObjs, Vcl.CheckLst, Vcl.ActnCtrls, Vcl.Buttons,
  Data.FMTBcd, Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.ConsoleUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.Oracle, FireDAC.Stan.Param, Datasnap.DBClient,
  System.Generics.Collections, FireDAC.Phys.OracleWrapper,
  IQMS.WebVcl.Time,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.Documents,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.DBExpress,
  IQMS.Common.DataConst,
  IQMS.Common.DataServices,
  UniDBNavigator, UniGUIForm, UniPageControl, UniEdit,UniDateTimePicker,
  System.Variants;

type
  TTaggedDatasSet = set of 0..255;

  TExecuteOnAddToTStringListFromQuery = procedure( AList: TStringList; ADataSet: TDataSet );
  TGetSetCommandForParam = function( AParamName: String ): String of object;
  TExecProcOnAddToTStringListFromQuery = reference to procedure( AQuery: TFDQuery );

type
  TDataSetLogger = class helper for TDataSet
    procedure Open;
    procedure Refresh;
    procedure LogData(ADataSet: TDataSet);
  private
    function DataTypeName(ADataType: TFieldType): String;
    function GetFullName(AComponent: TComponent): String;
    function StripTrailingLineBreaks(AString: String): String;
  public
    class var LogEnabled: Boolean;
end;



// Creates new TSQLQuery, which already points to the DB_DM SQLConnection.
// To prevent a memory leak, the query must be freed by the calling unit.
//function NewQuery: TSQLQuery; overload;
//function NewQuery(const ASQL: String): TSQLQuery; overload;

function Where( S: string; const Params: array of variant ): string;


{$REGION 'FireDAC Oracle database methods'}
/// <summary>Execute an SQL command (non-query).</summary>
procedure ExecuteCommand(const ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil); overload;
/// <summary>Execute an SQL command (non-query).</summary>
procedure ExecuteCommand(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil); overload;

/// <summary>Execute an SQL command (non-query).  Provide format strings to populate the SQL.</summary>
procedure ExecuteCommandFmt(const ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil); overload;
/// <summary>Execute an SQL command (non-query).  Provide format strings to populate the SQL.</summary>
procedure ExecuteCommandFmt(const ASQL: string; const Args : array of const; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil); overload;

/// <summary>Execute an SQL command (non-query).  Provide parameters to populate params in the SQL.</summary>
procedure ExecuteCommandParam(const ASQL: string; const ParamsList: array of string;
 const ParamValues: array of Variant; AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil);  overload;
/// <summary>Execute an SQL command (non-query).  Provide parameters to populate params in the SQL.</summary>
procedure ExecuteCommandParam(const ASQL: string; const ParamsList: array of string;
 const ParamValues: array of Variant; const AConnection: TFDConnection;  const ATransaction: TFDTransaction = nil);  overload;

/// <summary>Execute an SQL command, which contains params that are populated
/// from a dataset.</summary>
procedure ExecuteCommandParamDataSet(const ASQL: string; const ADataSet: TDataSet; AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil); overload;
/// <summary>Execute an SQL command, which contains params that are populated
/// from a dataset.</summary>
procedure ExecuteCommandParamDataSet(const ASQL: string; const ADataSet: TDataSet; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil); overload;

/// <summary></summary>
function SelectValue(const ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Variant; overload;
/// <summary></summary>
function SelectValue(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Variant; overload;

/// <summary>Select a floating point (real) value from a query.</summary>
function SelectValueAsFloat(const ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Real; overload;
/// <summary>Select a floating point (real) value from a query.</summary>
function SelectValueAsFloat(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Real; overload;

/// <summary>Select an Int64 (long) value from a query.</summary>
function SelectValueAsInt64(const ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Int64; overload;
/// <summary>Select an Int64 (long) value from a query.</summary>
function SelectValueAsInt64(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Int64; overload;

/// <summary>Select an integer value from a query.</summary>
function SelectValueAsInteger(const ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Int32; overload;
/// <summary>Select an integer value from a query.</summary>
function SelectValueAsInteger(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Int32; overload;

/// <summary>Select a date/time value from a query.</summary>
function SelectValueAsDateTime(const ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): TDateTime; overload;
/// <summary>Select a date/time value from a query.</summary>
function SelectValueAsDateTime(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): TDateTime; overload;

/// <summary>Select a string value from a query.</summary>
function SelectValueAsString(const ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): string; overload;
/// <summary>Select a string value from a query.</summary>
function SelectValueAsString(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): string; overload;

/// <summary>Select an array of values from a query. A variant array is returned.</summary>
function SelectValueArray(const ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Variant; overload;
/// <summary>Select an array of values from a query. A variant array is returned.</summary>
function SelectValueArray(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Variant; overload;

/// <summary>Select a variant value from a query.</summary>
function SelectValueFmt(const ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Variant; overload;
/// <summary>Select a variant value from a query.</summary>
function SelectValueFmt(const ASQL: string; const Args : array of const; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Variant;  overload;

/// <summary>Select a floating point (real) value from a query.</summary>
function SelectValueFmtAsFloat(const ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Real; overload;
/// <summary>Select a floating point (real) value from a query.</summary>
function SelectValueFmtAsFloat(const ASQL: string; const Args : array of const; const AConnection: TFDConnection;  const ATransaction: TFDTransaction = nil): Real; overload;

/// <summary>Select an Int64 (long) value from a query.</summary>
function SelectValueFmtAsInt64(const ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Int64; overload;
/// <summary>Select an Int64 (long) value from a query.</summary>
function SelectValueFmtAsInt64(const ASQL: string; const Args : array of const; const AConnection: TFDConnection;  const ATransaction: TFDTransaction = nil): Int64; overload;

/// <summary>Select an integer value from a query.</summary>
function SelectValueFmtAsInteger(const ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Int32; overload;
/// <summary>Select an integer value from a query.</summary>
function SelectValueFmtAsInteger(const ASQL: string; const Args : array of const; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Int32; overload;

/// <summary>Select a date/time value from a query.</summary>
function SelectValueFmtAsDateTime(const ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): TDateTime; overload;
/// <summary>Select a date/time value from a query.</summary>
function SelectValueFmtAsDateTime(const ASQL: string; const Args : array of const; const AConnection: TFDConnection;  const ATransaction: TFDTransaction = nil): TDateTime; overload;

/// <summary>Select a string value from a query.</summary>
function SelectValueFmtAsString(const ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): string; overload;
/// <summary>Select a string value from a query.</summary>
function SelectValueFmtAsString(const ASQL: string; const Args : array of const; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): string; overload;

/// <summary>Select an array of values from a query. A variant array is returned.</summary>
function SelectValueArrayFmt(const ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Variant; overload;
/// <summary>Select an array of values from a query. A variant array is returned.</summary>
function SelectValueArrayFmt(const ASQL: string; const Args : array of const; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Variant; overload;

/// <summary>Select a variant value from a query using parameters.</summary>
function SelectValueParam(const ASQL: string; const AParamsList: array of string;
  const AParamValues: array of Variant; const AConnectionName: string = cnstFDConnectionName;
  const ATransaction: TFDTransaction = nil): Variant;
/// <summary>Select a string value from a query using parameters.</summary>
function SelectValueStrParam(const ASQL: string; const AParamsList: array of string;
  const AParamValues: array of Variant; const AConnectionName: string = cnstFDConnectionName;
  const ATransaction: TFDTransaction = nil): string;
/// <summary>Select a string value from a query using parameters.</summary>
function SelectValueIntParam(const ASQL: string; const AParamsList: array of string;
  const AParamValues: array of Variant; const AConnectionName: string = cnstFDConnectionName;
  const ATransaction: TFDTransaction = nil): Int64;

/// <summary> Select a variant field value from the given table, where the
/// ID field equals the provided value.  This method is a shortcut
/// to a common SQL statement such as:
/// <para>
/// SELECT [SelectedFieldName] FROM [SelectedTableName] WHERE id = [IDFieldValue]
/// </para>
/// </summary>
/// <param name="SelectedFieldName">String:  The name of the field to select
/// </param>
/// <param name="SelectedTableName">String:  The name of the table
/// </param>
/// <param name="IDFieldValue">Real:  The value of the ID field in the table
/// </param>
/// <returns>Variant result of the selected field value.
/// </returns>
function SelectValueByID(const SelectedFieldName, SelectedTableName: string;
  const IDFieldValue: Real; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Variant; overload

function SelectValueByID(const SelectedFieldName, SelectedTableName: string;
  const IDFieldValue: Real; const AConnection: TFDConnection;  const ATransaction: TFDTransaction = nil): Variant; overload

function SelectFuncValue( ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Variant;
function SelectFuncValueAsFloat( ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Real;
function SelectFuncValueAsString( ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): string;
function SelectFuncValueAsDateTime( ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): TDateTime;
function SelectFuncValueAsInteger( ASQL: string; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Integer;

function SelectFuncValueFmtAsFloat( ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Real;
function SelectFuncValueFmtAsString( ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): string;
function SelectFuncValueFmtAsDateTime( ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): TDateTime;
function SelectFuncValueFmtAsInteger( ASQL: string; const Args : array of const; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Integer;

/// <summary> Select a float value based on SQL returned by Where function. </summary>
function SelectValueFmtAsFloatWhere( const SQL: string; const Args : array of variant; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Real;
/// <summary> Select a string value based on SQL returned by Where function. </summary>
function SelectValueFmtAsStringWhere( SQL: string; const Args : array of variant; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): string;

/// <summary> Get the next ID for the given table. </summary>
function GetNextID(const ATableName: string; AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): UInt64;

/// <summary> Ensure a connection is assigned to the FireDAC dataset.  If no
///  connection is assigned, the default DB_DM FireDAC connection will be
///  used.
///  </summary>
/// <param name="ADataSet">TFDCustomQuery:  Provide either a TFDTable or TFDQuery.
/// </param>
procedure EnsureConnectionAssigned(ADataSet: TFDCustomQuery);

{$ENDREGION 'FireDAC Oracle database methods'}

procedure CheckAddMoreInfoOnMasterHasDetailRecods( var AMsg: string; AParentTableName, AChildTableName: string );
function GetConstraintTableNames( S: string; var AParentTableName, AChildTableName: string ): Boolean;
function ExtractConstraintName( S: string ): string;
procedure IQAssignNewID( var ID_field:TFloatField; const TblName:string ); overload;
procedure IQAssignNewID( var ID_field: TBCDField; const TblName:string ); overload;
procedure IQPostParentsBeforeEdit( ChildDataSet: TDataset );
procedure IQAssignIDBeforePost( DataSet: TDataset; ATableName: string = '' );
procedure IQHandleDBEngineError( DataSet: TDataSet; E: Exception );
function IQSetTablesActive( const SetActive:Boolean; Owner:TComponent; DB: string = cnstFDConnectionName ):Boolean;
function IQSetTablesActiveTimeIt( const SetActive:Boolean; Owner:TComponent; IQTiming: TIQWebTiming ):Boolean;
function IQSetTablesActiveEx( const SetActive:Boolean; Owner:TComponent; AMessage: String; DB: string = cnstFDConnectionName ):Boolean;
procedure IQOpenTables( Owner:TComponent; ATags: TTaggedDatasSet );
procedure IQParseDBEngineError( DataSet: TDataSet; E: Exception;
  var Msg: string; var ANativeError: Integer; var AIsFatalError: Boolean );
function IQPickAndReplace( TargetField:TField; Pk:TIQWebHpick; const PkField:string ):boolean;
procedure IQAssignNativeCurrencyFilter( DataSet: TDataSet );
procedure IQCheckRefresh(Sender: TObject; Button: TNavigateBtn);
procedure IQApplyUpdateToTable(DataSet: TDataSet; DB: string = cnstFDConnectionName);


procedure SendInsertViaNavigator( ADBNav: TUniDBNavigator; var Action: TModalResult; var ResultValue: Variant; SR: TIQWebSecurityRegister = nil );
function LocateOrPickList( AOwner: TComponent; AID: Real; ADataSet: TDataSet; APk: TIQWebHpick ): Real;
function SetPageControlCaptions(APC:TUniPageControl):Boolean;
function CheckTabSheetControlCaption(AControl:TWinControl):Boolean;


// Force Value methods
procedure ForceValue(ADataSource: TDataSource; AField: TField; AValue: Variant; AFieldType: TFieldType; ASR: TIQWebSecurityRegister = nil); overload;
procedure ForceValue(ADataSource: TDataSource; AField: TField; AValue: Real    ; ASR: TIQWebSecurityRegister = nil);  overload;
procedure ForceValue(ADataSource: TDataSource; AField: TField; AValue: Integer ; ASR: TIQWebSecurityRegister = nil);  overload;
procedure ForceValue(ADataSource: TDataSource; AField: TField; AValue: String  ; ASR: TIQWebSecurityRegister = nil); overload;
procedure ForceClear(ADataSource: TDataSource; AField: TField; ASR: TIQWebSecurityRegister = nil);


/// <summary> Assign query parameter value.  Use this method to assign
/// parameter values for any query dataset.
/// </summary>
/// <param name="DataSet">The query dataset.
/// </param>
/// <param name="ParamName">The parameter name.
/// </param>
/// <param name="Value">The value to apply.
/// </param>
procedure AssignQueryParamValue(DataSet: TDataSet; ParamName: string;
  Value: Variant; ParamDataType: TFieldType = ftUnknown);
/// <summary> Determine if a param by the given name exists in the query
/// dataset.
/// </summary>
function ParamExists(DataSet: TDataSet; ParamName: string): Boolean;

/// <summary> Clear a parameter value. </summary>
procedure ClearQueryParamValue(DataSet: TDataSet; ParamName: string);

procedure CopyParams(ASource: TFDStoredProc; var ATarget: TFDStoredProc);

function GetSwitch( AColumnName, ATableName: string; ADefault: string = 'N'; DB: string = cnstFDConnectionName ): string;
procedure SetSwitch( AColumnName, ATableName, AYNColumnValue : string; AID : Real = 0 );

/// <summary> Schedule a job to run in Oracle.  Provide a PL-SQL block to run
/// within Oracle, using DBMS_SCHEDULER.
/// </summary>
/// <param name="ASQL">The PL-SQL to run.
/// </param>
/// <param name="AJobName">Unique job name.
/// </param>
/// <param name="AStartTime">The date and time when the job should be added
/// by Oracle to the job queue.
/// </param>
/// <param name="AComments">Comments describing the job.
/// </param>
/// <remarks>
/// SQL and Job Name are required, or an exception is raised.
/// </remarks>
procedure ScheduleOracleJob(const ASQL: string; const AJobName: string;
  const AStartTime: TDateTime; const AComments: string); overload;
procedure ScheduleOracleJob(const ASQL: string; const AJobName: string); overload;

/// <summary> Determine if a scheduled Oracle job is currently running.
/// </summary>
function IsScheduledOracleJobRunning(const AJobName: string): Boolean;

/// <summary> Determine if a job has been scheduled.
/// </summary>
function IsOracleJobScheduled(const AJobName: string): Boolean;

/// <summary> Stop a scheduled Oracle job.
/// </summary>
procedure StopOracleJob(const AJobName: string);


/// <summary> Grid sorting using FireDAC dataset and local indexing
/// </summary>
function FD_AssignDataSetIndexName( ADataSet: TFDDataSet; AFieldName: string ): Boolean;
function FD_GetDataSetIndexFieldName( ADataSet: TFDDataSet ): string;

function IsFoundParam(const cSQL: string; const ParamsList: array of string;
 const ParamValues: array of Variant): Boolean;

procedure AddParam(const AParams: TParams; const AName: String;
  const AValue: Variant; AType: TFieldType = ftString);

/// <summary> Update the value of a Clob field.</summary>
procedure UpdateClob(const ATableName, AFieldName: string;
  const AID: Real; const AClobValue: string);
/// <summary> Append to existing text in a Clob field.</summary>
procedure AppendClob(const ATableName, AFieldName: string;
  const AID: Real; const AClobValue: string);

function IsFound ( const cSQL:string ):Boolean;
function IsFoundFmt ( const cSQL:string; const Args : array of const ):Boolean;

function GetPriceBreak( const nQty, nID: Real; const cIDName, cTableName, ABuying: string;
  ACurrencyId:Real = 0; ASysDate: TDateTime = 0; ADefaultPrice: Real = 0 ):Real;

function GetPriceBreakExp( const nQty, nID: Real; const cIDName, cTableName, ABuying: string;
  ACurrencyId:Real = 0; ASysDate: TDateTime = 0; ADefaultPrice: Real = 0 ):Real;
  
function GetPriceBreakUOM(AQty, AFK_ID_Value: Real; const AFK_ID_FieldName,
 ATableName: string; Act_UOM, Std_UOM: string; AARinvt_ID: Real;
 ABuying: String; ACurrencyId: Real = 0; ArcustoQty: boolean = False;
 ASysDate: TDateTime = 0; ADefaultPrice: Real = 0 ): Real;

function GetPriceBreakUOMExp(AQty, AFK_ID_Value: Real; const AFK_ID_FieldName,
 ATableName: string; Act_UOM, Std_UOM: string; AARinvt_ID: Real;
 ABuying: String; ACurrencyId: Real = 0; ArcustoQty: boolean = False;
 ASysDate: TDateTime = 0; ADefaultPrice: Real = 0 ): Real;
 

function GetProdMarkup( const nPhrs:Real; const cMarkupTable:string ):Real;
function GetMatMarkup ( const nDollars:Real; const cMarkupTable:string):Real;
function StdOpLbr ( const nID: Real; const cSNDOPtable, cLBR_RATEtable: string ):Real;
function StdOpOH  ( const nID: Real; const cSNDOPtable: string ):Real;
function QStdOpMat( const nSndID, nQty: Real; const cSndOpTable, cSndOpIDname, cOpMatTable, cBreakTable, cBreakMatIDname: string ):Real;
function StdOpMat(const nSndID, nQty: Real ):Real;
function StdOpOut( const nSndID, nQty:Real; const cSndOpTable, cBreakTable, cBreakIDname:string ):Real;
procedure SetDefaultQtyPriceBreaks( const nParentID, nMatID:Real; const cPKName, cTableName:string );


// ** 1000 Separator Formatting routines **
function UseThousandSeparator: Boolean;
procedure IQCheckAssign1000Separator(ADataSet: TDataSet);
procedure EnsureThousandSeparatorAssigned( ADataSet: TDataSet );
procedure EnsureProperCurrencyDisplayAndThousandSeparatorAssigned( ADataSet: TDataSet; AUse1000Separator:boolean );
function InsertThousandSeparatorsInDisplayFormat( ADisplayFormat: string ): string;
function GetFloatFormatMask(const AUseThousandSeparator: Boolean;
  const APrecision: Integer; const ATrailingZeros: Boolean): string;
function FormatFloat1000SeparatorA(const AValue: Real; APrecision: Integer = 6): String; // decimal without extra zeros
function FormatFloat1000SeparatorB(const AValue: Real; APrecision: Integer = 6): String; // decimal with extra zeros
function FormatFloat1000SeparatorC(const AValue: Real;
  const AUseThousandSeparator: Boolean; const APrecision: Integer;
  const ATrailingZeros: Boolean): String;
function FormatInteger1000Separator(const AValue: Integer): String;
// Formats TEdit text value as a number, with 1000 separator. Call these in OnExit.
procedure FormatEditTextAsFloat(EditBox: TUniEdit; APrecision: Integer = 6; ATrailingZeroes: Boolean = False);
procedure FormatEditTextAsInteger(EditBox: TUniEdit);


function GetEscGridTime:Integer;
function GetTableBasedMarkup( nQty:Real; const ReturnField, LookUpField, cMarkupTable : string ):Real;

function ViewExists( ViewName : string) : Boolean;
function TableExists( ATableName: string): Boolean;
function OracleObjectExists( AObjectName: string): Boolean;
function TableFieldExists(ATableName, AFieldName: string): Boolean;
procedure DropTable(const ATableName: string);
procedure TablePrimaryKey(const ATableName: string; var AKeyFields: TStringList);
function TablePrimaryKeyAsCommaStr(const ATableName: string): string;

function CreateComponentsList(Form:TUniForm; Directory:String):String;

procedure Reopen( ADataSet: TDataSet );
procedure ReopenA( ADataSet: TDataSet );
procedure RefreshDataSetByID(ADataSet: TDataSet; AFieldName: string = 'ID';
  AFieldValue: UInt64 = 0);
procedure RefreshDataSetByID_ExA( ADataSet: TDataSet; AFieldName: string = 'ID' );
procedure RefreshParentChildByID( const DataSets: array of TDataSet );
procedure SafeNext( ADataSet: TDataSet );

{ EPlant }
function IQEPlantFilterExprOracle( const AEplant_ID_Expr: string ): string;
function IQEPlantFilterExpr( AIncludeNull: Boolean = FALSE ): string;

procedure IQAssignEPlantFilter( DataSet: TDataSet; AIncludeNull: Boolean = FALSE );
procedure IQAssignEPlantFilterParam( DataSet: TDataSet; AEPlant_ID: string; AIncludeNulls: Boolean );

function IQAssignEPlantFilterRecord( DataSet: TDataSet ): Boolean;
function IQAssignEPlantFilterRecordParam( DataSet: TDataSet; AEPlant_ID: string; AIncludeNulls: Boolean ): Boolean;

procedure IQAppend_EPlant_Suffix( AEPlant_ID: string; var AValue: string );

{others}
function IsLikeInjection( S: string ): Boolean;
function IsLikeGeneric( S: string ): Boolean;
function IsWeightUom( AUom: string ): Boolean;
function GetNativeCurrencyId:Real;

// Check if current user has access to the Customer (ARCUSTO.ID).
// This method is used for filtering records
function CheckUserHasCustomerAccess(const AArcustoID: Real): Boolean;
function CheckUserHasCustomerAccess_Ex(const AArcusto_ID: Real): Boolean;
function CheckUserHasVendorAccess(const AVendorID: Real): Boolean;

function IQFieldAsStr( AField: TField; ADefaultValue: string = 'NULL' ): string;

  function GetEmployeeName( APrEmpID: Real ): String; overload;
  function GetEmployeeName( AUserName: String ): String; overload;
  function GetEmployeeID( AUserName: String ): Real;

// OBSOLETE - DO NOT USE
//procedure ApplyUSAMask( const ADataSource:TDataSource; const AStringFields: array of String ); overload;
//procedure ApplyUSAMask( const ADataSource:TDataSource; const AStringFields: array of String; const AUseMask: Boolean ); overload;
//procedure SetMaskedTextBeforePost(AField: TStringField; AApplyUSAMask: Boolean);



(*   ** Apply a standard USA mask to a dataset field **

     Call FormatTelephoneText in the OnGetText property of a TField.
     The display text is modified for the current record only, and
     no data is modified.

     Example:

       procedure TForm1.DoGetTelephoneText(
         Sender: TField; var Text: String; DisplayText: Boolean);
       begin
         // modify the display text of this telephone field
         Text := FormatTelephoneText(Sender.AsString, QryMasterUSE_USA_MASK.AsString = 'Y');
       end;
*)

function FormatTelephoneText(AText: String; AApplyUSAMask: Boolean): String;

function ConcatAddressA(const AContact, ACompany, AAddress1,
  AAddress2, AAddress3, ACity, AState, AZip, ACountry: String): String;

function ConcatAddressB(const AContact, ACompany, AAddress1,
  AAddress2, AAddress3, ACity, AState, AZip, ACountry,
  ATelephone, AExt, AFax, ACellTelephone, AEMail, AURL: String): String;

function ConcatCityStateZip(const ACity, AState, AZip: String): String;
function ConcatTelephone(const ATelephone, AExt: String): String;

function GetEmailAddress( ASourceTable: string; ASourceID: Real; AContactID: Real ): string;
function GetEmployeeEMailAddress( AEmployeeID: Real ): string; overload;
function GetEmployeeEMailAddress( AUserName: string ): string; overload;

function GetWebSiteURL(ASourceTable: string; ASourceID: Real;
  var AURL: string): Boolean;

// Returns the caption for a user-defined label
{ Params IN:
   AAppName = 'IQWIN32.EXE'
   AFormName = 'FrmAp'
   AUDLabelName = 'UDLabel1'
   ADefaultCaption = 'User Text 1'}
function IQGetUDCaption(AAppName, AFormName, AUDLabelName: String;
  ADefaultCaption: String = '' ): String;

function GetDefaultBillToID(AArcustoID: Real): Real;
function GetDefaultShipToID(AArcustoID: Real): Real;
function GetDefaultContactID(AArcustoID: Real; AShipToID: Real = 0): UInt64;
function CheckCreateDefaultShipTo( AArcustoID: Real ): Real;
function CreateShipTo( const AArcustoID: Real; ADefault: Boolean ): Real;
function CreateBillTo( const AArcustoID: Real; ADefault: Boolean ): Real;
function CloneShipTo(const AShipToID: Real): Real;
function CloneBillTo(const ABillToID: Real): Real;

// Get the next Customer number from the sequence
function NextCustomerNumber: String;
// Get the next Customer number from the sequence
function NextVendorNumber: String;

procedure LoadColumnValueIntoStringList(
  AList: TStringList;
  ASelectStatement: string;
  AExecuteOnAdd: TExecuteOnAddToTStringListFromQuery = NIL;
  AClearList: Boolean = TRUE;
  DB: string = cnstFDConnectionName);

procedure LoadColValueIntoStringList(
  AList: TStringList;
  ASelectStatement: string;
  AExecuteOnAdd: TExecProcOnAddToTStringListFromQuery = NIL;
  AClearList: Boolean = TRUE);

procedure LoadColumnInt64IntoList(
  AList: TList<Int64>;
  const ASelectStatement: string;
  AExecuteOnAdd: TExecProcOnAddToTStringListFromQuery = NIL;
  const AClearList: Boolean = True);

/// <summary> Present a custom prompt message, if deleting the record.
/// </summary>
procedure IQCheckDelete(Sender: TObject; Button: TNavigateBtn; APrompt: string);

  // Force Value methods
  procedure ForceValue(AEditBox: TUniEdit; AText: String); overload;
  procedure ForceValue(ADateTimePicker: TUniDateTimePicker; ADate: TDateTime); overload;

  procedure CheckVistaMove( const AControls: array of TControl; ADirection: Integer = 1 {1-left, 2-up}; AOffset: Integer = 4 );
  procedure CheckVistaAdjustSize( const AControls: array of TControl;  AOffset: Integer = 4 );
  procedure AdjustControlsWidthBasedOnParent( AParent: TWinControl; const AControls: array of TControl; AOffset: Integer );

  function EnableConstraints(const ATableName: String; const AEnabled: Boolean;
    var AErrorMsg: String; DB: string = cnstFDConnectionName): Boolean;
  function EnableTrigger(ATriggerName: String; AEnabled: Boolean;
    var AErrorMsg: String): Boolean;

  // Filter by PK_HIDE field
  procedure FilterInactive(ADataSet: TDataSet; AFiltered: Boolean; ARefresh: Boolean = False);
  procedure CheckApplyUSAMask(AField:TField);

function Jobshop2_Licensed: Real; // 0 or 1

function IsSerialized(AArinvt_ID: Real): Boolean;


/// <summary>Get the field size of a table column.  Use this function to
/// obtain the maximum field length (MaxLength property) for a field.
/// </summary>
function GetFieldSize(const ATableName, AColumnName: string): Integer;

function IsSIC( AArinvt_ID: Real ): Boolean;
function IsMTO( AOrd_Detail_ID: Real ): Boolean;

procedure CheckDBNameConflict( ASQL, DB: string );

/// <summary> Returns a string with no return characters or extra spaces.
/// Usefule for "flattening" PL-SQL blocks.
/// </summary>
function FlattenSQL(const ASQL: string): string;

function CheckLoggedintoNonIQMSSchema : Boolean;

function ResolveDependencies: Boolean;

/// <summary> Remove "[FireDAC][Phys][Ora]" from the error message text. </summary>
function FixFireDACErrorMessage(const AErrorMessage: string): string; overload;
/// <summary> Remove "[FireDAC][Phys][Ora]" from the error message text. </summary>
function FixFireDACErrorMessage(const E: Exception): string; overload;
/// <summary> Remove "[FireDAC][Phys][Ora-<error_code>]:" from the error message text. </summary>
function GetFireDACFormattedErrorMessage(AExcepObj: Exception):string;
/// <summary> Load query distinct parameters names into a list. </summary>
procedure LoadQueryDistinctParamNames( AQuery: TFDQuery; AList: TStringList );


procedure GetParamAndTypeFromStrConst(const AValue: String; var AParamName,
  AParamTypeStr: string; var ADataType: TFieldType);
procedure CheckCustomRequiredFields( DataSet: TDataSet );

procedure RaiseGetValDBStandardException( E: Exception; cSQL, DB: string );

procedure ActivateInternalExternalDocs(APageControl:TUniPageControl; AInternalTab, AExternalTab:TUniTabSheet; AInternalDocs: TIQWebDocs; AExternalDocs:TIQWebExtDoc);
function GetErrorMessageForORACode( AORAErrorCode: Integer ): string;

function GetOldValueAsReal(AField: TField): Real;
function GetNewValueAsReal(AField: TField): Real;
procedure ClearFieldValues (ADataSet : TDataSet);

function GetMasterLabelIDFromSerial(const S: String; var Value: Real; DataBaseName: string = cnstFDConnectionName): Boolean;



const
  cnstTurnOnCustomRequiredFields = TRUE;  // just in case we need to disable the entire thing


const
  cnstFloat  = 'FLOAT';
  cnstInt    = 'INT';
  cnstInt64    = 'INT64';
  cnstString = 'STRING';
  cnstDate   = 'DATE';

  // Telephone number mask
  USA_TELEPHONE_MASK_A_7: String = '999-9999;0;';
  USA_TELEPHONE_MASK_B_7: String = '999-9999;0;';

  USA_TELEPHONE_MASK_A_10: String = '999-999-9999;0;';
  USA_TELEPHONE_MASK_B_10: String = '(999) 999-9999;0;';

  USA_TELEPHONE_MASK_A_11: String = '\+9 999-999-9999;0;';
  USA_TELEPHONE_MASK_B_11: String = '\+9 (999) 999-9999;0;';

  USA_TELEPHONE_MASK_A_12: String = '9 \+9 999-999-9999;0;';
  USA_TELEPHONE_MASK_B_12: String = '9 \+9 (999) 999-9999;0;';

var
  CS_Sessions: TCriticalSection;

implementation

uses
  Math,
  IQMS.Common.PanelMsg,  {for IQHandleDBError}
  IQMS.Common.UOM,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Dialogs,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.Controls,
  IQMS.Common.SysInfo,
  IQMS.Common.CheckPoint,
  IQMS.Common.JumpConstants,
  IQMS.Common.FileUtils,
  IQMS.Common.ApplicationSet,
  IQMS.Common.McShare,
  IQMS.DBTrans.dbtdbexp,
  IQMS.DBTrans.dbtfields,
  IQMS.Common.Exceptions,
  IQMS.Common.ResStrings,
  IQMS.Common.NLS,
  IQMS.Common.StringUtils;

type
  TSharedDBEvents = class
  public
    procedure IQOnGetText(Sender: TField;  var Text: String; DisplayText: Boolean);
    procedure IQOnSetText(Sender: TField;  const Text: String);
  end;

var
  SharedDBEvents: TSharedDBEvents;

{ TSharedDBEvents }

procedure TSharedDBEvents.IQOnGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
var
  AStr:string;
  APos:Integer;
  ALength:Integer;
begin
  if TFloatField(Sender).Value < 0 then
  begin
    if TFloatField(Sender).DisplayFormat <> '' then
    begin
//     AStr := '(###,###,###,##' + TFloatField(Sender).DisplayFormat + ')';
      APos := Pos('.', TFloatField(Sender).DisplayFormat);
      if APos <> 0 then
      begin
        ALength := Length(Copy(TFloatField(Sender).DisplayFormat, APos + 1, Length(TFloatField(Sender).DisplayFormat)));
        try
          AStr := '(%.' + IntToStr(ALength) + 'f)';
          Text := Format(AStr, [Abs(TFloatField(Sender).Value)]);
        except
          AStr := '(' + TFloatField(Sender).DisplayFormat + ')';
          Text := FormatCurr(AStr, Abs(TFloatField(Sender).Value));
        end;
      end
      else
      begin
        AStr := '(' + TFloatField(Sender).DisplayFormat + ')';
        Text := FormatCurr(AStr, Abs(TFloatField(Sender).Value));
      end;
    end
    else
      Text := FormatCurr('(###,###,###,##0.00)', Abs(TFloatField(Sender).Value))
  end
  else
  begin
    if TFloatField(Sender).DisplayFormat <> '' then
    begin
      APos := Pos('.', TFloatField(Sender).DisplayFormat);
      if APos <> 0 then
      begin
        ALength := Length(Copy(TFloatField(Sender).DisplayFormat, APos + 1, Length(TFloatField(Sender).DisplayFormat)));
        try
          AStr := '%.' + IntToStr(ALength) + 'f';
          Text := Format(AStr, [Abs(TFloatField(Sender).Value)]);
        except
          AStr := TFloatField(Sender).DisplayFormat;
          Text := FormatCurr(AStr, TFloatField(Sender).Value);
        end;
      end
      else
      begin
        AStr := TFloatField(Sender).DisplayFormat;
        Text := FormatCurr(AStr, TFloatField(Sender).Value);
      end;
    end
    else
      Text := FormatCurr('###,###,###,##0.00', TFloatField(Sender).Value);
  end;
end;

procedure TSharedDBEvents.IQOnSetText(Sender: TField; const Text: String);
var
  APos:Integer;
  AStr:String;
  ANeg:Boolean;
  AThousandSeparator: String;
begin
  AStr := Text;
  if AStr = '' then
    AStr := '0';
  AThousandSeparator := FormatSettings.ThousandSeparator;
  APos := Pos(AThousandSeparator, AStr);
  if APos <> 0 then
    AStr := StrTran(AStr, AThousandSeparator, '');

  APos := Pos('(', AStr);
  ANeg := APos <> 0;
  if ANeg then
  begin
    AStr := StrTran(AStr, '(', '');
    AStr := StrTran(AStr, ')', '');
    AStr := '-' + AStr;
  end;
  Sender.value := StrToFloat(AStr);
end;

function GetParamTypeFromStrConst(AValue: String): TFieldType;
begin
  if (AValue = 'F') or (CompareText(AValue, cnstFloat) = 0) then
     Result := ftFloat
  else if (AValue = 'I') or (CompareText(AValue, cnstInt) = 0) then
     Result := ftInteger
  else if (AValue = 'I64') or (CompareText(AValue, cnstInt64) = 0) then
     Result := ftLargeint
  else if (AValue = 'S') or (CompareText(AValue, cnstString) = 0) then
     Result := ftString
  else if (AValue = 'D') or (CompareText(AValue, cnstDate) = 0) then
     Result := ftDateTime
  else Result := ftString;
end;

procedure GetParamAndTypeFromStrConst(const AValue: String; var AParamName,
  AParamTypeStr: string; var ADataType: TFieldType);
begin
  if (Pos(';', AValue) > 0) then
    begin
      AParamName := Trim(Copy(AValue, 0, Pos(';', AValue)-1));
      AParamTypeStr := Trim(Copy(AValue, Pos(';', AValue)+1, Length(AValue)));
      ADataType := GetParamTypeFromStrConst(AParamTypeStr);
    end
  else
    begin
      AParamName := AValue;
      ADataType := ftString;
    end;
end;


function IsFound ( const cSQL:string ):Boolean;
begin
  with TFDQuery.Create(NIL) do
  try
    ConnectionName := cnstFDConnectionName;
    SQL.Add(cSQL);
    Open;
    Result := not (Eof and Bof);
  finally
    Free;
  end;
end; {IsFound}

function IsFoundFmt ( const cSQL:string; const Args : array of const ):Boolean;
begin
  Result:= IsFound( IQFormat( cSQL, Args ));
end;

procedure RaiseGetValStandardException( E: Exception; cSQL, DB: string );
var
  S: string;
begin
  {Standard Exception}
  S:= E.Message + #13 + IQMS.Common.ResStrings.cTXT0000129 + cSQL + #13 + IQMS.Common.ResStrings.cTXT0000319 + DB;

//  NO BDE  IN THIS UNIT
//  if E is EDBEngineError then with E as EDBEngineError do
//  begin
//    case Errors[ ErrorCount - 1 ].NativeError of
//      {ORA-01502 when someone compressing table - the index becomes unstable}
//      1502: S:= S + #13 + IQMS.Common.ResStrings.cTXT0000339;   // 'System is currently busy compressing a table and rebuilding associated indexes. Please wait and try again later.'
//    end;
//
//    raise EIQMSDBEngineError.Create( S, Errors[ ErrorCount - 1 ].NativeError );
//  end;

  raise Exception.Create( S );
end;

//function NewQuery: TSQLQuery;
//begin
//  Result := NewQuery('');
//end;
//
//function NewQuery(const ASQL: String): TSQLQuery;
//begin
//  Result := TSQLQuery.Create(NIL);
//  Result.SQLConnection := db_dm.DB_DataModule.SQLConnection;
//  if Length(Trim(ASQL)) > 0 then
//     Result.SQL.Text := ASQL;
//end;
//

function IsFoundParam(const cSQL: string; const ParamsList: array of string;
 const ParamValues: array of Variant): Boolean;
var
   i: Integer;
   AParamName: String;
   AParamTypeStr: String;
   ADataType: TFieldType;
begin
  if High(ParamsList) <> High(ParamValues) then
     raise Exception.Create('Application Error: Params and Values do not match.');

  with TFDQuery.Create(NIL) do
    try
       ConnectionName := cnstFDConnectionName;
       SQL.Add(cSQL);
       for i := 0 to High(ParamsList) do
         begin
           // AParamName ADataType
           GetParamAndTypeFromStrConst(ParamsList[i], {var} AParamName,
             {var} AParamTypeStr, {var} ADataType);
           if Params.FindParam(AParamName) <> nil then
             with Params.FindParam(AParamName) do
               begin
                 DataType := ADataType;
                 ParamType := ptInput;
                 Value := ParamValues[i];
               end;
         end;
       Open;
       Result := not (BOF and EOF);
    finally
       Free;
    end;
end;

procedure AddParam(const AParams: TParams; const AName: String;
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
  if not VarIsNull(AValue) then
     AParam.Value:= AValue
  else
     AParam.Clear;
  AParams.AddParam(AParam);
end;

procedure UpdateClob(const ATableName, AFieldName: string;
  const AID: Real; const AClobValue: string);
begin
  with TFDStoredProc.Create(nil) do
  try
    ConnectionName := cnstFDConnectionName;
    StoredProcName := 'IQMS.UPDATE_CLOB';
    Params.CreateParam(ftString, 'p_table_name', ptInput).AsString := ATableName;
    Params.CreateParam(ftString, 'p_field_name', ptInput).AsString := AFieldName;
    Params.CreateParam(ftInteger, 'p_id', ptInput).AsFMTBCD := Trunc(AID);
    Params.CreateParam(ftOraClob, 'p_clob_value', ptInput).Value := AClobValue;
    Prepare;
    Execute;
  finally
    Free;
  end;
end;

procedure AppendClob(const ATableName, AFieldName: string;
  const AID: Real; const AClobValue: string);
begin
  with TFDStoredProc.Create(nil) do
  try
    ConnectionName := cnstFDConnectionName;
    StoredProcName := 'IQMS.APPEND_CLOB';
    Params.CreateParam(ftString, 'p_table_name', ptInput).AsString := ATableName;
    Params.CreateParam(ftString, 'p_field_name', ptInput).AsString := AFieldName;
    Params.CreateParam(ftInteger, 'p_id', ptInput).AsFMTBCD := Trunc(AID);
    Params.CreateParam(ftOraClob, 'p_clob_value', ptInput).Value := AClobValue;
    Prepare;
    Execute;
  finally
    Free;
  end;
end;

function MultiCurrencyEnabled: Boolean;
begin
  Result := SelectValueAsString(
    'SELECT multicurrency FROM iqsys WHERE ROWNUM < 2') = 'Y';
end;

function GetNativeCurrencyID: Real;
var
  AFilter:String;
begin
  Result := 0;
  if not MultiCurrencyEnabled then
    Exit;

  AFilter := GetNativeCurrencyFilter(0); {mcshare.pas}
  if AFilter = '' then
    Result := SelectValueAsInt64(
      'select NVL(currency_id, 0) from iqsys where rownum < 2')
  else
    Result := SelectValueFmtAsInt64(
      'select id from currency where native_curr = ''%s'' and curr_code = ''%s''',
      [AFilter, AFilter]);
end;

function GetPriceBreak( const nQty, nID: Real; const cIDName, cTableName,
  ABuying: string; ACurrencyId:Real = 0; ASysDate: TDateTime = 0;
  ADefaultPrice: Real = 0 ):Real;
{Example: MyPrice:= GetPriceBreak( 1000, ItemID, 'ARINVT_ID', 'ARINVT_BREAKS')   }
var
  AStr1, AStr2, AStr3:String;
  AIqSysCurrencyId: Int64;
  aCurrCode:String;
  AMultiCurrencyEnabled: Boolean;
begin
  if ASysDate = 0 then
    ASysDate:= SelectValueAsDateTime(
    'select sysdate from dual');

  AMultiCurrencyEnabled := MultiCurrencyEnabled;

  if CompareText(cTableName, 'ARINVT_BREAKS') = 0 then
  begin
    if AMultiCurrencyEnabled and
      (ACurrencyId <> 0) then
    begin
      AIqSysCurrencyId := Trunc(GetNativeCurrencyID);

      aCurrCode := SelectValueFmtAsString(
        'select curr_code from currency where id = %f',
        [ACurrencyId]);

      AStr1 := Format(' and NVL(B1.buying, ''N'') = ''%s'' and NVL(B1.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
      AStr2 := Format(' and NVL(B2.buying, ''N'') = ''%s'' and NVL(B2.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
      AStr3 := Format(' and NVL(B3.buying, ''N'') = ''%s'' and NVL(B3.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
    end
    
    else if AMultiCurrencyEnabled and
      (ACurrencyId = 0) then
    begin
      AIqSysCurrencyId := Trunc(GetNativeCurrencyID);
      aCurrCode := SelectValueFmtAsString('select curr_code from currency where id = %d', [AIqSysCurrencyId]);
      AStr1 := Format(' and NVL(B1.buying, ''N'') = ''%s'' and NVL(B1.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
      AStr2 := Format(' and NVL(B2.buying, ''N'') = ''%s'' and NVL(B2.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
      AStr3 := Format(' and NVL(B3.buying, ''N'') = ''%s'' and NVL(B3.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
    end
    
    else
    begin
      AStr1 := Format(' and NVL(B1.buying, ''N'') = ''%s'' ', [ABuying]);
      AStr2 := Format(' and NVL(B2.buying, ''N'') = ''%s'' ', [ABuying]);
      AStr3 := Format(' and NVL(B3.buying, ''N'') = ''%s'' ', [ABuying]);
    end;
  end
  else
  begin
    AStr1 := '';
    AStr2 := '';
    AStr3 := '';
  end;


  try {in case of an exception}
     with TFDQuery.Create(nil) do
     try
        ConnectionName := cnstFDConnectionName;
        SQL.Add(         'select B1.QPrice as qprice'                                      );
        SQL.Add( Format(   'from %s B1, (select to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'') as today from dual) x', [ cTableName, FormatDateTime('mm/dd/yyyy hh:nn:ss', ASysDate ) ]));
        SQL.Add( IQFormat( 'where B1.%s = %f',                          [cIDName, nID])    );
        SQL.Add( AStr1 );
        SQL.Add(            'and x.today between NVL(effect_date, x.today - 36500) and NVL(deactive_date, x.today + 36500)');
        SQL.Add(            'and B1.quan = ('                                              );
        SQL.Add(                'select Max(B2.QUAN)'                                      );
        SQL.Add( Format(          'from %s B2',                         [cTableName])      );
        SQL.Add( IQFormat(        'where B1.%s = B2.%s',                  [cIDName, cIDName]));
        SQL.Add( AStr2 );
        SQL.Add(                   'and x.today between NVL(effect_date, x.today - 36500) and NVL(deactive_date, x.today + 36500)');
        SQL.Add( IQFormat(         'and (B2.QUAN <= %f',                [nQty])            );
        SQL.Add(                        'or B2.QUAN ='                                     );
        SQL.Add(                           '(select Min( B3.QUAN )'                        );
        SQL.Add( Format(                      'from %s B3',             [cTableName])      );
        SQL.Add(                             'where x.today between NVL(effect_date, x.today - 36500) and NVL(deactive_date, x.today + 36500)');
        SQL.Add( AStr3 );
        SQL.Add( IQFormat(                       'and B1.%s = B3.%s)))',  [cIDName, cIDName]));
        Open;
        Result:= ADefaultPrice;
        if not Eof then
           Result:= Fields[ 0 ].asFloat;
     finally
      Free;
     end;
  except
    // 'Unable to open Quantity Price Breaks query.'
    if not IsConsole then
       MessageDlg( IQMS.Common.ResStrings.cTXT0000130, mtWarning, [mbOK], 0);
    raise;
  end;
end; {GetPriceBreak}

function GetPriceBreakExp( const nQty, nID: Real; const cIDName, cTableName, ABuying: string; ACurrencyId:Real = 0; ASysDate: TDateTime = 0; ADefaultPrice: Real = 0 ):Real;
{Example: MyPrice:= GetPriceBreak( 1000, ItemID, 'ARINVT_ID', 'ARINVT_BREAKS')   }
var
  AStr1, AStr2, AStr3:String;
  AIqSysCurrencyId: Int64;
  aCurrCode: String;
  AMultiCurrencyEnabled: Boolean;
begin
  if ASysDate = 0 then
    ASysDate:= SelectValueAsDateTime(
      'select sysdate from dual');

  AMultiCurrencyEnabled := MultiCurrencyEnabled;

  if CompareText(cTableName, 'ARINVT_BREAKS') = 0 then
  begin
    if AMultiCurrencyEnabled and (Trunc(ACurrencyId) > 0) then
    begin
      AIqSysCurrencyId := Trunc(GetNativeCurrencyID);

      aCurrCode := SelectValueFmtAsString(
        'select curr_code from currency where id = %f',
        [ACurrencyId]);

      AStr1 := Format(' and NVL(B1.buying, ''N'') = ''%s'' and NVL(B1.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
      AStr2 := Format(' and NVL(B2.buying, ''N'') = ''%s'' and NVL(B2.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
      AStr3 := Format(' and NVL(B3.buying, ''N'') = ''%s'' and NVL(B3.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
    end
    
    else if AMultiCurrencyEnabled and
      (Trunc(ACurrencyId) = 0) then
    begin
      AIqSysCurrencyId := Trunc(GetNativeCurrencyId);
      aCurrCode := SelectValueFmtAsString(
        'select curr_code from currency where id = %d',
        [AIqSysCurrencyId]);
      AStr1 := Format(' and NVL(B1.buying, ''N'') = ''%s'' and NVL(B1.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
      AStr2 := Format(' and NVL(B2.buying, ''N'') = ''%s'' and NVL(B2.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
      AStr3 := Format(' and NVL(B3.buying, ''N'') = ''%s'' and NVL(B3.currency_id, %d) in (select id from currency where curr_code = ''%s'') ', [ABuying, AIqSysCurrencyId, aCurrCode]);
    end
    else
    begin
      AStr1 := Format(' and NVL(B1.buying, ''N'') = ''%s'' ', [ABuying]);
      AStr2 := Format(' and NVL(B2.buying, ''N'') = ''%s'' ', [ABuying]);
      AStr3 := Format(' and NVL(B3.buying, ''N'') = ''%s'' ', [ABuying]);
    end;
  end
  else
  begin
    AStr1 := '';
    AStr2 := '';
    AStr3 := '';
  end;


  try {in case of an exception}
     with TFDQuery.Create(nil) do
     try
        ConnectionName := cnstFDConnectionName;
        SQL.Add(         'select B1.QPrice as qprice'                                      );
        SQL.Add( Format(   'from %s B1, (select to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'') as today from dual) x', [ cTableName, FormatDateTime('mm/dd/yyyy hh:nn:ss', ASysDate ) ]));
        SQL.Add( IQFormat( 'where B1.%s = %f',                          [cIDName, nID])    );
        SQL.Add( AStr1 );
        SQL.Add(            'and x.today >= NVL(effect_date, x.today - 36500) ');
        SQL.Add(            'and B1.quan = ('                                              );
        SQL.Add(                'select Max(B2.QUAN)'                                      );
        SQL.Add( Format(          'from %s B2',                         [cTableName])      );
        SQL.Add( IQFormat(        'where B1.%s = B2.%s',                  [cIDName, cIDName]));
        SQL.Add( AStr2 );
        SQL.Add(                   'and x.today >= NVL(effect_date, x.today - 36500) ');
        SQL.Add( IQFormat(         'and (B2.QUAN <= %f',                [nQty])            );
        SQL.Add(                        'or B2.QUAN ='                                     );
        SQL.Add(                           '(select Min( B3.QUAN )'                        );
        SQL.Add( Format(                      'from %s B3',             [cTableName])      );
        SQL.Add(                    'where x.today >= NVL(effect_date, x.today - 36500) ');
        SQL.Add( AStr3 );
        SQL.Add( IQFormat(                       'and B1.%s = B3.%s)))',  [cIDName, cIDName]));
        Open;
        Result:= ADefaultPrice;
        if not Eof then
           Result:= Fields[ 0 ].asFloat;
     finally
      Free;
     end;
  except
    // 'Unable to open Quantity Price Breaks query.'
    if not IsConsole then
       MessageDlg( IQMS.Common.ResStrings.cTXT0000130, mtWarning, [mbOK], 0);
    raise;
  end;
end; {GetPriceBreak}


function GetPriceBreakUOM(AQty, AFK_ID_Value: Real; const AFK_ID_FieldName,
 ATableName: string; Act_UOM, Std_UOM: string; AARinvt_ID: Real;
 ABuying: String; ACurrencyId: Real; ArcustoQty: Boolean;
 ASysDate: TDateTime; ADefaultPrice: Real ): Real;
begin
  if not ArcustoQty then
    AQty:= IQConvertUom(AQty, Act_UOM, Std_UOM, AARinvt_ID); {IQUOM.pas}
  Result := GetPriceBreak(AQty, AFK_ID_Value, AFK_ID_FieldName, ATableName,
   ABuying, ACurrencyId, ASysDate, ADefaultPrice);
  Result:= IQConvertUom(Result, Act_UOM, Std_UOM, AARinvt_ID);
end;

function GetPriceBreakUOMExp(AQty, AFK_ID_Value: Real; const AFK_ID_FieldName,
 ATableName: string; Act_UOM, Std_UOM: string; AARinvt_ID: Real;
 ABuying: String; ACurrencyId: Real; ArcustoQty: Boolean;
 ASysDate: TDateTime; ADefaultPrice: Real ): Real;
begin
  if not ArcustoQty then
    AQty := IQConvertUom(AQty, Act_UOM, Std_UOM, AARinvt_ID); {IQUOM.pas}
  Result := GetPriceBreakExp(AQty, AFK_ID_Value, AFK_ID_FieldName, ATableName,
   ABuying, ACurrencyId, ASysDate, ADefaultPrice);
  Result := IQConvertUom(Result, Act_UOM, Std_UOM, AARinvt_ID);
end;


function StdOpLbr( const nID: Real; const cSNDOPtable, cLBR_RATEtable: string ):Real;
var
  nNetPerHour:Real;
  nPerHour   :Real;
begin
  Result := 0;
  try {in case of an exception}
    with TFDQuery.Create(nil) do
      try
        ConnectionName := cnstFDConnectionName;
        SQL.Add('Select sndop.cycletm as cycletm, sndop.scrap as scrap,');
        SQL.Add('       sndop.operator as oper, labr_rates.labor_rate as rate');
        SQL.Add('from ' + cSNDOPtable   + ' sndop , '  );
        SQL.Add(         cLBR_RATEtable + ' labr_rates');
        SQL.Add('where sndop.ID = '+FloatToStr(nID));
        SQL.Add('  and sndop.labor_rates_id = labr_rates.id');
        SQL.Add('  and labr_rates.labor_rate > 0');
        SQL.Add('  and sndop.cycletm > 0');
        SQL.Add('  and sndop.vendor_id is NULL');
        Open;
        if not (Bof and Eof) then
          begin
            nPerHour   := FieldByName('CYCLETM').asFloat;  // 3600 / qry.FieldByName('CYCLETM').asFloat;
            nNetPerHour:= nPerHour - nPerHour * FieldByName('SCRAP').asFloat / 100;

         if not (nNetPerHour > 0) then
            Exit(0);

         Result := FieldByName('OPER').asFloat * FieldByName('RATE').asFloat / nNetPerHour;
          end;
     finally
       Free;
     end;
  except
     // 'Unable to open Standard Operation Labor query.'
     if not IsConsole then
        MessageDlg( IQMS.Common.ResStrings.cTXT0000131, mtWarning, [mbOK], 0);
     raise;
  end;
end; {StdOpLbr}


function StdOpOH( const nID: Real; const cSNDOPtable: string ):Real;
var
  nNetPerHour:Real;
  nPerHour   :Real;
begin
  Result := 0;
  try
    with TFDQuery.Create(nil) do
     try {to close qry at the end}
        ConnectionName := cnstFDConnectionName;
        SQL.Add('Select cycletm, scrap, cntr_rate');
        SQL.Add('from ' + cSNDOPtable   + ' sndop'  );
        SQL.Add('where sndop.ID = '+FloatToStr(nID));
        SQL.Add('  and sndop.vendor_id is NULL');
        SQL.Add('  and sndop.cycletm > 0');
        Open;
        if not (Bof and Eof) then
          begin
            nPerHour   :=  FieldByName('CYCLETM').asFloat; // 3600 / qry.FieldByName('CYCLETM').asFloat;
            nNetPerHour:= nPerHour - nPerHour * FieldByName('SCRAP').asFloat / 100;

            if not (nNetPerHour > 0) then
              Exit(0);

            Result:= FieldByName('CNTR_RATE').asFloat / nNetPerHour;
          end;
     finally
       Free;
     end;
  except
     // 'Unable to open Standard Operation OH query.'
     if not IsConsole then
        MessageDlg( IQMS.Common.ResStrings.cTXT0000132, mtWarning, [mbOK], 0);
     raise;
  end;
end; {StdOpLbr}


function QStdOpMat(const nSndID, nQty: Real;
                   const cSndOpTable, cSndOpIDname, cOpMatTable,
                         cBreakTable, cBreakMatIDname: string ):Real;
{Example of a call:
StdOpMat(ID, nQuan, 'QSNDOP', 'QSNDOP_ID', 'QOPMAT', 'QOPMAT_QTY_BREAKS', 'QOPMAT_ID', application}
var
  nID: Int64;
begin
  Result := 0;
  try {in case of an exception}
    with TFDQuery.Create(nil) do
     try
       ConnectionName := cnstFDConnectionName;
       SQL.Add(          'Select opmat.ID      as ID, '    );
       SQL.Add(          '       breaks.QPRICE as QPRICE,' );
       SQL.Add(          '       opmat.PTSPER  as PTSPER ' );
       SQL.Add( Format  ('  from %s breaks, %s opmat, %s sndop', [cBreakTable,  cOpMatTable, cSndOpTable] ));
       SQL.Add( IQFormat(' where opmat.%s = %f'      ,         [cSndOpIDname, nSndID]      ));
       SQL.Add( IQFormat('   and sndop.ID = %f'        ,         [nSndID]                    ));
       SQL.Add(          '   and sndop.vendor_id is NULL'                                  );
       SQL.Add( Format  ('   and breaks.%s = opmat.ID' ,         [cBreakMatIDname]           ));
       SQL.Add( IQFormat('   and (%f * opmat.ptsper >= breaks.quan',  [nQty]                 ));
       SQL.Add(          '        or breaks.quan = '                                       );
       SQL.Add( Format  (' (Select Min(Quan) from %s breaks2',   [cBreakTable    ]          ));
       SQL.Add( Format  ('  where breaks2.%s = opmat.ID))'   ,   [cBreakMatIDname]          ));
       SQL.Add(          ' Order by opmat.ID, breaks.quan DESC' );
       Open;
        while not Eof do
          begin
            nID := FieldByName('ID').AsLargeInt;
            Result := Result + Fields[1].asFloat * Fields[2].asFloat;
            while (not eof) and (nID = Fields[0].AsLargeInt)
              do Next;
          end;

     finally
       Free;
     end;
  except
     // 'Unable to open Standard Operation Material query.'
     if not IsConsole then
        MessageDlg( IQMS.Common.ResStrings.cTXT0000133, mtWarning, [mbOK], 0);
     raise;
  end;
end; {QStdOpMat}


function StdOpMat(const nSndID, nQty: Real ):Real;
var
  nSndOpID, nArinvtID: Int64;
  cBreakTable:string;
  cOpMatTable:string;
  cSndOpTable:string;
  cBreakMatIDname:string;
begin
  Result := 0;
  cBreakTable    := 'ARINVT_BREAKS';
  cOpMatTable    := 'OPMAT';
  cSndOpTable    := 'SNDOP';
  cBreakMatIDname:= 'ARINVT_ID';

  try {in case of an exception}
    with TFDQuery.Create(nil) do
     try
       ConnectionName := cnstFDConnectionName;
       SQL.Clear;
       SQL.Add(          'Select opmat.sndop_ID  as sndop_ID,'  );
       SQL.Add(          '       opmat.arinvt_ID as arinvt_ID,' );
       SQL.Add(          '       breaks.QPRICE as QPRICE,' );
       SQL.Add(          '       opmat.PTSPER  as PTSPER ' );
       SQL.Add( Format  ('  from %s breaks, %s opmat, %s sndop', [cBreakTable,  cOpMatTable, cSndOpTable] ));
       SQL.Add( IQFormat(' where sndop.ID = %f'                , [nSndID] ));
       SQL.Add( IQFormat('   and opmat.sndop_id = %f'          , [nSndID] ));
       SQL.Add(          '   and sndop.vendor_id is NULL'                  );
       SQL.Add( Format  ('   and breaks.%s = opmat.arinvt_id and NVL(breaks.buying, ''N'') = ''N'' '  , [cBreakMatIDname]    ));
       SQL.Add( IQFormat('   and (%f * opmat.ptsper >= breaks.quan',  [nQty]          ));
       SQL.Add(          '        or breaks.quan = '                                   );
       SQL.Add( Format  (' (Select Min(Quan) from %s breaks2',       [cBreakTable    ]));
       SQL.Add( Format  ('  where breaks2.%s = opmat.arinvt_id and NVL(breaks2.buying, ''N'') = ''N'' ))',  [cBreakMatIDname]));
       SQL.Add(          ' Order by sndop_id, arinvt_id, breaks.quan DESC' );
       Open;
       while not Eof do
          begin
            nSndOpID := FieldByName('sndop_ID').AsLargeInt;
            nArinvtID:= FieldByName('arinvt_ID').AsLargeInt;

            Result := Result + Fields[2].asFloat *
                              Fields[3].asFloat;

            while (not eof) and
              (nSndOpID = Fields[0].AsLargeInt) and
              (nArinvtID = Fields[1].AsLargeInt) do
              Next;
          end;
        
     finally
       Free;
     end;
  except
     // 'Unable to open Standard Operation Material query.'
     if not IsConsole then
        MessageDlg( IQMS.Common.ResStrings.cTXT0000133, mtWarning, [mbOK], 0);
     raise;
  end;
end; {StdOpMat}



function StdOpOut( const nSndID, nQty:Real; const cSndOpTable, cBreakTable, cBreakIDname:string):Real;
                   
{Example:
StdOpOut( ID, 1000, 'QSNDOP', 'QSNDOP_QTY_BREAKS', 'QSNDOP_ID', application}
begin
  Result := 0;
  try {in case of an exception}
    with TFDQuery.Create(nil) do
     try {to close qry at the end}
       ConnectionName := cnstFDConnectionName;
       SQL.Add(          'Select breaks.QPRICE as qprice');
       SQL.Add( Format  ('  from %s breaks, %s sndop'        ,  [cBreakTable, cSndOpTable] ));
       SQL.Add( IQFormat(' where sndop.ID = %f'              ,  [nSndID]        ));
       SQL.Add(          '   and sndop.vendor_id is NOT NULL'                    );
       SQL.Add( Format  ('   and breaks.%s = sndop.ID'       ,  [cBreakIDname]  ));
       SQL.Add( IQFormat('   and (%f >= breaks.quan'         ,  [nQty]          ));
       SQL.Add(          '        or breaks.quan = '                             );
       SQL.Add( Format  (' (Select Min(Quan) from %s breaks2',  [cBreakTable]   ));
       SQL.Add( Format  ('  where breaks2.%s = sndop.ID))'   ,  [cBreakIDname]  ));
       Open;
       if not Eof then
         begin
           Last;
           Result:= FieldByName('QPRICE').asFloat;
         end;
     finally
       Free;
     end;
  except
     // 'Unable to open Standard Operation Outsourced query.'
     if not IsConsole then
        MessageDlg( IQMS.Common.ResStrings.cTXT0000134, mtWarning, [mbOK], 0);
     raise;
  end;
end; {StdOpOut}

function GetProdMarkup( const nPhrs:Real; const cMarkupTable:string ):Real;
{Example: GetProdMarkup( 110.25, 'QHPROF') }
begin
  Result:= GetTableBasedMarkup( nPhrs, 'RATE', 'HOURS', cMarkupTable );
end;

function GetMatMarkup( const nDollars:Real; const cMarkupTable:string) :Real;
{Example: GetMatMarkup( 36.21, 'QMPROF') }
begin
  Result:= GetTableBasedMarkup( nDollars, 'RATE', 'DOLLARS', cMarkupTable );
end;  

function GetTableBasedMarkup( nQty:Real; const ReturnField, LookUpField, cMarkupTable : string ):Real;
begin
  with TFDQuery.Create(NIL) do
  try
    ConnectionName := cnstFDConnectionName;
    SQL.Add( Format('select a.%s',                               [ ReturnField  ] )); 
    SQL.Add( Format(  'from %s a',                               [ cMarkupTable ] )); 
    SQL.Add( Format( 'where a.%s = (',                           [ LookUpField  ] )); 
    SQL.Add( Format(       'select Max( b.%s )',                 [ LookUpField  ] )); 
    SQL.Add( Format(        'from %s b',                         [ cMarkupTable ] )); 
    SQL.Add( IQFormat(     'where b.%s <= %f',                   [ LookUpField, nQty ] )); 
    SQL.Add( Format(          'or b.%s = (',                     [ LookUpField  ] )); 
    SQL.Add( Format(             'select Min(c.%s) from %s c))', [ LookUpField, cMarkupTable ] )); 
    Open;
    Result:= Fields[0].asFloat;
  finally
    Free;
  end;
end;

procedure SetDefaultQtyPriceBreaks( const nParentID, nMatID:Real; const cPKName, cTableName:string);
{Example:
 SetDefaultQtyPriceBreaks( TblQOpMatID.value, TblQOpMatQINVT_ID.Value, 'QOPMAT_ID', 'QOPMAT_QTY_BREAKS');}
var
  AColumns: string;
begin
  try {in case of an exception}
    // First Delete whatever used to be there
    ExecuteCommandFmt(
      'DELETE FROM %s WHERE %s = %.0f',
      [cTableName,
       cPKName,
       nParentID]);
    AColumns:= SelectValueFmtAsString(
      'select iqclone.get_cols_names_string( ''%s'', ''%s'' ) from dual',
      [ cTableName, '__ID__' ]);
    with TFDCommand.Create(nil) do
     try
       ConnectionName := cnstFDConnectionName;
       CommandText.Add( Format  ('insert into %s',      [cTableName] ));
       CommandText.Add( Format  ('     ( %s )   ',      [AColumns  ] ));
       CommandText.Add( IQFormat('select %f, '   ,      [nParentID ] ));
       CommandText.Add(          '       quan, qprice, price_date, effect_date, deactive_date');
       CommandText.Add(          '  from qinvt_qty_breaks'            );
       CommandText.Add( IQFormat(' where qinvt_id = %f',[nMatID]     ));
       Execute;
     finally
       Free;
     end;
  except
     // 'Unable to get default Quantity/Price Breaks.'
     if not IsConsole then
        MessageDlg(IQMS.Common.ResStrings.cTXT0000135, mtWarning, [mbOK], 0);
     raise;
  end;
end; {SetDefaultQtyPriceBreaks}


procedure CheckCustomRequiredFields( DataSet: TDataSet );
var
  I: Integer;
begin
  if not cnstTurnOnCustomRequiredFields then
     EXIT;

  // 10-29-2013 EIQ-1229: Inventory - failing to enter data in mandatory fields causes record to be lost CRM # 849727
  for I := 0 to DataSet.Fields.Count - 1 do
    with DataSet.Fields[I] do
      if Required and (ConstraintErrorMessage <> '') and not ReadOnly and (FieldKind = fkData) and IsNull then
      begin
        FocusControl;
        raise Exception.Create( ConstraintErrorMessage );
      end;
end;

procedure LoadColValueIntoStringList(
  AList: TStringList;
  ASelectStatement: string;
  AExecuteOnAdd: TExecProcOnAddToTStringListFromQuery = NIL;
  AClearList: Boolean = TRUE);
var
  AQry: TFDQuery;
begin
  if AClearList then
     AList.Clear;
  AQry:= TFDQuery.Create(nil);
  with AQry do
  try
    ConnectionName := cnstFDConnectionName;
    SQL.Add( ASelectStatement );
    Open;
    while not Eof do
    begin
      AList.Add( Fields[ 0 ].asString );
      if Assigned( AExecuteOnAdd ) then
         AExecuteOnAdd( AQry );
      Next;
    end;
  finally
    Free;
  end;
end;

procedure LoadColumnInt64IntoList(
  AList: TList<Int64>;
  const ASelectStatement: string;
  AExecuteOnAdd: TExecProcOnAddToTStringListFromQuery;
  const AClearList: Boolean);
var
  AQry: TFDQuery;
begin
  if not Assigned(AList) then
    Exit;

  if AClearList then
     AList.Clear;

  AQry:= TFDQuery.Create(nil);
  with AQry do
  try
    ConnectionName := cnstFDConnectionName;
    SQL.Add( ASelectStatement );
    Open;
    while not Eof do
    begin
      AList.Add( Fields[ 0 ].AsLargeInt );
      if Assigned( AExecuteOnAdd ) then
         AExecuteOnAdd( AQry );
      Next;
    end;
  finally
    Free;
  end;
end;

procedure RaiseGetValDBStandardException( E: Exception; cSQL, DB: string );
var
  S: string;
//  AEGetVal: EIQMSDBEngineError;
begin
  {Standard Exception}
  S:= E.Message + #13 + IQMS.Common.ResStrings.cTXT0000129 + cSQL + #13 + IQMS.Common.ResStrings.cTXT0000319 + DB;

  raise Exception.Create( S );
end;


procedure EnsureProperCurrencyDisplayAndThousandSeparatorAssigned( ADataSet: TDataSet; AUse1000Separator:boolean );
var
  I: Integer;
begin
  for I:= 0 to ADataSet.Fields.Count - 1 do
    if (ADataSet.Fields[ I ].DataType in [ftFloat, ftBcd, ftFmtBcd] )
       and ( Pos( '_ID', ADataSet.Fields[ I ].FieldName) = 0 )
       and ( ADataSet.Fields[ I ].FieldName <> 'ID' )
       and ( ADataSet.Fields[ I ].FieldName <> 'BATCH' )
       and ( ADataSet.Fields[ I ].Tag <> 1 ) then
    begin
      if not TFloatField(ADataSet.Fields[ I ]).Currency  then
      begin
        if AUse1000Separator then
        begin
          if (TFloatField(ADataSet.Fields[ I ]).DisplayFormat = '') then
             TFloatField(ADataSet.Fields[ I ]).DisplayFormat:= '###,###,###,##0.######'

          else if Pos( ',', TFloatField(ADataSet.Fields[ I ]).DisplayFormat ) = 0 then
             TFloatField(ADataSet.Fields[ I ]).DisplayFormat:= InsertThousandSeparatorsInDisplayFormat( TFloatField(ADataSet.Fields[ I ]).DisplayFormat );
        end;
      end
      else
      begin
        if not Assigned(TFloatField(ADataSet.Fields[ I ]).OnGetText) then
          TFloatField(ADataSet.Fields[ I ]).OnGetText := SharedDBEvents.IQOnGetText;
        if not Assigned(TFloatField(ADataSet.Fields[ I ]).OnSetText) then
          TFloatField(ADataSet.Fields[ I ]).OnSetText := SharedDBEvents.IQOnSetText;
      end;
    end;
end;


function UseThousandSeparator: Boolean;
begin
  // 12/11/2013 Wrapped in try/except
  // EIQ-1719  Allow non-DBA login to IQDBX/DataLoad
  try
  Result := SelectValueAsString('SELECT num_use_1000_separator FROM params') = 'Y';
  except
    Result := False;
  end;
end;

procedure IQCheckAssign1000Separator( ADataSet: TDataSet);
begin
  {check switch & ensure numeric fields are assigned thousand separator}
  if UseThousandSeparator then
     EnsureThousandSeparatorAssigned( ADataSet );
end;

procedure EnsureThousandSeparatorAssigned( ADataSet: TDataSet );
var
  I: Integer;
begin
  for I:= 0 to ADataSet.Fields.Count - 1 do
    if (ADataSet.Fields[ I ] is TFloatField)
       and ( Pos( '_ID', ADataSet.Fields[ I ].FieldName) = 0 )
       and ( ADataSet.Fields[ I ].FieldName <> 'ID' )
       and ( ADataSet.Fields[ I ].FieldName <> 'BATCH' )
       and ( ADataSet.Fields[ I ].Tag <> 1 )
       and ( not TFloatField(ADataSet.Fields[ I ]).Currency ) then
      begin
         if (TFloatField(ADataSet.Fields[ I ]).DisplayFormat = '') then
            TFloatField(ADataSet.Fields[ I ]).DisplayFormat:= '###,###,###,##0.######'

         else if Pos( ',', TFloatField(ADataSet.Fields[ I ]).DisplayFormat ) = 0 then
            TFloatField(ADataSet.Fields[ I ]).DisplayFormat:= InsertThousandSeparatorsInDisplayFormat( TFloatField(ADataSet.Fields[ I ]).DisplayFormat );
      end
    else
    if (ADataSet.Fields[ I ] is TFMTBCDField)
       and ( Pos( '_ID', ADataSet.Fields[ I ].FieldName) = 0 )
       and ( ADataSet.Fields[ I ].FieldName <> 'ID' )
       and ( ADataSet.Fields[ I ].FieldName <> 'BATCH' )
       and ( ADataSet.Fields[ I ].Tag <> 1 )
       and ( not TFMTBCDField(ADataSet.Fields[ I ]).Currency ) then
      begin
         if (TFMTBCDField(ADataSet.Fields[ I ]).DisplayFormat = '') then
            TFMTBCDField(ADataSet.Fields[ I ]).DisplayFormat:= '###,###,###,##0.######'

         else if Pos( ',', TFMTBCDField(ADataSet.Fields[ I ]).DisplayFormat ) = 0 then
            TFMTBCDField(ADataSet.Fields[ I ]).DisplayFormat:= InsertThousandSeparatorsInDisplayFormat( TFMTBCDField(ADataSet.Fields[ I ]).DisplayFormat );
      end
    else
    if (ADataSet.Fields[ I ] is TBCDField)
       and ( Pos( '_ID', ADataSet.Fields[ I ].FieldName) = 0 )
       and ( ADataSet.Fields[ I ].FieldName <> 'ID' )
       and ( ADataSet.Fields[ I ].FieldName <> 'BATCH' )
       and ( ADataSet.Fields[ I ].Tag <> 1 )
       and ( not TBCDField(ADataSet.Fields[ I ]).Currency ) then
      begin
         if (TBCDField(ADataSet.Fields[ I ]).DisplayFormat = '') then
            TBCDField(ADataSet.Fields[ I ]).DisplayFormat:= '###,###,###,##0.######'

         else if Pos( ',', TBCDField(ADataSet.Fields[ I ]).DisplayFormat ) = 0 then
            TBCDField(ADataSet.Fields[ I ]).DisplayFormat:= InsertThousandSeparatorsInDisplayFormat( TBCDField(ADataSet.Fields[ I ]).DisplayFormat );
      end;
end;

function InsertThousandSeparatorsInDisplayFormat( ADisplayFormat: string ): string;
{Convert #######0.##### to ##,###,##0.##### }
var
  N: Integer;

  function InternalInsert( ADisplayFormat: string; ALIndex: Integer; var ARIndex: Integer ): string;
  var
    I: Integer;
  begin
    Result:= ADisplayFormat;

    if Length(ADisplayFormat) < ALIndex then
    begin
       ARIndex:= 0;
       EXIT;
    end;
    
    if ADisplayFormat[ ALIndex ] = '.' then
    begin
       if ALIndex > 1 then
          Result[ ALIndex  - 1 ]:= '0'; {make first digit zero before decimal 0.####}
       ARIndex:= 1;       
       EXIT;
    end;

    if Length(ADisplayFormat) = ALIndex then
    begin
       ARIndex:= 2;
       EXIT;
    end;
    
    Result:= InternalInsert( ADisplayFormat, ALIndex + 1, ARIndex );

    if (ARIndex mod 3 = 0) and (ALIndex > 1) then
       Result:= Copy( Result, 1, ALIndex-1) + ',' + Copy(Result, ALIndex, 255 );
                             
    ARIndex:= ARIndex + 1;
  end;
begin
  Result:= InternalInsert( ADisplayFormat, 1, N );
end;

function FormatFloat1000SeparatorA(const AValue: Real; APrecision: Integer = 6): String;
begin
  // This method checks the global setting NUM_USE_1000_SEPARATOR, and applies
  // a mask to a floating point value.  A string is returned.  The numbers
  // after the decimal will not contain extra zeros.
  Result := FormatFloat1000SeparatorC(AValue, UseThousandSeparator, APrecision, False);
end;

function FormatFloat1000SeparatorB(const AValue: Real; APrecision: Integer = 6): String;
begin
  // This method checks the global setting NUM_USE_1000_SEPARATOR, and applies
  // a mask to a floating point value.  A string is returned.  The numbers
  // after the decimal *will* contain the extra zeros.
  Result := FormatFloat1000SeparatorC(AValue, UseThousandSeparator, APrecision, True);
end;

function FormatFloat1000SeparatorC(const AValue: Real;
  const AUseThousandSeparator: Boolean; const APrecision: Integer;
  const ATrailingZeros: Boolean): String;
var
   AFormat: String;
begin
  // This method checks the global setting NUM_USE_1000_SEPARATOR, and applies
  // a mask to a floating point value.  A string is returned.
  try
    // Get the format mask
    AFormat := GetFloatFormatMask(AUseThousandSeparator, APrecision,
      ATrailingZeros);
    // Format the value itself, and return the string
    Result := FormatFloat(AFormat, AValue);
  except
     Result := '';
  end;
end;

function GetFloatFormatMask(const AUseThousandSeparator: Boolean;
  const APrecision: Integer; const ATrailingZeros: Boolean): string;
var
   APrecisionMask, AFormat: String;
begin
  // This method checks the global setting NUM_USE_1000_SEPARATOR, and applies
  // a mask to a floating point value.  A string is returned.
  // Initialize result
  Result := '';
  // Get the precision mask (decimal)
  if ATrailingZeros then
  // The numbers after the decimal *will* contain the extra zeros.
   APrecisionMask := Repl('0', APrecision)
  else
  // The numbers after the decimal *will not* contain the extra zeros.
   APrecisionMask := Repl('#', APrecision);
  // Return the completed format mask
  if AUseThousandSeparator then // use separator?
    Result := Format( '#,##0.%s', [APrecisionMask])
  else // no separator
    Result := Format( '####0.%s', [APrecisionMask]);
end;

function FormatInteger1000Separator(const AValue: Integer): String; // decimal with extra zeros
var
   AFmt: String;
begin
  // This method checks the global setting NUM_USE_1000_SEPARATOR, and applies
  // a mask to an integer value.  A string is returned.
  try
     AFmt := IfThen(UseThousandSeparator, '#,##0' {use separator}, '####0' {no separator});
     Result := FormatFloat(AFmt, AValue);
  except // suppress
  end;
end;

procedure FormatEditTextAsFloat(EditBox: TUniEdit; APrecision: Integer;
  ATrailingZeroes: Boolean);
var
   AValue: Real;
begin

  // Formats the text entered into an edit box as a valid floating point value.
  // An error is raised if the text is invalid.
  if (EditBox = NIL) or (EditBox.Text = '') then Exit;

  with EditBox do
   begin

     // If the edit box has a space or series of spaces, but no text,
     // then just trim the text, and exit this routine without raising an error.
     // Doing this compensates kindly for human error.
     if (Trim(Text) = '') then
        begin
          Text := Trim(Text);
          Exit;
        end;

     // format the value as in float
     if not IsStringValidFloat(Text, AValue) then // iqnumber
        begin
          if EditBox.CanFocus then EditBox.SetFocus;
          raise Exception.Create(IQMS.Common.ResStrings.cTXT0000335 {'Please enter a valid number.'});
        end;

     // set the new text
     if ATrailingZeroes then
        Text := FormatFloat1000SeparatorB(AValue, APrecision) // local method, see above
     else
        Text := FormatFloat1000SeparatorA(AValue, APrecision); // local method, see above

   end; // end "with"

end;

procedure FormatEditTextAsInteger(EditBox: TUniEdit);
var
   AValue: Integer;
begin

  // Formats the text entered into an edit box as a valid floating point value.
  // An error is raised if the text is invalid.
  if (EditBox = NIL) or (EditBox.Text = '') then Exit;

  with EditBox do
   begin
     // If the edit box has a space or series of spaces, but no text,
     // then just trim the text, and exit this routine without raising an error.
     // Doing this compensates kindly for human error.
     if (Trim(Text) = '') then
        begin
          Text := Trim(Text);
          Exit;
        end;

     // format the value as in integer
     if not IsStringValidInteger(Text, AValue) then // iqnumber
        begin
          if EditBox.CanFocus then EditBox.SetFocus;
          raise Exception.Create(IQMS.Common.ResStrings.cTXT0000335 {'Please enter a valid number.'});
        end;

     // set the new text
     Text := FormatInteger1000Separator(AValue); // local method, see above

   end; // end "with"

end;

function GetEscGridTime:Integer;
var
  iTime: Integer;
begin
  try
    with TFDQuery.Create(NIL) do
    try
      try
        ConnectionName := cnstFDConnectionName;
        SQL.Add('SELECT esc_grid_time FROM params');
        Open;
        iTime:= Fields[0].asInteger;
      except
        iTime:= 0;
      end;
    finally
      Free;
    end;
  finally
    case iTime of 
      -1: {stay "forever"};
       0: iTime:= 45000;
    else
       iTime:= iTime * 1000;
    end;   
  end;
  Result:= iTime;
end;

function TableExists( ATableName: string): Boolean;
begin
  Result := False;
  if Trim(ATableName) > '' then
    begin
      Result := SelectValueFmtAsInteger(
        'SELECT 1                                                      '#13 +
        '  FROM all_objects                                            '#13 +
        ' WHERE owner = SYS_CONTEXT(''USERENV'', ''SESSION_USER'') AND '#13 +
        '       object_type = ''TABLE'' AND                            '#13 +
        '       UPPER(object_name) = TRIM(UPPER(''%s'')) AND           '#13 +
        '       status = ''VALID'' AND                                 '#13 +
        '       ROWNUM < 2                                             ',
         [ATableName]) = 1;
    end;
end;

function ViewExists( ViewName : string) : Boolean;
begin
  Result := False;
  if Trim(ViewName) > '' then
     begin
      Result := SelectValueFmtAsInteger(
        'SELECT 1                                                      '#13 +
        '  FROM all_objects                                            '#13 +
        ' WHERE owner = SYS_CONTEXT(''USERENV'', ''SESSION_USER'') AND '#13 +
        '       object_type = ''VIEW'' AND                            '#13 +
        '       UPPER(object_name) = TRIM(UPPER(''%s'')) AND           '#13 +
        '       status = ''VALID'' AND                                 '#13 +
        '       ROWNUM < 2                                             ',
         [ViewName]) = 1;
     end;
end;

function OracleObjectExists( AObjectName: string): Boolean;
begin
  Result := False;
  if Trim(AObjectName) > '' then
     begin
      Result := SelectValueFmtAsInteger(
        'SELECT 1                                                      '#13 +
        '  FROM all_objects                                            '#13 +
        ' WHERE owner = SYS_CONTEXT(''USERENV'', ''SESSION_USER'') AND '#13 +
        '       UPPER(object_name) = TRIM(UPPER(''%s'')) AND           '#13 +
        '       status = ''VALID'' AND                                 '#13 +
        '       ROWNUM < 2                                             ',
         [AObjectName]) = 1;
     end;
end;

function TableFieldExists(ATableName, AFieldName: string): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1                                       '#13 +
    '  FROM cols                                    '#13 +
    ' WHERE table_name = TRIM(UPPER(''%s'')) AND    '#13 +
    '       column_name = TRIM(UPPER(''%s'')) AND   '#13 +
    '       ROWNUM < 2                              ',
    [ATableName, AFieldName]) = 1;
end;

procedure DropTable(const ATableName: string);
begin
  if (Trim(ATableName) > '') then
    try
      if TableExists(ATableName) then
        begin
          ExecuteCommandFmt('TRUNCATE TABLE %s', [LowerCase(ATableName)]);
          ExecuteCommandFmt('DROP TABLE %s CASCADE CONSTRAINTS',
            [LowerCase(ATableName)]);
        end;
    except // suppress
    end;
end;

procedure TablePrimaryKey(const ATableName: string; var AKeyFields: TStringList);
begin
  if Assigned(AKeyFields) and (ATableName > '') then
    begin
      with TFDQuery.Create(NIL) do
      try
        ConnectionName := cnstFDConnectionName;
        SQL.Add('SELECT b.column_name');
        SQL.Add('  FROM user_constraints a, user_cons_columns b');
        SQL.Add(Format(' WHERE a.table_name = TRIM(UPPER(''%s'')) AND',[ATableName]));
        SQL.Add('       a.constraint_type = ''P'' AND');
        SQL.Add('       b.constraint_name = a.constraint_name');
        Open;
        while not EOF do
          begin
            AKeyFields.Add(Fields[0].AsString);
            Next;
          end;
      finally
        Free;
      end;
    end;
end;

function TablePrimaryKeyAsCommaStr(const ATableName: string): string;
var
  AKeyFields: TStringList;
begin
  AKeyFields := TStringList.Create;
  try
    TablePrimaryKey(ATableName, AKeyFields);
    Result := System.SysUtils.StringReplace(AKeyFields.CommaText, '"','', [rfReplaceAll]);
  finally
     if Assigned(AKeyFields) then
       FreeAndNil(AKeyFields);
  end;
end;

function CreateComponentsList(Form:TUniForm; Directory:String):String;
var
CompTxt:TextFile;
i:Integer;
begin
  Result :=  Directory + Form.Name + '.txt';
  AssignFile(CompTxt, Result);
  Rewrite(CompTxt);
  try
    with Form do
     for i := 0 to ComponentCount -1 do
       Writeln(CompTxt, Components[i].name);
   finally
     CloseFile(CompTxt);
   end;  
end;

function IQEPlantFilterExprOracle( const AEplant_ID_Expr: string ): string;
begin
  Result:= IQEPlantFilterExpr;
  Result:= StrTran( Result, '= Null',    ' is Null'     );
  Result:= StrTran( Result, '<> Null',   ' is not Null' );
  Result:= StrTran( Result, 'EPlant_ID', AEplant_ID_Expr);  { Ex: AEplant_ID_Expr = e.eplant_id }
end;

function IQEPlantFilterExpr( AIncludeNull: Boolean = FALSE ): string;
begin
  with SecurityManager do
    if EPlant_ID = 'NULL' then
       Result:= ''
    else
       begin
         if EPlant_Include_Nulls or AIncludeNull then
            Result:= Format('EPlant_ID is Null or EPlant_ID = %s', [ EPlant_ID ])
         else
            Result:= Format('EPlant_ID is not Null and EPlant_ID = %s', [ EPlant_ID ]);
       end;
end;

function IQAssignEPlantFilterRecord( DataSet: TDataSet ): Boolean;
begin
  with SecurityManager, DataSet do
    if EPlant_ID = 'NULL' then
       Result:= TRUE
    else
       begin
         if EPlant_Include_Nulls then
            Result:= (FieldByName('EPlant_ID').asString = EPlant_ID) or (FieldByName('EPlant_ID').asString = '')
         else
            Result:= (FieldByName('EPlant_ID').asString = EPlant_ID) and (FieldByName('EPlant_ID').asString <> '')
       end;
end;


function IQAssignEPlantFilterRecordParam( DataSet: TDataSet; AEPlant_ID: string; AIncludeNulls: Boolean ): Boolean;
begin
   with DataSet do
   if (AEPlant_ID = 'NULL') or (AEPlant_ID = '') then
      Result:= TRUE
   else
      begin
        if AIncludeNulls then
           Result:= (FieldByName('EPlant_ID').asString = AEPlant_ID) or (FieldByName('EPlant_ID').asString = '')
        else  
           Result:= (FieldByName('EPlant_ID').asString = AEPlant_ID) and (FieldByName('EPlant_ID').asString <> '')
      end; 
end;


procedure IQAssignEPlantFilter( DataSet: TDataSet; AIncludeNull: Boolean = FALSE );
begin
  {See SetPlant.pas for explanation on how to set up things}
    if SecurityManager.EPlant_ID = 'NULL' then
       DataSet.Filter:= ''
    else if Assigned( DataSet.FindField('EPLANT_ID') ) then
       DataSet.Filter:= IQEPlantFilterExpr( AIncludeNull );
end;

procedure IQAssignEPlantFilterParam( DataSet: TDataSet; AEPlant_ID: string; AIncludeNulls: Boolean );
begin
  if (AEPlant_ID = '') or (AEPlant_ID = 'NULL' ) then
     DataSet.Filter:= ''
  else if Assigned( DataSet.FindField('EPLANT_ID') ) then
     if AIncludeNulls then
        DataSet.Filter:= Format('EPlant_ID = Null or EPlant_ID = %s ', [ AEPlant_ID ])
     else  
        DataSet.Filter:= Format('EPlant_ID <> Null and EPlant_ID = %s ', [ AEPlant_ID ]);
end;

procedure Reopen( ADataSet: TDataSet );
begin
 with ADataSet do
 try
   DisableControls;
   Close;
   Open;
   IQCheckAssign1000Separator( ADataSet );
 finally
   EnableControls;
 end;
end;

procedure ReopenA( ADataSet: TDataSet );
begin
 with ADataSet do
 begin
   Close;
   Open;
   IQCheckAssign1000Separator( ADataSet );
 end;
end;

procedure RefreshDataSetByID( ADataSet: TDataSet; AFieldName: string; AFieldValue: UInt64);
var
  AField      : TField;
  ADebugStr   : string;
  I           : Integer;
  AHasValue   : Boolean;
  ID_Numeric  : Int64;
  ID_String   : string;
  ARecognizedDataType: TFieldType;

  function IsInvalidFloatingPointError(E: Exception): Boolean;
  begin
    Result:= Assigned(E) and (Pos( 'INVALID FLOATING POINT OPERATION', UpperCase(E.Message)) > 0);
  end;
  
  procedure ReopenDataSet;
  begin
    ADataSet.Close;
    ADataSet.Open;
  end;
  
  procedure AttemptToLocate( AAttemptCount: Integer );
  begin
    try
      ReopenDataSet;
      // string fields
      if (ARecognizedDataType = ftString) then
         begin
           // Search only if value is not an empty string, but do not
           // trim the value for the locate operation in case spaces
           // are desired.
           if ID_String > '' then
             ADataSet.Locate( AFieldName, ID_String, []);
         end
      // number fields
      else if ARecognizedDataType = ftLargeInt then
         begin
           // ensure numeric value is a valid integer
           if ID_Numeric > 0 then
             ADataSet.Locate( AFieldName, ID_Numeric, []);
         end
      // exit if unsupported datatype
      else
        Exit;

     // Note:  Despite attempts to evaluate for datatype, it is still
     // possible to get the 'Invalid floating point operation' error.
     if AAttemptCount = 2 then
        TFrmCheckPointList.Add(
          'RefreshDataSetByID successfully recovered from previous ' +
          '''Invalid floating point operation'' error.' );

    except on E: Exception do
      begin
        ADebugStr:= Format('RefreshDataSetByID Error [Locate attempt %d]: ',
          [AAttemptCount]);
        if Assigned( E ) then
           ADebugStr:= ADebugStr +  E.Message;
        if (ARecognizedDataType = ftString) then
           ADebugStr:= Format('%s. DataSet = %s, FieldName = %s, Field Value = %s.',
             [ADebugStr, ADataSet.Name, AFieldName, ID_String])
        else if (ARecognizedDataType = ftInteger) then
           ADebugStr:= Format(
           '%s. DataSet = %s, FieldName = %s, Field Value = %d.',
           [ADebugStr, ADataSet.Name, AFieldName, ID_Numeric]);
        TFrmCheckPointList.Add( ADebugStr );
        raise;
      end;
    end;
  end;
  
  function FieldToValue( AField: TField ): Boolean;
  begin
    Result:= False;
    // 06/04/2014 Added additional evaluation to prevent
    // "Invalid floating point" errors.  Change made as part of:
    // "EIQ-3293 ShopData - refresh manager failure when left on
    // RT Work Center for extended period of time - Mullinix". (Byron)
    if (AField.DataType in [ftString, ftFixedChar, ftWideString, ftGuid]) then
      begin
        ARecognizedDataType := ftString;
        ID_String:= Trim(AField.AsString);
        Result := ID_String > '';
      end
    else if (AField.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint,
        ftCurrency, ftBCD, ftFloat, ftFmtBCD]) then
      begin
        ARecognizedDataType := ftLargeInt;
        if AFieldValue > 0 then
          ID_Numeric := AFieldValue
        else
          ID_Numeric := AField.AsLargeInt;
        Result := ID_Numeric > 0;
      end;
  end;

begin
  ARecognizedDataType := TFieldType(0);
  AField:= ADataSet.FindField( UpperCase( Trim( AFieldName )));
  if Assigned(AField) then
     with ADataSet do
     try
       // ID:= AField.AsFloat;
       AHasValue:= FieldToValue( AField );
       
       DisableControls;
       
       if not AHasValue then
       begin
         ReopenDataSet;
         EXIT;
       end;

       for I:= 1 to 2 do
       try
         AttemptToLocate( I );
         BREAK;
       except on E: Exception do
         if not (IsInvalidFloatingPointError( E ) and (I = 1)) then
            raise
       end;
          
     finally
       EnableControls;
     end
  else
  begin
     // Byron:  This is for developer use.  I have restructure the message so we
     //         can localize part of it, but keep it clear for developers.
     // Localized part:  'Cannot refresh dataset.' (IQMS.Common.ResStrings.cTXT0000140)
     // Native/English part:  'Missing field, %s, encountered in procedure RefreshDataSetByID.';
     IQWarning(Format( '%s'#13'Missing field, %s, encountered in procedure, RefreshDataSetByID.', [IQMS.Common.ResStrings.cTXT0000140, AFieldName] ));
  end;
end;

procedure RefreshDataSetByID_ExA( ADataSet: TDataSet; AFieldName: string = 'ID' );
var
  hMsg : TPanelMesg;
begin
  hMsg:= hPleaseWait( Format( IQMS.Common.ResStrings.cTXT0000137, [ ADataSet.Name ])); // 'Accessing database (%s) ...'
  try
    RefreshDataSetByID( ADataSet, AFieldName );
  finally
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
  end;
end;

{usage: RefreshParentChildByID([ QryHeader, QryDetail, QryRelease ])}
procedure RefreshParentChildByID( const DataSets: array of TDataSet );
var
  AList: TStringList;
  I    : Integer;
begin
  AList:= TStringList.Create;
  try
    for I:= 0 to High(DataSets) do
      AList.Add( DataSets[ I ].FieldByName('ID').asString );
      
    for I:= 0 to High(DataSets) do
      Reopen( DataSets[ I ]);
      
    for I:= 0 to High(DataSets) do
      if AList[ I ] > '' then
         DataSets[ I ].Locate( 'ID', StrToFloat(AList[ I ]), []);
  finally
    if Assigned(AList) then
      FreeAndNil(AList);
  end;  
end;

procedure IQAppend_EPlant_Suffix( AEPlant_ID: string; var AValue: string );
var
  ID : Int64;
  S  : string;
  Txt: string;
  I  : Integer;
begin
  S:= '';

  if (CompareText(AEPlant_ID, 'NULL') <> 0) and
    TryStrToInt64(AEPlant_ID, ID) and
    (ID > 0) then
  try
//    try
//      ID:= StrToFloat( AEPlant_ID );
//    except
//      EXIT;
//    end;
//
//    if ID = 0 then
//       EXIT;

    S:= SelectValueFmtAsString(
      'select RTrim(suffix) from eplant where id = %d and RTrim(gl_plug_value) is not NULL',
      [ ID ]);
    if S = '' then
    begin
      // 'Please note: EPlant suffix is not assigned for EPlant, %s [%.0f]'#13#13'Abort processing?'
      Txt:= Format(IQMS.Common.ResStrings.cTXT0000141,
                  [ SelectValueFmtAsString('select name from eplant where id = %d', [ ID ]), ID ]);
    end;

  finally
    I:=  RPos( '-', AValue );

    if I > 0 then
      AValue:= Copy( AValue, 1, I - 1 );

    if S > '' then
      AValue:= AValue + '-' + S;
  end;
end;  

function Where( S: string; const Params: array of variant ): string;
{Params is array of pairs: 'division_id', 100, 'location_id', 0 }
var
  I: Integer;
  N: Integer;
  AField: string;
  AValue: string;

  function VarNotEmpty(V:Variant): Boolean;
  begin
    case TVarData( V ).VType of
      varString: Result:= V > '';
{$IF CompilerVersion >= 26}  // Delphi XE5
      varUString: Result:= V > '';
      {$IFEND}
    else           
      Result:= V > 0;
    end;
  end;

  function VarToStr(V:Variant): string;
  begin
    case TVarData( V ).VType of
      varString : Result:= V;
{$IF CompilerVersion >= 26}  // Delphi XE5
      varUString: Result:= V;
      {$IFEND}
    else
      Result:= FloatToStr( V );
    end;
  end;

  function VarIsStr(V:Variant): Boolean;
  begin
    Result:= TVarData( V ).VType = varString;
{$IF CompilerVersion >= 26}  // Delphi XE5
    Result:= Result or (TVarData( V ).VType = varUString);
    {$IFEND}
  end;

begin
  I:= 0;
  N:= High( Params );
  while I < N do
  begin
    {Params[ I ] - name of the field, Params[ I + 1 ] - value to equate to }
    AField:= Params[ I ];
    AValue:= VarToStr( Params[ I+1 ]);

    if VarNotEmpty( Params[ I+1 ]) then
    begin
      if Pos(' WHERE ', UpperCase( S )) = 0 then
         S:= IQFormat( '%s where ', [ S ])
      else
         S:= IQFormat( '%s and ',   [ S ]);

      if VarIsStr( Params[ I+1 ]) then
         S:= IQFormat( '%s (%s = ''%s'') ', [ S, AField, AValue ])
      else
         S:= IQFormat( '%s (%s = %s) ',     [ S, AField, AValue ]);
    end;

    Inc(I, 2);
  end;
  Result:= S;
end;

procedure ScheduleOracleJob(const ASQL: string; const AJobName: string;
  const AStartTime: TDateTime; const AComments: string);
var
  sl: TStringList;
begin
  if Length(AJobName) > 30 then
    raise Exception.CreateFmt('Application Error:  Job name (%s) too long.  ' +
    'Oracle object names must be 30 characters or less.',[AJobName]);

  if not IsScheduledOracleJobRunning(AJobName) then
    begin
      // SQL must be "flat", no return characters
      sl := TStringList.Create;
      try
        sl.Add('BEGIN');
        sl.Add(Format('   DBMS_SCHEDULER.create_job(job_name => ''%s'',',
          [FixStr(AJobName)]));
        sl.Add('                             job_type => ''PLSQL_BLOCK'',');
        sl.Add('                             job_action =>');
        sl.Add(Format('                             ''%s'',', [FixStr(FlattenSQL(ASQL))]));
        sl.Add(Format('                             start_date => TO_DATE(''%s'', ''MM/DD/RRRR HH24:MI:SS''),',
          [FormatDateTime('mm/dd/yyyy hh:nn:ss', AStartTime)]));
        sl.Add('                             repeat_interval => NULL,');
        sl.Add('                             end_date => NULL,');
        sl.Add('                             job_class => ''DEFAULT_JOB_CLASS'',');
        sl.Add('                             enabled => TRUE,');
        sl.Add('                             auto_drop => TRUE,');
        sl.Add(Format('                             comments => ''%s'');',
          [FixStr(AComments)]));
        sl.Add('END;');
//        try
          ExecuteCommand(sl.Text);
          // 07/07/2016 Allow the exception to surface.  Should be handled by caller,
          // regardless.
//        except on E: Exception do
//          begin
//            if (CompareText(iqfile.ExeFileName,'IQALERT.EXE') <> 0) and
//            (CompareText(iqfile.ExeFileName,'IQESERVER.EXE') <> 0) and
//             not IQAppSet.IsCGI and not IsConsole then
//             begin
//               iqerrdlg.ShowIQErrorMessage('Cannot schedule Oracle job.', E.Message, sl.Text);
//               System.SysUtils.Abort;
//             end
//            else
//              raise;
//          end;
//        end;
      finally
        sl.Free;
      end;
    end;
end;

procedure ScheduleOracleJob(const ASQL: string; const AJobName: string);
begin
  ScheduleOracleJob(ASQL, AJobName, Now(), AJobName);
end;

function IsScheduledOracleJobRunning(const AJobName: string): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1 FROM dba_scheduler_running_jobs ' +
    'WHERE job_name = ''%s'' AND ROWNUM < 2',
    [FixStr(AJobName)]) = 1;
end;

function IsOracleJobScheduled(const AJobName: string): Boolean;
begin
  Result := SelectValueFmtAsInteger(
    'SELECT 1 FROM dba_scheduler_schedules ' +
    'WHERE schedule_name = ''%s'' AND ROWNUM < 2',
    [FixStr(AJobName)]) = 1;
end;

procedure StopOracleJob(const AJobName: string);
begin
  if IsScheduledOracleJobRunning(AJobName) or
    IsOracleJobScheduled(AJobName) then
    ExecuteCommandFmt(
      'BEGIN dbms_scheduler.stop_job(''%s'', TRUE); END;',
      [AJobName]);
end;

function IsLikeInjection( S: string ): Boolean;
begin
  Result:= StrInList( S, ['INJECTION', 'BLOWMOLD', 'THERMOSET', 'ROTATIONAL', 'DIECAST', 'STAMPING', 'RIM', 'SFOAM' ]);
end;

function IsWeightUom( AUom: string ): Boolean;
begin
  Result:= StrInList( Trim(UpperCase(AUom)), ['LBS', 'GR', 'KG', 'OZ']);
end;

function IQFieldAsStr( AField: TField; ADefaultValue: string = 'NULL' ): string;
begin
  if AField.asFloat > 0 then
     Result:= FloatToStr( AField.asFloat )
  else
     Result:= ADefaultValue;
end;

procedure SafeNext( ADataSet: TDataSet );
var
  AField: TField;
  ID    : Real;
begin
  if ADataSet.State = dsInactive then
     EXIT;

  {get ID field}   
  AField:= ADataSet.FindField('ID');
  IQAssert( Assigned(AField), IQMS.Common.ResStrings.cTXT0000298 ); {'Unable to execute SafeNext call - ID field is not available'}

  {store current ID}
  ID:= AField.asFloat;
  
  with ADataSet do
  try
    {attempt to move to the next record}
    Next;
  except on E: Exception do
    begin
      {reopen}
      Close;
      Open;
      
      {locate current record}
      // 'Failed to locate ID = %.f during SafeNext call'
      IQAssert( Locate('ID', ID, []), Format( IQMS.Common.ResStrings.cTXT0000299, [ ID ]));

      {try next again}
      Next;
    end;
  end;
end;

function FormatTelephoneText(AText: String; AApplyUSAMask: Boolean): String;
var
  ANumerics, AMask: String;
  ANumberCount: Integer;
  AHasParentheses: Boolean;
begin
  // Initialization
  Result := AText;
  ANumerics := '';
  AMask := '';
  ANumberCount := 0;
  AHasParentheses := False;

  if AApplyUSAMask then
    begin
      // First, get a string that contains only numerics.
      // This will help use determine how many numbers are
      // in the telephone number string.  Sometimes the number
      // will include the country code, or a local network
      // switch, or something else.
      ANumerics := Numerics(AText);
      ANumberCount := Length(ANumerics);
      AHasParentheses := (Pos('(', AText)>0) or (Pos(')', AText)>0);

      // A valid range of numbers, accounting for different countries,
      // is 7 to 11.  An additional digit may be included which is a
      // local network switch to obtain an outside line, bringing the
      // count to 12 or more.
      if (ANumberCount < 7) then
       Exit;

      // Field text needs to be assigned before the mask is applied
      // get mask based on current field contents.  The input text
      // will be the result (no change)
      if (ANumberCount < 7) then
        Exit
      else if ANumberCount = 7 then
        begin
          { USA_TELEPHONE_MASK_A_7: String = '999-9999;0;';
            USA_TELEPHONE_MASK_B_7: String = '999-9999;0;'; }
          AMask := sIIf(AHasParentheses,
              USA_TELEPHONE_MASK_B_7, USA_TELEPHONE_MASK_A_7);
        end
      else if ANumberCount = 10 then
        begin
          { USA_TELEPHONE_MASK_A_10: String = '999-999-9999;0;';
            USA_TELEPHONE_MASK_B_10: String = '(999) 999-9999;0;'; }
          AMask := sIIf(AHasParentheses,
              USA_TELEPHONE_MASK_B_10, USA_TELEPHONE_MASK_A_10);
        end
      else if ANumberCount = 11 then
        begin
          { USA_TELEPHONE_MASK_A_11: String = '\+9 999-999-9999;0;';
            USA_TELEPHONE_MASK_B_11: String = '\+9 (999) 999-9999;0;' }
          AMask := sIIf(AHasParentheses, USA_TELEPHONE_MASK_B_11, USA_TELEPHONE_MASK_A_11);
        end
      else if ANumberCount = 12 then
        begin
          { USA_TELEPHONE_MASK_A_12: String = '9 \+9 999-999-9999;0;';
            USA_TELEPHONE_MASK_B_12: String = '9 \+9 (999) 999-9999;0;'; }
          AMask := sIIf(AHasParentheses,
              USA_TELEPHONE_MASK_B_12, USA_TELEPHONE_MASK_A_12);
        end;


      // We apply literal, masked text.  This way the data is saved correctly,
      // to the database and can be seen as masked (WYSIWYG).
      if Length(AMask) > 0 then
        begin
          Result := System.MaskUtils.FormatMaskText(AMask, ANumerics); // apply text as masked
          // if the new length is less than the original length,
          // then something went wrong when we applied the
          // mask -- return the numerics.
          if Length(Result) < ANumberCount then
            Result := AText;
        end
      else
        Result := AText;
    end;
end;



function IQGetUDCaption(AAppName, AFormName, AUDLabelName: String;
  ADefaultCaption: String = '' ): String;
begin
{ Example:
   AAppName = 'IQWIN32.EXE'
   AFormName = 'FrmAp'
   AUDLabelName = 'UDLabel1'
   ADefaultCaption = 'User Text 1'

}
     Result := SelectValueFmtAsString(
       'select user_text from userdef ' +
       'where app_name = ''%s'' ' +
       'and parent_name = ''%s'' and ' +
       'component_name = ''%s'' ',
       [ AAppName, AFormName, AUDLabelName ] );
     if Result = '' then Result := ADefaultCaption;
end;

function GetDefaultBillToID(AArcustoID: Real): Real;
begin
  Result := SelectValueFmtAsInt64(
   'SELECT arcusto_misc.get_default_bill_to_id(%.0f) FROM DUAL',
   [AArcustoID]);

//  // Get default bill-to
//  Result:= SelectValueFmtAsInt64(
//    'select id from bill_to where arcusto_id = %.0f and default_bill_to = ''Y''',
//    [ AArcustoID ]);
//
//  // didn't find - get first available one
//  if Result = 0 then
//     Result:= SelectValueFmtAsInt64(
//       'select id from bill_to where arcusto_id = %.0f',
//       [AArcustoID] );
end;


function GetDefaultShipToID(AArcustoID: Real): Real;
begin
  Result := SelectValueFmtAsInt64(
   'SELECT arcusto_misc.get_default_ship_to_id(%.0f) FROM DUAL',
   [AArcustoID]);

//  // Get default ship-to
//  Result:= SelectValueFmtAsInt64(
//    'select id from ship_to where arcusto_id = %.0f and default_ship_to = ''Y''',
//    [ AArcustoID ]);
//
//  // didn't find it - get first available one
//  if Result = 0 then
//     Result:= SelectValueFmtAsInt64(
//       'select id from ship_to where arcusto_id = %.0f',
//       [AArcustoID] );
end;

function GetDefaultContactID(AArcustoID: Real; AShipToID: Real = 0): UInt64;
//var
//  aCount: Integer;
begin
  Result := SelectValueFmtAsInt64(
   'SELECT arcusto_misc.get_default_contact_id(%d, %d) FROM DUAL',
   [Trunc(AArcustoID), Trunc(AShipToID)]);
end;

function CheckCreateDefaultShipTo( AArcustoID: Real ): Real;
var
   AShipToID: Real;
begin
  // Checks to see if there are any ship to records for this customer.  If there are,
  // then it returns the default Ship To ID. If not, it creates a ship to record.
  // This will return default ID or first ID
  Result := GetDefaultShipToID( AArcustoID );
  if ( Result = 0 ) then
     Result := CreateShipTo( AArcustoID, TRUE );
end;

function CreateShipTo( const AArcustoID: Real; ADefault: Boolean ): Real;
var ADefYN: String; AID: Real;
begin
  // Creates a Ship To address from the Customer record indicated by AArcustoID
  Result := 0;
  if ( AArcustoID = 0 ) then
    Exit(0);

  ADefYN := 'N';
  if ADefault then
    ADefYN := 'Y';

  AID := GetNextID( 'SHIP_TO' );
  // DEVELOPER NOTE:  Put into back end when convenient.
  ExecuteCommandFmt(
    'insert into ship_to ' +
    '     ( id, arcusto_id, attn, addr1, addr2, addr3, city, state, zip, country, use_usa_mask, phone_number, fax, ext, prime_contact, default_ship_to) ' +
    'select %.0f, id, company, addr1, addr2, addr3, city, state, zip, country, use_usa_mask, phone_number, fax_number, ext, prime_contact, ''%s'' ' +
    'from arcusto where id = %.0f ' ,
    [ AID, ADefYN, AArcustoID ] );
  Result := AID;
end;

function CreateBillTo( const AArcustoID: Real; ADefault: Boolean ): Real;
var ADefYN: String; AID: Real;
begin
  // Creates a Bill To address from the Customer record indicated by AArcustoID
  Result := 0;
  if ( AArcustoID = 0 ) then
    Exit(0);

  ADefYN := 'N';
  if ADefault then ADefYN := 'Y';

  AID := GetNextID( 'BILL_TO' );
  // DEVELOPER NOTE:  Put into back end when convenient.
  ExecuteCommandFmt(
    'insert into bill_to ' +
    '     ( id, arcusto_id, attn, addr1, addr2, addr3, city, state, zip, country, use_usa_mask, phone_number, fax, ext, prime_contact, default_bill_to) ' +
    'select %.0f, id, company, addr1, addr2, addr3, city, state, zip, country, use_usa_mask, phone_number, fax_number, ext, prime_contact, ''%s'' ' +
    'from arcusto where id = %.0f ' ,
    [ AID, ADefYN, AArcustoID ] );
end;

function CloneShipTo(const AShipToID: Real): Real;
begin
  Result := GetNextID('SHIP_TO');
  // DEVELOPER NOTE:  Put into back end when convenient.
  ExecuteCommandFmt(
            'INSERT INTO SHIP_TO'#13 +
            '( id, arcusto_id, attn, addr1, addr2, addr3, city,'#13 +
            '  state, country, zip, ship_time, tax_code_id,'#13 +
            '  phone_number, ext, fax, prime_contact, freight_id, notes,'#13 +
            '  fob, use_usa_mask, eplant_id, days_margin, qty_pcnt_margin,'#13 +
            '  locations_id, default_ship_to, cuser1, cuser2,'#13 +
            '  vmi_invoice_on_ship, sun_ship, mon_ship, tue_ship,'#13 +
            '  wed_ship, thu_ship, fri_ship, sat_ship,'#13 +
            '  use_dockid_pickticket, dist_center_id, dockid, pool_code,'#13 +
            '  bol_note, pk_tkt_keep_rel_separate, packslip_report,'#13 +
            '  bol_report, bol_header_report, division_id,'#13 +
            '  vmi_usesysdate_autoinv, cuser3, cuser4, cuser5, nuser1,'#13 +
            '  nuser2, nuser3, nuser4, nuser5, no_printed_invoice,'#13 +
            '  preferred_ship_day, pk_tkt_exclude_forecast_rel,'#13 +
            '  supplier_code, billing_supplier_code, cuser6, cuser7,'#13 +
            '  bill_to_id, match_release_based_on_ran )'#13 +
            'SELECT'#13 +
            '  %.0f, arcusto_id, attn, addr1, addr2, addr3, city,'#13 +
            '  state, country, zip, ship_time, tax_code_id,'#13 +
            '  phone_number, ext, fax, prime_contact, freight_id, notes, '#13 +
            '  fob, use_usa_mask, eplant_id, days_margin, qty_pcnt_margin,'#13 +
            '  locations_id, default_ship_to, cuser1, cuser2,'#13 +
            '  vmi_invoice_on_ship, sun_ship, mon_ship, tue_ship,'#13 +
            '  wed_ship, thu_ship, fri_ship, sat_ship,'#13 +
            '  use_dockid_pickticket, dist_center_id, dockid, pool_code,'#13 +
            '  bol_note, pk_tkt_keep_rel_separate, packslip_report,'#13 +
            '  bol_report, bol_header_report, division_id,'#13 +
            '  vmi_usesysdate_autoinv, cuser3, cuser4, cuser5, nuser1,'#13 +
            '  nuser2, nuser3, nuser4, nuser5, no_printed_invoice,'#13 +
            '  preferred_ship_day, pk_tkt_exclude_forecast_rel,'#13 +
            '  supplier_code, billing_supplier_code, cuser6, cuser7,'#13 +
            '  bill_to_id, match_release_based_on_ran'#13 +
            'FROM ship_to'#13 +
            'WHERE id = %.0f',
            [Result, AShipToID]);
end;

function CloneBillTo(const ABillToID: Real): Real;
begin
  Result := GetNextID('SHIP_TO');
  // DEVELOPER NOTE:  Put into back end when convenient.
  ExecuteCommandFmt(
            'INSERT INTO BILL_TO'#13 +
            '  id, arcusto_id, attn, addr1, addr2, addr3, city,'#13 +
            '  state, country, zip, phone_number, ext, fax,'#13 +
            '  prime_contact, notes, company_id'#13 +
            '  use_usa_mask, default_bill_to,'#13 +
            '  invoice_report'#13 +
            'SELECT'#13 +
            '  %.0f, arcusto_id, attn, addr1, addr2, addr3, city,'#13 +
            '  state, country, zip, phone_number, ext, fax,'#13 +
            '  prime_contact, notes, company_id, '#13 +
            '  use_usa_mask, default_bill_to,'#13 +
            '  invoice_report'#13 +
            'FROM BILL_TO'#13 +
            'WHERE id = %.0f',
            [Result, ABillToID]);
end;

// Get the next Customer number from the sequence
function NextCustomerNumber: String;
begin
  try
     // Create the required sequence if it does not exist.
     if SelectValueAsInteger(
               'SELECT 1'#13 +
               '  FROM all_objects'#13 +
               ' WHERE object_name = ''S_SYSGEN_CUSTNO'' AND'#13 +
               '       ROWNUM < 2') = 0 then
        ExecuteCommand(
               'CREATE SEQUENCE s_sysgen_custno'#13 +
               '   START WITH 1'#13 +
               '   NOCACHE'#13 +
               '   NOCYCLE');

     Result := SelectValueAsString(
       'SELECT arcusto_misc.getnextarcustosequence FROM DUAL');
  except on E:Exception do
     raise Exception.Create('Encountered error attempting to obtain next Customer number:'#13#13 + E.Message);
  end;
end;

// Get the next Customer number from the sequence
function NextVendorNumber: String;
begin
  try
     // Create the required sequence if it does not exist.
     if SelectValueAsInteger(
               'SELECT 1'#13 +
               '  FROM all_objects'#13 +
               ' WHERE object_name = ''S_SYSGEN_VENDNO'' AND'#13 +
               '       ROWNUM < 2') = 0 then
        ExecuteCommand(
               'CREATE SEQUENCE s_sysgen_vendno'#13 +
               '   START WITH 1'#13 +
               '   NOCACHE'#13 +
               '   NOCYCLE');

     Result := SelectValueAsString(
       'SELECT arcusto_misc.getnextvendorsequence FROM DUAL');
  except on E:Exception do
     raise Exception.Create('Encountered error attempting to obtain next Vendor number:'#13#13 + E.Message);
  end;
end;


function IsLikeGeneric( S: string ): Boolean;
begin
  Result:= SelectValueFmtAsInteger(
    'select Mfg.Like_Generic_ExA( ''%s'' ) from dual',
    [ S ]) = 1;
end;

procedure LoadColumnValueIntoStringList(
  AList: TStringList;
  ASelectStatement: string;
  AExecuteOnAdd: TExecuteOnAddToTStringListFromQuery = NIL;
  AClearList: Boolean = TRUE;
  DB: string = cnstFDConnectionName);
var
  AQry: TFDQuery;
begin
  if AClearList then
     AList.Clear;
  AQry:= TFDQuery.Create(nil);
  with AQry do
  try
    ConnectionName:= DB;
    SQL.Add( ASelectStatement );
    Open;
    while not Eof do
    begin
      AList.Add( Fields[ 0 ].asString );
      if Assigned( AExecuteOnAdd ) then
         AExecuteOnAdd( AList, AQry );
      Next;
    end;
  finally
    Free;
  end;
end;



procedure IQCheckDelete(Sender: TObject; Button: TNavigateBtn; APrompt: string);
var
  ADataSet: TDataSet;
begin
  { This method is used to evaluate TDBNavigator BeforeAction
    and displays a custom prompt. }

  // Ensure sender is provided and is the correct class
  if not Assigned(Sender) or not (Sender is TDBNavigator) then
    Exit;
  // Ensure we have a dataset object
  if not Assigned(TDBNavigator(Sender).DataSource) or
    not Assigned(TDBNavigator(Sender).DataSource.DataSet) then
    Exit;
  // Refresh the query dataset
  if (Button = nbDelete) and (Trim(APrompt) > '') then
    begin
      // Set the property to false to prevent the default message
      // from displaying.
      TDBNavigator(Sender).ConfirmDelete := False;
      // Show the custom delete prompt
      if not IQConfirmYN(APrompt) then
        System.SysUtils.Abort;
    end;
end;


// -----------------------------------------------------------------------------
// ** Begin Force Value methods **
// -----------------------------------------------------------------------------
procedure ForceValue(AEditBox: TUniEdit; AText: String);
var
   AOnChange: TNotifyEvent;
   AOnExit: TNotifyEvent;
begin
  if Assigned(AEditBox) then
  try
     AOnChange := AEditBox.OnChange;
     AOnExit := AEditBox.OnExit;

     AEditBox.OnChange := NIL;
     AEditBox.OnExit := NIL;

     AEditBox.Text := AText;

  finally
     AEditBox.OnChange := AOnChange;
     AEditBox.OnExit := AOnExit;
  end;
end;

procedure ForceValue(ADateTimePicker: TUniDateTimePicker; ADate: TDateTime);
var
   AOnChange: TNotifyEvent;
   AOnExit: TNotifyEvent;
begin
  if Assigned(ADateTimePicker) then
  try
     AOnChange := ADateTimePicker.OnChange;
     AOnExit := ADateTimePicker.OnExit;

     ADateTimePicker.OnChange := NIL;
     ADateTimePicker.OnExit := NIL;

     ADateTimePicker.DateTime := ADate;

  finally
     ADateTimePicker.OnChange := AOnChange;
     ADateTimePicker.OnExit := AOnExit;
  end;
end;


// -----------------------------------------------------------------------------
// ** End Force Value methods **
// -----------------------------------------------------------------------------



procedure CheckVistaAdjustSize( const AControls: array of TControl;
  AOffset: Integer = 4 );
var
   I: Integer;
begin
  if not IsWinVista then {in IQMS.Common.SysInfo.pas}
     EXIT;

  for I:= 0 to High( AControls ) do
    AControls[ I ].Width:= AControls[ I ].Width - AOffset;
end;

procedure CheckVistaMove( const AControls: array of TControl;
  ADirection: Integer = 1 {1-left, 2-up}; AOffset: Integer = 4 );
var
  I:Integer;
begin
  if not IsWinVista then {in IQMS.Common.SysInfo.pas}
     EXIT;

  for I:= 0 to High( AControls ) do
    case ADirection of
      1: AControls[ I ].Left:= AControls[ I ].Left - AOffset;
      2: AControls[ I ].Top:= AControls[ I ].Top - AOffset;
    end;
end;

procedure AdjustControlsWidthBasedOnParent( AParent: TWinControl;
  const AControls: array of TControl; AOffset: Integer );
begin
  AdjustControlWidthToParentB( AParent, AControls, AOffset );  // IQMS.Common.Controls.pas
end;

function CheckUserHasVendorAccess(const AVendorID: Real): Boolean;
begin
  // 06/24/2013 Modified SQL to account for "excludes"
  Result := (AVendorID = 0)
            or
            (SelectValueFmtAsInt64(
              'SELECT a.id'#13 +
              '  FROM vendor a,'#13 +
              '       (SELECT COUNT( * ) vend_count'#13 +
              '          FROM s_user_vendors'#13 +
              '         WHERE user_name = misc.getusername AND'#13 +
              '               ROWNUM < 2) b,'#13 +
              '       (SELECT NVL(exclude_vendors, ''N'') AS exclude_vendors'#13 +
              '          FROM s_user_general'#13 +
              '         WHERE user_name = misc.getusername AND'#13 +
              '               ROWNUM < 2) c'#13 +
              ' WHERE a.id = %.0f AND'#13 +
              '       (b.vend_count = 0 OR'#13 +
              '        c.exclude_vendors = ''N'' AND'#13 +
              '        EXISTS (SELECT 1'#13 +
              '                  FROM s_user_vendors'#13 +
              '                 WHERE user_name = misc.getusername AND'#13 +
              '                       vendor_id = a.id) OR'#13 +
              '        c.exclude_vendors = ''Y'' AND'#13 +
              '        NOT EXISTS (SELECT 1'#13 +
              '                      FROM s_user_vendors'#13 +
              '                     WHERE user_name = misc.getusername AND'#13 +
              '                           vendor_id = a.id))',
              [AVendorID]) = AVendorID);
end;


function CheckUserHasCustomerAccess(const AArcustoID: Real): Boolean;
begin
  // 03-21-2008 added eplant_id support
  // 02/27/2008
  // 06/24/2013 Modified SQL to account for "excludes"
  Result := (AArcustoID = 0)
            or
            (SelectValueFmtAsInt64(
              'SELECT a.id'#13 +
              '  FROM arcusto a,'#13 +
              '       (SELECT COUNT( * ) cust_count'#13 +
              '          FROM s_user_crm_customers'#13 +
              '         WHERE user_name = misc.getusername AND'#13 +
              '               ROWNUM < 2) b,'#13 +
              '       (SELECT NVL(exclude_customers, ''N'') AS exclude_customers'#13 +
              '          FROM s_user_general'#13 +
              '         WHERE user_name = misc.getusername AND'#13 +
              '               ROWNUM < 2) c'#13 +
              ' WHERE a.id = %.0f AND'#13 +
              '       (b.cust_count = 0 OR'#13 +
              '        c.exclude_customers = ''N'' AND'#13 +
              '        EXISTS (SELECT 1'#13 +
              '                  FROM s_user_crm_customers'#13 +
              '                 WHERE user_name = misc.getusername AND'#13 +
              '                       arcusto_id = a.id) OR'#13 +
              '        c.exclude_customers = ''Y'' AND'#13 +
              '        NOT EXISTS (SELECT 1'#13 +
              '                      FROM s_user_crm_customers'#13 +
              '                     WHERE user_name = misc.getusername AND'#13 +
              '                           arcusto_id = a.id))',
              [AArcustoID]) = AArcustoID);
end;


// 01-06-2009 same as above but with split queries to speed up the processing
function CheckUserHasCustomerAccess_Ex(const AArcusto_ID: Real): Boolean;
var
  AExclude: Boolean;
begin
  Result:= TRUE;
  
  if (AArcusto_ID = 0) then
     Exit(True);

  // eplant filter   
  if SelectValueFmtAsInteger(
    'select 1 from arcusto where id = %.0f and misc.eplant_filter_include_nulls( eplant_id ) = 1',
    [ AArcusto_ID ]) = 0 then
    Exit(False);

  // any customer assgined
  if SelectValueAsInteger(
    'select 1 from s_user_crm_customers where user_name = misc.GetUserName and rownum < 2') = 0 then
     Exit(True);

  // 06/24/2013 Exclude list of customers?
  AExclude := SelectValueAsString(
    'SELECT NVL(exclude_customers, ''N'') ' +
    'FROM s_user_general WHERE user_name = misc.getusername AND ' +
    'ROWNUM < 2') = 'Y';

  // customer assigned to the user
  if not AExclude and
     (SelectValueFmtAsInteger(
       'select 1 from s_user_crm_customers where user_name = misc.GetUserName and arcusto_id = %.0f',
       [ AArcusto_ID ]) = 1) then
     Result := True
  else if AExclude and
     (SelectValueFmtAsInteger(
     'select 1 from s_user_crm_customers where user_name = misc.GetUserName and arcusto_id = %.0f',
     [ AArcusto_ID ]) = 0) then
     Result := True
  else
     Result:= False;
end;

function ConcatAddressA(const AContact, ACompany, AAddress1,
  AAddress2, AAddress3, ACity, AState, AZip, ACountry: String): String;
const
  c_nl = #13;
var
   AResult: String;

  procedure _add(const AText: String);
  begin
    if Trim(AText) > '' then
       begin
         if AResult = '' then
            AResult := Trim(AText)
         else
            AResult := AResult + c_nl + Trim(AText);
       end;
  end;

begin
  _add(AContact);
  _add(ACompany);
  _add(AAddress1);
  _add(AAddress2);
  _add(AAddress3);
  _add(ConcatCityStateZip(ACity, AState, AZip));
  _add(ACountry);
  Result := AResult;
end;

function ConcatAddressB(const AContact, ACompany, AAddress1,
  AAddress2, AAddress3, ACity, AState, AZip, ACountry,
  ATelephone, AExt, AFax, ACellTelephone, AEMail, AURL: String): String;
const
  c_nl = #13;
var
   AResult: String;

  procedure _add(const AText: String; const ACaption: String = '');
  var
     ATempResult: String;
  begin
    if (Trim(AText) = '') then Exit;

    if (Trim(ACaption) > '') then
       ATempResult := Format('%s:  %s', [ACaption, AText])
    else
       ATempResult := AText;

    if AResult = '' then
       AResult := Trim(ATempResult)
    else
       AResult := AResult + c_nl + Trim(ATempResult);

  end;

begin
  _add(AContact);
  _add(ACompany);
  _add(AAddress1);
  _add(AAddress2);
  _add(AAddress3);
  _add(ConcatCityStateZip(ACity, AState, AZip));
  _add(ACountry);
  _add(ConcatTelephone(ATelephone, AExt), IQMS.Common.ResStrings.cTXT0000392); // 'Telephone'
  _add(AFax,IQMS.Common.ResStrings.cTXT0000393); // 'Fax'
  _add(ACellTelephone,IQMS.Common.ResStrings.cTXT0000394); // 'Cell Telephone'
  _add(AEMail,IQMS.Common.ResStrings.cTXT0000395); // 'E-Mail'
  _add(AURL,IQMS.Common.ResStrings.cTXT0000396); // 'Web Site'
  Result := AResult;
end;

function ConcatCityStateZip(const ACity, AState, AZip: String): String;
begin
  if (Trim(ACity) > '') and (Trim(AState) > '') then
     Result := Trim(Format('%s, %s %s', [Trim(ACity),Trim(AState),Trim(AZip)]))
  else if (Trim(ACity) > '') and (Trim(AState) = '') then
     Result := Trim(Format('%s %s', [Trim(ACity),Trim(AZip)]))
  else if (Trim(AState) > '') and (Trim(ACity) = '') then
     Result := Trim(Format('%s %s', [Trim(AState),Trim(AZip)]))
  else Result := Trim(AZip);
end;

function ConcatTelephone(const ATelephone, AExt: String): String;
begin
  if (Trim(ATelephone) > '') and (Trim(AExt) > '') then
     Result := Format('%s, %s', [ATelephone, AExt])
  else if (Trim(ATelephone) > '') then
     Result := ATelephone;
end;

function EnableConstraints(const ATableName: String; const AEnabled: Boolean;
 var AErrorMsg: String; DB: string): Boolean;
var
   ACmd: String;
   AErrors: TStringList;

   // --------------------------------------------------------------------------
   procedure _Eval(AConstraintName: String);
   begin
     try
        ExecuteCommandFmt(
          'ALTER TABLE %s'#13 +
          '  %s CONSTRAINT %s',
          [UpperCase(ATableName), ACmd, AConstraintName]);
     except on E:Exception do
      AErrors.Add(E.Message);
     end;
   end;
   // --------------------------------------------------------------------------

begin
  // Initialization
  Result := False;
  AErrors := NIL;
  AErrorMsg := '';

  // Validation
  if not TableExists(ATableName) then
     Exit;

  AErrors := TStringList.Create;
  try
     // Set variables
     ACmd := IfThen(AEnabled, 'ENABLE', 'DISABLE');

     with TFDQuery.Create(NIL) do
     try
        ConnectionName := cnstFDConnectionName;
        // Get a list of constraints for this table
        SQL.Add(       'select constraint_name');
        SQL.Add(       'from user_constraints');
        SQL.Add(Format('where table_name = ''%s''',[UpperCase(ATableName)]));
        // Open and cycle the dataset
        Open;
        while not EOF do
         begin
           // Alter the constraint
           _Eval(FieldByName('CONSTRAINT_NAME').AsString);
           Next;
         end;
     finally
        Free;
     end;

     // If we encounter errors while attempting to enable constraints,
     // then return the errors;  we do not return errors when disabling
     // constraints because there really isn't any point.
     if (AErrors.Count > 0) and AEnabled then
        AErrorMsg := 'Encountered error(s) enabling constraints on table:'#13#13 +
         AErrors.Text;

     // Pass result
     Result := AErrors.Count = 0;

  finally
    if Assigned(AErrors) then
      FreeAndNil(AErrors);
  end;
end;

function EnableTrigger(ATriggerName: String; AEnabled: Boolean;
 var AErrorMsg: String): Boolean;
begin
  // Initialization
  Result := False;
  AErrorMsg := '';
  try
     if AEnabled then
       ExecuteCommandFmt(
         'alter trigger %s enable',
         [ATriggerName] )
     else ExecuteCommandFmt(
       'alter trigger %s disable',
       [ATriggerName] );
     Result := True;
  except on E:Exception do
    AErrorMsg := E.Message;
  end;
end;

function jobshop2_licensed: Real;
begin
  Result:= SelectValueAsInteger(
    'select misc.get_jobshop2_licensed from dual');
end;

function GetEmployeeName( APrEmpID: Real ): String;
begin
  // 06/20/2013 Changed SQL to return nickname, instead of proper name.
  Result := SelectValueFmtAsString(
    'SELECT SUBSTRB(iqms.misc.format_name(first_name, nickname, '#13 +
    '               middle_name, last_name), 1, 255) '#13 +
    '          AS display_name '#13 +
    '  FROM pr_emp'#13 +
    ' WHERE id = %.0f',  [APrEmpID]);
end;

function GetEmployeeName( AUserName: String ): String;
var APrEmpID: Real;
begin
  APrEmpID := GetEmployeeID(AUserName);
  Result := GetEmployeeName(APrEmpID);
end;

function GetEmployeeID( AUserName: String ): Real;
begin
  Result := SelectValueFmtAsInt64(
    'SELECT pr_emp_id FROM s_user_general ' +
    'WHERE user_name = ''%s'' AND ROWNUM < 2',
    [AUserName] );
end;

procedure FilterInactive(ADataSet: TDataSet; AFiltered: Boolean; ARefresh: Boolean = False);
begin
  with ADataSet do
   if FindField('PK_HIDE') <> NIL then
      begin
        if AFiltered = TRUE then
           begin
             if not Filter.Trim.IsEmpty then
                Filter := Format('%s AND (PK_HIDE IS NULL OR PK_HIDE <> ''Y'')', [Filter])
             else Filter := 'PK_HIDE IS NULL OR PK_HIDE <> ''Y''';
           end;
        Filtered := AFiltered;
        if ARefresh then
           ReOpen(ADataSet);
      end;
end;

function IsSerialized(AArinvt_ID: Real): Boolean;
begin
  Result:= System.Variants.VarToStr(
    SelectValueByID('is_linked_to_serial', 'arinvt', AArinvt_ID  )) = 'Y';
end;


procedure CheckApplyUSAMask(AField:TField);
begin
  if SelectValueAsString(
    'SELECT NVL(default_to_usa_mask, ''N'') FROM iqsys2 WHERE ROWNUM < 2') = 'Y' then
    AField.AsString := 'Y'
  else  
    AField.AsString := 'N';
end;

function GetFieldSize(const ATableName, AColumnName: string): Integer;
begin
  if Empty(ATableName) or Empty(AColumnName) then
    Exit(0);
  Result := SelectValueFmtAsInteger(
   'SELECT data_length FROM cols WHERE table_name = TRIM(UPPER(''%s'')) AND ' +
   'column_name = TRIM(UPPER(''%s''))', [ATableName, AColumnName]);
end;

function IsSIC( AArinvt_ID: Real ): Boolean;
begin
  Result:= System.Variants.VarToStr(
    SelectValueByID('is_linked_to_serial', 'arinvt', AArinvt_ID )) = 'Y';
end;

function IsMTO( AOrd_Detail_ID: Real ): Boolean;
begin
  Result:= (AOrd_Detail_ID > 0) and
  (System.Variants.VarToStr(SelectValueByID('is_make_to_order', 'ord_detail', AOrd_Detail_ID)) = 'Y');
end;


procedure CheckDBNameConflict( ASQL, DB: string );
begin
  if GetCurrentThreadID = MainThreadID then
    EXIT;

  // BDE
  // thread must have it own database name
  if DB <> cnstFDConnectionName then
    EXIT;

  // report potential problem!
  TFrmCheckPointList.Add( Format('DBNAME_CONFLICT in %s, SQL: '#13'%s',
                                [ ExtractFileName(Application.ExeName),
                                  ASQL ]));
end;

function GetEmailAddress( ASourceTable: String; ASourceID: Real; AContactID: Real ): String;
begin
  Result := '';
  if (CompareText(ASourceTable, 'ARCUSTO') = 0) then
     Result := SelectValueFmtAsString(
       'SELECT email FROM contact WHERE id = %.0f',
       [AContactID])
  else if (CompareText(ASourceTable, 'VENDOR') = 0) then
     Result := SelectValueFmtAsString(
       'SELECT email FROM vendor_contact WHERE id = %.0f',
       [AContactID])
  else if (CompareText(ASourceTable, 'PARTNER') = 0) then
     Result := SelectValueFmtAsString(
       'SELECT email FROM partner_contacts WHERE id = %.0f',
       [AContactID])
  else if (CompareText(ASourceTable, 'PR_EMP') = 0) then
     Result := SelectValueFmtAsString(
       'SELECT email FROM s_user_general WHERE pr_emp_id = %.0f',
       [ASourceID]);

  // trim it
  Result := Trim(Result);
end;

function GetEmployeeEMailAddress( AEmployeeID: Real ): String; overload;
begin
  //Result := GetValStrFmt('select email from s_user_general where pr_emp_id = %.0f', [APrEmpID]);
  Result := GetEmailAddress('PR_EMP', AEmployeeID, 0);
end;

function GetEmployeeEMailAddress( AUserName: String ): String; overload;
begin
  Result := SelectValueFmtAsString(
    'SELECT email FROM s_user_general WHERE user_name = UPPER(TRIM(''%s'')) ',
   [UpperCase(Trim(AUserName))]);
  // trim it
  Result := Trim(Result);
end;

function GetWebSiteURL(ASourceTable: string; ASourceID: Real;
  var AURL: string): Boolean;
begin
  Result := False;
  if (CompareText(ASourceTable, 'ARCUSTO') = 0) then
     AURL := SelectValueFmtAsString(
       'SELECT web_site_url FROM arcusto WHERE id = %.0f',
       [ASourceID])
  else if (CompareText(ASourceTable, 'VENDOR') = 0) then
     AURL := SelectValueFmtAsString(
       'SELECT web_site_url FROM vendor WHERE id = %.0f',
         [ASourceID])
  else if (CompareText(ASourceTable, 'PARTNER') = 0) then
     AURL := SelectValueFmtAsString(
       'SELECT web_site_url FROM partner WHERE id = %.0f',
         [ASourceID])
  else if (CompareText(ASourceTable, 'PR_EMP') = 0) then
     AURL := SelectValueAsString(
       'SELECT internet FROM iqsys WHERE ROWNUM < 2')
  else
    AURL := '';
  Result := (Trim(AURL) > '');
end;

function FlattenSQL(const ASQL: string): string;
var
  sl: TStringList;
  i: Integer;
begin
  Result := '';
  sl := TStringList.Create;
  try
    sl.Text := ASQL;
    for i := 0 to sl.Count - 1 do
      Result := Result + Trim(sl.Strings[i]) + ' ';
  finally
    sl.Free;
  end;
end;

procedure CheckQueryHasDuplicateParams(AQuery: TFDQuery);
var
  i: Integer;
  sl: TStringList;
  AFormName: string;
begin
  if Assigned(AQuery) then
    begin
      sl := TStringList.Create;
      try
        for i := 0 to AQuery.Params.Count - 1 do
          begin
            if sl.IndexOf(AQuery.Params[i].Name) > -1 then
              begin
                // get the owner form name
                AFormName := IQMS.Common.Controls.GetOwnerFormName(AQuery);
                raise Exception.CreateFmt(
                  'Application Error:  FireDAC Query, %s, has duplicate ' +
                  'parameters (%s).'#13'Form = %s',
                  [AQuery.Name, AQuery.Params[i].Name, AFormName]);
              end
            else
              sl.Add(AQuery.Params[i].Name);
          end;
      finally
        sl.Free;
      end;
    end;
end;

procedure CheckAddMoreInfoOnMasterHasDetailRecods( var AMsg: string; AParentTableName, AChildTableName: string );
begin
  if (CompareText(AParentTableName,'PO_DETAIL') = 0)  and (CompareText(AChildTableName, 'KB_CONTROL') = 0) then
     AMsg:= AMsg + #13#13 + IQMS.Common.ResStrings.cTXT0000387 {'Cannot archive or delete PO linked to Kanban Control. Update Kanban Control by removing link to PO and try again.'};
end;

function GetConstraintTableNames( S: string; var AParentTableName, AChildTableName: string ): Boolean;
var
  A: Variant;
begin
  Result:= FALSE;
  S:= ExtractConstraintName( S );
  if S > '' then
  try
     A:= SelectValueArrayFmt( 'select table_name, r_constraint_name from user_constraints where constraint_name = ''%s''', [ S ]);
     if VarArrayDimCount( A ) = 0 then
        EXIT;

     AChildTableName := A[ 0 ];
     AParentTableName:= SelectValueFmtAsString('select table_name from user_constraints where constraint_name = ''%s''', [ A[ 1 ]]);

     Result:= (AChildTableName > '') and (AParentTableName > '');
  except
  end;
end;

function ExtractConstraintName( S: string ): string;
var
  I: Integer;
begin
  try
    I:= Pos( '(', S );
    if I = 0 then
       EXIT;
    S:= Copy( S, I+1, Length(S));

    I:= Pos( ')', S );
    if I = 0 then
       EXIT;
    S:= Copy( S, 1, I-1 );

    S:= UpperCase(S);
    I:= Pos( 'IQMS.', S );
    if I > 0 then
       S:= Copy( S, I+5, Length(S));
    Result:= S;
  except
    Result:= '';
  end;
end;

procedure iqAssignNewID( var ID_field:TFloatField; const TblName:string );
begin
   if ID_field.Value = 0 then
      ID_field.Value:= GetNextID( TblName );  {get next ID}
end;

procedure IQAssignNewID( var ID_field: TBCDField; const TblName:string );
begin
  if ID_field.IsNull or (ID_field.Value = 0) then
     ID_field.Value := GetNextID( TblName );  {get next ID}
end;

procedure iqPostParentsBeforeEdit( ChildDataSet: TDataset );
var
  ACurrentDataSet, AMasterDataSet: TDataSet;
begin
  // Assign to local variable for loop
  ACurrentDataSet := ChildDataSet;
  AMasterDataSet := NIL;

  // Find the highest AMasterDataSet parent, and post the dataset
  // if it is in Edit or Insert mode.
  if (ACurrentDataSet is TFDTable) or
    (ACurrentDataSet is TFDQuery) then
    begin
      // Find the highest AMasterDataSet parent
      while TFDDataSet(ACurrentDataSet).MasterSource <> NIL do
        with TFDDataSet(ACurrentDataSet).MasterSource do
          begin
            if DataSet.State in [dsEdit, dsInsert] then
               AMasterDataSet := DataSet;
            // Assign next child dataset for next loop
            ACurrentDataSet:= DataSet;
        end;
    end
  else
    raise Exception.Create(Format('Datatype %s is unsuported, expecting a FireDac dataset', [ChildDataSet.ClassName]));
  // Post changes.
  if (AMasterDataSet <> NIL) and
    (AMasterDataSet <> ChildDataSet) and
    (AMasterDataSet.State in [ dsEdit, dsInsert ]) then
    AMasterDataSet.Post;
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

procedure IQHandleDBEngineError( DataSet: TDataSet; E: Exception );
var
  Msg             : string;
  AIsFatalError   : Boolean;
  ANativeError    : Integer;
begin
  IQParseDBEngineError( DataSet, E, Msg, ANativeError, AIsFatalError );

  Msg := FixFireDACErrorMessage(Msg);
  if AIsFatalError then
     begin
       if Trim(Msg) > '' then
         IQError( Msg )
       else
         // IQMS.Common.ResStrings.cTXT0000525 = 'A fatal error has occurred.';
         IQError(IQMS.Common.ResStrings.cTXT0000525);
       HALT;
     end

  else if Assigned(DataSet) and (DataSet.State in [dsEdit, dsInsert]) and not Assigned(DataSet.BeforeCancel) then
     begin
       if IQErrorYN(Msg + #13#13 + IQMS.Common.ResStrings.cTXT0000038 { 'Abort changes?' } ) then
         DataSet.Cancel;
     end
  else if Trim(Msg) > '' then
     IQError(Msg);
end;

function IQSetTablesActive( const SetActive:Boolean; Owner:TComponent; DB: string = cnstFDConnectionName ):Boolean;
var
  I    : Integer;
  Compo: TComponent;
  hMsg : TPanelMesg;
  AUse1000Separator: Boolean;
  ATableName: string;
begin
  Result:= FALSE;
  if Owner = NIL then
    EXIT;

  with Owner do
  try
    hMsg:= NIL;
    if SetActive then
       hMsg:= hPleaseWait( IQMS.Common.ResStrings.cTXT0000136 ); // 'Accessing database.  Please wait...'

    AUse1000Separator := UseThousandSeparator;

    for i:= 0 to ComponentCount-1 do
    begin
      Compo:= Components[ I ];

      if    (Compo is TFDQuery)
         or (Compo is TFDTable) then // and not ( Compo is TIQWebHpick )) then
      try
        {message to the user}
        if Assigned(hMsg) then
           hMsg.Mesg:= Format( IQMS.Common.ResStrings.cTXT0000137, [ Compo.Name ]); // 'Accessing database (%s) ...'

        {make sure database name is assigned}
        if SetActive then
          begin
            if (Compo is TFDCustomQuery) then
              EnsureConnectionAssigned(Compo as TFDCustomQuery);
          end;

        {do not open or close picklists}
        if Compo is TIQWebHpick then
           Continue;

        {check switch & ensure numeric fields are assigned thousand separator}
        EnsureProperCurrencyDisplayAndThousandSeparatorAssigned( Components[ I ] as TDataSet, AUse1000Separator);

        {open or close}
        case Compo.Tag of
          1: ; // Do Nothing
        else
          begin
            if (Compo is TIQWebDbxQuery) then
              begin
                if SetActive then
                  TIQWebDbxQuery(Compo).Open
                else
                  TIQWebDbxQuery(Compo).Close;
              end
            else if (Compo is TFDQuery) then
              begin
                if SetActive then
                  TFDQuery(Compo).Open
                else
                  TFDQuery(Compo).Close;
              end
            else if (Compo is TFDTable) then
              begin
                if SetActive then
                  TFDTable(Compo).Open
                else
                  TFDTable(Compo).Close;
              end
            else
             TDataSet(Compo).Active:= SetActive;
          end;
        end;

      except
       {db_dm}
        on E:Exception do
          IQHandleDBEngineError( TDataSet(Compo), E );
      end;
    end;

    Result:= TRUE;
  finally
    if Assigned(hMsg) then
       FreeAndNil(hMsg);
  end; // With Owner
end; // IQSetTablesActive

function IQSetTablesActiveTimeIt( const SetActive:Boolean; Owner:TComponent; IQTiming: TIQWebTiming ):Boolean;
var
  I    : Integer;
  Compo: TComponent;
  hMsg : TPanelMesg;
begin
  Result:= FALSE;
  if Owner = NIL then
    EXIT;

  with Owner do
  try
    hMsg:= NIL;
    if SetActive then
       hMsg:= hPleaseWait( IQMS.Common.ResStrings.cTXT0000136 ); // 'Accessing database.  Please wait...'

    for i:= 0 to ComponentCount-1 do
    begin
      Compo:= Components[ I ];
      if (Compo is TFDTable) or (( Compo is TFDQuery ) and not ( Compo is TIQWebHpick )) then
      try
        if Assigned(hMsg) then
           hMsg.Mesg:= Format( IQMS.Common.ResStrings.cTXT0000137, [ Compo.Name ]); // 'Accessing database (%s) ...'
        case Compo.Tag of
          1: ; {Do Nothing}
        else
          begin
              // Byron: I didn't think it was necessary to internationalize these strings.
              //        Let's leave them to a user request...
              if Assigned(IQTiming) then
                 IQTiming.Start( Format( 'Open %s', [ Compo.Name ]));
            TDataSet(Compo).Active:= SetActive;
              if Assigned(IQTiming) then
                 IQTiming.Stop( Format( 'Open %s', [ Compo.Name ]));
          end;
        end;
      except
        on E:Exception do
          IQHandleDBEngineError( Compo as TDataSet, E );
      end;
    end;

    Result:= TRUE;
  finally
    if Assigned(hMsg) then
       FreeAndNil(hMsg);
  end; // With Owner
end;

function IQSetTablesActiveEx( const SetActive:Boolean; Owner:TComponent;
  AMessage: String; DB: string = cnstFDConnectionName ):Boolean;
var
   hMsg: TPanelMesg;
   ASavedPanelMesgVisible: Boolean;
begin
  hMsg := NIL; // initial
  try
    ASavedPanelMesgVisible := PanelMesgVisible;
    if SetActive then
      // message to display while setting tables active or inactive
      hMsg := hPleaseWait(AMessage);
    PanelMesgVisible := False;
    IQSetTablesActive(SetActive, Owner);
  finally
   if Assigned( hMsg ) then
     FreeAndNil(hMsg);
   PanelMesgVisible := ASavedPanelMesgVisible;
  end;
end;

{ Open tables based on ATags }
procedure IQOpenTables( Owner:TComponent; ATags: TTaggedDatasSet );
var
  I    : Integer;
  hMsg : TPanelMesg;
begin
  hMsg:= hPleaseWait( IQMS.Common.ResStrings.cTXT0000136 ); // 'Accessing database.  Please wait...'
  try
    for I:= 0 to Owner.ComponentCount - 1 do with Owner do
      if ((( Components[ I ] is TFDQuery) and not ( Components[ I ] is TIQWebHpick ))) then
         try
           if TDataSet(Components[ I ]).Tag in ATags then
              Reopen( TDataSet(Components[ I ]));
         except on E:Exception do
           {db_bm}
           IQHandleDBEngineError( TDataSet( Components[ I ]), E )
         end;
  finally
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
  end;
end;

procedure IQParseDBEngineError( DataSet: TDataSet; E: Exception;
  var Msg: string; var ANativeError: Integer; var AIsFatalError: Boolean );
var
  TableName       : string;
  I               : Integer;
  AChildTableName : string;
  AParentTableName: string;
  AErrorMsg       : string;

  function _FormatUserDefinedErrorMessage( Msg: string; ANativeError: Integer ): string;
  var
    I: Integer;
    AErrorCode: string;
  begin
    Result:= Msg;
    AErrorCode:= Format('ORA-%d:', [ ANativeError ]);
    I:= Pos(AErrorCode, Msg);
    if I > 0 then
      Result:= Copy(Msg, I + Length(AErrorCode), 255 );
  end;


begin
  TableName:= '';
  AErrorMsg:= '';
  AIsFatalError:= FALSE;

  // Get the table name, if available
  if Assigned(DataSet) then
    begin
      if (DataSet is TFDTable) then
        TableName:= TFDTable(DataSet).TableName
      else if (DataSet is TSQLTable) then
        TableName:= TSQLTable(DataSet).TableName
      else if (DataSet is TFDTable) then
        TableName:= TFDTable(DataSet).TableName
      else if (DataSet is TFDQuery) then
        TableName:= TFDQuery(DataSet).UpdateOptions.UpdateTableName
      else
        TableName:='';
    end;

  // Get the Oracle native error, if available
  if E is EIQMSDBEngineError then with E as EIQMSDBEngineError do
     ANativeError := NativeError
  else if E is EOCINativeException then with E as EOCINativeException do
     ANativeError := EOCINativeException(E).ErrorCode
  else
     ANativeError:= 0;

  if (E is EIQMSDBEngineError) or (E is EOCINativeException) then
    with E do
      begin
      {Check for available index EIQ-12819}
      with E as EOCINativeException do
      begin
       if ErrorCount = 1 then
         AErrorMsg := Errors[0].Message
       else if ErrorCount > 1 then
         AErrorMsg := Errors[1].Message
      end;

       if E is EOCINativeException then with E as EOCINativeException do
           for I:= 0 to ErrorCount - 1 do Msg:= Msg + Errors[ I ].Message + #13
        else
           Msg:= _FormatUserDefinedErrorMessage(E.Message, ANativeError);

        case ANativeError of
           942: Msg:= Msg + #13+ IQMS.Common.ResStrings.cTXT0000033 { 'Table/View - Access Denied.' };

          1031: Msg:= Msg + #13+ IQMS.Common.ResStrings.cTXT0000034 { 'Table/View - Insufficient Rights.' };

          {Master record missing}
          {Byron:  Do not localize; we need it for troubleshooting.}
          2291: if (E is EFDDBEngineException) then
                   if GetConstraintTableNames( AErrorMsg, AParentTableName, AChildTableName ) then
                      Msg:= Format('%s'#13'Master table: %s'#13'Child table: %s', [ Msg, AParentTableName, AChildTableName ]);

          {Master record has details}
          {Byron:  Do not localize; we need it for troubleshooting.}
          2292: if (E is EFDDBEngineException) then
                 if GetConstraintTableNames( AErrorMsg, AParentTableName, AChildTableName ) then
                   begin
                      Msg:= Format('%s'#13'Master table: %s'#13'Child table: %s', [ Msg, AParentTableName, AChildTableName ]);
                      CheckAddMoreInfoOnMasterHasDetailRecods( Msg, AParentTableName, AChildTableName );
                   end;

             1: Msg:= Msg + #13+ IQMS.Common.ResStrings.cTXT0000037; // 'Table/View - Duplicated Key - Reenter Unique Key.'

          1502: Msg:= Msg + #13 + IQMS.Common.ResStrings.cTXT0000339; //  'System is currently busy compressing a table and rebuilding associated indexes. Please wait and try again later.';

          {EOF on communication channel, not connected to oracle}
          3113, 3114:
                begin
                  AIsFatalError:= TRUE;
                  Msg:= Msg + #13+ IQMS.Common.ResStrings.cTXT0000409; // 'Unable to continue running application - correct the problem and try again.'
                end;
        end;

        // 11/13/2015 (Byron, EIQ-9440)
        if (CompareText(Trim(Msg), 'Translate Error. Value out of bounds.') = 0) or
          (CompareText(Trim(Msg), 'ORA-01438: value larger than specified precision allowed for this column') = 0) then
          // IQMS.Common.ResStrings.cTXT0000536 =
          // 'Sorry, that number cannot fit in the field.  Please enter a number within the acceptable range.';
          Msg := IQMS.Common.ResStrings.cTXT0000536;

        // 08/20/2015 EIQ-7636
        if Trim(Msg) = '' then
          Msg := FixFireDACErrorMessage(E.Message);

      end

  else if (ANativeError = 1438) then
    // '[FireDAC][Phys][Ora] ORA-01438: value larger than specified precision allowed for this column'
    // IQMS.Common.ResStrings.cTXT0000536 =
    // 'Sorry, that number cannot fit in the field.  Please enter a number within the acceptable range.';
    Msg := IQMS.Common.ResStrings.cTXT0000536

  else
    Msg:= _FormatUserDefinedErrorMessage(E.Message, ANativeError);

  if TableName <> '' then
     Msg:= Msg + Format( ' (%s)', [TableName] );

  if Assigned(DataSet) and (DataSet.Name <> '') then
     Msg:= Msg + Format( ' (Component Name: %s)', [ DataSet.Name ]); // Do not localize

  if AIsFatalError and (SecurityManager <> nil) then
     SecurityManager.WriteFailedProcessToNetworkFailureLog;
end;

function IQPickAndReplace(TargetField: TField; Pk: TIQWebHpick; const PkField: string ): Boolean;
var
  ASaveState: TDataSetState;
  ADataSet: TDataSet;
begin
  ADataSet := TargetField.DataSet;

  with Pk do
    begin
      Result := Execute;
      if Result then
      begin
        ASaveState := ADataSet.State;
        try
          if ASaveState = dsInactive then
             // 'The table, %s, is inactive.'
             raise Exception.Create(
               Format( IQMS.Common.ResStrings.cTXT0000138, [ADataSet.Name] ))
          else
            if ASaveState = dsBrowse then
              begin
               if ADataSet.Eof and ADataSet.Bof then
                 begin
                   ADataSet.Insert;
                   ASaveState := dsInsert;
                 end
               else ADataSet.Edit;
            end // was in browse
            else
              if not (ASaveState in [dsInsert, dsEdit]) then
                 // 'The table, %s, is unavailable'
                 raise Exception.Create(
                   Format( IQMS.Common.ResStrings.cTXT0000139, [ADataSet.Name] ));

          TargetField.Value := GetValue( PkField );

        finally
          if (ASaveState = dsBrowse) and
           (ADataSet.State in [dsEdit, dsInsert]) then
           ADataSet.Post;
        end;
      end;
  end; // with Pk
end;

procedure IQAssignNativeCurrencyFilter( DataSet: TDataSet );
var
  AFilter:String;
  ACurrId:Real;
  ANativeCurr: string;
begin
  if DataSet.FindField('NATIVE_CURR') = nil then EXIT;

  {try eplant level first}
  ANativeCurr:= GetNativeCurrencyFilter(0);

  {check and drop back to iqsys}
  if ANativeCurr = '' then
  begin
    ACurrId    := SelectValue('select currency_id from iqsys where rownum < 2');
    ANativeCurr:= SelectValueFmtAsString('select native_curr from currency where id = %f', [ACurrId]);
  end;

  if ANativeCurr = '' then EXIT;

  if DataSet.Filter = '' then
    DataSet.Filter:= Format('NATIVE_CURR=NULL or NATIVE_CURR=''%s''', [ ANativeCurr ])
  else
    DataSet.Filter:= Format('(%s) and (NATIVE_CURR=NULL or NATIVE_CURR=''%s'')', [ DataSet.Filter, ANativeCurr ]);
end;


procedure IQCheckRefresh(Sender: TObject; Button: TNavigateBtn);
var
  ADataSet: TDataSet;
begin
  { This method is used to evaluate TDBNavigator BeforeAction
    to refresh a query dataset. }

  // Ensure sender is provided and is the correct class
  if not Assigned(Sender) or not (Sender is TDBNavigator) then
    Exit;
  // Ensure we have a dataset object
  if not Assigned(TDBNavigator(Sender).DataSource) or
    not Assigned(TDBNavigator(Sender).DataSource.DataSet) then
    Exit;
  // Get the dataset object reference for convenience
  ADataSet := TDBNavigator(Sender).DataSource.DataSet;
  // Refresh the query dataset
  if Button = nbRefresh then
    begin
//      if ADataSet is TIQWebDbxQuery then
//        begin
//          TIQWebDbxQuery(ADataSet).Refresh;
//          System.SysUtils.Abort;
//        end
      if ADataSet is TFDQuery then
        begin
          RefreshDataSetByID(ADataSet as TFDQuery);
          System.SysUtils.Abort;
        end
      else
        begin
          ADataSet.Refresh;
          System.SysUtils.Abort;
        end;
    end;
  // Dereference; prevents memory leak.
  ADataSet := nil;
end;

procedure IQApplyUpdateToTable(DataSet: TDataSet; DB: string = cnstFDConnectionName);
begin
  {Used in AfterPost and AfterDelete in CachedUpdates Queries}
  if DataSet is TFDQuery then
     try
       (DataSet as TFDQuery).ApplyUpdates;
       (DataSet as TFDQuery).Connection.ApplyUpdates([ TFDQuery( DataSet )]);
     except on E: Exception do
       begin
         TFDQuery(DataSet).CancelUpdates;
         IQError( E.Message );
         ABORT;
       end;
     end

  else
    raise EIQMSInvalidDatasetType.Create(INVALID_DATASET_TYPE);
end;

procedure SendInsertViaNavigator( ADBNav: TUniDBNavigator; var Action: TModalResult; var ResultValue: Variant; SR: TIQWebSecurityRegister = nil );
var
  AHasAccess: Boolean;
begin
  AHasAccess:= not Assigned(SR) or (SR.Enabled[ ADBNav.Name ] and SR.Insert[ ADBNav.Name ]);
  if not ( ADBNav.Controls[Ord(nbInsert)].Enabled and AHasAccess ) then
  begin
    Action:= mrNone;
    EXIT;
  end;

  Action:= mrOK;
  ResultValue:= 0;
  ADBNav.DataSource.DataSet.Insert;
//  PostMessage( Application.MainForm.Handle, iq_InsertViaNavigator, LongInt( ADBNav ), 0);
end;

function LocateOrPickList( AOwner: TComponent; AID: Real; ADataSet: TDataSet; APk: TIQWebHpick ): Real;
var
  ANeedPickList : Boolean;
begin
  Result:= 0;

  ANeedPickList:= (AID = 0) or not ADataSet.Locate('ID', AID, []);
  if not ANeedPickList then
     EXIT (AID);

  with APk do
  begin
    if Execute then
    begin
       if not ADataSet.Active then
          begin
            ADataSet.Open;
          end;
       ADataSet.Locate('ID', GetValue('id'), []);
       EXIT ( GetValue( 'id' ));
    end;

    if AOwner is TForm then
       PostMessage( TForm(AOwner).Handle, WM_CLOSE, 0, 0);
    ABORT;
  end;
end;

function SetPageControlCaptions(APC:TUniPageControl):Boolean;
var
  I: integer;
begin
  Result := True;
  if Assigned(APC) then
     for I := 0 to APC.PageCount - 1 do with APC.Pages[ I ] do
     begin
       Caption := Trim(StrTran( Caption, '[+]', ''));
       if CheckTabSheetControlCaption( APC.Pages[ I ]) then
          Caption := Format('[+] %s', [Caption])
     end;
end;

function CheckTabSheetControlCaption(AControl:TWinControl):Boolean;
var
  i:integer;
  ATable :TFDTable;
  AField :String;
begin
  Result := False;
  if Acontrol = nil then Exit;
  if (AControl is TDBRichEdit) or (AControl is TDBMemo) then
  begin
    if (AControl is TDBMemo) and (TDBMemo(AControl).DataSource <> nil) and (TDBMemo(AControl).DataField <> '') then
    begin
      ATable := TFDTable(TDBMemo(AControl).DataSource.DataSet);
      AField := TDBMemo(AControl).DataField;
    end
    else if (AControl is TDBRichEdit) and (TDBRichEdit(AControl).DataSource <> nil) and (TDBRichEdit(AControl).DataField <> '') then
    begin
      ATable := TFDTable(TDBRichEdit(AControl).DataSource.DataSet);
      AField := TDBRichEdit(AControl).DataField;
    end
    else
      Exit;

    if ATable.FieldByname(AField).AsString <> '' then
    begin
      Result := True;
      Exit;
    end;
  end;

  for i := 0 to AControl.ControlCount - 1 do
    if (AControl.Controls[i] is TWinControl) and CheckTabSheetControlCaption(TWinControl(AControl.Controls[i])) then
    begin
      Result := True;
      Exit;
    end;
end;

// -----------------------------------------------------------------------------
// ** Begin Force Value methods **
// -----------------------------------------------------------------------------


procedure ForceValue(ADataSource: TDataSource; AField: TField;
  AValue: Variant; AFieldType: TFieldType; ASR: TIQWebSecurityRegister = nil);
var
  AReadOnly: Boolean;
  ADataSourceChange: TDataChangeEvent;
  ADataSourceUpdateData: TNotifyEvent;
  AFieldChange:  TFieldNotifyEvent;
begin
  if Assigned(AField) then
  try
     AReadOnly := AField.ReadOnly;
     AFieldChange := AField.OnChange;

     if Assigned(ADataSource) then
        begin
          ADataSourceChange := ADataSource.OnDataChange;
          ADataSource.OnDataChange := NIL;
          ADataSourceUpdateData := ADataSource.OnUpdateData;
          ADataSource.OnUpdateData := NIL;
        end;
     AField.OnChange := NIL;

     // If it is allowed, make the field read write
     if not Assigned(ASR) or ASR.ReadWrite[AField.Name] then
       AField.ReadOnly := FALSE;

     if VarIsNull( AValue ) then
        AField.Clear
     else
       case AFieldType of
          ftString, ftMemo, ftFixedChar, ftWideString:
            AField.AsString := AValue;
          ftSmallint, ftInteger, ftWord, ftBytes, ftVarBytes, ftLargeint:
            AField.AsInteger := AValue;
          ftBoolean:
            AField.AsBoolean := AValue;
          ftFloat, ftCurrency, ftAutoInc:
            AField.AsFloat := AValue;
          ftDate, ftTime, ftDateTime, ftTimeStamp:
            begin
              if Trunc(AValue) > 1 then
                 AField.AsDateTime := AValue
              else AField.Clear;
            end;
          ftVariant:
            AField.AsVariant := AValue;
       end; // end case

  finally
     AField.ReadOnly := AReadOnly;

     if Assigned(ADataSource) then
        begin
          ADataSource.OnDataChange := ADataSourceChange;
          ADataSource.OnUpdateData := ADataSourceUpdateData;
        end;
     AField.OnChange := AFieldChange;
  end;
end;

procedure ForceValue(ADataSource: TDataSource; AField: TField; AValue: Real; ASR: TIQWebSecurityRegister = nil);
begin
  ForceValue(ADataSource, AField, AValue, ftFloat, ASR);
end;

procedure ForceValue(ADataSource: TDataSource; AField: TField; AValue: Integer; ASR: TIQWebSecurityRegister = nil);
begin
  ForceValue(ADataSource, AField, AValue, ftInteger, ASR);
end;

procedure ForceValue(ADataSource: TDataSource; AField: TField; AValue: String; ASR: TIQWebSecurityRegister = nil);
begin
  ForceValue(ADataSource, AField, AValue, ftString, ASR);
end;

procedure ForceClear(ADataSource: TDataSource; AField: TField; ASR: TIQWebSecurityRegister = nil);
var
  AReadOnly: Boolean;
  ADataSourceChange: TDataChangeEvent;
  ADataSourceUpdateData: TNotifyEvent;
  AFieldChange:  TFieldNotifyEvent;
begin
  if Assigned(AField) then
  try
     AReadOnly := AField.ReadOnly;
     AFieldChange := AField.OnChange;

     if Assigned(ADataSource) then
        begin
          ADataSourceChange := ADataSource.OnDataChange;
          ADataSource.OnDataChange := NIL;
          ADataSourceUpdateData := ADataSource.OnUpdateData;
          ADataSource.OnUpdateData := NIL;
        end;
     AField.OnChange := NIL;

     // If it is allowed, make the field read write
     if not Assigned(ASR) or ASR.ReadWrite[AField.Name] then
       AField.ReadOnly := FALSE;

     AField.Clear;

  finally
     AField.ReadOnly := AReadOnly;

     if Assigned(ADataSource) then
        begin
          ADataSource.OnDataChange := ADataSourceChange;
          ADataSource.OnUpdateData := ADataSourceUpdateData;
        end;
     AField.OnChange := AFieldChange;
  end;
end;

// -----------------------------------------------------------------------------
// ** End Force Value methods **
// -----------------------------------------------------------------------------
procedure AssignQueryParamValue(DataSet: TDataSet; ParamName: string;
  Value: Variant; ParamDataType: TFieldType = ftUnknown);
var
  AParam: TParam;
  AFDParam: TFDParam;
  i: Integer;
begin
  if Assigned(DataSet) then
    try
      if (DataSet is TFDQuery) then
        begin
          // 11/19/2015 Check FDQuery for duplicate parameters.
          // Note:  This may be removed at a later date, as it may
          // become unnecessary.
          // CheckQueryHasDuplicateParams(TFDQuery(DataSet));
          // AFDParam := TFDQuery(DataSet).Params.FindParam(ParamName);

          for I:= 0 to TFDQuery(DataSet).Params.Count - 1 do
            begin
              AFDParam:= nil;
              if CompareText( TFDQuery(DataSet).Params[I].Name, ParamName ) = 0  then
                 AFDParam:= TFDQuery(DataSet).Params[ I ];

              if AFDParam <> nil then
                begin
                  if ParamDataType <> ftUnknown then
                    AFDParam.DataType := ParamDataType;
                  (*
                  if AFDParam.DataType = ftUnknown then
                    AFDParam.DataType := VarType2FieldType(Value);
                  *)
                  if AFDParam.ParamType = ptUnknown then
                    AFDParam.ParamType:= ptInput;

                  if not System.Variants.VarIsNull(Value) and
                    not System.Variants.VarIsClear(Value) then
                    case AFDParam.DataType of
                      ftString, ftFixedChar, ftWideString, ftFixedWideChar,
                        ftWideMemo:
                        AFDParam.AsString := System.Variants.VarToStr(Value);
                      ftOraClob:
                        AParam.Value := Value;
                      ftSmallint, ftInteger, ftWord:
                        AFDParam.AsInteger := System.Variants.VarAsType(Value,
                          varInteger);
                      ftFloat, ftCurrency, TFieldType.ftExtended:
                        AFDParam.AsFloat := System.Variants.VarAsType(Value,
                          varDouble);
                      ftBCD:
                        AFDParam.AsBCD := System.Variants.VarAsType(Value, varInt64);
                      ftDate, ftTime, ftDateTime, ftTimeStamp:
                        AFDParam.AsDateTime := System.Variants.VarAsType
                          (Value, varDate);
                      ftLargeint:
                        AFDParam.AsLargeInt := System.Variants.VarAsType(Value,
                          varInt64);
                      ftFMTBcd:
                        AFDParam.AsFloat := System.Variants.VarAsType(Value,
                          varDouble);
                      ftLongWord:
                        AFDParam.AsLongWord := System.Variants.VarAsType(Value,
                          varLongWord);
                      ftShortint:
                        AFDParam.AsShortInt := System.Variants.VarAsType(Value,
                          varShortInt);
                      TFieldType.ftSingle:
                        AFDParam.AsSingle := System.Variants.VarAsType(Value,
                          varSingle);
                    end
                  else
                    AFDParam.Clear;
                end;
            end;
        end
      else if (DataSet is TIQWebDbxQuery) then
        begin
          AParam := TIQWebDbxQuery(DataSet).Params.FindParam(ParamName);
          if AParam <> nil then
            begin
              if ParamDataType <> ftUnknown then
                AParam.DataType := ParamDataType;
              (*
              if AParam.DataType = ftUnknown then
                AParam.DataType := VarType2FieldType(Value);
              *)
              if AParam.ParamType = ptUnknown then
                AParam.ParamType:= ptInput;

              if not System.Variants.VarIsNull(Value) and
                not System.Variants.VarIsClear(Value) then
                case AParam.DataType of
                  ftString, ftFixedChar, ftWideString, ftFixedWideChar,
                    ftWideMemo:
                    AParam.AsString := System.Variants.VarToStr(Value);
                  ftOraClob:
                    AParam.Value := Value;
                  ftSmallint, ftInteger, ftWord:
                    AParam.AsInteger := System.Variants.VarAsType(Value,
                      varInteger);
                  ftFloat, TFieldType.ftExtended:
                    AParam.AsFloat := System.Variants.VarAsType(Value, varDouble);
                  ftCurrency:
                    AParam.AsFloat := System.Variants.VarAsType(Value,
                      varCurrency);
                  ftBCD:
                    AParam.AsBCD := System.Variants.VarAsType(Value, varInt64);
                  ftDate, ftTime, ftDateTime, ftTimeStamp:
                    AParam.AsDateTime := System.Variants.VarAsType(Value,
                      varDate);
                  ftLargeint:
                    AParam.AsLargeInt := System.Variants.VarAsType(Value,
                      varInt64);
                  ftFMTBcd:
                    AParam.AsFloat := System.Variants.VarAsType(Value, varDouble);
                  ftLongWord:
                    AParam.AsLongWord := System.Variants.VarAsType(Value,
                      varLongWord);
                  ftShortint:
                    AParam.AsShortInt := System.Variants.VarAsType(Value,
                      varShortInt);
                  TFieldType.ftSingle:
                    AParam.AsSingle := System.Variants.VarAsType(Value,
                      varSingle);
                end
              else
                AParam.Clear;
            end;
        end
      else if (DataSet is TSQLQuery) then
        begin
          AParam := TSQLQuery(DataSet).Params.FindParam(ParamName);
          if AParam <> nil then
            begin
              if ParamDataType <> ftUnknown then
                AParam.DataType := ParamDataType;
              (*
              if AParam.DataType = ftUnknown then
                AParam.DataType := VarType2FieldType(Value);
              *)
              if AParam.ParamType = ptUnknown then
                AParam.ParamType:= ptInput;

              if not System.Variants.VarIsNull(Value) and
                not System.Variants.VarIsClear(Value) then
                case AParam.DataType of
                  ftString, ftFixedChar, ftWideString, ftFixedWideChar,
                    ftWideMemo:
                    AParam.AsString := System.Variants.VarToStr(Value);
                  ftSmallint, ftInteger, ftWord:
                    AParam.AsInteger := System.Variants.VarAsType(Value,
                      varInteger);
                  ftFloat, TFieldType.ftExtended:
                    AParam.AsFloat := System.Variants.VarAsType(Value, varDouble);
                  ftCurrency:
                    AParam.AsFloat := System.Variants.VarAsType(Value,
                      varCurrency);
                  ftBCD:
                    AParam.AsBCD := System.Variants.VarAsType(Value, varInt64);
                  ftDate, ftTime, ftDateTime, ftTimeStamp:
                    AParam.AsDateTime := System.Variants.VarAsType(Value,
                      varDate);
                  ftLargeint:
                    AParam.AsLargeInt := System.Variants.VarAsType(Value,
                      varInt64);
                  ftFMTBcd:
                    AParam.AsFloat := System.Variants.VarAsType(Value, varDouble);
                  ftLongWord:
                    AParam.AsLongWord := System.Variants.VarAsType(Value,
                      varLongWord);
                  ftShortint:
                    AParam.AsShortInt := System.Variants.VarAsType(Value,
                      varShortInt);
                  TFieldType.ftSingle:
                    AParam.AsSingle := System.Variants.VarAsType(Value,
                      varSingle);
                end
              else
                AParam.Clear;
            end;
{$IFDEF DEBUG}
        end
      else
        raise Exception.Create('AssignQueryParamValue called with dataset of class: ' + DataSet.ClassName);
{$ELSE}
        end;
{$ENDIF}
    except
      on E: Exception do
        raise Exception.CreateFmt('%s'#13'[DataSet Name = %s, Param Name = %s]',
          [E.Message, DataSet.Name, ParamName]);
    end;
end;

function ParamExists(DataSet: TDataSet; ParamName: string): Boolean;
begin
  if Assigned(DataSet) then
    try
      if (DataSet is TFDQuery) then
        Result := TFDQuery(DataSet).Params.FindParam(ParamName) <> nil
      else if (DataSet is TIQWebDbxQuery) then
        Result := TIQWebDbxQuery(DataSet).Params.FindParam(ParamName) <> nil
      else if (DataSet is TSQLQuery) then
        Result := TSQLQuery(DataSet).Params.FindParam(ParamName) <> nil
      else
        Result := False;
    except
      on E: Exception do
        raise Exception.CreateFmt('%s'#13'[DataSet Name = %s, Param Name = %s]',
          [E.Message, DataSet.Name, ParamName]);
    end;

end;

procedure ClearQueryParamValue(DataSet: TDataSet; ParamName: string);
begin
  AssignQueryParamValue(DataSet, ParamName, Unassigned);
end;


procedure CopyParams(ASource: TFDStoredProc; var ATarget: TFDStoredProc);
begin
  if not ATarget.Prepared and (ATarget.Params.Count = 0) then
    ATarget.Prepare;
  ATarget.Params.Assign(ASource.Params);
end;

function GetSwitch( AColumnName, ATableName: string; ADefault: string = 'N'; DB: string = cnstFDConnectionName ): string;
begin
  Result:= SelectValueFmt('select switches.get_value(''%s'', ''%s'', ''%s'') from dual',
                        [ AColumnName, 
                          ATableName,
                          ADefault ] );
end;

procedure SetSwitch( AColumnName, ATableName, AYNColumnValue : string; AID : Real = 0 );
begin
  ExecuteCommandFmt('begin '+
                    '  switches.set_value(''%s'', ''%s'', ''%s'', %s ); '+
                    'end;  ',
                    [ AColumnName,
                      ATableName,
                      AYNColumnValue,
                      IfThen(AID = 0, 'null', FloatToStr(AID)) ])

end;

function CheckLoggedintoNonIQMSSchema : Boolean;
begin
  Result:= FALSE;
  try
    //user is in non IQMS schema if null is returned
    Result:= SelectValueAsString(
      'SELECT ''IQMSSCHEMA'' FROM s_user_general') <> 'IQMSSCHEMA';
  except
    Result:= TRUE;
  end;
  IsNonIQMSSchema:= Result;
end;

{$REGION 'FireDAC Oracle database methods'}

procedure ExecuteCommand(const ASQL: string;
  const AConnectionName: string; const ATransaction: TFDTransaction);
var
  AConnection: TFDConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName) as TFDConnection;
  ExecuteCommand(ASQL, AConnection, ATransaction);
end;

procedure ExecuteCommand(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil);
begin
  if Assigned(AConnection) and AConnection.Connected then
    with TFDCommand.Create(nil) do
    try
      Connection := AConnection;
      // 02-09-2016 EIQ-10569. Prevent macro such as ! from kicking in
      // begin my_pkg.my_proc( 'SomeValueWith!' ) end;
      ResourceOptions.EscapeExpand:= FALSE;
      ResourceOptions.MacroCreate:= FALSE;
      ResourceOptions.MacroExpand:= FALSE;
      ResourceOptions.ParamCreate := FALSE;
      ResourceOptions.ParamExpand := FALSE;
      if Assigned(ATransaction) then
        Transaction := ATransaction;
      try
        CommandText.Text := StrUtils.ReplaceStr( ASQL, '::=', ':=' );
      except
        // Ignore the exception
      end;
      Execute;
    finally
      Free;
    end;
end;

procedure ExecuteCommandFmt(const ASQL: string; const Args : array of const;
  const AConnectionName: string; const ATransaction: TFDTransaction);
begin
  ExecuteCommand(IQFormat(ASQL, Args), AConnectionName, ATransaction);
end;

procedure ExecuteCommandFmt(const ASQL: string; const Args : array of const; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil);
begin
  ExecuteCommand(IQFormat(ASQL, Args), AConnection, ATransaction);
end;

procedure ExecuteCommandParam(const ASQL: string; const ParamsList: array of string;
 const ParamValues: array of Variant; AConnectionName: string;
 const ATransaction: TFDTransaction);
var
  AConnection: TFDConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName) as TFDConnection;
  ExecuteCommandParam(ASQL, ParamsList, ParamValues, AConnection, ATransaction);
end;


procedure ExecuteCommandParam(const ASQL: string; const ParamsList: array of string;
 const ParamValues: array of Variant; const AConnection: TFDConnection;  const ATransaction: TFDTransaction = nil);
var
   i: Integer;
   AParamName: String;
   AParamTypeStr: String;
   ADataType: TFieldType;
   AParamValue: Variant;
begin
  if High(ParamsList) <> High(ParamValues) then
     raise Exception.Create('Application Error: Params and Values do not match.');

  if Assigned(AConnection) and AConnection.Connected then
  begin
    with TFDQuery.Create(NIL) do
      try
         //AParams := TFDParams.Create;
         Connection := AConnection;
         if Assigned(ATransaction) then
           Transaction := ATransaction;
         SQL.Add(ASQL);

         for i := 0 to High(ParamsList) do
           begin
             // Parse the param text (in the array of param names)
             GetParamAndTypeFromStrConst(
               ParamsList[i],
               {var} AParamName,
               {var} AParamTypeStr,
               {var} ADataType);
             // Get the param value
             AParamValue:= ParamValues[ i ];
             ParamByName(AParamName).DataType := ADataType;
             ParamByName(AParamName).ParamType := ptInput;

             // For date/time params, check for NULL
             if IsDateTimeFieldType(ADataType) then
               begin
                 if not VarIsNull(AParamValue) and ParamValues[ i ] = 0 then
                    AParamValue:= NULL;
               end
             // For string fields, check the param size.  This avoids an
             // error if the size is too small for the string (such as
             // CLOB data).
             else if IsStringFieldType(ADataType) then
               ParamByName(AParamName).Size := Math.Max(
                 ParamByName(AParamName).Size,
                 Length(System.Variants.VarToStr(
                   Nz(AParamValue, ParamByName(AParamName).Size))));
             // Now, assign the value
             ParamByName(AParamName).Value := AParamValue;
           end;
         ExecSQL;
      finally
         Free;
      end;
  end;
end;

procedure ExecuteCommandParamDataSet(const ASQL: string;
  const ADataSet: TDataSet; AConnectionName: string = cnstFDConnectionName;
  const ATransaction: TFDTransaction = nil);
var
   AConnection: TFDConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName) as TFDConnection;;
  ExecuteCommandParamDataSet(ASQL, ADataSet, AConnection, ATransaction);
end;

procedure ExecuteCommandParamDataSet(const ASQL: string; const ADataSet: TDataSet; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil);
var
   i: Integer;
   AOld: Boolean;
   ANew: Boolean;
   AParam: TFDParam;
   APName: String;
   AField: TField;
   AValue: Variant;
begin
  if not Assigned(ADataSet) then
    Exit;

  if Assigned(AConnection) and AConnection.Connected then
    with TFDQuery.Create(NIL) do
    try
      Connection := AConnection;
      if Assigned(ATransaction) then
        Transaction := ATransaction;
      SQL.Add(ASQL);
      for i := 0 to Params.Count - 1 do
        begin
          AParam := Params[i];
          APName := AParam.Name;

          AOld := CompareText(Copy( APName, 1, 4), 'OLD_') = 0;
          ANew := CompareText(Copy( APName, 1, 4), 'NEW_') = 0;

          if AOld then
            System.Delete(APName, 1, 4)
          else if ANew then
            System.Delete(APName, 1, 4);

          AField:= ADataSet.FindField(APName);
          if Assigned(AField) then
            begin
              if AParam.DataType = ftUnknown then
                 AParam.DataType:= AField.DataType;

              if AOld then
                AParam.AssignFieldValue(AField, AField.OldValue)
              else
                AParam.AssignFieldValue(AField, AField.Value);
             end;
        end;

        ExecSQL;
    finally
       Free;
    end;
end;


function SelectValue(const ASQL: string; const AConnectionName: string;
  const ATransaction: TFDTransaction): Variant;
var
  AConnection: TFDConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName) as TFDConnection;
  Result:= SelectValue( ASQL, AConnection, ATransaction );
end;

function SelectValue(const ASQL: string; const AConnection: TFDConnection;
  const ATransaction: TFDTransaction = nil): Variant;
begin
  if Assigned(AConnection) and AConnection.Connected then
    try
      with TFDQuery.Create(nil) do
      try
        Connection := AConnection;
        if Assigned(ATransaction) then
          Transaction := ATransaction;
        SQL.Text := ASQL;
        Open;
        Result := Fields[0].AsVariant;
      finally
        Free;
      end;
  except on E: Exception do
     RaiseGetValStandardException( E, ASQL, AConnection.Name );
  end;
end;

function SelectValueAsFloat(const ASQL: string; const AConnectionName: string;
  const ATransaction: TFDTransaction): Real;
var
  AConnection: TFDConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName) as TFDConnection;
  Result:= SelectValueAsFloat( ASQL, AConnection, ATransaction );
end;

function SelectValueAsFloat(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Real;
begin
  Result:= 0;
  if Assigned(AConnection) and AConnection.Connected then
    try
      with TFDQuery.Create(nil) do
      try
        Connection := AConnection;
        if Assigned(ATransaction) then
          Transaction := ATransaction;
        SQL.Text := ASQL;
        Open;
        Result := Fields[0].AsFloat;
      finally
        Free;
      end;
  except on E: Exception do
     RaiseGetValStandardException( E, ASQL, AConnection.Name );
  end;
end;

function SelectValueAsInt64(const ASQL: string; const AConnectionName: string;
  const ATransaction: TFDTransaction): Int64;
var
  AConnection: TFDConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName) as TFDConnection;
  Result:= SelectValueAsInt64(ASQL, AConnection, ATransaction);
end;

function SelectValueAsInt64(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Int64;
begin
  Result:= 0;
  if Assigned(AConnection) and AConnection.Connected then
    try
      with TFDQuery.Create(nil) do
      try
        Connection := AConnection;
        if Assigned(ATransaction) then
          Transaction := ATransaction;
        SQL.Text := ASQL;
        Open;
        Result := Fields[0].AsLargeInt;
      finally
        Free;
      end;
  except on E: Exception do
     RaiseGetValStandardException( E, ASQL, AConnection.Name );
  end;
end;


function SelectValueAsInteger(const ASQL: string; const AConnectionName: string;
  const ATransaction: TFDTransaction): Int32;
var
  AConnection: TFDConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName) as TFDConnection;
  Result:= SelectValueAsInteger(ASQL, AConnection, ATransaction);
end;


function SelectValueAsInteger(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Int32;
begin
  Result:= 0;
  if Assigned(AConnection) and AConnection.Connected then
    try
      with TFDQuery.Create(nil) do
      try
        Connection := AConnection;
        if Assigned(ATransaction) then
          Transaction := ATransaction;
        SQL.Text := ASQL;
        Open;
        Result := Fields[0].AsLargeInt;
      finally
        Free;
      end;
  except on E: Exception do
     RaiseGetValStandardException( E, ASQL, AConnection.Name );
  end;
end;

function SelectValueAsDateTime(const ASQL: string;
  const AConnectionName: string; const ATransaction: TFDTransaction): TDateTime;
var
  AConnection: TFDConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName) as TFDConnection;
  Result:= SelectValueAsDateTime(ASQL, AConnection, ATransaction);
end;

function SelectValueAsDateTime(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): TDateTime;
begin
  Result:= 0;
  if Assigned(AConnection) and AConnection.Connected then
    try
      with TFDQuery.Create(nil) do
      try
        Connection := AConnection;
        if Assigned(ATransaction) then
          Transaction := ATransaction;
        SQL.Text := ASQL;
        Open;
        Result := Fields[0].AsDateTime;
      finally
        Free;
      end;
  except on E: Exception do
     RaiseGetValStandardException( E, ASQL, AConnection.Name );
  end;
end;

function SelectValueAsString(const ASQL: string; const AConnectionName: string;
  const ATransaction: TFDTransaction): string;
var
  AConnection: TFDConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName) as TFDConnection;
  Result:= SelectValueAsString(ASQL, AConnection, ATransaction);
end;


function SelectValueAsString(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): string;
begin
  Result:= '';
  if Assigned(AConnection) and AConnection.Connected then
    try
      with TFDQuery.Create(nil) do
      try
        Connection := AConnection;
        if Assigned(ATransaction) then
          Transaction := ATransaction;
        SQL.Text := ASQL;
        Open;
        Result := Fields[0].AsString;
      finally
        Free;
      end;
  except on E: Exception do
     RaiseGetValStandardException( E, ASQL, AConnection.Name );
  end;
end;

function SelectValueArray(const ASQL: string; const AConnectionName: string;
  const ATransaction: TFDTransaction): Variant;
var
  AConnection: TFDConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName) as TFDConnection;
  Result:= SelectValueArray(ASQL, AConnection, ATransaction);
end;


function SelectValueArray(const ASQL: string; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Variant;
var
  I: Integer;
begin
  if Assigned(AConnection) and AConnection.Connected then
    try
      with TFDQuery.Create(nil) do
        try
          Connection := AConnection;
          if Assigned(ATransaction) then
            Transaction := ATransaction;
          SQL.Text := ASQL;
          Open;
          if not Eof then
            begin
              Result:= VarArrayCreate( [0, FieldCount - 1], varVariant);
              for I:= 0 to FieldCount - 1 do
                // Note:  In future, BCD and FMTBcd may need to be isolated.
                // Float
                 if Fields[ I ].DataType in [ftFloat, ftCurrency, ftBCD,
                   ftFMTBcd, TFieldType.ftExtended] then
                   Result[ I ]:= Fields[ I ].AsFloat
                 // Int32
                 else if Fields[ I ].DataType in [ftSmallint, ftInteger, ftWord,
                   ftAutoInc, ftLongWord, ftShortint, ftByte, TFieldType.ftSingle] then
                   Result[ I ]:= Fields[ I ].AsInteger
                 // Int64
                 else if Fields[ I ].DataType in [ftLargeint] then
                   Result[ I ]:= Fields[ I ].AsLargeInt
                 // String
                 else if Fields[ I ].DataType in [ftString, ftMemo, ftFmtMemo,
                   ftFixedChar, ftWideString, ftFixedWideChar, ftWideMemo,
                   ftGuid] then
                   Result[ I ]:= Fields[ I ].AsString
                 // Date/Time
                 else if Fields[ I ].DataType in [ftDate, ftTime, ftDateTime,
                   ftTimeStamp, ftOraTimeStamp] then
                   Result[ I ]:= Fields[ I ].AsDateTime
                 else
                   Result[ I ]:= Fields[ I ].Value;
            end
          else
            Result:= varNull;
        finally
          Free;
        end;
  except on E: Exception do
     RaiseGetValStandardException( E, ASQL, AConnection.Name );
  end;
end;


function SelectValueFmt(const ASQL: string; const Args : array of const;
  const AConnectionName: string; const ATransaction: TFDTransaction): Variant;
begin
  Result := SelectValue(IQFormat(ASQL, Args), AConnectionName, ATransaction);
end;

function SelectValueFmt(const ASQL: string; const Args : array of const; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Variant;
begin
  Result := SelectValue(IQFormat(ASQL, Args), AConnection, ATransaction);
end;

function SelectValueFmtAsFloat(const ASQL: string; const Args : array of const;
  const AConnectionName: string; const ATransaction: TFDTransaction): Real;
begin
  Result := SelectValueAsFloat(IQFormat(ASQL, Args), AConnectionName,
    ATransaction);
end;

function SelectValueFmtAsFloat(const ASQL: string; const Args : array of const;
  const AConnection: TFDConnection; const ATransaction: TFDTransaction): Real;
begin
  Result := SelectValueAsFloat(IQFormat(ASQL, Args), AConnection,
    ATransaction);
end;

function SelectValueFmtAsInt64(const ASQL: string; const Args : array of const;
  const AConnectionName: string; const ATransaction: TFDTransaction): Int64;
begin
  Result := SelectValueAsInt64(IQFormat(ASQL, Args), AConnectionName,
    ATransaction);
end;

function SelectValueFmtAsInt64(const ASQL: string; const Args : array of const;
  const AConnection: TFDConnection; const ATransaction: TFDTransaction): Int64;
begin
  Result := SelectValueAsInt64(IQFormat(ASQL, Args), AConnection,
    ATransaction);
end;

function SelectValueFmtAsInteger(const ASQL: string; const Args : array of const;
  const AConnectionName: string; const ATransaction: TFDTransaction): Int32;
begin
  Result := SelectValueAsInteger(IQFormat(ASQL, Args), AConnectionName,
    ATransaction);
end;

function SelectValueFmtAsInteger(const ASQL: string; const Args : array of const;
  const AConnection: TFDConnection;  const ATransaction: TFDTransaction): Int32;
begin
  Result := SelectValueAsInteger(IQFormat(ASQL, Args), AConnection,
    ATransaction);
end;

function SelectValueFmtAsDateTime(const ASQL: string;
  const Args : array of const; const AConnectionName: string;
  const ATransaction: TFDTransaction): TDateTime;
begin
  Result := SelectValueAsDateTime(IQFormat(ASQL, Args), AConnectionName,
    ATransaction);
end;

function SelectValueFmtAsDateTime(const ASQL: string;
  const Args : array of const; const AConnection: TFDConnection;
  const ATransaction: TFDTransaction): TDateTime;
begin
  Result := SelectValueAsDateTime(IQFormat(ASQL, Args), AConnection,
    ATransaction);
end;

function SelectValueFmtAsString(const ASQL: string;
  const Args : array of const; const AConnectionName: string;
  const ATransaction: TFDTransaction): string;
begin
  Result := SelectValueAsString(IQFormat(ASQL, Args), AConnectionName,
    ATransaction);
end;

function SelectValueFmtAsString(const ASQL: string;
  const Args : array of const; const AConnection: TFDConnection;
  const ATransaction: TFDTransaction): string;
begin
  Result := SelectValueAsString(IQFormat(ASQL, Args), AConnection,
    ATransaction);
end;

function SelectValueArrayFmt(const ASQL: string; const Args : array of const;
  const AConnectionName: string; const ATransaction: TFDTransaction): Variant;
begin
  Result := SelectValueArray(IQFormat(ASQL, Args), AConnectionName,
    ATransaction);
end;

function SelectValueArrayFmt(const ASQL: string; const Args : array of const;
  const AConnection: TFDConnection; const ATransaction: TFDTransaction): Variant;
begin
  Result := SelectValueArray(IQFormat(ASQL, Args), AConnection,
    ATransaction);
end;

function SelectValueParam(const ASQL: string; const AParamsList: array of string;
  const AParamValues: array of Variant; const AConnectionName: string = cnstFDConnectionName;
  const ATransaction: TFDTransaction = nil): Variant;
var
  AConnection: TFDCustomConnection;
  i: Integer;
  AParamName: String;
  AParamTypeStr: String;
  AParamType: TFieldType;
begin
  if High(AParamsList) <> High(AParamValues) then
     raise Exception.Create(
       'Application Error: Params and Values do not match.');
  AConnection := FDManager.FindConnection(AConnectionName);
  if Assigned(AConnection) and AConnection.Connected then
    try
      //oParams := TFDParams.Create;
      with TFDQuery.Create(nil) do
        try
          Connection := AConnection;
          if Assigned(ATransaction) then
            Transaction := ATransaction;
          SQL.Text := ASQL;
          for i := 0 to High(AParamsList) do
            begin
              // AParamName AParamType
              GetParamAndTypeFromStrConst(AParamsList[i],
                {var} AParamName,
                {var} AParamTypeStr,
                {var} AParamType);
              if Params.FindParam(AParamName) <> nil then
               begin
                 Params.FindParam(AParamName).DataType := AParamType;
                 Params.FindParam(AParamName).ParamType := ptInput;
                 Params.FindParam(AParamName).Value := AParamValues[i];
               end;
            end;
          Open;
          Result := Fields[0].Value;
        finally
           Free;
        end;
    except on E: Exception do
       RaiseGetValStandardException( E, ASQL, AConnectionName );
    end;
end;

function SelectValueStrParam(const ASQL: string; const AParamsList: array of string;
  const AParamValues: array of Variant; const AConnectionName: string = cnstFDConnectionName;
  const ATransaction: TFDTransaction = nil): string;
var
  AValue: Variant;
begin
  Result := '';
  AValue := SelectValueParam(ASQL, AParamsList, AParamValues, AConnectionName,
    ATransaction);
  if not System.Variants.VarIsNull(AValue) then
    Result := System.Variants.VarToStr(AValue);
end;

function SelectValueIntParam(const ASQL: string; const AParamsList: array of string;
  const AParamValues: array of Variant; const AConnectionName: string = cnstFDConnectionName;
  const ATransaction: TFDTransaction = nil): Int64;
var
  AValue: Variant;
begin
  Result := 0;
  AValue := SelectValueParam(ASQL, AParamsList, AParamValues, AConnectionName,
    ATransaction);
  if not System.Variants.VarIsNull(AValue) then
    Result := System.Variants.VarAsType(AValue, varInt64);
end;

function SelectValueByID(const SelectedFieldName, SelectedTableName: string;
  const IDFieldValue: Real; const AConnectionName: string;
  const ATransaction: TFDTransaction): Variant;
var
  AConnection: TFDConnection;
begin
  AConnection := FDManager.FindConnection(AConnectionName) as TFDConnection;
  Result:= SelectValueByID( SelectedFieldName, SelectedTableName, IDFieldValue, AConnection, ATransaction);
end;


function SelectValueByID(const SelectedFieldName, SelectedTableName: string;
  const IDFieldValue: Real; const AConnection: TFDConnection; const ATransaction: TFDTransaction = nil): Variant;
var
  ASQL: string;
begin
  if Assigned(AConnection) and AConnection.Connected then
    try
      with TFDQuery.Create(NIL) do
      try
        Connection := AConnection;
        if Assigned(ATransaction) then
          Transaction := ATransaction;
        SQL.Add(Format('SELECT %s',[SelectedFieldName]));
        SQL.Add(Format('  FROM %s',[SelectedTableName]));
        SQL.Add(IQFormat(' WHERE id = %.0f',[IDFieldValue]));
        ASQL := SQL.Text;
        Open;
        if Fields[0].IsNull then
          begin
            if IsDateTimeFieldType(Fields[0]) or
              IsFloatFieldType(Fields[0]) or
              IsIntegerFieldType(Fields[0]) then
              Result:= 0
            else
              Result:= '';
           end
        else
           Result:= Fields[0].Value;
      finally
        Free;
      end;
  except on E: Exception do
     RaiseGetValStandardException( E, ASQL, AConnection.Name );
  end;
end;

function SelectFuncValue( ASQL: string; const AConnectionName: string;
  const ATransaction: TFDTransaction): Variant;
begin
  ASQL:= Format('select %s from dual', [ ASQL ]);
  Result:= SelectValue(ASQL, AConnectionName, ATransaction);
end;

function SelectFuncValueAsFloat( ASQL: string; const AConnectionName: string;
  const ATransaction: TFDTransaction): Real;
begin
  ASQL:= Format('select %s from dual', [ ASQL ]);
  Result:= SelectValueAsFloat(ASQL, AConnectionName, ATransaction);
end;

function SelectFuncValueAsString( ASQL: string; const AConnectionName: string;
  const ATransaction: TFDTransaction): string;
begin
  ASQL:= Format('select %s from dual', [ ASQL ]);
  Result:= SelectValueAsString(ASQL, AConnectionName, ATransaction);
end;

function SelectFuncValueAsDateTime( ASQL: string; const AConnectionName: string;
  const ATransaction: TFDTransaction): TDateTime;
begin
  ASQL:= Format('select %s from dual', [ ASQL ]);
  Result:= SelectValueAsDateTime(ASQL, AConnectionName, ATransaction);
end;

function SelectFuncValueAsInteger( ASQL: string; const AConnectionName: string;
  const ATransaction: TFDTransaction): Integer;
begin
  ASQL:= Format('select %s from dual', [ ASQL ]);
  Result:= SelectValueAsInteger(ASQL, AConnectionName, ATransaction);
end;

function SelectFuncValueFmtAsFloat( ASQL: string; const Args : array of const;
  const AConnectionName: string; const ATransaction: TFDTransaction): Real;
begin
  Result:= SelectFuncValueAsFloat(IQFormat(ASQL, Args), AConnectionName,
    ATransaction);
end;

function SelectFuncValueFmtAsString( ASQL: string; const Args : array of const;
  const AConnectionName: string; const ATransaction: TFDTransaction): string;
begin
  Result:= SelectFuncValueAsString(IQFormat(ASQL, Args), AConnectionName,
    ATransaction);
end;

function SelectFuncValueFmtAsDateTime( ASQL: string;
  const Args : array of const; const AConnectionName: string;
  const ATransaction: TFDTransaction): TDateTime;
begin
  Result:= SelectFuncValueAsDateTime(IQFormat(ASQL, Args), AConnectionName,
    ATransaction);
end;

function SelectFuncValueFmtAsInteger( ASQL: string; const Args : array of const;
  const AConnectionName: string; const ATransaction: TFDTransaction): Integer;
begin
  Result:= SelectFuncValueAsInteger(IQFormat(ASQL, Args), AConnectionName,
    ATransaction);
end;

function SelectValueFmtAsFloatWhere( const SQL: string; const Args : array of variant; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): Real;
begin
  Result:= SelectValueAsFloat( Where(SQL, Args), AConnectionName, ATransaction);
end;

function SelectValueFmtAsStringWhere( SQL: string; const Args : array of variant; const AConnectionName: string = cnstFDConnectionName; const ATransaction: TFDTransaction = nil): string;
begin
  Result:= SelectValueAsString( Where(SQL, Args), AConnectionName, ATransaction) ;
end;

function GetNextID(const ATableName: string;  AConnectionName: string;
 const ATransaction: TFDTransaction): UInt64;
var
  AConnection: TFDCustomConnection;
  AUseTableName, ASequenceName:String;

  function _IsSameSerialLikeIDExists(AMaster_Label_ID: Real): Boolean;
  begin
    Result:= SelectValueFmtAsInteger(
      'SELECT master_label_misc.id_to_serial_exists(%.0f) FROM DUAL',
      [AMaster_Label_ID], AConnectionName, ATransaction) = 1;
  end;

begin
  // Initialize
  AUseTableName := ATableName;

  if (ATableName = '') then
    // Do not translate and do not wrap text.  This is for programmers.
    raise Exception.Create(
      'Application Error:  Cannot retrieve sequence.  Empty table name passed to function.');

  // Get the correct connection
  if AConnectionName.IsEmpty then
    AConnectionName := cnstFDConnectionName;
  AConnection := FDManager.FindConnection(AConnectionName);

  if Pos('IQMS.', AUseTableName ) > 0 then
     AUseTableName:= Trim(Copy(AUseTableName, 6, Length(ATableName)-5));

  ASequenceName := LowerCase('s_' + AUseTableName);

  if Assigned(AConnection) and AConnection.Connected then
  try
     with TFDQuery.Create(nil) do
       try
         Connection := AConnection;
         if Assigned(ATransaction) then
           Transaction := ATransaction;

         SQL.Add(Format('SELECT %s.NextVal AS newid FROM DUAL',
           [ASequenceName]));

         repeat
            if Active then Close;
            Open;
            Result:= Fields[0].AsLargeInt;

            if CompareText(AUseTableName, 'MASTER_LABEL') <> 0 then
               Break;

            // A foreign label 12345 that was assigned to some master_label
            // record will cause unique constraint error when master_label
            // trigger will attempt to propagate this ID 12345 to Serial 12345
            if not _IsSameSerialLikeIDExists(Result) then
               Break;  {good}

         until False;

       finally
         Free;
       end;
     except on E: Exception do
         if not IsConsole then
           // 'Unable to get next ID key for table, %s.'
           ShowIQErrorMessage(Format(IQMS.Common.ResStrings.cTXT0000128,
             [AUseTableName] ), E.Message, '');
         else
            raise
     end;
end;

procedure EnsureConnectionAssigned(ADataSet: TFDCustomQuery);
begin
  if Assigned(ADataSet) and (ADataSet.Connection = nil) then
    ADataSet.ConnectionName := cnstFDConnectionName;
end;

function ResolveDependencies: Boolean;
var
  AQryInvalidObjects: TFDQuery;
  ACommand: TFDCommand;
  APrevCount: Integer;
  S: string;
begin
  // Default result = there are no unresolved dependencies
  Result := True;

  AQryInvalidObjects := TFDQuery.Create(nil);
  try
    AQryInvalidObjects.ConnectionName:=cnstFDConnectionName;
    AQryInvalidObjects.SQL.Add('SELECT object_name,');
    AQryInvalidObjects.SQL.Add('       object_type');
    AQryInvalidObjects.SQL.Add('  FROM all_objects');
    AQryInvalidObjects.SQL.Add(' WHERE owner = ''IQMS'' AND');
    AQryInvalidObjects.SQL.Add('       object_type IN');
    AQryInvalidObjects.SQL.Add('             (''PROCEDURE'',');
    AQryInvalidObjects.SQL.Add('              ''FUNCTION'',');
    AQryInvalidObjects.SQL.Add('              ''VIEW'',');
    AQryInvalidObjects.SQL.Add('              ''PACKAGE'',');
    AQryInvalidObjects.SQL.Add('              ''PACKAGE BODY'',');
    AQryInvalidObjects.SQL.Add('              ''TRIGGER'') AND');
    AQryInvalidObjects.SQL.Add('       status = ''INVALID''');

    ACommand := TFDCommand.Create(nil);
    try
      ACommand.ConnectionName:=cnstFDConnectionName;

      APrevCount := 0;

      repeat
        if AQryInvalidObjects.Active then
          AQryInvalidObjects.Close;
        AQryInvalidObjects.Open;

        if not AQryInvalidObjects.Eof then
          begin
            ACommand.CommandText.Text :=
              'BEGIN DBMS_UTILITY.COMPILE_SCHEMA(''IQMS'', FALSE, TRUE); END;';
            ACommand.Execute;
          end;

        // Check if unresolved dependencies remain
        if (APrevCount > 0) and
          (APrevCount = AQryInvalidObjects.RecordCount) then
          // Set result = there are unrsolved dependencies
          Result := False;

        APrevCount := AQryInvalidObjects.RecordCount;
      until (AQryInvalidObjects.Bof and AQryInvalidObjects.Eof) or not Result;

    finally
      FreeAndNil(AQryInvalidObjects);
    end;
  finally
    FreeAndNil(ACommand);
  end;
end;

{$ENDREGION 'FireDAC Oracle database methods'}

function FD_AssignDataSetIndexName( ADataSet: TFDDataSet; AFieldName: string ): Boolean;
var
  i: Integer;
  ANewIndexName: String;
  AIndexOptions: TFDSortOptions;
  Field: TField;
begin
  Result:= False;
  if not ADataSet.Active then
     EXIT;
  
  Field := ADataSet.Fields.FindField( AFieldName );
  if Field = nil then 
     EXIT;
  
  // if invalid field type - exit.
  if (Field is TObjectField) or (Field is TBlobField) or (Field is TAggregateField)
      or (Field is TVariantField) or (Field is TBinaryField) or (Field.FieldKind = fkCalculated) then 
      EXIT;
     
  // Ensure IndexDefs is up-to-date
  ADataSet.IndexDefs.Update;
  
  // If an ascending index is already in use, switch to a descending index
  if ADataSet.IndexName = AFieldName + '__IdxA'
  then
    begin
      ANewIndexName := AFieldName + '__IdxD';
      AIndexOptions := [soDescending];
    end
  else
    begin
      ANewIndexName := AFieldName + '__IdxA';
      AIndexOptions := [];
    end;
    
  // Look for existing index
  for i:= 0 to Pred( ADataSet.IndexDefs.Count ) do
    if ADataSet.IndexDefs[i].Name = ANewIndexName then
      begin
        Result := True;
        Break;
      end;
  
  // If existing index not found, create one
  if not Result then
  begin
    ADataSet.AddIndex(ANewIndexName, AFieldName, '', AIndexOptions);
    Result := True;
  end;
     
  // Set the index
  ADataSet.IndexName:= ANewIndexName;
end;


function FD_GetDataSetIndexFieldName( ADataSet: TFDDataSet ): string;
var
  i: Integer;
begin
  if ADataSet.IndexFieldNames > '' then
     Exit(ADataSet.IndexFieldNames);
  
  if (ADataSet.IndexName = '') then
     Exit('');
  
  ADataSet.IndexDefs.Update;
  
  for i:= 0 to Pred( ADataSet.IndexDefs.Count ) do
    if ADataSet.IndexDefs[i].Name = ADataSet.IndexName then
       Exit( ADataSet.IndexDefs[i].Fields);

  Exit('');     
end;

function FixFireDACErrorMessage(const AErrorMessage: string): string; overload;
const
  FIREDAC_ERROR_PREFIX = '[FireDAC][Phys][Ora]';
begin
  Result := Trim(StringReplace(AErrorMessage, FIREDAC_ERROR_PREFIX, '',
         [rfReplaceAll, rfIgnoreCase]));
end;

function FixFireDACErrorMessage(const E: Exception): string; overload;
begin
  Result := FixFireDACErrorMessage(E.Message);
end;


function GetFireDACFormattedErrorMessage(AExcepObj: Exception):string;
var
  LSrchTxt: string;
begin
{ ------------------------------------------------------------------------------
  Intent: Remove "[FireDAC][Phys][Ora-<error_code>]:" from the error message text.
  Crt By: Sonali Nimbalkar
  Crt Dt: 20 May 2016
  Params: AExcepObj - An Exceptional Object
  Assumption: Function get executed only when the supplied exception object is
              of type EFDDBEngineException
  ------------------------------------------------------------------------------}
  if not Assigned(AExcepObj) then
    Assert(false, 'Unassinged parameter supplied.');

  Result := FixFireDACErrorMessage(AExcepObj);

  if not (AExcepObj is EFDDBEngineException) then
  begin
    Exit;
  end;

  Result := GetErrorMessageForORACode(EFDDBEngineException(AExcepObj).ErrorCode) + Result;

//  LSrchTxt:= IntToStr(EFDDBEngineException(AExcepObj).ErrorCode) + ':';
//  Result := PChar(Trim(Copy(Result, Pos(LSrchTxt, Result)+Length(LSrchTxt), Length(Result))));
end;

function GetErrorMessageForORACode( AORAErrorCode: Integer ): string;
begin
  case AORAErrorCode of
    2292 : Result := 'Master has detail records. Cannot delete or modify.' + #10#13 ;
  else
    Result := '';
  end;
end;

procedure LoadQueryDistinctParamNames( AQuery: TFDQuery; AList: TStringList );
var
  I: Integer;
begin
  if not Assigned(AQuery) or (AQuery.ParamCount = 0) then
     EXIT;

  for I:= 0 to AQuery.ParamCount - 1 do
    if AList.IndexOf( AQuery.Params[ i ].Name ) = -1 then
       AList.Add( AQuery.Params[ i ].Name );
end;


{ TDataSetLogger }

function TDataSetLogger.GetFullName(AComponent: TComponent): String;
begin
  if Assigned(AComponent) then
    begin
      Result := GetFullName(AComponent.Owner);
      if (AComponent.Name <> '') then
        begin
          if (Result <> '') then
            Result := Result + '.';
          Result := Result + AComponent.Name;
        end;
    end;
end;


function TDataSetLogger.DataTypeName(ADataType: TFieldType): String;
begin
  Result := GetEnumName(TypeInfo(TFieldType), Ord(ADataType));
  if Pos('ft', Result) = 1 then
    System.Delete(Result, 1, 2);
end;

function TDataSetLogger.StripTrailingLineBreaks(AString: String): String;
var
  i: Integer;
begin
  i := AString.Length - 1;
  while ((i > 0) and ((AString.Chars[i] = #10) or (AString.Chars[i] = #13))) do
      i := i - 1;
  Result := LeftStr(AString, i + 1)

end;

procedure TDataSetLogger.LogData(ADataSet: TDataSet);
var
 ALogMsg, AFullName: String;
 i : Integer;
begin
  //Class Name
  ALogMsg := ADataSet.ClassName + ': ';

  //Name of the component and any parents
  if (ADataSet is TComponent) then
    begin
       AFullName := GetFullName(TComponent(ADataSet));
       if (AFullName <> '') then
         ALogMsg := ALogMsg + AFullName + #$D#$A;
    end;

  if (ADataSet is TFDStoredProc) then
    with TFDStoredProc(ADataSet) do
    begin
      ALogMsg := ALogMsg + #$D#$A + StoredProcName;
      if (Params.Count > 0) then
        begin
          ALogMsg := ALogMsg +  #$D#$A + 'Parameters:';
          for i := 0 to Params.Count - 1 do
            ALogMsg := ALogMsg +  #$D#$A + Format('%s(%s): %s', [Params[i].Name, DataTypeName(Params[i].DataType), Params[i].AsString]);
 //         ALogMsg := ALogMsg +  #$D#$A;
        end;
    end;

  //Datasnap components
  //TClientDataSet
  if (ADataSet is TClientDataSet) then
    ALogMsg := ALogMsg + TClientDataSet(ADataSet).CommandText;

  //FireDAC components
  //TFDQuery
  if (ADataSet is TFDQuery ) then
    with TFDQuery(ADataSet) do
    begin
      ALogMsg := ALogMsg +  StripTrailingLineBreaks(SQL.Text);
      if (Params.Count > 0) then
        begin
          ALogMsg := ALogMsg +  #$D#$A + 'Parameters:';
          for i := 0 to Params.Count - 1 do
            ALogMsg := ALogMsg +  #$D#$A + Format('%s(%s): %s', [Params[i].Name, DataTypeName(Params[i].DataType), Params[i].AsString]);
//          ALogMsg := ALogMsg +  #$D#$A;
        end;
    end;

  //TFDTable
  if (ADataSet is TFDTable) then
    with TFDTable(ADataSet) do
    begin
      ALogMsg := ALogMsg + TableName;
        if (FieldDefs.Count > 0) then
          begin
            ALogMsg := ALogMsg + #$D#$A;
            for i := 0 to FieldDefs.Count - 1 do
              begin
                ALogMsg := ALogMsg + #$D#$A + Format('%s(%s)', [FieldDefs[i].Name, DataTypeName(FieldDefs[i].DataType)]);
                if (i < FieldDefs.Count -1) then
                  ALogMsg := ALogMsg + ', ';
              end;
//            ALogMsg := ALogMsg +  #$D#$A;
          end;
    end;

  //Filter
  if (ADataSet.Filtered and (ADataSet.Filter <> '')) then
      ALogMsg := ALogMsg + #$D#$A'Filter: ' + ADataSet.Filter;

    TFrmCheckPointList.Add(ALogMsg, '', 0);
end;

procedure TDataSetLogger.Open;
begin
  try
    inherited Open;
  finally
    if LogEnabled then
      LogData(self);
  end;
end;

procedure TDataSetLogger.Refresh;
begin
  if LogEnabled then
    LogData(self);
  inherited Refresh;
end;


procedure ActivateInternalExternalDocs(APageControl:TUniPageControl; AInternalTab, AExternalTab:TUniTabSheet; AInternalDocs:TIQWebDocs; AExternalDocs:TIQWebExtDoc);
begin
  if (APageControl.ActivePage =  AInternalTab) and not AInternalDocs.Active then
    AInternalDocs.Active := true;
  if (APageControl.ActivePage =  AExternalTab) and not AExternalDocs.Active then
    AExternalDocs.Active := true;
end;

function GetOldValueAsReal(AField: TField): Real;
begin
  Result := 0;
  if AField = nil then
    Exit;

  if AField.OldValue = null then
    Exit;

  Result := AField.OldValue;
end;

function GetNewValueAsReal(AField: TField): Real;
begin
  Result := 0;
  if AField = nil then
    Exit;

  if AField.NewValue = null then
    Exit;

  Result := AField.NewValue;
end;


procedure ClearFieldValues (ADataSet : TDataSet);
var
  i: integer;
begin
    If not Assigned(ADataSet) then
       exit;

    for I := 0 to ADataSet.FieldCount-1 do
    begin
      if ADataSet.Fields[i].CanModify then
         ADataSet.Fields[i].clear;
    end;

end;

function GetMasterLabelIDFromSerial(const S: String; var Value: Real; DataBaseName: string = cnstFDConnectionName): Boolean;
begin
  Result:= False;

  if not IsStringValidFloat( S, Value) then
    Value:= SelectValueFmtAsFloat('select id from master_label where trim(serial) = ''%s''', [ S ], DataBaseName);

  Result:= Value > 0;
end;


initialization
  SharedDBEvents := TSharedDBEvents.Create;
  CS_Sessions:= TCriticalSection.Create;

finalization
  CS_Sessions.Free;
  SharedDBEvents.Free;


end.
