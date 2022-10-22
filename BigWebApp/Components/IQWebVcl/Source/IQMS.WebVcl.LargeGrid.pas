unit IQMS.WebVcl.LargeGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls,Vcl.ExtCtrls, Data.DB,  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Menus, System.Math,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  FireDAC.UI.Intf,UniDBGrid, IQUniGrid,
  uniGUITypes, uniGUIAbstractClasses,  uniCommonClasses;

type
  TScrollDirection = (sdLeft, sdRight);
  TwwDBCustomDateTimePicker = TObject;

  TwwTitleImageAttributes = class(TPersistent)
  private
    FIsGroupHeader: Boolean;
    FMargin: Integer;
    FAlignment: TAlignment;
    FImageIndex: Integer;
  public
    property IsGroupHeader: Boolean read FIsGroupHeader write FIsGroupHeader;
    property Margin: Integer read FMargin write FMargin;
    property Alignment: TAlignment read FAlignment write FAlignment;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
  end;

type
  TwwDBGridOption = (dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit, dgMultiSelect, dgShowFooter, dgFooter3DCells, dgNoLimitColSize, dgTrailingEllipsis, dgShowCellHint, dgTabExitsOnLastCol, dgFixedResizable, dgFixedEditable, dgProportionalColResize, dgRowResize, dgRowLinesDisableFixed, dgColLinesDisableFixed, dgFixedProportionalResize, dgHideBottomDataLine, dgDblClickColSizing, dgDisableColumnReorder);
  TwwDBGridOptions = set of TwwDBGridOption;

  TwwCustomDrawCellEvent = procedure (Sender: TObject; const Rect: TRect;
    Field: TField; State: TGridDrawState) of object;
  TCalcCellColorsEvent = procedure (Sender: TObject; Field: TField;
    State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush) of object;
  TCalcTitleAttributesEvent = procedure (Sender: TObject; AFieldName: string;
    AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment) of object;
  TwwCalcTitleImageEvent = procedure (Sender: TObject; Field: TField;
    var TitleImageAttributes: TwwTitleImageAttributes) of object;
  TColWidthChangedEvent = procedure (Sender: TObject; Column: Integer) of object;
  TwwCreateDTPEvent = procedure (Sender: TObject; ADateTimePicker: TwwDBCustomDateTimePicker) of object;
  TwwDrawTitleCellEvent = procedure (Sender: TObject; Canvas: TCanvas;
    Field: TField; Rect: TRect; var DefaultDrawing: Boolean) of object;
  TwwFieldChangedEvent = procedure (Sender: TObject; Field: TField) of object;
  TTitleButtonClickEvent = procedure (Sender: TObject; AFieldName: string) of object;


  TIQWebTouchScreenGrid = class(TUniPanel)
    //DBGrid: TwwDBGrid;
    ScrollBox: TUniScrollBox;
    PnlGridCarrier: TUniPanel;
    PnlNavButtons: TUniPanel;
    PnlNavButtons1: TUniPanel;
    sbtnNavFirst: TUniSpeedButton;
    sbtnNavPrior: TUniSpeedButton;
    PnlNavButtons2: TUniPanel;
    sbtnNavNext: TUniSpeedButton;
    sbtnNavLast: TUniSpeedButton;
    PnlScrollControls: TUniPanel;
    PnlScrollButtonsOuter: TUniPanel;
    PnlScrollButtonsInner: TUniPanel;
    PnlScrollButtons1: TUniPanel;
    sbtnScrollFirst: TUniSpeedButton;
    sbtnScrollPrior: TUniSpeedButton;
    PnlScrollButtons2: TUniPanel;
    sbtnScrollNext: TUniSpeedButton;
    sbtnScrollLast: TUniSpeedButton;
    PnlCornerSpacer: TUniPanel;
    procedure DoNavFirst(Sender: TObject);
    procedure DoNavPrior(Sender: TObject);
    procedure DoNavNext(Sender: TObject);
    procedure DoNavLast(Sender: TObject);
    procedure DoScrollFirst(Sender: TObject);
    procedure DoScrollPrior(Sender: TObject);
    procedure DoScrollNext(Sender: TObject);
    procedure DoScrollLast(Sender: TObject);
    procedure RightScrollBtnsParentResize(Sender: TUniControl; OldW, OldH:integer);
    procedure BottomScrollBtnsParentResize(Sender: TUniControl; OldW, OldH:integer);
  private
    { Private declarations }
    FButtonsHeight: Integer;
    FButtonsWidth: Integer;
    FHideCornerSpacer: Boolean;
    FNavButtonOptions: TNavButtonSet;
    FScrollButtonOptions: TNavButtonSet;
    FAutoSize: Boolean;
    FLocked: Boolean;
    FFullRepaint: Boolean;
    procedure SetDataSource(const Value: TDataSource);
    function GetDataSource: TDataSource;
    function GridDataSet: TDataSet;
    procedure ScrollGrid(ADirection : TScrollDirection; AContinuous: Boolean = False);
    procedure SetGridWidth;
    function GetFixedCols: Integer;
    function GetTitleAlignment: TAlignment;
    function GetTitleLines: Integer;
    procedure SetFixedCols(const Value: Integer);
    procedure SetTitleAlignment(const Value: TAlignment);
    procedure SetTitleLines(const Value: Integer);
    function GetOptions: TwwDBGridOptions;
    procedure SetOptions(const Value: TwwDBGridOptions);
    function GetwwSelected: TStrings;
    procedure SetwwSelected(const Value: TStrings);
    function GetDataSet: TDataSet;
    function GetOnCalcCellColors: TCalcCellColorsEvent;
    function GetOnDblClick: TNotifyEvent;
    function GetOnMouseDown: TMouseEvent;
    function GetOnMouseMove: TMouseMoveEvent;
    function GetOnMouseUp: TMouseEvent;
    procedure SetOnCalcCellColors(const Value: TCalcCellColorsEvent);
    procedure SetOnDblClick(const Value: TNotifyEvent);
    procedure SetOnMouseDown(const Value: TMouseEvent);
    procedure SetOnMouseMove(const Value: TMouseMoveEvent);
    procedure SetOnMouseUp(const Value: TMouseEvent);
    function GetHorzontalScrollVisible: Boolean;
    procedure SetHorzontalScrollVisible(const Value: Boolean);
    function GetVerticalScrollVisible: Boolean;
    procedure SetVerticalScrollVisible(const Value: Boolean);
    procedure SetButtonsHeight(const Value: Integer);
    procedure SetButtonsWidth(const Value: Integer);
    procedure SetHideCornerSpacer(const Value: Boolean);
    function GetOnAfterDrawCell: TwwCustomDrawCellEvent;
    function GetOnBeforeDrawCell: TwwCustomDrawCellEvent;
    function GetOnCalcTitleAttributes: TCalcTitleAttributesEvent;
    function GetOnCalcTitleImage: TwwCalcTitleImageEvent;
    function GetOnCellChanged: TNotifyEvent;
    function GetOnColEnter: TNotifyEvent;
    function GetOnColExit: TNotifyEvent;
    function GetOnColumnMoved: TMovedEvent;
    function GetOnColWidthChanged: TColWidthChangedEvent;
    function GetOnCreateDateTimePicker: TwwCreateDTPEvent;
    function GetOnDrawTitleCell: TwwDrawTitleCellEvent;
    function GetOnFieldChanged: TwwFieldChangedEvent;
    function GetOnRowChanged: TNotifyEvent;
    function GetOnTitleButtonClick: TTitleButtonClickEvent;
    procedure SetOnAfterDrawCell(const Value: TwwCustomDrawCellEvent);
    procedure SetOnBeforeDrawCell(const Value: TwwCustomDrawCellEvent);
    procedure SetOnCalcTitleAttributes(
      const Value: TCalcTitleAttributesEvent);
    procedure SetOnCellChanged(const Value: TNotifyEvent);
    procedure SetOnColEnter(const Value: TNotifyEvent);
    procedure SetOnColExit(const Value: TNotifyEvent);
    procedure SetOnColumnMoved(const Value: TMovedEvent);
    procedure SetOnColWidthChanged(const Value: TColWidthChangedEvent);
    procedure SetOnCreateDateTimePicker(const Value: TwwCreateDTPEvent);
    procedure SetOnDrawTitleCell(const Value: TwwDrawTitleCellEvent);
    procedure SetOnFieldChanged(const Value: TwwFieldChangedEvent);
    procedure SetOnRowChanged(const Value: TNotifyEvent);
    procedure SetOnTitleButtonClick(const Value: TTitleButtonClickEvent);
    procedure SetOnCalcTitleImage(const Value: TwwCalcTitleImageEvent);
    function GetGridReadOnly: Boolean;
    function GetRowHeightPercent: Integer;
    function GetTitleButtons: Boolean;
    function GetTitleImageList: TImageList;
    procedure SetGridReadOnly(const Value: Boolean);
    procedure SetRowHeightPercent(const Value: Integer);
    procedure SetTitleButtons(const Value: Boolean);
    procedure SetTitleImageList(const Value: TImageList);
    function GetGridName: String;
    procedure SetGridName(const Value: String);
    procedure SetNavButtonOptions(const Value: TNavButtonSet);
    procedure SetScrollButtonOptions(const Value: TNavButtonSet);
    function GetControlInfoInDataSet: Boolean;
    procedure SetControlInfoInDataSet(const Value: Boolean);
    function GetControlType: TStrings;
    procedure SetControlType(const Value: TStrings);
    function GetUseTFields: Boolean;
    procedure SetUseTFields(const Value: Boolean);
    procedure SetAutoSize(const Value: Boolean);
  protected
    { Protected declarations }
  public
    { Public declarations }
    DBGrid: TIQUniGridControl;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ApplySelected;

    property Grid: TIQUniGridControl read DBGrid write DBGrid;
    property DataSet:TDataSet read GetDataSet;
  published
    { Published declarations }

    // Properties
    property Align;
    property Alignment;
    property Anchors;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default False;
    property BevelInner;
    property BevelOuter;
    property BevelWidth;
    //property BiDiMode;
    property BorderWidth;
    property BorderStyle;
    //property Caption;
    property Color;
    property Constraints;
    property Ctl3D;
    //property UseDockManager default True;
    //property DockSite;
    //property DragCursor;
    //property DragKind;
    //property DragMode;
    property Enabled;
    property FullRepaint: Boolean read FFullRepaint write FFullRepaint;
    property Font;
    property Locked: Boolean read FLocked write FLocked;
    //property ParentBiDiMode;
    property ParentBackground;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    //property ParentShowHint;
    property PopupMenu;
    //property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;

    // DBGrid properties
    property ControlInfoInDataSet: Boolean read GetControlInfoInDataSet
      write SetControlInfoInDataSet stored True default True;
    property ControlType: TStrings read GetControlType
      write SetControlType stored True;
    property GridName: String read GetGridName write SetGridName;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property FixedCols: Integer read GetFixedCols write SetFixedCols;
    property Options: TwwDBGridOptions read GetOptions write SetOptions
       default [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines,
         dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit];
    property RowHeightPercent: Integer read GetRowHeightPercent
     write SetRowHeightPercent;
    property Selected: TStrings read GetwwSelected write SetwwSelected stored True;
    property TitleAlignment: TAlignment read GetTitleAlignment write SetTitleAlignment;
    property TitleButtons: Boolean read GetTitleButtons write SetTitleButtons;
    property TitleImageList: TImageList read GetTitleImageList
     write SetTitleImageList;
    property TitleLines: Integer read GetTitleLines write SetTitleLines;
    property UseTFields: Boolean read GetUseTFields write SetUseTFields stored True;
    property GridReadOnly: Boolean read GetGridReadOnly write SetGridReadOnly;

    // DBGrid Events
    property OnAfterDrawCell: TwwCustomDrawCellEvent
     read GetOnAfterDrawCell write SetOnAfterDrawCell;
    property OnBeforeDrawCell: TwwCustomDrawCellEvent
     read GetOnBeforeDrawCell write SetOnBeforeDrawCell;
    property OnCalcCellColors: TCalcCellColorsEvent
     read GetOnCalcCellColors write SetOnCalcCellColors;
    property OnCalcTitleAttributes: TCalcTitleAttributesEvent
     read GetOnCalcTitleAttributes write SetOnCalcTitleAttributes;
    property OnCalcTitleImage: TwwCalcTitleImageEvent
     read GetOnCalcTitleImage write SetOnCalcTitleImage;
    property OnCellChanged: TNotifyEvent
     read GetOnCellChanged write SetOnCellChanged;
    property OnColumnMoved: TMovedEvent read GetOnColumnMoved
     write SetOnColumnMoved;
    property OnColEnter: TNotifyEvent read GetOnColEnter write SetOnColEnter;
    property OnColExit: TNotifyEvent read GetOnColExit write SetOnColExit;
    property OnColWidthChanged: TColWidthChangedEvent
     read GetOnColWidthChanged write SetOnColWidthChanged;
    property OnCreateDateTimePicker: TwwCreateDTPEvent
     read GetOnCreateDateTimePicker write SetOnCreateDateTimePicker;
    property OnDrawTitleCell: TwwDrawTitleCellEvent
     read GetOnDrawTitleCell write SetOnDrawTitleCell;
    property OnFieldChanged: TwwFieldChangedEvent
     read GetOnFieldChanged write SetOnFieldChanged;
    property OnRowChanged: TNotifyEvent read GetOnRowChanged
     write SetOnRowChanged;
    property OnTitleButtonClick: TTitleButtonClickEvent
     read GetOnTitleButtonClick write SetOnTitleButtonClick;

    // Events
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    // property OnDockDrop;
    // property OnDockOver;
    property OnDblClick: TNotifyEvent read GetOnDblClick write SetOnDblClick;
    // property OnDragDrop;
    // property OnDragOver;
    // property OnEndDock;
    // property OnEndDrag;
    property OnEnter;
    property OnExit;
    // property OnGetSiteInfo;
    // property OnKeyDown: TKeyEvent read GetOnKeyDown write SetOnKeyDown;
    property OnMouseDown: TMouseEvent read GetOnMouseDown write SetOnMouseDown;
    property OnMouseMove: TMouseMoveEvent read GetOnMouseMove write SetOnMouseMove;
    property OnMouseUp: TMouseEvent read GetOnMouseUp write SetOnMouseUp;
    property OnResize;

    // Scroll Btns Properties
    /// <summary> Show or hide the horizontal scroll bar. </summary>
    property HorzontalScrollVisible:Boolean read GetHorzontalScrollVisible write SetHorzontalScrollVisible;
    /// <summary> Show or hide the vertical scroll bar. </summary>
    property VerticalScrollVisible:Boolean read GetVerticalScrollVisible write SetVerticalScrollVisible;
    property ButtonsHeight:Integer read FButtonsHeight write SetButtonsHeight;
    property ButtonsWidth :Integer read FButtonsWidth write SetButtonsWidth;
    property HideCornerSpacer:Boolean read FHideCornerSpacer write SetHideCornerSpacer;
    property ScrollButtonOptions: TNavButtonSet read FScrollButtonOptions write SetScrollButtonOptions;
    property NavButtonOptions: TNavButtonSet read FNavButtonOptions write SetNavButtonOptions;

    // property OnStartDock;
    // property OnStartDrag;
    // property OnUnDock;

