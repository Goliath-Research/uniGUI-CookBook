unit dbtexcel;

(* ***************************************************************************
  Export data to Excel.
  This unit provides alternative methods for exporting data to Excel.
  With this you can create a new Excel spreadsheet for a given TDBGrid
  or TDataSet.  And you can also add spreadsheets to an existing file,
  as long as the sheet name is unique.  This uses the ADOX_TLB file,
  which does require an ISAM DLL be installed and registered properly,
  the same way ADO does.
  *************************************************************************** *)

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  ComCtrls,
  DB,
  IniFiles,
  Buttons,
  dbgrids,
  ADOX_TLB,
  ADODB,
  Generics.Collections,
  Wwdbigrd,
  Wwdbgrid,
  Variants,
  ActiveX;
   { TODO -omugdha : Dependancy
  dbtexcel_prnoptions;   }

// Exports a DBGrid to Excel
procedure ExportDBGridToExcel(AGrid: TDBGrid;
  AFileName, ASheetName, AProgressMessage: string;
  ARecordCount: Integer = 0); overload;
procedure ExportDBGridToExcel(AGrid: TwwDBGrid;
  AFileName, ASheetName, AProgressMessage: string;
  ARecordCount: Integer = 0); overload;
// Exports a DataSet to Excel
procedure ExportDataSetToExcel(ADataSet: TDataSet;
  AFileName, ASheetName, AProgressMessage: string);

// Outputs a group of datasets, along with the sheet name for each,
// to a single Excel spreadsheet.  Multiple datasets can be placed
// on one sheet name by providing the same sheet name for the given
// dataset within the array.  This method uses DCOM, so
// Excel must first be installed on the local machine.
procedure ExportDataSetsToExcel(const ADataSets: array of TDataSet;
  const ASheetNames: array of string);
procedure ExportDataSetsToExcelB(const ADataSets: array of TDataSet;
  const ASheetNames: array of string; const AOptions: TExcelPrintOptions);

function MSExcelVersion: Integer;

function GetExcelColumnName(AColumnNumber: Integer): string;


const
  // Note:  According to their Web site the new value is 1048576,
  // but this is doesn't actually work in real life.
  EXCEL_MAX_ROWS_ALLOWED: Integer = 65536;
  EXCEL_MAX_COLS_ALLOWED: Integer = 16384;

{$REGION 'TExcelExportAssistant Declaration'}


type
  { TExcelExportFieldCargo }
  TExcelExportFieldCargo = class
    Field: TField;
    Width: Double;
    Column: Integer;
    ColumnName: string;
    DisplayLabel: string;
    constructor Create(AField: TField; AColumn: Integer);
  end;

  { TExcelExportDataSetItem }
  TExcelExportDataSet = class(TCollectionItem)
  strict private
    { Private declarations }
    FDataSet: TDataSet;
    FSheetName: string;
    FRowCount: Integer;
    FDataSheet: OLEVariant;
  public
    { Public declarations }
    constructor Create(Collection: TCollection); override;
    property DataSet: TDataSet read FDataSet write FDataSet;
    property SheetName: string read FSheetName write FSheetName;
    property RowCount: Integer read FRowCount write FRowCount;
    property DataSheet: OLEVariant read FDataSheet write FDataSheet;
  end;

  { TExcelExportDataSets }
  TExcelExportDataSets = class(TCollection)
  strict private
    { Private declarations }
    function GetItems(Index: Integer): TExcelExportDataSet;
    procedure SetItems(Index: Integer; const Value: TExcelExportDataSet);
    function AddItem: TExcelExportDataSet;
  public
    { Public declarations }
    constructor Create;
    function Add(ADataSet: TDataSet; ASheetName: string)
      : TExcelExportDataSet;
    function Find(const ADataSet: TDataSet): TExcelExportDataSet;
    property Items[Index: Integer]: TExcelExportDataSet read GetItems
      write SetItems; default;
    function IndexOf(const ADataSet: TDataSet): Integer;
  end;

  { TExcelWorkSheetItems }
  TExcelWorkSheetItem = class(TCollectionItem)
  strict private
    { Private declarations }
    FWorkSheet: OLEVariant;
    FSheetName: string;
    FLastRow: Integer;
  public
    { Public declarations }
    constructor Create(Collection: TCollection); override;
    property WorkSheet: OLEVariant read FWorkSheet write FWorkSheet;
    property SheetName: string read FSheetName write FSheetName;
    property LastRow: Integer read FLastRow write FLastRow;
  end;

  { TExcelWorkSheetItems }
  TExcelWorkSheetItems = class(TCollection)
  strict private
    { Private declarations }
    function GetItems(Index: Integer): TExcelWorkSheetItem;
    procedure SetItems(Index: Integer; const Value: TExcelWorkSheetItem);
    function AddItem: TExcelWorkSheetItem;
  public
    { Public declarations }
    constructor Create;
    function Add(const AWorkSheet: OLEVariant; const ASheetName: string):
      TExcelWorkSheetItem;
    function Find(const ASheetName: String): TExcelWorkSheetItem;
    property Items[Index: Integer]: TExcelWorkSheetItem read GetItems
      write SetItems; default;
    function IndexOf(const ASheetName: string): Integer;
  end;

  { TExcelExportAssistant }
  TExcelExportAssistant = class(TComponent)
  strict private
    { Private declarations }
    FDataSets: TExcelExportDataSets;
    FWorkSheets: TExcelWorkSheetItems;
    function GetFieldValue(const AField: TField): string;
    procedure ClearDataSetList;
    function IndexOfDataSet(ADataSet: TDataSet): Integer;
    procedure AddWorkSheets;
    procedure ClearWorkSheetList;
    procedure GetNextRangeStart(const ASheetName: string; var ARange: string;
      var ANextRow: Integer);
    procedure FormatTitles(const ADataSheet: OLEVariant; const ARange: string);
    procedure AutoSize(const ADataSheet: OLEVariant; const ARange: string);
  private
    FOptions: TExcelPrintOptions;
  protected
    { Protected declarations }
    Excel: OLEVariant;
    WorkBook: OLEVariant;
    procedure ProcessDataSet(ADataSetIndex: Integer);
    procedure Connect;
    procedure Disconnect;
    procedure Show;
    function IsConnected: Boolean;
  published
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure Add(const ADataSet: TDataSet; const ASheetName: string);
    procedure Execute;
    procedure Reset;
    property Options: TExcelPrintOptions read FOptions;
  end;

