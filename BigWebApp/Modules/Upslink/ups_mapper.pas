unit ups_mapper;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniStringGrid,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniMultiItem,
  uniComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet;

type
  TFrmUPSFieldMap = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlMain: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlGrid: TUniPanel;
    Grid: TUniStringGrid;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    edtDataFile: TUniEdit;
    SpeedButton1: TUniSpeedButton;
    Table1: TFDTable;
    cmbFieldList: TUniComboBox;
    Label2: TUniLabel;
    edtTableName: TUniEdit;
    procedure edtDataFileEnter(Sender: TObject);
    procedure edtDataFileExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure GridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure cmbFieldListClick(Sender: TObject);
    procedure cmbFieldListCloseUp(Sender: TObject);
    procedure cmbFieldListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FCellCol, FCellRow: Integer;
    procedure SetConnection;
    procedure LoadGrid;
    procedure LoadPreviousMap;
    procedure LoadFieldList;
  public
    { Public declarations }
  end;

  function MapShipmentFields : boolean;


implementation

{$R *.dfm}

uses
  upslink_rscstr,
//  dbtsel,
//  dbttypes,
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils;

function MapShipmentFields;
var
  FrmUPSFieldMap : TFrmUPSFieldMap;
begin
  FrmUPSFieldMap := TFrmUPSFieldMap.Create(UniApplication);
  with FrmUPSFieldMap do
  begin
    LoadGrid;
    LoadPreviousMap;
    Result := ShowModal = mrOk;
  end;
end;

procedure TFrmUPSFieldMap.edtDataFileEnter(Sender: TObject);
begin
  if edtDataFile.Text = upslink_rscstr.cTXT0000038 then
     begin
      edtDataFile.Clear;
      edtDataFile.Font.Color := clWindowText;
     end;
end;

procedure TFrmUPSFieldMap.edtDataFileExit(Sender: TObject);
begin
  if Trim(edtDataFile.Text) = '' then
     begin
      edtDataFile.Text := upslink_rscstr.cTXT0000038; // '<No file selected>'
      edtDataFile.Font.Color := clGray;
     end;
end;

procedure TFrmUPSFieldMap.SetConnection;
begin
//  edtDataFile.Text := Value;    ?
  edtDataFile.Font.Color := clWindowText;
end;

procedure TFrmUPSFieldMap.LoadFieldList;
begin
  //
end;

procedure TFrmUPSFieldMap.LoadGrid;
const
  cDefW = 200;
begin
//  with Grid do
//    begin
//       // ** Reset the grid **
//       RowCount := 5; // 5 fields, plus heading row
//       Rows[0].Text := Format( '%s'#13'%s', [upslink_rscstr.cTXT0000039 {'ShipperLink Field'}, upslink_rscstr.cTXT0000040 {'UPS Field'}] );
//       ColWidths[0] := cDefW;  // target
//       ColWidths[1] := cDefW;  // source
//       FixedCols    := 1; // left side
//
//       // ** Populate default ShipperLink fields **
//       Rows[1].Text := upslink_rscstr.cTXT0000025 + #13;  // Tracking Number
//       Rows[2].Text := upslink_rscstr.cTXT0000027 + #13;  // Weight
//       Rows[3].Text := upslink_rscstr.cTXT0000026 + #13;  // Freight Cost
//       Rows[4].Text := upslink_rscstr.cTXT0000024 + #13;  // Packing Slip #
//    end;

end;

procedure TFrmUPSFieldMap.LoadPreviousMap;
const
     cDefaultList = 'pkgTrackingNumber;siBillableWeight;siTotalShipperCharge;pkgPackageReference1';
var
   AFields: TStringList;
   i: Integer;
begin
  // Load previous settings from the dataset
  try
     AFields := TStringList.Create;
     StrToStringList(cDefaultList, AFields);
     with Grid do
     begin
       for i := 0 to AFields.Count - 1 do
        case i+1 of
         1: Cells[1,1] := AFields.Strings[i];    // Tracking Number
         2: Cells[1,2] := AFields.Strings[i];     // Weight
         3: Cells[1,3] := AFields.Strings[i]; // Freight Cost
         4: Cells[1,4] := AFields.Strings[i];  // Packing Slip #
        end;
     end;
  finally
     if Assigned(AFields) then FreeAndNil(AFields);
  end;
