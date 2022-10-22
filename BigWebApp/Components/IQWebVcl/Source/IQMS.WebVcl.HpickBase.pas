unit IQMS.WebVcl.HpickBase;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Winapi.Messages,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.DBGrids,
  Data.DB,
  Vcl.Menus,
  IQMS.Common.JumpConstants,
  System.Math,
//  wwDialog,
//  Vcl.Wwfltdlg,
  Vcl.AppEvnts,
  IQMS.WebVcl.Time,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniImageList,
  uniEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.ExtCtrls;

type
  TModifyProc = procedure( Sender:TObject; var Action:TModalResult; var ResultValue:Variant ) of object;
  TIQCreateHPickColumn = procedure( Sender: TObject; AField: TField ) of object;
  TIQBeforeCreateHPickColumn = procedure( Sender: TObject; AField: TField; var ACanCreateColumn: Boolean ) of object;
  TIQAfterCreateHPickColumn = procedure( Sender: TObject; AQuery: TDataSet; AColumn: TUniBaseDBGridColumn ) of object;
  TIQAfterHPickCreate = procedure( Sender: TObject ) of object;
  TIQCalcSearchText = procedure( Sender: TObject; ASortField: TField; var AText: string ) of object;

type
  { TFrmPickListForm }
  TPickListForm = class of TFrmPickListBase;

  { TFrmPickListBase }
  TFrmPickListBase = class(TUniForm)
    SrcQuery: TDataSource;
    Query: TFDQuery;
    ScrollBox1: TUniScrollBox;
    PnlTopControls: TUniPanel;
    AvailableSortBy: TUniPopupMenu;
    StatusBar1: TUniStatusBar;
    Panel2: TUniPanel;
    pnlButtons: TUniPanel;
    BtnCancel: TUniBitBtn;
    BtnSelect: TUniBitBtn;
    BtnModify: TUniBitBtn;
    pnlPropagate: TUniPanel;
    chkbPropagateSort: TUniCheckBox;
    chkbPropagateScope: TUniCheckBox;
    Label1: TUniLabel;
    PnlSearch: TUniPanel;
    ApplicationEvents1: TApplicationEvents;
    N1: TUniMenuItem;
    QryCount: TFDQuery;
    ImageListFilter: TUniImageList;
    pnlSearchTop: TUniPanel;
    Search: TUniEdit;
    pnlSearchClientBottom: TUniPanel;
    pnlCustomUse: TUniPanel;
    btnCustom1: TUniBitBtn;
    FlowPanel1: TUniScrollBox;
    chkCaseInsensitive: TUniCheckBox;
    chkWaitForPrompt: TUniCheckBox;
    PnlSearchBtns: TUniPanel;
    btnLaunch: TUniSpeedButton;
    sbtnSort: TUniSpeedButton;
    sbtnFilter: TUniSpeedButton;
    sbtnRemoveFilter: TUniSpeedButton;
    sbtnAdvFilterDropDown: TUniSpeedButton;
    bvlAdvFilterDropDown: TUniPanel;
    pnlPkHide: TUniPanel;
    sbtnToggleHide: TUniSpeedButton;
    PnlUser: TUniPanel;
    sbtnUser1: TUniSpeedButton;
    bvlSortCriteriaDropDown: TUniPanel;
    sbtnSortCriteriaDropDown: TUniSpeedButton;
    pnlSubquery: TUniPanel;
    sbtnSubquery: TUniSpeedButton;
    pnlSearchButtonsBottom: TUniPanel;
    chkExactMatch: TUniCheckBox;
    procedure SortByChange(Sender: TObject);
    procedure BtnModifyClick(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    procedure SearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure AvailableSortByPopup(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure sbtnFoundClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSortClick(Sender: TObject);
    procedure sbtnFilterClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure chkCaseInsensitiveClick(Sender: TObject);
    procedure QryCountBeforeOpen(DataSet: TDataSet);
    procedure sbtnUser1Click(Sender: TObject);
    procedure sbtnRemoveFilterClick(Sender: TObject);
    procedure btnCustom1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnAdvFilterDropDownClick(Sender: TObject);
//    procedure wwFilterDialog1InitDialog(Dialog: TwwFilterDlg);
    procedure sbtnSortCriteriaDropDownClick(Sender: TObject);
    procedure sbtnSubqueryClick(Sender: TObject);
    procedure chkExactMatchClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
  private
    { Private declarations }
    function GetIsUsingSubquery: Boolean;
    procedure AddSubqueryToSQL;
    function GetSubQueryBatch: Integer;
    function IsSubqueryEmpty: Boolean;
    function GetSubqueryFieldName: string;
    function GetHPickSubqueryHdr_ID: Integer;
    procedure SetHPickSubqueryHdr_ID(const Value: Integer);
    procedure UpdateSubqueryButtonImage;
    function GetMultiSelect: Boolean;
    procedure SetMultiSelect(const Value: Boolean);
    procedure AssignExactMatch;
    function GetExactMatch: Boolean;
    property IsUsingSubquery: Boolean read GetIsUsingSubquery;
    property SubQueryBatch: Integer read GetSubQueryBatch;
    property SubqueryFieldName: string read GetSubqueryFieldName;
    property HPickSubqueryHdr_ID: Integer read GetHPickSubqueryHdr_ID write SetHPickSubqueryHdr_ID;

    function GetOnModify:TModifyProc;
    function GetOnIQCreateHPickColumn: TIQCreateHPickColumn;
    function GetOnIQAfterCreateHPickColumn: TIQAfterCreateHPickColumn;
    function GetIQBeforeCreateHPickColumn: TIQBeforeCreateHPickColumn;

    procedure SetInitialSeek( const s:string );

    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;

    procedure AssignWaitFotPrompt;

    procedure UpdateFilterOnStatusBar;
    procedure AssignPropagateInfo;
    procedure InitInternalQuery(AQuery: TFDQuery);

    function GetUserBtn1OnClick: TModifyProc;
    function GetCustomBtn1OnClick: TModifyProc;

    function CheckApplyUpperCaseToFormat( AFmtExpr, AFmtParam: string; AField: TField = nil ): string;
    procedure CloseQuery(AQry: TFDQuery);
    procedure AssignCaseInsensitive;
    function GetOnIQCalcSearchText: TIQCalcSearchText;
  protected
    { Public declarations }
    FIQHpick: TComponent;
    SQLSelect : String;
    SQLFrom   : String;
    SQLWhere  : String;
    SQLOrderBy: String;

    FInitialSeek: string;
    FResultValue: Variant;

    FOnColumnFlag: Boolean;
    FDescOrd     : Boolean;

    FPkHideColumn: string;

    FOnShowHint: TShowHintEvent;

    FOnActivateDone: Boolean;
    VisiCols  : TStringList;
    SortCols  : TList;
    FSortCols :String;

    FQryCountIsChanged: Boolean;
    FPKList_Wait_Prompt: Boolean;
    FPkList_CaseInsensitive: Boolean;

    FIsMainQueryFiltered: Boolean;

    FTimeIt:  TIQWebTimeIt; // IQTime.pas

    procedure Startup; virtual;
    procedure AfterShow; virtual;
    procedure ReadGrid; virtual;
    procedure WriteGrid; virtual;
    procedure CreateTFields; virtual;
    procedure SetButtons; virtual;
    procedure PopUpAvailableSortByMenu( var Key: word ); virtual;
    procedure DoOnMouseDown( Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer ); virtual;
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean;
     var HintInfo: THintInfo ); virtual;
    procedure SetSortColumn( AValue: TField ); virtual;
    function GetSortColumn: TField; virtual;

    procedure ParseQuery; virtual;
    function  ParseSQLPhysicalFieldName( cSrc, Delimeter:string; nToken:integer ):string;
    procedure BuildSQLStatement; virtual;
    procedure SetParams( AQuery: TFDQuery; AShowRecords: Boolean = True);
    procedure OpenSQL(AShowRecords: Boolean = True);
    function GetResultRecordCount:Integer;
    procedure CheckAssignParamsType(AQuery: TFDQuery);
    function GetWaitForPrompt: Boolean;
    function GetCaseInsensitive: Boolean;
    property OnIQCalcSearchText : TIQCalcSearchText read GetOnIQCalcSearchText;
    procedure DoExecuteSort; virtual;

  public
    { Public declarations }
    destructor Destroy; override;
    constructor Create(AOwner: TComponent; AIQHpick: TComponent); reintroduce;

    property WaitForPrompt: Boolean read GetWaitForPrompt;
    property CaseInsensitive: Boolean read GetCaseInsensitive;
    property ExactMatch: Boolean read GetExactMatch;

    function Grid: TUniDBGrid; virtual;
    property IQHpick: TComponent read FIQHpick;
    function GetFieldsCount: Integer;
    function GetField(i:Integer):TField;
    function GetFieldByName(const AFieldName:string):TField;

    function PropagageSort: Boolean;
    function PropagageScope: Boolean;

    procedure AddLegendImages( AValues: array of Variant );

    property OnIQCreateHPickColumn: TIQCreateHPickColumn read GetOnIQCreateHPickColumn;
    property OnIQAfterCreateHPickColumn: TIQAfterCreateHPickColumn read GetOnIQAfterCreateHPickColumn;
    property OnIQBeforeCreateHPickColumn: TIQBeforeCreateHPickColumn read GetIQBeforeCreateHPickColumn;
    property OnModify :TModifyProc read GetOnModify;
    property OnUserBtn1Click: TModifyProc read GetUserBtn1OnClick;
    property OnCustomBtn1Click: TModifyProc read GetCustomBtn1OnClick;
    property InitialSeek:string  read FInitialSeek write SetInitialSeek;
    property ResultValue:Variant read FResultValue write FResultValue;  {this is only for "New" button use}
    property SortColumn: TField read GetSortColumn write SetSortColumn;
    property PkHideColumn: string read FPkHideColumn write FPkHideColumn;
    property MultiSelect: Boolean read GetMultiSelect write SetMultiSelect;
  end;

const
  ASCII_SET = ['a'..'z', 'A'..'Z', '0'..'9', '!', '@', '#', '$', '%',
               '^', '&', '*', '(', ')', '-', '_', '=', '+', '\', '|', '/', '~'];

  DELIMETER = ' AS ';

  HPICK_FROM_START = '-- HPICK_FROM_START';
  HPICK_WHERE_START = '-- HPICK_WHERE_START';
  HPICK_EMPTY_DATASET_FILTER_START = '-- HPICK_EMPTY_DATASET_FILTER_START';
  HPICK_EMPTY_DATASET_FILTER_END = '-- HPICK_EMPTY_DATASET_FILTER_END';

  HPICK_SUBQUERY_FROM_START = '/* HPICK_SUBQUERY_FROM_START */';
  HPICK_SUBQUERY_WHERE_START = '/* HPICK_SUBQUERY_WHERE_START */';

var
  FrmPickListBase: TFrmPickListBase;

implementation

{$R *.DFM}

uses
  IQMS.Common.DebugSQL,
  IQMS.WebVcl.HPickFilterPickList,
  IQMS.Common.Controls,
  IQMS.WebVcl.Hpick,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.QueryInfo,
  IQMS.Common.SortFields,
  System.StrUtils,
  IQMS.Common.SysShare,
  IQMS.WebVcl.ResourceStrings,
  IQMS.WebVcl.HPickSortCriteriaPickList,
  IQMS.WebVcl.HPickSubquery,
  IQMS.Common.Graphics,
  uniStringGrid;

const
  MIN_GRID_WIDTH = 220;
  MAX_GRID_WIDTH = 600;

{=========================================================================}
procedure RaiseInvalidSQL;
begin
  raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000041 {'Unable to parse SQL statement for SELECT..FROM..WHERE'});
end;

{ TFrmPickListBase }

constructor TFrmPickListBase.Create(AOwner: TComponent; AIQHpick: TComponent);
begin
  inherited Create(AOwner);
  FIQHpick := AIQHpick;
  VisiCols := TStringList.Create;
  SortCols := TList.Create;
  FTimeIt :=  TIQWebTimeIt.Create;

  Startup;
end;

destructor TFrmPickListBase.Destroy;
begin
  if Assigned(Query) and Query.Active then
    Query.Close;
  if Assigned(VisiCols) then
    FreeAndNil(VisiCols);
  if Assigned(SortCols) then
    FreeAndNil(SortCols);
  if Assigned(FTimeIt) then
    FreeAndNil(FTimeIt);
  inherited Destroy;
end;

procedure TFrmPickListBase.FormShow(Sender: TObject);
begin
  IQRegFormRead( FIQHpick, [ self ]);  // Restore WindowState here. It is not obeying wsMaximized in Constructor/OnCreate.
  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

procedure TFrmPickListBase.FormActivate(Sender: TObject);
begin
  if not FOnActivateDone then
  begin
    FOnActivateDone:= TRUE;                  // Jul-18-2002
    FOnShowHint:= Application.OnShowHint;    // Apr-11-2002
    Application.OnShowHint:= DoOnShowHint;
  end;
end;

procedure TFrmPickListBase.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ASortCols:String;
  I:Integer;
begin
  Action := caFree;
  if Assigned(FIQHpick) then
    begin
      IQRegFormWrite( FIQHpick, [ self ]);
      if not TIQWebHPick(FIQHpick).SkipRestoreRegistry then
      begin
        ASortCols := '';
        if Assigned(SortCols) then
          begin
            if SortCols.Count > 0 then
              ASortCols := TField(SortCols[ 0 ]).FieldName;
            if SortCols.Count > 1 then
              for I:= 1 to SortCols.Count - 1 do
                ASortCols := Format('%s,%s', [ASortCols, TField(SortCols[ I ]).FieldName]);
            if SortCols.Count > 0 then
              IQRegStringScalarWrite( FIQHpick, 'SortColumns', ASortCols);
          end;
        if Assigned(VisiCols) then
          begin
            IQRegIntegerScalarWrite( FIQHpick, 'SortColIndex', VisiCols.IndexOfObject( SortColumn ));
            IQRegBooleanScalarWrite( FIQHpick, 'DescendingOrder', FDescOrd );
//            IQRegFormWrite( FIQHpick, [ Search, Grid, wwFilterDialog1 ]);
            // Write grid here, in case descendant overrides
            // (i.e., grid is TwwDBGrid, not TDBGrid)
            WriteGrid;
            if chkCaseInsensitive.Visible then
               IQRegFormWrite( FIQHpick, [ chkCaseInsensitive ]);
            if chkWaitForPrompt.Visible then
               IQRegFormWrite( FIQHpick, [ chkWaitForPrompt ]);
            if chkExactMatch.Visible then
               IQRegFormWrite( FIQHpick, [ chkExactMatch ]);
          end;
      end;
    end;

  // Application.OnShowHint:= NIL;
  Application.OnShowHint:= FOnShowHint;
end;

procedure TFrmPickListBase.FormResize(Sender: TObject);
const
  cMEASURE_CHAR   = '0';
  iINDICATOR_WIDE = 11;
var
  W:Integer;
begin
  {If only 1 column is displayed - make sure we occupy the whole grid}
  if (Grid <> NIL) and (Grid is TUniDBGrid) and (Query.FieldCount = 1) and (TUniDBGrid(Grid).Columns.Count = 1) then
     begin
       //W:= Trunc( (Grid.Width - iINDICATOR_WIDE) /
       //  GetTextWidthPixels(Grid.Font, cMEASURE_CHAR, self ) );
       //  Query.Fields[0].DisplayWidth:= W;

       TUniDBGrid(Grid).Columns[ 0 ].Width:= Grid.ClientWidth - iINDICATOR_WIDE - 3;
     end;

  //{Launch button location}
  //btnLaunch.Left:= Width - btnLaunch.Width - 12;
  //
  //{Search Edit width}
  //Search.Width:= btnLaunch.Left - 7;
end;

procedure TFrmPickListBase.Startup;
begin
  IQRegFormRead( FIQHpick, [ self ] );
  if not TIQWebHPick(FIQHpick).SkipRestoreRegistry then
  begin
     IQRegFormRead( FIQHpick, [ Search ] );
     ReadGrid;
  end;

  pnlPkHide.Visible:= FALSE;
  pnlUser.Visible  := FALSE;
  pnlSubquery.Visible:= False;

  btnCustom1.Visible:= FALSE;

  InitInternalQuery( Query );      {main query}
  InitInternalQuery( QryCount );   {query used for count records}

  InitialSeek:= TIQWebHPick( FIQHpick ).IQInitialSeek;

  TIQWebHPick( FIQHpick ).WasModified:= FALSE;     { a Flag for outside world in case OnModify was hit }
  TIQWebHPick( FIQHpick ).NewResultValue:= FALSE;  { for "New" button }

  if (Grid <> NIL) then
     TUniStringGrid(Grid).OnMouseDown:= DoOnMouseDown;

  AssignCaseInsensitive;
  AssignWaitFotPrompt;                       {Assign boolean var if query must be launched right away or wait for a prompt}
  AssignExactMatch;

  AssignPropagateInfo;
  self.Caption:= TIQWebHPick( FIQHpick ).Title;
end;

procedure TFrmPickListBase.InitInternalQuery( AQuery: TFDQuery );
var
   i: Integer;
begin
  AQuery.Close;
  AQuery.Connection := TFDQuery(FIQHpick).Connection;
  AQuery.SQL.Assign( TFDQuery(FIQHpick).SQL );

  if AQuery <> QryCount then
  begin
    AQuery.Filtered:= TFDQuery(FIQHpick).Filtered;
    AQuery.Filter  := TFDQuery(FIQHpick).Filter;
    AQuery.OnFilterRecord:= TFDQuery(FIQHpick).OnFilterRecord;
    AQuery.BeforeOpen:= TFDQuery(FIQHpick).BeforeOpen;
    FIsMainQueryFiltered:= AQuery.Filtered;
  end;

  AQuery.DataSource:= TFDQuery(FIQHpick).DataSource;
  AQuery.AfterOpen := TFDQuery(FIQHpick).AfterOpen;

//  for i := 0 to TFDQuery(FIQHpick).ParamCount - 1 do
//    AQuery.Params[i].DataType := TFDQuery(FIQHpick).Params[i].DataType;
  for i := 0 to TFDQuery(FIQHpick).ParamCount - 1 do
    if AQuery.Params.FindParam(TFDQuery(FIQHpick).Params[i].Name) <> nil then
      AQuery.Params.FindParam(TFDQuery(FIQHpick).Params[i].Name).DataType :=
        TFDQuery(FIQHpick).Params[i].DataType;
end;

procedure TFrmPickListBase.AssignWaitFotPrompt;
begin
  try
    FPKList_Wait_Prompt:= SelectValueAsString('select pklist_wait_prompt from params') = 'Y';
  except
    FPKList_Wait_Prompt:= FALSE;
  end;

  FPKList_Wait_Prompt:= FPKList_Wait_Prompt and not TIQWebHPick(FIQHpick).ForceShowWaitForPrompt;

  chkWaitForPrompt.Visible:= not FPKList_Wait_Prompt;

  if not TIQWebHPick(FIQHpick).SkipRestoreRegistry and chkWaitForPrompt.Visible then
     IQRegFormRead( FIQHpick, [ chkWaitForPrompt ]);
end;

procedure TFrmPickListBase.AssignCaseInsensitive;
begin
  try
    FPkList_CaseInsensitive:= SelectValueAsString('select pklist_case_insensitive from params') = 'Y';
  except
    FPkList_CaseInsensitive:= FALSE;
  end;

  chkCaseInsensitive.Visible:= not FPkList_CaseInsensitive;

  if not TIQWebHPick(FIQHpick).SkipRestoreRegistry and chkCaseInsensitive.Visible then
     IQRegFormRead( FIQHpick, [ chkCaseInsensitive ]);
end;

procedure TFrmPickListBase.AssignExactMatch;
begin
  if not TIQWebHPick(FIQHpick).SkipRestoreRegistry and chkExactMatch.Visible then
     IQRegFormRead( FIQHpick, [ chkExactMatch ]);
end;

procedure TFrmPickListBase.AssignPropagateInfo;
var
  S: string;
begin
  pnlPropagate.Visible:= Assigned( TIQWebHPick( FIQHpick ).AssociatedDataSet );
//  IQMS.Common.Controls.ResizeCheckBoxes(Self, pnlPropagate);
  pnlPropagate.Width := Max(pnlPropagate.Width,
                            (chkbPropagateSort.Left +
                              Max(chkbPropagateSort.Width, chkbPropagateScope.Width) +
                              4));
  {hints}
  if Assigned( TIQWebHPick( FIQHpick ).AssociatedDataSet ) and
     (TIQWebHPick( FIQHpick ).AssociatedDataSet is TFDTable) then
     with TFDTable( TIQWebHPick( FIQHpick ).AssociatedDataSet) do
     begin
       if IndexName > '' then S:= IndexName else S:= IndexFieldNames;
       // IQMS.WebVcl.ResourceStrings.cTXT0000554 =
       //'Propagate the sort to the associated table %s.'#13+
       // 'Currently sorted by: %s';
       chkbPropagateSort.Hint:= Format (IQMS.WebVcl.ResourceStrings.cTXT0000554,
                                        [ TableName, S ]);
       // IQMS.WebVcl.ResourceStrings.cTXT0000555 = 'Propagate the scope to the associated table %s.';
       chkbPropagateScope.Hint:= Format(IQMS.WebVcl.ResourceStrings.cTXT0000555,
                                        [ TableName ]);
     end;
end;

procedure TFrmPickListBase.IQAfterShowMessage( var Msg: TMessage );
begin
end;

procedure TFrmPickListBase.AfterShow;
begin
  // nothing
end;

procedure TFrmPickListBase.SetInitialSeek( const s:string );
begin
   FInitialSeek:= s;
   Search.Text:= FInitialSeek;
end;

function TFrmPickListBase.GetOnModify:TModifyProc;
begin
  Result:= TIQWebHPick( FIQHpick ).OnIQModify;
end;

procedure TFrmPickListBase.ParseQuery;
var
  AText  : string;
  i,j    : integer;
  AKeywordFROM  : string;
  AKeywordWHERE : string;
begin
  SQLSelect := '';
  SQLFrom   := '';
  SQLWhere  := '';
  SQLOrderBy:= '';

  AText:= UpperCase( StrTran(Query.SQL.Text, #13#10, ' '));

  try
    {pull out Select ...}
    i:= Pos( 'SELECT ',  AText );
    AText:= Copy( AText, i+7, 10000 );

    i:= Pos( HPICK_FROM_START,  AText );
    if i = 0 then
       i:= Pos( ' FROM ',  AText )
    else
       i:= PosEx( ' FROM ',  AText, i );

    if i = 0 then ABORT;

    SQLSelect:= Copy( AText, 1, i-1 );

    // Remove the tag
    SQLSelect := IQMS.Common.StringUtils.StrTran(SQLSelect, HPICK_FROM_START, '');

    AText:= Copy( AText, i+Length(' FROM '), 10000 );

    // 12-10-2008 - when we need to select from a union or some inner select.  see ven_rfq_main.pas for example
    i:= Pos( HPICK_WHERE_START,  AText );
    if i = 0 then
       i:= Pos( ' WHERE ', AText )
    else
       i:= PosEx( ' WHERE ', AText, i );

    if i > 0 then
      begin
         SQLFrom := LeftStr( AText, i );
         SQLWhere:= Copy( AText, i+Length(' WHERE '), 10000 );

         i:= Pos( ' ORDER BY ',  SQLWhere );
         if i > 0 then begin
            SQLWhere  := Copy( SQLWhere,    1,   i-1 );
            SQLOrderBy:= Copy( SQLWhere, i+10, 10000 );
         end
      end // 'Where' is Found

    else
      begin
        SQLFrom := AText;
        SQLWhere:= '';

        i:= Pos( ' ORDER BY ',  SQLFrom );
        if i > 0 then begin
           SQLFrom   := Copy( SQLFrom,    1,   i-1 );
           SQLOrderBy:= Copy( SQLFrom, i+10, 10000 );
        end
      end; // i:= Pos( ' WHERE ',  AText ) > 0

    // Remove the tag string
    SQLFrom := IQMS.Common.StringUtils.StrTran(SQLFrom, HPICK_WHERE_START, '');

    {01-06-2009 FieldDefs.Update (called when we build TFields) can incur long time of processing.
     We need to speed up the processing of FieldDefs.Update and take it out here before we build the actual SQLStatement
     See sales orders DM_OR.PkOrders as an example. This is what it should look like:
     -- HPICK_EMPTY_DATASET_FILTER_START
     and 1 < 0
     -- HPICK_EMPTY_DATASET_FILTER_END
    }
    if SQLWhere > '' then
    begin
      i:= Pos( HPICK_EMPTY_DATASET_FILTER_START, SQLWhere );
      j:= Pos( HPICK_EMPTY_DATASET_FILTER_END,  SQLWhere );
      if (i > 0) and (j > 0) then
         // 03/25/2010 Remmed (Byron).  This doesn't work well.
         //SQLWhere:= StuffString( SQLWhere, i, j + Length('-- HPICK_EMPTY_DATASET_FILTER_END'), '');
         SQLWhere := Copy(SQLWhere, 1, i-1) +
                     Copy(SQLWhere,
                          j + Length(HPICK_EMPTY_DATASET_FILTER_END),
                          Length(SQLWhere));
    end;

  except
    RaiseInvalidSQL;
  end;
end; {Parse Query}

procedure TFrmPickListBase.CreateTFields;
var
  i         : integer;
  AFieldSrc,
  AFieldTrg : TField;
  PhysicalFieldName:string;
  AColumn: TUniBaseDbGridColumn;
  ACanCreateColumn: Boolean;
begin
  VisiCols.Clear;
  SortCols.Clear;

  {Underlying structure}
  Query.FieldDefs.Update;

  { Get Columns }
  for i:= 0 to Query.FieldDefs.Count - 1 do
  begin
    with TFDQuery(FIQHpick) do
      if FieldCount = 0 then begin     // Developer didn't use Fields Editor
        AFieldTrg:= Query.FieldDefs[i].CreateField(Query);

        AFieldTrg.DisplayLabel:= ProperCase(Query.FieldDefs.Items[i].Name);
        AFieldTrg.Visible     := TRUE;
        AFieldTrg.DisplayWidth:= Query.FieldDefs.Items[i].Size;
      end
      else  // Developer did use Fields Editor and Added this field to the list of fields
        if FindField( Query.FieldDefs.Items[i].Name ) <> NIL then begin

          AFieldSrc:= FieldByName( Query.FieldDefs.Items[i].Name );

          AFieldTrg:= Query.FieldDefs[i].CreateField(Query);

          AFieldTrg.DisplayLabel:= AFieldSrc.DisplayLabel;
          AFieldTrg.Visible     := AFieldSrc.Visible;
          AFieldTrg.DisplayWidth:= AFieldSrc.DisplayWidth;
        end
        else
          begin  // Developer did use Fields Editor but did not included this field in the list
            AFieldTrg:= Query.FieldDefs[i].CreateField(Query);

            AFieldTrg.DisplayLabel:= ProperCase(Query.FieldDefs.Items[i].Name);
            AFieldTrg.Visible     := FALSE;
            AFieldTrg.DisplayWidth:= Query.FieldDefs.Items[i].Size;
          end;

    PhysicalFieldName:= ParseSQLPhysicalFieldName( SQLselect, DELIMETER, i+1 {i - is 0 based} );

    {10-22-2013 add support for security on columns}
    ACanCreateColumn:= TRUE;
    if Assigned( OnIQBeforeCreateHPickColumn ) then
       OnIQBeforeCreateHPickColumn( self, AFieldTrg, ACanCreateColumn );

    {Target Field is Created. Store the Header Name in VisiCols combobox and the field itself in the Objects[] array}
    if AFieldTrg.Visible and ACanCreateColumn then
    begin
       {Aug-07-03 - division vs warehouse}
       // IQMS.WebVcl.ResourceStrings.cTXT0000553 = 'Division';
       if ( Pos(IQMS.WebVcl.ResourceStrings.cTXT0000553, AFieldTrg.DisplayLabel ) > 0 ) then
          AFieldTrg.DisplayLabel:= CheckReplaceDivisionCaption( AFieldTrg.DisplayLabel ); {IQMS.Common.SysShare.pas}

       if System.StrUtils.ContainsText( AFieldTrg.DisplayLabel, 'EMAIL' ) then
          AFieldTrg.DisplayLabel:= IQMS.Common.SysShare.CheckReplaceEmailCaption( AFieldTrg.DisplayLabel );

       VisiCols.AddObject( PhysicalFieldName, AFieldTrg );

       {add support for user defined labels}
       if Assigned( OnIQCreateHPickColumn ) then
          TIQWebHPick( FIQHpick ).OnIQCreateHPickColumn( self, AFieldTrg );

       if (Grid <> NIL) then
       begin
         AColumn:= Grid.Columns.Add;
         with AColumn do
         begin
           FieldName    := AFieldTrg.FieldName;
           Title.Caption:= AFieldTrg.DisplayLabel;
           //Width        := AFieldTrg.DisplayWidth
         end;

         if Assigned( OnIQAfterCreateHPickColumn ) then
            TIQWebHPick( FIQHpick ).OnIQAfterCreateHPickColumn( self, Query, TUniDBGridColumn(AColumn) );
       end;

    end;  {if visible }

    if CompareText(AFieldTrg.FieldName, 'PK_HIDE') = 0 then
    begin
      PkHideColumn:= PhysicalFieldName;
      pnlPkHide.Visible:= TRUE and (Trim(PkHideColumn) > '');  {Oct-04-2004}

    end;

  end; {for}
end;

function TFrmPickListBase.ParseSQLPhysicalFieldName( cSrc, Delimeter:string; nToken:integer ):string;
var
  cTrg  :string;
  i,j   :integer;
  nCount:Integer;
begin
  // Example: arinvt.itemno as itemno, arcusto.company as company ...  Should result in 'arinvt.itemno' for i = 1 .
  nCount:= 0;
  result:= '';

  for j:= 1 to nToken do begin

    if Pos( Delimeter, cSrc ) > 0 then begin
       // Example: arinvt.itemno as itemno, arcusto.company as company
       i:= Pos( DELIMETER, cSrc );       // ' as '
       cTrg:= Copy( cSrc, 1, i-1 );      // 'arinvt.itemno'

       cSrc:= Copy( cSrc, i+1, 10000);   // 'itemno, arcusto.company as company'
       i:= Pos( ',', cSrc );
       if i = 0 then cSrc:= ''
                else cSrc:= Copy( cSrc, i+1, 10000);   // 'arcusto.company as company'
    end
    else
      begin
        // Example: arinvt.itemno, arcusto.company as company. Note that SubStr will not work - use AS for delimiting
        i:= Pos( ',' , cSrc );
        if i = 0 then begin                  // Last token?
           cTrg:= Copy( cSrc, 1, 10000);     // 'arinvt.itemno'
           cSrc:= '';
        end
        else begin
            cTrg:= Copy( cSrc, 1, i-1 );      // 'arinvt.itemno'
            cSrc:= Copy( cSrc, i+1, 10000 );  // ' arcusto.company as company'
          end;
      end;

    Inc(nCount);
  end;

  if nCount = nToken then
     Result:= StrTran( Trim( cTrg ), 'DISTINCT ', '' );
end;

procedure TFrmPickListBase.BuildSQLStatement;
var
  SortColumnName : string;
  SortColumnIndex: Integer;
  I              : Integer;
  AField         : TField;
  AEquationOperator: string;
begin
  if (Grid <> NIL) and (Grid is TUniDBGrid) then
     begin
       Grid.Color:= clBtnFace;
       Grid.Update;
     end;

  CloseQuery(Query);

  if IsUsingSubquery then
     AddSubqueryToSQL;

  Query.SQL.Clear;

  {Select (columns) }
  Query.SQL.Add( Format( 'SELECT %s', [SQLSelect] ));

  {From}
  Query.SQL.Add( Format('FROM %s', [ SQLFrom ] ));

  {Sorting Column}
  SortColumnIndex:= VisiCols.IndexOfObject( SortColumn );
  if (SortColumnIndex < 0) and (VisiCols.Count > 0) then
  begin
    SortColumnIndex:= 0;
    AField := TField( VisiCols.Objects[0] );
    SortColumn := AField;

  end;

  SortColumnName := VisiCols[SortColumnIndex];

  {Where}
  if SortColumnName > '' then
    begin
      case SortColumn.DataType of
        ftString :
          begin
            AEquationOperator:= 'LIKE';
            if ExactMatch then
               AEquationOperator:= '=';

            if not CaseInsensitive then
               Query.SQL.Add( Format('WHERE (NVL(%s, '' '') ' +
                 AEquationOperator + ' :param2_key)', [ SortColumnName ] ))
            else
               Query.SQL.Add( Format('WHERE (NLS_UPPER(NVL(%s, '' '')) ' +
                 AEquationOperator + ' NLS_UPPER(:param2_key))',
                 [ SortColumnName ] ));
          end;

        ftFloat, ftCurrency:
          begin
            // Query.SQL.Add( Format('WHERE ((%s is NULL) OR SIGN(%s - :param2_key) >= 0 OR (:param2_key is NULL))', [SortColumnName,SortColumnName] ));
            if not ExactMatch then
               Query.SQL.Add( Format('WHERE ((%s is NULL) OR SIGN(%s - :param2_key) >= 0 OR (:param2_key is NULL))', [SortColumnName,SortColumnName] ))
            else
               Query.SQL.Add( Format('WHERE (SIGN(%s - :param2_key) = 0)', [SortColumnName,SortColumnName] ))
          end;

        ftUnknown : ; {leave empty}

        ftDateTime:
          begin
            // Query.SQL.Add( Format('WHERE ( ( %s is NULL ) OR ( %s >= :param2_key ))', [SortColumnName,SortColumnName] ));
            if not ExactMatch then
               Query.SQL.Add( Format('WHERE ( ( %s is NULL ) OR ( %s >= :param2_key ))',
                 [SortColumnName,SortColumnName] ))
            else
               Query.SQL.Add( Format('WHERE ( %s = :param2_key )',
                 [SortColumnName,SortColumnName] ))
          end

      else
        begin
          // Query.SQL.Add( Format('WHERE ((%s is NULL) OR %s >= :param2_key OR (:param2_key is NULL))', [SortColumnName,SortColumnName] ));
          if not ExactMatch then
             Query.SQL.Add( Format('WHERE ((%s is NULL) OR %s >= :param2_key OR (:param2_key is NULL))',
               [SortColumnName,SortColumnName] ))
          else
             Query.SQL.Add( Format('WHERE (%s = :param2_key)',
               [SortColumnName] ))
        end;
      end; {case}
    end;


  if pnlPkHide.Visible then
     // Query.SQL.Add( Format(' and ( :param3_key = ''N'' or NVL(%s, ''N'') <> :param3_key)', [ PkHideColumn ] ));
     Query.SQL.Add( Format(' AND ( NVL(%s, ''N'') = :param3_key )', [ PkHideColumn ] ));

  // Param is used for the WaitForPrompt setting.  The param value is set
  // to 0, which allows the field names to appear but not data.  This is
  // required for the touch screen, which uses a TwwDBGrid, not a DBGrid.
  Query.SQL.Add('AND (1 = :param4_key)');

  if not Empty(SQLwhere) then
     begin
       //Query.SQL.Add( Format(' AND (%s)', [ SQLWhere ] ));
       Query.SQL.Add('AND (');
       Query.SQL.Add(SQLWhere);
       Query.SQL.Add(')');
     end;

  {Prepare SQL for Count. Do it before we evaluate Order By}
  QryCount.Close;
  QryCount.SQL.Assign( Query.SQL );
  QryCount.SQL.Insert( 0, 'SELECT count(*) AS the_count FROM ( ' ); QryCount.SQL.Add(')');

  {Raise a flag to re-evaluate QryCount filter during open}
  FQryCountIsChanged:= TRUE;

  {Order By}
  // Query.SQL.Add( Format('ORDER BY %s', [ SortColumnName ] ));


  Query.SQL.Add( CheckApplyUpperCaseToFormat('ORDER BY %s', SortColumnName, SortColumn ));
  for I:= 1 to SortCols.Count - 1 do
  begin
    SortColumnIndex:= VisiCols.IndexOfObject( SortCols[ I ]);
    SortColumnName := VisiCols[ SortColumnIndex ];
    // Query.SQL.Add( Format(', %s', [ SortColumnName ] ));
    Query.SQL.Add( CheckApplyUpperCaseToFormat(', %s', SortColumnName, TField(SortCols[ I ]) ));
  end;

  if not Empty(SQLOrderBy) then
     // Query.SQL.Add( Format(', %s', [ SQLOrderBy ] ));
     Query.SQL.Add( CheckApplyUpperCaseToFormat(', %s', SQLOrderBy ));

  if FDescOrd then
     Query.SQL.Add( 'DESC' );

  // Query.Prepare;  if I leave it in - I'll get out of cursors from Oracle. Weird.}
end;

function TFrmPickListBase.CheckApplyUpperCaseToFormat( AFmtExpr, AFmtParam: string; AField: TField = nil ): string;
begin
  // Check apply NLS_UPPER
  if CaseInsensitive and Assigned(AField) and  (AField.DataType = ftString) then
     AFmtParam:= Format('NLS_UPPER( %s )', [ AFmtParam ]);

  Result:= Format( AFmtExpr, [ AFmtParam ]);
end;

function TFrmPickListBase.GetCustomBtn1OnClick: TModifyProc;
begin
  Result:= TIQWebHPick( FIQHpick ).OnCustomBtn1Click;
end;

function TFrmPickListBase.GetExactMatch: Boolean;
begin
  if chkExactMatch.Visible then
     Result:= chkExactMatch.Checked;
end;

function TFrmPickListBase.GetField(i:Integer):TField;
begin
  result:= Query.Fields[i];
end;

function TFrmPickListBase.GetFieldByName(const AFieldName:string):TField;
begin
  result:= Query.FieldByName(AFieldName);
end;

procedure TFrmPickListBase.OpenSQL(AShowRecords: Boolean);
begin
  try
    Query.DisableControls;
    CloseQuery(Query);


    if (Grid <> NIL) and (Grid is TUniDBGrid) then
       begin
         Grid.Color:= clBtnFace;
         Grid.Update;
       end;

    {assign parameter}
    SetParams( Query, AShowRecords );
    CheckAssignParamsType( Query );
    FTimeIt.Start;
    Query.Open;
    FTimeIt.Stop;
//    IQRegFormRead(FIQHpick, [ wwFilterDialog1 ]);

    // 02-08-2010 support filter store/restore from registry
//    if wwFilterDialog1.FieldInfo.Count > 0 then
//       wwFilterDialog1.ApplyFilter;

 finally
    Query.EnableControls;
    if (Grid <> NIL) and (Grid is TUniDBGrid) then
       begin
         Grid.Color:= clWindow;
         Grid.Update;
       end;
    self.Caption:= TIQWebHPick( FIQHpick ).Title;
    UpdateFilterOnStatusBar;
 end;
end;

{OpenSQL}

procedure TFrmPickListBase.CheckAssignParamsType( AQuery: TFDQuery );
var
  i :integer;
  AParam: TFDParam;
begin
  for i := 0 to TFDQuery(FIQHpick).ParamCount - 1 do
  begin
    AParam := Query.Params.FindParam(TFDQuery(FIQHpick).Params[i].Name);
    if not Assigned(AParam) or (AParam = nil) then
      raise Exception.CreateFmt(
        'Application Error:  Parameter, %s, not found in the %s pick list',
        [TFDQuery(FIQHpick).Params[i].Name, TFDQuery(FIQHpick).Name]);

    AParam.DataType := TFDQuery(FIQHpick).Params[i].DataType;
  end;
end;

procedure TFrmPickListBase.UniFormReady(Sender: TObject);
var
  SortColIndex:Integer;
  I, J: Integer;
  ATokens:Integer;
begin
  {Buttons}
  SetButtons;

  Update;
  CloseQuery(Query);
//  Query.Close;

  {Assign values to SQLwhere and SQLselect}
  ParseQuery;

  {Create TFields, Populate VisiCols}
  CreateTFields;

  sbtnUser1.Glyph:= TIQWebHPick( FIQHpick ).UserBtn1Glyph;
  if not sbtnUser1.Glyph.Empty then
     begin
       PnlUser.Visible   := true;
       sbtnUser1.Hint    := TIQWebHPick( FIQHpick ).UserBtn1Hint;
       sbtnUser1.ShowHint:= sbtnUser1.Hint <> ''
     end
  else
     pnlUser.Visible := false;

  pnlSubquery.Visible:= IsUsingSubquery;
  if pnlSubquery.Visible then
  begin
    pnlSubquery.Left:= PnlSearchBtns.Left - pnlSubquery.Width + 1;
    UpdateSubqueryButtonImage;
    IQAssert( SubqueryFieldName > '',
              'Note to programmer: ''SubqueryFieldName'' must be assigned.'#13+
              'This field is used to join gtt_picklist_subquery and the main picklist query.'#13#13+
              'SubqueryFieldName example: ''arinvt.id''.'#13+
              'The system will then generate '' and arinvt.id = gtt_picklist_subquery.id''' );
  end;

  btnCustom1.Glyph:= TIQWebHPick( FIQHpick ).CustomBtn1Glyph;
  if not btnCustom1.Glyph.Empty then
     begin
       btnCustom1.Caption:= TIQWebHPick( FIQHpick ).CustomBtn1Caption;
       btnCustom1.Hint   := TIQWebHPick( FIQHpick ).CustomBtn1Hint;
       btnCustom1.ShowHint:= btnCustom1.Hint <> ''
     end
  else
     btnCustom1.Visible := False;

  {Start sort with the first column}

  if not IQRegStringScalarRead( FIQHpick, 'SortColumns', FSortCols) then
    FSortCols := '';

  if not IQRegIntegerScalarRead( FIQHpick, 'SortColIndex', SortColIndex ) or (SortColIndex < 0) then
    SortColIndex:= 0;
  if SortColIndex > VisiCols.Count - 1 then
    SortColIndex:= 0;
  SortColumn:= TField( VisiCols.Objects[ SortColIndex ]);

  if FSortCols <> '' then
  begin
    SortCols.Clear;
    ATokens := NumToken(FSortCols, ',');
    for J := 1 to ATokens do
      if Query.FindField(GetToken(FSortCols, ',', J)) <> nil then
         SortCols.Add(Query.FieldByName(GetToken(FSortCols, ',', J)));
  end;

  IQRegBooleanScalarRead( FIQHpick, 'DescendingOrder', FDescOrd );

  {Build Select Statement and Assign Headings}
  BuildSQLStatement;

  {Restore form settings}
  if not TIQWebHPick(FIQHpick).SkipRestoreRegistry then
  begin
    IQRegFormRead(FIQHpick, [Search]);
    ReadGrid;
  end;

  {Feb-11-04 Make sure wwFilterDialog1 assigned only visiblle fields }
//  wwFilterDialog1.SelectedFields.Clear;
  for I:= 0 to Query.FieldCount - 1 do with Query.Fields[ I ] do
    if Visible then
       ;//wwFilterDialog1.SelectedFields.Add( FieldName ) ;

  {02-10-2010 restore the wwFilterDialog1 from registry}
  if not TIQWebHPick(FIQHpick).SkipRestoreRegistry then
  begin
//    IQRegFormRead(FIQHpick, [ wwFilterDialog1 ]);
//    if (wwFilterDialog1.FieldInfo.Count > 0) then
//       UpdateFilterOnStatusBar;
  end;

  OpenSQL(not WaitForPrompt);

  {Get rid of blank pixels at the bottom if you can}
//  if (Grid <> NIL) and (Grid is TUniDBGrid) then
//  with TDrawGrid(Grid) do
//    if (ClientHeight - GridHeight) in [ 1..DefaultRowHeight ] then
//       self.Height:= self.Height - (ClientHeight - GridHeight);

  {highlight search}
//  with Search do
//    SelLength:= Length( Text );

  // if not TIQHpick(FIQHpick).SkipRestoreRegistry then
  //    IQRegFormRead( FIQHpick, [chkCaseInsensitive]);

  ForceForegroundWindowB( self.Handle );  {IQScreen.pas}

  // Additional "after show" actions called by descendents
  AfterShow;
end;

procedure TFrmPickListBase.UpdateFilterOnStatusBar;

   function GetFilterFields: string;
   var
     I         : Integer;
//     AFieldInfo: TwwFieldInfo;
   begin
     Result:= '';
//     if wwFilterDialog1.FieldInfo.Count = 0 then EXIT;
//
//     for I:= 0 to wwFilterDialog1.FieldInfo.Count - 1 do
//     begin
//       AFieldInfo:= TwwFieldInfo(wwFilterDialog1.FieldInfo.Items[ I ]);
//       if Result = '' then
//          Result:= AFieldInfo.DisplayLabel
//       else
//          Result:= Format( '%s, %s', [ Result, AFieldInfo.DisplayLabel ]);
//     end;
   end;

   function CheckChangeDivisionToWarehouse( S: string ): string;
   begin
     if Is_Whs_Division then
       // IQMS.WebVcl.ResourceStrings.cTXT0000556 = 'Warehouse';
        Result:= StrTran( S, 'DIVISION_ID', IQMS.WebVcl.ResourceStrings.cTXT0000556 )
     else
        Result:= S;
   end;

begin
  // remove filter speedbutton
//  sbtnRemoveFilter.Enabled:= wwFilterDialog1.FieldInfo.Count > 0;

  // filter speedbutton glyph
  sbtnFilter.Glyph    := nil;
//  sbtnFilter.NumGlyphs:= 1;
//  if wwFilterDialog1.FieldInfo.Count > 0 then
//     ImageListFilter.GetBitmap(1, sbtnFilter.Glyph)
//  else
//     ImageListFilter.GetBitmap(0, sbtnFilter.Glyph);

//  StatusBar1.Visible:= (Query.Filtered and (Query.Filter <> '')) or (wwFilterDialog1.FieldInfo.Count > 0);
  if not StatusBar1.Visible then
     EXIT;

  //with StatusBar1 do
  //begin
    // make sure it is at the bottom
    StatusBar1.Top := Self.Height;

    {DB Filter}
    if (Query.Filtered and (Query.Filter <> '')) then
       begin
         // IQMS.WebVcl.ResourceStrings.cTXT0000557 = 'Filter: %s';
//         IQMS.Common.Controls.SetStatus(StatusBar1,
//           CheckChangeDivisionToWarehouse(
//             Format(IQMS.WebVcl.ResourceStrings.cTXT0000557, [Query.Filter])),
//             0);
//         IQMS.Common.Controls.AutoSizeStatusBarPanel(StatusBar1, 0);
//         Panels[ 0 ].Text := CheckChangeDivisionToWarehouse(
//           Format(IQMS.WebVcl.ResourceStrings.cTXT0000557, [Query.Filter]));
//         StatusBar1.Panels[0].Width:=
//           StatusBar1.Canvas.TextWidth(StatusBar1.Panels[0].Text) + 25;
       end
    else
       begin
//         IQMS.Common.Controls.SetStatus(StatusBar1, '', 0);
         //Panels[ 0 ].Text := '';
         StatusBar1.Panels[0].Width:= 75;
       end;


    {Local Filter}
//    if wwFilterDialog1.FieldInfo.Count > 0 then
//       IQMS.WebVcl.ResourceStrings.cTXT0000558 = 'Advanced Search Filter: %s';
//      IQMS.Common.Controls.SetStatus(StatusBar1,
//        CheckChangeDivisionToWarehouse(
//          Format(IQMS.WebVcl.ResourceStrings.cTXT0000558, [GetFilterFields])),
//        1)
//       Panels[ 1 ].Text:= CheckChangeDivisionToWarehouse(
//         Format(IQMS.WebVcl.ResourceStrings.cTXT0000558, [GetFilterFields]))
//    else
//      IQMS.Common.Controls.SetStatus(StatusBar1, '', 1);
//       Panels[ 1 ].Text := '';
  //end;
end;

function TFrmPickListBase.GetResultRecordCount:Integer;
var
  S: string;
  I:Integer;
begin
   S:= UpperCase( Query.SQL.Text );
   I:= Pos( 'FROM ', S );
   S:= 'SELECT COUNT(*) ' + Copy(S, I, Length( S ));
   with TFDQuery.Create(self) do
   try
     ConnectionName := 'IQFD';
     SQL.Add(S);
     Params.Assign( Query.Params );
     Open;
     Result:= Fields[ 0 ].asInteger;
   finally
     Free;
   end;
end;

function TFrmPickListBase.GetFieldsCount: Integer;
begin
  result:= Query.FieldCount;
end;

function TFrmPickListBase.GetHPickSubqueryHdr_ID: Integer;
begin
  Result:= TIQWebHPick(self.FIQHpick).HPickSubqueryHdr_ID;
end;

function TFrmPickListBase.GetIQBeforeCreateHPickColumn: TIQBeforeCreateHPickColumn;
begin
  Result:= TIQWebHPick( FIQHpick ).OnIQBeforeCreateHPickColumn;
end;

function TFrmPickListBase.GetIsUsingSubquery: Boolean;
begin
  Result:= TIQWebHPick(FIQHpick).SubqueryModuleName <> '';
end;

function TFrmPickListBase.GetOnIQCalcSearchText: TIQCalcSearchText;
begin
  Result:= TIQWebHPick( FIQHpick ).OnIQCalcSearchText;
end;

procedure TFrmPickListBase.BtnModifyClick(Sender: TObject);
var
  Action: TModalResult;
  AResultValue: Variant;
begin
  Action:= mrNone;
  if Assigned(OnModify) then
  begin
     TIQWebHPick( FIQHpick ).NewResultValue:= FALSE;                  {for "New" button}
     TIQWebHPick( FIQHpick ).DoModify( self, Action, AResultValue );   {I don't call directly OnModify because I need to do some processing prior to the call}
     ResultValue:= AResultValue;
  end;

  TIQWebHPick( FIQHpick ).NewResultValue:= Action = mrOK;

  if Action = mrOK then
     ModalResult:= mrOK
  else if Action = mrABORT then
     ModalResult:= mrCancel
  else
     OpenSQL;
end;

procedure TFrmPickListBase.SetParams( AQuery: TFDQuery; AShowRecords: Boolean );
var
  ASearchText: string;
begin
  ASearchText := Search.Text;

  if Assigned( OnIQCalcSearchText ) then
     OnIQCalcSearchText( self, SortColumn, ASearchText );

  try
    if (AQuery.FindParam('param2_key') <> nil) then
      case SortColumn.DataType of
        ftUnknown  : ;
        ftString, ftMemo, ftFmtMemo, ftFixedChar, ftWideString, ftFixedWideChar,
          ftWideMemo, ftGuid:
          begin
            AQuery.FindParam('param2_key').DataType := ftString;
            AQuery.ParamByName('param2_key').ParamType := ptInput;
            if not ExactMatch then
              AQuery.ParamByName('param2_key').AsString:= ASearchText + '%'
            else
              AQuery.ParamByName('param2_key').AsString:= ASearchText;
          end;

        ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint, ftLongWord,
          ftShortint, ftByte, ftSingle, ftFloat, ftCurrency, ftBCD, ftFMTBcd,
          ftExtended:
          try
            AQuery.ParamByName('param2_key').DataType:= ftFloat;
            AQuery.ParamByName('param2_key').ParamType := ptInput;
            if ASearchText > '' then
              AQuery.ParamByName('param2_key').Value := StrToFloat(ASearchText)
            else
              AQuery.ParamByName('param2_key').Clear;
          except
             AQuery.ParamByName('param2_key').Clear;
          end;

        ftDate, ftTime, ftDateTime, ftTimeStamp, ftOraTimeStamp:
          try
            AQuery.ParamByName('param2_key').DataType:= ftDateTime;
            AQuery.ParamByName('param2_key').ParamType := ptInput;
            if ASearchText > '' then
              AQuery.ParamByName('param2_key').AsDateTime:= StrToDateTime(ASearchText)
            else
              AQuery.ParamByName('param2_key').AsDateTime := IQStrToDateTime('01/01/1000');
          except
            AQuery.ParamByName('param2_key').AsDateTime:= IQStrToDateTime('01/01/1000');
          end;
      end;  // end case

    if pnlPkHide.Visible and (AQuery.FindParam('param3_key') <> nil) then
      begin
        AQuery.ParamByName('param3_key').DataType := ftString;
        AQuery.ParamByName('param3_key').ParamType := ptInput;
        AQuery.ParamByName('param3_key').AsString:= IIf( sbtnToggleHide.Down, 'Y', 'N' );
      end;

    // Set the param which allows data to be displayed
    if (AQuery.FindParam('param4_key') <> nil) then
      begin
        AQuery.ParamByName('param4_key').DataType := ftInteger;
        AQuery.ParamByName('param4_key').ParamType := ptInput;
        AQuery.ParamByName('param4_key').AsInteger := INTEGER(AShowRecords);
      end;

  except
  end;
end;

procedure TFrmPickListBase.SetButtons;
const
  c_gap_between: Integer = 4;
var
  i, AWidth: Integer;
begin
  // 10/08/2014 Resize check boxees first.  This allows FlowPanel1 to adjust.
//  IQMS.Common.Controls.ResizeCheckBoxes(Self, FlowPanel1);
//  IQMS.Common.Controls.ResizeCheckBoxes(Self, pnlPropagate);

  // 10/08/2014 Ensures the search edit is placed correctly.  This is
  // especially important for the touch-screen version.
  // Same left, so that everything lines up
  Search.Left := 0;
  // Center the "Search" edit box in its parent
  Search.Width := pnlSearchTop.ClientWidth - (Search.Left * 2);
  // Adjust the parent panel height because the height of the "Search"
  // edit box will automatically adjust for font.
  pnlSearchTop.Height := Search.Height + 4;

  // Adjust main parent panel (holds all of the top controls) based on
  // maximum control heights.  This ensures everything will be visible,
  // and nothing cut off at the bottom.
  PnlTopControls.Height := Max(PnlTopControls.Height, pnlSearchTop.Height +
    Max(pnlSearchClientBottom.Height, FlowPanel1.Height) + 4);

  // Set the top of the controls to the same top as the Search edit.
  // This ensures everything lines up along the top and looks consistent.
  sbtnToggleHide.Top := Search.Top;
  sbtnUser1.Top := Search.Top;
  sbtnSubquery.Top := Search.Top;
  for i := 0 to PnlSearchBtns.ControlCount - 1 do
    if (PnlSearchBtns.Controls[i] is TUniSpeedButton) then
      TUniSpeedButton(PnlSearchBtns.Controls[i]).Top := Search.Top
    else if (PnlSearchBtns.Controls[i] is TUniPanel) then
      TUniPanel(PnlSearchBtns.Controls[i]).Top := Search.Top;

  // 10/08/2014 Stack up the search Vcl.Controls.  It's possible the
  // button sizes have been increased, if this is for touch-screen.
  IQMS.Common.Controls.StackUpControlsLeft(0, 0, [btnLaunch, sbtnSort, bvlSortCriteriaDropDown,
    sbtnSortCriteriaDropDown, sbtnFilter, bvlAdvFilterDropDown, sbtnAdvFilterDropDown,
    sbtnRemoveFilter]);

  // For the buttons at the top right, set the parent panel size,
  // based on the total button sizes.  Again, the button sizes
  // may have been increased for touch-screen.
  AWidth := 0;
  for i := 0 to PnlSearchBtns.ControlCount - 1 do
    if (PnlSearchBtns.Controls[i] is TUniSpeedButton) then
      Inc(AWidth, TUniSpeedButton(PnlSearchBtns.Controls[i]).Width)
    else if (PnlSearchBtns.Controls[i] is TUniPanel) then
      Inc(AWidth, TUniPanel(PnlSearchBtns.Controls[i]).Width);
  PnlSearchBtns.Width := AWidth + 8;

  // Modal buttons
  // Adjust the "New" button
  BtnModify.Visible:= Assigned(OnModify);
  BtnModify.Enabled:= Assigned(OnModify);
  // Adjust the "Custom" button
  btnCustom1.Visible:= Assigned(OnCustomBtn1Click);
  btnCustom1.Enabled:= btnCustom1.Visible;
  // Stack up the modal buttons
  IQMS.Common.Controls.StackUpControlsLeft(0, c_gap_between, [ BtnSelect, BtnCancel,
    btnModify, btnCustom1 ]);
  // Get the parent panel width
  AWidth:= btnSelect.Width + btnCancel.Width;
  if BtnModify.Visible then
     AWidth:= AWidth + c_gap_between + btnModify.Width;
  if btnCustom1.Visible then
     AWidth:= AWidth + c_gap_between + btnCustom1.Width;
  // Set the width of the parent panel of the modal buttons
  pnlButtons.Width := AWidth + (c_gap_between * 2) + 2;
end;

procedure TFrmPickListBase.SetHPickSubqueryHdr_ID(const Value: Integer);
begin
  TIQWebHPick(self.FIQHpick).HPickSubqueryHdr_ID:= Value;
  UpdateSubqueryButtonImage;
end;

procedure TFrmPickListBase.UpdateSubqueryButtonImage;
begin
  if HPickSubqueryHdr_ID > 0 then
     IQMS.Common.Graphics.LoadButtonImageFromImageList( sbtnSubquery, ImageListFilter, 3 )
  else if HPickSubqueryHdr_ID = 0 then
     IQMS.Common.Graphics.LoadButtonImageFromImageList( sbtnSubquery, ImageListFilter, 2 );
end;

procedure TFrmPickListBase.btnCustom1Click(Sender: TObject);
var
  Action: TModalResult;
  AResultValue: Variant;
begin
  Action:= mrNone;
  if Assigned(OnCustomBtn1Click) then
  begin
     TIQWebHPick( FIQHpick ).NewResultValue:= FALSE;
     TIQWebHPick( FIQHpick ).DoCustomBtn1Click( self, Action, AResultValue );
     ResultValue:= AResultValue;
  end;

  TIQWebHPick( FIQHpick ).NewResultValue:= Action = mrOK;

  if Action = mrOK then
     ModalResult:= mrOK
  else if Action = mrABORT then
     ModalResult:= mrCancel
  else
     OpenSQL;
end;

procedure TFrmPickListBase.btnLaunchClick(Sender: TObject);
begin
  OpenSQL;
  if (Grid <> NIL) then
     Grid.SetFocus;
end;

procedure TFrmPickListBase.SearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key in [VK_DOWN, VK_UP, VK_PRIOR, VK_NEXT]) and
     (Grid <> NIL) then
     Grid.SetFocus
  else if Key = VK_RETURN then
  begin
     Key:= 0;
     btnLaunch.Click;
  end
  else if Key = VK_F3 then
     PopUpAvailableSortByMenu( Key )
//  else if Key = VK_F1 then
//     ShowID( Key, Shift, SrcQuery.DataSet )  {IQmisc}
  else if Key = VK_F1 then
     ShowQueryInfo(Key, Shift, Query, FTimeIt)  {QryInfo}
  else
    IQMS.Common.DebugSQL.CheckShowDebugSQL(Key, Shift);
end;

procedure TFrmPickListBase.AvailableSortByPopup(Sender: TObject);
// On Menu PopUp - create all menu items!
var
  NewItem: TUniMenuItem;
  i      : Integer;
begin
  if AvailableSortBy.Items.Count = 3 then
    for i:= 0 to VisiCols.Count - 1 do
    begin
      NewItem:= TUniMenuItem.Create(Self);
      NewItem.Caption:= TField( VisiCols.Objects[i] ).DisplayLabel;
      NewItem.RadioItem:= TRUE;
      NewItem.Checked  := FALSE;
      NewItem.OnClick  := SortByChange;
      AvailableSortBy.Items.Insert(I, NewItem);
    end;

  AvailableSortBy.Items[ VisiCols.IndexOfObject( SortColumn ) ].Checked:= TRUE;
end;

procedure TFrmPickListBase.SortByChange(Sender: TObject);
// assigned to on click of the popup menu
begin
  Search.OnChange:= NIL;

  {Update SortColumn}
  if Sender is TUniMenuItem then
     begin
        AvailableSortBy.Items[ VisiCols.IndexOfObject( SortColumn ) ].Checked:= FALSE;
        SortColumn:= TField( VisiCols.Objects[ (Sender as TUniMenuItem).MenuIndex ]);
        // FDescOrd  := FALSE;
        // Search.Clear;   // 06-12-2009 SCR 00215
     end
  else if Sender is TField then
     begin
       SortColumn:= TField( Sender );
        // Search.Clear;   // 06-12-2009 SCR 00215
     end
  else
     begin
       {case insensitive}
     end;

  try
    Query.DisableControls;
    BuildSQLStatement;
    OpenSQL(not WaitForPrompt);
  finally
    Query.EnableControls;
    Search.SetFocus;
  end
end;

procedure TFrmPickListBase.BtnSelectClick(Sender: TObject);
begin
  with Query do
    if not (Eof and Bof) then ModalResult:= mrOK
                         else ModalResult:= mrCancel;
end;

procedure TFrmPickListBase.sbtnFoundClick(Sender: TObject);
var
  S: string;
begin
  try
    S:= Format( IQMS.WebVcl.ResourceStrings.cTXT0000042 {'Found: %d'}, [ GetResultRecordCount ]);
  except
    S:= 'N/A';
  end;
  IQConfirm(Format( IQMS.WebVcl.ResourceStrings.cTXT0000043 {'Row Count: %s'}, [ S ]));
end;

procedure TFrmPickListBase.PopUpAvailableSortByMenu( var Key: Word );
var
  P: TPoint;
begin
  Key:= 0;

  {Grid coordinates relative to screen}
  P.x:= Search.Left;
  P.y:= Search.Top + Search.Height - 1;
  P:= self.ClientToScreen( P );

  {Popup it up!}
  AvailableSortBy.Popup( P.x, P.Y );
end;

procedure TFrmPickListBase.DoOnMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
begin
  FOnColumnFlag:= TRUE;
end;

procedure TFrmPickListBase.SetSortColumn( AValue: TField );
begin
  SortCols.Clear;
  SortCols.Insert( 0, AValue );

  if Assigned( TIQWebHPick( FIQHpick ).AssociatedDataSet) then
  begin
    chkbPropagateSort.Enabled:= (TIQWebHPick( FIQHpick ).AssociatedDataSet.FindField( AValue.FieldName ) <> nil)
                                 and
                                (TIQWebHPick( FIQHpick ).AssociatedDataSet.FieldByName( AValue.FieldName ).FieldKind = fkData);
    if not chkbPropagateSort.Enabled then
       chkbPropagateSort.Checked:= FALSE;
  end;
end;

function TFrmPickListBase.GetSortColumn: TField;
begin
  if Assigned(SortCols) and (SortCols.Count > 0) then
     Result:= TField( SortCols[ 0 ])
  else
     Result:= NIL;
end;

function TFrmPickListBase.GetSubQueryBatch: Integer;
begin
  Result:= TIQWebHPick(FIQHpick).SubqueryBatch;
end;

function TFrmPickListBase.GetSubqueryFieldName: string;
begin
  Result:= TIQWebHPick(FIQHpick).SubqueryFieldName;
end;

procedure TFrmPickListBase.DoOnShowHint( var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo );
var
  I: Integer;
begin
  with HintInfo do
  begin
    if HintControl = sbtnToggleHide then
      begin
        if sbtnToggleHide.Down then
           HintStr:= IQMS.WebVcl.ResourceStrings.cTXT0000044 // 'Showing inactive only.'#13'Click to toggle.'
        else
           HintStr:= IQMS.WebVcl.ResourceStrings.cTXT0000045 // 'Showing active only.'#13'Click to toggle.'
      end
    else if HintControl = sbtnSort then
      begin
         HintStr:= IQMS.WebVcl.ResourceStrings.cTXT0000046; // 'Click to change sort. '#13'Current sort: '#13
         for I:= 0 to SortCols.Count - 1 do
           HintStr:= HintStr + '   ' + TField(SortCols[ I ]).DisplayLabel + #13;
      end
    else if HintControl = StatusBar1 then
      begin
         if (StatusBar1.Panels[ 0 ].Text <> '') and (StatusBar1.Panels[ 1 ].Text <> '') then
           HintStr:= StatusBar1.Panels[ 0 ].Text +#13#10 + StatusBar1.Panels[ 1 ].Text
         else if (StatusBar1.Panels[ 0 ].Text <> '') then
           HintStr:= StatusBar1.Panels[ 0 ].Text
         else if (StatusBar1.Panels[ 1 ].Text <> '') then
           HintStr:= StatusBar1.Panels[ 1 ].Text
         else
           HintStr:= '';
      end
    else if HintControl = sbtnSubquery then
      begin
         if HPickSubqueryHdr_ID = 0 then
            HintStr:= IQMS.WebVcl.ResourceStrings.cTXT0000492          //  'Component Where Used Filter: Off'#13'Click to Select Filter'
         else
            HintStr:= Format(IQMS.WebVcl.ResourceStrings.cTXT0000493,  // 'Component Where Used Filter: '#13'%s';
                             [ SelectValueByID('descrip', 'hpick_subquery_hdr', HPickSubqueryHdr_ID)]);
      end;
  end;
end;

procedure TFrmPickListBase.sbtnSortClick(Sender: TObject);
begin
  if GetSortFields( Query, SortCols ) then  {IQMS.Common.SortFields.pas}
     DoExecuteSort;
end;

procedure TFrmPickListBase.DoExecuteSort;
begin
  SortByChange( SortCols );
  FDescOrd:= FALSE;
end;

procedure TFrmPickListBase.sbtnFilterClick(Sender: TObject);
begin
  if Query.State = dsInactive then
     btnLaunch.Click;

//  if wwFilterDialog1.Execute then
//  begin
//    {if local filter cleared out it takes away the dataset.filter too - reinstate it here}
//    if (wwFilterDialog1.FieldInfo.Count = 0) then
//    begin
//      Query.Filtered:= TFDQuery(FIQHpick).Filtered;
//      OpenSQL;
//    end;
//
//    {update status bar}
//    UpdateFilterOnStatusBar;
//  end;

  {reset sql hour glass that stayed on if I opened the query before executing the filter dlg}
  Screen.Cursor:= crDefault;
end;

function TFrmPickListBase.GetOnIQAfterCreateHPickColumn: TIQAfterCreateHPickColumn;
begin
  Result:= TIQWebHPick( FIQHpick ).OnIQAfterCreateHPickColumn;
end;

function TFrmPickListBase.GetOnIQCreateHPickColumn: TIQCreateHPickColumn;
begin
  // TCreateHPickColumn = procedure( Sender: TObject; AField: TField ) of object;
  Result:= TIQWebHPick( FIQHpick ).OnIQCreateHPickColumn;
end;

procedure TFrmPickListBase.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  i: SmallInt;
begin
  if Msg.message = WM_MOUSEWHEEL then
  begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    i := HiWord(Msg.wParam) ;
    if i > 0 then
      Msg.wParam := VK_UP
    else
      Msg.wParam := VK_DOWN;

    Handled := False;
  end;
end;

procedure TFrmPickListBase.chkCaseInsensitiveClick(Sender: TObject);
begin
  {this will trigger rebuild of the SQL}
  if SortColumn <> nil then
     SortByChange( nil );
end;

procedure TFrmPickListBase.chkExactMatchClick(Sender: TObject);
begin
  {this will trigger rebuild of the SQL}
  if SortColumn <> nil then
     SortByChange( nil );
end;

function TFrmPickListBase.Grid: TUniDBGrid;
begin
  Result := NIL;
end;

procedure TFrmPickListBase.ReadGrid;
begin
  if (Grid <> NIL) then
     IQRegFormRead( FIQHpick, [Grid]); //IQMS.Common.RegFrm.pas
end;

procedure TFrmPickListBase.WriteGrid;
begin
  if (Grid <> NIL) then
     IQRegFormWrite( FIQHpick, [Grid]);
end;

//procedure TFrmPickListBase.wwFilterDialog1InitDialog(Dialog: TwwFilterDlg);
//begin
//  IQMS.Common.Controls.AlignClientWWFilterDialogCriteria( Dialog );
//end;

function TFrmPickListBase.PropagageSort: Boolean;
begin
  Result := chkbPropagateSort.Checked;
end;

function TFrmPickListBase.PropagageScope: Boolean;
begin
  Result := chkbPropagateScope.Checked;
end;

procedure TFrmPickListBase.QryCountBeforeOpen(DataSet: TDataSet);
var
  S: string;
begin
  {if BeforeOpen is assigned on the main query - run it on the QryCount}
  if Assigned(Query.BeforeOpen) then
     Query.BeforeOpen( DataSet);

  {Instead of applying the filter which is impossible anyways - add it to the sql}
  if Query.Filtered and (Query.Filter > '') and FQryCountIsChanged then
  begin
    QryCount.Filter:= '';
    QryCount.Filtered:= FALSE;

    {Add filter expression to QryCount}
    S:= StringReplace( Query.Filter, ' <> NULL', ' IS NOT NULL ', [rfReplaceAll, rfIgnoreCase]);
    S:= StringReplace( S,            ' = NULL',  ' IS NULL ', [rfReplaceAll, rfIgnoreCase]);
    QryCount.SQL.Add( Format( 'WHERE (%s)', [ S ]));

    FQryCountIsChanged:= FALSE;
  end;
end;

procedure TFrmPickListBase.sbtnUser1Click(Sender: TObject);
var
  Action: TModalResult;
  AResultValue: Variant;
begin
  Action:= mrNone;
  if Assigned(OnUserBtn1Click) then
  begin
     TIQWebHPick( FIQHpick ).NewResultValue:= FALSE;
     TIQWebHPick( FIQHpick ).DoUserBtn1Click( self, Action, AResultValue );
     ResultValue:= AResultValue;
  end;

  TIQWebHPick( FIQHpick ).NewResultValue:= Action = mrOK;

  if Action = mrOK then
     ModalResult:= mrOK
  else if Action = mrABORT then
     ModalResult:= mrCancel
  else if Action = mrIgnore then
     // 02-21-2015 stay in the picklist, do not refresh the query not to lose the record position.
     // See PkSelectionCriteriaUserBtn1Click in Repdef.pas
     ModalResult:= mrNone
  else
     OpenSQL;
end;

function TFrmPickListBase.GetUserBtn1OnClick: TModifyProc;
begin
  Result:= TIQWebHPick( FIQHpick ).OnUserBtn1Click;
end;

procedure TFrmPickListBase.sbtnRemoveFilterClick(Sender: TObject);
begin
  try
//    wwFilterDialog1.ClearFilter;
//    wwFilterDialog1.ApplyFilter;
  finally
    { 06-18-2013 fix ww clearing filter issue:
      EIQ-330: Picklists - Showing items from other eplants if filter is set and cleared }
    Query.Filtered:= FIsMainQueryFiltered;
  end;
  UpdateFilterOnStatusBar;
end;

procedure TFrmPickListBase.AddLegendImages( AValues: array of Variant );
begin
  IQMS.Common.Controls.CreateLegendOn( pnlCustomUse, AValues );
end;

procedure TFrmPickListBase.CloseQuery(AQry:TFDQuery);
var
  AFiltered: Boolean;
begin
    // 03-20-2012 when wwFilterDialog1 is assigned date range it threw '0.0 is not valid timestamp' on query closing
  AFiltered:= AQry.Filtered;
  AQry.Filtered:= FALSE;
  try
    AQry.Close;
  finally
    AQry.Filtered:= AFiltered;
  end;
end;

function TFrmPickListBase.GetWaitForPrompt: Boolean;
begin
  Result:= FPKList_Wait_Prompt;
  if Result then
     EXIT;

  if chkWaitForPrompt.Visible then
     Result:= chkWaitForPrompt.Checked;
end;

function TFrmPickListBase.GetCaseInsensitive: Boolean;
begin
  Result:= FPkList_CaseInsensitive;
  if Result then
     EXIT;

  if chkCaseInsensitive.Visible then
     Result:= chkCaseInsensitive.Checked;
end;

procedure TFrmPickListBase.sbtnAdvFilterDropDownClick(Sender: TObject);
var
  X,Y : Integer;
begin
  // Get the coordinates for the popup form
  X:= ( sbtnAdvFilterDropDown.ClientOrigin.x ) + sbtnAdvFilterDropDown.Width;
  Y:= ( sbtnAdvFilterDropDown.ClientOrigin.y ) + sbtnAdvFilterDropDown.Height + 2;

//  with TFrmHPickFilterPickList.Create( self.FIQHpick, wwFilterDialog1, 'AdvancedFilterList' ) do   // IQMS.WebVcl.HPickFilterPickList.pas
  try
    Top := Y;
    Left:= X - Width;
    if ShowModal = mrOK then
       UpdateFilterOnStatusBar;
  finally
    Free;
  end;
end;

procedure TFrmPickListBase.sbtnSortCriteriaDropDownClick(Sender: TObject);
var
  X,Y : Integer;
begin
  // Get the coordinates for the popup form
  X:= ( sbtnSortCriteriaDropDown.ClientOrigin.x ) + sbtnSortCriteriaDropDown.Width;
  Y:= ( sbtnSortCriteriaDropDown.ClientOrigin.y ) + sbtnSortCriteriaDropDown.Height + 2;

  with TFrmHPickSortCriteriaPickList.Create( self, self.FIQHpick, SortCols, 'SortCriteriaList' ) do   // IQMS.WebVcl.HPickSortCriteriaPickList.pas
  try
    Top := Y;
    Left:= X - Width;
    if ShowModal = mrOK then
       DoExecuteSort;
  finally
    Free;
  end;
end;

function TFrmPickListBase.IsSubqueryEmpty: Boolean;
begin
  Result:= SelectValueFmtAsFloat('select count(*) from gtt_picklist_subquery where batch = %d and rownum < 2', [ SubqueryBatch ]) = 0;
end;

procedure TFrmPickListBase.AddSubqueryToSQL;
var
  I: Integer;
begin
  if not IsUsingSubquery then
     EXIT;

  // prepare SQLFrom to end with HPICK_SUBQUERY_FROM_START
  I:= Pos( HPICK_SUBQUERY_FROM_START, SQLFrom );
  if I = 0 then
     SQLFrom:= SQLFrom + ' ' + HPICK_SUBQUERY_FROM_START
  else
     SQLFrom:= Copy(SQLFrom, 1, I + Length(HPICK_SUBQUERY_FROM_START));

  // prepare SQLWhere to end with HPICK_SUBQUERY_FROM_START
  I:= Pos( HPICK_SUBQUERY_WHERE_START, SQLWhere );
  if I = 0 then
     SQLWhere:= SQLWhere + ' ' + HPICK_SUBQUERY_WHERE_START
  else
     SQLWhere:= Copy(SQLWhere, 1, I + Length(HPICK_SUBQUERY_WHERE_START));

  // now check and add (select id from gtt_picklist_subquery ...)
  // if not IsSubQueryEmpty then
  if self.HPickSubqueryHdr_ID > 0 then
  begin
     SQLFrom:= Format( '%s , (select id from gtt_picklist_subquery where batch = %d) gtt_picklist_subquery ',
                       [ SQLFrom,
                         SubqueryBatch ]);

     SQLWhere:= Format( '%s  and (%s = gtt_picklist_subquery.id) ',
                        [ SQLWhere,
                          SubqueryFieldName ]);
  end;
end;

procedure TFrmPickListBase.sbtnSubqueryClick(Sender: TObject);
var
  X,Y : Integer;
begin
  // Get the coordinates for the popup form
  X:= ( sbtnSubquery.ClientOrigin.x ) + sbtnSubquery.Width;
  Y:= ( sbtnSubquery.ClientOrigin.y ) + sbtnSubquery.Height + 2;

  // popup the form
  with TFrmHPickSubquery.Create(TIQWebHPick(FIQHpick).SubqueryModuleName ) do   // IQMS.WebVcl.HPickSubquery.pas
  try
    Top := Y;
    Left:= X - Width;
    if ShowModal = mrOK then
    begin
       self.HPickSubqueryHdr_ID:= ResultValue;  // this will populate the gtt_picklist_subquery- see IQMS.WebVcl.Hpick.pas
       SortByChange( nil );
    end;
  finally
    Free;
  end;
end;

function TFrmPickListBase.GetMultiSelect: Boolean;
begin
  Result := dgMultiSelect in Grid.Options;
end;

procedure TFrmPickListBase.SetMultiSelect(const Value: Boolean);
begin
  if Value then
    Grid.Options := Grid.Options + [dgMultiSelect]
  else
    Grid.Options := Grid.Options - [dgMultiSelect];
end;

end.
