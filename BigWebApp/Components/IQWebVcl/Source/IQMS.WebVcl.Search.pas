{
Notes on how to associate an HPick to IQMS.WebVcl.Search:
1. Drop IQMS.WebVcl.HPick on the form
2. Copy/paste SQL & Fields from the Fields Editor of the IQMS.WebVcl.Search Query
3. Hookup before open, make sure param type of params is assigned
4. Hook up IQMS.WebVcl.Search.HPick
5. Optional - adjust picklist sql with the keywords such as -- _HPICK_WHERE_START_ etc
}

{
04-30-2015 To add subquery support. (Example: oe_quick_add_multi)
   1. SubqueryModuleName = 'INVENTORY'
      // doesnt have to be the table name. Used to differentiate stored filter criteria (such as between sales order and something else)
   2. SubqueryFieldName = 'arinvt.id'
      // used in the where class of the picklist: ... and arinvt.id = gtt_picklist_subquery.id
   3. Designate where should system add subquery in the [from] and [where] clause
      (see example in \oe\oe_quick_add_multi.pas)
      [From]
     /* HPICK_SUBQUERY_FROM_START */
     /* HPICK_SUBQUERY_FROM_END */

     [Where]
     /* HPICK_SUBQUERY_WHERE_START */
     /* HPICK_SUBQUERY_WHERE_END */
}


unit IQMS.WebVcl.Search;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Clipbrd,
  uniGUIClasses, uniGUIFrame,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.DBCtrls,

//  Vcl.Wwkeycb, Vcl.Wwdbigrd, Vcl.Wwdbgrid,  Vcl.Wwdatsrc, Vcl.wwMemo, Vcl.Wwfltdlg,

  Vcl.Menus,  uniDBGrid,uniGUIAbstractClasses,uniGUITypes,
  Data.DB, Datasnap.DBClient, IQMS.WebVcl.DBExpress, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Time,
  IQMS.WebVcl.HPick,
  IQMS.Common.JumpConstants,
  IQMS.Common.Registry,
  IQMS.WebVcl.LargeGrid, UniMainMenu,
  IQMS.WebVcl.UDRecView,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniDBNavigator,UniImageList;

type
  TSortDirection = (sdAscending, sdDescending);

  THPickNotifyEvent = procedure( Sender: TObject; var AHandled: Boolean ) of object;
  TAssignOriginToOrderBy = procedure( Sender: TObject; AField: TField; var AOrigin: string ) of object;

//  TwwMemoAttributes;


  TIQWebSearch = class(TUniFrame)
  private
    { Private declarations }
    FSearchPanel: TUniPanel;
    FSpeedBtnPanel:TUniPanel;
    FFilterBtnPanel:TUniPanel;
    FUDRecViewPanel: TUniPanel;
    FSplitter: TUniSplitter;
    FUserBtn1Panel:TUniPanel;
    FStatusBar1: TUniStatusBar;

    FUDRecView: TUniSpeedButton;
    FFilterBtn: TUniSpeedButton;
    FRemoveFilterBtn: TUniSpeedButton;
    FToggleBtn: TUniSpeedButton;
    FSelectAllBtn: TUniSpeedButton;
    FUnSelectAllBtn: TUniSpeedButton;
    FUserBtn1:TUniSpeedButton;
    FSortColumnsBtn: TUniSpeedButton;
    FSubQueryBtn: TUniSpeedButton;
    FSubQueryImageList: TUniImageList;

//    FwwGrid: TwwDBGrid;
    FSearchCtrlPanel:TUniPanel;
    FSearchCtrlPanelLeft:TUniPanel;
    FSearchCtrlPanelClient:TUniPanel;
//    FwwIncSearch: TwwIncrementalSearch;
    FOriginalTitleImageList: TUniImageList;
    FTitleImageList: TUniImageList;
    FUserTitleImageList: TUniImageList;
//    FwwFilterDialog: TwwFilterDialog;

    FIQUDRecView: TIQWebUDRecView;

    FInterPopMenu: TUniPopupMenu;  {Internal}
    FExterPopMenu: TUniPopupMenu;  {External}

    FExterAfterOpen  : TDataSetNotifyEvent;
//    FExterBeforeClose: TDataSetNotifyEvent;
    FDoOnColumnMoved : TDataSetNotifyEvent;
    FDoOnColWidthChanged : TDataSetNotifyEvent;
    FwwGridDefaultDrawing: Boolean;
    wwDBGridControlType: TStringList;
    FwwGridUseTFields: Boolean;
    wwDBGridImageList: TUniImageList;
    wwDBGridFixedCols: Integer;
    wwDBGridTitleLines: Integer;
    wwDBGridTitleAlignment: TAlignment;
//    wwDBGridMemoAttributes: TwwMemoAttributes;
    wwDBGridRowHeightPercent: Integer;
    FwwGridSelected: TStringList;
    FwwGridOptions: TUniDBGridOptions;
    FwwGridOnDblClick: TNotifyEvent;
    FwwGridOnMouseMove: TMouseMoveEvent;
    FwwGridOnEndDrag: TEndDragEvent;
    FwwGridOnDragDrop: TDragDropEvent;
    FwwGridOnDrawDataCell: TDrawDataCellEvent;
    FwwGridOnDragOver: TDragOverEvent;
    FwwGridOnMouseDown: TMouseEvent;
    FwwGridDataSource: TDataSource;
    FwwIncSearchSearchField: string;

    FOnKeyDown: TKeyEvent;
    FOnFontChangeNotify: TNotifyEvent;

    FDescOrder: Boolean;

    FSaveFilter: Boolean;
    FExternallyFiltered: Boolean;

    FDBNav: TUniDBNavigator;
    FAutoUpdate: Boolean;
    FAfterSortChange: TNotifyEvent;
    FAfterFilterChange: TNotifyEvent;
    FDefaultSearchField: String;

    FOnAfterSelectAll: TNotifyEvent;
    FOnAfterUnSelectAll: TNotifyEvent;
    FOnAfterToggleSelection: TNotifyEvent;
    FOnTitleButtonClick: TNotifyEvent;

//    FOnCalcTitleImage: TwwCalcTitleImageEvent;
    FUP_ImageIndex,
    FDOWN_ImageIndex: Integer;

    FExterOnMouseUp: TMouseEvent;
    FColumnOnMouseUp: Integer;

    FDisableWWFilter: Boolean;
    FComponentParentFont: Boolean;

    FHPick: TIQWebHpick;
    FHPickBtn: TUniSpeedButton;
    FHPickNotifyEvent: THPickNotifyEvent;
    FSortColumnsList: TStringList;
    FOnAssignOriginToOrderBy: TAssignOriginToOrderBy;

    FAppliedDPI: Integer;
    FRegistryPathExtension: string;

    FSubqueryBatch: Integer;
    FHPickSubqueryHdr_ID: Integer;
    FSubqueryModuleName: string;
    FSubqueryFieldName: string;

//    FCalcCellColorsEvent: TCalcCellColorsEvent;
    FOpenAfterSortChange: Boolean;

    function GeTUniDBNavigator: TUniDBNavigator;

    function GetDBNavVisible: Boolean;
    procedure SetDBNavVisible( AValue: Boolean );

    function GetDBNavWidth: Integer;
    procedure SetDBNavWidth( AValue: Integer );

    procedure SearchPanelResize( Sender : TUniControl; x,y :integer);
    procedure SearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SearchPerformCustomSearch(Sender: TObject; LookupTable: TDataSet;
      SearchField, SearchValue: string; PerformLookup: Boolean;
      var Found: Boolean);

    function GetDataSet:TDataSet;
    function GetSearchPanel:TUniPanel;
    procedure UnSelectAllClick(Sender: TObject);
    procedure SelectAllClick(Sender: TObject);
    procedure ToggleSelectClick(Sender: TObject);
    procedure RemoveFilterClick( Sender : TObject);
    procedure FilterClick( Sender : TObject);
    procedure ToggleUDRecView( Sender : TObject);

    function IsEmpty( ADataSet: TDataSet ):Boolean;
    procedure AssignFieldsToMenu;
    procedure AssignPopupMenuItems(ExistingItem, NewItem, AParent:TUniMenuItem);

    procedure DoPopupMenuItemClick(Sender: TObject);
    procedure DoExporTUniMenuItemClicked(Sender: TObject);
    procedure DoCopyToClipBoard(Sender: TObject);

    function CheckOriginAssigned( AField: TField ): Boolean;

    function GetSearchField: string;
    procedure SetSearchField( AValue: string );

//    function GetwwDBGrid: TwwDBGrid;

    function GetOptions:TUniDBGridOptions;
    procedure SetOptions( AValue: TUniDBGridOptions );

    function GetDataSource:TDataSource;
    procedure SetDataSource( AValue:TDataSource );

//    function GetOnCalcCellColors: TCalcCellColorsEvent;
//    procedure SetOnCalcCellColors( AValue: TCalcCellColorsEvent );

    function GetOnDblClick: TNotifyEvent;
    procedure SetOnDblClick( AValue: TNotifyEvent);

    function GetOnMouseDown: TMouseEvent;
    procedure SetOnMouseDown( AValue: TMouseEvent );

    function GetOnDragOver: TDragOverEvent;
    procedure SetOnDragOver( AValue: TDragOverEvent );

    function GetOnDragDrop: TDragDropEvent;
    procedure SetOnDragDrop( AValue: TDragDropEvent );

    procedure DoOnAfterOpen( DataSet: TDataSet );
//    procedure DoOnBeforeClose( DataSet: TDataSet );
    procedure ReplaceOnBeforeAfterOpenClose;
    procedure RestoreOnBeforeAfterOpenClose;

    procedure DoOnCalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
//    procedure DoOnCalcTitleImage( Sender: TObject; Field: TField; var TitleImageAttributes: TwwTitleImageAttributes );
    procedure DoOnTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure DoOnCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);

    procedure DoOnInternalMenuPopup(Sender: TObject);
    procedure DoGridOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure DoOnFontChange( Sender: TObject );

    function GetwwSelected: TStrings;
    procedure SetwwSelected( AValue: TStrings );

    procedure UpdatePanelsWidth;
    procedure AssignFilterSelectedFields;

    function GetShowFilter: Boolean;
    procedure SetShowFilter( AValue: Boolean );

    procedure CheckFieldsReplaceDivisionCaption;
    function GetUserBtn1Glyph: TBitMap;
    function GetUserBtn1OnClick: TNotifyEvent;
    procedure SetUserBtn1OnClick(const Value: TNotifyEvent);
    procedure SetUserBtn1Glyph(const Value: TBitMap);
    function GetShowRecordView: Boolean;
    procedure SetShowRecordView(const Value: Boolean);
    function GetSortDirection: TSortDirection;
    procedure SetSortDirection(const Value: TSortDirection);
    function GetFixedCols: Integer;
//    function GetMemoAttributes: TwwMemoAttributes;
    function GetRowHeightPercent: Integer;
    function GetTitleAlignment: TAlignment;
    function GetTitleLines: Integer;
    procedure SetFixedCols(const Value: Integer);
//    procedure SetMemoAttributes(const Value: TwwMemoAttributes);
    procedure SetRowHeightPercent(const Value: Integer);
    procedure SetTitleAlignment(const Value: TAlignment);
    procedure SetTitleLines(const Value: Integer);
    function GeTUniImageList: TUniImageList;
    procedure SeTUniImageList(const Value: TUniImageList);
    function GetUserBtn1Hint: String;
    procedure SetUserBtn1Hint(const Value: String);
    procedure WriteSearchFieldToRegistry;
    function GetOnEndDrag: TEndDragEvent;
    procedure SetOnEndDrag(const Value: TEndDragEvent);
    function GetOnMouseMove: TMouseMoveEvent;
    function GetOnMouseUp: TMouseEvent;
    procedure SetOnMouseMove(const Value: TMouseMoveEvent);
    procedure SetOnMouseUp(const Value: TMouseEvent);
    function GetUseTFields: Boolean;
    procedure SetUseTFields(const Value: Boolean);

    procedure ChangeSortField(const AFieldName: String); overload;
    procedure ChangeSortField(const AField: TField); overload;
    procedure ChangeSortField( AFieldsList: TList); overload;

    procedure SetTitleImageList(const Value: TUniImageList);
    procedure CombineImageList;
    procedure DBNavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    function ValidDataSetType(const ADataSet: TDataSet): Boolean;
    procedure CheckValidDataSetType(const ADataSet: TDataSet);

    procedure UpdateOrderBy(AQuery: TIQWebDbxQuery); overload;
    procedure UpdateOrderBy(AQuery: TSQLQuery); overload;
    procedure UpdateOrderBy(AQuery: TFDQuery); overload;

    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure UpdateFilterOnStatusBar;

    procedure InternalOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    function GetControlType: TStrings;
    procedure SetControlType(Value: TStrings);
    function GetComponentParentFont: Boolean;
    procedure SetComponentParentFont(const Value: Boolean);
    function GetTopToolPanel: TUniPanel;
    procedure ExecPickListClick(Sender: TObject);
    procedure SetHPick(const Value: TIQWebHpick);
    procedure SortCriteriaClick(Sender: TObject);
    procedure sbtnSubqueryClick(Sender: TObject);
    procedure AppendSQLStatementOrderBy(SQL: TStrings);
    procedure ReadSearchFieldFromRegistry;
//    procedure InitWWFilterDialog(Dialog: TwwFilterDlg);
    function AdjustDPI(const APixels: Integer): Integer;
    procedure InitWindowsDPI;
    function GetDefaultDrawing: Boolean;
    procedure SetDefaultDrawing(const Value: Boolean);
    function GetOnDrawDataCell: TDrawDataCellEvent;
    procedure SetOnDrawDataCell(const Value: TDrawDataCellEvent);
    function GetSubqueryBatch: Integer;
    procedure SetSubqueryBatch(const Value: Integer);
    procedure SetPickSubqueryHdr_ID(const Value: Integer);
    procedure SetSubqueryModuleName(const Value: string);
    procedure DeleteSubqueryResults;
    procedure BuildSubqueryFilter;
    function GetIsUsingSubquery: Boolean;
    procedure UpdateSubqueryButtonImage;
    procedure AddSubqueryToSQL(SQL: TStrings);
    procedure CheckUpdateSubQueryButton(AShowWarning: Boolean = True);

    property SortColumnsList: TStringList read FSortColumnsList write FSortColumnsList;

    procedure DoOnColumnMoved(Sender: TObject; FromIndex,  ToIndex: Integer);
    procedure DoOnColWidthChanged(Sender: TObject;  Column: Integer);

    procedure ReadGridOnly;
    procedure WriteGridOnly;

  protected
    { Protected declarations }
    FTimeIt: TIQWebTimeIt; // IQMS.WebVcl.Time.pas
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    procedure AssignSearchField( AField: TField ); overload;
    procedure AssignSearchFieldEx( AFieldName: String; ADescending: Boolean; AUpdateImmediate: Boolean );
    procedure AssignSearchField; overload;
    property SearchPanel:TUniPanel read GetSearchPanel;
    property DataSet:TDataSet read GetDataSet;
    property DBNav  : TUniDBNavigator read GeTUniDBNavigator;