{$ENDREGION 'TExcelExportAssistant Declaration'}

implementation

uses
  ComObj,
  IQMS.DBTrans.dbtado,
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.ProgressDialog,
  IQMS.Common.RecordCount,
  IQMS.Common.Registry,
  IQMS.Common.Screen,
  IQMS.Common.StringUtils,
  Math,
  IQMS.Common.PanelMsg,
  Printers,
  prn_share,
  StrUtils;

{$REGION 'Internal constants, types, and methods' }


const
  xlLeft = - 4131;
  xlCenter = - 4108;
  xlRight = - 4152;
  xlPortrait = 1;
  xlLandscape = 2;
  cExcelInch: Integer = 72;

type
  { TScrollEvents }
  TScrollEvents = class
    BeforeScroll_Event: TDataSetNotifyEvent;
    AfterScroll_Event: TDataSetNotifyEvent;
    AutoCalcFields_Property: Boolean;
  end;

  // we make a call to the "DisableControls" procedure and then disable the "BeforeScroll" and
  // "AfterScroll" events and the "AutoCalcFields" property.
procedure DisableDependencies(DataSet: TDataSet;
  var ScrollEvents: TScrollEvents);
begin
  with DataSet do
    begin
      DisableControls;
      ScrollEvents := TScrollEvents.Create();
      with ScrollEvents do
        begin
          BeforeScroll_Event := BeforeScroll;
          AfterScroll_Event := AfterScroll;
          AutoCalcFields_Property := AutoCalcFields;
          BeforeScroll := nil;
          AfterScroll := nil;
          AutoCalcFields := False;
        end;
    end;
end;

// we make a call to the "EnableControls" procedure and then restore
// the "BeforeScroll" and "AfterScroll" events and the "AutoCalcFields" property.
procedure EnableDependencies(DataSet: TDataSet; ScrollEvents: TScrollEvents);
begin
  with DataSet do
    begin
      EnableControls;
      with ScrollEvents do
        begin
          BeforeScroll := BeforeScroll_Event;
          AfterScroll := AfterScroll_Event;
          AutoCalcFields := AutoCalcFields_Property;
        end;
    end;
end;

function GetAsString(AField: TField): string;
begin
  Result := '';
  if not Assigned(AField) then
    Exit;
  Result := StrUtils.LeftStr(AField.AsString, 255);
end;

function ValidateRecordCount(const ARecordCount: Integer): Boolean;
begin
  if (ARecordCount > EXCEL_MAX_ROWS_ALLOWED) then
    // 'Dataset contains excessive number of records.
    // Microsoft Excel can have a maxiumum of 65,536 rows.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000065);
  Result := True;
end;

function GetExcelColumnWidth(const AColumnText: string): Real;
const
  c_multiplier: Double = 0.1925892857142857;
var
  APixels: Integer;
  AFont: TFont;
begin
  AFont := TFont.Create;
  try
    AFont.Name := IQMS.Common.Screen.SystemFontName;
    AFont.Size := 10;
    APixels := IQMS.Common.Screen.GetTextWidthPixels(AColumnText, AFont);
    Result := APixels * c_multiplier;
  finally
    AFont.Free;
  end;
end;

{$ENDREGION 'Internal constants, types, and methods' }


procedure ExportDBGridToExcel(AGrid: TDBGrid; AFileName, ASheetName,
  AProgressMessage: string; ARecordCount: Integer);
var
  ACatalog: _Catalog;
  ATable: _Table;
  AColumn: _Column;
  i: Integer;
  AConnectionString: AnsiString;
  ADOConnection: TADOConnection;
  ADOQuery: TADOQuery;
  AScrollEvents: TScrollEvents;
  SavePlace: TBookmark;
  ADataSet: TDataSet;
  AField: TField;
  AMax: Integer;
  hPrg: TProgressDialog; // declared in IQMS.Common.ProgressDialog.pas
  AActualRowCount: Integer;
begin
  if not Assigned(AGrid) then
    Exit;

  // Check if ISAM dll exists
  IQMS.DBTrans.dbtado.CheckExcelISAMExists;

  DeleteFile(AFileName);

  // WorkBook creation (database)
  ACatalog := CoCatalog.Create;
  try
    AConnectionString := Format('Provider=Microsoft.Jet.OLEDB.4.0; ' +
      'Data Source=%s;Extended Properties=Excel 8.0', [AFileName]);
    ACatalog.Set_ActiveConnection(AConnectionString);
    // ACatalog.Set_ActiveConnection('Provider=Microsoft.Jet.OLEDB.4.0; Data Source=' +
    // AFileName + ';Extended Properties=Excel 8.0');
    // WorkSheet creation (table)
    ATable := CoTable.Create;
    try
      ASheetName := IQMS.Common.StringUtils.StrTran(ASheetName, ' ', '_');
      ATable.Set_Name(ASheetName);
      // Columns creation (fields)
      ADataSet := AGrid.DataSource.DataSet;
      if not Assigned(ADataSet) then
        Exit;
      ADataSet.First;

      // Validate the dataset size.  Excel has a limitation.
      AMax := ARecordCount;
      if AMax <= 0 then
        AMax := IQMS.Common.RecordCount.GetRecordCount(ADataSet);
      ValidateRecordCount(AMax);

      if AGrid.Columns.Count > EXCEL_MAX_COLS_ALLOWED then
        raise Exception.CreateFmt(
          'The maximum number of columns (%d) permitted in an Excel spreadsheet has been exceeded.',
          [EXCEL_MAX_COLS_ALLOWED]);

      for i := 0 to AGrid.Columns.Count - 1 do
        if AGrid.Columns.Items[i].Visible then
          begin
            // AColumn := nil;
            AColumn := CoColumn.Create;
            try
              with AColumn do
                begin
                  Set_Name(AGrid.Columns.Items[i].Title.Caption);
                  Set_Type_(adVarWChar);
                end;
              // add column to table
              ATable.Columns.Append(AColumn, adVarWChar, 20);
            finally
              AColumn := nil;
            end;
          end;

      // add table to database
      ACatalog.Tables.Append(ATable);

    finally
      ATable := nil;
    end;
  finally
    ACatalog := nil;
  end;

  // exporting
  ADOConnection := TADOConnection.Create(nil);
  try
    ADOConnection.LoginPrompt := False;
    ADOConnection.ConnectionString := AConnectionString;
    // 'Provider=Microsoft.Jet.OLEDB.4.0; Data Source=' + AFileName +
    // ';Extended Properties=Excel 8.0';
    ADOQuery := TADOQuery.Create(nil);
    try
      ADOQuery.Connection := ADOConnection;
      ADOQuery.SQL.Text := 'SELECT * FROM [' + ASheetName + '$]';
      ADOQuery.Open;
      AActualRowCount := 0;
      DisableDependencies(AGrid.DataSource.DataSet, AScrollEvents);
      try
        SavePlace := AGrid.DataSource.DataSet.GetBookmark;
        try
          hPrg := hProgressDlg(ADataSet.Owner, AMax, AProgressMessage);
          try
            hPrg.CancelBtnEnabled := True;
            ADataSet.First;
            while not ADataSet.Eof do
              begin
                if hPrg.CheckProgressAborted then
                  Break;
                ADOQuery.Append;
                ADOQuery.Edit;
                for i := 0 to AGrid.Columns.Count - 1 do
                  if AGrid.Columns.Items[i].Visible then
                    begin
                      AField := ADataSet.FieldByName
                        (AGrid.Columns.Items[i].FieldName);
                      ADOQuery.FieldByName(AGrid.Columns.Items[i].Title.Caption)
                        .AsString := GetAsString(AField);
                    end;
                ADOQuery.Post;
                ADataSet.Next;
                hPrg.StepProgress; // inc progress
                Inc(AActualRowCount);
                // 04/25/2014 Ensure we don't hit a memory limit
                if AActualRowCount >= EXCEL_MAX_ROWS_ALLOWED then
                  Break;
              end;

            // Set final position
            hPrg.Position := AMax;
          finally
            if Assigned(hPrg) then
              FreeAndNil(hPrg);
          end;
        finally
          AGrid.DataSource.DataSet.GotoBookmark(SavePlace);
          AGrid.DataSource.DataSet.FreeBookmark(SavePlace);
        end;
      finally
        FreeAndNil(ADOQuery);
      end;
    finally
      EnableDependencies(AGrid.DataSource.DataSet, AScrollEvents);
    end;
  finally
    FreeAndNil(ADOConnection);
  end;
