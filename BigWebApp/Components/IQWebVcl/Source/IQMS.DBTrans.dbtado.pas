unit IQMS.DBTrans.dbtado;

interface

uses
  Windows,
  Forms,
  SysUtils,
  Classes,
  Variants,
  DB,
  ADODB,
  IQMS.DBTrans.dbttypes,
  FireDAC.Comp.Client;

  function ExcelISAMExists: Boolean;
  function AccessISAMExists: Boolean;
  function CheckExcelISAMExists: Boolean;
  function CheckAccessISAMExists: Boolean;
  procedure GetProviderNames(var AList: TStringList);
  function ProviderNameExists(const AProviderName: string): Boolean;

  // Initialize an ADO Connection (TADOConnection) for the given parameters.
  // This is used when preparing a connection for a particular datasource
  // for import or export, and also for testing whether or not the connection
  // parameters are correct.
  function InitConnection(const AADOConnection: TADOConnection;
                          const ADatabaseName: String;
                          const ATableType: TCustomTableType;
                          const AUserName,
                                APassword: String;
                          const AODBC: Boolean;
                            var AErrorMsg: String): Boolean;

  // Connection string functions
  function ADO_ConnectionStringForParadox(
     const Directory: String): String;

  function ADO_ConnectionStringForDBF(
     const Directory: String): String;

  function ADO_ConnectionStringForVisualFoxPro(
     const Database: String): String;

  function ADO_ConnectionStringForASCII(
    const Directory: String; // folder containing the files
    const AFixed: Boolean;  // is this "fixed width"; pass False for comma-delimited
    const AFirstRowColumnNames: Boolean): String;

  function ADO_ConnectionStringForMSExcel(
    const AFileName: String;
    const AFirstRowColumnNames: Boolean;
    const AEstimateFieldTypes: Boolean = False): String;

  function ADO_ConnectionStringForMSExcel2007(
    const AFileName: String;
    const AFirstRowColumnNames: Boolean;
    const AEstimateFieldTypes: Boolean = False): String;

  function ADO_ConnectionStringForMSAccess(
    const AFileName, // File path and name of .MDB file
          AUserName,
          APassword: String): String;

  function ADO_ConnectionStringForMSAccess2007(
    const AFileName, // File path and name of .MDB file
          AUserName,
          APassword: String): String;

  function ADO_ConnectionStringForODBC(
    const DSN,
          UserName,
          Password: String): String;

  function ADO_ConnectionStringForOracle(
    const SID,
          UserName,
          Password: String): String;

  function ADO_ConnectionStringForSQLServer(
    const Database, // SQL Server database name (e.g., 'Shipnet2000')
          UserName,
          Password: String): String;

  function ADO_ConnectionStringForSQLServerEx(
    const Server, // usually, 'localhost'
          Database, // SQL Server database name (e.g., 'Shipnet2000')
          UserName,
          Password: String): String;

  // Configure the ADO Connection for Paradox
  procedure ADO_ConfigureConnectionForParadox(
    const AdoConnection: TAdoConnection;
    const Directory: String);

  // Configure the ADO Connection for DBF/FoxPro
  procedure ADO_ConfigureConnectionForDBF(
    const AdoConnection: TAdoConnection;
    const Directory: String);

  // Configure the ADO Connection for Visual FoxPro
  procedure ADO_ConfigureConnectionForVisualFoxPro(
    const AdoConnection: TAdoConnection;
    const Database: String);

  // Configure the ADO Connection for ASCII text file
  procedure ADO_ConfigureConnectionForASCII(
    const AdoConnection: TAdoConnection;
    const Directory: String; // folder containing the files
    const AFixed: Boolean;  // is this "fixed width"; pass False for comma-delimited
    const AFirstRowColumnNames: Boolean);

  // Configure the ADO Connection for MS Excel
  procedure ADO_ConfigureConnectionForMSExcel(
    const AdoConnection: TAdoConnection;
    const AFileName: String;
    const AFirstRowColumnNames: Boolean);

  procedure ADO_ConfigureConnectionForMSExcel2007(
    const AdoConnection: TAdoConnection;
    const AFileName: String;
    const AFirstRowColumnNames: Boolean);

  // Configure the ADO Connection for Microsoft Access
  procedure ADO_ConfigureConnectionForMSAccess(
    const AdoConnection: TAdoConnection;
    const AFileName, // File path and name of .MDB file
          APassword: String);

  procedure ADO_ConfigureConnectionForMSAccess2007(
    const AdoConnection: TAdoConnection;
    const AFileName, // File path and name of .MDB file
          APassword: String);

  // Configure the ADO Connection for ODBC
  procedure ADO_ConfigureConnectionForODBC(
    const AdoConnection: TAdoConnection;
    const DSN,
          UserName,
          Password: String);

  // Configure the ADO Connection for Oracle
  procedure ADO_ConfigureConnectionForOracle(
    const AdoConnection: TAdoConnection;
    const SID,
          UserName,
          Password: String);

  // Configure the ADO Connection for SQL Server
  procedure ADO_ConfigureConnectionForSQLServer(
    const AdoConnection: TAdoConnection;
    const Database, // SQL Server database name (e.g., 'Shipnet2000')
          UserName,
          Password: String);

  procedure ADO_ConfigureConnectionForSQLServerEx(
    const AdoConnection: TAdoConnection;
    const Server, // usually, 'localhost'
          Database, // SQL Server database name (e.g., 'Shipnet2000')
          UserName,
          Password: String);

  procedure ConfigureConnectionForSQLite(
  const FDConnection: TFDConnection;
  const Directory: String);

  // Returns a floating point value using a DBExpress TSQLQuery.
  function ADO_GetVal(const AdoConnection: TAdoConnection;
     const ASQL: string): Real;
  function ADO_GetValInt(const AdoConnection: TAdoConnection;
     const ASQL: string): Integer;
  function ADO_GetValFmt(const AdoConnection: TAdoConnection;
    const ASQL: string; const Args: array of const): Real;
  function ADO_GetValIntFmt(const AdoConnection: TAdoConnection;
    const ASQL: string; const Args: array of const): Integer;
  function ADO_GetValStr(const AdoConnection: TAdoConnection;
    const ASQL: string): String;
  function ADO_GetValStrFmt(const AdoConnection: TAdoConnection;
    const ASQL: string; const Args: array of const): String;

  function ADO_GetValStrParam(const AdoConnection: TAdoConnection;
    const ASQL: string; const ParamsList: array of string;
    const ParamValues: array of Variant): String;

  function ADO_GetValParam(const AdoConnection: TAdoConnection;
   const ASQL: string; const ParamsList: array of string;
   const ParamValues: array of Variant): Real;

  function ADO_GetValArray(const AdoConnection: TAdoConnection;
   const ASQL: string): Variant;

  function ADO_GetValArrayFmt(const AdoConnection: TAdoConnection;
   const ASQL: string; const Args : array of const): Variant;

  function ADO_RunSQL(const AdoConnection: TAdoConnection;
    const ASQL: string): Boolean;
  function ADO_RunSQLFmt(const AdoConnection: TAdoConnection;
    const ASQL: string; const Args: array of const): Boolean;

  function ADO_RunSQLParam(const AdoConnection: TAdoConnection;
    const ASQL: string; const ParamsList: array of string;
    const ParamValues: array of Variant): Boolean;
  function DBX_RunSQLParamDataSet(const AdoConnection: TAdoConnection;
    const ASQL: string; const ASourceDataSet: TDataSet): Boolean;

  procedure ADO_FillParams(const ASource: TDataSet; const AParams: TParameters);

  function ADO_GetRecordCount(AQuery: TADOQuery): Integer; overload;
  function ADO_GetRecordCount(ATable: TADOTable): Integer; overload;