//    property wwDBGrid: TwwDBGrid read FwwGrid write FwwGrid;
//    property wwIncSearch: TwwIncrementalSearch read FwwIncSearch;
    property UserBtn1: TUniSpeedButton read FUserBtn1;
//    property wwFilterDialog: TwwFilterDialog read FwwFilterDialog write FwwFilterDialog;
    property DisableWWFilter: Boolean read FDisableWWFilter write FDisableWWFilter;
    property RegistryPathExtension: string read FRegistryPathExtension write FRegistryPathExtension;
    property SubqueryBatch: Integer read GetSubqueryBatch write SetSubqueryBatch;   // used in conjuction with HPick to track scope
    property HPickSubqueryHdr_ID: Integer read FHPickSubqueryHdr_ID write SetPickSubqueryHdr_ID;
    property IsUsingSubquery: Boolean read GetIsUsingSubquery;

    constructor Create(AOwner:TComponent);override;
    destructor Destroy; override;
    procedure Popup( X, Y: Integer );
    function FindMenuItem(AMenuItem: TUniMenuItem): TUniMenuItem;
    function FindSubMenuItem(AMenuItem, AParent:TUniMenuItem): TUniMenuItem;
    procedure PropagateSecurityToMenuItems( const AMenuItemArray: array of TUniMenuItem; SR: TIQWebSecurityRegister );
    procedure PropagateSecurityOfPopupMenu(AMenu: TUniPopupMenu;  SR: TIQWebSecurityRegister);

    procedure MenuEnabled(AMenuItem: TUniMenuItem; AEnabled: Boolean);
    procedure MenuVisible(AMenuItem: TUniMenuItem; AVisible: Boolean);
    procedure MenusEnabled(const AMenuItem: array of TUniMenuItem; AEnabled: Boolean);
    procedure MenusVisible(const AMenuItem: array of TUniMenuItem; AVisible: Boolean);
    procedure MenuCaption(AMenuItem: TUniMenuItem; ACaption: string);
    procedure MenuChecked(AMenuItem: TUniMenuItem; AChecked: Boolean);
    procedure MenuDefault(AMenuItem: TUniMenuItem; ADefault: Boolean);

    procedure RemoveFilter;
    procedure ClearWWFilter;
    procedure StoreWWFilter;
    procedure RestoreWWFilter;
    procedure ClearWWFilterDisable;
    procedure RestoreWWFilterEnable;

    procedure ReadGrid;
    procedure ReadGrid2;
    procedure WriteGrid;

    procedure AssignSelectedFromDataSet;
    procedure ApplySelected;

    procedure AddRefreshButton;
    property TopToolPanel: TUniPanel read GetTopToolPanel;
    property OpenAfterSortChange: Boolean read FOpenAfterSortChange write FOpenAfterSortChange;
  published
    { Published declarations }

    property SaveFilter: Boolean read FSaveFilter write FSaveFilter;
    property SearchField: string read GetSearchField write SetSearchField;
    property SortDirection: TSortDirection read GetSortDirection write SetSortDirection;
    property ShowFilter: Boolean read GetShowFilter write SetShowFilter;
    property ShowRecordView: Boolean read GetShowRecordView write SetShowRecordView;
    property UserBtn1Glyph: TBitMap read GetUserBtn1Glyph write SetUserBtn1Glyph;
    property UserBtn1OnClick: TNotifyEvent read GetUserBtn1OnClick write SetUserBtn1OnClick;
    property UserBtn1Hint: String read GetUserBtn1Hint write SetUserBtn1Hint;
    property DefaultSearchField: String read FDefaultSearchField write FDefaultSearchField;
    property SubqueryModuleName: string read FSubqueryModuleName write SetSubqueryModuleName;
    property SubqueryFieldName: string read FSubqueryFieldName write FSubqueryFieldName;

    {Main component common properties}
    property Align;
    property BevelInner;
    property BevelOuter;
    property BevelWidth;
    property BorderWidth;
//    property BorderStyle;
    property Enabled;
    property ComponentParentFont: Boolean read GetComponentParentFont write SetComponentParentFont;

    property DefaultDrawing: Boolean read GetDefaultDrawing write SetDefaultDrawing;
    property RowHeightPercent: Integer read GetRowHeightPercent write SetRowHeightPercent;
    property FixedCols: Integer read GetFixedCols write SetFixedCols;
    property TitleAlignment: TAlignment read GetTitleAlignment write SetTitleAlignment;
    property TitleLines: Integer read GetTitleLines write SetTitleLines;
//    property MemoAttributes: TwwMemoAttributes read GetMemoAttributes write SetMemoAttributes;
    property ImageList: TUniImageList read GeTUniImageList write SeTUniImageList;
    property TitleImageList: TUniImageList read FUserTitleImageList write SetTitleImageList;

    property DBNavVisible: Boolean read GetDBNavVisible write SetDBNavVisible;
    property DBNavWidth  : Integer read GetDBNavWidth write SetDBNavWidth;

    property Font;
    property TabOrder;
    property TabStop;
    property Tag;
    property Visible;
    property OnResize;

    {DBGrid}
    property UseTFields: Boolean read GetUseTFields write SetUseTFields default False;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Selected: TStrings read GetwwSelected write SetwwSelected;
    property Options: TUniDBGridOptions read GetOptions write SetOptions;
    property OnDragOver: TDragOverEvent read GetOnDragOver write SetOnDragOver;
    property OnDragDrop: TDragDropEvent read GetOnDragDrop write SetOnDragDrop;
    property OnEndDrag: TEndDragEvent read GetOnEndDrag write SetOnEndDrag;
    property OnMouseDown: TMouseEvent read GetOnMouseDown write SetOnMouseDown;
    property OnMouseMove: TMouseMoveEvent read GetOnMouseMove write SetOnMouseMove;
    property OnMouseUp: TMouseEvent read GetOnMouseUp write SetOnMouseUp;
    property OnDrawDataCell: TDrawDataCellEvent read GetOnDrawDataCell
      write SetOnDrawDataCell;
//    property OnCalcCellColors: TCalcCellColorsEvent read GetOnCalcCellColors write SetOnCalcCellColors;
//    property OnCalcTitleImage: TwwCalcTitleImageEvent read FOnCalcTitleImage write FOnCalcTitleImage;
    property OnDblClick: TNotifyEvent read GetOnDblClick write SetOnDblClick;
    property OnAfterSelectAll: TNotifyEvent read FOnAfterSelectAll write FOnAfterSelectAll;
    property OnAfterUnSelectAll: TNotifyEvent read FOnAfterUnSelectAll write FOnAfterUnSelectAll;
    property OnAfterToggleSelection: TNotifyEvent read FOnAfterToggleSelection write FOnAfterToggleSelection;
    property OnTitleButtonClick: TNotifyEvent read FOnTitleButtonClick write FOnTitleButtonClick;
    property OnKeyDown: TKeyEvent read FOnKeyDown write FOnKeyDown;

    property AfterSortChange: TNotifyEvent read FAfterSortChange write FAfterSortChange;
    property AfterFilterChange: TNotifyEvent read FAfterFilterChange write FAfterFilterChange;

    property ControlType: TStrings read GetControlType write SetControlType;

    property OnAssignOriginToOrderBy: TAssignOriginToOrderBy read FOnAssignOriginToOrderBy write FOnAssignOriginToOrderBy;

    {Popup Menu}
    property PopupMenu: TUniPopupMenu read FExterPopMenu write FExterPopMenu;

    {HPick}
    property HPick: TIQWebHpick read FHPick write SetHPick;
    property OnHPickBtnClick: THPickNotifyEvent read FHPickNotifyEvent write FHPickNotifyEvent;

  end;

implementation

{$R *.dfm}


uses
  Math,
//  Debug_SQL,
//  hpick_subquery,
  IQMS.Common.Controls,
//  IQExportDBGrid,
//  IQMesg,
//  IQNumber,
//  IQRegFrm,
//  IQScreen,
//  PanelMsg,
//  QryInfo,
//  SortFields,
//  vcl_share,
//  Sys_Share,
  IQMS.Common.StringUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Sequence,
  IQMS.Web.MicrosoftExcel.Utils,
  IQMS.WebVcl.ResourceStrings;


const
     cnstSpeedBtnPanel = 64;
     cnstSpeedBtnWidth = 20;
     cnstSpeedBtnHeight = 20;

     HPICK_SUBQUERY_FROM_START  = '/* HPICK_SUBQUERY_FROM_START */';
     HPICK_SUBQUERY_FROM_END    = '/* HPICK_SUBQUERY_FROM_END */';
     HPICK_SUBQUERY_WHERE_START = '/* HPICK_SUBQUERY_WHERE_START */';
     HPICK_SUBQUERY_WHERE_END   = '/* HPICK_SUBQUERY_WHERE_END */';

//type
//  TLocalIQSearchWWdbGrid = class(TwwDBGrid)
//  public
//    procedure RefreshBookmarkList; override;
//  end;

{TMyWWdbGrid}
//procedure TLocalIQSearchWWdbGrid.RefreshBookmarkList;
//begin
//  inherited RefreshBookmarkList;
//end;


procedure DebugComponentState(AComponentState: TComponentState);
var
  S: string;
begin
  S:= '';
  if csLoading in AComponentState then S:= S + 'csLoading'#13;
  if csReading in AComponentState then S:= S + 'csReading'#13;
  if csWriting in AComponentState then S:= S + 'csWriting'#13;
  if csDestroying in AComponentState then S:= S + 'csDestroying'#13;
  if csDesigning  in AComponentState then S:= S + 'csDesigning'#13;
  if csAncestor  in AComponentState then S:= S + 'csAncestor'#13;
  if csUpdating  in AComponentState then S:= S + 'csUpdating'#13;
  if csFixups  in AComponentState then S:= S + 'csFixups'#13;
  if csFreeNotification  in AComponentState then S:= S + 'csFreeNotification'#13;
  if csInline  in AComponentState then S:= S + 'csInline'#13;
  if csDesignInstance  in AComponentState then S:= S + 'csDesignInstance'#13;
  ShowMessage( S );
end;

{ TIQWebSearch }

constructor TIQWebSearch.Create(AOwner:TComponent);
var
  Image: TBitmap;
begin
  inherited Create(AOwner);

  Width     := 320;
  Height    := 120;
  BevelOuter:= bvNone;
  ComponentParentFont:= TRUE;
  Caption := '';

  FOnFontChangeNotify:= Font.OnChange;
  Font.OnChange      := DoOnFontChange;
  FwwGridSelected := TStringList.Create;
  wwDBGridControlType := TStringList.Create;

  FOpenAfterSortChange := True;
  FExterAfterOpen  :=  NIL;
//  FExterBeforeClose:=  NIL;

//  FOnCalcTitleImage := NIL;
  FUserTitleImageList := NIL;

  FDescOrder:= FALSE;
  FAutoUpdate := TRUE; // default
  FSaveFilter := TRUE;

  SortColumnsList:= TStringList.Create;
  FTimeIt := TIQWebTimeIt.Create;

  // 04/07/2014
  InitWindowsDPI;

  FStatusBar1 := TUniStatusBar.Create(self);
  with FStatusBar1 do
  begin
    Parent    := self;
    with Panels.Add do
     begin
       Width:=FStatusBar1.Width;
     end;
  end;

  {Main Search Panel}
  FSearchPanel:= TUniPanel.Create(self);
  with FSearchPanel do
  begin
    Parent    := self;
    Align     := alTop;
    BevelOuter:= bvNone;
    BevelInner:= bvNone;
    BorderStyle := ubsNone;
    Name      := 'SearchPanel';
    Caption   := '';
    Height    := 26;
    ShowHint  := TRUE;
    ParentFont:= TRUE;
    OnResize  := SearchPanelResize;
    TabStop   := FALSE;
    Tag       := 1999;
    ParentBackGround:= FALSE;
  end;

  {DBNavigator}
  FDBNav:= TUniDBNavigator.Create(self);
  with FDBNav do
  begin
    Parent := FSearchPanel;
    Align     := alRight;
    VisibleButtons:= [nbFirst, nbPrior, nbNext, nbLast];
//    Flat   := TRUE;
    Width  := 104;
  end;

  {Sort Columns, UDView, Filter panel}
  FFilterBtnPanel:= TUniPanel.Create(self);
  with FFilterBtnPanel do
  begin
    Parent    := FSearchPanel;
    Align     := alRight;
    BevelOuter:= bvNone;
    Name      := 'FilterPanel';
    Caption   := '';
    Width     := cnstSpeedBtnWidth * 4 + 1; // 81: sort, ud view, filter x 2
    TabStop   := FALSE;
    Visible   := TRUE;
  end;

  FRemoveFilterBtn:= TUniSpeedButton.Create(self);
  with FRemoveFilterBtn do
  begin
    Parent := FFilterBtnPanel;
    Name   := 'RemoveFilterBtn';
    Width  := cnstSpeedBtnWidth;  // 20
    Height := cnstSpeedBtnHeight;
    Top    := 3;
//    Flat   := TRUE;
    Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000377; // 'Remove Filter'
    AlignWithMargins:= TRUE;
    Margins.Top     := 3;
    Margins.Bottom  := 0;
    Margins.Left    := 0;
    Margins.Right   := 0;
    OnClick:= RemoveFilterClick;
    Glyph.LoadFromResourceName( HInstance, 'CLRFLTR' );
//    NumGlyphs := 2;
  end;

  FFilterBtn:= TUniSpeedButton.Create(self);
  with FFilterBtn do
  begin
    Parent := FFilterBtnPanel;
    Name   := 'FilterBtn';
    Width  := cnstSpeedBtnWidth;  // 20
    Height := cnstSpeedBtnHeight;
    Top    := 3;
//    Flat   := TRUE;
    Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000169; // 'Filter dataset'
    AlignWithMargins:= TRUE;
    Margins.Top     := 3;
    Margins.Bottom  := 0;
    Margins.Left    := 0;
    Margins.Right   := 0;
    OnClick:= FilterClick;
    Glyph.LoadFromResourceName( HInstance, 'FILTER' );
  end;

  FUDRecView:= TUniSpeedButton.Create(self);
  with FUDRecView do
  begin
    Parent := FFilterBtnPanel;
    Name   := 'UDRecView';
    Width  := cnstSpeedBtnWidth; // 20
    Height := cnstSpeedBtnHeight;
    Top    :=  3;