end;

procedure ExportDBGridToExcel(AGrid: TwwDBGrid; AFileName, ASheetName,
  AProgressMessage: string; ARecordCount: Integer);
var
  ACatalog: _Catalog;
  ATable: _Table;
  AColumn: _Column;
  i: Integer;
  AConnectionString: AnsiString;
  ADOConnection: TADOConnection;
  ADOQuery: TADOQuery;
  AScrollEvents: TScrollEvents;
  SavePlace: TBookmark;
  ADataSet: TDataSet;
  AField: TField;
  AMax: Integer;
  hPrg: TProgressDialog; // declared in IQMS.Common.ProgressDialog.pas
  AColCount,
    AActualRowCount: Integer;
begin
  if not Assigned(AGrid) then
    Exit;
  ADataSet := AGrid.DataSource.DataSet;
  if not Assigned(ADataSet) then
    Exit;

  // Check if ISAM dll exists
  IQMS.DBTrans.dbtado.CheckExcelISAMExists;

  DeleteFile(AFileName);

  // WorkBook creation (database)
  ACatalog := CoCatalog.Create;
  try
    AConnectionString := Format('Provider=Microsoft.Jet.OLEDB.4.0; ' +
      'Data Source=%s;Extended Properties=Excel 8.0', [AFileName]);
    ACatalog.Set_ActiveConnection(AConnectionString);

    // ACatalog.Set_ActiveConnection('Provider=Microsoft.Jet.OLEDB.4.0; Data Source=' +
    // AFileName + ';Extended Properties=Excel 8.0');
    // WorkSheet creation (table)
    ATable := CoTable.Create;
    try
      ASheetName := IQMS.Common.StringUtils.StrTran(ASheetName, ' ', '_');
      ATable.Set_Name(ASheetName);
      // Columns creation (fields)
      ADataSet.First;
      // Validate the dataset size.  Excel has a limitation.
      AMax := ARecordCount;
      if AMax <= 0 then
        AMax := IQMS.Common.RecordCount.GetRecordCount(ADataSet);
      ValidateRecordCount(AMax);

      AColCount := AGrid.GetColCount;
      if AColCount > EXCEL_MAX_COLS_ALLOWED then
        raise Exception.CreateFmt(
          'The maximum number of columns (%d) permitted in an Excel spreadsheet has been exceeded.',
          [EXCEL_MAX_COLS_ALLOWED]);

      for i := 0 to AColCount - 1 do
        if AGrid.Columns[i].Visible then
          begin
            AColumn := CoColumn.Create;
            try
              with AColumn do
                begin
                  Set_Name(AGrid.Columns[i].FieldName);
                  Set_Type_(adVarWChar);
                end;
              // add column to table
              ATable.Columns.Append(AColumn, adVarWChar, 20);
            finally
              AColumn := nil;
            end;
          end;

      // add table to database
      try
        ACatalog.Tables.Append(ATable);
      except
      end;
    finally
      ATable := nil;
    end;
  finally
    ACatalog := nil;
  end;

  // exporting
  ADOConnection := TADOConnection.Create(nil);
  try
    ADOConnection.LoginPrompt := False;
    ADOConnection.ConnectionString := AConnectionString;
    // 'Provider=Microsoft.Jet.OLEDB.4.0; Data Source=' + AFileName +
    // ';Extended Properties=Excel 8.0';
    ADOQuery := TADOQuery.Create(nil);
    try
      ADOQuery.Connection := ADOConnection;
      ADOQuery.SQL.Text := 'SELECT * FROM [' + ASheetName + '$]';
      ADOQuery.Open;
      AActualRowCount := 0;
      DisableDependencies(AGrid.DataSource.DataSet, AScrollEvents);
      try
        SavePlace := AGrid.DataSource.DataSet.GetBookmark;
        try
          hPrg := hProgressDlg(ADataSet.Owner, AMax, AProgressMessage);
          try
            hPrg.CancelBtnEnabled := True;
            Application.ProcessMessages;
            ADataSet.First;
            while not ADataSet.Eof do
              begin
                if hPrg.CheckProgressAborted then
                  Break;
                ADOQuery.Append;
                ADOQuery.Edit;
                for i := 0 to AColCount - 1 do
                  if AGrid.Columns[i].Visible then
                    begin
                      AField := ADataSet.FieldByName
                        (AGrid.Columns[i].FieldName);
                      ADOQuery.FieldByName(AGrid.Columns[i].FieldName)
                        .AsString := GetAsString(AField);
                    end;
                ADOQuery.Post;
                ADataSet.Next;
                hPrg.StepProgress; // inc progress
                Application.ProcessMessages;
                Inc(AActualRowCount);
                // 04/25/2014 Ensure we don't hit a memory limit
                if AActualRowCount >= EXCEL_MAX_ROWS_ALLOWED then
                  Break;
              end;

            // Set final position
            hPrg.Position := AMax;
          finally
            if Assigned(hPrg) then
              FreeAndNil(hPrg);
          end;
        finally
          AGrid.DataSource.DataSet.GotoBookmark(SavePlace);
          AGrid.DataSource.DataSet.FreeBookmark(SavePlace);
        end;
      finally
        EnableDependencies(AGrid.DataSource.DataSet, AScrollEvents);
      end;
    finally
      FreeAndNil(ADOQuery);
    end;
  finally
    FreeAndNil(ADOConnection);
  end;