end;

implementation

uses
    IQMS.Common.Screen,
    IQMS.WebVcl.ResourceStrings;

{ TIQWebTouchScreenGrid }

constructor TIQWebTouchScreenGrid.Create(AOwner: TComponent);
const
  DEFAULT_HEIGHT = 312;
  DEFAULT_WIDTH = 468;
begin

  inherited Create(AOwner);

  ControlStyle := [csCaptureMouse, csClickEvents, csDoubleClicks];


  // *** Create controls *** //

  // Default Values
  FButtonsHeight   := 60;
  FButtonsWidth    := 60;
  FHideCornerSpacer:= False;
  FAutoSize := False;

  // configure self as owner panel
  Width  := DEFAULT_WIDTH;
  Height := DEFAULT_HEIGHT;
  Caption := '';
//  BorderStyle := bsNone;
  BevelOuter := bvNone;
  BevelInner := bvNone;
  Font.Name := 'Tahoma';
  Font.Size := 10;
  Font.Style := [fsBold];
  DoubleBuffered := True;

  PnlGridCarrier := TUniPanel.Create(Self);
  with PnlGridCarrier do
   begin
    Parent := Self;
    Name := 'PnlGridCarrier';
    Caption := cTXT0000359; // 'No records found';
    Align := alClient;
    BevelInner := bvNone; //bvLowered;
    BevelOuter := bvNone;
    Color := clWhite;
    DoubleBuffered := True;
   end;

   ScrollBox:= TUniScrollBox.Create(Self);
   with ScrollBox do
    begin
      Parent := PnlGridCarrier;
      Name := 'ScrollBox';
      HorzScrollBar.Visible := False;
      VertScrollBar.Visible := False;
      Align := alClient;
      AutoScroll := False;