//    Flat   := TRUE;
    Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000168; // 'Show/hide user defined record view'
    AlignWithMargins:= TRUE;
    Margins.Top     := 3;
    Margins.Bottom  := 0;
    Margins.Left    := 0;
    Margins.Right   := 0;
    OnClick:= ToggleUDRecView;
    Glyph.LoadFromResourceName( HInstance, 'UDRECV' );
  end;


  FSortColumnsBtn:= TUniSpeedButton.Create(self);
  with FSortColumnsBtn do
  begin
    Parent := FFilterBtnPanel;
    Name   := 'SortColumns';
    Width  := cnstSpeedBtnWidth; // 20
    Height := cnstSpeedBtnHeight;
    Top    :=  3;
//    Flat   := TRUE;
    Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000410; // 'Sort Criteria'
    AlignWithMargins:= TRUE;
    Margins.Top     := 3;
    Margins.Bottom  := 0;
    Margins.Left    := 0;
    Margins.Right   := 0;
    OnClick:= SortCriteriaClick;
    Glyph.LoadFromResourceName( HInstance, 'SORT' );
  end;


  FSubQueryBtn:= TUniSpeedButton.Create(self);
  with FSubQueryBtn do
  begin
    Parent := FFilterBtnPanel;
    Name   := 'sbtnSubquery';
    Width  := cnstSpeedBtnWidth; // 20
    Height := cnstSpeedBtnHeight;
    Top    :=  3;
//    Flat   := TRUE;
    Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000495; // 'Component Where Used Search/Filter';
    AlignWithMargins:= TRUE;
    Margins.Top     := 3;
    Margins.Bottom  := 0;
    Margins.Left    := 0;
    Margins.Right   := 0;
    OnClick:= sbtnSubqueryClick;
    Glyph.LoadFromResourceName( HInstance, 'SUBFILTER1' );
//    NumGlyphs:= 1;
  end;


  {FwwFilterDialog}
//  FwwFilterDialog:= TwwFilterDialog.Create(self);
//  with FwwFilterDialog do
//  begin
//    Name             := 'FilterDialog';
//    DefaultMatchType := fdMatchAny;
//    FieldsFetchMethod:= fmUseTFields;
//    Options          := [ fdShowCaseSensitive,fdShowOKCancel,fdShowViewSummary,fdShowValueRangeTab,fdShowNonMatching,fdSizeable ];
//    OnInitDialog     := InitWWFilterDialog;
//  end;

  {Select/Unselect Toggle Speed Vcl.Buttons Panel}
  FSpeedBtnPanel:= TUniPanel.Create(self);
  with FSpeedBtnPanel do
  begin
    Parent    := FSearchPanel;
    Align     := alRight;
    BevelOuter:= bvNone;
    Name      := 'SpeedBtnPanel';
    Caption   := '';
    Width     := cnstSpeedBtnPanel;
    TabStop   := FALSE;
  end;

  {Speed Buttons}
  FToggleBtn:= TUniSpeedButton.Create(self);
  with FToggleBtn do
  begin
    Parent := FSpeedBtnPanel;
    Name   := 'IQMS.WebVcl.ToggleButton';
    Width  := 21;
    Height := 20;
    Top    :=  3;
    Left   :=  0;
//    Flat   := TRUE;
    Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000170; // 'Toggle selected'
    OnClick:= ToggleSelectClick;
    Glyph.LoadFromResourceName(HInstance, '70SELT');
  end;

  FSelectAllBtn:= TUniSpeedButton.Create(self);
  with FSelectAllBtn do
  begin
    Parent := FSpeedBtnPanel;
    Name   := 'SelectAllBtn';
    Width  := 21;
    Height := 20;
    Top    :=  3;
    Left   := Width;
//    Flat   := TRUE;
    Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000171; // 'Select all'
    OnClick:= SelectAllClick;
    Glyph.LoadFromResourceName(HInstance, '70SELA');
  end;

  FUnSelectAllBtn:= TUniSpeedButton.Create(self);
  with FUnSelectAllBtn do
  begin
    Parent := FSpeedBtnPanel;
    Name   := 'UnSelectAllBtn';
    Width  := 21;
    Height := 20;
    Top    :=  3;
    Left   := Width * 2;
//    Flat   := TRUE;
    Hint   := 'UnSelect All';
    OnClick:= UnSelectAllClick;
    Glyph.LoadFromResourceName(HInstance, '70SELX');
  end;

  {User Speed Button Panel}
  FUserBtn1Panel:= TUniPanel.Create(self);
  with FUserBtn1Panel do
  begin
    Parent    := FSearchPanel;
    Align     := alRight;
    BevelOuter:= bvNone;
    Name      := 'UserBtn1Pane';
    Caption   := '';
    Width     := cnstSpeedBtnWidth + 2;
    TabStop   := FALSE;
    Visible   := FALSE;
  end;

  FUserBtn1:= TUniSpeedButton.Create(self);
  with FUserBtn1 do
  begin
    Parent := FUserBtn1Panel;
    Name   := 'UserBtn1';
     Width  := cnstSpeedBtnWidth;
     Height := cnstSpeedBtnWidth;
     Top    := 0;
     Left   := 0;
//    Flat   := TRUE;
    ShowHint := TRUE;
  end;

  {Search Control Panel}
  FSearchCtrlPanel := TUniPanel.Create(Self);
  with FSearchCtrlPanel do
  begin
    Parent    := FSearchPanel;
    Align     := alClient;
    BevelOuter:= bvNone;
    Name      := 'SearchCtrlPanel';
    Caption   := '';
    Width     := 100;
    TabStop   := FALSE;
    Visible   := True;
  end;

  FSearchCtrlPanelLeft:= TUniPanel.Create(self);
  with FSearchCtrlPanelLeft do
  begin
    Parent    := FSearchCtrlPanel;
    Align     := alLeft;
    BevelOuter:= bvNone;
    Name      := 'SearchCtrlPanelLeft';
    Caption   := '';
    Width     := cnstSpeedBtnWidth + 5;
    TabStop   := FALSE;
    Visible   := FALSE;   // HPick button panel is only visible when the HPick object is hooked up
  end;

  FSearchCtrlPanelClient:= TUniPanel.Create(self);
  with FSearchCtrlPanelClient do
  begin
    Parent    := FSearchCtrlPanel;
    Align     := alClient;
    BevelOuter:= bvNone;
    Name      := 'SearchCtrlPanelClient';
    Caption   := '';
    TabStop   := FALSE;
    Visible   := True;
  end;

  FHPickBtn:= TUniSpeedButton.Create(self);
  with FHPickBtn do
  begin
    Parent := FSearchCtrlPanelLeft;
    Name   := 'HPickBtn';
    Width  := cnstSpeedBtnWidth;
    Height := cnstSpeedBtnWidth;
    Top    := 0;
    Left   := 0;
//    Flat   := TRUE;
    ShowHint:= TRUE;
    // IQMS.WebVcl.ResourceStrings.cTXT0000104 = 'Select from Pick List';
    Hint   := IQMS.WebVcl.ResourceStrings.cTXT0000104;
    OnClick:= ExecPickListClick;
    Glyph.LoadFromResourceName(HInstance, 'HPICK');
  end;

  {Incremental Search}
//  FwwIncSearch:= TwwIncrementalSearch.Create(self);
//  with FwwIncSearch do
//  begin
//    Parent    := FSearchCtrlPanelClient;
//    Name      := 'SearchEdit';
//    Left      := 3;
//    Top       := 3;
//    Anchors:= [akTop, akLeft, akRight];
//    Text      := '';
//    Width     := Parent.Width - 5;
//    ParentFont:= TRUE;
//    OnKeyDown := SearchKeyDown;
//    OnPerformCustomSearch := SearchPerformCustomSearch;
//    TabOrder  := 0;
//    TabStop   := TRUE;
//  end;

  {PopupMenu}
  FInterPopMenu:= TUniPopupMenu.Create( self );
  with FInterPopMenu do
  begin
    OnPopup:= DoOnInternalMenuPopup;
  end;

  {Image list with up/down arrows for dbgrid sorting column}
  FOriginalTitleImageList:= TUniImageList.Create(self);
  with FOriginalTitleImageList do
  begin
    Parent:= self.Parent;
    Image := TBitmap.Create;
    try
      Image.LoadFromResourceName(HInstance, 'UP');
      Height:= Image.Height;
      Width := Image.Width;
      AddMasked( Image, clFuchsia );
      Image.LoadFromResourceName(HInstance, 'DOWN');
      AddMasked( Image, clFuchsia );
    finally
      Image.Free;
    end;
  end;

  {Image list for subquery speedbutton}
  FSubQueryImageList:= TUniImageList.Create(self);
  with FSubQueryImageList do
  begin
    Parent:= self.Parent;
    Image := TBitmap.Create;
    try
      Image.LoadFromResourceName(HInstance, 'SUBFILTER1');
      Height:= Image.Height;
      Width := Image.Width;
      AddMasked( Image, clFuchsia );
      Image.LoadFromResourceName(HInstance, 'SUBFILTER2');
      AddMasked( Image, clFuchsia );
    finally
      Image.Free;
    end;
  end;


  {Image list with up/down arrows for dbgrid sorting column}
  FTitleImageList:= TUniImageList.Create(self);
  with FTitleImageList do
    Parent:= self.Parent;
  CombineImageList;

  {wwDBGrid}
//  FwwGrid:= TwwDBGrid.Create(self);
//  with FwwGrid do
//  begin
//    Parent               := self;
//    Name                 := 'IQSearchGrid';
//    Align                := alClient;
//    self.Options         := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit ];
//    DefaultDrawing       := TRUE;
//    MultiSelectOptions   := [ msoAutoUnselect, msoShiftSelect ];
//    MemoAttributes       := MemoAttributes + [ mGridShow ]; // mGridShow in wwMemo
//    PopupMenu            := FInterPopMenu;
//    ParentFont           := True;
//    UseTFields           := False;
//    OnKeyDown            := DoGridOnKeyDown;
//    OnCalcTitleAttributes:= DoOnCalcTitleAttributes;
//    OnCalcTitleImage     := DoOnCalcTitleImage;
//    OnTitleButtonClick   := DoOnTitleButtonClick;
//    OnCalcCellColors     := DoOnCalcCellColors;
//    TitleImageList       := FTitleImageList;
//    OnMouseUp            := InternalOnMouseUp;
//    TabStop              := TRUE;
//    TitleButtons         := TRUE;
//    OnColumnMoved        := DoOnColumnMoved;
//    OnColWidthChanged    := DoOnColWidthChanged;
//  end;

  {UDRecViewPanel}
  FUDRecViewPanel:= TUniPanel.Create(self);
  with FUDRecViewPanel do
  begin
    Parent    := self;
    Align     := alRight;
    BevelOuter:= bvNone;
    BevelInner:= bvNone;
    Name      := 'UDRecViewPanel';
    Caption   := '';
    TabStop   := TRUE;
    Visible   := FALSE;
    Width     := 120;
    if (csDesigning in ComponentState) then
       Width:= 0;
  end;

  FSplitter:= TUniSplitter.Create(self);
  with FSplitter do
  begin
    Parent    := self;
    Align     := alRight;
    Visible   := FALSE;
    if (csDesigning in ComponentState) then
       Width:= 0;
  end;

  {UD Rec View component}
  FIQUDRecView:= TIQWebUDRecView.Create( self );
//  with FIQUDRecView do
//  begin
//    Parent    := FUDRecViewPanel;
//    Align     := alClient;
//    Name      := 'IQUDRecView1';
//    wwDBGrid  := FwwGrid;
//    CloseBtnVisible := FALSE;
//  end;
end;

destructor TIQWebSearch.Destroy;
begin
  if Assigned(DataSet) and DataSet.Active then
    WriteGrid;

  WriteSearchFieldToRegistry;
  FwwGridSelected.Free;
  wwDBGridControlType.Free;


  if not (csDesigning in ComponentState) then
  begin
//    if Assigned(FUDRecViewPanel) then
//       IQRegIntegerScalarWrite( self, 'IQSearch_UDRecViewWidth', FUDRecViewPanel.Width );
//    if Assigned( FIQUDRecView ) then
//       IQRegIntegerScalarWrite( self, 'IQSearch_UDRecView_CaptionWidth', FIQUDRecView.DataInspector.CaptionWidth );
//    if Assigned(FUDRecViewPanel) then
//       IQRegBooleanScalarWrite( self, 'IQSearch_UDRecView_Visible',  FUDRecViewPanel.Visible );
  end;

  if Assigned( DataSet ) then
  begin
     DataSet.AfterOpen  := FExterAfterOpen;
//     DataSet.BeforeClose:= FExterBeforeClose;
  end;

  SortColumnsList.Free;

  if Assigned(FTimeIt) then
    FreeAndNil(FTimeIt);

  DeleteSubqueryResults;

  inherited Destroy;
end;


procedure TIQWebSearch.DeleteSubqueryResults;
begin
  if FSubqueryBatch > 0 then
  try
    HPickSubqueryHdr_ID:= 0;
  except
    {intentional suppress}
  end;
end;

procedure TIQWebSearch.Loaded;
var
  AWidth: Integer;
  AFlag : Boolean;
begin
  inherited Loaded;

//  FwwIncSearch.Ctl3D:= FALSE;

  FUserBtn1Panel.Visible:= not UserBtn1Glyph.Empty;

  ReplaceOnBeforeAfterOpenClose;

  DoOnFontChange( NIL );
  if ComponentParentFont then   // 08-29-2012 tired of fighting the parentfont property
     self.ParentFont:= TRUE;

//  if FwwIncSearch.SearchField = '' then
//     DoOnAfterOpen( DataSet );

  AssignFilterSelectedFields;

  {Do we have an external to component filter assigned such as eplant filter}
  FExternallyFiltered:= Assigned(DataSource) and Assigned(DataSource.DataSet) and DataSource.DataSet.Filtered;

  if not (csDesigning in ComponentState) then
  begin
//     if IQRegIntegerScalarRead( self, 'IQSearch_UDRecViewWidth', AWidth ) then
//        FUDRecViewPanel.Width:= AWidth;
//
//     if IQRegIntegerScalarRead( self, 'IQSearch_UDRecView_CaptionWidth', AWidth ) then
//        FIQUDRecView.DataInspector.CaptionWidth:= AWidth;
//
//     if IQRegBooleanScalarRead( self, 'IQSearch_UDRecView_Visible',  AFlag ) and AFlag then {click it!}
//     begin
//        FUDRecView.Perform(WM_LBUTTONDOWN, 0, 0);
//        FUDRecView.Perform(WM_LBUTTONUP,   0, 0);
//     end;

    ReadGridOnly;

    CheckUpdateSubQueryButton;
  end;
