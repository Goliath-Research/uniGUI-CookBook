unit ForeExport;

interface

uses
  Windows,
  SysUtils,
  Classes,
  DB,
  Clipbrd,
  Variants;

const
  vbBlack            = 0;
  vbWhite            = 16777215;
  xlNone             = -4142;
  xlContinuous       = 1;
  xlThin             = 2;
  xlAutomatic        = -4105;
  xlDiagonalDown     = 5;
  xlDiagonalUp       = 6;
  xlOpenXMLWorkbookMacroEnabled = 52; 

type
  // TIQExportForecastToExcel class defines an exporting data
  // to Excel through a temporary text file.
  TIQExportForecastToExcel = class
  private
    // Property variables
    FExportFileName: string;
    FEndOfDataRow  : Integer;
    procedure CreateOLEObjects;
    procedure WriteTextFile;
    procedure ReadTextFileIntoExcel;
    procedure ExportData;
    procedure FormatDataSheet;
    procedure InsertVBACode;
    procedure FreezePanes;
    procedure SaveWorkBook(AFileName: string);
    procedure DeleteIfExists(AFileName: string);
    procedure CloseExcelNoSave;
    function GetDataSet: TDataSet;
    procedure FormatCellText;
  protected
  public
    FOwner: TComponent;

    // OLE object variables
    Excel    : variant;
    WorkBook : variant;
    DataSheet: variant;

    constructor Create( AOwner: TComponent );
    procedure Execute;

    property DataSet: TDataSet read GetDataSet;
  end;
  
const
  c_semicolon_substitute = chr(1);
  c_CR_LF_substitute     = chr(2);
  
implementation

uses
  ComObj,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  ForeMain,
  Dialogs,
  Fore_rscstr,
  IQMS.Common.Numbers,
  IQMS.Common.PanelMsg;

constructor TIQExportForecastToExcel.Create( AOwner: TComponent );
begin
  inherited Create;
  FOwner:= AOwner;
end;


function TIQExportForecastToExcel.GetDataSet: TDataSet;
begin
  Result:= TFrmForecastMain(FOwner).QryExport
end;
     
// This method is the primary data processing routing.
procedure TIQExportForecastToExcel.Execute;
begin
  with DataSet do
  try
    Open;
    if not Eof then
    begin
      CreateOLEObjects;
      ExportData;
      Excel.WindowState:= 1;       
      Excel.Visible:= True;
    end;
  finally
    Close;
  end;
end;

procedure TIQExportForecastToExcel.CreateOLEObjects;
var
  hMsg: TPanelMesg;
begin
  try
    // Fore_rscstr.cRsc0001 =
    // 'Connecting to Microsoft Excel.  Please wait.'
    hMsg := hPleaseWait(Fore_rscstr.cRsc0001);
    try
      Excel:= CreateOLEObject('Excel.Application');
      try
        WorkBook := Excel.Workbooks.Add;
        DataSheet:= WorkBook.Worksheets.Add;
        DataSheet.Name:= 'Data';
        DataSheet.Range['A2:A2'].Select;
      except
        Excel.Quit;
        Abort;
      end;
    finally
       if Assigned(hMsg) then
         FreeAndNil(hMsg);
    end;
  except
    Abort;
  end;
end;

// Export the data from the Dataset to the data sheet in Excel.
procedure TIQExportForecastToExcel.ExportData;
var
  hMsg: TPanelMesg;