end;

procedure ExportDataSetToExcel(ADataSet: TDataSet;
  AFileName, ASheetName, AProgressMessage: string);
var
  ACatalog: _Catalog;
  ATable: _Table;
  AColumn: _Column;
  AConnectionString: string;
  i: Integer;
  ADOConnection: TADOConnection;
  ADOQuery: TADOQuery;
  AScrollEvents: TScrollEvents;
  ABookmark: TBookmark;
  AMax: Integer;
  hPrg: TProgressDialog; // declared in IQMS.Common.ProgressDialog.pas
  AColCount, AActualRowCount: Integer;
begin
  // Check if ISAM dll exists
  IQMS.DBTrans.dbtado.CheckExcelISAMExists;

  // Validate the dataset size.  Excel has a limitation.
  AMax := IQMS.Common.RecordCount.GetRecordCount(ADataSet);
  ValidateRecordCount(AMax);

  // WorkBook creation (database)
  ACatalog := CoCatalog.Create;
  // Note:  This is a special connection string used for outputting data.
  // It will create the Excel file for you, if it doesn't exist.
  // Do not call IQMS.DBTrans.dbtado.ADO_ConnectionStringForMSExcel() for this task.
  AConnectionString := Format('Provider=Microsoft.Jet.OLEDB.4.0; ' +
    'Data Source=%s;Extended Properties=Excel 8.0', [AFileName]);
  ACatalog.Set_ActiveConnection(AConnectionString);
  // WorkSheet creation (table)
  ATable := CoTable.Create;
  ASheetName := IQMS.Common.StringUtils.StrTran(ASheetName, ' ', '_');
  ATable.Set_Name(ASheetName);

  // Columns creation (fields)
  AColCount := 0;
  ADataSet.First;
  for i := 0 to ADataSet.Fields.Count - 1 do
    if ADataSet.Fields[i].Visible then
      begin
        AColumn := CoColumn.Create;
        AColumn.Set_Name(ADataSet.Fields[i].FieldName);
        AColumn.Set_Type_(adVarWChar);
        // add column to table
        ATable.Columns.Append(AColumn, adVarWChar,
          Math.Max(20, ADataSet.Fields[i].Size));
        Inc(AColCount);
      end;

  if AColCount > EXCEL_MAX_COLS_ALLOWED then
    raise Exception.CreateFmt(
      'The maximum number of columns (%d) permitted in an Excel spreadsheet has been exceeded.',
      [EXCEL_MAX_COLS_ALLOWED]);

  // add table to database
  ACatalog.Tables.Append(ATable);

  AColumn := nil;
  ATable := nil;
  ACatalog := nil;

  // exporting
  ADOConnection := TADOConnection.Create(nil);
  ADOConnection.LoginPrompt := False;
  ADOConnection.ConnectionString := AConnectionString;
  // 'Provider=Microsoft.Jet.OLEDB.4.0; Data Source=' + AFileName +
  // ';Extended Properties=Excel 8.0';
  ADOQuery := TADOQuery.Create(nil);
  ADOQuery.Connection := ADOConnection;
  ADOQuery.SQL.Text := 'SELECT * FROM [' + StrUtils.ReplaceStr(ASheetName, ' ',
    '_') + '$]';
  ADOQuery.Open;
  AActualRowCount := 0;
  DisableDependencies(ADataSet, AScrollEvents);
  ABookmark := ADataSet.GetBookmark;
  try
    hPrg := hProgressDlg(ADataSet.Owner, AMax, AProgressMessage);
    hPrg.CancelBtnEnabled := True;
    ADataSet.First;
    while not ADataSet.Eof do
      begin
        if hPrg.CheckProgressAborted then
          Break;
        ADOQuery.Append;
        ADOQuery.Edit;
        for i := 0 to ADataSet.Fields.Count - 1 do
          if ADataSet.Fields[i].Visible then
            begin
              ADOQuery.FieldByName(ADataSet.Fields[i].FieldName).AsString :=
                GetAsString(ADataSet.Fields[i]);
            end;
        ADOQuery.Post;
        ADataSet.Next;
        hPrg.StepProgress; // inc progress
        Inc(AActualRowCount);
        // 04/25/2014 Ensure we don't hit a memory limit
        if AActualRowCount >= EXCEL_MAX_ROWS_ALLOWED then
          Break;
      end;

    // Set final position
    hPrg.Position := AMax;

  finally
    ADataSet.GotoBookmark(ABookmark);
    ADataSet.FreeBookmark(ABookmark);
    EnableDependencies(ADataSet, AScrollEvents);
    ADOQuery.Close;
    ADOConnection.Close;
    FreeAndNil(ADOQuery);
    FreeAndNil(ADOConnection);
    if Assigned(hPrg) then
      FreeAndNil(hPrg);
  end;
end;

procedure ExportDataSetsToExcel(const ADataSets: array of TDataSet;
  const ASheetNames: array of string);
begin
  ExportDataSetsToExcelB(ADataSets, ASheetNames, NIL);
end;

procedure ExportDataSetsToExcelB(const ADataSets: array of TDataSet;
  const ASheetNames: array of string; const AOptions: TExcelPrintOptions);
