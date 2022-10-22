unit IQMS.Common.Usr_Stru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniDBGrid,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmUsr_Define_Stru = class(TUniForm)
    SrcUD_Cols: TDataSource;
    TblUD_Cols: TFDQuery;
    TblUD_ColsID: TBCDField;
    TblUD_ColsUD_TABLES_ID: TBCDField;
    TblUD_ColsCOL_NAME: TStringField;
    TblUD_ColsCOL_TYPE: TStringField;
    TblUD_ColsSEQ: TBCDField;
    TblUD_ColsCOL_LABEL: TStringField;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnCreateView: TUniButton;
    btnCancel: TUniButton;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    Panel4: TUniPanel;
    DBNavigator2: TUniDBNavigator;
    SrcUD_Tables: TDataSource;
    TblUD_Tables: TFDQuery;
    TblUD_TablesID: TBCDField;
    TblUD_TablesTABLE_NAME: TStringField;
    TblUD_TablesFORM_CAPTION: TStringField;
    TblUD_TablesMENU_CAPTION: TStringField;
    TblUD_ColsUSE_COMPONENT: TStringField;
    Splitter1: TUniSplitter;
    SrcUDDropDownTxt: TDataSource;
    TblUDDropDownTxt: TFDQuery;
    TblUDDropDownTxtID: TBCDField;
    TblUDDropDownTxtUD_COLS_ID: TBCDField;
    TblUDDropDownTxtTEXT: TStringField;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    Label2: TUniLabel;
    Panel15: TUniPanel;
    DBNavigator3: TUniDBNavigator;
    Bevel1: TUniPanel;
    Panel5: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    PnlGenTop: TUniPanel;
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    Panel10: TUniPanel;
    Bevel2: TUniPanel;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    Label3: TUniLabel;
    dbeMenu_Caption: TUniDBEdit;
    dbeForm_Caption: TUniDBEdit;
    TblUD_ColsTAB_NAME: TStringField;
    TblUD_ColsCOL_KIND: TStringField;
    TblUD_ColsSQL_TEXT: TStringField;
    wwDBGridHeader: TIQUniGridControl;
    wwDBComboBoxFieldType: TUniDBComboBox;
    wwDBComboBoxFieldKind: TUniDBComboBox;
    wwDBComboBoxUseComponent: TUniDBComboBox;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    sbtnLayoutManager: TUniSpeedButton;
    Import1: TUniMenuItem;
    Export1: TUniMenuItem;
    N1: TUniMenuItem;
    Label4: TUniLabel;
    dbeUD_Tables_ID: TUniDBEdit;
    Panel9: TUniPanel;
    Splitter3: TUniSplitter;
    Panel11: TUniPanel;
    Panel12: TUniPanel;
    pgctrlAdditional: TUniPageControl;
    TabQuery: TUniTabSheet;
    TabSource: TUniTabSheet;
    TabEmpty: TUniTabSheet;
    Panel14: TUniPanel;
    Panel13: TUniPanel;
    Panel16: TUniPanel;
    DBMemo1: TUniDBMemo;
    Panel17: TUniPanel;
    sbtnEditSQL: TUniSpeedButton;
    Splitter4: TUniSplitter;
    Label5: TUniLabel;
    wwDBComboDlgSourceFieldName: TUniEdit;
	PkDirectSourceLink: TIQWebHPick;
    PkDirectSourceLinkCOLUMN_NAME: TStringField;
    TblUD_ColsLINKED_COL_NAME: TStringField;
    TblUD_ColsUD_COLS_PARENT_ID: TBCDField;
    TblUD_ColsParentColName: TStringField;
    wwDBComboDlgParentColName: TUniEdit;
    PkUDCols: TIQWebHPick;
    PkUDColsCOL_NAME: TStringField;
    PkUDColsCOL_LABEL: TStringField;
    PkUDColsID: TBCDField;
    TblUDDropDownTxtUD_DROP_DOWN_PARENT_ID: TBCDField;
    TblUDDropDownTxtParentColValue: TStringField;
    wwDBComboDlgParentColValue: TUniEdit;
    PkParentColVal: TIQWebHPick;
    PkParentColValID: TBCDField;
    PkParentColValTEXT: TStringField;
    TblUD_ColsPKLIST_FIELD_NAME: TStringField;
    TabPickList: TUniTabSheet;
    Panel18: TUniPanel;
    Panel19: TUniPanel;
    sbtnEditPicklistSQL: TUniSpeedButton;
    DBMemo2: TUniDBMemo;
    FDUpdateSQL_UDCols: TFDUpdateSQL;
    FDUpdateSQL_Tables: TFDUpdateSQL;
    FDUpdateSQL_UDDropDownTxt: TFDUpdateSQL;
    Bevel10: TUniPanel;
    sbtnMoveUp: TUniSpeedButton;
    sbtnMoveDown: TUniSpeedButton;
    procedure TblUD_ColsBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblUD_ColsAfterPost(DataSet: TDataSet);
    procedure btnCreateViewClick(Sender: TObject);
    procedure TblUD_ColsBeforeInsert(DataSet: TDataSet);
    procedure TblUDDropDownTxtBeforePost(DataSet: TDataSet);
    procedure CheckUsedComponent(DataSet: TDataSet);
    procedure TblUD_ColsNewRecord(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure wwDBComboDlgSQLTextCustomDlg(Sender: TObject);
    procedure sbtnLayoutManagerClick(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure Import1Click(Sender: TObject);
    procedure SrcUD_ColsDataChange(Sender: TObject; Field: TField);
    procedure sbtnEditSQLClick(Sender: TObject);
    procedure wwDBComboDlgSourceFieldNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgSourceFieldNameCustomDlg(Sender: TObject);
    procedure PkDirectSourceLinkBeforeOpen(DataSet: TDataSet);
    procedure TblUD_ColsCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgParentColNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PkUDColsBeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlgParentColNameCustomDlg(Sender: TObject);
    procedure wwDBComboDlgParentColValueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgParentColValueCustomDlg(Sender: TObject);
    procedure TblUDDropDownTxtCalcFields(DataSet: TDataSet);
    procedure PkParentColValBeforeOpen(DataSet: TDataSet);
    procedure TblUD_ColsBeforeDelete(DataSet: TDataSet);
    procedure wwDBComboBoxFieldKindCloseUp(Sender: TUniDBComboBox;
      Select: Boolean);
    procedure sbtnEditPicklistSQLClick(Sender: TObject);
    procedure TblUDDropDownTxtBeforeOpen(DataSet: TDataSet);
    procedure TblUD_ColsBeforeOpen(DataSet: TDataSet);
    procedure TblUD_TablesNewRecord(DataSet: TDataSet);
    procedure TblUDDropDownTxtNewRecord(DataSet: TDataSet);
    procedure sbtnMoveDownClick(Sender: TObject);
    procedure sbtnMoveUpClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure wwDBGridHeaderDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    FUD_Tab_ID: Real;
    FView_Name: string;
    function GetTable_Name: string;
    function GetSource_Attribute: string;
    function CreateView: Boolean;
    procedure Validate;
    function GetSource_Name: string;
    function RefreshDataSets: Boolean;
    procedure OrganizeUDFormLayout;
    function GetSource: string;
    procedure ResetParentDropDownValues( AUD_Cols_ID: Real );
    procedure ResetChildrenOfParent(AUD_Cols_Parent_ID: Real);
    procedure IQNotify(var Msg: TMessage); message iq_Notify;
  public
    { Public declarations }
    FModified : Boolean;
    constructor Create( AOwner: TComponent;  AUD_Tab_ID: Real; AView_Name: string  );
    property Table_Name: string read GetTable_Name;
    property Source: string read GetSource;
    property Source_Attribute: string read GetSource_Attribute;
    class function GetFullSourceName( ASource, ATableName, AAttribute: string): string; static;
    class function GetXMLFileName( ASource, ATableName, AAttribute: string): string; static;
  end;

function UD_DefineStructure( AUD_Tab_ID: Real; AView_Name: string ): Boolean;

var
  FrmUsr_Define_Stru: TFrmUsr_Define_Stru;

implementation

{$R *.DFM}

uses
  IQMS.Common.EditMemoStr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  System.Variants,
  IQMS.Common.TableSequence,
  IQMS.Common.UserFieldsLayoutManager,
  IQMS.Common.UserFieldsPicklistEditor,
  IQMS.Common.UserFieldsXMLImportExport,
  Xml.XMLIntf;

const
  cnstRefreshDropDownText = 1;
  cnstRefreshUDCols = 2;


function UD_DefineStructure( AUD_Tab_ID: Real; AView_Name: string ): Boolean;
begin
  with TFrmUsr_Define_Stru.Create( uniApplication, AUD_Tab_ID, AView_Name ) do
  try
    Result:= ShowModal = mrOK;
  finally
    Free;
  end;
end;

constructor TFrmUsr_Define_Stru.Create( AOwner: TComponent;  AUD_Tab_ID: Real; AView_Name: string  );
begin
  inherited Create( AOwner );

  FUD_Tab_ID:= AUD_Tab_ID;
  FView_Name:= AView_Name;
  FModified := FALSE;
  PageControl1.ActivePage:= TabSheet1;

  IQMS.Common.Controls.AdjustPageControlToParent( pgctrlAdditional );

  if not TblUD_Tables.Locate('ID', FUD_Tab_ID, []) then
     IQError(Format(IQMS.Common.ResStrings.cTXT0000245 {'Unable to locate UD_Tables ID = %.0f'}, [ FUD_Tab_ID ]));

  TblUD_Cols.Filter:= Format('ud_tables_id = %s', [ FloatToStr( FUD_Tab_ID )]);
end;

procedure TFrmUsr_Define_Stru.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGridHeader, PnlGenTop, PnlLeft01, Panel10 ]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmUsr_Define_Stru.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGridHeader, PnlGenTop, PnlLeft01, Panel10 ]);

  OrganizeUDFormLayout;

  if (FModified or (TblUD_Tables.State in [dsEdit, dsInsert])) and IQConfirmYN(Format('Update view %s?', [ FView_Name ])) then
     btnCreateViewClick(NIL);