//      BorderStyle := bsNone;
      DoubleBuffered := True;
    end;


  DBGrid := TIQUniGridControl.Create(Self);
  with DBGrid do
   begin
     // 03/16/2009 Parent must be scrollbox or AV if RowSelect (Byron)
     Parent := ScrollBox;
     Name := 'DBGrid';
     // 03/26/2009 Set the grid to client so that all records and fields
     // show. (Byron)
     Align := alClient;
     Left := 0;
     Top := 0;
     // 03/26/2009 Remmed so that the grid is alClient (Byron)
     //Height := DEFAULT_HEIGHT;
     //Width := DEFAULT_WIDTH;
     Anchors := [akLeft,akTop,akRight,akBottom];
//     BorderStyle := bsNone;
//     ShowHorzScrollBar := False;
//     ShowVertScrollBar := False;
     RowHeightPercent := 200;
//     MemoAttributes := [mSizeable, mWordWrap, mGridShow,mDisableDialog];
     DoubleBuffered := True;
   end;

  PnlNavButtons := TUniPanel.Create(Self);
  with PnlNavButtons do
   begin
    Parent := Self;
    Name := 'PnlNavButtons';
    Caption := '';
    Width := FButtonsWidth + 4;
    Align := alRight;
    BevelInner := bvLowered;
    BevelOuter := bvNone;
    BorderWidth := 1;
    Color := cl3DLight;
    OnResize := RightScrollBtnsParentResize;
   end;

  PnlNavButtons1 := TUniPanel.Create(Self);
  with PnlNavButtons1 do
   begin
     Parent := PnlNavButtons;
     Name := 'PnlNavButtons1';
     Caption := '';
     Height := FButtonsHeight * 2;
     Align := alTop;
     BevelInner := bvNone;
     BevelOuter := bvNone;
   end;

  sbtnNavFirst := TUniSpeedButton.Create(Self);
  with sbtnNavFirst do
   begin
     Parent := PnlNavButtons1;
     Name := 'sbtnNavFirst';
     Align := alTop;
     Caption := '';
     Left := 0;
     Top := 0;
     Width := FButtonsWidth;
     Height := FButtonsHeight;
//     Flat := True;
     Hint := 'First record';
     ShowHint := True;
     Glyph.LoadFromResourceName(HInstance, 'NAVALLUP'); // !
     OnClick := DoNavFirst;
   end;

  sbtnNavPrior := TUniSpeedButton.Create(Self);
  with sbtnNavPrior do
   begin
     Parent := PnlNavButtons1;
     Name := 'sbtnNavPrior';
     Align := alTop;
     Caption := '';
     Left := 0;
     Top := FButtonsHeight;
     Width := FButtonsWidth;
     Height := FButtonsHeight;