var
  i: Integer;
begin
  if High(ADataSets) <> High(ASheetNames) then
    raise Exception.Create
      ('Application Error:  Number of datasets does not match the number of sheet names.');
  // The TExcelExportAssistant is declared in this unit.
  with TExcelExportAssistant.Create(nil) do
    try
      for i := Low(ADataSets) to High(ADataSets) do
        Add(ADataSets[i], ASheetNames[i]);
      if Assigned(AOptions) then
        Options.CopyFrom(AOptions);
      Execute;
    finally
      Free;
    end;
end;

function MSExcelVersion: Integer;
var
  S: string;
  i: Integer;
begin
  Result := 0;
  with TIQRegistry.Create do
    try
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKey('Excel.Application\CurVer', False) then
        begin
          S := ReadString(''); // i.e., 'Excel.Application.10'
          S := IQMS.Common.StringUtils.GetToken(S, '.', 3);
          if S > '' then
            try
              i := StrToInt(S);
              Result := i; // 8 = 97, 9 = 2000, 10=2002
            except // suppress
            end;
        end;
    finally
      Free;
    end;
end;

function GetExcelColumnName(AColumnNumber: Integer): string;
var
  ADividend, AModulus: Integer;
  AColumnName: string;
begin
  ADividend := AColumnNumber;
  AColumnName := '';
  while (ADividend > 0) do
    begin
      AModulus := (ADividend - 1) mod 26;
      AColumnName := Chr(65 + AModulus) + AColumnName;
      ADividend := Trunc((ADividend - AModulus) / 26);
    end;
  Result := AColumnName;
end;

{$REGION 'TExcelExportAssistant'}

{ TExcelExportFieldCargo }

constructor TExcelExportFieldCargo.Create(AField: TField; AColumn: Integer);
begin
  Field := AField;
  Column := AColumn;
  ColumnName := GetExcelColumnName(AColumn);
  // Display Label
  DisplayLabel := AField.DisplayLabel;
  if AField.DisplayLabel = '' then
    DisplayLabel := Field.FieldName;
  // Default width
  if AField is TDateTimeField then
    Width := 18
  else
    Width := Math.Max(10, GetExcelColumnWidth(AField.DisplayLabel));
end;

{ TExcelExportAssistant }

constructor TExcelExportAssistant.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataSets := TExcelExportDataSets.Create;
  FWorkSheets := TExcelWorkSheetItems.Create;
  FOptions := TExcelPrintOptions.Create(Self);
  Excel := Unassigned;
  WorkBook := Unassigned;
end;

destructor TExcelExportAssistant.Destroy;
begin
  Reset;
  if Assigned(FDataSets) then
    FreeAndNil(FDataSets);
  if Assigned(FWorkSheets) then
    FreeAndNil(FWorkSheets);
  if Assigned(FOptions) then
    FreeAndNil(FOptions);
  inherited Destroy;
end;

procedure TExcelExportAssistant.Reset;
begin
  ClearDataSetList;
  ClearWorkSheetList;
  FOptions.Reset;
  Excel := Unassigned;
  WorkBook := Unassigned;
end;

procedure TExcelExportAssistant.ClearDataSetList;
begin
  if Assigned(FDataSets) then
    FDataSets.Clear;
end;

procedure TExcelExportAssistant.ClearWorkSheetList;
begin
  if Assigned(FWorkSheets) then
    FWorkSheets.Clear;
end;

procedure TExcelExportAssistant.Execute;
const
  C_MUTEX_NAME: string = 'TExcelExportAssistant.Execute';
var
  i: Integer;
  AMutex: Cardinal;
  AMSExcelWasAlreadyConnected: Boolean;
begin
  // Reset private variable which keeps track of
  // how many sheets have been added.
  AMSExcelWasAlreadyConnected := True;

  try
    AMutex := CreateMutex(nil, False, PWideChar(C_MUTEX_NAME));
    try
      // Set the screen cursor to an hour glass to show that
      // "something is happening"
      Screen.Cursor := crHourglass;
      // take ownership of our mutex
      if WaitforSingleObject(AMutex, INFINITE) = WAIT_OBJECT_0 then
        try
          // Prepare for threading
          CoInitialize(nil);

          AMSExcelWasAlreadyConnected := IsConnected;

          // Connect to Excel
          Connect;

          // Is something went wrong, exit now
          if not IsConnected then
            Exit;

          // Disable user editing while creating the new spreadsheet
          Excel.Interactive := False;

          AddWorkSheets;

          // Process each dataset, starting with the last one in the list
          for i := 0 to FDataSets.Count - 1 do
            ProcessDataSet(i);

          // Activate the new spreadsheet
          WorkBook.Worksheets[1].Activate;

          // Restore user editing
          Excel.Interactive := True;
          // Show Excel
          if FOptions.SendToPrinter then
            // WorkBook.PrintOut
            WorkBook.PrintOut(
              // From:=1,
              // To:=1,
              Copies := Printers.Printer.Copies,
              // Preview:=False,
              // PrintToFile:=False,
              // Collate:=True,
              // PrToFileName:='',
              ActivePrinter := prn_share.GetSelectedPrinterName,
              IgnorePrintAreas := False)
          else
            Show;

          // Clear internal variables and the connection to Excel
          WorkBook := Unassigned;
          Excel := Unassigned;

          // Close Excel if it was not already open and we are just printing.
          if not AMSExcelWasAlreadyConnected and FOptions.SendToPrinter then
            Disconnect;

        finally
          // Finalization
          CoUninitialize;
        end;
    finally
      // Release our mutex
      ReleaseMutex(AMutex);
      // Reset the cursor back to the default
      Screen.Cursor := crDefault;
    end;
  except
    on E: Exception do
      begin
        // Before raising exception, close our connection to Excel.
        Disconnect;
        raise;
      end;
  end;
end;

procedure TExcelExportAssistant.AddWorkSheets;
var
  i, x: Integer;
  o: OLEVariant;