end;

procedure TIQWebSearch.CheckUpdateSubQueryButton(AShowWarning: Boolean = True);
var
  APriorVisible: Boolean;
begin
  APriorVisible := FSubQueryBtn.Visible;
  FSubQueryBtn.Visible:= IsUsingSubquery;
  if FSubQueryBtn.Visible then
  begin
//    if (SubqueryFieldName = '') and AShowWarning then
//       IQWarning('Note to programmer: ''SubqueryFieldName'' must be assigned.'#13+
//                 'This field is used to join gtt_picklist_subquery and the main picklist query.'#13#13+
//                 'SubqueryFieldName example: ''arinvt.id''.'#13+
//                 'The system will then generate '' and arinvt.id = gtt_picklist_subquery.id''');
    UpdateSubqueryButtonImage;
  end;

  // Update the panel for display, if the button visibility changed.
  if APriorVisible <> FSubQueryBtn.Visible then
    UpdatePanelsWidth;
end;


procedure TIQWebSearch.InitWindowsDPI;
var
  ADPI: Integer;
begin
  FAppliedDPI := 96;
  with TIQWebRegistry.Create do
  try
    RootKey:= HKEY_CURRENT_USER;
    if not (OpenKey( '\Control Panel\Desktop\WindowMetrics', FALSE ) and
      ValueExists( 'AppliedDPI' )) then
      EXIT;
    FAppliedDPI := ReadInteger( 'AppliedDPI' );
  finally
    Free;
  end;
end;

function TIQWebSearch.AdjustDPI(const APixels: Integer): Integer;
begin
  if FAppliedDPI <> 96 then
    Result:= (APixels * FAppliedDPI) div 96
  else
    Result := APixels;
end;

procedure TIQWebSearch.ReplaceOnBeforeAfterOpenClose;
begin
  if Assigned(DataSet) and (ComponentState = []) then // not (csDesigning in ComponentState) then
  begin
     FExterAfterOpen    := DataSet.AfterOpen;
//     FExterBeforeClose  := DataSet.BeforeClose;
     DataSet.AfterOpen  := DoOnAfterOpen;
//     DataSet.BeforeClose:= DoOnBeforeClose;

  end;
end;

procedure TIQWebSearch.RestoreOnBeforeAfterOpenClose;
begin
  if Assigned(DataSet) and (ComponentState = []) then // not (csDesigning in ComponentState) then
  begin
     DataSet.AfterOpen  := FExterAfterOpen  ;
//     DataSet.BeforeClose:= FExterBeforeClose;
  end;
end;

procedure TIQWebSearch.AssignFilterSelectedFields;
var
  I: Integer;
begin
//  if Assigned(FwwFilterDialog) then
//    begin
//      FwwFilterDialog.SelectedFields.Clear;
//      if Assigned(DataSet) then
//        for I:= 0 to DataSet.FieldCount - 1 do with DataSet.Fields[ I ] do
//          if Visible and (Trim(DisplayLabel) > '') then
//             FwwFilterDialog.SelectedFields.Add( FieldName ) ;
//    end;
end;

procedure TIQWebSearch.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent is TUniPopupMenu) and (PopupMenu = AComponent) then
     PopupMenu := NIL;
end;

procedure TIQWebSearch.Popup( X, Y: Integer );
begin
  FInterPopMenu.Popup( X, Y );
end;

//function TIQWebSearch.GetwwDBGrid: TwwDBGrid;
//begin
//  Result:= FwwGrid;
//end;

procedure TIQWebSearch.UpdatePanelsWidth;
var
  L, BtnSize: Integer;

  procedure _EnforceBtnSize(ABtn: TUniSpeedButton);
  begin
    ABtn.Height := BtnSize;
    ABtn.Width := BtnSize;
    ABtn.Top := 0;
  end;

begin
  // Resize the navigator bar
//  IQMS.Common.Controls.ResizeNavBar( DBNav, AdjustDPI(DBNav.Height));

  // Get the button size on the navigator
  BtnSize := DBNav.Height;

  // Ensure all speed Vcl.Buttons have the same size
  _EnforceBtnSize(FRemoveFilterBtn);
  _EnforceBtnSize(FFilterBtn);
  _EnforceBtnSize(FUDRecView);
  _EnforceBtnSize(FSortColumnsBtn);
  _EnforceBtnSize(FToggleBtn);
  _EnforceBtnSize(FSelectAllBtn);
  _EnforceBtnSize(FUnSelectAllBtn);
  _EnforceBtnSize(FUserBtn1);
  _EnforceBtnSize(FHPickBtn);
  _EnforceBtnSize(FSubQueryBtn);

  // Count visible Vcl.Buttons
  L := 0;
  if FRemoveFilterBtn.Visible then Inc(L);
  if FFilterBtn.Visible then Inc(L);
  if FUDRecView.Visible then Inc(L);
  if FSortColumnsBtn.Visible then Inc(L);
  if FSubQueryBtn.Visible then Inc(L);

  // Set the button panel width based on visible Vcl.Buttons
  if L > 0 then
    begin
      FFilterBtnPanel.Width:= BtnSize * L + 1;
      // Arrange the speedbuttons from the left
//      IQMS.Common.Controls.AlignControlsFromLeftB(0,0,0,
//      [FSubQueryBtn, FSortColumnsBtn,FUDRecView,FFilterBtn,FRemoveFilterBtn]);
    end
  else
    FFilterBtnPanel.Visible := False;

  // Set the search panel height.  This is the toolbar that
  // holds the search box, Vcl.Buttons, etc.
//  FSearchPanel.Height:= Max(AdjustDPI(FwwIncSearch.Height) + 6, BtnSize);

  // Position the User-Button panel.  At this point, there is only
  // one user button.
  if FUserBtn1Panel.Visible then
     begin
       FUserBtn1Panel.Left:= FSearchPanel.Width;
       FUserBtn1Panel.Width := FUserBtn1.Width;
     end;

  // Position the Multi-Select Vcl.Buttons
//  if dgMultiSelect in FwwGrid.Options then
//    begin
//      FSpeedBtnPanel.Width:= BtnSize * 3 + 1;
//      // Arrange the speedbuttons from the left
////      IQMS.Common.Controls.AlignControlsFromLeftB(0,0,0, [FToggleBtn,FSelectAllBtn,FUnSelectAllBtn]);
//      FSpeedBtnPanel.Left:= FSearchPanel.Width;
//    end;

  if FSearchCtrlPanelLeft.Visible then
    begin
      FHPickBtn.Left := 0;
      FHPickBtn.Top := 0;
      FSearchCtrlPanelLeft.Width := BtnSize + 2;
    end;

  FFilterBtnPanel.Left:= FSearchPanel.Width;

  if DBNavVisible then
     DBNav.Left:= FSearchPanel.Width;

  // Just make sure FSearchCtrlPanel is on far left along with the
  // its child FwwIncSearch aligned alLeft & alRight
  FSearchCtrlPanel.Left:= 0;
  FSearchCtrlPanel.Update;
end;

function TIQWebSearch.GeTUniDBNavigator: TUniDBNavigator;
begin
  Result:= FDBNav;
end;

function TIQWebSearch.GetDBNavVisible: Boolean;
begin
  Result:= DBNav.Visible;
end;

procedure TIQWebSearch.SetDBNavVisible( AValue: Boolean );
begin
  if DBNav.Visible <> AValue then
  begin
    DBNav.Visible:= AValue;
    UpdatePanelsWidth;
 end;
end;

function TIQWebSearch.GetDBNavWidth: Integer;
begin
  Result:= DBNav.Width;
end;

procedure TIQWebSearch.SetDBNavWidth( AValue: Integer );
begin
  // Do nothing.  This should not be set by the calling form.
  // The navigator width is set programmatically in
  // UpdatePanelsWidth to ensure all Vcl.Buttons are the same size.
end;

function TIQWebSearch.GetDefaultDrawing: Boolean;
begin
  Result := FwwGridDefaultDrawing;
end;

procedure TIQWebSearch.SetDefaultDrawing(const Value: Boolean);
begin
  FwwGridDefaultDrawing := Value;
end;

procedure TIQWebSearch.DoOnInternalMenuPopup(Sender: TObject);
var
  I: Integer;
  N: Integer;
begin
  if Assigned( PopupMenu ) then
     N:= PopupMenu.Items.Count
  else
    N:= 0;

  if FInterPopMenu.Items.Count <= N then
  begin
     if Assigned(PopupMenu) then
        FInterPopMenu.Images:= PopupMenu.Images;
     AssignFieldsToMenu;
  end;

//  for I:= N to FInterPopMenu.Items.Count - 1 do
//    if FInterPopMenu.Items[ I ].Tag > 0 then
//       if CompareText( TField( Pointer( FInterPopMenu.Items[ I ].Tag )).FieldName, FwwIncSearch.SearchField ) = 0 then
//       begin
//         FInterPopMenu.Items[ I ].Checked:= TRUE;
//         BREAK;
//       end;

  if Assigned( PopupMenu ) and Assigned( PopupMenu.OnPopUp ) then
     PopupMenu.OnPopUp( Sender );
end;

procedure TIQWebSearch.DoPopupMenuItemClick(Sender: TObject);
var
  AField: TField;
begin
  FDescOrder:= FALSE;
  AField:= TField(Pointer((Sender as TUniMenuItem).Tag));
  ChangeSortField(AField);
end;

procedure TIQWebSearch.DoOnTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  if Assigned(FOnTitleButtonClick) then
  begin
     FOnTitleButtonClick( self );
  end;
  ChangeSortField(AFieldName);
end;

procedure TIQWebSearch.AssignSearchField( AField: TField );
begin
  if not Assigned( DataSource ) then EXIT;

  if (csDesigning in ComponentState) then
     EXIT;

  SortColumnsList.Clear;
  SortColumnsList.Add( AField.FieldName );

  AssignSearchField;
end;


procedure TIQWebSearch.AssignSearchField;
//var
//  hMsg: TUniPanelMesg;
//
//  function _IsSomeOriginAssigned: Boolean;
//  var
//    I: Integer;
//  begin
//    for I:= 0 to SortColumnsList.Count - 1 do
//      if DataSet.FieldByName(SortColumnsList[ I ]).Visible and
//        (DataSet.FieldByName(SortColumnsList[ I ]).Origin > '') then
//        EXIT (True);
//    Result:= FALSE;
//  end;
//
//  function _FirstAssignedOriginField: string;
//  var
//    I:Integer;
//  begin
//    for I:= 0 to SortColumnsList.Count - 1 do
//      if DataSet.FieldByName(SortColumnsList[ I ]).Visible and
//        (DataSet.FieldByName(SortColumnsList[ I ]).Origin > '') then
//        EXIT (SortColumnsList[ I ]);
//    Result:= '';
//  end;

begin
//  // This is the main AssignSearchField that other two overloaded are calling
//
//  if not Assigned( DataSource ) then EXIT;
//
//  if (csDesigning in ComponentState) then
//     EXIT;
//
//  if _IsSomeOriginAssigned() then
//  begin
//    hMsg:= hPleaseWait( IQMS.WebVcl.ResourceStrings.cTXT0000172 {'Sorting Dataset ...'} );
//    try
//
//      // update order by
//      if DataSet is TIQWebDbxQuery then
//         UpdateOrderBy(TIQWebDbxQuery(DataSet))
//      else if DataSet is TSQLQuery then
//         UpdateOrderBy(TSQLQuery(DataSet))
//      else if DataSet is TFDQuery then
//         UpdateOrderBy(TFDQuery(DataSet));
//
//      {Assign new search field}
//      FwwIncSearch.SearchField:= _FirstAssignedOriginField();
//
//      WriteSearchFieldToRegistry;
//
//      if Assigned(FAfterSortChange) then
//         FAfterSortChange(Self);
//    finally
//      hMsg.Free;
//    end;
//  end;
end;


procedure TIQWebSearch.UpdateOrderBy(AQuery: TIQWebDbxQuery);
var
  I: Integer;
  AAfterOpen: TDataSetNotifyEvent;
  ABeforeClose: TDataSetNotifyEvent;
  AState: TDataSetState;
  AParams: TParams;
begin
  Screen.Cursor := crSQLWait;
  try
    with AQuery do { Sort Query }
      try
        AAfterOpen := AfterOpen;
        ABeforeClose := BeforeClose;

        AfterOpen := NIL;
        BeforeClose := NIL;

        AState := State;

        try
          AParams := TParams.Create;
          // Save params to temporary TFDParams object
          for I := 0 to Params.Count - 1 do
            with AParams.AddParameter do
              begin
                DataType := Params[I].DataType;
                Name := Params[I].Name;
                ParamType := Params[I].ParamType;
              end;

          Close;

          if not (csDesigning in ComponentState) then
            AppendSQLStatementOrderBy(SQL);

          // Restore params
          for I := 0 to Params.Count - 1 do
            with Params[I] do
              DataType := AParams[I].DataType;

        finally
          if Assigned(AParams) then
            FreeAndNil(AParams);
        end;
      finally
        // 02/22/2006 Byron.  Added FAutoUpdate; Default is TRUE.
        if (AState <> dsInactive) and FAutoUpdate then
          Open;

        CheckFieldsReplaceDivisionCaption;

        AfterOpen := AAfterOpen;
        BeforeClose := ABeforeClose;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIQWebSearch.UpdateOrderBy(AQuery: TSQLQuery );
var
  I: Integer;
  AAfterOpen: TDataSetNotifyEvent;
  ABeforeClose: TDataSetNotifyEvent;
  AState: TDataSetState;
  AParams: TParams;
begin
  Screen.Cursor := crSQLWait;
  try
    with AQuery do { Sort Query }
      try
        AAfterOpen := AfterOpen;
        ABeforeClose := BeforeClose;

        AfterOpen := NIL;
        BeforeClose := NIL;

        AState := State;

        try
          AParams := TParams.Create;
          // Save params to temporary TFDParams object
          for I := 0 to Params.Count - 1 do
            with AParams.AddParameter do
              begin
                DataType := Params[I].DataType;
                Name := Params[I].Name;
                ParamType := Params[I].ParamType;
              end;

          Close;

          if not (csDesigning in ComponentState) then
            AppendSQLStatementOrderBy(SQL);

          // Restore params
          for I := 0 to Params.Count - 1 do
            with Params[I] do
              DataType := AParams[I].DataType;

        finally
          if Assigned(AParams) then
            FreeAndNil(AParams);
        end;
      finally
        // 02/22/2006 Byron.  Added FAutoUpdate; Default is TRUE.
        if (AState <> dsInactive) and FAutoUpdate then
          Open;

        CheckFieldsReplaceDivisionCaption;

        AfterOpen := AAfterOpen;
        BeforeClose := ABeforeClose;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIQWebSearch.UpdateOrderBy(AQuery: TFDQuery);