//     Flat := True;
     Hint := 'Prior record';
     ShowHint := True;
     Glyph.LoadFromResourceName(HInstance, 'NAVUP'); // !
     OnClick := DoNavPrior;
   end;

  PnlNavButtons2 := TUniPanel.Create(Self);
  with PnlNavButtons2 do
   begin
     Parent := PnlNavButtons;
     Name := 'PnlNavButtons2';
     Caption := '';
     Height := FButtonsHeight * 2;
     Align := alBottom;
     BevelInner := bvNone;
     BevelOuter := bvNone;
   end;

  sbtnNavNext := TUniSpeedButton.Create(Self);
  with sbtnNavNext do
   begin
     Parent := PnlNavButtons2;
     Name := 'sbtnNavNext';
     Align := alBottom;
     Caption := '';
     Left := 0;
     Top := 0;
     Width := FButtonsWidth;
     Height := FButtonsHeight;
//     Flat := True;
     Hint := 'Next record';
     ShowHint := True;
     Glyph.LoadFromResourceName(HInstance, 'NAVDOWN'); // !
     OnClick := DoNavNext;
   end;

  sbtnNavLast := TUniSpeedButton.Create(Self);
  with sbtnNavLast do
   begin
     Parent := PnlNavButtons2;
     Name := 'sbtnNavLast';
     Align := alBottom;
     Caption := '';
     Left := 0;
     Top := FButtonsHeight;
     Width := FButtonsWidth;
     Height := FButtonsHeight;
//     Flat := True;
     Hint := 'Last record';
     ShowHint := True;
     Glyph.LoadFromResourceName(HInstance, 'NAVALLDOWN');
     OnClick := DoNavLast;
   end;

  PnlScrollControls := TUniPanel.Create(Self);
  with PnlScrollControls do
   begin
     if HideCornerSpacer then
       Parent:= PnlGridCarrier
     else
       Parent := Self;

     Name := 'PnlScrollControls';
     Caption := '';
     Height := FButtonsHeight + 4;
     Align := alBottom;
     BevelOuter := bvNone;
     BevelInner := bvNone;
     BorderWidth := 1;
     OnResize := BottomScrollBtnsParentResize;
   end;

  PnlScrollButtonsOuter := TUniPanel.Create(Self);
  with PnlScrollButtonsOuter do
   begin
     Parent := PnlScrollControls;
     Name := 'PnlScrollButtonsOuter';
     Caption := '';
     Align := alClient;
     BevelOuter := bvNone;
     BevelInner := bvNone;
   end;

  PnlScrollButtonsInner := TUniPanel.Create(Self);
  with PnlScrollButtonsInner do
   begin
     Parent := PnlScrollButtonsOuter;
     Name := 'PnlScrollButtonsInner';
     Caption := '';
     Align := alClient;
     BevelInner := bvLowered;
     BevelOuter := bvNone;
     Color := cl3DLight;
   end;

  PnlScrollButtons1 := TUniPanel.Create(Self);
  with PnlScrollButtons1 do
   begin
     Parent := PnlScrollButtonsInner;
     Name := 'PnlScrollButtons1';
     Caption := '';
     Width := FButtonsWidth * 2;
     Align := alLeft;
     BevelInner := bvNone;
     BevelOuter := bvNone;
   end;

  sbtnScrollFirst := TUniSpeedButton.Create(Self);
  with sbtnScrollFirst do
   begin
     Parent := PnlScrollButtons1;
     Name := 'sbtnScrollFirst';
     Align := alLeft;
     Caption := '';
     Left := 0;
     Top := 0;
     Width := FButtonsWidth;
     Height := FButtonsHeight;
//     Flat := True;
     Hint := 'Scroll all left';
     ShowHint := True;
     Glyph.LoadFromResourceName(HInstance, 'NAVALLLEFT'); //!
     OnClick := DoScrollFirst;
   end;

  sbtnScrollPrior := TUniSpeedButton.Create(Self);
  with sbtnScrollPrior do
   begin
     Parent := PnlScrollButtons1;
     Name := 'sbtnScrollPrior';
     Align := alLeft;
     Caption := '';
     Left := FButtonsHeight;
     Top := 0;
     Width := FButtonsWidth;
     Height := FButtonsHeight;
//     Flat := True;
     Hint := 'Scroll left';
     ShowHint := True;
     Glyph.LoadFromResourceName(HInstance, 'NAVLEFT'); //!
     OnClick := DoScrollPrior;
   end;

  PnlScrollButtons2 := TUniPanel.Create(Self);
  with PnlScrollButtons2 do
   begin
     Parent := PnlScrollButtonsInner;
     Name := 'PnlScrollButtons2';
     Caption := '';
     Width := FButtonsWidth * 2;
     Align := alRight;
     BevelInner := bvNone;
     BevelOuter := bvNone;
   end;

  sbtnScrollNext := TUniSpeedButton.Create(Self);
  with sbtnScrollNext do
   begin
     Parent := PnlScrollButtons2;
     Name := 'sbtnScrollNext';
     Align := alRight;
     Caption := '';
     Left := 0;
     Top := 0;
     Width := FButtonsWidth;
     Height := FButtonsHeight;
//     Flat := True;
     Hint := 'Scroll right';
     ShowHint := True;
     Glyph.LoadFromResourceName(HInstance, 'NAVRIGHT'); // !
     OnClick := DoScrollNext;
   end;

  sbtnScrollLast := TUniSpeedButton.Create(Self);
  with sbtnScrollLast do
   begin
     Parent := PnlScrollButtons2;
     Name := 'sbtnScrollLast';
     Align := alRight;
     Caption := '';
     Left := FButtonsWidth;
     Top := 0;
     Width := FButtonsWidth;
     Height := FButtonsHeight;
//     Flat := True;
     Hint := 'Scroll all right';
     ShowHint := True;
     Glyph.LoadFromResourceName(HInstance, 'NAVALLRIGHT'); // !
     OnClick := DoScrollLast;
   end;

  PnlCornerSpacer := TUniPanel.Create(Self);
  with PnlCornerSpacer do
   begin
     Parent := PnlScrollButtonsOuter;
     Name := 'PnlCornerSpacer';
     Caption := '';
     Width := FButtonsWidth + 3;
     Align := alRight;
     BevelOuter := bvNone;
     BevelInner := bvNone;
     Visible:= not FHideCornerSpacer;
   end;

  FNavButtonOptions := [nbFirst, nbPrior, nbNext, nbLast];
  FScrollButtonOptions := [nbFirst, nbPrior, nbNext, nbLast];
end;

