unit IQMS.WebVcl.ExcelPiv;

interface

uses Classes, DB, SysUtils, Clipbrd, Windows;//, PanelMsg;

const
  XL_DATABASE  = 1;

  // Excel Window States
  XL_MAXIMIZED = -4137;
  XL_MINIMIZED = -4140;
  //XL_NORMAL = -4143;

  // Orientation Property
  XL_HIDDEN      = 0;
  XL_ROWFIELD    = 1;
  XL_COLUMNFIELD = 2;
  XL_PAGEFIELD   = 3;
  XL_DATAFIELD   = 4;

  // Function Property
  XL_AVERAGE     = -4106;
  XL_COUNT       = -4112;
  XL_COUNTNUMS   = -4113;
  XL_MAX         = -4136;
  XL_MIN         = -4139;
  XL_PRODUCT     = -4149;
  XL_STDEV       = -4155;
  XL_STDEVP      = -4156;
  XL_SUM         = -4157;
  XL_VAR         = -4164;
  XL_VARP        = -4165;

  // Calculation Property
  XL_NORMAL                = -4143;
  XL_DIFFERENCEFROM        = 2;
  XL_PERCENTOF             = 3;
  XL_PERCENTDIFFERENCEFROM = 4;
  XL_RUNNINGTOTAL          = 5;
  XL_PERCENTOFROW          = 6;
  XL_PERCENTOFCOLUMN       = 7;
  XL_PERCENTOFTOTAL        = 8;
  XL_INDEX                 = 9;

type
  TIQWebExcelPivotTable = class;

  // TIQWebExportToExcel is an abstract class that defines the data export interface.
  TIQWebExportToExcel = class
  Private
  Protected
  Public
    procedure ExportData(EPT: TIQWebExcelPivotTable); virtual; abstract;
  end;

  // This class encapsulates the process of exporting data
  // to Excel through OLE automationl.
  TIQWebExportOLE = class(TIQWebExportToExcel)
  Private
  Protected
  Public
    procedure ExportData(EPT: TIQWebExcelPivotTable); override;
  end;

  // This class encapsulates the process of exporting data
  // to Excel through a tempory text file.
  TIQWebExportTextFile = class(TIQWebExportToExcel)
  Private
    procedure WriteTextFile(EPT: TIQWebExcelPivotTable);
    procedure ReadTextFileIntoExcel(EPT: TIQWebExcelPivotTable);
  Protected
  Public
    procedure ExportData(EPT: TIQWebExcelPivotTable); override;
  end;

  // This class encapsulates the OLE automation code that
  // exports data to Excel and builds a pivot table.
  TIQWebExcelPivotTable = class(TThread)
  private
    // Property variables
    FExcelFileName : TFileName;
    FExportFileName : TFileName;
    FExportObject : TIQWebExportToExcel;
    FDataSet : TDataSet;
    FTitle : string;
    FDataSheetName : string;
    FAnalysisSheetName : string;
    FOpenState : boolean;
    FEndOfDataRow : integer;
    FCol : integer;
    FRowFields : TStringList;
    FColumnFields : TStringList;
    FValueFields : TStringList;
    FDataFieldCalculation : integer;
    FDataFieldFunction : integer;
    FWindowState : integer;
    procedure BuildPivotTable;
    procedure CreateOLEObjects;
    procedure ExportData;
    procedure SetRowFields;
    procedure SetColumnFields;
    procedure SetValueFields;
    procedure ConfigureDataFields;
  protected