end;

procedure TFrmUPSFieldMap.SpeedButton1Click(Sender: TObject);
var
//   ASelectedDatabase: TSelectedDatabase;
   AList: TStringList;
   i: Integer;
begin

//   ASelectedDatabase.Connection := db_dm.FDConnection;
//   ASelectedDatabase.FileExt := ExtractFileExt(Connection := db_dm.FDConnection;
//
//   if DoSelectDatabaseForImport(ASelectedDatabase) then // dbtsel.pas and dbttypes.pas
//      try
//        AList:= TStringList.Create;
//        Connection := db_dm.FDConnection;
//        //dbtshare.GetDBFieldList(ASelectedDatabase, 'Admin', '', AList);
//        for i := 0 to Table1.FieldCount - 1 do
//         AList.Add(Table1.Fields[i].FieldName);
//        cmbFieldList.Items.Clear;
//        cmbFieldList.Clear;
//        cmbFieldList.Items.AddStrings(AList);
//      finally
//         if Assigned(AList) then FreeAndNil(AList);
//      end;
end;

procedure TFrmUPSFieldMap.GridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  // Modify combo box width if user resizes column
  cmbFieldList.Width := Grid.ColWidths[1] + 3;
end;

//procedure TFrmUPSFieldMap.GridDrawCell(Sender: TObject; ACol,
//  ARow: Integer; Rect: TRect; State: TGridDrawState);
//begin
// if not Self.Showing then Exit;
// try
//    if ( ACol = 1 ) then
//       begin
//         cmbFieldList.Width := Grid.ColWidths[1] + 3;
//       end;
//
// except on E:Exception do
//   IQError( E.Message + ' [Drawing Grid Cell]' ); // tame it, but display error
// end;
//end;

procedure TFrmUPSFieldMap.GridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var ARect: TRect;
begin
//   Ensure the combo box is in the correct position
//  if ( ACol = 1 ) then
//     begin
//       FCellCol := ACol;
//       FCellRow := ARow;
//       ARect    := Grid.CellRect( ACol, ARow );
//       cmbFieldList.Left      := ARect.Left+1;
//       cmbFieldList.Top       := ARect.Top;
//       cmbFieldList.Width     := Grid.ColWidths[1]+ 3;
//       cmbFieldList.Visible   := TRUE;
//
//       if (cmbFieldList.Items.Count = 0) or
//          ((cmbFieldList.Items.Count = 1) and (cmbFieldList.Items.Strings[0] <> Grid.Cells[ACol,ARow])) then
//          begin
//            cmbFieldList.Items.Clear;
//            cmbFieldList.Items.Add(Grid.Cells[ACol,ARow]);
//          end;
//
//       cmbFieldList.ItemIndex := cmbFieldList.Items.IndexOf(Grid.Cells[ACol,ARow]);
//       cmbFieldList.Text := Grid.Cells[ACol,ARow];
//     end;
end;

procedure TFrmUPSFieldMap.GridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
   //SetButtons;
end;

procedure TFrmUPSFieldMap.cmbFieldListClick(Sender: TObject);
begin
  // Set the grid text to the combo box selection
  Grid.Cells[FCellCol,FCellRow] := cmbFieldList.Text;
end;

procedure TFrmUPSFieldMap.cmbFieldListCloseUp(Sender: TObject);
begin
   //SetButtons;
end;

procedure TFrmUPSFieldMap.cmbFieldListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Clear text if users presses Delete
  if ( TComponent( Sender ) is TUniComboBox ) and ( Key = VK_DELETE ) then
     with TComponent( Sender ) as TUniComboBox do
       begin
          Key := 0;
          ItemIndex := -1;
          if Assigned( OnClick ) then OnClick(Sender);
          if Assigned( OnChange ) then OnChange(Sender);
       end;

end;

end.