destructor TIQWebTouchScreenGrid.Destroy;
begin
  //
  inherited Destroy;
end;

{procedure TIQWebTouchScreenGrid.AutoSizeGrid;
var
   AUseTFields: Boolean;
   AOptions: TwwDBGridOptions;
   i, x: Integer;
begin
  try
     AUseTFields := DBGrid.UseTFields;
     AOptions := DBGrid.Options;

     //Set UseTFields to False.
     DBGrid.UseTFields := False;

     //Set Options dgFixedResizable to False
     DBGrid.Options := DBGrid.Options - [dgFixedResizable];

     //Set Options dgProportionalColResize to False
     DBGrid.Options := DBGrid.Options - [dgProportionalColResize];

     //Set Options dgProportionalColResize to True
     DBGrid.Options := DBGrid.Options + [dgProportionalColResize];

     //Increase and then decrease the size of the grid by 1 pixel
     DBGrid.Width := DBGrid.Width - 1;
     DBGrid.Width := DBGrid.Width + 1;

  finally
     DBGrid.UseTFields := AUseTFields;
     DBGrid.Options := AOptions;
  end;

  for i := 1 to DBGrid.FieldCount do
  begin
    //  z := z + DBGrid.ColWidthsPixels[i];
    x := iqscreen.GetTextWidthPixels(DBGRid.Font,
     DBGrid.Fields[i].DisplayLabel, TForm(Owner));
    DBGrid.ColWidths[i] := Max(x,DBGrid.ColWidthsPixels[i]);
  end;

end; }

procedure TIQWebTouchScreenGrid.BottomScrollBtnsParentResize(Sender: TUniControl; OldW, OldH:integer);
var
  i, ASize: Integer;

  procedure _SetSize(ABtn: TUniSpeedButton; AValue: Integer);
  begin
    ABtn.Width := AValue;
    ABtn.Height := AValue;
  end;

begin
  // Autosize the BOTTOM Vcl.Buttons
  if FAutoSize then
    begin
      ASize := PnlScrollButtonsInner.Width div 4;
      if PnlScrollButtonsInner.Width > (FButtonsWidth * 4) then
        ASize := FButtonsWidth;
    end
  else
    ASize := FButtonsWidth;

  PnlScrollControls.Height := ASize + 4;
  _SetSize(sbtnScrollFirst, ASize);
  _SetSize(sbtnScrollPrior, ASize);
  PnlScrollButtons1.Width := Trunc(ASize * 2);
  _SetSize(sbtnScrollNext, ASize);
  _SetSize(sbtnScrollLast, ASize);
  PnlScrollButtons2.Width := Trunc(ASize * 2);
end;

procedure TIQWebTouchScreenGrid.RightScrollBtnsParentResize(Sender: TUniControl; OldW, OldH:integer);
var
  i, ASize: Integer;

  procedure _SetSize(ABtn: TUniSpeedButton; AValue: Integer);
  begin
    ABtn.Width := AValue;
    ABtn.Height := AValue;
  end;

begin
  // Autosize the RIGHT Vcl.Buttons
  if FAutoSize then
    begin
      ASize := PnlNavButtons.Height div 4;
      if PnlNavButtons.Height > (FButtonsHeight * 4) then
        ASize := FButtonsHeight;
    end
  else
    ASize := FButtonsHeight;
  PnlNavButtons.Width := ASize + 4;
  _SetSize(sbtnNavFirst, ASize);
  _SetSize(sbtnNavPrior, ASize);
  PnlNavButtons1.Height := Trunc(ASize * 2);
  _SetSize(sbtnNavNext, ASize);
  _SetSize(sbtnNavLast, ASize);
  PnlNavButtons2.Height := Trunc(ASize * 2);
end;

procedure TIQWebTouchScreenGrid.DoNavFirst(Sender: TObject);
begin
  // go to the first record
  if (GridDataSet = NIL) or not (GridDataSet.Active) then Exit;
  Application.ProcessMessages;
  // GridDataSet.First; jason - this causes display problem(shows "(memo)" instead of text
                              // when scrolling to the top) when displaying text from memo field
  GridDataSet.Close;
  GridDataSet.Open;
end;

procedure TIQWebTouchScreenGrid.DoNavLast(Sender: TObject);
begin
  // go to the last record
  if (GridDataSet = NIL) or not (GridDataSet.Active) then Exit;
  Application.ProcessMessages;
  GridDataSet.Last;
end;

procedure TIQWebTouchScreenGrid.DoNavNext(Sender: TObject);
begin
  // go to the next record
  if (GridDataSet = NIL) or not (GridDataSet.Active) then Exit;
  Application.ProcessMessages;
  GridDataSet.Next;
end;

procedure TIQWebTouchScreenGrid.DoNavPrior(Sender: TObject);
begin
  // go to the previous record
  if (GridDataSet = NIL) or not (GridDataSet.Active) then Exit;
  Application.ProcessMessages;
  GridDataSet.Prior;
end;

procedure TIQWebTouchScreenGrid.DoScrollFirst(Sender: TObject);
begin
  // scroll to the first field
//  if (GridDataSet = NIL) or not (GridDataSet.Active) then Exit;
//  if not (dgRowSelect in DBGrid.Options) then
//     DBGrid.SetActiveField(DBGrid.Fields[0].FieldName)
//  else ScrollGrid(sdRight, True);
end;

procedure TIQWebTouchScreenGrid.DoScrollLast(Sender: TObject);
begin
  // scroll to the last field
//  if (GridDataSet = NIL) or not (GridDataSet.Active) then Exit;
//  Application.ProcessMessages;
//  if not (dgRowSelect in DBGrid.Options) then
//     DBGrid.SetActiveField(DBGrid.Fields[DBGrid.FieldCount - 1].FieldName)
//  else ScrollGrid(sdLeft, True);
end;

procedure TIQWebTouchScreenGrid.DoScrollNext(Sender: TObject);
var
  AIndex:Integer;
begin
  // scroll to the next field
  if (GridDataSet = NIL) or not (GridDataSet.Active) then Exit;
  Application.ProcessMessages;

//  if not (dgRowSelect in DBGrid.Options) then
//     begin
//       AIndex:= DBGrid.GetActiveCol - 1 + 1;
//       if AIndex > DBGrid.FieldCount - 1 then
//          EXIT;
//       DBGrid.SetActiveField(DBGrid.Fields[AIndex].FieldName);
//     end
//  else ScrollGrid(sdLeft);
end;

procedure TIQWebTouchScreenGrid.DoScrollPrior(Sender: TObject);
var
  AIndex:Integer;
begin
  // scroll to the prior field
  if (GridDataSet = NIL) or not (GridDataSet.Active) then Exit;
  Application.ProcessMessages;