//    hMsg: TPanelMesg;
    FDispMesg: string;
    procedure CreateStatusMesg;
    procedure DestroyStatusMesg;
    procedure DisplayException;
    procedure DisplayConfirmation;
  public
    FOwner: TComponent;
  
    // OLE object variables
    Excel : variant;
    WorkBook : variant;
    DataSheet : variant;
    OutputSheet : variant;
    PivotTable : variant;

    constructor Create( AOwner: TComponent );
    destructor Destroy; override;
    procedure Execute; override;
    procedure SetExportObject(ExpObj : TIQWebExportToExcel);
    property ExcelFileName : TFileName read FExcelFileName write FExcelFileName;
    property ExportFileName : TFileName read FExportFileName write FExportFileName;
    property DataSheetName : string read FDataSheetName write FDataSheetName;
    property AnalysisSheetName : string read FAnalysisSheetName write FAnalysisSheetName;
    property DataSet : TDataSet read FDataSet write FDataSet;
    property Title : string read FTitle write FTitle;
    property RowFields : TStringList read FRowFields write FRowFields;
    property ColumnFields : TStringList read FColumnFields write FColumnFields;
    property ValueFields : TStringList read FValueFields write FValueFields;
    property DataFieldCalculation : integer read FDataFieldCalculation write FDataFieldCalculation;
    property DataFieldFunction : integer read FDataFieldFunction write FDataFieldFunction;
    property WindowState : integer read FWindowState write FWindowState;
    property EndOfDataRow : integer read FEndOfDataRow write FEndOfDataRow;
  end;

implementation

uses
  ComObj,
  ActiveX,
//  IQTxStrm,
//  IQMesg,
  IQMS.WebVcl.ResourceStrings,
  IQMS.WebVcl.Strings,
  IQMS.WebVcl.ExcelTbl,
  Math;

// misc functions
function _DataSetToExcelRange( ADataSet: TDataSet; ARowCount: Integer ): string;
var
  A1stLetter: string;
  A2ndLetter: string;
  ACount    : Integer;
begin                           
  // english alphabet has 26 chrs A-Z, so horizontally excel has it as A,B,C ...Z, AA, AB, AC ...AZ, BA, BB, BC etc
  A1stLetter:= '';
  ACount:= (ADataSet.FieldCount-1) div 26;
  if ACount > 0 then
     A1stLetter:= Chr(ACount + 64);
  A2ndLetter:= Chr(ADataSet.FieldCount - 26 * ACount + 64);        
  Result:= 'A1:' + A1stLetter + A2ndLetter + IntToStr(ARowCount);  // Ex: A1:AA31
end;
     
constructor TIQWebExcelPivotTable.Create( AOwner: TComponent );
begin
  FOwner:= AOwner;
  FRowFields := TStringList.Create;
  FColumnFields := TStringList.Create;
  FValueFields := TStringList.Create;

  FDataSheetName := '';
  FAnalysisSheetName := '';

  FreeOnTerminate := True;
  inherited Create(True);
end;

destructor TIQWebExcelPivotTable.Destroy;
begin
  FRowFields.Free;
  FColumnFields.Free;
  FValueFields.Free;
  FExportObject.Free;

  inherited Destroy;
end;

// This method is the primary data processing routing.
procedure TIQWebExcelPivotTable.Execute;
var
  CurrentRecord: TBookmark;
begin
  Try
    Synchronize( CreateStatusMesg );
    
    EnterCriticalSection( TIQWebPivotTable(FOwner).CS );
  
    // This call must be made in order to create OLE objects in this thread.
    CoInitialize(nil);

    // Make sure a dataset has been selected.
    If Assigned(FDataSet) Then
    Begin
      Try
        // Save the origial active state and then open the Dataset.
        FOpenState := FDataSet.Active;
        FDataSet.Open;
        if FDataSet.Eof and FDataSet.Bof then
        begin
          FDispMesg:= IQMS.WebVcl.ResourceStrings.cTXT0000023; // 'Output dataset does not contain any data. Operation aborted.'
          Synchronize( DestroyStatusMesg );
          Synchronize( DisplayConfirmation );
          ABORT;
        end;

        // Make sure the dataset is opened.
        If FDataSet.Active Then
        begin
          CreateOLEObjects;
          try
            Try
              FDataSet.DisableControls;
              CurrentRecord := FDataSet.GetBookmark;
              ExportData;
            Finally
              FDataSet.GotoBookmark(CurrentRecord);
              FDataSet.FreeBookmark(CurrentRecord);
              FDataSet.EnableControls;
            End;

            BuildPivotTable;                  
            Excel.WindowState := FWindowState;
            Excel.Visible := True;
          except on E: Exception do
            begin
              Excel.Quit;
              raise;
            end;
          end;
        end;
      Except on E: Exception do
        if not (E is EAbort) then
        begin
          // Raise;
          FDispMesg:= E.Message;
          Synchronize( DestroyStatusMesg );
          Synchronize( DisplayException );
          ABORT;
        end;
      End;
    End;
  Finally
    FDataSet.Active := FOpenState;  // Return the Dataset to it origial active state.
    Synchronize( DestroyStatusMesg );
    LeaveCriticalSection( TIQWebPivotTable(FOwner).CS );
    OleUninitialize;
  End;