var
  I: Integer;
  AAfterOpen: TDataSetNotifyEvent;
  ABeforeClose: TDataSetNotifyEvent;
  AState: TDataSetState;
  AParams: TFDParams;
begin
  Screen.Cursor := crSQLWait;
  try
    with AQuery do { Sort Query }
      try
        AAfterOpen := AfterOpen;
        ABeforeClose := BeforeClose;

        AfterOpen := NIL;
        BeforeClose := NIL;

        AState := State;

        try
          AParams := TFDParams.Create;
          // Save params to temporary TFDParams object
          for I := 0 to Params.Count - 1 do
            with AParams.Add do
              begin
                DataType := Params[I].DataType;
                Name := Params[I].Name;
                ParamType := Params[I].ParamType;
              end;

          Close;

          if not (csDesigning in ComponentState) then
            AppendSQLStatementOrderBy(SQL);

          // Restore params
          for I := 0 to Params.Count - 1 do
            with Params[I] do
              DataType := AParams[I].DataType;

        finally
          if Assigned(AParams) then
            FreeAndNil(AParams);
        end;
      finally
        // 02/22/2006 Byron.  Added FAutoUpdate; Default is TRUE.
        if (AState <> dsInactive) and FAutoUpdate and FOpenAfterSortChange then
          Open;

        CheckFieldsReplaceDivisionCaption;

        AfterOpen := AAfterOpen;
        BeforeClose := ABeforeClose;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TIQWebSearch.AppendSQLStatementOrderBy( SQL: TStrings );
var
  I: Integer;
  S: string;
  AField: TField;
  AOrigin: string;
begin
  if IsUsingSubquery then
     AddSubqueryToSQL( SQL );

  // copy SQL up to but not including the ORDER BY
  I:= Pos( 'ORDER BY ', UpperCase( SQL.Text ));
  if I > 0 then
    SQL.Text:= Copy( SQL.Text, 1, I-1);

  // add ORDER BY
  S:= '';
  for I:= 0 to SortColumnsList.Count - 1 do
    if DataSet.FieldByName(SortColumnsList[ I ]).Origin > '' then
    begin
       AOrigin:= Trim(DataSet.FieldByName( SortColumnsList[ I ]).Origin);

       if Assigned( FOnAssignOriginToOrderBy ) then
          FOnAssignOriginToOrderBy( self, DataSet.FieldByName( SortColumnsList[ I ]), AOrigin );

       S := AddToStringWithDelimiter( S, AOrigin, ', ' );
    end;

  if S > '' then
     SQL.Add( 'ORDER BY ' + S );

  if (SortColumnsList.Count <= 1) and FDescOrder then
     SQL.Add('desc');
end;


procedure TIQWebSearch.ApplySelected;
begin
//  FwwGrid.ApplySelected;
end;

function TIQWebSearch.CheckOriginAssigned( AField: TField ): Boolean;
begin
  // by default, return True result
  Result := True;

  try
    // IQMS.WebVcl.Search datasets must be of type, TFDQuery
    // 01/08/2009 Added this method; exception is raised if invalid.
    CheckValidDataSetType(AField.DataSet);

    // This is the purpose of this method:  determine of the Origin property
    // has been assigned.  If not, then return False as the result.
    if (Trim(AField.Origin) = '') and
       not (csDesigning in ComponentState) then
       Result := False;

  except
    // Return False, since we hit an exception
    Result := False;

    // If the field has a DisplayLabel, then inform user which field
    // has the problem.
//    if (Trim(AField.DisplayLabel) > '') then
//      // 'Sorting is not available on column, %s.'
//      IQWarning( Format( IQMS.WebVcl.ResourceStrings.cTXT0000173, [AField.DisplayLabel]));
  end;
end;

procedure TIQWebSearch.AssignFieldsToMenu;
var
  I      : Integer;
  NewItem: TUniMenuItem;
  ExportData: TUniMenuItem;
  CopyToClipBoard: TUniMenuItem;
  ExportXML: TUniMenuItem;
  ExportExcel: TUniMenuItem;
begin
  {Clear Internal menu}
  for I:= FInterPopMenu.Items.Count - 1 downto 0 do
    FInterPopMenu.Items[ I ].Delete( 0 );

  {Copy to Internal Menu}
  if Assigned( PopupMenu ) then
     for I:= 0 to PopUpMenu.Items.Count - 1 do
     begin
        NewItem:= TUniMenuItem.Create( FInterPopMenu );
        AssignPopupMenuItems(PopUpMenu.Items[ I ], NewItem, FInterPopMenu.Items);
     end;

  {Add Break}
  if FInterPopMenu.Items.Count > 0 then
  begin
     NewItem:= TUniMenuItem.Create( FInterPopMenu );
     NewItem.Caption:= '-';
     FInterPopMenu.Items.Add( NewItem );
  end;

  {Assign Fields to Internal Popup Menu}
  if Assigned( DataSource ) and Assigned( DataSource.DataSet ) then with DataSource.DataSet do
    //for I:= 0 to FwwGrid.FieldCount - 1 do
    //begin
    for I:= 0 to FieldCount - 1 do
    if Fields[ I ].Visible and (Trim(Fields[ I ].DisplayLabel) > '') and (Trim(Fields[ I ].Origin) > '' {04-06-2009 skip non sortable fields}) then
    begin
      NewItem:= TUniMenuItem.Create( FInterPopMenu );
      with NewItem do
      begin
        Caption   := StrTran( StrTran( Fields[ I ].DisplayLabel, '~', ' '), '  ', ' ');
        RadioItem := TRUE;
        Checked   := FALSE;
        OnClick   := DoPopupMenuItemClick;
        GroupIndex:= 1;
        Tag       := LongInt( {FwwGrid.}Fields[ I ]);
      end;
      FInterPopMenu.Items.Add( NewItem );
    end;

  {Break}
  NewItem:= TUniMenuItem.Create( FInterPopMenu );
  NewItem.Caption:= '-';
  FInterPopMenu.Items.Add( NewItem );

//
//  {Prepare export XML and Excel menu items}
//  // IQMS.WebVcl.ResourceStrings.cTXT0000559 = 'XML Format';
//  ExportXML  := Vcl.Menus.NewItem(IQMS.WebVcl.ResourceStrings.cTXT0000559,   0, False, True, DoExporTUniMenuItemClicked, 0, 'XMLFormat1');
//
//  // IQMS.WebVcl.ResourceStrings.cTXT0000560 = 'Excel Format';
//  ExportExcel:= Vcl.Menus.NewItem(IQMS.WebVcl.ResourceStrings.cTXT0000560, 0, False, True, DoExporTUniMenuItemClicked, 0, 'ExcelFormat1');
//
//  {Create and add the submenu}
//  // IQMS.WebVcl.ResourceStrings.cTXT0000561 = 'Export Data';
//  ExportData:= NewSubMenu(IQMS.WebVcl.ResourceStrings.cTXT0000561, 0, 'ExportData1', [ ExportXML, ExportExcel ]);
//  FInterPopMenu.Items.Add( ExportData );
//
//  // Set visible only if Excel is installed
//  ExportExcel.Visible := IQMS.Web.MicrosoftExcel.Utils.IsMicrosoftExcelInstalled;
//
//  {Break}
//  NewItem:= TUniMenuItem.Create( FInterPopMenu );
//  NewItem.Caption:= '-';
//  FInterPopMenu.Items.Add( NewItem );
//
//  {Copy to Clipboard}
//  // IQMS.WebVcl.ResourceStrings.cTXT0000562 = 'Copy Cell to Clipboard';
//  CopyToClipBoard:= Vcl.Menus.NewItem(IQMS.WebVcl.ResourceStrings.cTXT0000562, 0, False, True, DoCopyToClipBoard, 0, 'CopyToClipBoard1');
//  FInterPopMenu.Items.Add( CopyToClipBoard );
end;

procedure TIQWebSearch.AssignPopupMenuItems(ExistingItem, NewItem, AParent:TUniMenuItem);
var
  I:Integer;
  AItem:TUniMenuItem;
begin
  with NewItem do
  begin
    Name      := ExistingItem.Name; // 02/23/2006 Byron
    Caption   := ExistingItem.Caption;
    RadioItem := ExistingItem.RadioItem;
    Checked   := ExistingItem.Checked;
    OnClick   := ExistingItem.OnClick;
    GroupIndex:= ExistingItem.GroupIndex;
    Tag       := ExistingItem.Tag;
    AutoCheck := ExistingItem.AutoCheck;
    Visible   := ExistingItem.Visible;
    ImageIndex:= ExistingItem.ImageIndex;
  end;
  AParent.Add( NewItem );
  if ExistingItem.Count <> 0 then
     for I:= 0 to ExistingItem.Count - 1 do
     begin
        AItem := TUniMenuItem.Create( NewItem );
        AssignPopupMenuItems(ExistingItem.Items[ I ], AItem, NewItem);
     end;
end;