//  if not (dgRowSelect in DBGrid.Options) then
//     begin
//       AIndex:= DBGrid.GetActiveCol - 1 - 1;
//       if AIndex < 0 then
//          EXIT;
//       DBGrid.SetActiveField(DBGrid.Fields[ AIndex ].FieldName);
//     end
//  else ScrollGrid(sdRight);
end;

function TIQWebTouchScreenGrid.GetDataSource: TDataSource;
begin
  Result := DBGrid.DataSource;
end;

function TIQWebTouchScreenGrid.GridDataSet: TDataSet;
begin
  // this method is used internally
  if Assigned(DBGrid.DataSource) then
     Result := DBGrid.DataSource.DataSet
  else Result := NIL;
end;

procedure TIQWebTouchScreenGrid.ScrollGrid(ADirection: TScrollDirection;
  AContinuous: Boolean);
const
  CONTINUOUS_INCREMENT = 20;
  INCREMENT_BY = 100; // Distance of one scroll click
var
   AMaxLeft, // When speed scrolling to the right, this is max left
   i : Integer;
begin

  AMaxLeft := 0;

  // configure the grid
  with DBGrid do
   begin
    Align := alNone;
    // Note:  The physical width of the DBGrid is modified.  We scroll the
    //        scrollbox and move the Left property of the grid.
    SetGridWidth;
    Anchors := [akLeft, akTop, akBottom];
   end;

  if DBGrid.DBGrid.Columns.Count = 0 then
     Exit;

  // Max left value.  This will place the last column flush with the
  // right side of the scrollbox.
  AMaxLeft := (DBGrid.Width - DBGrid.Parent.Width);
  if AMaxLeft <= 0 then AMaxLeft := 0;

  case ADirection of
    sdLeft:
      begin
        if (DBGrid.Left <= 0) and (DBGrid.Left > -AMaxLeft) then
        with ScrollBox do
        begin
          if not AContinuous then
             begin
               ScrollBy(-INCREMENT_BY, 0);
               Update;
               if (DBGrid.Left < -AMaxLeft) then
                  DBGrid.Left := -AMaxLeft;
             end
          else
          if AContinuous then
             while (DBGrid.Left <= 0) do
              begin
                ScrollBy(-CONTINUOUS_INCREMENT, 0);
                Update;
                if (DBGrid.Left <= -AMaxLeft) then
                   begin
                     DBGrid.Left := -AMaxLeft;
                     Break;
                   end;
              end;
        end;
      end;
    sdRight:
      if (DBGrid.Left < 0) then
      with ScrollBox do
      begin
        if not AContinuous then
           begin
             ScrollBy(INCREMENT_BY, 0);
             Update;
           end
        else
        if AContinuous then
           while (DBGrid.Left < 0) do
            begin
              ScrollBy(CONTINUOUS_INCREMENT, 0);
              Update;
              if DBGrid.Left >= 0 then
                 Break;
            end;
      end;
  end;

  // Ensure the left edge is not too far over
  if DBGrid.Left > 0 then
     DBGrid.Left := 0;
end;

procedure TIQWebTouchScreenGrid.SetDataSource(const Value: TDataSource);
begin
  DBGrid.DataSource := Value;
end;

procedure TIQWebTouchScreenGrid.SetGridWidth;
var
   i, z: Integer;
begin
  z := 0; // reset
  // Get the physical width of the TwwDBGrid.
  // Note: ColWidthsPixels (and ColWidths) is 1-based,
  //   not zero-based.
  for i := 1 to DBGrid.DBGrid.Columns.Count do
      z := z + DBGrid.DBGrid.Columns.Items[i].Width;
  DBGrid.Width := z + GetSystemMetrics(SM_CXVSCROLL) + 6;
end;

function TIQWebTouchScreenGrid.GetFixedCols: Integer;
begin
//  Result := DBGrid.FixedCols;
end;

function TIQWebTouchScreenGrid.GetTitleAlignment: TAlignment;
begin
//  Result := DBGrid.DBGrid.TitleAlignment;
end;

function TIQWebTouchScreenGrid.GetTitleLines: Integer;
begin
//  Result := DBGrid.TitleLines;
end;

function TIQWebTouchScreenGrid.GetUseTFields: Boolean;
begin
//  Result := DBGrid.UseTFields;
end;

procedure TIQWebTouchScreenGrid.SetFixedCols(const Value: Integer);
begin
//  DBGrid.FixedCols := Value;
end;

procedure TIQWebTouchScreenGrid.SetTitleAlignment(const Value: TAlignment);
begin
//  DBGrid.TitleAlignment := Value;
end;

procedure TIQWebTouchScreenGrid.SetTitleLines(const Value: Integer);
begin
//  DBGrid.TitleLines := Value;
end;

procedure TIQWebTouchScreenGrid.SetUseTFields(const Value: Boolean);
begin
//  DBGrid.UseTFields := Value;
end;

function TIQWebTouchScreenGrid.GetOptions: TwwDBGridOptions;
begin
//  Result:= DBGrid.Options;
end;

procedure TIQWebTouchScreenGrid.SetOptions(const Value: TwwDBGridOptions);
begin
//  DBGrid.Options:= Value;
end;

function TIQWebTouchScreenGrid.GetwwSelected: TStrings;
begin
//  Result:= DBGrid.Selected;
end;

procedure TIQWebTouchScreenGrid.SetwwSelected(const Value: TStrings);
begin
//  DBGrid.Selected.Assign(Value);
end;

function TIQWebTouchScreenGrid.GetControlInfoInDataSet: Boolean;
begin
//  Result := DBGrid.ControlInfoInDataSet;
end;

function TIQWebTouchScreenGrid.GetControlType: TStrings;
begin
//  Result := DBGrid.ControlType;
end;

function TIQWebTouchScreenGrid.GetDataSet: TDataSet;
begin
  Result := nil;
  if Assigned(DBGrid.DataSource) then
     Result := DBGrid.DataSource.DataSet;
end;

function TIQWebTouchScreenGrid.GetOnCalcCellColors: TCalcCellColorsEvent;
begin
  Result := nil;
//  Result := DBGrid.DBGrid.OnCalcCellColors;
end;

function TIQWebTouchScreenGrid.GetOnDblClick: TNotifyEvent;
begin
  Result := DBGrid.DBGrid.OnDblClick;
end;

function TIQWebTouchScreenGrid.GetOnMouseDown: TMouseEvent;
begin
  Result:= DBGrid.DBGrid.OnMouseDown;
end;

function TIQWebTouchScreenGrid.GetOnMouseMove: TMouseMoveEvent;
begin
//  Result := DBGrid.DBGrid.OnMouseMove;
end;

