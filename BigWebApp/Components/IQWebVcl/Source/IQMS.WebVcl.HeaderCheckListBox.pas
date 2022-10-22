unit IQMS.WebVcl.HeaderCheckListBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Menus, CheckLst,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniCommonClasses;

type
  THLBDrawCellEvent = procedure(Control: TWinControl; Index, Col: Integer;
    Rect: TRect; State: TOwnerDrawState) of object;

  THLBStyle = (hlbStandard, hlbOwnerDraw);

  TIQWebHeaderCheckListBox = class(TUniFormControl)
  private
    FHeader: THeaderControl;
    FCheckListBox: TCheckListBox;
    FDelimChar: Char;
    FLBStyle: THLBStyle;
    FPopupMenu: TPopupMenu;
    FOnDrawCell: THLBDrawCellEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnMouseDown: TMouseEvent;
    FOnMouseUp: TMouseEvent;
    FOnMouseMove: TMouseMoveEvent;
    LastPoint: integer;
    function MakeLocalPoint(Control: TControl; X, Y: integer): TPoint;
    // event handlers for header and CheckListBox events
    procedure DrawTrackingLine(HeaderControl: THeaderControl;
      Section: THeaderSection; Width: Integer; State: TSectionTrackState);
    procedure DrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure FClick(Sender: TObject);
    procedure FDblClick(Sender: TObject);
    procedure FMouseDown(Sender: TObject; Button: TMouseButton; Shift:
      TShiftState; X, Y: Integer);
    procedure FMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure FMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    // Get/Set methods for header properties
    function GetSections: THeaderSections;
    procedure SetSections(Value: THeaderSections);
    // Get/Set methods for CheckListBox properties
    function GetItems: TStrings;
    procedure SetItems(Value: TStrings);
    //function GetExtSel: Boolean;
    //procedure SetExtSel(Value: Boolean);
    //function GetMultiSel: Boolean;
    //procedure SetMultiSel(Value: Boolean);
    function GetItemHeight: integer;
    procedure SetItemHeight(Value: integer);
    function GetItemIndex: integer;
    procedure SetItemIndex(Value: integer);
    function GetIntHeight: Boolean;
    procedure SetIntHeight(Value: Boolean);
    function GetSelected(Index: integer): Boolean;
    procedure SetSelected(Index: integer; Value: Boolean);
    function GetChecked(Index: integer): Boolean; 
    procedure SetChecked(Index: integer; Value: Boolean);
    function GetSorted: Boolean;
    procedure SetSorted(Value: Boolean);
    function GetSelCount: integer;
    function GetTopIndex: integer;
    procedure SetTopIndex(Value: integer);
    // Get/Set methods for new properties
    function GetLBCanvas: TCanvas;
    function GetHeaderCanvas: TCanvas;
    function GetLBHandle: hWnd;
    function GetHeaderHandle: hWnd;
    procedure SetDelimChar(Value: Char);
    procedure SetLBStyle(Value: THLBStyle);
    procedure SetPopupMenu(Value: TPopupMenu);
    function GetFlat: Boolean;
    procedure SetFlat( Value: Boolean );
    function GetOnSectionClick: TSectionNotifyEvent;
    procedure SetOnSectionClick( Value: TSectionNotifyEvent );
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation);
      override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    // New properties
    property LBCanvas: TCanvas read GetLBCanvas;
    property HeaderCanvas: TCanvas read GetHeaderCanvas;
    property LBHandle: hWnd read GetLBHandle;
    property HeaderHandle: hWnd read GetHeaderHandle;
    // TCheckListBox public (runtime) properties
    property SelCount: integer read GetSelCount;
    property Selected[Index: Integer]: Boolean read GetSelected write SetSelected;
    property Checked[Index: Integer]: Boolean read GetChecked write SetChecked ;
    property TopIndex: Integer read GetTopIndex write SetTopIndex;
  published
    // TWinControl properties
    property Align;
    property Color;
    property Font;
    property Flat: Boolean read GetFlat write SetFlat;
    property Hint;
    property ParentFont;
    property ParentShowHint;
    property ShowHint;
    property PopupMenu: TPopupMenu read FPopupMenu write SetPopupMenu;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnMouseDown: TMouseEvent read FOnMouseDown write FOnMouseDown;
    property OnMouseUp: TMouseEvent read FOnMouseUp write FOnMouseUp;
    property OnMouseMove: TMouseMoveEvent read FOnMouseMove write FOnMouseMove;
    // TCheckListBox properties
    property IntegralHeight: Boolean read GetIntHeight write SetIntHeight;
    property ItemHeight: integer read GetItemHeight write SetItemHeight;
    property ItemIndex: integer read GetItemIndex write SetItemIndex;
    property Items: TStrings read GetItems write SetItems;
    property Sorted: Boolean  read GetSorted write SetSorted;
    property OnSectionClick: TSectionNotifyEvent read GetOnSectionClick write SetOnSectionClick;

    // THeaderControl properties
    property Sections: THeaderSections read GetSections write SetSections;
    // New properties
    property DelimChar: Char read FDelimChar write SetDelimChar;
    property LBStyle: THLBStyle read FLBStyle write SetLBStyle;
    property OnDrawCell: THLBDrawCellEvent read FOnDrawCell write FOnDrawCell;
  end;