const
  cnstFloat  = 'FLOAT';
  cnstInt    = 'INT';
  cnstString = 'STRING';
  cnstDate   = 'DATE';

implementation

uses
  IQMS.DBTrans.dbtdb,
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.FileUtils,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Registry,
  IQMS.Common.RegServer,
  IQMS.Common.StringUtils;

{ Internal methods }

function _GetTypeFromStr(AValue: String): TFieldType;
begin
  if (AValue = 'F') or (AValue = cnstFloat) then
     Result := ftFloat
  else if (AValue = 'I') or (AValue = cnstInt) then
     Result := ftInteger
  else if (AValue = 'S') or (AValue = cnstString) then
     Result := ftString
  else if (AValue = 'D') or (AValue = cnstDate) then
     Result := ftDateTime
  else Result := ftString;
end;

procedure _GetParamAndType(const AValue: String;
                           var AParamName: String;
                           var AParamTypeStr: String;
                           var AParamType: TFieldType);
begin
  if (Pos(';', AValue) > 0) then
     begin
       AParamName := Trim(Copy(AValue, 0, Pos(';', AValue)-1));
       AParamTypeStr := Trim(Copy(AValue, Pos(';', AValue)+1, Length(AValue)));
       AParamType := _GetTypeFromStr(AParamTypeStr);
     end
  else
     begin
       AParamName := AValue;
       AParamType := ftString;
     end;
end;

