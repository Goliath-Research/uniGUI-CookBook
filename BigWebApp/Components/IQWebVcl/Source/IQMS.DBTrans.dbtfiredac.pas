unit IQMS.DBTrans.dbtfiredac;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  IQMS.DBTrans.dbttypes;

/// <summary> Initialize FireDAC connection. </summary>
function InitConnection(const AFDConnection: TFDConnection;
  const ADatabaseName: String;
  const ATableType: TCustomTableType;
  const AUserName,
  APassword: String;
  var AErrorMsg: String): Boolean;

/// <summary> Assign ConnectionName = IQFD to all database components owned by passed owner. </summary>
procedure AssignDefaultConnectionName( AOwner: TComponent );
  
// TODO: Configure the FireDAC Connection for Paradox
// procedure FireDAC_ConfigureConnectionForParadox(
// const AFDConnection: TFDConnection;
// const Directory: String);

// <summary> Configure the FireDAC Connection for DBF/FoxPro. </summary>
procedure FireDAC_ConfigureConnectionForDBF(
  const AFDConnection: TFDConnection;
  const ADatabaseName: String);

// TODO: Configure the FireDAC Connection for Visual FoxPro
// procedure FireDAC_ConfigureConnectionForVisualFoxPro(
// const AFDConnection: TFDConnection;
// const ADatabaseName: String);

// TODO: Configure the FireDAC Connection for ASCII text file
// procedure FireDAC_ConfigureConnectionForASCII(
// const AFDConnection: TFDConnection;
// const Directory: String; // folder containing the files
// const AFixed: Boolean;  // is this "fixed width"; pass False for comma-delimited
// const AFirstRowColumnNames: Boolean);

// TODO: Configure the FireDAC Connection for MS Excel
// procedure FireDAC_ConfigureConnectionForMSExcel(
// const AFDConnection: TFDConnection;
// const AFileName: String;
// const AFirstRowColumnNames: Boolean);

// TODO: Configure the FireDAC Connection for MS Excel 2007
// procedure FireDAC_ConfigureConnectionForMSExcel2007(
// const AFDConnection: TFDConnection;
// const AFileName: String;
// const AFirstRowColumnNames: Boolean);

// TODO: Configure the FireDAC Connection for Microsoft Access
// procedure FireDAC_ConfigureConnectionForMSAccess(
// const AFDConnection: TFDConnection;
// const AFileName, // File path and name of .MDB file
// APassword: String);

// TODO: Configure the FireDAC Connection for Microsoft Access 2007
// procedure FireDAC_ConfigureConnectionForMSAccess2007(
// const AFDConnection: TFDConnection;
// const AFileName, // File path and name of .MDB file
// APassword: String);

// TODO: Configure the FireDAC Connection for ODBC
// procedure FireDAC_ConfigureConnectionForODBC(
// const AFDConnection: TFDConnection;
// const DSN,
// UserName,
// Password: String);

// TODO: Configure the FireDAC Connection for Oracle
// procedure FireDAC_ConfigureConnectionForOracle(
// const AFDConnection: TFDConnection;
// const SID,
// UserName,
// Password: String);

// TODO: Configure the FireDAC Connection for SQL Server
// procedure FireDAC_ConfigureConnectionForSQLServer(
// const AFDConnection: TFDConnection;
// const Database, // SQL Server database name (e.g., 'Shipnet2000')
// UserName,
// Password: String);

implementation

function InitConnection(const AFDConnection: TFDConnection;
  const ADatabaseName: String;
  const ATableType: TCustomTableType;
  const AUserName,
  APassword: String;
  var AErrorMsg: String): Boolean;
begin
  Result := False;
  if Assigned(AFDConnection) and not AFDConnection.Connected then
    begin
      case ATableType of
        dttParadox:
          Exit(False) { TODO };
        dttDBase:
          FireDAC_ConfigureConnectionForDBF(AFDConnection,
            ADatabaseName);
        dttFoxPro:
          Exit(False) { TODO };
        dttASCII:
          Exit(False) { TODO };
        dttMSAccess:
          Exit(False) { TODO };
        dttMSExcel:
          Exit(False) { TODO };
        dttXML:
          Exit(False) { TODO };
      else
        raise Exception.Create
          ('Application Error:  Invalid table type for FireDAC connection.');
      end;
      AFDConnection.Connected := True;
      Result := AFDConnection.Connected;
    end;
end;

procedure FireDAC_ConfigureConnectionForDBF(
  const AFDConnection: TFDConnection;
  const ADatabaseName: String);
begin
  if Assigned(AFDConnection) then
    AFDConnection.ConnectionString := Format(
      'DriverID=ADS;ServerTypes=Local;TableType=VFP;Database=%s',
      [ADatabaseName]);
end;


procedure AssignDefaultConnectionName( AOwner: TComponent );
var
  I: Integer;
begin
  for I:= 0 to AOwner.ComponentCount - 1 do
    if (AOwner.Components[ I ] is TFDRdbmsDataSet) then with AOwner.Components[ I ] as TFDRdbmsDataSet do
    begin
       Connection:= nil;
       ConnectionName:= 'IQFD';
    end
end;


end.