end;

procedure TIQWebExcelPivotTable.DisplayException;
begin
//  IQError( FDispMesg );
end;

procedure TIQWebExcelPivotTable.DisplayConfirmation;
begin
//  IQConfirm( FDispMesg );
end;

procedure TIQWebExcelPivotTable.CreateStatusMesg;
begin
// hMsg:= hPleaseWait( IQMS.WebVcl.ResourceStrings.cTXT0000024 {'Building Microsoft Excel PivotTable.  Please wait ...'} );
end;

procedure TIQWebExcelPivotTable.DestroyStatusMesg;
begin
// if Assigned( hMsg ) then
//    hMsg.Free;
// hMsg:= NIL;
end;


procedure TIQWebExcelPivotTable.SetExportObject(ExpObj : TIQWebExportToExcel);
begin
  FExportObject := ExpObj;
end;

// Build the pivot table.
procedure TIQWebExcelPivotTable.BuildPivotTable;
var
 DataRange : variant;
 OutPutRange : variant;
 strDataRange : string;
 strOutRange : string;
begin
  // Calculate the location of the data and the pivot table.
  // strDataRange := 'A1:' + Chr(FDataSet.FieldCount + 64) + IntToStr(FEndOfDataRow);
  strDataRange:= _DataSetToExcelRange( FDataSet, FEndOfDataRow );
  strOutRange := 'A1';          

  If FTitle <> '' Then
  Begin
    // Set and format the title.
    OutPutSheet.Cells[1, 1].Value := FTitle;
    OutPutSheet.Cells[1, 1].Font.Size := 14;
    OutPutSheet.Cells[1, 1].Font.Bold := True;

    // Adjust the location of the pivot table.
    strOutRange := 'A2';
  End;

  // Create range objects to hold the location
  // of the data and the pivot table.
  DataRange := DataSheet.Range[strDataRange];
  OutPutRange := OutputSheet.Range[strOutRange];

  // Create the pivot table and pivot table object.
  OutputSheet.PivotTableWizard(XL_DATABASE, DataRange, OutPutRange, FTitle);
  PivotTable := OutputSheet.PivotTables[1];

  // Format the pivot table.
  SetRowFields;
  SetColumnFields;
  SetValueFields;
  ConfigureDataFields;
end;

// Format the data fields of the pivot table.
procedure TIQWebExcelPivotTable.ConfigureDataFields;
var
  I : integer;
begin
  // Loop thru all data fields of the pivot table
  For I := 1 to PivotTable.DataFields.Count Do
  Begin
    PivotTable.DataFields[I].Calculation := FDataFieldCalculation;
    PivotTable.DataFields[I].Function := FDataFieldFunction;
  End;
end;

// Set the Row fields of the pivot table.
procedure TIQWebExcelPivotTable.SetRowFields;
var
 I : integer;
 J : integer;
begin
  // Loop thru the list of row fields.
  For I := 0 to FRowFields.Count-1 Do
  Begin
    // Loop thru the fields of the pivot table.
    For J := 1 to PivotTable.PivotFields.Count Do
    begin
      If FRowFields[I] = PivotTable.PivotFields[J].Name Then
        PivotTable.PivotFields[J].Orientation := XL_ROWFIELD;
    end;
  End;
end;

// Set the Column fields of the pivot table.
procedure TIQWebExcelPivotTable.SetColumnFields;
var
 I : integer;
 J : integer;