function TIQWebTouchScreenGrid.GetOnMouseUp: TMouseEvent;
begin
  Result := DBGrid.DBGrid.OnMouseUp;
end;

procedure TIQWebTouchScreenGrid.SetOnCalcCellColors(
  const Value: TCalcCellColorsEvent);
begin
//  DBGrid.OnCalcCellColors := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnDblClick(const Value: TNotifyEvent);
begin
  DBGrid.DBGrid.OnDblClick := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnMouseDown(const Value: TMouseEvent);
begin
  DBGrid.DBGrid.OnMouseDown := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnMouseMove(const Value: TMouseMoveEvent);
begin
//  DBGrid.OnMouseMove := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnMouseUp(const Value: TMouseEvent);
begin
  DBGrid.DBGrid.OnMouseUp := Value;
end;

function TIQWebTouchScreenGrid.GetHorzontalScrollVisible: Boolean;
begin
  Result:= PnlScrollControls.Visible;
end;

procedure TIQWebTouchScreenGrid.SetHorzontalScrollVisible(const Value: Boolean);
begin
  with PnlScrollControls do
  begin
    Visible:= Value;
    Invalidate;
  end;
end;

function TIQWebTouchScreenGrid.GetVerticalScrollVisible: Boolean;
begin
  Result:= PnlNavButtons.Visible;
end;

procedure TIQWebTouchScreenGrid.SetVerticalScrollVisible(const Value: Boolean);
begin
  with PnlNavButtons do
  begin
    Visible:= Value;
    Invalidate;
  end;
end;

procedure TIQWebTouchScreenGrid.SetAutoSize(const Value: Boolean);
begin
  FAutoSize := Value;
  BottomScrollBtnsParentResize(PnlScrollControls,0,0);
  RightScrollBtnsParentResize(PnlNavButtons,0,0);
end;

procedure TIQWebTouchScreenGrid.SetButtonsHeight(const Value: Integer);
begin
  FButtonsHeight := Value;

  PnlNavButtons1.Height   := ButtonsHeight * 2;
  sbtnNavFirst.Height     := ButtonsHeight;
  sbtnNavPrior.Height     := ButtonsHeight;
  sbtnNavPrior.top        := ButtonsHeight;
  PnlNavButtons2.Height   := ButtonsHeight * 2;
  sbtnNavNext.Height      := ButtonsHeight;
  sbtnNavLast.Height      := ButtonsHeight;
  sbtnNavLast.Top         := ButtonsHeight;
  PnlScrollControls.Height:= ButtonsHeight + 4;
  sbtnScrollFirst.Height  := ButtonsHeight;
  sbtnScrollPrior.Height  := ButtonsHeight;
  sbtnScrollNext.Height   := ButtonsHeight;
  sbtnScrollLast.Height   := ButtonsHeight;
end;

procedure TIQWebTouchScreenGrid.SetButtonsWidth(const Value: Integer);
begin
  FButtonsWidth := Value;

  PnlNavButtons.Width    := ButtonsWidth + 4;
  sbtnNavFirst.Width     := ButtonsWidth;
  sbtnNavPrior.Width     := ButtonsWidth;
  sbtnNavNext.Width      := ButtonsWidth;
  sbtnNavLast.Width      := ButtonsWidth;
  PnlScrollButtons1.Width:= ButtonsWidth * 2;
  PnlScrollButtons2.Width:= ButtonsWidth * 2;
  sbtnScrollFirst.Width  := ButtonsWidth;
  sbtnScrollPrior.Width  := ButtonsWidth;
  sbtnScrollPrior.Left   := ButtonsWidth;
  sbtnScrollNext.Width   := ButtonsWidth;
  sbtnScrollLast.Width   := ButtonsWidth;
  sbtnScrollLast.Left    := ButtonsWidth;
  PnlCornerSpacer.Width  := ButtonsWidth + 3;
end;

procedure TIQWebTouchScreenGrid.SetControlInfoInDataSet(const Value: Boolean);
begin
//  DBGrid.ControlInfoInDataSet := Value;
end;

procedure TIQWebTouchScreenGrid.SetControlType(const Value: TStrings);
begin
//  DBGrid.ControlType := Value;
end;

procedure TIQWebTouchScreenGrid.SetHideCornerSpacer(const Value: Boolean);
begin
  FHideCornerSpacer:= Value;
  PnlCornerSpacer.Visible:= not FHideCornerSpacer;
end;

function TIQWebTouchScreenGrid.GetOnAfterDrawCell: TwwCustomDrawCellEvent;
begin
  Result := nil;
// Result := DBGrid.DBGrid.OnAfterDrawCell;
end;

function TIQWebTouchScreenGrid.GetOnBeforeDrawCell: TwwCustomDrawCellEvent;
begin
  Result := nil;
//  Result := DBGrid.OnBeforeDrawCell;
end;

function TIQWebTouchScreenGrid.GetOnCalcTitleAttributes: TCalcTitleAttributesEvent;
begin
  Result := nil;
//  Result := DBGrid.DBGrid.OnCalcTitleAttributes;
end;

function TIQWebTouchScreenGrid.GetOnCalcTitleImage: TwwCalcTitleImageEvent;
begin
  Result := nil;
//  Result := DBGrid.OnCalcTitleImage;
end;

function TIQWebTouchScreenGrid.GetOnCellChanged: TNotifyEvent;
begin
  Result := nil;
//  Result := DBGrid.DBGrid.OnCellChanged;
end;

function TIQWebTouchScreenGrid.GetOnColEnter: TNotifyEvent;
begin
  Result := nil;
//  Result := DBGrid.OnColEnter;
end;

function TIQWebTouchScreenGrid.GetOnColExit: TNotifyEvent;
begin
  Result := nil;
//  Result := DBGrid.OnColExit;
end;

function TIQWebTouchScreenGrid.GetOnColumnMoved: TMovedEvent;
begin
  Result := nil;
//  Result := DBGrid.OnColumnMoved;
end;

function TIQWebTouchScreenGrid.GetOnColWidthChanged: TColWidthChangedEvent;
begin
  Result := nil;
//  Result := DBGrid.OnColWidthChanged;
end;

function TIQWebTouchScreenGrid.GetOnCreateDateTimePicker: TwwCreateDTPEvent;
begin
  Result := nil;
//  Result := DBGrid.OnCreateDateTimePicker;
end;

function TIQWebTouchScreenGrid.GetOnDrawTitleCell: TwwDrawTitleCellEvent;
begin
  Result := nil;
//  Result := DBGrid.OnDrawTitleCell;
end;

