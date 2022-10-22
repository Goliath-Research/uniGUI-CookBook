unit IQMS.Common.SortCols;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMultiItem,
  uniListBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu;

type
  TSortColumns = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnClear: TUniButton;
    Panel3: TUniPanel;
    LBSortFields: TUniListBox;
    Panel4: TUniPanel;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    BtnCancel: TUniButton;
    PMFields: TUniPopupMenu;
    PMSortFields: TUniPopupMenu;
    Add1: TUniMenuItem;
    Remove1: TUniMenuItem;
    Panel7: TUniPanel;
    SBRight: TUniSpeedButton;
    SBLeft: TUniSpeedButton;
    Panel6: TUniPanel;
    LBFields: TUniListBox;
    Panel8: TUniPanel;
    procedure BtnCancelClick(Sender: TObject);
    procedure LBSortFieldsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure LBSortFieldsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LBFieldsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LBFieldsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure LBSortFieldsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Remove1Click(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure SBRightClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FString : String;
    FDataSet: TDataSet;
    procedure ChecksForSameItem(cItem:String);
    procedure DeleteRow(LB:TUniListBox);
  public
    { Public declarations }
    constructor Create(DataSet:TDataSet);
  end;

function GetSortColumns(DataSet:TDataSet; var S:string ): Boolean;

var
  SortColumns: TSortColumns;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.ResStrings;

function GetSortColumns(DataSet:TDataSet; var S:string ): Boolean;
begin
  with TSortColumns.Create(DataSet) do
  try
    Result:= ShowModal = mrOK;
    if Result then
       S:= FString;
  finally
    Free;
  end;
end;

constructor TSortColumns.Create(DataSet:TDataSet);
var
  i:Integer;
begin
  inherited Create(uniGUIApplication.UniApplication);
  FDataSet := DataSet;
  FString  := '';
  if FDataSet is TFDQuery then
  begin
    if TFDQuery(FDataSet).FieldDefs.Count = 0 then TFDQuery(FDataSet).FieldDefs.Update;
    if TFDQuery(FDataSet).FieldCount = 0 then
      for i := 0 to TFDQuery(FDataSet).FieldDefs.Count - 1 do
      begin
//        if TField(TFDQuery(FDataSet).Fields[i]).tag = 1 then
          LBFields.Items.AddObject(TFDQuery(FDataSet).FieldDefs[i].Name, TFDQuery(FDataSet).FieldDefs[i])
      end
    else
      for i := 0 to TFDQuery(FDataSet).FieldCount - 1 do
      begin
        if (not TFDQuery(FDataSet).Fields[i].Calculated) and
           (TField(TFDQuery(FDataSet).Fields[i]).tag = 1) then
          LBFields.Items.AddObject(TFDQuery(FDataSet).Fields[i].DisplayLabel, TFDQuery(FDataSet).Fields[i]);
      end
  end
  else
  begin
    if TFDTable(FDataSet).FieldDefs.Count = 0 then TFDTable(FDataSet).FieldDefs.Update;
    if TFDTable(FDataSet).FieldCount = 0 then
      for i := 0 to TFDTable(FDataSet).FieldDefs.Count - 1 do
      begin
//        if TField(TFDTable(FDataSet).Fields[i]).tag = 1 then
          LBFields.Items.AddObject(TFDTable(FDataSet).FieldDefs[i].Name, TFDTable(FDataSet).FieldDefs[i])
      end
    else
      for i := 0 to TFDTable(FDataSet).FieldCount - 1 do
      begin
        if (not TFDTable(FDataSet).Fields[i].Calculated) and
           (TField(TFDTable(FDataSet).Fields[i]).tag = 1) then
           LBFields.Items.AddObject(TFDTable(FDataSet).Fields[i].DisplayLabel, TFDTable(FDataSet).Fields[i]);
      end
  end;
  if LBFields.Items.Count = 0 then
     // 'An empty field list was created.  No fields where Tag = 1 were found.'
     IQInformation(IQMS.Common.ResStrings.cTXT0000238);
end;

procedure TSortColumns.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TSortColumns.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TSortColumns.BtnCancelClick(Sender: TObject);
begin
  FString := '';
  Close;
end;

procedure TSortColumns.LBSortFieldsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source = LBFields) or (Source = LBSortFields)
end;