begin
  // Loop thru the list of row fields.
  For I := 0 to FColumnFields.Count-1 Do
  Begin
    // Loop thru the fields of the pivot table.
    For J := 1 to PivotTable.PivotFields.Count Do
    begin
      If FColumnFields[I] = PivotTable.PivotFields[J].Name Then
        PivotTable.PivotFields[J].Orientation := XL_COLUMNFIELD;
    end;
  End;
end;

// Set the Value fields of the pivot table.
procedure TIQWebExcelPivotTable.SetValueFields;
var
 I : integer;
 J : integer;
begin
  // Loop thru the list of row fields.
  For I := 0 to FValueFields.Count-1 Do
  Begin
    // Loop thru the fields of the pivot table.
    For J := 1 to PivotTable.PivotFields.Count Do
    begin
      If FValueFields[I] = PivotTable.PivotFields[J].Name Then
        PivotTable.PivotFields[J].Orientation := XL_DATAFIELD;
    end;
  End;
end;

// This method creates all of the Excel OLE objects.
procedure TIQWebExcelPivotTable.CreateOLEObjects;
begin
  Try
    Excel := CreateOLEObject('Excel.Application');

    Try
      If FileExists(FExcelFileName) Then
        begin
          // Open the workbook.
          Try
            WorkBook := Excel.Workbooks.Add(FExcelFileName);
          Except
            WorkBook := Excel.Workbooks.Add;
          End;

          // Access the data sheet.
          Try
            DataSheet := WorkBook.Worksheets[FDataSheetName];
          Except
            DataSheet := WorkBook.Worksheets.Add;
            DataSheet.Name := FDataSheetName;
          End;

          // Access the analysis sheet.
          Try
            OutputSheet := WorkBook.Worksheets[FAnalysisSheetName];
          Except
            OutputSheet := WorkBook.Worksheets.Add;
            OutputSheet.Name := FAnalysisSheetName;
          End;
        end
      Else
        begin
          WorkBook := Excel.Workbooks.Add;
          DataSheet := WorkBook.Worksheets.Add;
          DataSheet.Name := IQMS.WebVcl.ResourceStrings.cTXT0000025; // 'Data'
          OutputSheet := WorkBook.Worksheets.Add;
          OutputSheet.Name := IQMS.WebVcl.ResourceStrings.cTXT0000026; // 'Analysis'
        end;
    Except
      Excel.Quit;
      Raise;
    end;
  Except
    Raise;
  End;
end;

// Export the data from the Dataset to the data sheet in Excel.
procedure TIQWebExcelPivotTable.ExportData;
begin
  FExportObject.ExportData(Self);
end;


// TIQWebExportOLE

procedure TIQWebExportOLE.ExportData(EPT: TIQWebExcelPivotTable);
var
  I : integer;
  FieldCount : integer;
  InfoColumn : integer;
begin
  EPT.EndOfDataRow := 1;

  FieldCount := EPT.DataSet.FieldCount;

  // Write the data labels.
  For I := 0 to FieldCount-1 Do
  Begin
    EPT.DataSheet.Cells[EPT.EndOfDataRow, I+1].Value :=
                                             EPT.DataSet.Fields[I].DisplayLabel;
  End;

  EPT.EndOfDataRow := EPT.EndOfDataRow + 1;
  EPT.DataSet.First;

  // Loop thru all records and write data to the data sheet.
  While Not EPT.DataSet.EOF Do
  Begin
    // Loop thru all fields of the current record.
    For I := 0 to FieldCount-1 Do
    Begin
      EPT.DataSheet.Cells[EPT.EndOfDataRow, I+1].Value :=
                                                 EPT.DataSet.Fields[I].AsString;
    End;

    // Move to next row and next record.
    EPT.EndOfDataRow := EPT.EndOfDataRow + 1;
    EPT.DataSet.Next;
  End;

  // Remove the extry row that was added.
  EPT.EndOfDataRow := EPT.EndOfDataRow - 1;
end;


// TIQWebExportTextFile

procedure TIQWebExportTextFile.ExportData(EPT: TIQWebExcelPivotTable);
begin
  Try
    WriteTextFile(EPT);
    ReadTextFileIntoExcel(EPT);
  Except
    Raise;
  End;