procedure TIQWebSearch.DoOnCalcTitleAttributes(Sender: TObject; AFieldName: String; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
//  if AFieldName = FwwIncSearch.SearchField then
//     begin
//       //ABrush.Color:= clBlue;
//       AFont.Color:= clNavy;  // White;
//       AFont.Style:= AFont.Style + [ fsBold ];
//     end
//  else
     begin
       //ABrush.Color:= clBtnFace;
       AFont.Color:= clBlack;
       AFont.Style:= AFont.Style - [ fsBold ];
     end
end;

//procedure TIQWebSearch.DoOnCalcTitleImage( Sender: TObject; Field: TField;
// var TitleImageAttributes: TwwTitleImageAttributes );
//var
//  ASearchField: TField;
//begin
//  with DataSet do
////   if Assigned(DataSet) and Assigned(FindField( FwwIncSearch.SearchField )) and
////      (FieldByName(FwwIncSearch.SearchField) = Field) then
////      TitleImageAttributes.ImageIndex:= IfThen(FDescOrder, FUP_ImageIndex, FDOWN_ImageIndex )
////   else
//      TitleImageAttributes.ImageIndex:= -1;
//
//  // 02/23/2009 Added this event property.  Must call this event after
//  // executing the default image calculation for the component.
//  if Assigned(FOnCalcTitleImage) then
//     FOnCalcTitleImage(Sender, Field, TitleImageAttributes);
//end;

procedure TIQWebSearch.ChangeSortField(const AField: TField);
begin
  // check dataset assigned
  if not Assigned(DataSet) then
     Exit;

  // check field assigned
  if not Assigned(AField) then
     Exit;

  // New sort order
//  if AField.FieldName = FwwIncSearch.SearchField then
//     FDescOrder:= not FDescOrder
//  else
//     FDescOrder:= FALSE;

  // Save setting changes
  // 04/03/2014 This is required or when you click the
  // field to sort, the columns which change order.
  // WriteGridOnly;

  // Assign the new search field
  AssignSearchField( AField );

  // Apply setting changes
  // ReadGridOnly;

  RestoreWWFilter;
end;

procedure TIQWebSearch.ChangeSortField(const AFieldName: String);
var
  AField: TField;
begin
  // check dataset assigned
  if not Assigned(DataSet) then
     Exit;

  // Get the field, if it exists; if not, AField will be NULL.
  AField := DataSet.FindField(AFieldName);

  // Check field exists in dataset
  if (AField = NIL) then
     // 'Sorting is not available on field %s'
     raise Exception.CreateFmt(IQMS.WebVcl.ResourceStrings.cTXT0000346, [AFieldName]);

  // Hand off control to overload method above
  ChangeSortField(AField);
end;


procedure TIQWebSearch.ChangeSortField( AFieldsList: TList );
var
  I: Integer;
begin
  // check dataset assigned
  if not Assigned(DataSet) then
     Exit;

  // verify fields have origin assigned
  for I:= AFieldsList.Count - 1 downto 0 do
      if TField(AFieldsList[ I ]).Origin = '' then
         AFieldsList.Delete( I );

  if AFieldsList.Count = 0 then
     EXIT;

  // assign our list of order by columns
  SortColumnsList.Clear;
  for I:= 0 to AFieldsList.Count - 1 do
      SortColumnsList.Add( TField(AFieldsList[ I ]).FieldName );

  // Save setting changes
// Mar 20 2014 if DataSet.State <> dsInactive then
// Mar 20 2014 IQRegFormWrite(Self, [FwwGrid]);

  // Assign the new search field
  AssignSearchField;  // based on SortColumnsList

  // Apply setting changes
// Mar 20 2014 IQRegFormRead(Self, [FwwGrid]);

  RestoreWWFilter;
end;


procedure TIQWebSearch.SearchPanelResize( Sender : TUniControl; x,y :integer);
begin
  UpdatePanelsWidth;
end;

procedure TIQWebSearch.DoOnFontChange( Sender: TObject );
begin
  //FSearchPanel.Height:= AdjustDPI(FwwIncSearch.Height) + 6;
//  FSearchPanel.Height:= Max(AdjustDPI(FwwIncSearch.Height) + 6, DBNav.Height);
  if Assigned( FOnFontChangeNotify) then
     FOnFontChangeNotify( Sender );
end;

procedure TIQWebSearch.SearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  if Key in [ VK_DOWN, VK_UP, VK_PRIOR, VK_NEXT, VK_RETURN ] then
//     FwwGrid.SetFocus
end;

procedure TIQWebSearch.SearchPerformCustomSearch(Sender: TObject; LookupTable: TDataSet;
  SearchField, SearchValue: string; PerformLookup: Boolean;
  var Found: Boolean);
var
  AField: TField;
  ACaseSensitive: Boolean;
  AIntegerValue: Integer;
  ARealValue: Integer;
begin
//  ACaseSensitive := TwwIncrementalSearch(Sender).CaseSensitivity = wwcsCaseSensitive;
  AField := LookupTable.FindField(SearchField);
  if AField <> nil then
    try
      if (AField is TFMTBCDField) or (AField is TBcdField) then
        begin
//          if (Pos('.', SearchValue) > 0) or (Pos(',', SearchValue) > 0) or
//            not iqnumber.IsStringValidInteger(SearchValue, AIntegerValue) then
//            Exit;
        end;
      if ACaseSensitive then
        Found := LookupTable.Locate(SearchField, SearchValue,
          [loPartialKey])
      else
        Found := LookupTable.Locate(SearchField, SearchValue,
          [loPartialKey, loCaseInsensitive])
    except
      Beep;
    end;
end;

procedure TIQWebSearch.DoGridOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  if ( dgMultiSelect in FwwGrid.Options ) and not (dgEditing in FwwGrid.Options) and (Key = VK_SPACE) then
//     ToggleSelectClick(Sender)
//  else if (Key = VK_F1) then
//     begin
//       if (wwDBGrid.DataSource.DataSet is TIQWebDbxQuery) then
//          ShowQueryInfo(Key, Shift, TIQWebDbxQuery(wwDBGrid.DataSource.DataSet), FTimeIt) // QryInfo.pas
//       else if (wwDBGrid.DataSource.DataSet is TSQLQuery) then
//          ShowQueryInfo(Key, Shift, TSQLQuery(wwDBGrid.DataSource.DataSet), FTimeIt) // QryInfo.pas
//       else if (wwDBGrid.DataSource.DataSet is TFDQuery) then
//          ShowQueryInfo(Key, Shift, TFDQuery(wwDBGrid.DataSource.DataSet), FTimeIt) // QryInfo.pas
//     end
//  else
//     Debug_SQL.CheckShowDebugSQL(Self, Key, Shift);

  if Assigned(FOnKeyDown) then
     FOnKeyDown( Sender, Key, Shift );
end;

function TIQWebSearch.GetDataSet:TDataSet;
begin
//  if Assigned(FwwGrid) and Assigned(FwwGrid.DataSource) and
//    Assigned(FwwGrid.DataSource.DataSet) then
//    Result:= FwwGrid.DataSource.DataSet
//  else
    Result:= NIL;
end;

function TIQWebSearch.IsEmpty( ADataSet: TDataSet ):Boolean;
begin
  Result:= not Assigned(ADataSet) or (ADataSet.Eof and ADataSet.Bof);
end;

procedure TIQWebSearch.UnSelectAllClick(Sender: TObject);
begin
//  if Assigned(FwwGrid.DataSource) then
//     FwwGrid.UnSelectAll;
//  if Assigned(FOnAfterUnSelectAll) then
//  begin
//     TLocalIQSearchWWdbGrid(FwwGrid).RefreshBookmarkList;   {09-06-2006 workaround for records not showing up marked as Selected when queried IsSelected}
//     FOnAfterUnSelectAll( self );
//  end;
end;

procedure TIQWebSearch.SelectAllClick(Sender: TObject);
begin
//  if Assigned(FwwGrid.DataSource) then
//     FwwGrid.SelectAll;
//
//  if Assigned(FOnAfterSelectAll) then
//  begin
//     TLocalIQSearchWWdbGrid(FwwGrid).RefreshBookmarkList;   {09-06-2006 workaround for records not showing up marked as Selected when queried IsSelected}
//     FOnAfterSelectAll( self );
//  end;
end;

procedure TIQWebSearch.ToggleSelectClick(Sender: TObject);
begin
//  if Assigned(FwwGrid.DataSource) then with FwwGrid do
//  begin
//    if IsSelected then
//       UnSelectRecord
//    else
//       SelectRecord;

//    if Assigned(FOnAfterToggleSelection) then
//     begin
//        FOnAfterToggleSelection( self );
//     end;
//  end;

end;

function TIQWebSearch.GetDataSource:TDataSource;
begin
  Result:= FwwGridDataSource// as TDataSource;
end;

procedure TIQWebSearch.SetDataSource( AValue: TDataSource );
begin
//  if FwwGrid.DataSource <> AValue then
//  begin
//     RestoreOnBeforeAfterOpenClose;
//
//     FExterAfterOpen  := NIL;
////     FExterBeforeClose:= NIL;
//
//     FwwGrid.DataSource        := AValue;
//     FwwIncSearch.DataSource   := AValue;
//     FDBNav.DataSource         := AValue;
//     FwwFilterDialog.DataSource:= AValue;
//
//     ReplaceOnBeforeAfterOpenClose;
//  end;
end;

function TIQWebSearch.GetSearchField: string;
begin
  Result:= FwwIncSearchSearchField;
end;

procedure TIQWebSearch.SetSearchField( AValue: string );
begin
  if (AValue <> SearchField) and  Assigned(DataSet) and Assigned( DataSet.FindField( AValue )) then
     AssignSearchField( DataSet.FieldByName( AValue ));
end;

procedure TIQWebSearch.DoOnAfterOpen( DataSet: TDataSet );
begin
//  if Assigned(FwwIncSearch) and (FwwIncSearch.SearchField = '') and
//    Assigned( DataSet ) and (DataSet.Fields.Count > 0) then
//  begin
////    IQRegBooleanScalarRead( self, 'DescOrder',  FDescOrder );
//
//    ReadSearchFieldFromRegistry;
//    // if IQRegStringScalarRead( self, 'IQSearchField', IQSearchField ) and (IQSearchField > '') and Assigned( DataSet.FindField( IQSearchField )) then
//    //    AssignSearchField( DataSet.FieldByName( IQSearchField ))
//    // else if (FDefaultSearchField > '') and Assigned( DataSet.FindField(FDefaultSearchField)) then
//    //    AssignSearchField( DataSet.FieldByName(FDefaultSearchField))
//    // else
//    //    AssignSearchField( DataSet.Fields[ 0 ]);
//  end;

  if Assigned( FExterAfterOpen ) and (@FExterAfterOpen <> @DataSet.AfterOpen) then
     FExterAfterOpen( DataSet );

  {Aug-07-03 - division vs warehouse}
  if not (csDesigning in ComponentState) then
     CheckFieldsReplaceDivisionCaption;

  if Assigned( DataSet ) then
  begin
// Mar 20 2014    IQRegFormRead( self, [ FwwGrid ]);
    //  SaveFilter is obsolete. We'll try to save the filter always SCR #1944 - Employee Picklist - IQMS.WebVcl.Search Remember Advanced Filter Mar 23 2011
    //    if SaveFilter then
    RestoreWWFilter;
  end;

  CheckUpdateSubQueryButton(False);

  if not (csDesigning in ComponentState) and FUDRecViewPanel.Visible then
     PostMessage( self.Handle, iq_Notify, 0, 0 );  // FIQUDRecView.LoadDataInspector;
end;

procedure TIQWebSearch.CheckFieldsReplaceDivisionCaption;
var
  I: Integer;
  AIsWhsDivision: Boolean;
begin
  if (csFreeNotification in ComponentState) or not Assigned( DataSet ) then
     EXIT;
//  AIsWhsDivision:= Is_Whs_Division;
//
//  for I:= 0 to DataSet.FieldCount - 1 do with DataSet.Fields[ I ] do
//  begin
//    // IQMS.WebVcl.ResourceStrings.cTXT0000553 = 'Division';
//    if Visible and ( Pos(IQMS.WebVcl.ResourceStrings.cTXT0000553, DisplayLabel ) > 0 ) and AIsWhsDivision then
//       DisplayLabel:= CheckReplaceDivisionCaption( DisplayLabel ); {Sys_share.pas}
//
//    if Visible and System.StrUtils.ContainsText( DisplayLabel, 'EMAIL' ) then
//       DisplayLabel:= Sys_Share.CheckReplaceEmailCaption( DisplayLabel );
//  end;
end;
{
procedure TIQWebSearch.DoOnBeforeClose( DataSet: TDataSet );
begin
  if Assigned( DataSet ) then
  begin
    IQRegFormWrite( self, [ FwwGrid ]);
    //if SaveFilter then
    //   IQRegFormWrite( self, [ FwwFilterDialog ]);
  end;

  WriteSearchFieldToRegistry;

  if Assigned( FExterBeforeClose ) and (@FExterBeforeClose <> @DataSet.BeforeClose) then
     FExterBeforeClose( DataSet );
end;
}
function TIQWebSearch.GetOnMouseDown: TMouseEvent;
begin
  Result:= FwwGridOnMouseDown;
end;

procedure TIQWebSearch.SetOnMouseDown( AValue: TMouseEvent );
begin
  FwwGridOnMouseDown:= AValue;
end;

function TIQWebSearch.GetOnDragOver: TDragOverEvent;
begin
  Result:= FwwGridOnDragOver;
end;

procedure TIQWebSearch.SetOnDragOver( AValue: TDragOverEvent );
begin
  FwwGridOnDragOver := AValue;
end;

function TIQWebSearch.GetOnDrawDataCell: TDrawDataCellEvent;
begin
  Result := FwwGridOnDrawDataCell;
end;

procedure TIQWebSearch.SetOnDrawDataCell(const Value: TDrawDataCellEvent);
begin
  FwwGridOnDrawDataCell := Value;
end;

function TIQWebSearch.GetOnDragDrop: TDragDropEvent;
begin
  Result:= FwwGridOnDragDrop;
end;

procedure TIQWebSearch.SetOnDragDrop( AValue: TDragDropEvent);
begin
  FwwGridOnDragDrop := AValue;
end;

function TIQWebSearch.GetOnEndDrag: TEndDragEvent;
begin
  Result:= FwwGridOnEndDrag;
end;

procedure TIQWebSearch.SetOnEndDrag(const Value: TEndDragEvent);
begin
  FwwGridOnEndDrag := Value;
end;

function TIQWebSearch.GetOnMouseMove: TMouseMoveEvent;
begin
  Result:= FwwGridOnMouseMove;
end;

procedure TIQWebSearch.SetOnMouseMove(const Value: TMouseMoveEvent);
begin
  FwwGridOnMouseMove := Value;
end;

function TIQWebSearch.GetOnMouseUp: TMouseEvent;
begin
  // Result:= FwwGrid.OnMouseUp;
  Result:= FExterOnMouseUp;
end;

procedure TIQWebSearch.SetOnMouseUp(const Value: TMouseEvent);
begin
  // FwwGrid.OnMouseUp := Value;
  FExterOnMouseUp:= Value;
end;

procedure TIQWebSearch.DoOnCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  // 12/04/2015 (Byron, EIQ-9727) If this grid is multi-select, we may
  // get here, where the row is "selected" (found by the TwwIncrementalSearch),
  // but does not display as highlighted.  If that is the case, then
  // apply highlighting to the active row.
//  if not Highlight and (dgMultiSelect in FwwGrid.Options) then
//    with (Sender as TwwDBGrid) do
//      if CalcCellRow = GetActiveRow then
//        begin
//          ABrush.Color:= clHighlight;
//          AFont.Color := clHighlightText;
//        end;

//   if Assigned(FCalcCellColorsEvent) then
//     FCalcCellColorsEvent(Sender, Field, State, Highlight, AFont, ABrush);
end;

procedure TIQWebSearch.InternalOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  FColumnOnMouseUp:= wwDBGrid.MouseCoord(X, Y).X;  // get column index

  if Assigned( FExterOnMouseUp ) then
     FExterOnMouseUp( Sender, Button, Shift, X, Y );
end;

//function TIQWebSearch.GetOnCalcCellColors: TCalcCellColorsEvent;
//begin
//  Result:= FCalcCellColorsEvent; // FwwGrid.OnCalcCellColors;
//end;

//procedure TIQWebSearch.SetOnCalcCellColors( AValue: TCalcCellColorsEvent );
//begin
//  FCalcCellColorsEvent := AValue; // FwwGrid.OnCalcCellColors:= AValue;
//end;

function TIQWebSearch.GetOnDblClick: TNotifyEvent;
begin
  Result:= FwwGridOnDblClick;
end;

procedure TIQWebSearch.SetOnDblClick( AValue: TNotifyEvent);
begin
  FwwGridOnDblClick := AValue;
end;

function TIQWebSearch.GetOptions: TUniDBGridOptions;
begin
  Result:= FwwGridOptions;
end;


procedure TIQWebSearch.SetOptions( AValue: TUniDBGridOptions );
begin
  FwwGridOptions:= AValue;
  FSpeedBtnPanel.Visible:= (uniGUITypes.dgMultiSelect in FwwGridOptions);
  SearchPanelResize( NIL,0,0 );
end;

function TIQWebSearch.GetwwSelected: TStrings;
begin
  Result:= FwwGridSelected;
end;

procedure TIQWebSearch.SetwwSelected( AValue: TStrings );
begin
  FwwGridSelected.Assign(AValue);
end;

procedure TIQWebSearch.FilterClick(Sender: TObject);
begin
  {Execute WWFilter}
  AssignFilterSelectedFields;
//  if not Assigned(FwwFilterDialog) then
//    Exit;
//
//  if not FwwFilterDialog.Execute then
//    Exit;

  {Save it}
//  if SaveFilter then
//  IQRegFormWrite( self, [ FwwFilterDialog ]);

  {When we cancel ww filter - eplant filter gets cancelled too - reinstate it here}
  if FExternallyFiltered and Assigned(DataSource) and Assigned(DataSource.DataSet) and not DataSource.DataSet.Filtered then
     DataSource.DataSet.Filtered:= TRUE;

  if Assigned(FAfterFilterChange) then
     FAfterFilterChange(Self);


//  if FwwFilterDialog.FieldInfo.Count > 0 then
//    FFilterBtn.Glyph.LoadFromResourceName( HInstance, 'FILTER2' )
//  else
//    FFilterBtn.Glyph.LoadFromResourceName( HInstance, 'FILTER' );

  UpdateFilterOnStatusBar;
end;

procedure TIQWebSearch.RemoveFilterClick(Sender: TObject);
begin
  {Execute WWFilter}
//  if not Assigned(FwwFilterDialog) then
//    Exit;
//
//  FwwFilterDialog.ClearFilter;
//  FwwFilterDialog.ApplyFilter;

//  IQRegFormWrite( self, [ FwwFilterDialog ]);

  {When we cancel ww filter - eplant filter gets cancelled too - reinstate it here}
  if FExternallyFiltered and Assigned(DataSource) and Assigned(DataSource.DataSet) and not DataSource.DataSet.Filtered then
     DataSource.DataSet.Filtered:= TRUE;

  if Assigned(FAfterFilterChange) then
     FAfterFilterChange(Self);

  FFilterBtn.Glyph.LoadFromResourceName( HInstance, 'FILTER' );
  UpdateFilterOnStatusBar;
end;


procedure TIQWebSearch.ToggleUDRecView(Sender: TObject);
begin
  FUDRecViewPanel.Visible:= not FUDRecViewPanel.Visible;
  FSplitter.Visible      := FUDRecViewPanel.Visible;
  FSplitter.Left         := 0;  {put it left off FUDRecViewPanel}

  if FUDRecViewPanel.Visible then
     FIQUDRecView.LoadDataInspector;
end;

function TIQWebSearch.GetShowFilter: Boolean;
begin
  Result:= FFilterBtn.Visible;
end;

procedure TIQWebSearch.SetShowFilter(AValue: Boolean);
begin
  FFilterBtn.Visible:= AValue;
  FRemoveFilterBtn.Visible:= AValue;
  UpdatePanelsWidth;
end;

function TIQWebSearch.GetUserBtn1Glyph: TBitMap;
begin
  Result:= FUserBtn1.Glyph;
end;

procedure TIQWebSearch.SetUserBtn1Glyph(const Value: TBitMap);
begin
  FUserBtn1.Glyph:= Value;
  FUserBtn1Panel.Visible:= not UserBtn1Glyph.Empty;
  UpdatePanelsWidth;
end;

function TIQWebSearch.GetUserBtn1OnClick: TNotifyEvent;
begin
  Result:= FUserBtn1.OnClick;
end;

procedure TIQWebSearch.SetUserBtn1OnClick(const Value: TNotifyEvent);
begin
  FUserBtn1.OnClick:= Value;
end;

function TIQWebSearch.GetShowRecordView: Boolean;
begin
  Result:= FUDRecView.Visible;
end;

procedure TIQWebSearch.SetShowRecordView(const Value: Boolean);
begin
  FUDRecView.Visible:= Value;
  UpdatePanelsWidth;
end;

function TIQWebSearch.GetSortDirection: TSortDirection;
begin
  if FDescOrder then
     Result := sdDescending
  else Result := sdAscending;
end;

procedure TIQWebSearch.SetSortDirection(const Value: TSortDirection);
begin
  FDescOrder := Value = sdDescending;
end;

procedure TIQWebSearch.AssignSearchFieldEx(AFieldName: String;
  ADescending: Boolean; AUpdateImmediate: Boolean);
var
  AField: TField;
begin
  AField := DataSet.FindField(AFieldName);
  if AField = NIL then Exit;

  try
     FAutoUpdate := AUpdateImmediate;

     if ADescending then SortDirection := sdDescending
     else SortDirection := sdAscending;

     if Assigned(DataSet) then
     begin
// Mar 20 2014        IQRegFormWrite( self, [ FwwGrid ]);
        AssignSearchField(AField);
// Mar 20 2014        IQRegFormRead( self, [ FwwGrid ]);
     end;

  finally
     FAutoUpdate := TRUE; // reset
  end;
end;

procedure TIQWebSearch.AssignSelectedFromDataSet;
begin
//  IQMS.Common.Controls.AssignSelectedFromDataSet(FwwGrid, DataSet);
end;

function TIQWebSearch.FindMenuItem(AMenuItem: TUniMenuItem): TUniMenuItem;
var
  AComponent: TComponent;
  I:Integer;
begin
  // This method searches the internal popup menu for a menu item by name.
  // If found, it returns the TUniMenuItem; otherwise, it returns NIL.

  Result := NIL; // initial
//  AComponent := FInterPopMenu.FindComponent(AMenuItem.Name);
//  if (AComponent <> NIL) and (AComponent is TUniMenuItem) then
//     Result := TUniMenuItem(AComponent);

  for I:= 0 to FInterPopMenu.Items.Count - 1 do
  begin
    Result := FindSubMenuItem(AMenuItem, FInterPopMenu.Items[I]);
    if Result <> nil then exit;
  end;
end;

procedure TIQWebSearch.PropagateSecurityToMenuItems( const AMenuItemArray: array of TUniMenuItem; SR: TIQWebSecurityRegister );
var
  I: Integer;
  AMenuItem: TUniMenuItem;
begin
  // propagate security settings in one swoop to passed menu items
  // Ex: IQSearch1.PropagateSecurityToMenuItems( SR, [ JumpToInv1, JumpToBOM1 ]);
  for I:= 0 to High( AMenuItemArray ) do
  begin
    // find internal, run time menu item
    AMenuItem:= FindMenuItem( AMenuItemArray[ I ] as TUniMenuItem ) ;
    if Assigned(AMenuItem) then
    begin
      AMenuItem.Enabled:= SR.Enabled[ (AMenuItemArray[ I ] as TUniMenuItem).Name ];
      AMenuItem.Visible:= SR.Visible[ (AMenuItemArray[ I ] as TUniMenuItem).Name ];
    end;
  end;
end;


procedure TIQWebSearch.PropagateSecurityOfPopupMenu( AMenu: TUniPopupMenu; SR: TIQWebSecurityRegister );
var
  // propagate security settings to passed popup menu
  // Ex: IQSearchWO.PropagateSecurityOfPopupMenu( popmWorkorder, SR );
  I: Integer;

  procedure PropagateSecurityOf( AExternalMenuItem: TUniMenuItem );
  var
    J: Integer;
    AInternalMenuItem: TUniMenuItem;
  begin
    AInternalMenuItem:= FindMenuItem( AExternalMenuItem ) ;
    if Assigned(AInternalMenuItem) then
    begin
      AInternalMenuItem.Enabled:= AExternalMenuItem.Enabled and SR.Enabled[ AExternalMenuItem.Name ];
      AInternalMenuItem.Visible:= AExternalMenuItem.Visible and SR.Visible[ AExternalMenuItem.Name ];
    end;

    for J:= 0 to AExternalMenuItem.Count - 1 do
      PropagateSecurityOf( AExternalMenuItem.Items[ J ]);
  end;

begin
  for I:= 0 to AMenu.Items.Count - 1 do
    PropagateSecurityOf( AMenu.Items[ I ] );
end;



function TIQWebSearch.FindSubMenuItem(AMenuItem, AParent:TUniMenuItem): TUniMenuItem;
var
  I:Integer;
begin
  Result := NIL; // initial
  if AParent.name = AMenuItem.name then
  begin
    Result := AParent;
    Exit;
  end;

  for I:= 0 to AParent.Count - 1 do
  begin
     Result := FindSubMenuItem(AMenuItem, AParent.Items[I]);
     if Result <> nil then exit;
  end;
end;


function TIQWebSearch.GetFixedCols: Integer;
begin
  Result := wwDBGridFixedCols;
end;

//function TIQWebSearch.GetMemoAttributes: TwwMemoAttributes;
//begin
//  Result := wwDBGridMemoAttributes;
//end;

function TIQWebSearch.GetRowHeightPercent: Integer;
begin
  Result := wwDBGridRowHeightPercent;
end;

function TIQWebSearch.GetTitleAlignment: TAlignment;
begin
  Result := wwDBGridTitleAlignment;
end;

function TIQWebSearch.GetTitleLines: Integer;
begin
  Result := wwDBGridTitleLines;
end;

function TIQWebSearch.GetTopToolPanel: TUniPanel;
begin
  Result:= FSearchPanel;
end;

procedure TIQWebSearch.SetFixedCols(const Value: Integer);
begin
  wwDBGridFixedCols := Value;
end;

procedure TIQWebSearch.SetHPick(const Value: TIQWebHpick);
begin
  FHPick := Value;
  FSearchCtrlPanelLeft.Visible:= Assigned(FHPick);
end;

//procedure TIQWebSearch.SetMemoAttributes(const Value: TwwMemoAttributes);
//begin
//  wwDBGridMemoAttributes := Value;
//end;

procedure TIQWebSearch.SetRowHeightPercent(const Value: Integer);
begin
  wwDBGridRowHeightPercent := Value;
end;

procedure TIQWebSearch.SetTitleAlignment(const Value: TAlignment);
begin
  wwDBGridTitleAlignment := Value;
end;

procedure TIQWebSearch.SetTitleLines(const Value: Integer);
begin
  wwDBGridTitleLines := Value;
end;

function TIQWebSearch.GeTUniImageList: TUniImageList;
begin
  Result := wwDBGridImageList;
end;

procedure TIQWebSearch.SeTUniImageList(const Value: TUniImageList);
begin
  wwDBGridImageList := Value;
end;

function TIQWebSearch.GetUserBtn1Hint: String;
begin
  Result := FUserBtn1.Hint;
end;

procedure TIQWebSearch.SetUserBtn1Hint(const Value: String);
begin
  FUserBtn1.Hint := Value;
  FUserBtn1.ShowHint := TRUE;
end;

procedure TIQWebSearch.StoreWWFilter;
begin
//  if Assigned(FwwFilterDialog) then
//    IQRegFormWrite( self, [ FwwFilterDialog ]);
end;


procedure TIQWebSearch.RestoreWWFilter;
begin
//  if FDisableWWFilter or not Assigned(FwwFilterDialog) then
//     EXIT;
//
////  IQRegFormRead( self, [ FwwFilterDialog ]);
//
//  if FwwFilterDialog.FieldInfo.Count > 0 then
//    FFilterBtn.Glyph.LoadFromResourceName( HInstance, 'FILTER2' )
//  else
//    FFilterBtn.Glyph.LoadFromResourceName( HInstance, 'FILTER' );
//
//  UpdateFilterOnStatusBar;
end;

procedure TIQWebSearch.ClearWWFilter;
begin
//  if FDisableWWFilter or not Assigned(FwwFilterDialog) then
//     EXIT;
//
//  FwwFilterDialog.ClearFilter;
end;

procedure TIQWebSearch.WriteSearchFieldToRegistry;
var
  I: Integer;
  ASortColumnsAsString: string;
begin
  ASortColumnsAsString:= '';
//  if not Assigned(self) or not Assigned(FwwIncSearch) then
//     EXIT;

//  if FwwIncSearch.SearchField <> '' then
//  begin
//     IQRegBooleanScalarWrite( self, 'DescOrder',  FDescOrder );
//
//     // IQRegStringScalarWrite( self, 'IQSearchField', FwwIncSearch.SearchField );
//     for I:= 0 to SortColumnsList.Count - 1 do
//       ASortColumnsAsString:= AddToStringWithDelimiter( ASortColumnsAsString, SortColumnsList[ I ], ',' );
//
//     if ASortColumnsAsString > '' then
//        IQRegStringScalarWrite( self, 'IQSearchField', ASortColumnsAsString );
//  end;
end;

function TIQWebSearch.GetUseTFields: Boolean;
begin
  Result:= FwwGridUseTFields
end;

procedure TIQWebSearch.SetUseTFields(const Value: Boolean);
begin
  FwwGridUseTFields := Value;
end;

procedure TIQWebSearch.SetTitleImageList(const Value: TUniImageList);
begin
  FUserTitleImageList := Value;
  CombineImageList;
end;

procedure TIQWebSearch.CombineImageList;
var
 i:integer;
 bmp:TBitmap;
begin
  // Basic values
  FUP_ImageIndex := 0;
  FDOWN_ImageIndex := 1;

  // Clear the image list
  FTitleImageList.Clear;
  // Add user images, if available
  if Assigned(FUserTitleImageList) then
   begin
     for i := 0 to FTitleImageList.Count-1 do
      begin
        FTitleImageList.GetBitmap(i,bmp);
        FUserTitleImageList.Add(bmp,bmp);
      end;

   end;
//     FTitleImageList.AddImages(FUserTitleImageList);
  // Add the basic images last
  FOriginalTitleImageList.GetBitmap(0,bmp);
  FUP_ImageIndex := FTitleImageList.Add(bmp,bmp); // UP
  FOriginalTitleImageList.GetBitmap(1,bmp);
  FDOWN_ImageIndex := FTitleImageList.Add(bmp, bmp); // DOWN
end;

procedure TIQWebSearch.DoCopyToClipBoard(Sender: TObject);
var
  AField:TField;
begin
  if (FColumnOnMouseUp > 0) and (FColumnOnMouseUp <= DataSet.FieldCount) then
  begin
    // AField:= FwwGrid.GetActiveField;
    AField:= DataSet.Fields[ FColumnOnMouseUp - 1 ];
    clipboard.AsText := AField.asString;
  end;
end;

procedure TIQWebSearch.DoExporTUniMenuItemClicked(Sender: TObject);
var
  AFileName: string;

  function GetSaveToFileName( var AFileName: string ): Boolean;
  begin
    Result:= FALSE;

    with TSaveDialog.Create(nil) do
    try
      Options:= [ofOverwritePrompt,ofHideReadOnly,ofEnableSizing];
      if TUniMenuItem(Sender).Name = 'XMLFormat1' then
         begin
           DefaultExt:= 'xml';
           // IQMS.WebVcl.ResourceStrings.cTXT0000549 = 'XML files (*.xml)|*.XML|Any file (*.*)|*.*';
           Filter:= IQMS.WebVcl.ResourceStrings.cTXT0000549;
         end
      else if (TUniMenuItem(Sender).Name = 'ExcelFormat1') then
         begin
           DefaultExt:= 'xls';
           // IQMS.WebVcl.ResourceStrings.cTXT0000550 = 'Excel files (*.xls)|*.XLS|Any file (*.*)|*.*';
           Filter:= IQMS.WebVcl.ResourceStrings.cTXT0000550;
         end;

      if Execute then
      begin
        AFileName:= FileName;
        Result:= TRUE;
      end;
    finally
      Free;
    end;
  end;

begin
  // get the file
  if not GetSaveToFileName( AFileName ) then
     EXIT;

  // Export!
//  with TExportDBGrid.Create( self, AFileName, FwwGrid ) do  // IQExportDBGrid.pas
//  try
//    if TUniMenuItem(Sender).Name = 'XMLFormat1' then
//       ToXML
//    else if TUniMenuItem(Sender).Name = 'ExcelFormat1' then
//       ToExcel
//    else
//       EXIT;
//
//    // IQMS.WebVcl.ResourceStrings.cTXT0000551 = 'Export finished successfully.';
//    IQConfirm(IQMS.WebVcl.ResourceStrings.cTXT0000551);
//  finally
//    Free;
//  end;
end;

procedure TIQWebSearch.ReadGrid;
var
  I: Integer;
begin
  // 10/13/2009 Read the grid from the Registry
  ReadGridOnly;

//  if Assigned( DataSource ) and Assigned( DataSource.DataSet ) then with DataSource.DataSet do
//    for I:= 0 to FieldCount - 1 do
//      if not Fields[ I ].Visible then
//         IQMS.Common.Controls.EnsureWWColumnRemoved( FwwGrid, Fields[ I ].FIeldName );
end;

procedure TIQWebSearch.WriteGrid;
begin
  // 10/13/2009 Write the grid to the Registry
  WriteGridOnly;
  WriteSearchFieldToRegistry;
end;

procedure TIQWebSearch.ReadGridOnly;
begin
  // 10/13/2009 Read the grid from the Registry
//  IQRegFormRead( self, [ FwwGrid ]);
end;

procedure TIQWebSearch.WriteGridOnly;
begin
  // 10/13/2009 Write the grid to the Registry
//  IQRegFormWrite( self, [ FwwGrid ]);
end;

procedure TIQWebSearch.AddRefreshButton;
begin
  DBNav.VisibleButtons:= DBNav.VisibleButtons + [ nbRefresh ];
//  IQMS.Common.Controls.ResizeNavBar( DBNav, AdjustDPI(DBNav.Height));
//  if not Assigned( DBNav.BeforeAction ) then
//     DBNav.BeforeAction:= DBNavBeforeAction;
end;

procedure TIQWebSearch.DBNavBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;

procedure TIQWebSearch.CheckValidDataSetType(const ADataSet: TDataSet);
begin
  // IQMS.WebVcl.Search datasets must be of type, TFDQuery
  if not ValidDataSetType(ADataSet) then
     begin
//      IQWarning('Application Error:  Dataset must be TIQWebDbxQuery, TSQLQuery, or TFDQuery.');
      System.SysUtils.Abort;
     end;
end;

function TIQWebSearch.ValidDataSetType(const ADataSet: TDataSet): Boolean;
begin
  // 01/08/2010 Returns True if the dataset is a valid type for use by
  // this component (Byron).
  Result := Assigned(ADataSet) and
            (
             (ADataSet is TIQWebDbxQuery) or
             (ADataSet is TSQLQuery) or
             (ADataSet is TFDQuery));
end;

procedure TIQWebSearch.IQNotify(var Msg: TMessage);
begin
  FIQUDRecView.LoadDataInspector;
end;

procedure TIQWebSearch.UpdateFilterOnStatusBar;

//   function GetFilterFields: string;
//   var
//     I         : Integer;
//     AFieldInfo: TwwFieldInfo;
//   begin
//     Result:= '';
//     if not Assigned(FwwFilterDialog) or
//       (FwwFilterDialog.FieldInfo.Count = 0) then
//       Exit;
//
//     for I:= 0 to FwwFilterDialog.FieldInfo.Count - 1 do
//     begin
//       AFieldInfo:= TwwFieldInfo(FwwFilterDialog.FieldInfo.Items[ I ]);
//       if Result = '' then
//          Result:= AFieldInfo.DisplayLabel
//       else
//          Result:= Format( '%s, %s', [ Result, AFieldInfo.DisplayLabel ]);
//     end;
//   end;
begin
//  if not Assigned(FwwFilterDialog) then
//    Exit;
//
//  // remove filter speedbutton
//  FRemoveFilterBtn.Enabled:= FwwFilterDialog.FieldInfo.Count > 0;
//
//  // filter speedbutton glyph
//  FStatusBar1.Visible:= FwwFilterDialog.FieldInfo.Count > 0;
//  if not FStatusBar1.Visible then
//     EXIT;
//
//  with FStatusBar1 do
//  begin
//    if FwwFilterDialog.FieldInfo.Count > 0 then
//       // IQMS.WebVcl.ResourceStrings.cTXT0000558 = 'Advanced Search Filter: %s';
//       SimpleText := Format(IQMS.WebVcl.ResourceStrings.cTXT0000558, [ GetFilterFields ])
//    else
//       SimpleText := '';
//  end;
end;

function TIQWebSearch.GetComponentParentFont: Boolean;
begin
  Result:= FComponentParentFont;
end;

function TIQWebSearch.GetControlType: TStrings;
begin
  Result:= wwDBGridControlType;
end;

procedure TIQWebSearch.SetComponentParentFont(const Value: Boolean);
begin
  FComponentParentFont:= Value;
  self.ParentFont:= Value;
end;

procedure TIQWebSearch.SetControlType(Value: TStrings);
begin
  wwDBGridControlType.Assign(Value);
end;

procedure TIQWebSearch.MenuCaption(AMenuItem: TUniMenuItem; ACaption: string);
begin
  if FindMenuItem(AMenuItem) <> NIL then
     FindMenuItem(AMenuItem).Caption := ACaption;
end;

procedure TIQWebSearch.MenuChecked(AMenuItem: TUniMenuItem; AChecked: Boolean);
begin
  if FindMenuItem(AMenuItem) <> NIL then
     FindMenuItem(AMenuItem).Checked := AChecked;
end;

procedure TIQWebSearch.MenuDefault(AMenuItem: TUniMenuItem; ADefault: Boolean);
begin
  if FindMenuItem(AMenuItem) <> NIL then
     FindMenuItem(AMenuItem).Default := ADefault;
end;

procedure TIQWebSearch.MenuEnabled(AMenuItem: TUniMenuItem; AEnabled: Boolean);
begin
  if FindMenuItem(AMenuItem) <> NIL then
     FindMenuItem(AMenuItem).Enabled := AEnabled;
end;

procedure TIQWebSearch.MenuVisible(AMenuItem: TUniMenuItem; AVisible: Boolean);
begin
  if FindMenuItem(AMenuItem) <> NIL then
     FindMenuItem(AMenuItem).Visible := AVisible;
end;

procedure TIQWebSearch.MenusEnabled(const AMenuItem: array of TUniMenuItem;
  AEnabled: Boolean);
var
   i: Integer;
begin
  for i := 0 to High(AMenuItem) do
      MenuEnabled(AMenuItem[i], AEnabled);
end;

procedure TIQWebSearch.MenusVisible(const AMenuItem: array of TUniMenuItem;
  AVisible: Boolean);
var
   i: Integer;
begin
  for i := 0 to High(AMenuItem) do
      MenuVisible(AMenuItem[i], AVisible);
end;

procedure TIQWebSearch.ClearWWFilterDisable;
begin
  StoreWWFilter;
  ClearWWFilter;
  DisableWWFilter:= TRUE;
end;

procedure TIQWebSearch.RestoreWWFilterEnable;
begin
  DisableWWFilter:= FALSE;
  RestoreWWFilter;
end;

procedure TIQWebSearch.ExecPickListClick(Sender: TObject);
var
  AHandled: Boolean;
begin
  if not Assigned(HPick) then ABORT;

  if Assigned(OnHPickBtnClick) then
  begin
    OnHPickBtnClick( self, AHandled );
    if AHandled then
       EXIT;
  end;

  HPick.AssociatedIQSearch:= self;
  with HPick do
    if Execute then
    begin
       if (self.DataSet.FindField('id') <> nil) and ResultHasColumn['ID'] then
           self.DataSet.Locate('id', GetValue('ID'), [])

       else if (self.DataSet.FindField( ResultSortColumnName ) <> nil) then
           self.DataSet.Locate( ResultSortColumnName, GetValue( ResultSortColumnName ), [])

       else
           raise Exception.Create(
             'Application Error:  Search field not found.  Operation aborted.');
    end;
end;

procedure TIQWebSearch.SortCriteriaClick(Sender: TObject);
var
  AList: TList;
  AField: TField;
  I: Integer;
begin
  AList:= TList.Create;
  try
    for I:= 0 to SortColumnsList.Count - 1 do
      AList.Add( DataSet.FieldByName(SortColumnsList[I]));

    // popup fields dialog and change order by
//    if TFrmSortFields.DoShowModal( DataSet, AList ) and (AList.Count > 0) then  {SortFields.pas}
//    begin
//      FDescOrder:= FALSE;
//      ChangeSortField( AList );
//    end;

  finally
    AList.Free;
  end;
end;

procedure TIQWebSearch.ReadSearchFieldFromRegistry;
var
  ASortColumnsAsString: string;
  I: Integer;
  AFieldsList: TList;
  AField: TField;
begin
  ASortColumnsAsString:= '';
//  IQRegStringScalarRead( self, 'IQSearchField', ASortColumnsAsString );

  if ASortColumnsAsString = '' then
     ASortColumnsAsString:= FDefaultSearchField;

  if ASortColumnsAsString = '' then
     ASortColumnsAsString:= DataSet.Fields[ 0 ].FieldName;

  if ASortColumnsAsString = '' then
     EXIT;

  // create list of fields to sort the dataset on
  AFieldsList:= TList.Create;
  try
//    for I:= 1 to NumToken( ASortColumnsAsString, ',' ) do
//    begin
//      AField:= DataSet.FindField( Trim(GetToken( ASortColumnsAsString, ',', I )));
//      if Assigned( AField ) then
//         AFieldsList.Add( AField );
//    end;

    // change the order by!
    ChangeSortField( AFieldsList );
  finally
    AFieldsList.Free;
  end;
end;

function TIQWebSearch.GetSearchPanel:TUniPanel;
begin
  Result := FSearchPanel;
end;

//procedure TIQWebSearch.InitWWFilterDialog( Dialog: TwwFilterDlg );
//begin
//  IQMS.Common.Controls.AlignClientWWFilterDialogCriteria( Dialog );
//end;

procedure TIQWebSearch.DoOnColumnMoved(Sender: TObject; FromIndex,  ToIndex: Integer);
begin
  WriteGrid;
  ReadGridOnly;
end;

procedure TIQWebSearch.DoOnColWidthChanged(Sender: TObject;  Column: Integer);
begin
  WriteGrid;
  ReadGridOnly;
end;


procedure TIQWebSearch.ReadGrid2;
var
  I: Integer;
begin
  // 10/13/2009 Read the grid from the Registry
  ReadGridOnly;
end;

procedure TIQWebSearch.RemoveFilter;
begin
  RemoveFilterClick(nil);
end;


procedure TIQWebSearch.SetPickSubqueryHdr_ID(const Value: Integer);
begin
  FHPickSubqueryHdr_ID:= Value;
  BuildSubqueryFilter;
  UpdateSubqueryButtonImage;
end;


procedure TIQWebSearch.UpdateSubqueryButtonImage;
begin
  if HPickSubqueryHdr_ID > 0 then with FSubQueryBtn do
     begin
       // 'Component Where Used Filter: '#13'%s';
       Hint:= Format(IQMS.WebVcl.ResourceStrings.cTXT0000493,[ SelectValueByID('descrip', 'hpick_subquery_hdr', HPickSubqueryHdr_ID)]);
       Glyph.Assign(nil);
       FSubQueryImageList.GetBitMap(1, Glyph );
     end
  else if HPickSubqueryHdr_ID = 0 then with FSubQueryBtn do
     begin
       // 'Component Where Used Filter: Off'#13'Click to Select Filter'
       Hint:= IQMS.WebVcl.ResourceStrings.cTXT0000492;
       Glyph.Assign(nil);
       FSubQueryImageList.GetBitMap(0, Glyph );
     end
end;


procedure TIQWebSearch.BuildSubqueryFilter;
//var
//  hMsg: TUniPanelMesg;
begin
  try
    if FHPickSubqueryHdr_ID = 0 then
    begin
      if DataSet.ClassType = TFDQuery then
        ExecuteCommandFmt(
          'delete from gtt_picklist_subquery where batch = %d',
            [FSubqueryBatch])
      else
        ExecuteCommandFmt(
          'delete from gtt_picklist_subquery where batch = %d',
            [FSubqueryBatch]);
      EXIT;
    end;

//    hMsg:= hPleaseWait( IQMS.WebVcl.ResourceStrings.cTXT0000490 ); // 'Evaluating selected filter - please wait...';
    try
      if DataSet.ClassType = TFDQuery then
        ExecuteCommandFmt(
          'declare                                                             ' +
          '  v_hpick_subquery_hdr_id number := %d;                             ' +
          '  v_batch number := %d;                                             ' +
          'begin                                                               ' +
          '  hpick_misc.populate_subquery( v_hpick_subquery_hdr_id, v_batch ); ' +
          'end;                                                                ',
          [HPickSubqueryHdr_ID, SubqueryBatch])
      else
        ExecuteCommandFmt(
          'declare                                                             ' +
          '  v_hpick_subquery_hdr_id number::= %d;                             ' +
          '  v_batch number::= %d;                                             ' +
          'begin                                                               ' +
          '  hpick_misc.populate_subquery( v_hpick_subquery_hdr_id, v_batch ); ' +
          'end;                                                                ',
          [HPickSubqueryHdr_ID, SubqueryBatch])
    finally
//      hMsg.Free;
    end;
  except
//    on E: Exception do
//    IQError( E.Message );
  end;
end;

function TIQWebSearch.GetSubqueryBatch: Integer;
begin
  if FSubqueryBatch = 0 then
     FSubqueryBatch:= Trunc(IQMS.Common.Sequence.GetNextSequenceNumber( 'S_GTT_PICKLIST_SUBQUERY' ));
  Result:= FSubqueryBatch;
end;


procedure TIQWebSearch.SetSubqueryBatch(const Value: Integer);
begin
  FSubqueryBatch:= Value;
end;


procedure TIQWebSearch.SetSubqueryModuleName(const Value: string);
begin
  FSubqueryModuleName:= UpperCase(Value);
end;

procedure TIQWebSearch.sbtnSubqueryClick(Sender: TObject);
var
  X,Y: Integer;
begin
  // Get the coordinates for the popup form
  X := (FSubqueryBtn.ClientOrigin.x) + FSubqueryBtn.Width;
  Y := (FSubqueryBtn.ClientOrigin.y) + FSubqueryBtn.Height + 2;

  // popup the form
//  with TFrmHPickSubquery.Create( self, SubqueryModuleName ) do   // hpick_subquery.pas
//  try
//    Top := Y;
//    Left:= X - Width;
//    if ShowModal = mrOK then
//    begin
//       HPickSubqueryHdr_ID:= ResultValue;  // this will populate the gtt_picklist_subquery
//       AssignSearchField;                  // Refresh the query
//    end;
//  finally
//    Free;
//  end;
end;

function TIQWebSearch.GetIsUsingSubquery: Boolean;
begin
  Result:= SubqueryModuleName <> '';
end;

procedure TIQWebSearch.AddSubqueryToSQL( SQL: TStrings );
var
  I: Integer;
begin
  if not IsUsingSubquery then
     EXIT;

  // Add to [From] using HPICK_SUBQUERY_FROM_START and HPICK_SUBQUERY_FROM_END
  if self.HPickSubqueryHdr_ID > 0 then
    InsertStringsBetweenKeyWords( SQL,
                                  Format( ', (select id from gtt_picklist_subquery where batch = %d) gtt_picklist_subquery ', [ SubqueryBatch ]),
                                  HPICK_SUBQUERY_FROM_START,
                                  HPICK_SUBQUERY_FROM_END )
  else
     DeleteStringsBetweenKeyWords( SQL,
                                   HPICK_SUBQUERY_FROM_START,
                                   HPICK_SUBQUERY_FROM_END,
                                   I );


  // Add to [Where] using HPICK_SUBQUERY_WHERE_START and HPICK_SUBQUERY_WHERE_END
  if self.HPickSubqueryHdr_ID > 0 then
    InsertStringsBetweenKeyWords( SQL,
                                  Format( ' and (%s = gtt_picklist_subquery.id) ', [ SubqueryFieldName ]),
                                  HPICK_SUBQUERY_WHERE_START,
                                  HPICK_SUBQUERY_WHERE_END )
  else
     DeleteStringsBetweenKeyWords( SQL,
                                   HPICK_SUBQUERY_WHERE_START,
                                   HPICK_SUBQUERY_WHERE_END,
                                   I );
end;



end.
