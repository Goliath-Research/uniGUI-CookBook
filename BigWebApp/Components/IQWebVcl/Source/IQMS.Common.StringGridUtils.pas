unit IQMS.Common.StringGridUtils;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,UniStringGrid,
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  Vcl.ExtCtrls;

{ How to use TIQStringGridRegister:

  1.  Create the TIQStringGridRegister component, passing the target
  TStringGrid to the constructor.
  2.  Call Prepare() or use AddColumn() to initialize the grid with field
      names and captions.
  3.  Call SetData() to add cell data.
  4.  To read cell data, call GetData().
}

type
  { TIQWebStringGridRegister }
  TIQWebStringGridRegister = class(TComponent)
  strict private
    { Private declarations }
    FFieldCells: TStringList;
    FGrid: TUniStringGrid;
    FAutoSizeCells: Boolean;
    FSavedOnColumnMoved: TMovedEvent;
    procedure CheckGridAssigned;
    procedure DoOnColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AGrid: TUniStringGrid);
    destructor Destroy; override;

    /// <summary> Clear the grid. </summary>
    procedure Clear;

    /// <summary> Initialize the grid field names and captions.  This will
    /// also clear the grid of all data.
    /// </summary>
    procedure Prepare(const AFieldNames: array of string;
      const ACaptions: array of string);

    /// <summary> Add a new field. </summary>
    procedure AddColumn(const AFieldName, ACaption: string);

    /// <summary> Get cell data. </summary>
    function GetData(const AFieldName: string;
      const ARow: Integer): string;

    /// <summary> Set cell data. </summary>
    procedure SetData(const AFieldName: string;
      const ARow: Integer; const AData: string); overload;
    procedure SetData(const AFieldName: string;
      const ARow: Integer; const AData: Real); overload;
    procedure SetData(const AFieldName: string;
      const ARow: Integer; const AData: Integer); overload;

    /// <summary> Delete a row, by row number. </summary>
    procedure DeleteRow(const ARow: Integer);
    procedure DeleteSelectedRow;

    /// <summary> Get the column index for the provided field name. </summary>
    function ColByName(const AFieldName: string): Integer;

    /// <summary> Get the column name for the give index. </summary>
    function ColName(const ACol: Integer): string;

    /// <summary> The string grid.  </summary>
    property Grid: TUniStringGrid read FGrid;

    /// <summary> Automatically size the cell width to the largest data, when
    /// data is added.
    /// </summary>
    property AutoSizeCells: Boolean read FAutoSizeCells write FAutoSizeCells;
  end;

implementation

uses
  IQMS.Common.Screen,
  IQMS.Common.StringUtils,
  System.Math;

{$REGION 'TIQWebStringGridRegister'}


constructor TIQWebStringGridRegister.Create(AOwner: TComponent;
  AGrid: TUniStringGrid);
begin
  inherited Create(AOwner);
  FGrid := AGrid;
//  FSavedOnColumnMoved := AGrid.OnColumnMoved;
//  FGrid.OnColumnMoved := DoOnColumnMoved;
  FFieldCells := TStringList.Create;
  FAutoSizeCells := False;
end;

destructor TIQWebStringGridRegister.Destroy;
begin
  if Assigned(FFieldCells) then
    FreeAndNil(FFieldCells);
  inherited;
end;

procedure TIQWebStringGridRegister.DoOnColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  // If the use moves a column, also move the item in the list so
  // that the grid and the list are in sync.
  FFieldCells.Move(FromIndex, ToIndex);

  if Assigned(FSavedOnColumnMoved) then
    FSavedOnColumnMoved(Sender, FromIndex, ToIndex);
end;

procedure TIQWebStringGridRegister.CheckGridAssigned;
begin
  if (FGrid = nil) then
    raise Exception.Create('Application Error: String grid not assigned.');
end;

procedure TIQWebStringGridRegister.Clear;
var
  i: Integer;
begin
  CheckGridAssigned;

  with FGrid do
    for i := 1 to RowCount - 1 do
      begin
        Row := 1;
        DeleteSelectedRow;
      end;

  FGrid.RowCount := 2;
  FGrid.ColCount := 2;
  FGrid.Cells[1, 1] := '';
  FFieldCells.Clear;
end;

function TIQWebStringGridRegister.ColByName(const AFieldName: string): Integer;
begin
  Result := FFieldCells.IndexOf(AFieldName);
end;

function TIQWebStringGridRegister.ColName(const ACol: Integer): string;
begin
  Result := '';
  if (ACol >= 0) and (ACol < FFieldCells.Count) then
    Result := FFieldCells.Strings[ACol];