end;

procedure TIQWebExportTextFile.ReadTextFileIntoExcel(EPT: TIQWebExcelPivotTable);
var
  strRange : string;
begin
  Try
    With EPT Do
    Begin
      // Read the text file into Excel.  The text file will automatically
      // be placed into a new (temporary) workbook.
      Excel.Workbooks.OpenText(EPT.ExportFileName, 2, 1, 1, 1,
                                 False, False, True, False, False, False, '');

      // Build a string description of the range containing the data.
      // english alphabet has 26 chrs A-Z, so horizontally excel has it as A,B,C ...Z, AA, AB, AC ...AZ, BA, BB, BC etc
      // strRange := 'A1:' + Chr(EPT.DataSet.FieldCount + 64) + IntToStr(EPT.EndOfDataRow);
      strRange := _DataSetToExcelRange( EPT.DataSet, EPT.EndOfDataRow );

      // Copy the data from the temporary workbook into the pivot table workbook.
      Excel.Workbooks[2].Sheets[1].Range[strRange].Select;
      Excel.Selection.Copy;
      DataSheet.Paste;

      Clipboard.Clear;

      // Close the temporary workbook.
      Excel.Workbooks[2].Close(False);
    End;
  Except
    Raise;
  End;
end;

procedure TIQWebExportTextFile.WriteTextFile(EPT: TIQWebExcelPivotTable);
var
  Stream : TStringStream;
  FieldCount, I, ASize : integer;
  S: string;
begin
//  Try
//    EPT.EndOfDataRow := 1;
//
//    Try
//      If EPT.ExportFileName = '' Then EPT.ExportFileName := 'C:\TEMP.TXT';
//
//      Stream := TStringStream.Create(EPT.ExportFileName, tfmCreate);
//      Stream.Buffer := '';
//
//      FieldCount := EPT.DataSet.FieldCount;
//
//      // Write the data labels.
//      For I := 0 to FieldCount-1 Do
//      Begin
//        Stream.Buffer := Stream.Buffer + EPT.DataSet.Fields[I].DisplayLabel;
//        If I <> FieldCount-1 Then Stream.Buffer := Stream.Buffer + ';'
//      End;
//
//      Stream.WriteLn;
//      EPT.EndOfDataRow := EPT.EndOfDataRow + 1;
//
//      EPT.DataSet.First;
//
//      // Loop thru the records.
//      While Not EPT.DataSet.EOF Do
//      Begin
//        Stream.Buffer := '';
//
//        // Loop thru the fields
//        For I := 0 to FieldCount-1 Do
//        Begin
//          // 08/07/2014 If this is a string field, take the following actions
//          if EPT.DataSet.Fields[I].DataType = ftString then
//            begin
//              // Get field string and size
//              S := EPT.DataSet.Fields[I].AsString;
//              ASize := EPT.DataSet.Fields[I].Size;
//              // If the field contains a number and could possibly be
//              // interpreted as a numeric value by Excel, then pad the
//              // string and add an apostrophe to the far right.  This
//              // forces Excel to recognize this as a string and not a
//              // number.
//              if (ASize < 30) and (S > '') and
//                not iqstring.IsAlphaNumeric(S) and
//                (iqstring.RightStr(Trim(S), 1) = '0') then
//                //S := iqstring.PadR(S, 250) + '''';
//                S := S + '''';
//              // Add the field string
//              Stream.Buffer := Stream.Buffer + S;
//            end
//          else
//            // Add the field string
//            Stream.Buffer := Stream.Buffer + EPT.DataSet.Fields[I].AsString;
//          If I <> FieldCount-1 Then Stream.Buffer := Stream.Buffer + ';'
//        End;
//
//        Stream.WriteLn;
//        EPT.EndOfDataRow := EPT.EndOfDataRow + 1;
//
//        EPT.DataSet.Next;
//      End;
//
//      // Remove the extry row that was added.
//      EPT.EndOfDataRow := EPT.EndOfDataRow - 1;
//    Finally
//      Stream.Free;
//    End;
//  Except
//    Raise;
//  End;
end;

END.