end;

procedure TFrmUsr_Define_Stru.OrganizeUDFormLayout;
begin
  if FUD_Tab_ID > 0 then
     ExecuteCommandFmt('begin user_form_misc.organize_ud_table_form( %f ); end;', [ FUD_Tab_ID ]);
end;

function TFrmUsr_Define_Stru.GetSource: string;
begin
  Result:= SelectValueFmtAsString('select source from ud_tables where id = %f', [ FUD_Tab_ID ]);
end;

function TFrmUsr_Define_Stru.GetSource_Attribute: string;
begin
  Result:= SelectValueFmtAsString('select source_attribute from ud_tables where id = %f', [ FUD_Tab_ID ]);
end;

function TFrmUsr_Define_Stru.GetTable_Name: string;
begin
  Result:= SelectValueFmtAsString('select table_name from ud_tables where id = %f', [ FUD_Tab_ID ]);
end;


procedure TFrmUsr_Define_Stru.TblUD_ColsBeforePost(DataSet: TDataSet);

  function _SourceTableFieldExists: Boolean;
  begin
    Result:= SelectValueFmtAsFloat('select 1 from user_tab_columns where table_name = ''%s'' and column_name = ''%s''', [ Table_Name, TblUD_ColsLINKED_COL_NAME.asString]) = 1;
  end;

  procedure _CheckResetRelatedChildren;
  var
    A: Variant;
    AColumnType  : string;
    AColumnKind  : string;
    AUseComponent: string;
    AUD_Cols_Parent_ID: Real;
  begin
    if TblUD_Cols.State <> dsEdit then
       EXIT;

    A:= SelectValueArrayFmt('select nvl(col_type,''C''), '+
                       '       nvl(col_kind,''D''), '+
                       '       use_component,       '+
                       '       ud_cols_parent_id    '+
                       '  from ud_cols where id = %f',
                       [ TblUD_ColsID.asFloat ]);
    if VarArrayDimCount(A) = 0 then
       EXIT;

    AColumnType       := A[ 0 ];
    AColumnKind       := A[ 1 ];
    AUseComponent     := A[ 2 ];
    AUD_Cols_Parent_ID:= A[ 3 ];

    if  (nz(TblUD_ColsCOL_TYPE.asString, 'C') <> AColumnType) and (AColumnType = 'C')
        or
        (nz(TblUD_ColsCOL_KIND.asString, 'D') <> AColumnKind) and (AColumnKind = 'D')
        or
        not StrInList(TblUD_ColsUSE_COMPONENT.asString, ['DROP-DOWN','DROP-DOWN-LIST']) and StrInList( AUseComponent, ['DROP-DOWN','DROP-DOWN-LIST']) then
      begin
        ResetChildrenOfParent( TblUD_ColsID.asFloat );
        ResetParentDropDownValues( TblUD_ColsID.asFloat );
      end

    else if TblUD_ColsUD_COLS_PARENT_ID.asFloat <> AUD_Cols_Parent_ID then
      begin
        ResetParentDropDownValues( TblUD_ColsID.asFloat );
      end;
  end;