begin
  try
    hMsg := hPleaseWait('');
    try
      // Fore_rscstr.cRsc0003 = 'Creating Excel spreadsheet.'#13'Exporting data...';
      hMsg.Mesg := Fore_rscstr.cRsc0003;
      WriteTextFile;
      ReadTextFileIntoExcel;
      // Fore_rscstr.cRsc0004 = 'Creating Excel spreadsheet.'#13'Generating pivot subroutines...';
      hMsg.Mesg := Fore_rscstr.cRsc0004;
      FormatDataSheet;
      try
        InsertVBACode;
      except on E: Exception do
        // 02/04/2016 Issue:  The error text may not be in English!
        if E.ClassNameIs('EOleException') or
         (CompareText( E.Message, 'Programmatic access to Visual Basic Project is not trusted') = 0) then
          // Fore_rscstr.cRsc0007 =
          // 'Please turn on "Trust access VBA project object model" in ' +
          //  'your Microsoft Excel, Macro Settings. Contact your Administrator ' +
          //  'for assistance.';
          raise Exception.Create(E.Message + #13#13 + Fore_rscstr.cRsc0007)
        else
          raise;
      end;
      FreezePanes;
      FormatCellText;
      // Fore_rscstr.cRsc0005 = 'Creating Excel spreadsheet.'#13'Finalizing document...';
      hMsg.Mesg := Fore_rscstr.cRsc0005;
      SaveWorkBook( ForeMain.FExcelForecastFile );
    finally
       if Assigned(hMsg) then
         FreeAndNil(hMsg);
    end;
  except on E: Exception do
    begin
      CloseExcelNoSave;
//      if CompareText( E.Message, 'Programmatic access to Visual Basic Project is not trusted') = 0 then
//        // Fore_rscstr.cRsc0007 =
//        // 'Please turn on "Trust access VBA project object model" in ' +
//        //  'your Microsoft Excel, Macro Settings. Contact your Administrator ' +
//        //  'for assistance.';
//        raise Exception.Create(Fore_rscstr.cRsc0007)
//      else
         raise;
    end;
  end;
end;

procedure TIQExportForecastToExcel.WriteTextFile;
var
  S          : AnsiString;
  I          : Integer;
  Stream     : TStream;
  AFieldCount: Integer;
  AFieldValue: AnsiString;
  AFloatValue: Real;

  function _ContainsScientificNotation(const AValue: string): Boolean;
  const
    numerics = ['0' .. '9'];
  var
    i: Integer;
    AFoundE: Boolean;
    AFoundPlus: Boolean;
  begin
    AFoundE := False;
    AFoundPlus := False;
    if Trim(AValue) > '' then
      for i := 1 to Length(AValue) do
        begin
          // Both E and + found
          if AFoundE and AFoundPlus then
            begin
              if (AValue[i] in numerics) then
                Exit(True)
              else
                begin
                  AFoundE := False;
                  AFoundPlus := False;
                end;
            end;
          // Just E found so far, eval for numeric or plus
          if AFoundE and not AFoundPlus then
            begin
              if (AValue[i] in numerics) then
                Exit(True)
              else if AValue[i] = '+' then
                AFoundPlus := True
              else
                AFoundE := False;
            end;
          // Evaluate for E
          if AValue[i] = 'E' then
            begin
              AFoundE := True;
            end;
        end;
  end;

      function ModifyNoteString( ANote: string ): string;
      var
        J      : Integer;
        AText  : string;
        ATmpStr: string;
      begin
        AText:= StrTran( StrTran( ANote, ';', c_semicolon_substitute ), #13#10, c_CR_LF_substitute );

        for J:= 0 to 7 do
        begin
          ATmpStr:= ATmpStr + Copy(AText, 250*J + 1,250);
          if J < 7 then ATmpStr:= ATmpStr + ';';
        end;

        Result := ATmpStr;
      end;
      
{main body}      
begin
  FEndOfDataRow:= 1;
  FExportFileName:= IQGetLocalHomePath + '_IQFORETEMP.TXT';      { IQMisc }
      
  try
    // Create text file
    Stream:= TFileStream.Create(FExportFileName, fmCreate);

    S:= '';
    AFieldCount:= DataSet.FieldCount;

    // Write the data labels
    for I:= 0 to AFieldCount-1 do
    begin
      if DataSet.Fields[I].DisplayLabel = 'MM_DD_YY' then
         S:= S + FormatSettings.ShortDateFormat + ';'
      else
         S:= S + DataSet.Fields[I].DisplayLabel + ';';
    end;

    // Note1 must be last field, so split it on 8 parts (note1 is varchar2(2000))
    S:= S + 'NOTE2;' + 'NOTE3;' + 'NOTE4;' + 'NOTE5;' + 'NOTE6;' + 'NOTE7;' + 'NOTE8' + #13#10;
    Stream.WriteBuffer(Pointer(S)^, Length(S));
    FEndOfDataRow:= FEndOfDataRow + 1;

    DataSet.First;

    // Loop through the records
    while not DataSet.EOF do
    begin
      S:= '';

      // Loop through the fields
      for I:= 0 to AFieldCount-1 do
      begin
        AFieldValue := DataSet.Fields[I].AsAnsiString;
        if (DataSet.Fields[i] is TStringField) and
          (IQMS.Common.Numbers.IsStringValidFloat(AFieldValue, AFloatValue) or
           _ContainsScientificNotation(AFieldValue)) then
          begin
            // If a value can be converted to a number (meaning, it contains
            // no alphabetical characters, then Excel will consider it a
            // number an trim any leading zeroes.  To avoid that, we trick
            // Excel into treating the value as a string by appending an
            // underscore after it, but far enough not to be visible.
            AFieldValue := AFieldValue + Repl(' ', 254 - Length(AFieldValue)) + '_';
          end;

        if I = AFieldCount-1 then
          S:= S + ModifyNoteString( AFieldValue )
        else  
          S:= S + StrTran( AFieldValue,';',',') + ';';
      end;

      S:= S + #13#10;
      Stream.WriteBuffer(Pointer(S)^, Length(S));
      FEndOfDataRow:= FEndOfDataRow + 1;

      DataSet.Next;
    end;

    // Remove the extry row that was added.
    FEndOfDataRow := FEndOfDataRow - 1;
  finally
    Stream.Free;
  end;
end;

procedure TIQExportForecastToExcel.ReadTextFileIntoExcel;
var
  AUsedRange: string;
begin
  // Read the text file into Excel.  The text file will automatically
  // be placed into a new (temporary) workbook.
  Excel.Workbooks.OpenText(FExportFileName, 2, 1, 1, 1, False, True,
                           True, False, False, False, '');
        
  // Build a string description of the range containing the data.
  AUsedRange:= 'A1:' + Chr(DataSet.FieldCount + 71) + IntToStr(FEndOfDataRow);

  // Copy the data from the temporary workbook into the forecast table workbook.
  Excel.Workbooks[2].Sheets[1].Range[AUsedRange].Select;
  Excel.Selection.Copy;
  DataSheet.Paste;

  Clipboard.Clear;

  // Close the temporary workbook.
  Excel.Workbooks[2].Close(False);

  // Delete the text file.
  DeleteFile(FExportFileName);
end;

procedure TIQExportForecastToExcel.FormatDataSheet;
var
  I             : Integer;
  AFieldCount   : Integer;
  AToolbarRange : string;
  ATitleRange   : string;
  AEditRange    : string;
  ADateRange    : string;
  APriceRange   : string;
  AExtPriceRange: string;
  ATempRange    : string;
  S             : string;
begin
  AFieldCount:= DataSet.FieldCount;
  FEndOfDataRow:= FEndOfDataRow + 1;       // first row reserved for toolbar, so it^s increase on 1

  AToolbarRange := 'A1:' + Chr(AFieldCount + 63) + '1';
  ATitleRange   := 'A2:' + Chr(AFieldCount + 63) + '1';
//  AEditRange    := Chr(AFieldCount + 62) + '3:' + Chr(AFieldCount + 63) + IntToStr(FEndOfDataRow);
//  APriceRange   := Chr(AFieldCount + 60) + '3:' + Chr(AFieldCount + 60) + IntToStr(FEndOfDataRow);
//  AExtPriceRange:= Chr(AFieldCount + 61) + '3:' + Chr(AFieldCount + 61) + IntToStr(FEndOfDataRow);
//  ADateRange    := Chr(AFieldCount + 62) + '3:' + Chr(AFieldCount + 62) + IntToStr(FEndOfDataRow);

  AEditRange    := Format('J3:K%s', [IntToStr(FEndOfDataRow)]);
  APriceRange   := Format('H3:H%s', [IntToStr(FEndOfDataRow)]);
  AExtPriceRange:= Format('I3:I%s', [IntToStr(FEndOfDataRow)]);
  ADateRange    := Format('J3:J%s', [IntToStr(FEndOfDataRow)]);


  Excel.Selection.Font.Name:= 'Arial';
  Excel.Selection.Font.Size:= 10;
  Excel.Selection.Font.Color:= vbBlack;
  Excel.Selection.Interior.ColorIndex:= 15;   //silver

  Excel.Selection.Borders[xlDiagonalDown].LineStyle:= xlNone;
  Excel.Selection.Borders[xlDiagonalUp].LineStyle  := xlNone;

  for I:= 7 to 12 do    // xlEdgeLeft=7; xlEdgeTop=8; xlEdgeBottom=9; xlEdgeRight=10; xlInsideVertical=11; xlInsideHorizontal=12;
  begin
    Excel.Selection.Borders[ I ].LineStyle := xlContinuous;
    Excel.Selection.Borders[ I ].Weight    := xlThin;
    Excel.Selection.Borders[ I ].ColorIndex:= xlAutomatic;
  end;

  // DataSheet.Range[ATitleRange].Font.Name := 'Haettenschweiler';
  DataSheet.Range[ATitleRange].Font.Size := 11;
  DataSheet.Range[ATitleRange].Font.Bold := True;
  DataSheet.Range[ATitleRange].Font.Color:= vbWhite;
  DataSheet.Range[ATitleRange].Interior.ColorIndex:= 16;         //gray

  DataSheet.Range[APriceRange].Locked:= False;
  DataSheet.Range[APriceRange].Interior.ColorIndex:= 0;          //white

  DataSheet.Range[AEditRange].Locked := False;
  DataSheet.Range[AEditRange].Interior.ColorIndex := 0;          //white

  {05/07/2007 - when in other that English locale (such as German) I cannot assign FormatSettings.ShortDateFormat since Excel expect something in German ex: JJ.MM.YYYY }
  //DataSheet.Range[ADateRange].NumberFormat:= SysUtils.FormatSettings.ShortDateFormat;  // 'm/d/yy';

  DataSheet.Range[AToolbarRange].Interior.ColorIndex:= 15;       //silver

  DataSheet.Range['A1:A1'].EntireRow.RowHeight:= 26.25;
  DataSheet.Range['A2:A2'].EntireRow.RowHeight:= 21.75;

  // DataSheet.Range['A1:A1'].EntireColumn.ColumnWidth:= 10.71;  // itemno
  // DataSheet.Range['B1:B1'].EntireColumn.ColumnWidth:= 0;      // arinvt_id
  // DataSheet.Range['C1:C1'].EntireColumn.ColumnWidth:= 21.71;  // descrip
  // DataSheet.Range['D1:D1'].EntireColumn.ColumnWidth:= 25.57;  // company
  // DataSheet.Range['E1:E1'].EntireColumn.ColumnWidth:= 0;      // arcusto_id

  DataSheet.Range['A1:A1'].EntireColumn.ColumnWidth:= 10.71;  // itemno
  DataSheet.Range['B1:B1'].EntireColumn.ColumnWidth:= 0;      // arinvt_id
  DataSheet.Range['C1:C1'].EntireColumn.ColumnWidth:= 21.71;  // descrip
  DataSheet.Range['D1:D1'].EntireColumn.ColumnWidth:= 10.71;  // rev
  DataSheet.Range['E1:E1'].EntireColumn.ColumnWidth:= 25.57;  // company
  DataSheet.Range['F1:F1'].EntireColumn.ColumnWidth:= 0;      // arcusto_id


  //hide columns contain note string which is had been devided by 8 parts
  for I:= AFieldCount to (AFieldCount + 7) do
  begin
    ATempRange:= Chr(I + 64) + '1:' + Chr(I + 64) + '1';
    DataSheet.Range[ATempRange].EntireColumn.ColumnWidth:= 0;
  end;

  DataSheet.Range['L1:L1'].EntireColumn.ColumnWidth:= 30;     // ship_to_attn
  DataSheet.Range['M1:M1'].EntireColumn.ColumnWidth:= 0;      // ship_to_id
  DataSheet.Range['N1:N1'].EntireColumn.ColumnWidth:= 30;     // desc2
  DataSheet.Range['O1:O1'].EntireColumn.ColumnWidth:= 30;     // division

  for I:= 3 to FEndOfDataRow do
  begin
    S:= '=IF(AND(ISNUMBER(' + 'H' + IntToStr(I) +
        '),ISNUMBER('       + 'K' + IntToStr(I) +
        ')),'               + 'H' + IntToStr(I) +
        '*'                 + 'K' + IntToStr(I) +
        ',"")';
    DataSheet.Range['I' + IntToStr(I)].Formula:= S;
  end;


  DataSheet.Range[AExtPriceRange].FormulaHidden:= True;
end;

procedure TIQExportForecastToExcel.InsertVBACode;
var
  VBComp   : variant;
  VBCodeMod: variant;
  ALineNum : Integer;
  ACommand: TStringList;
begin
  ACommand := TStringList.Create;
  try
    //create temporary module
    VBComp:= Workbook.VBProject.VBComponents.Add(1);    //1 stands for standard code module (vbext_ct_StdModule)
    VBCodeMod:= VBComp.CodeModule;

    ALineNum := VBCodeMod.CountOfLines + 1;

    // Fore_rscstr.cRsc0008 = 'Data';
    ACommand.Add('Sub CreateCommandButtonsProcedure(ByVal CmdLeft As Double, ByVal CmdCaption As String, ByVal CmdName As String)');
    ACommand.Add('  Dim ws As Excel.Worksheet                                                                                    ');
    ACommand.Add('  Set ws = ActiveWorkbook.Worksheets("' + FixStr(Fore_rscstr.cRsc0008) + '")                                                                   ');
    ACommand.Add('                                                                                                               ');
    ACommand.Add('  Dim oleObjs As OLEObjects                                                                                    ');
    ACommand.Add('  Set oleObjs = ws.OLEObjects                                                                                  ');
    ACommand.Add('                                                                                                               ');
    ACommand.Add('  Dim ole As OLEObject                                                                                         ');
    ACommand.Add('  Set ole = oleObjs.Add(ClassType:="Forms.CommandButton.1", Link:=False, DisplayAsIcon:=False, Left:=CmdLeft, Top:=1.5, Width:=57, Height:=22.5)');
    ACommand.Add('                                                                                                               ');
    ACommand.Add('  ole.Object.Caption = CmdCaption                                                                              ');
    ACommand.Add('                                                                                                               ');
    ACommand.Add('  ole.Name = CmdName                                                                                           ');
    ACommand.Add('End Sub');
    VBCodeMod.InsertLines( ALineNum, ACommand.Text);
    Excel.Run ('CreateCommandButtonsProcedure', 436.5, 'Duplicate', 'cmdCopyRec'  );
    Excel.Run ('CreateCommandButtonsProcedure', 495.5, 'Delete',    'cmdDeleteRec');
    ACommand.Clear;

    ALineNum := VBCodeMod.CountOfLines + 1;
    // Fore_rscstr.cRsc0008 = 'Data';
    // Fore_rscstr.cRsc0009 = 'Please select a row that contains data first';
    // Fore_rscstr.cRsc0010 = 'Delete record?';
    // Fore_rscstr.cRsc0011 = 'Confirmation';
    // Fore_rscstr.cRsc0012 = 'Please select a row that contains data.';
    ACommand.Add('Sub InsertVBACodeProcedure()'                                                                              );
    ACommand.Add('  With ActiveWorkbook.VBProject.VBComponents(ActiveWorkbook.ActiveSheet.CodeName).CodeModule'                                         );
    ACommand.Add('    .InsertLines 1, "Option Explicit"'                                                                     );
    ACommand.Add('    .InsertLines 2, "Private Sub Worksheet_Change(ByVal Target As Excel.Range)"'                           );
    ACommand.Add('    .InsertLines 3, "  Dim ws As Excel.Worksheet"'                                                         );
    ACommand.Add('    .InsertLines 4, "  Dim UsedRows As Integer"'                                                           );
    ACommand.Add('    .InsertLines 5, "  On Error Resume Next"'                                                              );
    ACommand.Add('    .InsertLines 6, "  Set ws = ActiveWorkbook.Worksheets(" + chr(34) + "' + FixStr(Fore_rscstr.cRsc0008) + '" + chr(34) + ")"');
    ACommand.Add('    .InsertLines 7, "  If Not Err = 0 Then Exit Sub"'                                                      );
    ACommand.Add('    .InsertLines 8, "  UsedRows = ws.UsedRange.Rows.Count"'                                                );
    ACommand.Add('    .InsertLines 9, "  Call DoDateValidation(Target.Address, UsedRows)"'                                   );
    ACommand.Add('    .InsertLines 10, "  Call DoQtyValidation(Target.Address, UsedRows)"'                                   );
    ACommand.Add('    .InsertLines 11, "  Call DoPriceValidation(Target.Address, UsedRows)"'                                 );
    ACommand.Add('    .InsertLines 12, "End Sub"'                                                                            );
    ACommand.Add('    .InsertLines 13, "Private Sub cmdCopyRec_Click()"'                                                     );
    ACommand.Add('    .InsertLines 14, "  Dim ws As Excel.Worksheet"'                                                        );
    ACommand.Add('    .InsertLines 15, "  Dim CellAddr As String"'                                                           );
    ACommand.Add('    .InsertLines 16, "  Dim ValidRange As Range"'                                                          );
    ACommand.Add('    .InsertLines 17, "  Dim UserRange As Range"'                                                           );
    ACommand.Add('    .InsertLines 18, "  Dim UsedRows As Integer"'                                                          );
    ACommand.Add('    .InsertLines 19, "  CellAddr = ActiveCell.Address"'                                                    );
    ACommand.Add('    .InsertLines 20, "  Set ws = ActiveWorkbook.Worksheets(" + chr(34) + "' + FixStr(Fore_rscstr.cRsc0008) + '" + chr(34) + ")"'           );
    ACommand.Add('    .InsertLines 21, "  UsedRows = ws.UsedRange.Rows.Count "'                                              );
    ACommand.Add('    .InsertLines 22, "  Set ValidRange = Range(" + chr(34) + "A3:Z" + chr(34) + " + Trim(Str(UsedRows)))"' );
    ACommand.Add('    .InsertLines 23, "  Set UserRange = Range(CellAddr)"'                                                  );
    ACommand.Add('    .InsertLines 24, "  If Not InRange(UserRange, ValidRange) Then"'                                       );
    ACommand.Add('    .InsertLines 25, "    MsgBox " + chr(34) + "' + FixStr(Fore_rscstr.cRsc0009) + '" + chr(34)'   );
    ACommand.Add('    .InsertLines 26, "    ws.Range(CellAddr).Select"'                                                      );
    ACommand.Add('    .InsertLines 27, "    Exit Sub"'                                                                       );
    ACommand.Add('    .InsertLines 28, "  End If"'                                                                           );
    ACommand.Add('    .InsertLines 29, "  ws.Unprotect"'                                                                     );
    ACommand.Add('    .InsertLines 30, "  ws.Range(CellAddr).EntireRow.Select"'                                              );
    ACommand.Add('    .InsertLines 31, "  Selection.Copy"'                                                                   );
    ACommand.Add('    .InsertLines 32, "  Selection.Insert Shift:=xlDown"'                                                   );
    ACommand.Add('    .InsertLines 33, "  ActiveCell.Offset(rowOffset:=1, columnOffset:=10).Activate"'                       );
    ACommand.Add('    .InsertLines 34, "  ActiveCell.Value = " + chr(34) + chr(34)'                                          );
    ACommand.Add('    .InsertLines 35, "  ActiveCell.Offset(rowOffset:=0, columnOffset:=-1).Activate"'                       );
    ACommand.Add('    .InsertLines 36, "  ActiveCell.Value = " + chr(34) + chr(34)'                                          );
    ACommand.Add('    .InsertLines 37, "  ws.Protect"'                                                                       );
    ACommand.Add('    .InsertLines 38, "End Sub"'                                                                            );
    ACommand.Add('    .InsertLines 39, "Private Sub cmdDeleteRec_Click()"'                                                   );
    ACommand.Add('    .InsertLines 40, "  Dim ws As Excel.Worksheet"'                                                        );
    ACommand.Add('    .InsertLines 41, "  Dim CellAddr As String"'                                                           );
    ACommand.Add('    .InsertLines 42, "  Dim ValidRange As Range"'                                                          );
    ACommand.Add('    .InsertLines 43, "  Dim UserRange As Range"'                                                           );
    ACommand.Add('    .InsertLines 44, "  Dim UsedRows As Integer"'                                                          );
    ACommand.Add('    .InsertLines 45, "  Dim Msg As String"'                                                                );
    ACommand.Add('    .InsertLines 46, "  Dim Title As String"'                                                              );
    ACommand.Add('    .InsertLines 47, "  Dim Style As Integer"'                                                             );
    ACommand.Add('    .InsertLines 48, "  Dim Response As Integer"'                                                          );
    ACommand.Add('    .InsertLines 49, "  CellAddr = ActiveCell.Address"'                                                    );
    ACommand.Add('    .InsertLines 50, "  Set ws = ActiveWorkbook.Worksheets(" + chr(34) + "' + FixStr(Fore_rscstr.cRsc0008) + '" + chr(34) + ")"'           );
    ACommand.Add('    .InsertLines 51, "  UsedRows = ws.UsedRange.Rows.Count"'                                               );
    ACommand.Add('    .InsertLines 52, "  Set ValidRange = Range(" + chr(34) + "A3:Z" + chr(34) + " + Trim(Str(UsedRows)))"' );
    ACommand.Add('    .InsertLines 53, "  Set UserRange = Range(CellAddr)"'                                                  );
    ACommand.Add('    .InsertLines 54, "  If Not InRange(UserRange, ValidRange) Then"'                                       );
    ACommand.Add('    .InsertLines 55, "    MsgBox " + chr(34) + "' + FixStr(Fore_rscstr.cRsc0012) + '" + chr(34)'   );
    ACommand.Add('    .InsertLines 56, "    ws.Range(CellAddr).Select"'                                                      );
    ACommand.Add('    .InsertLines 57, "    Exit Sub"'                                                                       );
    ACommand.Add('    .InsertLines 58, "  End If"'                                                                           );
    ACommand.Add('    .InsertLines 59, "  Msg = " + chr(34) + "' + FixStr(Fore_rscstr.cRsc0010) + '" + chr(34)'                      );
    ACommand.Add('    .InsertLines 60, "  Style = vbYesNo + vbCritical + vbDefaultButton2"'                                  );
    ACommand.Add('    .InsertLines 61, "  Title = " + chr(34) + "' + FixStr(Fore_rscstr.cRsc0011) + '" + chr(34)'                    );
    ACommand.Add('    .InsertLines 62, "  Response = MsgBox(Msg, Style, Title)"'                                             );
    ACommand.Add('    .InsertLines 63, "  If Response = vbYes Then"'                                                         );
    ACommand.Add('    .InsertLines 64, "    With ws"'                                                                        );
    ACommand.Add('    .InsertLines 65, "      .Unprotect"'                                                                   );
    ACommand.Add('    .InsertLines 66, "      .Range(CellAddr).EntireRow.Select"'                                            );
    ACommand.Add('    .InsertLines 67, "      Selection.Delete Shift:=xlUp"'                                                 );
    ACommand.Add('    .InsertLines 68, "      .Range(CellAddr).Select"'                                                      );
    ACommand.Add('    .InsertLines 69, "      .Protect"'                                                                     );
    ACommand.Add('    .InsertLines 70, "    End With"'                                                                       );
    ACommand.Add('    .InsertLines 71, "  Else"'                                                                             );
    ACommand.Add('    .InsertLines 72, "    ws.Range(CellAddr).Select"'                                                      );
    ACommand.Add('    .InsertLines 73, "    Exit Sub"'                                                                       );
    ACommand.Add('    .InsertLines 74, "  End If"'                                                                           );
    ACommand.Add('    .InsertLines 75, "End Sub"'                                                                            );
    ACommand.Add('  End With'                                                                                                );
    ACommand.Add('End Sub');
    VBCodeMod.InsertLines( ALineNum,  ACommand.Text);
    // Run it
    Excel.Run('InsertVBACodeProcedure');
    ACommand.Clear;

    //delete temporary module
    Workbook.VBProject.VBComponents.Remove( VBComp );

    //create module "mMisc"
    VBComp:= Workbook.VBProject.VBComponents.Add(1);
    VBComp.Name:= 'mMisc';

    VBCodeMod:= VBComp.CodeModule;

    ALineNum := VBCodeMod.CountOfLines + 1;
    ACommand.Add('Option Explicit'                                                                          );
    ACommand.Add('Function SundayOf(nday) As Date'                                                          );
    ACommand.Add('  SundayOf = nday - Weekday(nday) + 1'                                                    );
    ACommand.Add('End Function'                                                                             );
    ACommand.Add(''                                                                                         );
    ACommand.Add('Function WeekOf(nday) As Long'                                                            );
    ACommand.Add('  Dim first_day_of_year As Date'                                                          );
    ACommand.Add('  Dim preceding_sunday  As Date'                                                          );
    ACommand.Add('  first_day_of_year = DateSerial(Year(nday), 1, 1)'                                       );
    ACommand.Add('  preceding_sunday = SundayOf(nday)'                                                      );
    ACommand.Add('  If preceding_sunday > first_day_of_year Then'                                           );
    ACommand.Add('    WeekOf = (preceding_sunday - SundayOf(first_day_of_year)) / 7'                        );
    ACommand.Add('  Else'                                                                                   );
    ACommand.Add('     WeekOf = (preceding_sunday - SundayOf(DateSerial(Year(preceding_sunday), 1, 1))) / 7');
    ACommand.Add('  End If'                                                                                 );
    ACommand.Add('End Function'                                                                             );
    ACommand.Add(''                                                                                         );
    ACommand.Add('Function InRange(rng1, rng2) As Boolean'                                                  );
    ACommand.Add('''Returns True if rng1 is a subset of rng2'                                               );
    ACommand.Add('  InRange = False'                                                                        );
    ACommand.Add('  If rng1.Parent.Parent.Name = rng2.Parent.Parent.Name Then'                              );
    ACommand.Add('      If rng1.Parent.Name = rng2.Parent.Name Then'                                        );
    ACommand.Add('          If Union(rng1, rng2).Address = rng2.Address Then'                               );
    ACommand.Add('              InRange = True'                                                             );
    ACommand.Add('          End If'                                                                         );
    ACommand.Add('      End If'                                                                             );
    ACommand.Add('  End If'                                                                                 );
    ACommand.Add('End Function'                                                                             );
    ACommand.Add(''                                                                                         );
    ACommand.Add('Sub DoDateValidation(ByVal CellAddr As String, ByVal UsedRows As Integer)'                );
    ACommand.Add('  Dim ValidRange As Range'                                                                );
    ACommand.Add('  Dim UserRange As Range'                                                                 );
    ACommand.Add('  Dim Arinvt_id As Integer'                                                               );
    ACommand.Add('  Dim Arcusto_id As Integer'                                                              );
    ACommand.Add('  Dim nDate As Date'                                                                      );
    ACommand.Add('  Dim c As Object'                                                                        );
    ACommand.Add('  Set ValidRange = Range("J3:J" + Trim(Str(UsedRows)))'                                   );
    ACommand.Add('  Set UserRange = Range(CellAddr)'                                                        );
    ACommand.Add('  If InRange(UserRange, ValidRange) Then'                                                 );
    ACommand.Add('    If UserRange.Value = Empty Then Exit Sub'                                             );
    ACommand.Add('    Arinvt_id = Range("B" + Trim(Str(UserRange.Row))).Value'                              );
    ACommand.Add('    Arcusto_id = Range("F" + Trim(Str(UserRange.Row))).Value'                             );
    ACommand.Add('    For Each c In Range("B3:B" + Trim(Str(UsedRows)))'                                    );
    ACommand.Add('      If c = Arinvt_id And c.Row <> UserRange.Row Then'                                   );
    ACommand.Add('        If Range("F" + Trim(Str(c.Row))).Value = Arcusto_id Then'                         );
    ACommand.Add('          nDate = Range("J" + Trim(Str(c.Row))).Value'                                    );
    ACommand.Add('            If WeekOf(UserRange.Value) = WeekOf(nDate) Then'                              );
    ACommand.Add('              MsgBox "This week is already reserved, see Row# " & c.Row'                  );
    ACommand.Add('              UserRange.Value = "":   UserRange.Select'                                   );
    ACommand.Add('            End If'                                                                       );
    ACommand.Add('        End If'                                                                           );
    ACommand.Add('      End If'                                                                             );
    ACommand.Add('    Next'                                                                                 );
    ACommand.Add('  End If'                                                                                 );
    ACommand.Add('End Sub'                                                                                  );
    ACommand.Add(''                                                                                         );
    ACommand.Add('Sub DoQtyValidation(ByVal CellAddr As String, ByVal UsedRows As Integer)'                 );
    ACommand.Add('  Dim ValidRange As Range'                                                                );
    ACommand.Add('  Dim UserRange As Range'                                                                 );
    ACommand.Add('  Set ValidRange = Range("K3:K" + Trim(Str(UsedRows)))'                                   );
    ACommand.Add('  Set UserRange = Range(CellAddr)'                                                        );
    ACommand.Add('  If InRange(UserRange, ValidRange) Then'                                                 );
    ACommand.Add('     If IsNumeric(UserRange.Value) And UserRange.Value >= 0 Then'                         );
    ACommand.Add('        Exit Sub'                                                                         );
    ACommand.Add('     Else'                                                                                );
    ACommand.Add('        MsgBox "Must be valid quantity"'                                                  );
    ACommand.Add('        UserRange.Value = "":   UserRange.Select'                                         );
    ACommand.Add('     End If'                                                                              );
    ACommand.Add('  End If'                                                                                 );
    ACommand.Add('End Sub'                                                                                  );
    ACommand.Add(''                                                                                         );
    ACommand.Add('Sub DoPriceValidation(ByVal CellAddr As String, ByVal UsedRows As Integer)'               );
    ACommand.Add('  Dim ValidRange As Range'                                                                );
    ACommand.Add('  Dim UserRange As Range'                                                                 );
    ACommand.Add('  Set ValidRange = Range("H3:H" + Trim(Str(UsedRows)))'                                   );
    ACommand.Add('  Set UserRange = Range(CellAddr)'                                                        );
    ACommand.Add('  If InRange(UserRange, ValidRange) Then'                                                 );
    ACommand.Add('     If IsNumeric(UserRange.Value) And UserRange.Value >= 0 Then'                         );
    ACommand.Add('        Exit Sub'                                                                         );
    ACommand.Add('     Else'                                                                                );
    ACommand.Add('        MsgBox "Must be valid price"'                                                     );
    ACommand.Add('        UserRange.Value = "":   UserRange.Select'                                         );
    ACommand.Add('     End If'                                                                              );
    ACommand.Add('  End If'                                                                                 );
    ACommand.Add('End Sub'                                                                                  );
    VBCodeMod.InsertLines( ALineNum, ACommand.Text);
  finally
    FreeAndNil(ACommand);
  end;
end;

procedure TIQExportForecastToExcel.FormatCellText;
var
  VBComp   : variant;
  VBCodeMod: variant;
  ALineNum : Integer;
begin
  //create temporary module
  VBComp:= Workbook.VBProject.VBComponents.Add(1);    //1 stands for standard code module (vbext_ct_StdModule)
  VBCodeMod:= VBComp.CodeModule;
  // 06/24/2013 Format cells as text.
  // Step 1: Set the default column format to Text.  This is done by assigning
  // the @ sign as the format.  This can only be done using a macro; it does
  // not work using the VBA command through DCOM.
  // Column 1 = ARINVT.ITEMNO
  // Column 3 = ARINVT.DESCRIP
  // Column 4 = ARINVT.REF
  // Column 5 = ARCUSTO.COMPANY
  // Column 7 = ARCUSTO.CUSTNO
  // Column 12 = ARCUSTO.SHIP_TO_ATTN
  // Column 13 = ARINVT.DESC2
  // Step 2:  Loop the cells and remove the trailing underscore, if it was
  // applied.  Purely number values in text fields will be formatted as
  // numbers.  We resort to a trick to force it to be formatted as text.
  ALineNum := VBCodeMod.CountOfLines + 1;
  VBCodeMod.InsertLines( ALineNum,
    'Private Sub FormatCellText()                                            '#13 +
    '    On Error Goto ErrHandler::                                          '#13 +
    '    Dim ws As Excel.Worksheet, cellRange As Range, cell As Range        '#13 +
    '    Dim fieldValue As String, fieldLength As Long, usedRows As Long     '#13 +
    '                                                                        '#13 +
    '    ''Set the current worksheet.                                        '#13 +
    '    Set ws = ActiveWorkbook.Worksheets("Data")                          '#13 +
    '    ''Unprotect the document.                                           '#13 +
    '    ws.Unprotect                                                        '#13 +
    '                                                                        '#13 +
    '    ''Set column format as Text.                                        '#13 +
    '    ''Each column index represents a DataSet field.                     '#13 +
    '    ws.Columns(1).NumberFormat = "@"                                    '#13 +
    '    ws.Columns(3).NumberFormat = "@"                                    '#13 +
    '    ws.Columns(4).NumberFormat = "@"                                    '#13 +
    '    ws.Columns(5).NumberFormat = "@"                                    '#13 +
    '    ws.Columns(7).NumberFormat = "@"                                    '#13 +
    '    ws.Columns(12).NumberFormat = "@"                                   '#13 +
    '    ws.Columns(13).NumberFormat = "@"                                   '#13 +
    '                                                                        '#13 +
    '    ''Get the number of rows in the worksheet.                          '#13 +
    '    usedRows = ws.UsedRange.Rows.Count                                  '#13 +
    '    ''Set the cell range to all of the data cells.                      '#13 +
    '    Set cellRange = Range("A3:Z" + Trim(Str(usedRows)))                 '#13 +
    '    ''Loop each cell and remove the ending underscore.                  '#13 +
    '    For Each cell In cellRange                                          '#13 +
    '        ''Get the cell value.                                           '#13 +
    '        fieldValue = cell.Value                                         '#13 +
    '        ''Get the cell length.                                          '#13 +
    '        fieldLength = Len(fieldValue)                                   '#13 +
    '        ''If the cell has the closing underscore, remove it.            '#13 +
    '        If (fieldLength >= 5) And (Right(fieldValue, 5) = "    _") Then '#13 +
    '            cell.Value = Trim(Left(fieldValue, fieldLength - 1))        '#13 +
    '        End If                                                          '#13 +
    '    Next                                                                '#13 +
    '                                                                        '#13 +
    '    ErrHandler:                                                         '#13 +
    '    ''Protect the document again.                                       '#13 +
    '    ws.Protect                                                          '#13 +
    'End Sub                                                                 ');
  Excel.Run('FormatCellText');
  //delete temporary module
  Workbook.VBProject.VBComponents.Remove( VBComp );
end;

procedure TIQExportForecastToExcel.FreezePanes;
begin
  DataSheet.Range['A3:A3'].EntireRow.Activate; 
  Excel.ActiveWindow.FreezePanes:= True;
  DataSheet.Range['A3:A3'].Select;
end;

procedure TIQExportForecastToExcel.SaveWorkBook(AFileName: string);
begin
  DeleteIfExists(AFileName);
  DataSheet.SaveAs( AFileName, xlOpenXMLWorkbookMacroEnabled );
  DataSheet.Protect;
  WorkBook.Save;
end;

procedure TIQExportForecastToExcel.DeleteIfExists(AFileName: string);
var
  ACode: Integer;
begin
  if FileExists(AFileName) then
    if not DeleteFile(AFileName) then
    begin
      ACode:= GetLastError;
      // Fore_rscstr.cRsc0006 =
      // 'Unable to overwrite file %s. Error Code = %d';
      raise Exception.CreateFmt(Fore_rscstr.cRsc0006, [ AFileName, ACode ]);
    end;
end;

procedure TIQExportForecastToExcel.CloseExcelNoSave;
begin
  try
    if not Variants.VarIsEmpty(WorkBook) then
      WorkBook.Close(False);
    if not Variants.VarIsEmpty(Excel) then
      Excel.Quit;
  except // suppress
  end;
end;

END.