implementation

constructor TIQWebHeaderCheckListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);                      // call inherited
  ControlStyle := ControlStyle - [csSetCaption]; // no caption
  Width      := 150;                             // set bounds
  Height     := 100;
  FDelimChar := #32;
  FHeader    := THeaderControl.Create(Self);     // create header
  with FHeader do                                // set header props
  begin
    Parent := Self;
    Align := alTop;
    OnSectionTrack := DrawTrackingLine;          // hook header events
    OnMouseDown := FMouseDown;
    OnMouseUp := FMouseUp;
    OnMouseMove := FMouseMove;
  end;
  FCheckListBox := TCheckListBox.Create(Self);   // create CheckListBox
  with FCheckListBox do                          // set CheckListBox props
  begin
    Parent      := Self;
    Align       := alClient;
    Color       := clWindow;
    ParentColor := FALSE;
    Style       := lbOwnerDrawFixed;
    OnDrawItem  := DrawItem;                     // hook CheckListBox events
    OnClick     := FClick;
    OnDblClick  := FDblClick;
    OnMouseDown := FMouseDown;
    OnMouseUp   := FMouseUp;
    OnMouseMove := FMouseMove;
    Flat        := FALSE;
  end;
end;

destructor TIQWebHeaderCheckListBox.Destroy;
begin
  FHeader.Free;                                  // free header
  FCheckListBox.Free;                                 // free CheckListBox
  inherited Destroy;                             // call inherited
end;

procedure TIQWebHeaderCheckListBox.DrawTrackingLine(HeaderControl: THeaderControl;
  Section: THeaderSection; Width: Integer;  State: TSectionTrackState);
{ OnSectionTrack handler for header.  This procedure is called to }
{ draw the tracking line in the CheckListBox as the  header is sized.  }
begin
  with FCheckListBox.Canvas do
  begin
    Pen.Mode := pmNot;                   // use NOT pen mode
    if (LastPoint > 0) then              // if not first line...
    begin
      MoveTo(LastPoint, 0);
      LineTo(LastPoint, FCheckListBox.ClientHeight);  // erase last line
    end;
    if State <> tsTrackEnd then          // if still tracking...
    begin
      MoveTo(Section.Left + Width, 0);
      LineTo(Section.Left + Width, FCheckListBox.ClientHeight);  // draw new line
      LastPoint := Section.Left + Width;         // save line position
    end
    else begin                                   // otherwise...
      LastPoint := 0;                            // reset line position
      Invalidate;
    end;
  end;
end;

procedure TIQWebHeaderCheckListBox.DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
{ OnDrawItem handler for CheckListBox. This procedure draws each delimited }
{ string into the CheckListBox based on the position of the sections. }
var
  i, CurPos: integer;
  CurItem, NextStr: string;

  function GetNextStr: string;
  { returns string after next delimter }
  var
    TmpPos: integer;
  begin
    TmpPos := Pos(FDelimChar, CurItem);
    if (TmpPos > 0) and (CurPos <= Length(CurItem)) then
    begin
      Result := Copy(CurItem, CurPos, TmpPos - CurPos);
      CurItem[TmpPos] := Chr(Ord(FDelimChar) + 1);
      CurPos := TmpPos + 1;
    end
    else if TmpPos = 0 then
    begin
      Result := Copy(CurItem, CurPos, Length(CurItem));
      CurPos := Length(CurItem) + 1;
    end;
  end;