procedure _AddParam(const AParams: TParams; const AName: String;
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
  AParam.Value := AValue;
  AParams.AddParam(AParam);
end;

{ Public methods }

function ExcelISAMExists: Boolean;
var
  ARegKey, AFileName: string;
begin
  Result := False;
  ARegKey := '';
  AFileName := '';

  with TIQWebRegistry.Create do
  try
    RootKey:= HKEY_LOCAL_MACHINE;
    // Source: http://support.microsoft.com/kb/209805
    if OpenKey('SOFTWARE\Wow6432Node\Microsoft\Jet\4.0\Engines\Excel', False) then
     begin
       ARegKey := 'SOFTWARE\Wow6432Node\Microsoft\Jet\4.0\Engines\Excel';
       AFileName := ReadString('Win32');
     end
    else if OpenKey('SOFTWARE\Microsoft\Jet\4.0\Engines\Excel', False) then
     begin
       ARegKey := 'SOFTWARE\Microsoft\Jet\4.0\Engines\Excel';
       AFileName := ReadString('win32');
     end;

    //AFileName := IQMS.Common.FileUtils.PathCombineEx([IQMS.Common.Miscellaneous.GetSpecialPath(evSystem),
    //  'msexcl*.dll']);
    Result := (Length(AFileName) > 0) and FileExists(AFileName);

  finally
    Free;
  end;

  if Result then
   Exit;

  // if the ISAM is registered, but the file doesn't exist,
  // then the file path needs to be fixed
  if (Length(ARegKey) > 0) and (Length(AFileName) > 0) and not FileExists(AFileName) then
     begin
      // Normally, the file will exist in the System32 directory
      AFileName := IQMS.Common.FileUtils.PathCombineEx([IQMS.Common.Miscellaneous.GetSpecialPath(evSystem),
        'msexcl40.dll']);
      if FileExists(AFileName) then
       begin
         IQMS.Common.RegServer.RegisterFile(AFileName);
         Result := True;
       end;
     end;
end;

function AccessISAMExists: Boolean;
var
  ARegKey, AFileName: string;
begin
  Result := False;
  ARegKey := '';
  AFileName := '';

  with TIQWebRegistry.Create do
  try
    RootKey:= HKEY_LOCAL_MACHINE;
    // Source: http://support.microsoft.com/kb/209805


    if OpenKey('SOFTWARE\Wow6432Node\Microsoft\Jet\4.0\Engines\Jet 3.x', False) then
     begin
       ARegKey := 'SOFTWARE\Wow6432Node\Microsoft\Jet\4.0\Engines\Jet 3.x';
       AFileName := ReadString('Win32');
     end
    else if OpenKey('SOFTWARE\Wow6432Node\Microsoft\Jet\4.0\Engines\Jet 2.x', False) then
     begin
       ARegKey := 'SOFTWARE\Wow6432Node\Microsoft\Jet\4.0\Engines\Jet 2.x';
       AFileName := ReadString('Win32');
     end
    else if OpenKey('SOFTWARE\Microsoft\Jet\4.0\Engines\Jet 3.x', False) then
     begin
       ARegKey := 'SOFTWARE\Microsoft\Jet\4.0\Engines\Jet 3.x';
       AFileName := ReadString('win32');
     end
    else if OpenKey('SOFTWARE\Microsoft\Jet\4.0\Engines\Jet 2.x', False) then
     begin
       ARegKey := 'SOFTWARE\Microsoft\Jet\4.0\Engines\Jet 2.x';
       AFileName := ReadString('win32');
     end;

    Result := (Length(AFileName) > 0) and FileExists(AFileName);

  finally
    Free;
  end;

  if Result then
   Exit;

  // if the ISAM is registered, but the file doesn't exist,
  // then the file path needs to be fixed
  if (Length(ARegKey) > 0) and (Length(AFileName) > 0) and not FileExists(AFileName) then
     begin
      // Normally, the file will exist in the System32 directory
      AFileName := IQMS.Common.FileUtils.PathCombineEx([IQMS.Common.Miscellaneous.GetSpecialPath(evSystem),
        'msrd3x40.dll']);
      if not FileExists(AFileName) then
      AFileName := IQMS.Common.FileUtils.PathCombineEx([IQMS.Common.Miscellaneous.GetSpecialPath(evSystem),
        'msrd2x40.dll']);
      if FileExists(AFileName) then
       begin
         RegisterFile(AFileName);
         Result := True;
       end;
     end;
end;

function CheckExcelISAMExists: Boolean;
begin
  Result := ExcelISAMExists;

  if not Result then
   raise Exception.Create(
     'The Microsoft Excel ISAM has not been installed on this machine.  ' +
     'Please install the ISAM drivers using the Microsoft Office setup.');
end;

function CheckAccessISAMExists: Boolean;
begin
  Result := AccessISAMExists;
  if not Result then
   raise Exception.Create(
     'The Microsoft Access ISAM has not been installed on this machine.  ' +
     'Please install the ISAM drivers using the Microsoft Office setup.');
end;

procedure GetProviderNames(var AList: TStringList);
begin
  if Assigned(AList) then
    ADODB.GetProviderNames(AList);
end;

function ProviderNameExists(const AProviderName: string): Boolean;
var
  AList: TStringList;
begin
  AList := TStringList.Create;
  try
    ADODB.GetProviderNames(AList);
    AList.Text := UpperCase(AList.Text);
    Result := AList.IndexOf(AProviderName) > -1;
  finally
    AList.Free;
  end;
end;

function ADO_ConnectionStringForParadox(
   const Directory: String): String;
begin
  Result := Format(
    'Provider=Microsoft.Jet.OLEDB.4.0;' +
    'Data Source=%s;' +
    'Extended Properties=Paradox 5.x;',
    [SysUtils.IncludeTrailingPathDelimiter(Directory)]);
end;

function ADO_ConnectionStringForDBF(
   const Directory: String): String;
begin
  Result := Format(
    'Provider=Microsoft.Jet.OLEDB.4.0;' +
    'Data Source=%s;' +
    //'Extended Properties=dBASE IV;' +
    'Extended Properties=dBASE 5.0;' +
    'User ID=Admin;' +
    'Password=;',
    [SysUtils.IncludeTrailingPathDelimiter(Directory)]);
end;

function ADO_ConnectionStringForVisualFoxPro(
   const Database: String): String;
var
   AExt: String;
begin
  if FileExists(Database) then
     begin
       AExt := Trim(UpperCase(SysUtils.ExtractFileExt(Database)));
       if AExt <> '.DBC' then
          AExt := '';
     end;
  // Configure connection string
  // 1.) Database container (.DBC)
  if AExt = '.DBC' then
     Result := Format(
       'Provider=vfpoledb;' +
       'Data Source=%s;' +
       'Collating Sequence=machine;',
       [Database])
  // 2.) Free table directory
  else if DirectoryExists(Database) then
    Result := Format(
       'Provider=vfpoledb;' +
       'Data Source=%s;' +
       'Collating Sequence=general;',
       [SysUtils.IncludeTrailingPathDelimiter(Database)]);
end;

function ADO_ConnectionStringForASCII(
  const Directory: String; // folder containing the files
  const AFixed: Boolean;  // is this "fixed width"; pass False for comma-delimited
  const AFirstRowColumnNames: Boolean): String;
begin
  // Configure connection string
  if AFixed then
     Result := Format(
       'Provider=Microsoft.Jet.OLEDB.4.0;' +
       'Data Source=%s;' +
       'Extended Properties="text;HDR=%s;FMT=Fixed";',
       [SysUtils.IncludeTrailingPathDelimiter(Directory),
        IQMS.Common.Numbers.sIIf(AFirstRowColumnNames, 'Yes','No')])
  else
  {Notes:
   The delimiter can be specified in the registry at the following location:
   HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Jet\4.0\Engines\Text
   "Format" = "TabDelimited"
   or
   "Format" = "Delimited(;)"
  }
    Result := Format(
       'Provider=Microsoft.Jet.OLEDB.4.0;' +
       'Data Source=%s;' +
       'Extended Properties="text;HDR=%s;FMT=Delimited";',
       [SysUtils.IncludeTrailingPathDelimiter(Directory),
        IQMS.Common.Numbers.sIIf(AFirstRowColumnNames, 'Yes','No')]);
end;

function ADO_ConnectionStringForMSExcel(
  const AFileName: String;
  const AFirstRowColumnNames,
        AEstimateFieldTypes: Boolean): String;
begin
  Result := ADO_ConnectionStringForMSExcel2007(
               AFileName, AFirstRowColumnNames, AEstimateFieldTypes)
end;

function ADO_ConnectionStringForMSExcel2007(
  const AFileName: String;
  const AFirstRowColumnNames,
        AEstimateFieldTypes: Boolean): String;
var
   AExt: String;
begin
  // Get file extension
  AExt := Trim(UpperCase(SysUtils.ExtractFileExt(AFileName)));
  { Microsoft Excel 2007 Extensions:
        Workbook .xlsx
        Macro-enabled workbook .xlsm
        Template .xltx
        Macro-enabled template .xltm
        Non-XML binary workbook .xlsb }

  // Configure connection string
  if AExt = '.XLSX' then
     { Treating data as text
       Use this one when you want to treat all data in the file as
       text, overriding Excels column type "General" to guess what type 
       of data is in the column.

       Provider=Microsoft.ACE.OLEDB.12.0;Data
       Source=c:\myFolder\myExcel2007file.xlsx;Extended Properties="
       Excel 12.0 Xml;HDR=YES;IMEX=1";

       If you want to read the column 
       headers into the result set (using HDR=NO even though there is a 
       header) and the column data is numeric, use IMEX=1 to avoid crash.
       
       To always use IMEX=1 is a safer way to retrieve data for mixed 
       data columns. Consider the scenario that one Excel file might 
       work fine cause that file's data causes the driver to guess one 
       data type while another file, containing other data, causes the 
       driver to guess another data type. This can cause your app to 
       crash. }

     Result := Format(
       'Provider=Microsoft.ACE.OLEDB.12.0;' +
       'Data Source=%s;' +
       'Extended Properties="Excel 12.0 Xml;HDR=%s;IMEX=%d";',
       [AFileName,
        IQMS.Common.Numbers.sIIf(AFirstRowColumnNames, 'YES','NO'),
        IQMS.Common.Numbers.iIIf(AEstimateFieldTypes, 0, 1)])

  else if AExt = '.XLSB' then
     Result := Format(
       'Provider=Microsoft.ACE.OLEDB.12.0;' +
       'Data Source=%s;' +
       'Extended Properties="Excel 12.0;HDR=%s;IMEX=%d";',
       [AFileName,
        IQMS.Common.Numbers.sIIf(AFirstRowColumnNames, 'YES','NO'),
        IQMS.Common.Numbers.iIIf(AEstimateFieldTypes, 0, 1)])

  else if AExt = '.XLSM' then
     Result := Format(
       'Provider=Microsoft.ACE.OLEDB.12.0;' +
       'Data Source=%s;' +
       'Extended Properties="Excel 12.0 Macro;HDR=%s;IMEX=%d";',
       [AFileName,
        IQMS.Common.Numbers.sIIf(AFirstRowColumnNames, 'YES','NO'),
        IQMS.Common.Numbers.iIIf(AEstimateFieldTypes, 0, 1)])

  else if AExt = '.XLS' then
    begin
      Result := Format(
        'Provider=Microsoft.Jet.OLEDB.4.0;' +
        'Data Source=%s;' +
        'Extended Properties="Excel 8.0;HDR=%s;IMEX=%d";',
        [AFileName,
         IQMS.Common.Numbers.sIIf(AFirstRowColumnNames, 'YES','NO'),
         IQMS.Common.Numbers.iIIf(AEstimateFieldTypes, 0, 1)
         ]);
    end;
end;

function ADO_ConnectionStringForMSAccess(
  const AFileName, // File path and name of .MDB file
        AUserName,
        APassword: String): String;
begin
  Result := ADO_ConnectionStringForMSAccess2007(
               AFileName, AUserName, APassword)
end;

function ADO_ConnectionStringForMSAccess2007(
  const AFileName, // File path and name of database file
        AUserName,
        APassword: String): String;
var
   AExt: String;
   AWorkGroupFile: String;
   AHasWorkGroup: Boolean;
begin
  // Get extension
  AExt := Trim(UpperCase(SysUtils.ExtractFileExt(AFileName)));
  AWorkGroupFile := ChangeFileExt(AFileName, '.mdw');
  AHasWorkGroup := FileExists(AWorkGroupFile);

  if (AExt = '.ACCDB') or (AExt = '.ACCDE') then
     begin
       // Get connection string
       if AHasWorkGroup then
          Result :=
             Format('Driver={Microsoft Access Driver (*.mdb, *.accdb};' +
                    'Dbq=%s;SystemDB=%s;Uid=%s;Pwd=%s',
                    [AFileName, AWorkGroupFile, AUserName, APassword])
       else if (AUserName > '') and (LowerCase(AUserName) <> 'admin') then
          Result :=
            Format('Driver={Microsoft Access Driver (*.mdb, *.accdb};Dbq=%s;Uid=%s;Pwd=%s',
                   [AFileName, AUserName, APassword])
            //Format('Provider=Microsoft.ACE.OLEDB.12.0;' +
            //       'Data Source=%s;' +
            //       'Jet OLEDB:Database Password=''%s'';',
            //       [AFileName, APassword])
       else if APassword > '' then
          Result :=
            //Format('Driver={Microsoft Access Driver (*.mdb, *.accdb};Dbq=%s;Pwd=%s',
            //       [AFileName, APassword])
            Format('Provider=Microsoft.ACE.OLEDB.12.0;' +
                   'Data Source=%s;' +
                   'Jet OLEDB:Database Password=''%s'';',
                   [AFileName, APassword])
       else
          Result :=
            Format('Provider=Microsoft.ACE.OLEDB.12.0;' +
                   'Data Source=%s;' +
                   'Persist Security Info=False;',
                   [AFileName]);
     end
  else if (AExt = '.MDB') or (AExt = '.MDE') then
     begin
        Result :=
          Format('Provider=Microsoft.Jet.OLEDB.4.0;' +
                 'Data Source=%s;' +
                 'Jet OLEDB:Database Password=''%s'';' +
                 'Mode=Share Exclusive;Persist Security Info=False',
                 [AFileName, APassword]);

        if AHasWorkGroup then
           Result := Format('Provider=Microsoft.Jet.OLEDB.4.0;User ID=%s;'+
                            'Data Source=%s;Mode=Share Deny None;'+
                            'Extended Properties="";Jet OLEDB:System database=%s;'+
                            'Jet OLEDB:Registry Path="";Jet OLEDB:Database Password=%s;'+
                            'Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=0;'+
                            'Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;'+
                            'Jet OLEDB:New Database Password="";Jet OLEDB:Create System Database=False;'+
                            'Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don''t Copy Locale on Compact=False;'+
                            'Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False',
                            [AUserName,
                             AFileName,
                             AWorkGroupFile,
                             APassword]);

{
     Result :=
        Format('Provider=Microsoft.Jet.OLEDB.4.0;'+  // Connection string used by ADO
               'Password=%s;'+
               'User ID=%s;'+
               'Data Source=%s;'+
               'Persist Security Info=False',
               [APassword, AUserName,
                AFileName]);


}
                             
     end;
end;

function ADO_ConnectionStringForODBC(
  const DSN,
        UserName,
        Password: String): String;
begin
  Result :=
    Format('Provider=MSDASQL.1;' +
           'Persist Security Info=False;' +
           'Data Source=%s;' +
           'Uid=%s;' +
           'Pwd=%s;',
           [DSN, UserName, Password]);
end;

function ADO_ConnectionStringForOracle(
  const SID,
        UserName,
        Password: String): String;
var
  AProvider: string;
begin
  if ProviderNameExists('MSDAORA') then
    AProvider := 'MSDAORA'
  else if ProviderNameExists('OraOLEDB.Oracle.1') then
    AProvider := 'OraOLEDB.Oracle.1'
  else if ProviderNameExists('OraOLEDB.Oracle') then
    AProvider := 'OraOLEDB.Oracle'
  else
    raise Exception.Create('Oracle Provider for ADO not found.');

  Result :=
    Format('Provider=%s;' +
           'Password=%s;' +
           'Persist Security Info=True;' +
           'User ID=%s;' +
           'Data Source=%s',
           [AProvider, Password, UserName, SID]);
end;

function ADO_ConnectionStringForSQLServer(
  const Database, // SQL Server database name (e.g., 'Shipnet2000')
        UserName,
        Password: String): String;
begin
  Result :=
    Format('Data Source=%s;Initial Catalog=%s;User Id=%s;Password=%s;',
           [Database, 'localhost', UserName, Password]);
end;

function ADO_ConnectionStringForSQLServerEx(
  const Server, // usually, 'localhost'
        Database, // SQL Server database name (e.g., 'Shipnet2000')
        UserName,
        Password: String): String;
begin
  Result :=
    Format('Data Source=%s;Initial Catalog=%s;User Id=%s;Password=%s;',
           [Database, Server, UserName, Password]);
end;

// -----------------------------------------------------------------------------
function InitConnection(const AADOConnection: TADOConnection;
                        const ADatabaseName: String;
                        const ATableType: TCustomTableType;
                        const AUserName,
                              APassword: String;
                        const AODBC: Boolean;
                          var AErrorMsg: String): Boolean;
var
   ADirectory: String;
begin
  Result := False;
  if Assigned(AADOConnection) and not AADOConnection.Connected then
  try
     ADirectory := ExtractFilePath(ADatabaseName);

     if AADOConnection.Connected then
        AADOConnection.Connected := False;

     if AODBC then
        ADO_ConfigureConnectionForODBC(
          AADOConnection,
          ADatabaseName,
          AUserName,
          APassword)
     else
        case ATableType of
         dttParadox:
           ADO_ConfigureConnectionForParadox(
             AADOConnection,
             ADirectory);
         dttDBase:
           ADO_ConfigureConnectionForDBF(
             AADOConnection,
             ADirectory);
         dttFoxPro:
           ADO_ConfigureConnectionForVisualFoxPro(
             AADOConnection,
             ADirectory);
         dttASCII:
           // Note:  We do not use ADO for text files.  This should never
           //        be used.  Instead, dbttxtfile.pas should be used.
           raise Exception.Create('Application Error:  Text files are not supported through ADO.');
           {ADO_ConfigureConnectionForASCII(
             AADOConnection,
             ADirectory,
             False,
             False);}
         dttMSAccess:
           ADO_ConfigureConnectionForMSAccess(
             AADOConnection,
             ADatabaseName, // File path and name of .MDB file
             APassword);
         dttMSExcel:
           ADO_ConfigureConnectionForMSExcel(
             AADOConnection,
             ADatabaseName, // File path and name of .XLS file
             False);
         dttXML:
           // Note:  We do not use ADO for XML files.  This should never
           //        be used.  Instead, dbtxml.pas should be used.
           raise Exception.Create('Application Error:  XML files are not supported through ADO.');
        end; // end case
     AADOConnection.Connected := True;
     Result := AADOConnection.Connected;
  except on E:Exception do
     begin
       Result := False;
       AErrorMsg := E.Message;
     end;
  end;
end;

// Configure the ADO Connection for Paradox
procedure ADO_ConfigureConnectionForParadox(
  const AdoConnection: TAdoConnection;
  const Directory: String);
begin
  if not Assigned(AdoConnection) or AdoConnection.Connected then Exit;
  // Do not prompt for login
  AdoConnection.LoginPrompt := False;
  // Configure connection string
  AdoConnection.ConnectionString := ADO_ConnectionStringForParadox(Directory);
end;

// Configure the ADO Connection for DBF/FoxPro
procedure ADO_ConfigureConnectionForDBF(
  const AdoConnection: TAdoConnection;
  const Directory: String);
begin
  if not Assigned(AdoConnection) or AdoConnection.Connected then Exit;
  // Do not prompt for login
  AdoConnection.LoginPrompt := False;
  // Configure connection string
  AdoConnection.ConnectionString := ADO_ConnectionStringForDBF(Directory);
end;

procedure ADO_ConfigureConnectionForVisualFoxPro(
  const AdoConnection: TAdoConnection;
  const Database: String);
begin
  if not Assigned(AdoConnection) or AdoConnection.Connected then Exit;
  AdoConnection.LoginPrompt := False;
  AdoConnection.ConnectionString := ADO_ConnectionStringForVisualFoxPro(
     Database);

  { Notes:

    The only other alternative is to use a DSN.

    For version 8 and up its recommended to use the OLEDB driver as the
    ODBC driver does not recognize autoincrement fields and does not
    support stored procedures. The last ODBC update was for VFP 6
    (version 6.0.8167) which is also compatible with VFP 7.
    
   }
  
end;

// Configure the ADO Connection for ASCII text file
procedure ADO_ConfigureConnectionForASCII(
  const AdoConnection: TAdoConnection;
  const Directory: String;
  const AFixed: Boolean;
  const AFirstRowColumnNames: Boolean);
begin
  if not Assigned(AdoConnection) or AdoConnection.Connected then Exit;
  AdoConnection.LoginPrompt := False;
  AdoConnection.ConnectionString := ADO_ConnectionStringForASCII(
     Directory, AFixed, AFirstRowColumnNames);
end;

procedure ADO_ConfigureConnectionForMSExcel(
  const AdoConnection: TAdoConnection;
  const AFileName: String;
  const AFirstRowColumnNames: Boolean);
begin
  if not Assigned(AdoConnection) or AdoConnection.Connected then Exit;
  if not FileExists(AFileName) then
     // 'Cannot find file, %s'
     raise Exception.CreateFmt(cTXT0000026, [AFileName]);
     
  // Do not prompt for login
  AdoConnection.LoginPrompt := False;
  // Configure connection string
  AdoConnection.ConnectionString := ADO_ConnectionStringForMSExcel(
     AFileName,AFirstRowColumnNames);

  { Notes:

    SQL syntax "SELECT * FROM [sheet1$]". I.e. excel worksheet name
    followed by a "$" and wrapped in "[" "]" brackets.

    Check out the [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Jet\4.0\Engines\Excel]
    located registry REG_DWORD "TypeGuessRows". That's the key to not letting
    Excel use only the first 8 rows to guess the columns data type. Set this
    value to 0 to scan all rows. This might hurt performance.

    If the Excel workbook is protected by a password, you cannot open it for
    data access, even by supplying the correct password with your connection
    string. If you try, you receive the following error message:
    "Could not decrypt file."
  }
end;

procedure ADO_ConfigureConnectionForMSExcel2007(
  const AdoConnection: TAdoConnection;
  const AFileName: String;
  const AFirstRowColumnNames: Boolean);
begin
  if not Assigned(AdoConnection) or AdoConnection.Connected then Exit;
  if not FileExists(AFileName) then
     // 'Cannot find file, %s'
     raise Exception.CreateFmt(cTXT0000026, [AFileName]);
  // Do not prompt for login
  AdoConnection.LoginPrompt := False;
  AdoConnection.ConnectionString := ADO_ConnectionStringForMSExcel2007(
      AFileName, AFirstRowColumnNames);
end;

procedure ADO_ConfigureConnectionForMSAccess(
 const AdoConnection: TAdoConnection; const AFileName, APassword: String);
begin
  if not Assigned(AdoConnection) or AdoConnection.Connected then Exit;
  if not FileExists(AFileName) then
     // 'Cannot find file, %s'
     raise Exception.CreateFmt(cTXT0000026, [AFileName]);
  // Do not prompt for login
  AdoConnection.LoginPrompt := False;
  // Open the database exclusively
  AdoConnection.ConnectionString := ADO_ConnectionStringForMSAccess(
   AFileName, '', APassword);
end;

procedure ADO_ConfigureConnectionForMSAccess2007(
 const AdoConnection: TAdoConnection; const AFileName, APassword: String);
begin
  if not Assigned(AdoConnection) or AdoConnection.Connected then Exit;
  if not FileExists(AFileName) then
     // 'Cannot find file, %s'
     raise Exception.CreateFmt(cTXT0000026, [AFileName]);
  // Do not prompt for login
  AdoConnection.LoginPrompt := False;
  // Get connection string
  AdoConnection.ConnectionString := ADO_ConnectionStringForMSAccess2007(
   AFileName, '', APassword);
end;

procedure ADO_ConfigureConnectionForODBC(
  const AdoConnection: TAdoConnection;
  const DSN,
        UserName,
        Password: String);
begin
  if not Assigned(AdoConnection) or AdoConnection.Connected then Exit;
  // Do not prompt for login
  AdoConnection.LoginPrompt := False;
  // Open the database exclusively
  AdoConnection.ConnectionString :=
    ADO_ConnectionStringForODBC(DSN, UserName, Password);
end;

procedure ADO_ConfigureConnectionForOracle(
  const AdoConnection: TAdoConnection;
  const SID,
        UserName,
        Password: String);
begin
  if not Assigned(AdoConnection) or AdoConnection.Connected then Exit;
  // Do not prompt for login
  AdoConnection.LoginPrompt := False;
  // Open the database
  AdoConnection.ConnectionString :=
    ADO_ConnectionStringForOracle(SID, UserName, Password);
end;

procedure ADO_ConfigureConnectionForSQLServer(
  const AdoConnection: TAdoConnection;
  const Database,
        UserName,
        Password: String);
begin
  ADO_ConfigureConnectionForSQLServerEx(
   AdoConnection,
   'localhost',
   Database,
   UserName,
   Password);
end;

procedure ADO_ConfigureConnectionForSQLServerEx(
  const AdoConnection: TAdoConnection;
  const Server,
        Database,
        UserName,
        Password: String);
begin
  if not Assigned(AdoConnection) or AdoConnection.Connected then Exit;
  // Do not prompt for login
  AdoConnection.LoginPrompt := False;
  // Open the database
  AdoConnection.ConnectionString :=
    ADO_ConnectionStringForSQLServerEx(Database, Server, UserName, Password);
end;

{ ------------------------------------------------------------------------------
  Intent: Configure the SQLite Connection
  Crt By: Vishal Tiwari
  Crt Dt: 20 May 2016
  Params:
      @FDConnection - A FDConnection component which needs to connect to
                        SQLite file
      @Directory - A specified directory name where SQLite file is kept
  Assumption: Procedure gets called for all export in Data Dictionary
  ------------------------------------------------------------------------------}
procedure ConfigureConnectionForSQLite(
  const FDConnection: TFDConnection;
  const Directory: String);
begin
  if not Assigned(FDConnection) or FDConnection.Connected then Exit;
  // Do not prompt for login
  FDConnection.LoginPrompt := False;
  // Configure connection
  FDConnection.DriverName := 'SQLITE';
  FDConnection.Params.Values['Database'] := Directory;
  FDConnection.Connected := True;
end;

function ADO_GetVal(const AdoConnection: TAdoConnection;
                    const ASQL: string): Real;
begin
 Result := 0;
 if Assigned(AdoConnection) and (ASQL > '') then
 try
    with TADOQuery.Create(NIL) do
    try
       Connection := AdoConnection;
       SQL.Add(ASQL);
       Open;
       Result:= Fields[0].AsFloat;
    finally
       Free;
    end;
 except on E: Exception do
   RaiseGetValStandardException(E, ASQL, '');
 end;
end;

function ADO_GetValInt(const AdoConnection: TAdoConnection;
                       const ASQL: string): Integer;
begin
 Result := 0;
 if Assigned(AdoConnection) and (ASQL > '') then
 try
    with TADOQuery.Create(NIL) do
    try
       Connection := AdoConnection;
       SQL.Add(ASQL);
       Open;
       Result:= Fields[0].AsInteger;
    finally
       Free;
    end;
 except on E: Exception do
   RaiseGetValStandardException(E, ASQL, '');
 end;
end;

function ADO_GetValFmt(const AdoConnection: TAdoConnection;
                       const ASQL: string;
                       const Args: array of const): Real;
begin
 Result := ADO_GetVal(AdoConnection, IQMS.Common.NLS.IQFormat(ASQL, Args));
end;

function ADO_GetValIntFmt(const AdoConnection: TAdoConnection;
                       const ASQL: string;
                       const Args: array of const): Integer;
begin
 Result := Trunc(ADO_GetVal(AdoConnection, IQMS.Common.NLS.IQFormat(ASQL, Args)));
end;

function ADO_GetValStr(const AdoConnection: TAdoConnection;
                       const ASQL: string): String;
begin
 if Assigned(AdoConnection) and (ASQL > '') then
 try
    with TADOQuery.Create(NIL) do
    try
       Connection := AdoConnection;
       SQL.Add(ASQL);
       Open;
       Result:= Fields[0].AsString;
    finally
       Free;
    end;
 except on E: Exception do
   RaiseGetValStandardException(E, ASQL, '');
 end;
end;
                       
function ADO_GetValStrFmt(const AdoConnection: TAdoConnection;
                          const ASQL: string;
                          const Args: array of const): String;
begin
 Result := ADO_GetValStr(AdoConnection, IQMS.Common.NLS.IQFormat(ASQL, Args));
end;

function ADO_GetValArray(const AdoConnection: TAdoConnection;
 const ASQL: string): Variant;
var
  I: Integer;
begin
  try
    with TADOQuery.Create(NIL) do  {pass null to avoid list index out of bounds under thread execution during Free}
    try
       Connection := AdoConnection;
       SQL.Add(ASQL);
       Open;
       if not Eof then
       begin
         Result:= VarArrayCreate( [0, FieldCount - 1], varVariant);
         for I:= 0 to FieldCount - 1 do
            if Fields[ I ].DataType = ftFloat then
               Result[ I ]:= Fields[ I ].asFloat
            else if Fields[ I ].DataType = ftString then
               Result[ I ]:= Fields[ I ].asString
            else
               Result[ I ]:= Fields[ I ].Value;
       end
       else
         Result:= varNull;
    finally
       Free;
    end;
  except on E: Exception do
    RaiseGetValStandardException(E, ASQL, '');
  end;
end;

function ADO_GetValArrayFmt(const AdoConnection: TAdoConnection;
 const ASQL: string; const Args : array of const): Variant;
begin
  Result:= ADO_GetValArray(AdoConnection, IQFormat(ASQL, Args));
end;

function ADO_RunSQL(const AdoConnection: TAdoConnection;
                    const ASQL: string): Boolean;
begin
 Result := False;
 if Assigned(AdoConnection) and (ASQL > '') then
 try
    with TADOQuery.Create(NIL) do
    try
       Connection := AdoConnection;
       SQL.Add(ASQL);
       Result := ExecSQL() > 0;
    finally
       Free;
    end;
 except on E: Exception do
   RaiseGetValStandardException(E, ASQL, '');
 end;
end;

function ADO_RunSQLFmt(const AdoConnection: TAdoConnection;
                       const ASQL: string;
                       const Args: array of const): Boolean;
begin
  Result := ADO_RunSQL(AdoConnection, IQMS.Common.NLS.IQFormat(ASQL, Args));
end;

function ADO_GetValStrParam(const AdoConnection: TAdoConnection;
  const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): String;
var
   i: Integer;
   oParams: TParams;
   AParamName: String;
   AParamTypeStr: String;
   AParamType: TFieldType;
begin
  Result := '';

  if High(ParamsList) <> High(ParamValues) then
     raise Exception.Create('Application Error: Params and Values do not match.');

  with TADOQuery.Create(NIL) do
  try
     Connection := AdoConnection;
     oParams := TParams.Create;
     SQL.Add(ASQL);
     for i := 0 to High(ParamsList) do
       begin
         // AParamName AParamType
         _GetParamAndType(ParamsList[i], AParamName, AParamTypeStr, AParamType);
         _AddParam(oParams, AParamName, ParamValues[i], AParamType);
       end;
     Parameters.Assign(oParams);
     Open;
     Result := Fields[0].AsString;
  finally
     Free;
     if Assigned(oParams) then FreeAndNil(oParams);
  end;
end;

function ADO_GetValParam(const AdoConnection: TAdoConnection;
 const ASQL: string; const ParamsList: array of string;
 const ParamValues: array of Variant): Real;
var
   i: Integer;
   oParams: TParams;
   AParamName: String;
   AParamTypeStr: String;
   AParamType: TFieldType;
begin
  Result := 0;

  if High(ParamsList) <> High(ParamValues) then
     raise Exception.Create('Application Error: Params and Values do not match.');

  with TADOQuery.Create(NIL) do
  try
     Connection := AdoConnection;
     oParams := TParams.Create;
     SQL.Add(ASQL);
     for i := 0 to High(ParamsList) do
       begin
         // AParamName AParamType
         _GetParamAndType(ParamsList[i], AParamName, AParamTypeStr, AParamType);
         _AddParam(oParams, AParamName, ParamValues[i], AParamType);
       end;
     Parameters.Assign(oParams);
     Open;
     Result := Fields[0].AsFloat;
  finally
     Free;
     if Assigned(oParams) then FreeAndNil(oParams);
  end;
end;

function ADO_RunSQLParam(const AdoConnection: TAdoConnection;
  const ASQL: string; const ParamsList: array of string;
  const ParamValues: array of Variant): Boolean;
var
   i: Integer;
   oParams: TParams;
   AParamName: String;
   AParamTypeStr: String;
   AParamType: TFieldType;
begin
  Result := False;

  if High(ParamsList) <> High(ParamValues) then
     raise Exception.Create('Application Error: Params and Values do not match.');

  with TADOQuery.Create(NIL) do
  try
     Connection := AdoConnection;
     oParams := TParams.Create;
     SQL.Add(ASQL);
     for i := 0 to High(ParamsList) do
       begin
         _GetParamAndType(ParamsList[i], AParamName, AParamTypeStr, AParamType);
         _AddParam(oParams, AParamName, ParamValues[i], AParamType);
       end;
     Parameters.Assign(oParams);
     Result := ExecSQL() > 0;
  finally
     Free;
     if Assigned(oParams) then FreeAndNil(oParams);
  end;
end;

function DBX_RunSQLParamDataSet(const AdoConnection: TAdoConnection;
 const ASQL: string; const ASourceDataSet: TDataSet): Boolean;
var
   i: Integer;
   Param: TParameter;
   PName: String;
   Field: TField;
begin
  Result := False;

  if not Assigned(ASourceDataSet) then Exit;

  with TADOQuery.Create(NIL) do
  try
     Connection := AdoConnection;
     SQL.Add(ASQL);

     for i := 0 to Parameters.Count - 1 do
     begin
       Param := Parameters[i];
       PName := Param.Name;
       Field := ASourceDataSet.FindField(PName);
       if Assigned(Field) then
          //Parameters.AssignFieldValue(Field, Field.Value);
          Parameters.Items[i].Value := Field.Value;
     end;

     Result := ExecSQL() > 0;

  finally
     Free;
  end;
end;

procedure ADO_FillParams(const ASource: TDataSet; const AParams: TParameters);
var
   i: Integer;
   Param: TParameter;
   PName: String;
   Field: TField;
begin
  if not Assigned(ASource) or not Assigned(AParams) then Exit;
  
  for i := 0 to AParams.Count - 1 do
  begin
    Param := AParams[i];
    PName := Param.Name;
    Field := ASource.FindField(PName);
    if not Assigned(Field) then
       Continue;

    case Field.DataType of
       ftString, ftFixedChar, ftWideString, ftGuid:
         Param.DataType := ftString;
       ftMemo, ftFmtMemo, ftOraClob:
         Param.DataType := ftMemo;
       ftBlob, ftOraBlob, ftGraphic, ftParadoxOle, ftDBaseOle:
         Param.DataType := ftDBaseOle;
       ftSmallint, ftInteger, ftWord, ftBytes, ftVarBytes:
         Param.DataType := ftInteger;
       ftCurrency, ftBCD, ftFloat, ftFmtBCD:
         Param.DataType := ftFloat;
       ftDate, ftTime, ftDateTime, ftTimeStamp:
         Param.DataType := ftDateTime;
    else
      Param.DataType := Field.DataType;
    end;


    if (Field.DataType in [ftDate, ftTime, ftDateTime, ftTimeStamp]) then
       begin
         Param.Value  := Field.AsDateTime;
         if VarIsNull(Field.Value) or (Field.AsDateTime = 0) then
           Param.Value := Unassigned;
       end
    else
       begin
         if VarIsNull(Field.Value) then
           Param.Value := Unassigned
         else
           Param.Value := Field.Value;
         Param.Size := Field.DataSize;
         if Field.DataType in [ftFloat] then
            Param.NumericScale := Field.Size;
      end;
  end;
end;

function ADO_GetRecordCount(AQuery: TADOQuery): Integer;
var
   i: Integer;
   ASQLText: String;
begin
  Result := 0; // Initialization
  if Assigned(AQuery) then
  try
     with TADOQuery.Create(NIL) do
      try
         Connection := AQuery.Connection;
         ASQLText     := AQuery.SQL.Text;
         SQL.Add('select count(*) as IQCOUNT from');
         SQL.Add('(');
         SQL.Add(AQuery.SQL.Text);
         SQL.Add(')');
     
         // Assign parameters
         if (Parameters.Count > 0) and (Parameters.Count = AQuery.Parameters.Count) then
         for i := 0 to Parameters.Count - 1 do
             begin
               Parameters[i].DataType := AQuery.Parameters[i].DataType;
               Parameters[i].Direction := AQuery.Parameters[i].Direction;
             end;
     
         BeforeOpen:= AQuery.BeforeOpen;
         DataSource:= AQuery.DataSource;
         Open;
         Result := Fields[0].AsInteger;
         
      finally
         Free;
      end;
  except on E:Exception do
     // 'Encountered error while retrieving record count:'#13#13'%s'
     raise Exception.CreateFmt(cTXT0000197, [E.Message]);
  end;

end;

function ADO_GetRecordCount(ATable: TADOTable): Integer;
var
   ATableName: String;
   AExt: String;
begin
  Result := 0; // Initialization
  if Assigned(ATable) then
  try
     ATableName := ATable.TableName;
     if (ATableName = '') then Exit;

     // Is this a physical file?
     AExt := Trim(UpperCase(ExtractFileExt(ATableName)));
     // Only these database files support SQL.  For example, .CSV, does
     // not support SQL.
     if (AExt > '') and not IQMS.Common.StringUtils.StrInList(AExt, ['.DB','.DBF']) then
        begin
          Result := ATable.RecordCount;
          Exit;
        end;

     with TADOQuery.Create(NIL) do
      try
         Connection := ATable.Connection;
         SQL.Add('select count(*) as IQCOUNT from');

         // 01/21/2008 If the table name has spaces, such as a DBF file name,
         //            then wrap it in quotation marks.
         if (Pos(' ', ATableName) > 0) then
            SQL.Add('"' + ATableName + '"')
         else
            SQL.Add(ATableName);


         if (ATable.Filtered = TRUE) and
            (Trim(ATable.Filter) > '') then
            begin
              SQL.Add('where');
              SQL.Add(Format('%s', [ATable.Filter]));
            end;
         Open;
         Result := Fields[0].AsInteger;
      finally
         Free; // free query
      end;

  except on E:Exception do
     // 'Encountered error while retrieving record count:'#13#13'%s'
     raise Exception.CreateFmt(cTXT0000197, [E.Message]);
  end;

end;

end.