begin
  // This method accomplishes the following objectives:
  // 1.) Adds the required worksheets to the new Excel spreadsheet
  // in the proper order.
  // 2.) Ensure that if there are multiple datasets on a single
  // worksheet that we can do that without getting an error.

  // Clear the work sheet list
  ClearWorkSheetList;

  // If we have a workbook, loop the dataset list and add unique
  // data sheets for each.  Do not add a data sheet if it already
  // exists.  Excel uses the data sheet name to enforce uniqueness.
  if not Variants.VarIsEmpty(WorkBook) then
    for i := FDataSets.Count - 1 downto 0 do
      begin
        // Get the index of the sheet name, if it exists.  If it does not
        // exist, then the value will be -1.
        x := FWorkSheets.IndexOf(FDataSets.Items[i].SheetName);
        // If not sheet of this name exists yet, then go ahead and add it.
        if (x = - 1) then
          begin
            // If this is our very first data sheet (in this new work book),
            // then we want to use the default data sheet that is first
            // created.  By default, new work books are opened with a new
            // data sheet.  Just rename it to our first data sheet.
            if (i = FDataSets.Count - 1) and
              (WorkBook.Worksheets.Count > 0) then
              begin
                o := WorkBook.Worksheets[1];
                o.Name := FDataSets.Items[i].SheetName
              end
              // We need to add a new data sheet and give it a unique name.
            else
              begin
                // Add the data sheet
                o := WorkBook.Worksheets.Add;
                // Give it a unique name.
                o.Name := FDataSets.Items[i].SheetName;
              end;

            // Improve speed by disabling printer communication
            if MSExcelVersion >= 14 then
              Excel.Application.PrintCommunication := False;
            // Orientation
            case FOptions.Orientation of
              xloPortrait:
                o.PageSetup.Orientation := xlPortrait;
              xloLandscape:
                o.PageSetup.Orientation := xlLandscape;
            end;

            // Margins
            o.PageSetup.LeftMargin := FOptions.InchesToPoints
              (FOptions.LeftMargin);
            o.PageSetup.RightMargin := FOptions.InchesToPoints
              (FOptions.RightMargin);
            o.PageSetup.TopMargin := FOptions.InchesToPoints
              (FOptions.TopMargin);
            o.PageSetup.BottomMargin := FOptions.InchesToPoints
              (FOptions.BottomMargin);
            o.PageSetup.HeaderMargin := FOptions.InchesToPoints
              (FOptions.HeaderMargin);
            o.PageSetup.FooterMargin := FOptions.InchesToPoints
              (FOptions.FooterMargin);

            // Fit columns to page
            case FOptions.Scaling of
              xlscNone:
                begin
                  o.PageSetup.Zoom := 100;
                end;
              xlscFitSheetOnePage:
                begin
                  o.PageSetup.Zoom := False;
                  o.PageSetup.FitToPagesWide := 1;
                  o.PageSetup.FitToPagesTall := 1;
                end;
              xlscFitColumnsOnePage:
                begin
                  o.PageSetup.Zoom := False;
                  o.PageSetup.FitToPagesWide := 1;
                  o.PageSetup.FitToPagesTall := False;
                end;
              xlscFitRowsOnePage:
                begin
                  o.PageSetup.Zoom := False;
                  o.PageSetup.FitToPagesWide := False;
                  o.PageSetup.FitToPagesTall := 1;
                end;
            end;

            // Restore printer communication
            if MSExcelVersion >= 14 then
              Excel.Application.PrintCommunication := True;

            // Add the new data sheet to our internal list
            FWorkSheets.Add(o, o.Name);
          end
          // The sheet exists!  So just set our variable to that sheet.
        else
          o := FWorkSheets.Items[x].WorkSheet;
        // Whatever we decided above, we will still get a data sheet out
        // of it.  Assign the data sheet (new or existing) to our dataset.
        FDataSets.Items[i].DataSheet := o;
      end;
end;

procedure TExcelExportAssistant.ProcessDataSet(ADataSetIndex: Integer);
var
  ARangeStart: string;
  ARangeRowStart: Integer;
  ADataSheet: OLEVariant;
  i, x, ARecordCount: Integer;
  AWorkSheetItem: TExcelWorkSheetItem;
  ARow, ACol: Integer;
  AColumns: TList<TExcelExportFieldCargo>;
  ADataSet: TDataSet;
  ASheetName: string;
  AActualRowCount: Integer;
  AScrollEvents: TScrollEvents;
  hPrg: TProgressDialog; // in isprogressdlg.pas

  procedure _FreeColumnList;
  var
    j: Integer;
  begin
    if Assigned(AColumns) then
      try
        try
          for j := AColumns.Count - 1 downto 0 do
            if Assigned(AColumns[j]) then
              begin
                TExcelExportFieldCargo(AColumns[j]).Free;
                AColumns[j] := nil;
              end;
          AColumns.Clear;
        except
          // suppress
        end;
      finally
        FreeAndNil(AColumns);
      end;
  end;

