//*****************************************************************
//                      Randall L. Pleasant
//                      3912 Crossbow Lane
//                      Flower Mound, Texas
//
//             Copyright (c) 1998  All rights reserved
//
// This component provides an interface for building pivot tables
// in Microsoft Excel.  All of the OLE automation code that is
// used to control Excel is encapsulated within the properties and
// methods of the component.
//*****************************************************************

unit IQMS.WebVcl.ExcelTbl;

interface

uses
  Windows,  Messages,
  SysUtils, Classes,
  Graphics, Controls,
  Forms,    Dialogs,
  DB,       IQMS.WebVcl.Excelpiv;

type
  TOnBeforeExecute = procedure (Sender: TObject; ContinueExecution: boolean) of object;

  TDataCalculation = (dcNormal, dcDifferenceFrom, dcPercentOf,
                      dcPercentDifferenceFrom, dcRunningTotal, dcPercentOfRow,
                      dcPercentOfColumn, dcPercentOfTotal, dcIndex);

  TDataFunction = (dfAverage, dfCount, dfCountNums, dfMax, dfMin, dfProduct,
                   dfStDev, dfStDevP, dfSum, dfVar, dfVarP);

  TExportMethod = (emOLE, emTextFile);

  TIQWebPivotTable = class(TComponent)
  private
    FActive : boolean;
    FExcelFileName : TFileName;
    FExportFileName : TFileName;
    FDataSet : TDataSet;
    FReportTitle : string;
    FDataSheetName : string;
    FAnalysisSheetName : string;
    FRowFields : TStrings;
    FColumnFields : TStrings;
    FValueFields : TStrings;
    FDataFieldCalculation : TDataCalculation;
    FDataFieldFunction : TDataFunction;
    FExcelWindowState : TWindowState;
    FExportMethod : TExportMethod;
    // Events
    FOnBeforeExecute : TOnBeforeExecute;
    FOnAfterExecute : TNotifyEvent;
    function GetDataFieldCalculation : integer;
    function GetDataFieldFunction : integer;
    function GetExcelWindowState : integer;
    function CreateExportObject : TIQWebExportToExcel;
    procedure SetRowFields(Value: TStrings);
    procedure SetColumnFields(Value: TStrings);
    procedure SetValueFields(Value: TStrings);
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetActive(Value: boolean);
  protected
  public     
    CS : TRTLCriticalSection;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure Execute;
  published
    property Active : boolean read FActive write SetActive;
    property ExcelFileName : TFileName read FExcelFileName write FExcelFileName;
    property ExportFileName : TFileName read FExportFileName write FExportFileName;
    property DataSet : TDataSet read FDataSet write FDataSet;
    property ExcelWindowState : TWindowState read FExcelWindowState write FExcelWindowState;
    property ExportMethod : TExportMethod read FExportMethod write FExportMethod;
    property ReportTitle : string read FReportTitle write FReportTitle;
    property DataSheetName : string read FDataSheetName write FDataSheetName;
    property AnalysisSheetName : string read FAnalysisSheetName write FAnalysisSheetName;
    property RowFields : TStrings read FRowFields write SetRowFields;
    property ColumnFields : TStrings read FColumnFields write SetColumnFields;
    property ValueFields : TStrings read FValueFields write SetValueFields;
    property DataFieldCalculation : TDataCalculation read FDataFieldCalculation write FDataFieldCalculation;
    property DataFieldFunction : TDataFunction read FDataFieldFunction write FDataFieldFunction;
    // Events
    property OnBeforeExecute : TOnBeforeExecute read FOnBeforeExecute write FOnBeforeExecute;
    property OnAfterExecute : TNotifyEvent read FOnAfterExecute write FOnAfterExecute;
  end;

implementation

uses
    IQMS.WebVcl.ResourceStrings;

constructor TIQWebPivotTable.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);

  FDataSet := nil;
  FRowFields := TStringList.Create;
  FColumnFields := TStringList.Create;
  FValueFields := TStringList.Create;
  FActive := False;
  FExcelFileName := '';
  FExportFileName := 'c:\temp.txt';
  FReportTitle := '';
  FDataSheetName := '';
  FAnalysisSheetName := '';
  FDataFieldCalculation := dcNormal;
  FDataFieldFunction := dfSum;
  FExcelWindowState := wsNormal;
  FExportMethod := emOLE;
  InitializeCriticalSection( CS );
end;                          

destructor TIQWebPivotTable.Destroy;
begin
  FRowFields.Free;
  FColumnFields.Free;
  FValueFields.Free;
  DeleteCriticalSection( CS );
  
  inherited Destroy;
end;

procedure TIQWebPivotTable.Notification(AComponent: TComponent; Operation: TOperation);
begin
  If FDataSet <> nil Then
  Begin
    If (AComponent = FDataSet) And (Operation = opRemove) Then
      FDataSet := nil;
  End;
end;

procedure TIQWebPivotTable.SetActive(Value: boolean);
begin
  Try
    If FActive <> Value Then
    Begin
      FActive := Value;
      If FActive Then Execute;
    End;
  Except
    Raise;
  End;
end;