procedure TSortColumns.LBFieldsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source = LBSortFields);
end;

procedure TSortColumns.LBSortFieldsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then LBSortFields.BeginDrag(False);
end;

procedure TSortColumns.LBFieldsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then LBFields.BeginDrag(False);
end;

procedure TSortColumns.LBSortFieldsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  APoint: TPoint;
  i, j:Integer;
begin

//  APoint.X := X;
//  APoint.Y := Y;
//  i := LBSortFields.ItemAtPos(APoint, False);

  if Source = LBFields then
  begin
    ChecksForSameItem(LBFields.Items[LBFields.ItemIndex]);
    if i > -1 then
    begin
      LBSortFields.Items.Insert(i, LBFields.Items[LBFields.ItemIndex]);
      LBSortFields.Items.Objects[i] := LBFields.Items.Objects[LBFields.ItemIndex];
    end
    else
      LBSortFields.Items.AddObject(LBFields.Items[LBFields.ItemIndex],
                                   LBFields.Items.Objects[LBFields.ItemIndex]);
  end
  else
   with LBSortFields do
   begin
      j := ItemIndex;
      Items.AddObject(Items[j], Items.Objects[j]);                //Add at the end of list becouse last item count will always be greater the the items below
      if i > -1 then
      begin
        Items.Insert(i, Items[Items.Count - 1]);                  //Insert where needed
        Items.Objects[i] := Items.Objects[Items.Count - 1];
        Items.Delete(Items.Count - 1);
        if i >= j then
          Items.Delete(j)                                         //Delete the original Item
        else
          Items.Delete(j + 1);                                    //Original Item has moved one row down that's why the ' j + 1'
      end;
   end;
end;

procedure TSortColumns.ChecksForSameItem(cItem:String);
var
  i:integer;
begin
  for i := 0 to LBSortFields.Items.Count - 1 do
    if LBSortFields.Items[i] = cItem then
      // 'The item already has already been selected.'
      raise Exception.Create(IQMS.Common.ResStrings.cTXT0000239);
end;

procedure TSortColumns.DeleteRow(LB:TUniListBox);
var
  i:Integer;
begin
  with LB do
  begin
    if ItemIndex < 0 then Exit;
//    Items.Objects[ItemIndex].Free;
    Items.Delete(ItemIndex);
  end;
end;

procedure TSortColumns.Remove1Click(Sender: TObject);
begin
  DeleteRow(LBSortFields);
end;

procedure TSortColumns.BtnClearClick(Sender: TObject);
var
  i:Integer;
begin
  with LBSortFields do
    while Items.Count <> 0 do
    begin
//      Items.Objects[0].Free;
      Items.Delete(0);
    end;
end;

procedure TSortColumns.BtnOkClick(Sender: TObject);
var
  i:integer;
begin
  with LBSortFields do
    for i := 0 to Items.Count - 1 do
      if Items.Objects[i] is TField then
      begin
        if TField(Items.Objects[i]).Lookup then
          FString := FString + TField(Items.Objects[i]).KeyFields + ';'
        else
          FString := FString + TField(Items.Objects[i]).FieldName + ';';
      end
      else
        FString := FString + TFieldDef(Items.Objects[i]).Name + ';';

  FString := Copy(FString, 1, Length(FString) - 1);
  ModalResult:= mrOK;
end;

procedure TSortColumns.SBRightClick(Sender: TObject);
begin
  if LBFields.ItemIndex < 0 then Exit;
  ChecksForSameItem(LBFields.Items[LBFields.ItemIndex]);
  LBSortFields.Items.AddObject(LBFields.Items[LBFields.ItemIndex],
                                 LBFields.Items.Objects[LBFields.ItemIndex]);

end;

end.