begin
  if not IsConnected then
    Exit;

  // Initialize
  ARangeStart := 'A1';
  ARangeRowStart := 1;

  // Make sure the dataset does not have too many records
  try
    AActualRowCount := IQMS.Common.RecordCount.GetRecordCount(ADataSet);
    ValidateRecordCount(AActualRowCount);
  except
    on E: Exception do
      raise Exception.CreateFmt('Dataset error [%s]:  %s',
        [ADataSet.Name, E.Message]);
  end;

  // Get values about this dataset object
  ADataSet := FDataSets.Items[ADataSetIndex].DataSet;
  ASheetName := FDataSets.Items[ADataSetIndex].SheetName;
  ADataSheet := FDataSets.Items[ADataSetIndex].DataSheet;
  AWorkSheetItem := FWorkSheets.Find(ASheetName);

  // Disable dataset events
  DisableDependencies(ADataSet, { var } AScrollEvents);
  try
    // Create a list of columns
    AColumns := TList<TExcelExportFieldCargo>.Create;
    try
      // It is possible to use the same work sheet, appending a dataset
      // after the previously added dataset.  This is rare, but may be
      // desireable.
      GetNextRangeStart(ASheetName, { var } ARangeStart,
        { var } ARangeRowStart);

      // Make sure the data set is open.  Normally it will be.
      if not ADataSet.Active then
        ADataSet.Open;

      // Define the column list and add the header row
      ACol := 1;
      for i := 0 to ADataSet.FieldCount - 1 do
        if ADataSet.Fields[i].Visible then
          begin
            x := AColumns.Add(TExcelExportFieldCargo.Create(ADataSet.Fields
              [i], ACol));
            ADataSheet.Cells[ARangeRowStart, ACol] := AColumns.Items[x]
              .DisplayLabel;
            ADataSheet.Columns[ACol].ColumnWidth := AColumns.Items[x].Width;
            Inc(ACol);
          end;

      if ACol > EXCEL_MAX_COLS_ALLOWED then
        raise Exception.CreateFmt(
          'The maximum number of columns (%d) permitted in an Excel spreadsheet has been exceeded.',
          [EXCEL_MAX_COLS_ALLOWED]);

      // 02/03/2015 (Byron) Added progress dialog.
      // EIQ-5848 CRM - Mass Mail History recipient export taking a long time - Internal
      // Create the Progress Dialog box
      // IQMS.DBTrans.dbtrscstr.cTXT0000224 = 'Exporting to Microsoft Excel.  Please wait...';
      hPrg := hProgressDlg(Self, 100, IQMS.DBTrans.dbtrscstr.cTXT0000224);
      try
        // Get the record count for the progress
        ARecordCount := IQMS.Common.RecordCount.GetRecordCount(ADataSet);
        hPrg.MaxProgress := ARecordCount;
        hPrg.CancelBtnEnabled := False;
        // IQMS.DBTrans.dbtrscstr.cTXT0000225 = 'Processing sheet, "%s"';
        hPrg.Status2 := Format(IQMS.DBTrans.dbtrscstr.cTXT0000225, [ASheetName]);
        // Update the progress dialog. Note:  if this is a problem, remove it.
        Application.ProcessMessages;

        // Add field data to the spreadsheet
        ADataSet.First;
        ACol := 1;
        ARow := ARangeRowStart + 1;
        AActualRowCount := 1; // include the title row

        // Loop the dataset and add the field data to each cell
        while not ADataSet.Eof do
          begin
            // Loop each field in the dataset
            for i := 0 to ADataSet.FieldCount - 1 do
              // if the field is visible, then process it.  We skip any fields
              // that are invisible.
              if ADataSet.Fields[i].Visible then
                begin
                  // Set the cell value (by row and column).  We get the field
                  // text by calling a function because we need to obtain the
                  // string different ways depending on the field data type.
                  ADataSheet.Cells[ARow, ACol] :=
                    GetFieldValue(ADataSet.Fields[i]);
                  // Increment the column counter
                  Inc(ACol);
                end;
            // Move to the next dataset record
            ADataSet.Next;
            // Reset the column counter; we need to start again for the next row.
            ACol := 1;
            // Increment the row counter for this loop.
            Inc(ARow);
            // Increment the actual number of dataset rows that we have processed.
            Inc(AActualRowCount);
            // Step progress bar
            if Assigned(hPrg) then
              hPrg.StepProgress;
            // 04/25/2014 Ensure we don't hit a memory limit
            if AActualRowCount >= EXCEL_MAX_ROWS_ALLOWED then
              Break;
          end;

        // Set the row count and the new "last row" which will be the
        // starting row for this work sheet, if it is used again.
        FDataSets.Items[ADataSetIndex].RowCount := AActualRowCount - 1;
        AWorkSheetItem.LastRow := ARangeRowStart + AActualRowCount;

        // Format the title row
        FormatTitles(ADataSheet, Format('%s:%s%d',
          [ARangeStart, AColumns.Items[AColumns.Count - 1].ColumnName,
          ARangeRowStart]));

        // Autosize the column widths
        AutoSize(ADataSheet, Format('A1:%s%d',
          [AColumns.Items[AColumns.Count - 1].ColumnName,
          AWorkSheetItem.LastRow]));
      finally
        // Free the Progress Dialog box
        if Assigned(hPrg) then
          FreeAndNil(hPrg);
      end;
    finally
      // Enable dataset events
      EnableDependencies(ADataSet, AScrollEvents);
      if Assigned(AScrollEvents) then
        FreeAndNil(AScrollEvents);
    end;
  finally
    // Free the column list
    _FreeColumnList;
  end;
end;

procedure TExcelExportAssistant.FormatTitles(const ADataSheet: OLEVariant;
  const ARange: string);
begin
  if not Variants.VarIsEmpty(ADataSheet) then
    try
      ADataSheet.Range[ARange].Font.Bold := True;
      ADataSheet.Range[ARange].HorizontalAlignment := xlCenter;
    except
      // Suppress the error.  Normally, this works, but we don't need to
      // stop processing just because this part failed.
    end;
end;

procedure TExcelExportAssistant.AutoSize(const ADataSheet: OLEVariant;
  const ARange: string);
begin
  if not Variants.VarIsEmpty(ADataSheet) then
    try
      // Get the range of cells that contain data
      // Apply the auto fit command to the columns
      ADataSheet.Range[ARange].Columns.AutoFit;
    except
      // Suppress the error.  Normally, this works, but we don't need to
      // stop processing just because this part failed.
    end;
end;

procedure TExcelExportAssistant.GetNextRangeStart(const ASheetName: string;
  var ARange: string; var ANextRow: Integer);
var
  AIndex: Integer;
begin
  // Defaults
  ANextRow := 1;
  ARange := 'A1';
  AIndex := FWorkSheets.IndexOf(ASheetName);
  if (AIndex > - 1) then
    begin
      if FWorkSheets.Items[AIndex].LastRow > 0 then
        begin
          ANextRow := FWorkSheets.Items[AIndex].LastRow + 1;
          ARange := Format('A%d', [ANextRow]);
        end;
    end;
end;

procedure TExcelExportAssistant.Show;
begin
  if IsConnected then
    begin
      Excel.WindowState := 1;
      Excel.Visible := True;
    end;
end;

procedure TExcelExportAssistant.Add(const ADataSet: TDataSet;
  const ASheetName: string);
begin
  FDataSets.Add(ADataSet, ASheetName);
end;

procedure TExcelExportAssistant.Connect;
var
  hMsg: TPanelMesg;
begin
  if not IsConnected then
    try
      // IQMS.DBTrans.dbtrscstr.cTXT0000218 = 'Connecting to Microsoft Excel.  Please wait.';
      hMsg := hPleaseWait(IQMS.DBTrans.dbtrscstr.cTXT0000218);
      try
        Excel := CreateOleObject('Excel.Application');
        try
          Excel.Visible := False;
          WorkBook := Excel.WorkBooks.Add( - 4167);
        except
          Excel.Quit;
          WorkBook := Unassigned;
          Excel := Unassigned;
        end;
      finally
        if Assigned(hMsg) then
          FreeAndNil(hMsg);
      end;
    except
      WorkBook := Unassigned;
      Excel := Unassigned;
    end;

  if not IsConnected then
    // IQMS.DBTrans.dbtrscstr.cTXT0000219 = 'Cannot connect to Microsoft Excel.';
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000219);