function TIQWebTouchScreenGrid.GetOnFieldChanged: TwwFieldChangedEvent;
begin
  Result := nil;
//  Result := DBGrid.OnFieldChanged;
end;

function TIQWebTouchScreenGrid.GetOnRowChanged: TNotifyEvent;
begin
  Result := nil;
//  Result := DBGrid.OnRowChanged;
end;

function TIQWebTouchScreenGrid.GetOnTitleButtonClick: TTitleButtonClickEvent;
begin
  Result := nil;
//  Result := DBGrid.OnTitleButtonClick;
end;

procedure TIQWebTouchScreenGrid.SetOnAfterDrawCell(
  const Value: TwwCustomDrawCellEvent);
begin
//  DBGrid.OnAfterDrawCell := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnBeforeDrawCell(
  const Value: TwwCustomDrawCellEvent);
begin
//    DBGrid.OnBeforeDrawCell := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnCalcTitleAttributes(
  const Value: TCalcTitleAttributesEvent);
begin
//  DBGrid.OnCalcTitleAttributes := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnCellChanged(const Value: TNotifyEvent);
begin
//  DBGrid.OnCellChanged := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnColEnter(const Value: TNotifyEvent);
begin
//  DBGrid.OnColEnter := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnColExit(const Value: TNotifyEvent);
begin
//  DBGrid.OnColExit := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnColumnMoved(const Value: TMovedEvent);
begin
//  DBGrid.OnColumnMoved := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnColWidthChanged(
  const Value: TColWidthChangedEvent);
begin
//  DBGrid.OnColWidthChanged := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnCreateDateTimePicker(
  const Value: TwwCreateDTPEvent);
begin
//  DBGrid.OnCreateDateTimePicker := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnDrawTitleCell(
  const Value: TwwDrawTitleCellEvent);
begin
//  DBGrid.OnDrawTitleCell := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnFieldChanged(
  const Value: TwwFieldChangedEvent);
begin
//  DBGrid.OnFieldChanged := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnRowChanged(const Value: TNotifyEvent);
begin
//  DBGrid.OnRowChanged := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnTitleButtonClick(
  const Value: TTitleButtonClickEvent);
begin
//  DBGrid.OnTitleButtonClick := Value;
end;

procedure TIQWebTouchScreenGrid.SetOnCalcTitleImage(
  const Value: TwwCalcTitleImageEvent);
begin
//  DBGrid.OnCalcTitleImage := Value;
end;

function TIQWebTouchScreenGrid.GetGridReadOnly: Boolean;
begin
  Result := DBGrid.DBGrid.ReadOnly;
end;

function TIQWebTouchScreenGrid.GetRowHeightPercent: Integer;
begin
  Result := 22;
//  Result := DBGrid.RowHeightPercent;
end;

function TIQWebTouchScreenGrid.GetTitleButtons: Boolean;
begin
  Result := False;
//  Result := DBGrid.TitleButtons;
end;

function TIQWebTouchScreenGrid.GetTitleImageList: TImageList;
begin
  Result := nil;
//  Result := DBGrid.TitleImageList;
end;

procedure TIQWebTouchScreenGrid.SetGridReadOnly(const Value: Boolean);
begin
  DBGrid.DBGrid.ReadOnly := Value;
end;

procedure TIQWebTouchScreenGrid.SetRowHeightPercent(const Value: Integer);
begin
//  DBGrid.RowHeightPercent := Value;
end;

procedure TIQWebTouchScreenGrid.SetTitleButtons(const Value: Boolean);
begin
//  DBGrid.TitleButtons := Value;
end;

procedure TIQWebTouchScreenGrid.SetTitleImageList(const Value: TImageList);
begin
//  DBGrid.TitleImageList := Value;
end;

function TIQWebTouchScreenGrid.GetGridName: String;
begin
  Result := '';
    Result := DBGrid.Name;
end;

procedure TIQWebTouchScreenGrid.SetGridName(const Value: String);
begin
  DBGrid.Name := Value;
end;

procedure TIQWebTouchScreenGrid.SetNavButtonOptions(const Value: TNavButtonSet);
begin
  FNavButtonOptions := Value;
  //nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh
  sbtnNavFirst.Visible := nbFirst in FNavButtonOptions;
  sbtnNavPrior.Visible := nbPrior in FNavButtonOptions;
  sbtnNavNext.Visible  := nbNext in FNavButtonOptions;
  sbtnNavLast.Visible  := nbLast in FNavButtonOptions;

  if not sbtnNavFirst.Visible then
     begin
       sbtnNavPrior.Top := 0;
       PnlNavButtons1.Height := FButtonsHeight;
     end
  else
     begin
       sbtnNavFirst.Top := 0;
       sbtnNavPrior.Top := FButtonsHeight;
       PnlNavButtons1.Height := FButtonsHeight * 2;
     end;

  if not sbtnNavLast.Visible then
     begin
       sbtnNavNext.Top := 0; //FButtonsHeight;
       PnlNavButtons2.Height := FButtonsHeight;
     end
  else
     begin
       sbtnNavLast.Top := FButtonsHeight;
       sbtnNavNext.Top := 0;
       PnlNavButtons2.Height := FButtonsHeight * 2;
     end;

end;

procedure TIQWebTouchScreenGrid.SetScrollButtonOptions(const Value: TNavButtonSet);
begin
  FScrollButtonOptions := Value;
  //nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh
  sbtnScrollFirst.Visible := nbFirst in FScrollButtonOptions;
  sbtnScrollPrior.Visible := nbPrior in FScrollButtonOptions;
  sbtnScrollNext.Visible  := nbNext in FScrollButtonOptions;
  sbtnScrollLast.Visible  := nbLast in FScrollButtonOptions;


  if not sbtnScrollFirst.Visible then
     begin
       sbtnScrollPrior.Left := 0;
       PnlScrollButtons1.Width := FButtonsWidth;
     end
  else
     begin
       sbtnScrollFirst.Left := 0;
       sbtnScrollPrior.Left := FButtonsWidth;
       PnlScrollButtons1.Width := (FButtonsWidth * 2);
     end;

  if not sbtnScrollLast.Visible then
     begin
       sbtnScrollNext.Left := 0; // FButtonsWidth;
       PnlScrollButtons2.Width := FButtonsWidth;
     end
  else
     begin
       sbtnScrollLast.Left := FButtonsWidth;
       sbtnScrollNext.Left := 0;
       PnlScrollButtons2.Width := FButtonsWidth * 2;
     end;
end;

procedure TIQWebTouchScreenGrid.ApplySelected;
begin
//  DBGrid.ApplySelected;
end;

end.
