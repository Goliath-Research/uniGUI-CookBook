unit uniListView;
{***@@@---------------------------------------------------------------------***}
{               uniGUI Web Application Framework for Delphi                    }
{                                                                              }
{ This source code is copyrighted material.                                    }
{ Copyright (c) FMSoft Co. Ltd. 2009-2016. All rights reserved.                }
{                                                                              }
{ See License.pdf under installation folder for details.                       }
{                                                                              }
{ Developed by: Farshad Mohajeri                                               }
{ Contact: farshad@fmsoft.net - info@fmsoft.net                                }
{ http://www.unigui.com                                                        }
{ http://www.fmsoft.net                                                        }
{------------------------------------------------------------------------------}

interface

uses
  Windows, Controls, ComCtrls, StrUtils, uniGUIApplication, SysUtils, Classes, Graphics, Grids, uniGUIConst, UniGUITypes,
  UniGUIInterfaces, UniGUIClasses, UniBasicGrid, ExtPascalUtils, uniGUIAbstractClasses, uniMainMenu,uniGUIJSInterface;

const
  DEF_COL_WIDTH = 64;


  type
  TUniListView = class;
  TListItems = class;
  TListItem =  class;
  TUniGridColumn = class;


  TOnColumnClickEvent = procedure(Sender: TObject; Column: TUniGridColumn) of object;
  TOnChangeEvent = procedure(Sender: TObject; Item: TListItem) of object;

  TSubItems = class(TStringList)
  private
    FOwner: TListItem;
  public
    constructor Create(AOwner: TListItem);
    destructor Destroy; override;
    function Add(const S: string): Integer; override;
    procedure Delete(Index: Integer); override;
    procedure Put(Index: Integer; const S: string); override;
  end;

 TListItem =  class(TCollectionItem)
  private
    FCaption: string;
    FSubItems: TStrings;
    FData : Pointer;
    FSelected : Boolean;
    procedure SetCaption(const Value: string);
    procedure SetSubItems(const Value: TStrings);
    function GetSelected: Boolean;
    procedure SetSelected(const Value: Boolean);
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(ASource: TPersistent); override;
    destructor Destroy; override;
    procedure Notify(subItemIndex:integer);
    property Data: Pointer read FData write FData;
  published
  property Caption: string read FCaption write SetCaption;
  property SubItems: TStrings read FSubItems write SetSubItems;
  property Selected: Boolean read GetSelected write SetSelected;
 End;

  TListItems = class(TOwnedCollection)
  private
    function  GetItem(Index: Integer): TListItem;
    procedure SetItem(Index: Integer; const Value: TListItem);
  public
    constructor Create(AOwner: TPersistent);
    function  Add: TListItem; reintroduce;
    procedure  Clear; reintroduce;
    function  Insert(Index: Integer): TListItem; reintroduce;
    destructor Destroy; override;
    property  Items[Index: Integer]: TListItem read GetItem write SetItem; default;
  end;

  TUniGridColumn = class(TCollectionItem)
  private
    FTitle: TUniColumnTitle;
    FCaption : String;
    FWidth : Integer;
    FAutoSize : Boolean;
    procedure SetTitle(const Value: TUniColumnTitle);
    procedure SetWidth(const Value: Integer);
    procedure SetCaption(const Value: String);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Title: TUniColumnTitle read FTitle write SetTitle;
    property Caption: String read FCaption write SetCaption;
    property AutoSize: Boolean read FAutoSize write FAutoSize;
    property Width: Integer read FWidth write SetWidth default DEF_COL_WIDTH;
  end;

  TUniGridColumns = class(TOwnedCollection)
  private
    function GetItems(Index: Integer): TUniGridColumn;
    procedure SetItems(Index: Integer; const Value: TUniGridColumn);
  public
    property Items[Index: Integer]: TUniGridColumn read GetItems write SetItems; default;
  end;

  TUniListView = class(TUniBasicGrid, IUniStringGrid)
  private
    FColData  : TList;
    fFixedColor : TColor;
    FListItems : TListItems;
    FSelectedRow : integer;
    FColumnCount,
    FRowCount,
    fFixedRows,
    FFixedCols : Integer;
    FOptions  : TGridOptions;
    FDefaultColWidth,
    fDefaultRowHeight : Integer;
    FCustomizableCells,
    FConfigChanged, FUpdating, FUpdated,
    FInternalSet: Boolean;
    FColWidths : array of Integer;
    SelectedLine  : Integer;
    FOnDrawCell : TUniDrawCellEvent;
    FCellAttribs : TUniCellAttribs;
    FLockFixedCols: Boolean;
    FShowColumnTitles: Boolean;
    FHeaders: TUniGridColumns;
    FItems: TListItems;
    FSelCount:integer;
    FSelectedRowIndex:TStringList;
    FPopupMenu:TUniPopupMenu;
    FOnColumnClick:TOnColumnClickEvent;
    FOnChange:TOnChangeEvent;

    procedure H_OnRowSelect(This: TJSObject; EventName: string; Params: TUniStrings);
    procedure H_OnRightClick(This: TJSObject; EventName: string; Params: TUniStrings);

    procedure LoadInitialData;
    procedure UpdateIndex(rowIndex:integer; colIndex:integer = 0 );
    procedure SetMyArray(Value: TListItems);
    procedure SetColumnAttribs(Col: TJSGridColumn; Index:Integer);
    procedure InitRowStrings;

    procedure SetJSCell(ACol, ARow: Integer; const Value: string; const Attr: string='');
    procedure DelJSRow(RowNo:Integer);
    procedure AddJSRow(RowNo:Integer);
    function GetJSONRow(ARowNo: Integer; AObjects: Boolean = False): string;

    procedure ReconfigureColumns;
    function RowIsEmpty(ARow: Integer): Boolean;
    function ProcessCellData(ColNo, RowNo: Integer; var Attr: string; var AValue: string): Boolean;
    procedure ReadColWidths(Reader: TReader);
    function GetColumns: TUniGridColumns;
    procedure SetColumns(const Value: TUniGridColumns);
    function GetGridData(AObjects: Boolean = False): string;
    function GetFieldDefs: string;
    procedure SetItems(const Value: TListItems);
    function GetSelected: TListItem;
    procedure SetSelected(const Value: TListItem);
    procedure xSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    function GetReadOnly: Boolean;
    procedure SetReadOnly(const Value: Boolean);
    function GetMultiSelect: Boolean;
    procedure SetMultiSelect(const Value: Boolean);
    function GetRowSelect: Boolean;
    procedure SetRowSelect(const Value: Boolean);
  protected
    function GetCells(ACol, ARow: Integer): string; virtual;
    procedure SetCells(ACol, ARow: Integer; Value: string); virtual;
    function GetColWidths(Index: Integer): Integer; virtual;
    procedure SetColWidths(Index: Integer; Value: Integer); virtual;
    function GetRowHeights(Index: Integer): Integer; virtual;
    procedure SetRowHeights(Index: Integer; Value: Integer); virtual;
    function GetFixedColor: TColor; virtual;
    procedure SetFixedColor(Value: TColor); virtual;
    function GetFixedCols: Integer; virtual;
    procedure SetFixedCols(Value: Integer); virtual;
    function GetFixedRows: Integer; virtual;
    procedure SetFixedRows(Value: Integer); virtual;
    function GetRowCount: Integer; virtual;
    procedure SetRowCount(Value: Integer); virtual;
    function GetColCount: Integer; virtual;
    procedure SetColCount(Value: Integer); virtual;
    function GetDefaultColWidth: Integer; virtual;
    procedure SetDefaultColWidth(Value: Integer); virtual;
    function GetDefaultRowHeight: Integer; virtual;
    procedure SetDefaultRowHeight(Value: Integer); virtual;
    function GetOptions: TGridOptions; virtual;
    procedure SetOptions(Value: TGridOptions); virtual;
    function GetCol: Integer; virtual;
    procedure SetCol(Value: Integer); virtual;
    function GetRow: Integer; virtual;
    procedure SetRow(Value: Integer); virtual;
    function GetOnDrawCell: TUniDrawCellEvent; virtual;
    procedure SetOnDrawCell(Value: TUniDrawCellEvent); virtual;
    function RowSelect:Boolean; override;
    function CheckBoxSelectCheckOnly: Boolean; override;
    function CheckBoxSelect: Boolean; override;
    function RowMultiSelect:Boolean; override;
    procedure LoadCompleted; override;
    function Clickable(ACol, ARow:Integer):Boolean; override;
    procedure SetCellValue(ACol, ARow:Integer; OldValue, NewValue: Variant; AuxParam: string); override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure NotifyAjax; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    function DataStoreClassName:string; override;

    procedure WebCreate; override;
    procedure WebDestroy; override;

    function VCLControlClassName: string; override;
  public
    property Cells[ACol, ARow: Integer]: string read GetCells write SetCells;
    property ColWidths[Index: Longint]: Integer read GetColWidths write SetColWidths;
    property RowHeights[Index: Longint]: Integer read GetRowHeights write SetRowHeights;
    property Col: Integer read GetCol write SetCol;
    property Row: Integer read GetRow write SetRow;

    procedure BeginUpdate;
    procedure EndUpdate;

    procedure RefreshRow(RowNo: Integer=-1);
    procedure SelectAll;
    procedure DeSelectAll;
    procedure AddItem(Item: String; AObject: TObject);

    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  published
    property FixedColor: TColor read GetFixedColor write SetFixedColor default clBtnFace;
    property FixedCols: Integer read GetFixedCols write SetFixedCols default 0;
    property FixedRows: Integer read GetFixedRows write SetFixedRows default 0;
    property SelCount: Integer read FSelCount write FSelCount default 0;
    property RowCount:Integer read GetRowCount write SetRowCount default 0;
    property ColCount:Integer read GetColCount write SetColCount default 0;
    property DefaultColWidth:Integer read GetDefaultColWidth write SetDefaultColWidth default 64;
    property DefaultRowHeight:Integer read GetDefaultRowHeight write SetDefaultRowHeight default 24;
    property Options: TGridOptions read GetOptions write SetOptions;
    property CustomizableCells: Boolean read FCustomizableCells write FCustomizableCells default True;
    property LockFixedCols: Boolean read FLockFixedCols write FLockFixedCols default False;
    property ShowColumnTitles: Boolean read FShowColumnTitles write FShowColumnTitles default True;
    property ShowColumnHeaders: Boolean read FShowColumnTitles write FShowColumnTitles default True;
    property Columns: TUniGridColumns read GetColumns write SetColumns;
    property Items: TListItems read FItems write SetMyArray;
    property Selected: TListItem read GetSelected write SetSelected;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default True;
    property MultiSelect: Boolean read GetMultiSelect write SetMultiSelect default False;
    property isRowSelect: Boolean read GetRowSelect write SetRowSelect default False;
    property PopupMenu  : TUniPopupMenu read FPopupMenu write FPopupMenu;
    property ClientEvents;
    property HeaderTitle;
    property HeaderTitleAlign;
    property Draggable;
    property CellCursor;

    // events
    property OnEndDrag;
    property OnDrawCell: TUniDrawCellEvent read GetOnDrawCell write SetOnDrawCell;
//    property OnSelectCell;
    property OnDblClick;
    property OnClick;
    property OnMouseDown;
    property OnMouseUp;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnKeyDown;
    property OnAjaxEvent;
    property OnColumnClick: TOnColumnClickEvent read FOnColumnClick write FOnColumnClick;
    property OnChange: TOnChangeEvent read FOnChange write FOnChange;

    property LayoutConfig;
    property BorderStyle default ubsDefault;
    property TrackOver default False;
    property StripeRows default False;
    property Align;
    property Anchors;
    property TabOrder;
    property TabStop;
    property ParentFont;
    property Font;
    property ScreenMask;
  end;

implementation

uses
  Types, uniStrUtils, UniGUIJSUtils, uniGUIServer, uniGUIFont,
  Variants;

type
  TJSObjectHack = class(TJSObject);

procedure TUniListView.LoadInitialData;
var
i,j:integer;
begin
  if FItems<>nil then
  begin
    RowCount:=FItems.Count;
    ColCount:=Columns.Count;

  for i := 0 to Items.Count-1 do
    begin
      for j := 0 to Columns.Count-1 do
        begin
         if j=0 then
           begin
             Cells[j,i]:=Items[i].Caption;
           end
         else
           begin
             if j<=Items[i].SubItems.Count then
               begin
                 Cells[j,i]:=Items[i].SubItems[j-1];
               end;
           end;

        end;
    end;
  end;
end;

function TUniListView.DataStoreClassName:string;
begin
  Result:='Ext.data.JsonStore';
end;

function TUniListView.VCLControlClassName: string;
begin
  Result:='TVCLStringGrid';
end;

constructor TUniListView.Create(AOwner:TComponent);
begin
  inherited;
  FOptions:=[goVertLine, goHorzLine];
  FCustomizableCells:=True;
  SelectMarkOffest:=Point(4, 4);
  DefaultColWidth:=DEF_COL_WIDTH;
  DefaultRowHeight:=24;
  ColCount:=4;
  RowCount:=1;
  Width:=320;
  Height:=240;
  FixedRows:=0;
  FixedCols:=0;
  FixedColor:=clBtnFace;
  Color:=clWindow;
  TrackOver:=False;
  ShowColumnTitles:=True;
  StripeRows:=False;
  FHeaders := TUniGridColumns.Create(Self, TUniGridColumn);
  FItems := TListItems.Create(Self);
  FSelectedRow:=-1;
  OnSelectCell:=xSelectCell;
  FSelectedRowIndex:=TStringList.Create
end;

procedure TUniListView.WebCreate;
var
 i,j:integer;
begin
  inherited;

  FColData:=TList.Create;
  FCellAttribs:=TUniCellAttribs.Create(True);
  FCellAttribs.DefaultColor:=clWindow;

  JSConfig('storeId', [DataStore.JSName+'_id'], DataStore);
  JSAssign('grid', [JSControl], DataStore);

  UniSession.AddJS('function GetSelectedRecords(p1) { '+
          ' ids=''''; '+
          ' for(var i=0; i<p1.length; i++) '+
          ' { '+
          ' var selectedRecord = p1[i]; '+
          ' var row = selectedRecord.store.indexOf(selectedRecord); '+
          ' ids = ids+ row+'',''; '+
          ' } '+
          ' return ids; '+
          ' }');;



//  JSRemoveEvent('selectionchange', H_OnRowSelect);

  JSAddEvent('selectionchange',
    [
      'This', '%0.nm',
      'selrows', 'GetSelectedRecords(%1)',
      'sels', '%1.length'
    ],
    '_src_('+HiddenFormValue.JSName+',null,null,false,P1)',
    H_OnRowSelect,
  RowSelectionModel);

  JSAddEvent('cellcontextmenu',
    [
      'ex', '%6.xy[0]',
      'ey', '%6.xy[1]'
    ],
    H_OnRightClick);


  JSConfig('simpleSelect', [true], RowSelectionModel);

  JSConfig('store', [DataStore]);
  JSConfigObject('viewConfig', 'markDirty', [False]);

  SelectedLine:=-1;
end;

procedure TUniListView.WebDestroy;
var
  I : Integer;
begin
  for I := 0 to FColData.Count - 1 do
    TObject(FColData[I]).Free;

  FCellAttribs.Free;
  FColData.Free;
  inherited;
end;

procedure TUniListView.xSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  FSelectedRow:=ARow;
   if (Assigned(OnColumnClick)) and (isRowSelect=False) then
     OnColumnClick(Sender,Columns[ACol]);

    if (Assigned(OnChange)) and (isRowSelect=True) then
       OnChange(Sender,Items[ARow]);
end;

function TUniListView.RowIsEmpty(ARow: Integer): Boolean;
var
  I : Integer;
  Attr, sVal : string;
  Res : Boolean;
begin
  Result:=True;
  for I := 0 to ColCount - 1 do
  begin
    sVal:=Trim(Cells[I, ARow]);
    Res:=ProcessCellData(I, ARow, Attr, sVal);
    if (sVal<>'') or Res then
    begin
      Result:=False;
      Exit;
    end;
  end;
end;

function TUniListView.ProcessCellData(ColNo, RowNo: Integer; var Attr: string; var AValue: string): Boolean;
var
  S : string;
begin
  Attr:='';
  Result:=False;
  if Assigned(FOnDrawCell) then
  begin
    FCellAttribs.Clear;
    S:=AValue;
    FOnDrawCell(Self, ColNo, RowNo, AValue, FCellAttribs);
    Result:=FCellAttribs.Modified;
    if Result then
      Attr:=FCellAttribs.AsString
    else
      Result:=(S<>AValue);
  end;
end;

function TUniListView.GetJSONRow(ARowNo: Integer; AObjects: Boolean = False): string;
var
  EmptyRow, HasAttr : Boolean;
  Attr, aVal : string;
  J : Integer;
begin
  Result:='';
  EmptyRow:=True;
  HasAttr:=False;
  for J := 0 to ColCount - 1 do
  begin
    aVal:=Cells[J, ARowNo];
    if ProcessCellData(J, ARowNo, Attr, aVal) then HasAttr:=True;
    Attr:='"'+Attr+'"';

    if (Trim(aVal)<>'') or (Attr<>'""') then EmptyRow:=False;

    if AObjects then
      Result:=Result+IntToStr(J)+':'+StrToJS(aVal)+',_'+IntToStr(J)+':'+Attr
    else
      Result:=Result+StrToJS(aVal)+','+Attr;

    if J<ColCount-1 then Result:=Result+',';
  end;

  if EmptyRow and (not AObjects) then
    Result:='" "' // if not ExtJS will set row height to minimum (only first col of empty rows should be sent)
  else
  begin
    if AObjects then
      Result:='_x:'+IfThen(HasAttr, '1,', '0,')+Result
    else
      Result:=IfThen(HasAttr, '1,', '0,')+Result;
  end;
end;

function TUniListView.GetMultiSelect: Boolean;
begin
  Result:=(goRangeSelect in FOptions);
end;

function TUniListView.GetGridData(AObjects: Boolean = False): string;
var
  I : Integer;
begin
  Result := '';
  for I := 0 to RowCount - 1 do
  begin
    if AObjects then
      Result := Result + '{'+GetJSONRow(I, True)+'}'
    else
      Result := Result + '['+GetJSONRow(I)+']';
    if I<RowCount-1 then Result := Result +',';
  end;
end;

function TUniListView.GetFieldDefs: string;
var
  I : Integer;
begin
  Result := '"_x"';
  for I := 0 to ColCount - 1 do
    Result := Result + ',"' + IntToStr(I)+'","_' + IntToStr(I)+'"';
end;

procedure TUniListView.LoadCompleted;
var
  S : string;
begin
  LoadInitialData;

  if FLockFixedCols then JSConfig('enableLocking', [True]);
  if not FShowColumnTitles then JSConfig('hideHeaders', [True]);
  JSConfig('fxCols', [FixedCols]);
  JSConfig('fxRows', [FixedRows]);
  if FixedColor <> clBtnFace then
    JSConfig('fxColor', [uniColor2Web(FixedColor)]);

  if not (goHorzLine in FOptions) then JSConfig('rowLines', [False]);
  if not (goVertLine in FOptions) then JSConfig('columnLines', [False]);

  JSConfig('fields', [JSArray(GetFieldDefs)], DataStore);
  S := GetGridData;
  if S<>'' then
    JSConfig('data', [JSArray(S)], DataStore);

  FUpdated := False;
  FConfigChanged:=False;
  inherited;
  ReconfigureColumns;
end;

procedure TUniListView.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FPopupMenu) then
    FPopupMenu := nil;
end;

procedure TUniListView.NotifyAjax;
begin
  inherited;
  if FConfigChanged then
  begin
    FConfigChanged:=False;
    ReconfigureColumns;
  end;

  if FUpdated then
  begin
    FUpdated := False;
    JSCall('model.setFields', [JSArray(GetFieldDefs())], DataStore);
    JSCall('loadData', [JSArray(GetGridData())], DataStore);
  end;
end;

function TUniListView.Clickable(ACol, ARow:Integer):Boolean;
begin
  Result:=(ACol>=FFixedCols) and (ARow>=FFixedRows);
end;

procedure TUniListView.SetCellValue(ACol, ARow:Integer; OldValue, NewValue: Variant; AuxParam: string);
var
  Attr, S : string;
begin
  if (ACol<FColumnCount) and  (ARow<FRowCount) then
    try
      FInternalSet:=True;
      S:=Trim(NewValue);
      Cells[ACol, ARow]:=S;
      if ProcessCellData(ACol, ARow, Attr, S) then
        SetJSCell(ACol, ARow, S, Attr);
    finally
      FInternalSet:=False;
    end;
end;

function TUniListView.GetCol: Integer;
begin
  Result:=CurrCol;
end;

procedure TUniListView.SetCol(Value: Integer);
begin
  CurrCol:=Value;
end;

function TUniListView.GetReadOnly: Boolean;
begin
  Result:=Not(goEditing in FOptions);
end;

function TUniListView.GetRow: Integer;
begin
  Result:=CurrRow;
end;

procedure TUniListView.SetReadOnly(const Value: Boolean);
begin
  if Value then
    FOptions:=FOptions-[goEditing]
  else
    FOptions:=FOptions+[goEditing];
end;

procedure TUniListView.SetRow(Value: Integer);
begin
  CurrRow:=Value;
end;

function TUniListView.GetOptions: TGridOptions;
begin
  Result:=FOptions;
end;

procedure TUniListView.SetOptions(Value: TGridOptions);
begin
  if FOptions<>Value then
  begin
    if ((goEditing in (Value - FOptions)) or (goEditing in (FOptions - Value)))
      and (not IsLoading) then
      FConfigChanged:=True;

    FOptions:=Value;
  end;
end;

function TUniListView.CheckBoxSelectCheckOnly: Boolean;
begin
  Result:=False;
end;

procedure TUniListView.BeginUpdate;
begin
  FUpdating := True;
end;

function TUniListView.CheckBoxSelect: Boolean;
begin
  Result:=False;
end;

function TUniListView.RowSelect:Boolean;
begin
  Result:=goRowSelect in FOptions;
end;

function TUniListView.RowMultiSelect:Boolean;
begin
  Result:=goRangeSelect in FOptions;
end;

function TUniListView.GetCells(ACol, ARow: Integer): string;
var
  ColStrings  : TStringList;
begin
  if ACol<FColData.Count then
  begin
    ColStrings:=FColData[ACol];
    Result:=ColStrings[ARow];
  end
  else
    Result:='';
end;

procedure TUniListView.SetJSCell(ACol, ARow: Integer; const Value: string; const Attr: string='');
var
  sValue, sAttr : string;
begin
  if not FUpdating then
  begin
    sValue:=Value;
    if RowIsEmpty(ARow) then
      JSCode('_srd_('+DataStore.JSName+',"'+IntToStr(ARow)+ '","",null);')
    else
    begin
      sAttr:=Attr;
      if sAttr='' then
        ProcessCellData(ACol, ARow, sAttr, sValue);

      JSCode('_srd_('+DataStore.JSName+','+
                      '"'+IntToStr(ARow)+ '",'+
                      '"'+IntToStr(ACol)+ '",'+
                      StrToJS(sValue)+','+
                      '"'+sAttr+'");');

    end;
  end;
end;

procedure TUniListView.SetMultiSelect(const Value: Boolean);
begin
  if Value then
    FOptions:=FOptions+[goRangeSelect]
  else
    FOptions:=FOptions-[goRangeSelect];
end;

procedure TUniListView.SetMyArray(Value: TListItems);
begin
  FItems.Assign(Value);
end;

procedure TUniListView.SelectAll;
begin
  JSCall('selectAll',[false],RowSelectionModel);
end;

procedure TUniListView.SetCells(ACol, ARow: Integer; Value: string);
var
  ColStrings  : TStringList;
begin
  if (ACol<FColumnCount) and (ARow<FRowCount) then
  begin
    ColStrings:=FColData[ACol];

    if ColStrings[ARow]<>Value then
    begin
      ColStrings[ARow]:=Value;
      if (not IsLoading) and (not FInternalSet) then
        SetJSCell(ACol, ARow, Value);
    end;
  end;
end;

function TUniListView.GetColWidths(Index: Longint): Integer;
begin
  Result:=FColWidths[Index];
end;

function TUniListView.GetOnDrawCell: TUniDrawCellEvent;
begin
  Result:=FOnDrawCell;
end;

//function TUniListView.GetOnSelectCell: TSelectCellEvent;
//begin
//  Result:=FOnSelectCell;
//end;

procedure TUniListView.SetOnDrawCell(Value: TUniDrawCellEvent);
begin
  FOnDrawCell:=Value;
end;

//procedure TUniListView.SetOnSelectCell(const Value: TSelectCellEvent);
//begin
//  FOnSelectCell:=Value;
//end;

procedure TUniListView.SetColWidths(Index: Longint; Value: Integer);
begin
  if Value<>FColWidths[Index] then
  begin
    FColWidths[Index]:=Value;
    if not IsLoading then FConfigChanged:=True;

    if Supports(VCLProxy, IUniStringGrid) then
      (VCLProxy as IUniStringGrid).ColWidths[Index] := Value;
  end;
end;

function TUniListView.GetRowHeights(Index: Longint): Integer;
begin
  Result:=0;
//  Result:=StrToIntDef(Cell[Index, 0].Height,0);
end;

function TUniListView.GetRowSelect: Boolean;
begin
  Result:=(goRowSelect in FOptions);
end;

function TUniListView.GetSelected: TListItem;
begin
 if FSelectedRow>-1 then
  Result := Items[FSelectedRow]
 else
  Result:=nil;
end;

procedure TUniListView.H_OnRightClick(This: TJSObject; EventName: string;
  Params: TUniStrings);
begin
  if FPopupMenu<>nil then
    begin
      FPopupMenu.Popup(Params['ex'].AsInteger, Params['ey'].AsInteger);
    end;
end;

procedure TUniListView.H_OnRowSelect(This: TJSObject; EventName: string;
  Params: TUniStrings);
begin
  With FSelectedRowIndex Do
  begin
    Text := ReplaceText(Params.Values['selrows'],',',#13#10);
    SelCount:=Count;
  end;
end;

procedure TUniListView.SetRowHeights(Index: Longint; Value: Integer);
//var
//  I : Integer;
begin
//  for I := 0 to ColCount - 1 do
//    Cell[Index, I].Height:=IntToStr(Value);
end;

procedure TUniListView.SetRowSelect(const Value: Boolean);
begin
  if Value then
    FOptions:=FOptions+[goRowSelect]
  else
    FOptions:=FOptions-[goRowSelect];
end;

procedure TUniListView.SetSelected(const Value: TListItem);
begin
  FSelectedRow:=Value.Index;
  JSCall( 'getSelectionModel().select', ''+jsname+'.store.data.items['+IntToStr(FSelectedRow)+'], false');
end;

procedure TUniListView.UpdateIndex(rowIndex:integer; colIndex:integer);
begin
  if RowCount<=rowIndex then
    begin
      RowCount:=rowIndex+1;
    end;

  if colIndex=0 then
     begin
       Cells[colIndex,rowIndex]:=Items[rowIndex].Caption;
     end
   else
     begin
       if (colIndex<=Items[rowIndex].SubItems.Count) and (colIndex<=(Columns.Count-1)) then
         begin
           Cells[colIndex,rowIndex]:=Items[rowIndex].SubItems[colIndex-1];
         end;
     end;

end;

function TUniListView.GetDefaultColWidth: Integer;
begin
  Result:=FDefaultColWidth;
end;

procedure TUniListView.SetDefaultColWidth(Value:Integer);
var
  I : Integer;
begin
  if FDefaultColWidth <> Value then
  begin
    FDefaultColWidth:=Value;

    for I := 0 to FColumnCount - 1 do FColWidths[I]:=FDefaultColWidth;

    SetVCLProperty('DefaultColWidth', FDefaultColWidth);
  end;
end;

function TUniListView.GetDefaultRowHeight: Integer;
begin
  Result:=fDefaultRowHeight;
end;

procedure TUniListView.SetDefaultRowHeight(Value:Integer);
begin
  fDefaultRowHeight:=Value;

  SetVCLProperty('DefaultRowHeight', fDefaultRowHeight);
end;

function TUniListView.GetFixedColor: TColor;
begin
  Result:=fFixedColor;
end;

procedure TUniListView.SetFixedColor(Value:TColor);
begin
  fFixedColor:=Value;

  SetVCLProperty('FixedColor', fFixedColor);
end;

function TUniListView.GetFixedRows: Integer;
begin
  Result:=fFixedRows;
end;

function TUniListView.GetColumns: TUniGridColumns;
begin
  Result := FHeaders;
end;

procedure TUniListView.SetFixedRows(Value:Integer);
begin
  fFixedRows:=Value;

  if SetVCLProperty('FixedRows', fFixedRows) then Exit;

  if fFixedRows>RowCount then fFixedRows:=RowCount;
end;


procedure TUniListView.SetItems(const Value: TListItems);
begin
  FListItems.Assign(Value);
end;

procedure TUniListView.SetColumns(const Value: TUniGridColumns);
begin
  FHeaders.Assign(Value);
end;

function TUniListView.GetFixedCols: Integer;
begin
  Result:=FFixedCols;
end;

procedure TUniListView.SetFixedCols(Value:Integer);
begin
  FFixedCols:=Value;

  if SetVCLProperty('FixedCols', FFixedCols) then Exit;

  if FFixedCols>ColCount then FFixedCols:=ColCount;
end;

function TUniListView.GetRowCount:Integer;
begin
  Result:=FRowCount;
end;

procedure TUniListView.SetRowCount(Value:Integer);
var
  I, pRow  : Integer;
begin
  if (Value<>FRowCount) and (Value>=0) then
  begin
    pRow:=FRowCount;
    FRowCount:=Value;

    if SetVCLProperty('RowCount', FRowCount) then Exit;

    InitRowStrings;

    if not IsLoading then
    begin
      for I := pRow to FRowCount-1 do
        AddJSRow(I);

      for I := pRow-1 downto FRowCount do
        DelJSRow(I);
    end;
  end;
end;

function TUniListView.GetColCount:Integer;
begin
  Result:=FColumnCount;
end;

procedure TUniListView.RefreshRow(RowNo: Integer=-1);
begin
  if WebMode and (not IsLoading) then
  begin
    if RowNo=-1 then RowNo:=Row;
    JSCode('var R='#1'.getAt('+IntToStr(RowNo)+'); if (R!=null) {R.data={'+GetJSONRow(RowNo, True)+'};R.commit();};', DataStore);
  end;
end;

procedure TUniListView.SetColumnAttribs(Col: TJSGridColumn; Index:Integer);
var
  S, ed, Attr : string;
  Locked, Editable : Boolean;
begin
  Locked := Index<FixedCols;
  Editable := (goEditing in FOptions) and (not Locked);

  JSConfig('width', [FColWidths[Index]], Col);
  if Columns[Index].AutoSize then
     JSConfig('flex', [1], Col);

  JSConfig('dataIndex', [IntToStr(Index)], Col);

  if Locked then JSConfig('locked', [True], Col);

  if FShowColumnTitles then
  begin
    JSConfig('menuDisabled', [True], Col);
    JSConfig('sortable', [False], Col);
    JSConfig('resizable', [False], Col);

    if FHeaders.Count>Index then
    begin
      S := Trim(FHeaders[Index].Title.Caption);
      if S = '' then S := '&#160;';
      JSConfig('text', [S], Col);

      S := GetTitleAttribs(FHeaders[Index].Title, taLeftJustify);
      if S<>'' then
        JSCall('setElProp', [JSObject(S), NULL, 0, NULL, NULL, 'titleEl'], Col);
    end;
  end;

  ed:='xtype:"textfield"';
  if not Self.Font.IsDefault then
  begin
    FCellAttribs.Font.Assign(Self.Font);
    Attr:=FCellAttribs.AsString;
    if (Attr<>'') and (Attr<>'{}') then
      JSConfig('attr', [Attr], Col);
    ed:=ed+',fieldStyle:'+StrToJS(Self.Font.ToString(True));
  end;
  if Editable then JSConfig('editor','{'+ed+'}', Col);
  JSConfig('renderer','_rndcll_', Col);
end;

procedure TUniListView.InitRowStrings;
var
  I, J : Integer;
  ColStrings : TStringList;
begin
  for I := 0 to FColumnCount - 1 do
  begin
    ColStrings:=FColData[I];
    for J := ColStrings.Count-1 to FRowCount do
      ColStrings.Add('');
  end;
end;

procedure TUniListView.SetColCount(Value:Integer);
var
  I : Integer;
begin
  if Value<>FColumnCount then
  begin
    FColumnCount:=Value;

    if Length(FColWidths)<FColumnCount then
      SetLength(FColWidths, FColumnCount);

    if SetVCLProperty('ColCount', FColumnCount) then Exit;

    for I := FColData.Count to FColumnCount-1 do
    begin
      FColData.Add(TStringList.Create);
      FColWidths[I]:=FDefaultColWidth;
    end;

    InitRowStrings;
    if not IsLoading then FConfigChanged:=True;
  end;
end;

procedure TUniListView.ReconfigureColumns;
var
  I  : Integer;
begin
  JSColumns.ResetColumns;

  for I :=0 to FColumnCount-1 do
    SetColumnAttribs(JSColumns.AddColumn, I);

  JSColumns.InsertJSCode;
  JSColumns.ReConfigure;
end;

procedure TUniListView.DelJSRow(RowNo:Integer);
begin
  if not FUpdating then
    JSCall('removeAt', [RowNo], DataStore);
end;

procedure TUniListView.DeSelectAll;
begin
  JSCall('deselectAll',[],RowSelectionModel);
end;

destructor TUniListView.Destroy;
begin
  FHeaders.Free;
  FItems.Free;
  FSelectedRowIndex.Free;
  inherited;
end;

procedure TUniListView.EndUpdate;
begin
  FUpdating := False;
  if not IsLoading then FUpdated := True;
end;

procedure TUniListView.AddItem(Item: String; AObject: TObject);
begin
  with Items.Add do
  begin
    Caption := Item;
    Data := AObject;
  end;
end;

procedure TUniListView.AddJSRow(RowNo:Integer);
var
  I : Integer;
begin
  if not FUpdating then
  begin
    JSCall('add', [JSObject([IntToStr(RowNo), ''])], DataStore);

    if not RowIsEmpty(RowNo) then
    begin
      for I := 0 to ColCount - 1 do
        SetJSCell(I, RowNo, Cells[I, RowNo]);
    end;
  end;
end;

procedure TUniListView.ReadColWidths(Reader: TReader);
var
  I: Integer;
begin
  with Reader do
  begin
    ReadListBegin;
    for I := 0 to ColCount - 1 do ColWidths[I] := ReadInteger;
    ReadListEnd;
  end;
end;

procedure TUniListView.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  with Filer do
    DefineProperty('ColWidths', ReadColWidths, nil, Length(FColWidths)>0);
end;

{ TUniGridColumn }

constructor TUniGridColumn.Create(Collection: TCollection);
begin
  inherited;
  FTitle := TWebColumnTitle.Create(Collection);
  FWidth := DEF_COL_WIDTH;
end;

destructor TUniGridColumn.Destroy;
begin
  FTitle.Free;
  inherited;
end;

function TUniGridColumn.GetDisplayName: string;
begin
  Result := Self.ClassName + '-' + IntToStr(ID);
end;

procedure TUniGridColumn.SetCaption(const Value: String);
begin
  FCaption := Value;
  Title.Caption:=Value;
end;

procedure TUniGridColumn.SetTitle(const Value: TUniColumnTitle);
begin
  FTitle.Assign(Value);
end;

procedure TUniGridColumn.SetWidth(const Value: Integer);
var
  I : Integer;
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    I := (Collection.Owner as TUniListView).ColCount;

    if Self.Index < I  then
      (Collection.Owner as TUniListView).ColWidths[Self.Index] := Value;
  end;
end;

{ TUniGridColumns }

function TUniGridColumns.GetItems(Index: Integer): TUniGridColumn;
begin
  Result := (inherited Items[Index]) as TUniGridColumn;
end;

procedure TUniGridColumns.SetItems(Index: Integer;
  const Value: TUniGridColumn);
begin
  ((inherited Items[Index]) as TUniGridColumn).Assign(Value);
end;

{ TListItems }

{ TListItem }


procedure TListItem.Assign(ASource: TPersistent);
begin
  if ASource is TListItem then
  begin
    with TListItem(ASource) do
    begin
      Self.FCaption :=  Caption;
      Self.FSubItems := SubItems;
    end;
    Changed(False);
  end else
    inherited;
end;

constructor TListItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FSubItems := uniListView.TSubItems.Create(Self);
end;

destructor TListItem.Destroy;
begin
  FSubItems.Free;
  inherited;
end;

function TListItem.GetSelected: Boolean;
begin
  Result:=(Collection.Owner as TUniListView).FSelectedRowIndex.IndexOf(IntToStr(Index))>-1;
end;

procedure TListItem.Notify(subItemIndex:integer);
begin
  if not (Collection.Owner as TUniListView).IsLoading then
     begin
       (Collection.Owner as TUniListView).UpdateIndex(Self.Index, subItemIndex);
     end;
end;

procedure TListItem.SetCaption(const Value: string);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    Changed(False);
    if not (Collection.Owner as TUniListView).IsLoading then
     begin
       (Collection.Owner as TUniListView).UpdateIndex(Self.Index);
     end;
  end;
end;

procedure TListItem.SetSelected(const Value: Boolean);
var
  IJ : IUniJSInterface;
  C  : TUniListView;
begin
  C:= (Collection.Owner as TUniListView);
  if Value then
    begin
     if Supports(C, IUniJSInterface, IJ) then
      begin
        IJ.JSCall( 'getSelectionModel().select', ''+C.JSName+'.store.data.items['+IntToStr(Index)+'], false');
      end;
    end
  else
   begin
     if Supports(C, IUniJSInterface, IJ) then
      begin
        IJ.JSCall( 'getSelectionModel().deselect', ''+C.JSName+'.store.data.items['+IntToStr(Index)+'], false');
      end;
   end;
end;

procedure TListItem.SetSubItems(const Value: TStrings);
begin
  if Value <> nil then
  begin
    FSubItems.Assign(Value);
  end;
end;

{ TListItems }

function TListItems.Add: TListItem;
begin
  Result := TListItem(inherited Add);
end;

procedure TListItems.Clear;
begin
  inherited Clear;
  (Self.GetOwner as TUniListView).RowCount:=0;
end;

constructor TListItems.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner, TListItem);
end;

destructor TListItems.Destroy;
begin

  inherited;
end;

function TListItems.GetItem(Index: Integer): TListItem;
begin
  Result := TListItem(inherited GetItem(Index));
end;

function TListItems.Insert(Index: Integer): TListItem;
begin
  Result := TListItem(inherited Insert(Index));
end;

procedure TListItems.SetItem(Index: Integer; const Value: TListItem);
begin
  inherited SetItem(Index, Value);
end;

{ TSubItems }

function TSubItems.Add(const S: string): Integer;
begin
  Result := inherited Add(S);
  FOwner.Notify(Result+1);
end;

constructor TSubItems.Create(AOwner: TListItem);
begin
  inherited Create;
  FOwner := AOwner;
end;

procedure TSubItems.Delete(Index: Integer);
begin
  inherited Delete(Index);
  FOwner.Notify(Index+1);
end;

destructor TSubItems.Destroy;
begin

  inherited;
end;

procedure TSubItems.Put(Index: Integer; const S: string);
begin
  inherited Put(Index,S);
  FOwner.Notify(Index+1);
end;

end.