end;

procedure TExcelExportAssistant.Disconnect;
begin
  if IsConnected then
    begin
      Excel.Quit;
      // This will unassign OLE variants
      Reset;
    end;
end;

function TExcelExportAssistant.IsConnected: Boolean;
begin
  Result := not Variants.VarIsEmpty(Excel);
end;

function TExcelExportAssistant.IndexOfDataSet(ADataSet: TDataSet): Integer;
var
  i: Integer;
begin
  Result := - 1;
  for i := 0 to FDataSets.Count - 1 do
    if FDataSets.Items[i].DataSet = ADataSet then
      begin
        Result := i;
        Break;
      end;
end;

function TExcelExportAssistant.GetFieldValue(const AField: TField): string;
begin
  case AField.DataType of
    ftSmallint, ftInteger, ftWord, ftLargeint:
      Result := IntToStr(AField.AsInteger);
    ftFloat, ftCurrency, ftBCD, ftAutoInc, ftFMTBcd:
      Result := Format('%.15f', [AField.AsFloat]);
    ftDate, ftTime, ftDateTime, ftTimeStamp:
      begin
        if AField.AsFloat = 0 then
          Result := ''
        else
          Result := FormatDateTime('c', AField.AsDateTime);
      end;
    ftMemo, ftFmtMemo, ftString, ftFixedChar, ftWideString, ftGuid:
      Result := LeftStr(AField.AsString, 255);
    ftBoolean:
      Result := AField.AsString;
    ftBytes, ftVarBytes, ftBlob, ftGraphic, ftParadoxOle,
      ftDBaseOle, ftTypedBinary, ftCursor, ftADT, ftArray, ftReference,
      ftDataSet, ftOraBlob, ftOraClob, ftVariant, ftInterface, ftIDispatch:
      Result := '';
  else
    Result := LeftStr(AField.AsString, 255);
  end;
end;

{$REGION 'TExcelWorkSheetItems'}

{ TExcelWorkSheetItem }

constructor TExcelWorkSheetItem.Create(Collection: TCollection);
begin
  inherited Create(TExcelWorkSheetItems(Collection));
  FWorkSheet := Unassigned;
  FSheetName := '';
  FLastRow := 0;
end;

{ TExcelWorkSheetItems }

constructor TExcelWorkSheetItems.Create;
begin
  inherited Create(TExcelWorkSheetItem);
end;

function TExcelWorkSheetItems.Add(const AWorkSheet: OLEVariant;
  const ASheetName: string): TExcelWorkSheetItem;
begin
  Result := Find(ASheetName);
  if Result = NIL then
    try
      BeginUpdate;
      Result := AddItem;
      Result.WorkSheet := AWorkSheet;
      Result.SheetName := ASheetName;
    finally
      EndUpdate;
    end;
end;

function TExcelWorkSheetItems.AddItem: TExcelWorkSheetItem;
begin
  Result := TExcelWorkSheetItem(inherited Add);
end;

function TExcelWorkSheetItems.Find(
  const ASheetName: String): TExcelWorkSheetItem;
var
  i: Integer;
begin
  i := IndexOf(ASheetName);
  if i < 0 then
    Result := nil
  else
    Result := TExcelWorkSheetItem(Items[i]);
end;

function TExcelWorkSheetItems.IndexOf(const ASheetName: string): Integer;
var
  i: Integer;
begin
  Result := - 1;
  for i := 0 to Count - 1 do
    if CompareText(TExcelWorkSheetItem(Items[i]).SheetName, ASheetName) = 0 then
      begin
        Result := i;
        Break;
      end;
end;

function TExcelWorkSheetItems.GetItems(Index: Integer): TExcelWorkSheetItem;
begin
  Result := TExcelWorkSheetItem(inherited Items[Index]);
end;

procedure TExcelWorkSheetItems.SetItems(Index: Integer;
  const Value: TExcelWorkSheetItem);
begin
  inherited Items[Index] := Value;
end;

{$ENDREGION 'TExcelWorkSheetItems'}

{$REGION 'TExcelExportDataSets'}

{ TExcelExportDataSet }

constructor TExcelExportDataSet.Create(Collection: TCollection);
begin
  inherited Create(TExcelExportDataSets(Collection));
  FDataSet := nil;
  FSheetName := '';
  FRowCount := 0;
  FDataSheet := Unassigned;
end;

{ TExcelExportDataSets }

constructor TExcelExportDataSets.Create;
begin
  inherited Create(TExcelExportDataSet);
end;

function TExcelExportDataSets.Add(ADataSet: TDataSet;
  ASheetName: string): TExcelExportDataSet;
begin
  Result := Find(ADataSet);
  if Result = NIL then
    try
      BeginUpdate;
      Result := AddItem;
      Result.DataSet := ADataSet;
      Result.SheetName := ASheetName;
    finally
      EndUpdate;
    end;
end;

function TExcelExportDataSets.AddItem: TExcelExportDataSet;
begin
  Result := TExcelExportDataSet(inherited Add);
end;

function TExcelExportDataSets.Find(
  const ADataSet: TDataSet): TExcelExportDataSet;
var
  i: Integer;
begin
  i := IndexOf(ADataSet);
  if i < 0 then
    Result := nil
  else
    Result := TExcelExportDataSet(Items[i]);
end;

function TExcelExportDataSets.IndexOf(const ADataSet: TDataSet): Integer;
var
  i: Integer;
begin
  Result := - 1;
  for i := 0 to Count - 1 do
    if TExcelExportDataSet(Items[i]).DataSet = ADataSet then
      begin
        Result := i;
        Break;
      end;
end;

function TExcelExportDataSets.GetItems(Index: Integer): TExcelExportDataSet;
begin
  Result := TExcelExportDataSet(inherited Items[Index]);
end;

procedure TExcelExportDataSets.SetItems(Index: Integer;
  const Value: TExcelExportDataSet);
begin
  inherited Items[Index] := Value;
end;

{$ENDREGION 'TExcelExportDataSets'}

{$ENDREGION 'TExcelExportAssistant'}

end.
