unit IQMS.Common.SqlLiteImportExport;

interface
uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  IQMS.Common.DataLib;


type
  TSqlLiteDatasetArray = Array of TFDDataSet;
  TSqlLiteTableNames = Array of String;

//  AExportDataBaseName - Export database including full path and extention (.s3db) ex: c:\in\edi\editemplates.3db
//  Aset - Array of exported DataSets (TFDQuery or TFDTable)
//  Atablenames - Corresponding array of table names to be used in the SQLLite database

  TIQSqlLiteExport = class
  private
    { Private declarations }
    FExportDataBaseName:String;
    FExportConnection:TFDConnection;
    FQry:TFDQuery;
    FDataSets : TSqlLiteDatasetArray;
    FTableNames: TSqlLiteTableNames;
    FArrayLength:Integer;
    function GetDataSets:TSqlLiteDatasetArray;
    procedure EstablishSqlLiteConnection;
    procedure CreateSqlLiteQuery;
    procedure ExportDataSets;
    procedure DropTable(aTableName:String);
    procedure CloseConnection;
    procedure ExportDataSet(aDataSet:TFDDataSet; aTableName:String);
    procedure CreateStructrure(aDataSet:TFDDataSet; aTableName:String);
  protected
    { Protected declarations }
  public
    procedure Execute;
    constructor Create(AExportDataBaseName:String;
                       Aset:array of TFDDataSet;
                       Atablenames:array of String);
    destructor Destroy;
  published
    property DataSets : TSqlLiteDatasetArray read GetDataSets;
  end;

////////////////////////////////////////////////////////////////////////////////

//  AImportDataBaseName - Import database including full path and extention (.s3db) ex: c:\in\edi\editemplates.3db
//  ASqlLitetablenames - Names of the tables to import in the AImportDataBaseName
//  AOracletablenames - Names of the corresponding ORACLE tables into which you are importing the v_SqlLitetablenames

  TIQSqlLiteImport = class
  private
    { Private declarations }
    FImportDataBaseName:String;
    FImportConnection:TFDConnection;
    FOracleTableNames: TSqlLiteTableNames;
    FSqlLiteTableNames: TSqlLiteTableNames;
    FImportArrayLength:Integer;
    procedure EstablishSqlLiteConnection;
    procedure ImportDataSets;
    procedure ImportDataSet(aSqlLiteTableName, aOracleTableName:String);
    procedure CloseConnection;

  protected
    { Protected declarations }
  public
    procedure Execute;
    constructor Create(AImportDataBaseName:String;
                       ASqlLitetablenames:array of String;
                       AOracletablenames:array of String);
    destructor Destroy;
  published
  end;


implementation

procedure TIQSqlLiteExport.Execute;
begin
  EstablishSqlLiteConnection;
  CreateSqlLiteQuery;
  ExportDataSets;
  CloseConnection;
end;

function TIQSqlLiteExport.GetDataSets:TSqlLiteDatasetArray;
begin
 Result := FDataSets;
end;

constructor TIQSqlLiteExport.Create(AExportDataBaseName:String;
                                    ASet:array of TFDDataSet;
                                    Atablenames: array of String);
var
  i:integer;
begin
 DeleteFile(AExportDataBaseName);
 inherited Create;
 FExportDataBaseName:= AExportDataBaseName;
 FArrayLength := Length(ASet);
 SetLength(FDataSets, FArrayLength);
 SetLength(FTableNames, FArrayLength);
 for i:= 0 to FArrayLength - 1 do
 begin
   FDataSets[i] := ASet[i];
   FTableNames[i] := Atablenames[i];
 end;
end;

procedure TIQSqlLiteExport.EstablishSqlLiteConnection;
begin
  FExportConnection := TFDConnection.Create(nil);
  FExportConnection.DriverName := 'SQLITE';
  FExportConnection.Params.Values['Database'] := FExportDataBaseName;
  try
    // Establish the connection.
    FExportConnection.Open;
  except
    on E: EDatabaseError do
      ShowMessage('Problem Establishing SQL Lite Connection');
  end;
end;

procedure TIQSqlLiteExport.CreateSqlLiteQuery;
begin
  FQry := TFDQuery.Create(nil);
  FQry.Connection := FExportConnection;
end;

destructor TIQSqlLiteExport.Destroy;
begin
 FExportConnection.Free;
 FQry.Free;
 inherited;
end;

procedure TIQSqlLiteExport.ExportDataSets;
var
  i:integer;
  aDataSet:TFDDataSet;
  aTableName:String;
begin
 for i:= 0 to FArrayLength - 1 do
 begin
   aDataSet := FDataSets[i];
   aTableName := FTableNames[i];
   DropTable(aTableName);
   CreateStructrure(aDataSet, aTableName);
   ExportDataSet(aDataSet, aTableName);
 end;