const
  { DrawText alignment flags }
  Alignment: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
begin
  CurItem := Items[Index];      // get current index
  CurPos := 1;
  LBCanvas.FillRect(Rect);      // empty draw rect
  { iterate over all sections in header }
  for i := 0 to FHeader.Sections.Count - 1 do
  begin
    { create a draw rect based on header section }
    Rect.Left := FHeader.Sections[i].Left;
    Rect.Right := FHeader.Sections[i].Right;
    { draw into rect next delimted string if standard }
    if LBStyle = hlbStandard then
    begin
      NextStr := GetNextStr;
      DrawText(LBCanvas.Handle, PChar(NextStr), Length(NextStr), Rect,
        DT_SINGLELINE or DT_VCENTER or Alignment[Sections[i].Alignment]);
    end
    { call owner draw event if not standard }
    else if Assigned(FOnDrawCell) then
      FOnDrawCell(Self, Index, i, Rect, State);
  end;
end;

procedure TIQWebHeaderCheckListBox.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  if (Operation = opRemove) and (AComponent = FPopupMenu) then
    SetPopupMenu(nil);
end;

procedure TIQWebHeaderCheckListBox.FClick(Sender: TObject);
begin
  if Assigned(FOnClick) then FOnClick(Self);
end;

procedure TIQWebHeaderCheckListBox.FDblClick(Sender: TObject);
begin
  if Assigned(FOnDblClick) then
    FOnDblClick(Self);
end;

function TIQWebHeaderCheckListBox.MakeLocalPoint(Control: TControl; X, Y: integer): TPoint;
{ this function takes a coordinate relative to some arbitrary }
{ control and returns a coordinate relative to self }
begin
  Result.X := X;
  Result.Y := Y;
  Result := ScreenToClient(Control.ClientToScreen(Result));
end;

procedure TIQWebHeaderCheckListBox.FMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
{ OnMouseDown handler for header and CheckListBox.  Resurfaces event. }
var
  Pt: TPoint;
begin
  Pt := MakeLocalPoint(Sender as TControl, X, Y);
  if Assigned(FOnMouseDown) then FOnMouseDown(Self, Button, Shift, Pt.X, Pt.Y);
end;

procedure TIQWebHeaderCheckListBox.FMouseUp(Sender: TObject; Button: TMouseButton; Shift:
  TShiftState; X, Y: Integer);
{ OnMouseUp handler for header and CheckListBox.  Resurfaces event. }
var
  Pt: TPoint;
begin
  Pt := MakeLocalPoint(Sender as TControl, X, Y);
  if Assigned(FOnMouseUp) then FOnMouseUp(Self, Button, Shift, Pt.X, Pt.Y);
end;

procedure TIQWebHeaderCheckListBox.FMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
{ OnMouseMove handler for header and CheckListBox.  Resurfaces event. }
var
  Pt: TPoint;
begin
  Pt := MakeLocalPoint(Sender as TControl, X, Y);
  if Assigned(FOnMouseMove) then FOnMouseMove(Self, Shift, Pt.X, Pt.Y);
end;

procedure TIQWebHeaderCheckListBox.SetDelimChar(Value: Char);
begin
  if FDelimChar <> Value then
  begin
    FDelimChar := Value;
    Invalidate;
  end;
end;

procedure TIQWebHeaderCheckListBox.SetPopupMenu(Value: TPopupMenu);
begin
  FPopupMenu := Value;                    // set everyone's popup menu
  FCheckListBox.PopupMenu := Value;
  FHeader.PopupMenu := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TIQWebHeaderCheckListBox.SetLBStyle(Value: THLBStyle);
begin
  if FLBStyle <> Value then
  begin
    FLBStyle := Value;
    Invalidate;
  end;
end;

{ What follows are bunches of header and CheckListBox properties which are }
{ resurfaced in the TIQWebHeaderCheckListBox component. }

function TIQWebHeaderCheckListBox.GetLBCanvas: TCanvas;
begin
  Result := FCheckListBox.Canvas;
end;

function TIQWebHeaderCheckListBox.GetHeaderCanvas: TCanvas;
begin
  Result := FHeader.Canvas;
end;