// Builds the pivot table by creating the thread object encapsulating
// the data export process and the building of the pivot table.
procedure TIQWebPivotTable.Execute;
var
  ExcelTable : TIQWebExcelPivotTable;
  ContinueExecution : boolean;
begin
  ContinueExecution := True;
  If Assigned(FOnBeforeExecute) Then
    FOnBeforeExecute(Self, ContinueExecution);

  If Not ContinueExecution Then Exit;

  Try
    FActive := True;

    // Make sure the DataSet property has been set.
    If Assigned(FDataSet) Then
    Begin
      Try
        ExcelTable := TIQWebExcelPivotTable.Create( self );
        ExcelTable.DataSet := FDataSet;
        ExcelTable.Title := FReportTitle;
        ExcelTable.ExcelFileName := FExcelFileName;
        ExcelTable.ExportFileName := FExportFileName;
        ExcelTable.DataSheetName := FDataSheetName;
        ExcelTable.AnalysisSheetName := FAnalysisSheetName;
        ExcelTable.RowFields.Assign(FRowFields);
        ExcelTable.ColumnFields.Assign(FColumnFields);
        ExcelTable.ValueFields.Assign(FValueFields);
        ExcelTable.DataFieldCalculation := GetDataFieldCalculation;
        ExcelTable.DataFieldFunction := GetDataFieldFunction;
        ExcelTable.WindowState := GetExcelWindowState;
        ExcelTable.SetExportObject(CreateExportObject);
        ExcelTable.Resume;

        If CSDesigning In ComponentState Then
          {'The Excel pivot table is being created.  Do not change the ' +
           'export method during processing.  Please note that in design ' +
           'mode calculated fields are not calculated.' }
          MessageDlg(IQMS.WebVcl.ResourceStrings.cTXT0000022, mtInformation, [mbOk], 0);
      Except
        Raise;
      End;
    End;
  Finally
    FActive := False;
  End;

  If Assigned(FOnAfterExecute) Then
    FOnAfterExecute(Self);
end;

// Returns an object which encapsulates the type of data export method selected.
function TIQWebPivotTable.CreateExportObject : TIQWebExportToExcel;
begin
  Try
    If FExportMethod = emOLE Then
      Result := TIQWebExportOLE.Create
    Else If FExportMethod = emTextFile Then
      Result := TIQWebExportTextFile.Create
    Else
      Result := TIQWebExportOLE.Create;
  Except
    Raise;
  End;
end;

procedure TIQWebPivotTable.SetRowFields(Value: TStrings);
begin
  Try
    If Assigned(Value) Then FRowFields.Assign(Value);
  Except
    Raise;
  End;
end;

procedure TIQWebPivotTable.SetColumnFields(Value: TStrings);
begin
  Try
    If Assigned(Value) Then FColumnFields.Assign(Value);
  Except
    Raise;
  End;
end;

procedure TIQWebPivotTable.SetValueFields(Value: TStrings);
begin
  Try
    If Assigned(Value) Then FValueFields.Assign(Value);
  Except
    Raise;
  End;
end;

// Returns an integer value representing the "calculation" type
// of the data fields in the Excel pivot table.
function TIQWebPivotTable.GetDataFieldCalculation : integer;
begin
  Case FDataFieldCalculation of
    dcNormal:
      Result := XL_NORMAL;
    dcDifferenceFrom:
      Result := XL_DIFFERENCEFROM;
    dcPercentOf:
      Result := XL_PERCENTOF;
    dcPercentDifferenceFrom:
      Result := XL_PERCENTDIFFERENCEFROM;
    dcRunningTotal:
      Result := XL_RUNNINGTOTAL;
    dcPercentOfRow:
      Result := XL_PERCENTOFROW;
    dcPercentOfColumn:
      Result := XL_PERCENTOFCOLUMN;
    dcPercentOfTotal:
      Result := XL_PERCENTOFTOTAL;
    dcIndex:
      Result := XL_INDEX;
  Else
    Result := XL_NORMAL;
  End;
end;

// Returns an integer value representing the "function" type
// of the data fields in the Excel pivot table.
function TIQWebPivotTable.GetDataFieldFunction : integer;
begin
  Case FDataFieldFunction of
    dfAverage:
      Result := XL_AVERAGE;
    dfCount:
      Result := XL_COUNT;
    dfCountNums:
      Result := XL_COUNTNUMS;
    dfMax:
      Result := XL_MAX;
    dfMin:
      Result := XL_MIN;
    dfProduct:
      Result := XL_PRODUCT;
    dfStDev:
      Result := XL_STDEV;
    dfStDevP:
      Result := XL_STDEVP;
    dfSum:
      Result := XL_SUM;
    dfVar:
      Result := XL_VAR;
    dfVarP:
      Result := XL_VARP;
  Else
    Result := XL_SUM;
  End;
end;

// Returns an integer value representing the window state
// in which to open Microsoft Excel.
function TIQWebPivotTable.GetExcelWindowState : integer;
begin
  Case FExcelWindowState of
    wsNormal:
      Result := XL_NORMAL;
    wsMinimized:
      Result := XL_MINIMIZED;
    wsMaximized:
      Result := XL_MAXIMIZED;
  Else
    Result := XL_NORMAL;
  End;
end;

END.