end;

procedure TIQWebStringGridRegister.Prepare(const AFieldNames,
  ACaptions: array of string);
var
  i: Integer;
begin
  CheckGridAssigned;

  // Clear grid and internal list
  Clear;

  // The field names and captions must match
  if High(AFieldNames) <> High(ACaptions) then
    raise Exception.Create(
      'Application Error:  Count of field name and caption arrays do not match.');

  // Ensure first row is a header
  if FGrid.FixedRows = 0 then
    FGrid.FixedRows := 1;

  // Add the header row
  for i := Low(AFieldNames) to High(AFieldNames) do
    AddColumn(AFieldNames[i], ACaptions[i]);
end;

procedure TIQWebStringGridRegister.AddColumn(const AFieldName, ACaption: string);
var
  ACol: Integer;
  AUseFieldName: string;
begin
  CheckGridAssigned;
  // Ensure Oracle style field name
  AUseFieldName := Trim(UpperCase(System.SysUtils.StringReplace(AFieldName, ' ',
    '_',
    [rfReplaceAll, rfIgnoreCase])));
  AUseFieldName := AlphaNumeric(AUseFieldName);
  if FFieldCells.IndexOf(AUseFieldName) = - 1 then
    begin
      FFieldCells.Add(AUseFieldName);
      FGrid.ColCount := FFieldCells.Count;
      ACol := FFieldCells.IndexOf(AUseFieldName);
      FGrid.Cells[ACol, 0] := ACaption;
//      FGrid.Cols[ACol].Objects := TObject.Create;
      FGrid.ColWidths[ACol] := GetTextWidthPixels(ACaption,FGrid.Font) + 16;
    end;
end;

function TIQWebStringGridRegister.GetData(const AFieldName: string;
  const ARow: Integer): string;
var
  ACol: Integer;
begin
  Result := '';
  CheckGridAssigned;
  if FFieldCells.Count = 0 then
    Exit;
  ACol := FFieldCells.IndexOf(AFieldName);
  if ACol > - 1 then
    Result := FGrid.Cells[ACol, ARow];
end;

procedure TIQWebStringGridRegister.SetData(const AFieldName: string;
  const ARow: Integer; const AData: Real);
begin
  SetData(AFieldName, ARow, FloatToStr(AData));
end;

procedure TIQWebStringGridRegister.SetData(const AFieldName: string; const ARow,
  AData: Integer);
begin
  SetData(AFieldName, ARow, IntToStr(AData));
end;

procedure TIQWebStringGridRegister.SetData(const AFieldName: string;
  const ARow: Integer; const AData: string);
var
  ACol: Integer;
begin
  CheckGridAssigned;

  // Ensure there is a field list
  if FFieldCells.Count = 0 then
    Exit;

  // Increment the row
  if (ARow > FGrid.RowCount - 1) then
    FGrid.RowCount := FGrid.RowCount + 1;

  // Update the cell text
  ACol := FFieldCells.IndexOf(AFieldName);

  if ACol > - 1 then
    begin
      FGrid.Cells[ACol, ARow] := AData;
      if FAutoSizeCells then
        // Assign the maximum value up to 255
        {*UG_rem_AE*}
//        FGrid.ColWidths[ACol] :=
//          System.Math.MinIntValue(
//          [System.Math.MaxIntValue(
//          [FGrid.ColWidths[ACol],
//          iqscreen.GetTextWidthPixels(AData, FGrid.Font) + 16]),
//          255]);
    end;

end;

procedure TIQWebStringGridRegister.DeleteRow(const ARow: Integer);

  procedure ReAssignCells(AStartRow: Integer);
  var
    ACol: Integer;
  begin
    with FGrid do
      begin
        for ACol := 0 to ColCount - 1 do
          Cells[ACol, AStartRow] := Cells[ACol, AStartRow + 1];
//        Objects[0, AStartRow] := Objects[0, AStartRow + 1];
      end;
  end;

var
  i: Integer;
begin
  with FGrid do
    begin
      if Row = 0 then
        Exit
      else if (Row = 1) and (RowCount = 2) then
        Cells[0,Row] := ''
      else
        begin
          for i := Row to RowCount - 2 do
            ReAssignCells(i);
//          Objects[0, RowCount - 1].Free;
          RowCount := RowCount - 1;
        end;
    end;
end;

procedure TIQWebStringGridRegister.DeleteSelectedRow;
begin
  DeleteRow(Grid.Row);
end;

{$ENDREGION 'TIQWebStringGridRegister'}

end.