function TIQWebHeaderCheckListBox.GetLBHandle: hWnd;
begin
  Result := FCheckListBox.Handle;
end;

function TIQWebHeaderCheckListBox.GetHeaderHandle: hWnd;
begin
  Result := FHeader.Handle;
end;

function TIQWebHeaderCheckListBox.GetItems: TStrings;
begin
  Result := FCheckListBox.Items;
end;

procedure TIQWebHeaderCheckListBox.SetItems(Value: TStrings);
begin
  FCheckListBox.Items.Assign(Value);
end;

function TIQWebHeaderCheckListBox.GetSections: THeaderSections;
begin
  Result := FHeader.Sections
end;

procedure TIQWebHeaderCheckListBox.SetSections(Value: THeaderSections);
begin
  FHeader.Sections.Assign(Value);
  Invalidate;
end;

//function TIQWebHeaderCheckListBox.GetExtSel: Boolean;
//begin
//  Result := FCheckListBox.ExtendedSelect;
//end;

//procedure TIQWebHeaderCheckListBox.SetExtSel(Value: Boolean);
//begin
//  FCheckListBox.ExtendedSelect := Value;
//end;

//function TIQWebHeaderCheckListBox.GetMultiSel: Boolean;
//begin
//  Result := FCheckListBox.MultiSelect;
//end;

//procedure TIQWebHeaderCheckListBox.SetMultiSel(Value: Boolean);
//begin
//  FCheckListBox.MultiSelect := Value;
//end;

function TIQWebHeaderCheckListBox.GetItemHeight: integer;
begin
  Result := FCheckListBox.ItemHeight;
end;

procedure TIQWebHeaderCheckListBox.SetItemHeight(Value: integer);
begin
  FCheckListBox.ItemHeight := Value;
end;

function TIQWebHeaderCheckListBox.GetItemIndex: integer;
begin
  Result := FCheckListBox.ItemIndex;
end;

procedure TIQWebHeaderCheckListBox.SetItemIndex(Value: integer);
begin
  FCheckListBox.ItemIndex := Value;
end;

function TIQWebHeaderCheckListBox.GetIntHeight: Boolean;
begin
  Result := FCheckListBox.IntegralHeight;
end;

procedure TIQWebHeaderCheckListBox.SetIntHeight(Value: Boolean);
begin
  FCheckListBox.IntegralHeight := Value;
end;

function TIQWebHeaderCheckListBox.GetSelected(Index: integer): Boolean;
begin
  Result := FCheckListBox.Selected[Index];
end;

procedure TIQWebHeaderCheckListBox.SetSelected(Index: integer; Value: Boolean);
begin
  FCheckListBox.Selected[Index] := Value;
end;

function TIQWebHeaderCheckListBox.GetChecked(Index: integer): Boolean; 
begin
  Result := FCheckListBox.Checked[Index];
end;

procedure TIQWebHeaderCheckListBox.SetChecked(Index: integer; Value: Boolean);
begin
  FCheckListBox.Checked[Index]:= Value;
end;

function TIQWebHeaderCheckListBox.GetSorted: Boolean;
begin
  Result := FCheckListBox.Sorted;
end;

procedure TIQWebHeaderCheckListBox.SetSorted(Value: Boolean);
begin
  FCheckListBox.Sorted := Value;
end;

function TIQWebHeaderCheckListBox.GetSelCount: integer;
begin
  Result := FCheckListBox.SelCount;
end;

function TIQWebHeaderCheckListBox.GetTopIndex: integer;
begin
  Result := FCheckListBox.TopIndex;
end;

procedure TIQWebHeaderCheckListBox.SetTopIndex(Value: integer);
begin
  FCheckListBox.TopIndex := Value;
end;

function TIQWebHeaderCheckListBox.GetFlat: Boolean;
begin
  Result := FCheckListBox.Flat;
end;

procedure TIQWebHeaderCheckListBox.SetFlat( Value: Boolean );
begin
  FCheckListBox.Flat:= Value;
end;

function TIQWebHeaderCheckListBox.GetOnSectionClick: TSectionNotifyEvent;
begin
  Result:= FHeader.OnSectionClick;
end;

procedure TIQWebHeaderCheckListBox.SetOnSectionClick( Value: TSectionNotifyEvent );
begin
  FHeader.OnSectionClick:= Value;
end;

          
end.