begin
  IQAssignIDBeforePost(DataSet);
  TblUD_ColsUD_TABLES_ID.asFloat:= FUD_Tab_ID;
  TblUD_ColsCOL_NAME.asString   := Trim(UpperCase(TblUD_ColsCOL_NAME.asString));
  TblUD_ColsCOL_TYPE.asString   := UpperCase(TblUD_ColsCOL_TYPE.asString);

  IQMS.Common.Miscellaneous.ValidateColumnName( TblUD_ColsCOL_NAME.asString );

  if Pos(TblUD_ColsCOL_TYPE.asString, 'CND') = 0 then
     // Byron:  I have chose not to internationalize this because it is
     //         for developer use only.
     raise Exception.Create('Column type must be (C)har, (N)um or (D)ate');

  if StrInList(TblUD_ColsUSE_COMPONENT.asString, ['CHECKBOX', 'MEMO']) then
     TblUD_ColsCOL_TYPE.asString:= 'C';

  if (TblUD_ColsUSE_COMPONENT.asString = 'MEMO') and not StrInList(TblUD_ColsCOL_KIND.asString, ['D', '']) then
     raise Exception.Create('''Memo'' component Field Kind must be ''Data'' - operation aborted.');

  if StrInList(TblUD_ColsUSE_COMPONENT.asString, ['DROP-DOWN', 'DROP-DOWN-LIST', 'MEMO']) and (TblUD_ColsCOL_TYPE.asString <> 'C') and (TblUD_ColsCOL_KIND.asString <> 'P') then
     raise Exception.Create('''DROP-DOWN'', ''DROP-DOWN-LIST'' and ''MEMO'' are only applicable to column of type ''C''');

  if (TblUD_ColsCOL_KIND.asString = 'C') and (Trim(TblUD_ColsSQL_TEXT.asString) = '') then
     raise Exception.Create('''SQL Statement'' must be defined - operation aborted.');

  if (TblUD_ColsCOL_KIND.asString = 'P') and (Trim(TblUD_ColsSQL_TEXT.asString) = '') then
     raise Exception.Create('''Picklist SQL'' must be defined - operation aborted.');

  if (TblUD_ColsCOL_KIND.asString = 'L') and not _SourceTableFieldExists() then
     raise Exception.Create('''Linked Field Name'' is undefined or invalid - operation aborted.');

  if IQMS.Common.StringUtils.StrInList( TblUD_ColsCOL_KIND.asString, ['', 'D', 'L']) then
     TblUD_ColsSQL_TEXT.asString:= '';

  if IQMS.Common.StringUtils.StrInList( TblUD_ColsCOL_KIND.asString, ['C']) then
     TblUD_ColsUSE_COMPONENT.asString:= '';

  if not StrInList(TblUD_ColsUSE_COMPONENT.asString, ['DROP-DOWN','DROP-DOWN-LIST']) and (TblUD_ColsUD_COLS_PARENT_ID.asFloat > 0) then
     TblUD_ColsUD_COLS_PARENT_ID.Clear;

  if IQMS.Common.StringUtils.StrInList( TblUD_ColsCOL_KIND.asString, ['P']) and not StrInList(TblUD_ColsUSE_COMPONENT.asString, ['DROP-DOWN', 'DROP-DOWN-LIST']) then
     raise Exception.Create('Field Kind ''PICKLIST'' must use component ''DROP-DOWN'' or ''DROP-DOWN-LIST''');

  _CheckResetRelatedChildren
end;

function TFrmUsr_Define_Stru.CreateView: Boolean;
label
  next_field;
var
  ASQL: string;
  I   : Integer;
begin
  TblUD_Tables.CheckBrowseMode;
  TblUD_Cols.CheckBrowseMode;

  I  := 1;
  ASQL:= Format('create or replace view %s as '#13, [ FView_Name ]);
  ASQL:= ASQL + 'select t.id as tab_id,       '#13;
  ASQL:= ASQL + '       d.parent_id,          '#13;
  ASQL:= ASQL + '       c.ud_groupbox_id,     '#13;
  ASQL:= ASQL + '       g.ud_tabsheet_id,     '#13;

  with TblUD_Cols do
  begin
    First;
    while not Eof do
    begin
      if FieldByName('col_kind').asString = 'C' then
         goto next_field;

      if FieldByName('col_type').asString = 'N' then
         ASQL:= ASQL + Format( 'Sum(decode( c.seq, %d, nuser, '''')) as %s,'#13, [ I, FieldByName('col_name').asString ])
      else if FieldByName('col_type').asString = 'D' then
         ASQL:= ASQL + Format( 'Max(decode( c.seq, %d, duser, '''')) as %s,'#13, [ I, FieldByName('col_name').asString ])
      else
         ASQL:= ASQL + Format( 'Max(decode( c.seq, %d, cuser, '''')) as %s,'#13, [ I, FieldByName('col_name').asString ]);

      next_field:
      Next;
      Inc(I);
    end;
  end;

  ASQL:= Copy( ASQL, 1, RPos(',', ASQL) - 1 ) + #13; { take out last ',' }

  ASQL:= ASQL +        '  from ud_tables t,             '#13;
  ASQL:= ASQL +        '       ud_cols c,               '#13;
  ASQL:= ASQL +        '       ud_data d,               '#13;
  ASQL:= ASQL +        '       ud_groupbox g            '#13;
  ASQL:= ASQL +        ' where t.id = c.ud_tables_id(+) '#13;
  ASQL:= ASQL +        '   and c.id = d.ud_cols_id(+)   '#13;
  ASQL:= ASQL +        '   and c.ud_groupbox_id = g.id(+) '#13;
  ASQL:= ASQL + Format('   and t.table_name = ''%s''    '#13, [ Table_Name ]);
  ASQL:= ASQL + Format('   and nvl(t.source_attribute, ''*'') = nvl(''%s'', ''*'') '#13, [ Source_Attribute ]);
  ASQL:= ASQL +        ' group by t.id,                 '#13;
  ASQL:= ASQL +        '          d.parent_id,          '#13;
  ASQL:= ASQL +        '          c.ud_groupbox_id,     '#13;
  ASQL:= ASQL +        '          g.ud_tabsheet_id      '#13;

  try
    ExecuteCommand( ASQL );
    Result   := TRUE;
    FModified:= FALSE;
  except on E: Exception do
    begin
      Result:= FALSE;
      IQError(Format( IQMS.Common.ResStrings.cTXT0000246 {'Unable to create view %s'#13#13'%s'}, [ FView_Name, E.Message ]));
    end;
  end;
end;

procedure TFrmUsr_Define_Stru.TblUD_ColsAfterPost(DataSet: TDataSet);
begin
  FModified:= TRUE;
end;

procedure TFrmUsr_Define_Stru.btnCreateViewClick(Sender: TObject);
begin
  Validate;

  if CreateView then
     ModalResult:= mrOK;
end;

procedure TFrmUsr_Define_Stru.Validate;
var
  I: Integer;
begin
  {validate. s/n raise an exception as we intercept the number of cols in the on insert}
  {09-30-2009 remove 30 fields per form limitation }
  // IQAssert( SelectValueFmtAsFloat('select count(*) from ud_tables t, ud_cols c where t.table_name = ''%s'' and c.ud_tables_id = t.id',
  //                     [ Table_Name ]) <= 30, IQMS.Common.ResStrings.cTXT0000326 ); // 'Maximum number of supported columns (32) has been exceeded'

  TblUD_Cols.CheckBrowseMode;
  Reopen(TblUD_Cols);
  I:= 1;
  with TblUD_Cols do while not Eof do
  begin
    IQAssert( FieldByName('seq').asInteger = I, Format( IQMS.Common.ResStrings.cTXT0000334{'Validation failed with out of sequence error. Expected %d, found %d.'}, [ I, FieldByName('seq').asInteger ]));
    Next;
    Inc(I);
  end;
end;

procedure TFrmUsr_Define_Stru.TblUD_ColsBeforeInsert(DataSet: TDataSet);
begin
  {09-30-2009 remove 30 fields per form limitation }
  //if SelectValueFmtAsFloat('select count(*) from ud_cols where ud_tables_id = %f', [ FUD_Tab_ID ]) = 30 then
  //   // 'You have reached the maximum of 30 workable fields per form'
  //   raise Exception.Create(IQMS.Common.ResStrings.cTXT0000247)
end;

procedure TFrmUsr_Define_Stru.TblUD_ColsBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', TblUD_TablesID.AsLargeInt);
end;

procedure TFrmUsr_Define_Stru.TblUDDropDownTxtBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', TblUD_ColsID.AsLargeInt);
end;

procedure TFrmUsr_Define_Stru.TblUDDropDownTxtBeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
end;


procedure TFrmUsr_Define_Stru.CheckUsedComponent(DataSet: TDataSet);
begin
  TblUD_Cols.CheckBrowseMode;
  IQAssert( StrInList( TblUD_ColsUSE_COMPONENT.asString, ['DROP-DOWN', 'DROP-DOWN-LIST']), 'Used component must be of type DROP-DOWN or DROP-DOWN-LIST' );
end;

procedure TFrmUsr_Define_Stru.TblUD_ColsNewRecord(DataSet: TDataSet);
begin
  TblUD_ColsID.AsLargeInt := GetNextID('UD_COLS');
  TblUD_ColsUD_TABLES_ID.AsLargeInt := TblUD_TablesID.AsLargeInt;
  TblUD_ColsSEQ.AsInteger := SelectValueFmtAsInteger(
    'select max(seq) from ud_cols where ud_tables_id = %f',
    [FUD_Tab_ID]) + 1;
  TblUD_ColsCOL_NAME.AsString := Format('USER%d', [TblUD_ColsSEQ.AsInteger]);
  TblUD_ColsCOL_TYPE.AsString := 'C';
  TblUD_ColsCOL_LABEL.AsString := ProperCase(TblUD_ColsCOL_NAME.AsString);
end;

procedure TFrmUsr_Define_Stru.TblUD_TablesNewRecord(DataSet: TDataSet);
begin
  TblUD_TablesID.AsLargeInt := GetNextID('UD_TABLES');
end;

procedure TFrmUsr_Define_Stru.btnCancelClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TFrmUsr_Define_Stru.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmUsr_Define_Stru.wwDBGridHeaderDBGridDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn;
  Attribs: TUniCellAttribs);
begin
  if (Column.Field = TblUD_ColsUSE_COMPONENT) then
     Attribs.Color:= IIf( TblUD_ColsCOL_KIND.asString = 'C', clBtnFace, clWindow );
end;

procedure TFrmUsr_Define_Stru.wwDBComboDlgSQLTextCustomDlg(
  Sender: TObject);
var
  S: string;
begin
  IQAssert( SecurityManager.IsUserDBA, 'User must be DBA to edit SQL Statement - operation aborted.');
  IQAssert( TblUD_ColsCOL_KIND.asString = 'C', 'Field Kind must be ''QUERY'' - operation aborted.');

  S:= TblUD_ColsSQL_TEXT.asString;
  if DoEditMemoStr(  S, 4000, 'SQL Statement' ) then  {IQMS.Common.EditMemoStr.pas}
  begin
    TblUD_Cols.Edit;
    TblUD_ColsSQL_TEXT.asString:= S;
  end;
end;

procedure TFrmUsr_Define_Stru.sbtnLayoutManagerClick(Sender: TObject);
begin
  TblUD_Cols.CheckBrowseMode;
  TFrmUserFieldsLayoutManager.DoShowModal( self, FUD_Tab_ID );  // IQMS.Common.UserFieldsLayoutManager.pas
end;

procedure TFrmUsr_Define_Stru.sbtnMoveDownClick(Sender: TObject);
begin
  IQMS.Common.TableSequence.ChangeSequence(
    TblUD_Cols, // DataSet
    'UD_COLS', // TableName
    'UD_TABLES_ID', // Master Field
    TblUD_ColsSEQ.AsInteger, // Current Seq
    TblUD_ColsSEQ.AsInteger + 1 // New Seq
    );
end;

procedure TFrmUsr_Define_Stru.sbtnMoveUpClick(Sender: TObject);
begin
  IQMS.Common.TableSequence.ChangeSequence(
    TblUD_Cols, // DataSet
    'UD_COLS', // TableName
    'UD_TABLES_ID', // Master Field
    TblUD_ColsSEQ.AsInteger, // Current Seq
    TblUD_ColsSEQ.AsInteger - 1 // New Seq
    );
end;

function TFrmUsr_Define_Stru.GetSource_Name: string;
begin
  Result:= TFrmUsr_Define_Stru.GetFullSourceName( Source, Table_Name, Source_Attribute );  // this unit
end;

class function TFrmUsr_Define_Stru.GetFullSourceName( ASource, ATableName, AAttribute: string ): string;
begin
  if (ASource > '') and (AAttribute > '') then
    Result:= Format('%s_%s', [ ASource, IQMS.Common.StringUtils.FixComponentName( AAttribute )])
  else if ASource > '' then
    Result := ASource
  else if ATableName > '' then
    Result := ATableName
  else
    Result := '';
end;

class function TFrmUsr_Define_Stru.GetXMLFileName( ASource, ATableName, AAttribute: string ): string;
begin
  Result:= Format('ud_%s.xml', [ LowerCase( TFrmUsr_Define_Stru.GetFullSourceName( ASource, ATableName, AAttribute ))]);  // this unit
end;


procedure TFrmUsr_Define_Stru.Exit1Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmUsr_Define_Stru.Export1Click(Sender: TObject);
begin
  OrganizeUDFormLayout;

  with TUDFormExport.Create( self, FUD_Tab_ID, Table_Name, Source, Source_Attribute ) do     // IQMS.Common.UserFieldsXMLImportExport.pas
  try
    Execute();
  finally
    Free;
  end;
end;

procedure TFrmUsr_Define_Stru.Import1Click(Sender: TObject);
begin
  with TUDFormImport.Create( self, FUD_Tab_ID, Table_Name, Source, Source_Attribute ) do     // IQMS.Common.UserFieldsXMLImportExport.pas
  try
    Execute();
    RefreshDataSets;
  finally
    Free;
  end;
end;


function TFrmUsr_Define_Stru.RefreshDataSets: Boolean;
begin
  Reopen(TblUD_Tables);
  Result:= TblUD_Tables.Locate('ID', FUD_Tab_ID, []);
  Reopen( TblUD_Cols );
  if not Result then
     IQError(Format(IQMS.Common.ResStrings.cTXT0000245 {'Unable to locate UD_Tables ID = %.0f'}, [ FUD_Tab_ID ]));
end;


procedure TFrmUsr_Define_Stru.SrcUD_ColsDataChange(Sender: TObject;
  Field: TField);
begin
  if not Assigned(TblUD_Cols) or (TblUD_Cols.State = dsInactive) then
     EXIT;

  if TblUD_ColsCOL_KIND.asString = 'D' then
     pgctrlAdditional.ActivePage:= TabEmpty

  else if TblUD_ColsCOL_KIND.asString = 'C' then
     pgctrlAdditional.ActivePage:= TabQuery

  else if TblUD_ColsCOL_KIND.asString = 'L' then
     pgctrlAdditional.ActivePage:= TabSource

  else if TblUD_ColsCOL_KIND.asString = 'P' then
     pgctrlAdditional.ActivePage:= TabPickList

  else
     pgctrlAdditional.ActivePage:= TabEmpty;

  if TblUD_Cols.State = dsBrowse then
  begin
//    if TblUD_ColsUD_COLS_PARENT_ID.asFloat > 0 then
//       IQMS.Common.Controls.EnsureWWColumnExists( wwDBGrid1, 'ParentColValue', 'Parent Drop Down Value', 50 )
//    else
//       IQMS.Common.Controls.EnsureWWColumnRemoved(wwDBGrid1, 'ParentColValue' );
  end;
end;

procedure TFrmUsr_Define_Stru.sbtnEditSQLClick(Sender: TObject);
var
  S: string;
begin
  IQAssert( SecurityManager.IsUserDBA, 'User must be DBA to edit SQL Statement - operation aborted.');
  IQAssert( TblUD_ColsCOL_KIND.asString = 'C', 'Field Kind must be ''QUERY'' - operation aborted.');

  S:= TblUD_ColsSQL_TEXT.asString;
  if DoEditMemoStr(  S, 4000, 'SQL Statement' ) then  {IQMS.Common.EditMemoStr.pas}
  begin
    TblUD_Cols.Edit;
    TblUD_ColsSQL_TEXT.asString:= S;
  end;
end;

procedure TFrmUsr_Define_Stru.wwDBComboDlgSourceFieldNameCustomDlg(
  Sender: TObject);
begin
  with PkDirectSourceLink do
    if Execute then
    begin
      TblUD_Cols.Edit;
      TblUD_ColsLINKED_COL_NAME.asString:= GetValue('column_name');
    end;
end;

procedure TFrmUsr_Define_Stru.wwDBComboDlgSourceFieldNameKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    TblUD_Cols.Edit;
    TblUD_ColsLINKED_COL_NAME.Clear;
    Key:= 0;
  end;
end;

procedure TFrmUsr_Define_Stru.PkDirectSourceLinkBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'table_name', Table_Name);
end;

procedure TFrmUsr_Define_Stru.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    cnstRefreshDropDownText: Reopen(TblUDDropDownTxt);
    cnstRefreshUDCols: TblUD_Cols.Refresh;
  end;
end;

procedure TFrmUsr_Define_Stru.PkUDColsBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ud_tables_id', FUD_Tab_ID);
  AssignQueryParamValue(DataSet, 'this_id', TblUD_ColsID.AsLargeInt);
end;

procedure TFrmUsr_Define_Stru.TblUD_ColsCalcFields(DataSet: TDataSet);
begin
  if TblUD_ColsUD_COLS_PARENT_ID.asFloat > 0 then
     TblUD_ColsParentColName.asString:= SelectValueByID('col_label', 'ud_cols', TblUD_ColsUD_COLS_PARENT_ID.asFloat);
end;


procedure TFrmUsr_Define_Stru.wwDBComboDlgParentColNameCustomDlg(
  Sender: TObject);
begin
  if not StrInList(TblUD_ColsUSE_COMPONENT.asString, ['DROP-DOWN', 'DROP-DOWN-LIST']) then
     EXIT;

  with PkUDCols do
    if Execute then
    begin
      TblUD_Cols.Edit;
      TblUD_ColsUD_COLS_PARENT_ID.asFloat:= GetValue('id');
    end;
end;

procedure TFrmUsr_Define_Stru.wwDBComboDlgParentColNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if TblUD_ColsUD_COLS_PARENT_ID.asFloat = 0 then
     EXIT;
  IQMS.Common.Controls.CheckClearWWDBComboDlg( Sender, Key, TblUD_ColsUD_COLS_PARENT_ID );
end;


procedure TFrmUsr_Define_Stru.TblUDDropDownTxtCalcFields(DataSet: TDataSet);
begin
  if TblUDDropDownTxtUD_DROP_DOWN_PARENT_ID.asFloat > 0 then
     TblUDDropDownTxtParentColValue.asString:= SelectValueByID('text', 'ud_drop_down_text', TblUDDropDownTxtUD_DROP_DOWN_PARENT_ID.asFloat);
end;

procedure TFrmUsr_Define_Stru.TblUDDropDownTxtNewRecord(DataSet: TDataSet);
begin
  TblUDDropDownTxtID.AsLargeInt := GetNextID('UD_DROP_DOWN_TEXT');
  TblUDDropDownTxtUD_COLS_ID.AsLargeInt := TblUD_ColsID.AsLargeInt;
end;

procedure TFrmUsr_Define_Stru.wwDBComboDlgParentColValueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IQMS.Common.Controls.CheckClearWWDBComboDlg( Sender, Key, TblUDDropDownTxtUD_DROP_DOWN_PARENT_ID );
end;

procedure TFrmUsr_Define_Stru.wwDBComboDlgParentColValueCustomDlg(
  Sender: TObject);
begin
  if TblUD_ColsUD_COLS_PARENT_ID.asFloat = 0 then
     EXIT;

  with PkParentColVal do
    if Execute then
    begin
      TblUDDropDownTxt.Edit;
      TblUDDropDownTxtUD_DROP_DOWN_PARENT_ID.asFloat:= GetValue('id')
    end;
end;

procedure TFrmUsr_Define_Stru.PkParentColValBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ud_cols_id', TblUD_ColsUD_COLS_PARENT_ID.AsLargeInt);
end;

procedure TFrmUsr_Define_Stru.TblUD_ColsBeforeDelete(DataSet: TDataSet);
begin
  ResetChildrenOfParent( TblUD_ColsID.asFloat );
end;

procedure TFrmUsr_Define_Stru.ResetChildrenOfParent( AUD_Cols_Parent_ID: Real );
begin
  ExecuteCommandFmt('declare                                                                 '+
            '  v_ud_cols_parent_id number::= %f;                                     '+
            'begin                                                                   '+
            '  update ud_drop_down_text                                              '+
            '     set ud_drop_down_parent_id = null                                  '+
            '   where ud_cols_id in                                                  '+
            '                   ( select id                                          '+
            '                       from ud_cols                                     '+
            '                      where ud_cols_parent_id = v_ud_cols_parent_id );  '+
            '  update ud_cols                                                        '+
            '     set ud_cols_parent_id = null                                       '+
            '   where ud_cols_parent_id = v_ud_cols_parent_id;                       '+
            'end;                                                                    ',
            [ AUD_Cols_Parent_ID ]);
  PostMessage(Handle, iq_Notify, cnstRefreshUDCols, 0);
end;

procedure TFrmUsr_Define_Stru.ResetParentDropDownValues( AUD_Cols_ID: Real );
begin
  ExecuteCommandFmt('declare                                '+
            '  v_ud_cols_id number::= %f;           '+
            'begin                                  '+
            '  update ud_drop_down_text             '+
            '     set ud_drop_down_parent_id = null '+
            '   where ud_cols_id = v_ud_cols_id;    '+
            'end;                                   ',
            [ AUD_Cols_ID ]);
  PostMessage(Handle, iq_Notify, cnstRefreshDropDownText, 0);
end;

procedure TFrmUsr_Define_Stru.wwDBComboBoxFieldKindCloseUp(Sender: TUniDBComboBox; Select: Boolean);
begin
  wwDBGridHeader.SetFocus();  // to force buffer flush so OnDataChange will kick in

  if (TblUD_ColsCOL_KIND.asString = 'P') and not StrInList(TblUD_ColsUSE_COMPONENT.asString, ['DROP-DOWN', 'DROP-DOWN-LIST']) then
  begin
    TblUD_Cols.Edit;
    TblUD_ColsUSE_COMPONENT.asString:= 'DROP-DOWN';
  end;
end;


procedure TFrmUsr_Define_Stru.sbtnEditPicklistSQLClick(Sender: TObject);
var
  ASQL: string;
  AFieldName: string;
begin
  IQAssert( SecurityManager.IsUserDBA, 'User must be DBA to edit Picklist SQL - operation aborted.');
  IQAssert( TblUD_ColsCOL_KIND.asString = 'P', 'Field Kind must be ''PICKLIST'' - operation aborted.');

  ASQL:= TblUD_ColsSQL_TEXT.asString;
  AFieldName:= TblUD_ColsPKLIST_FIELD_NAME.asString;
  if TFrmUserFieldsPicklistEditor.DoShowModal( self, ASQL, AFieldName ) then   // IQMS.Common.UserFieldsPicklistEditor.pas
  begin
    TblUD_Cols.Edit;
    TblUD_ColsSQL_TEXT.asString:= ASQL;
    TblUD_ColsPKLIST_FIELD_NAME.asString:= AFieldName;
  end;
end;



end.