end;

procedure TIQSqlLiteExport.ExportDataSet(aDataSet:TFDDataSet; aTableName:String);
var
  aFieldsCount:Integer;
  i:integer;
  aStr, aComma:String;
  aCounter:integer;
  aFieldName:String;
  ATable:TFDTable;
begin
  aDataSet.Open;

  ATable := TFDTable.Create(nil);
  try
    ATable.Connection := FExportConnection;
    ATable.Close;
    ATable.TableName := aTableName;
    ATable.Open;
    aFieldsCount := aDataSet.FieldCount;
    if aDataSet.Eof and aDataSet.Bof then exit;

    aDataSet.First;
    while not aDataSet.Eof do
    begin
      ATable.Insert;
      for i := 0 to aFieldsCount - 1 do
      begin
        ATable.FieldByName(ADataSet.Fields[i].FieldName).Value := aDataSet.FieldByName(ADataSet.Fields[i].FieldName).Value;
      end;
      ATable.Post;
      aDataSet.Next;
    end;


  finally
    ATable.Free;
  end;

{
  FQry.Close;
  FQry.Sql.Clear;

  aCounter:= 0;
  while not aDataSet.Eof do
  begin
    aCounter:= aCounter + 1;
    aStr := Format('insert into %s values (', [aTableName]);
    FQry.Sql.Add(aStr);
    aFieldsCount := aDataSet.FieldCount;
    for i := 0 to aFieldsCount - 1 do
    begin
      if i = aFieldsCount - 1 then
        aComma := ''
      else
        aComma := ',';
      aFieldName := aDataSet.Fields[i].FieldName;
      if      aDataSet.Fields[i] is TBCDField then
        aStr := Format('%d%s ', [aDataSet.FieldByName(aFieldName).asInteger, aComma])
      else if aDataSet.Fields[i] is TFMTBCDField then
        aStr := Format('%.6f%s ', [aDataSet.FieldByName(aFieldName).asFloat, aComma])
      else if aDataSet.Fields[i] is TFloatField then
        aStr := Format('%.6f%s ', [aDataSet.FieldByName(aFieldName).asFloat, aComma])
      else if aDataSet.Fields[i] is TStringField then
        aStr := Format('''%s''%s ', [StrTran(aDataSet.FieldByName(aFieldName).asString, '''', ''''''), aComma])
      else if aDataSet.Fields[i] is TDateField then
        aStr := Format('To_Date(''%s'', ''MM/DD/RRRR'')%s ', [FormatDateTime('mm/dd/yyyy', aDataSet.FieldByName(aFieldName).asDateTime), aComma])
      else if aDataSet.Fields[i] is TDateTimeField then
        aStr := Format('To_Date(''%s'', ''MM/DD/RRRR'' HH:MI:SS)%s ', [FormatDateTime('mm/dd/yyyy hh:nn:ss', aDataSet.FieldByName(aFieldName).asDateTime), aComma])
      else if aDataSet.Fields[i] is TMemoField then
        aStr := Format('''%s''%s ', [StrTran(aDataSet.FieldByName(aFieldName).asString, '''', ''''''), aComma]);
      FQry.Sql.Add(aStr);
    end;
    FQry.Sql.Add(');');
    FQry.ExecSQL;
    aDataSet.Next;
  end;
}
end;

procedure TIQSqlLiteExport.CreateStructrure(aDataSet:TFDDataSet; aTableName:String);
var
  aStr, aComma:String;
  aFieldsCount:Integer;
  i:integer;
  aFieldName:String;
  aSize:integer;
begin
  FQry.Sql.Clear;
  FQry.Sql.Add(Format('create table %s (', [aTableName]));
  aDataSet.Open;
  aFieldsCount := aDataSet.FieldCount;
  for i := 0 to aFieldsCount - 1 do
  begin
    if i = aFieldsCount - 1 then
      aComma := ''
    else
      aComma := ',';
    aFieldName := aDataSet.Fields[i].FieldName;
    aSize      := aDataSet.Fields[i].Size;
    if      aDataSet.Fields[i] is TBCDField then
      aStr := Format('%s number%s ', [aFieldName, aComma])
    else if aDataSet.Fields[i] is TFMTBCDField then
      aStr := Format('%s number%s ', [aFieldName, aComma])
    else if aDataSet.Fields[i] is TFloatField then
      aStr := Format('%s number%s ', [aFieldName, aComma])
    else if aDataSet.Fields[i] is TStringField then
      aStr := Format('%s varchar(%d)%s ', [aFieldName, aSize, aComma])
    else if aDataSet.Fields[i] is TDateTimeField then
      aStr := Format('%s date%s', [aFieldName, aComma])
    else if aDataSet.Fields[i] is TMemoField then
      aStr := Format('%s varchar(%d)%s ', [aFieldName, aSize, aComma]);
    FQry.Sql.Add(aStr);
  end;
  FQry.Sql.Add(');');
  FQry.ExecSQL;
end;

procedure TIQSqlLiteExport.DropTable(aTableName:String);
begin
  FQry.Close;
  FQry.Sql.Clear;
  FQry.Sql.Add(Format('select count(*) as cnt from sqlite_master where upper(name) = ''%s''', [UpperCase(aTableName)]));
  FQry.Open;

  if FQry.FieldByName('cnt').asFloat <> 0 then
  begin
    FQry.Close;
    FQry.Sql.Clear;
    FQry.Sql.Add(Format('drop table %s ', [aTableName]));
    FQry.ExecSQL;
 end;
end;

procedure TIQSqlLiteExport.CloseConnection;
begin
  FExportConnection.Close;
  FExportConnection.Free;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TIQSqlLiteImport.Execute;
begin
  EstablishSqlLiteConnection;
  ImportDataSets;
  CloseConnection;
end;



constructor TIQSqlLiteImport.Create(AImportDataBaseName:String;
                       ASqlLitetablenames:array of String;
                       AOracletablenames:array of String);

var
  i:integer;
begin
 if not FileExists(AImportDataBaseName) then
   raise exception.create(Format('%s not found', [AImportDataBaseName]));

 inherited Create;
 FImportDataBaseName:= AImportDataBaseName;
 FImportArrayLength := Length(ASqlLitetablenames);
 SetLength(FOracleTableNames, FImportArrayLength);
 SetLength(FSqlLiteTableNames, FImportArrayLength);
 for i:= 0 to FImportArrayLength - 1 do
 begin
   FSqlLiteTableNames[i] := ASqlLitetablenames[i];
   FOracleTableNames[i] := AOracletablenames[i];
 end;
end;

procedure TIQSqlLiteImport.EstablishSqlLiteConnection;
begin
  FImportConnection := TFDConnection.Create(nil);
  FImportConnection.DriverName := 'SQLITE';
  FImportConnection.Params.Values['Database'] := FImportDataBaseName;
  try
    // Establish the connection.
    FImportConnection.Open;
  except
    on E: EDatabaseError do
      ShowMessage('Problem Establishing SQL Lite Connection');
  end;
end;

destructor TIQSqlLiteImport.Destroy;
begin
 FImportConnection.Free;
 inherited;
end;

procedure TIQSqlLiteImport.ImportDataSets;
var
  i:integer;
  aSqlLiteTableName, aOracleTableName:String;
begin
  for i:= 0 to FImportArrayLength - 1 do
  begin
    aSqlLiteTableName := FSqlLiteTableNames[i];
    aOracleTableName := FOracleTableNames[i];
    ImportDataSet(aSqlLiteTableName, aOracleTableName);
  end;
 end;

procedure TIQSqlLiteImport.ImportDataSet(aSqlLiteTableName, aOracleTableName:String);
var
  aQry:TFDQuery;
  aTable:TFDTable;
  aFieldsCount, i:Integer;
  aId:Real;
begin
  aQry := TFDQuery.Create(nil);
  aTable := TFDTable.Create(nil);
  try
     aQry.Connection := FImportConnection;
     aTable.ConnectionName := 'IQFD';
     aTable.TableName := UpperCase(aOracleTableName);
     ATable.Open;
     aQry.Sql.Add(Format('select count(*) as cnt from sqlite_master where upper(name) = ''%s''', [UpperCase(aSqlLiteTableName)]));
     aQry.Open;

     if aQry.FieldByName('cnt').asFloat <> 0 then
     begin
       aQry.Close;
       aQry.Sql.Clear;
       aQry.Sql.Add(Format('select * from %s', [aSqlLiteTableName]));
       aQry.Open;

       aFieldsCount := aQry.FieldCount;
       while not aQry.Eof do
       begin
         ATable.Insert;
         for i := 0 to aFieldsCount - 1 do
         begin
           if UpperCase(AQry.Fields[i].FieldName) = 'ID' then
           begin
             aId := GetNextID(UpperCase(aOracleTableName));
             ATable.FieldByName(AQry.Fields[i].FieldName).asFloat := aId;
           end
           else
             ATable.FieldByName(AQry.Fields[i].FieldName).Value := aQry.FieldByName(AQry.Fields[i].FieldName).Value;
         end;
         ATable.Post;
         aQry.Next;
       end;
      end;
  finally
    aQry.Free;
    aTable.Free;
  end;
end;

procedure TIQSqlLiteImport.CloseConnection;
begin
  FImportConnection.Close;
  FImportConnection.Free;
end;


 end.
