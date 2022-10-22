unit IQMS.WebVcl.UDComboListDlg;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  IQMS.Common.JumpConstants,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls,
  IQUniGrid, uniGUIFrame, uniMemo, uniDBMemo;

type
  TFrmIQUDComboListDlg = class(TUniForm)
    SrcUser_Def_List_Detail: TDataSource;
    QryUser_Def_List_Detail: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryUser_Def_List_DetailID: TBCDField;
    QryUser_Def_List_DetailUSER_DEF_LIST_ID: TBCDField;
    QryUser_Def_List_DetailTEXT: TStringField;
    QryUser_Def_List_DetailSEQ: TBCDField;
    StatusBar1: TUniStatusBar;
    pnlTop: TUniPanel;
    SrcUserDefList: TDataSource;
    QryUserDefList: TFDQuery;
    QryUserDefListID: TBCDField;
    QryUserDefListIS_DROP_DOWN_LIST: TStringField;
    UpdateSQLUserDefList: TFDUpdateSQL;
    pnlMain: TUniPanel;
    wwDBComboBoxStyle: TUniDBComboBox;
    dbchkPickListBased: TUniDBCheckBox;
    Label2: TUniLabel;
    QryUserDefListPKLIST_BASED: TStringField;
    QryUserDefListPKLIST_SQL: TStringField;
    QryUserDefListPKLIST_FIELD_NAME: TStringField;
    pmlBottom: TUniPanel;
    Panel7: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    pnlSettings: TUniPanel;
    PageControl1: TUniPageControl;
    TabStrings: TUniTabSheet;
    TabPkList: TUniTabSheet;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel1: TUniPanel;
    Panel6: TUniPanel;
    Label1: TUniLabel;
    wwDBComboBoxResultField: TUniDBComboBox;
    Panel8: TUniPanel;
    DBRichEdit1: TUniDBMeMo;
    Panel3: TUniPanel;
    Panel10: TUniPanel;
    sbtnSort: TUniSpeedButton;
    DBNavigator1: TUniDBNavigator;
    Bevel1: TUniPanel;
    Label3: TUniLabel;
    Panel9: TUniPanel;
    sbtnVerifySQL: TUniSpeedButton;
    Panel11: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    popmSQLExample: TUniPopupMenu;
    SeeExample1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryUser_Def_List_DetailBeforePost(DataSet: TDataSet);
    procedure QryUser_Def_List_DetailNewRecord(DataSet: TDataSet);
    procedure QryUser_Def_List_DetailBeforeOpen(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject;
      Button: TNavigateBtn);
    procedure QryUserDefListBeforeOpen(DataSet: TDataSet);
    procedure sbtnSortClick(Sender: TObject);
    procedure SrcUserDefListDataChange(Sender: TObject; Field: TField);
    procedure btnOKClick(Sender: TObject);
    procedure dbchkPickListBasedClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SeeExample1Click(Sender: TObject);
    procedure sbtnVerifySQLClick(Sender: TObject);
    procedure wwDBComboBoxResultFieldDropDown(Sender: TObject);
  private
    FUser_Def_List_ID: Real;
    FFormCreated: Boolean;
    FKeyTableName, FKeyFieldName: string;
    FAttribute: string;
    function GetKeyFieldName: string;
    function GetKeyTableName: string;
    procedure EnsureUser_Def_List_Populated;
    procedure ValidatePicklistSettings;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure ValidatePickListSQL;
    procedure CheckAssignParams(Qry: TFDQuery);

    { Private declarations }
  protected
     property KeyTableName: string read GetKeyTableName;
     property KeyFieldName: string read GetKeyFieldName;
     property Attribute: string read FAttribute;
  public
    { Public declarations }
    constructor Create(  AKeyTableName, AKeyFieldName, AAttribute: string ); reintroduce;
    class function DoShowModal( AKeyTableName, AKeyFieldName, AAttribute: string ): Boolean;
  end;


implementation

{$R *.DFM}

{ TFrmIQUDComboListDlg }

uses
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.MsgFrm,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.WebVcl.UDComboBox,
  IQMS.WebVcl.ResourceStrings;


class function TFrmIQUDComboListDlg.DoShowModal(
  AKeyTableName, AKeyFieldName, AAttribute: string): Boolean;
begin
  with TFrmIQUDComboListDlg.Create(AKeyTableName, AKeyFieldName,
    AAttribute) do
  try
    Result := ShowModal = mrOk;
  finally
    Release;
  end;
end;

constructor TFrmIQUDComboListDlg.Create(AKeyTableName,
  AKeyFieldName, AAttribute: string);
var
  AGlobalIsDropDownList: Boolean;
begin
  FKeyTableName := AKeyTableName;
  FKeyFieldName := AKeyFieldName;
  FAttribute := AAttribute;

  inherited Create(uniGUIApplication.UniApplication);

  // IQAssert( AOwner is TIQUDComboBox, IQMS.WebVcl.ResourceStrings.cTXT0000278 );                        // Passed owner must be of class TIQUDComboBox;
//  IQAssert( Assigned( AOwner ), IQMS.WebVcl.ResourceStrings.cTXT0000280  );                            // Owner is NIL;
  IQAssert( (KeyFieldName > '') and  (KeyTableName > ''), IQMS.WebVcl.ResourceStrings.cTXT0000279 );   // KeyTableName or KeyFieldName is undefined;

  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  IQMS.Common.Controls.AdjustPageControlToParent( PageControl1 );

  EnsureUser_Def_List_Populated;
  Reopen( QryUser_Def_List_Detail );
  Reopen( QryUserDefList );

  AGlobalIsDropDownList:= SelectValueAsString('select ud_drop_down_is_list from params') = 'Y';
  wwDBComboBoxStyle.Hint:= Format('''DropDown'' allows free data entry or selection of text predefined in the grid below.'#13+
                                  '''DropDown List'' allows only predefined text.'#13+
                                  '''System Default'' follows global system setting currently set to ''%s''.',
                                  [ sIIf( AGlobalIsDropDownList, 'DropDown List', 'DropDown')]);

  StatusBar1.Panels[ 0 ].Text:= Format( IQMS.WebVcl.ResourceStrings.cTXT0000281, [ KeyTableName ]);      {Table: %s}
  StatusBar1.Panels[ 1 ].Text:= Format( IQMS.WebVcl.ResourceStrings.cTXT0000282, [ KeyFieldName ]);      {Field: %s}
  StatusBar1.Panels[ 2 ].Text:= Format( IQMS.WebVcl.ResourceStrings.cTXT0000283, [ FUser_Def_List_ID ]); {ID: %.0f }

  dbchkPickListBased.Enabled:= SecurityManager.IsUserIQMS;
  QryUserDefListPKLIST_BASED.ReadOnly:= not SecurityManager.IsUserIQMS;
  QryUserDefListPKLIST_SQL.ReadOnly  := not SecurityManager.IsUserIQMS;
  QryUserDefListPKLIST_FIELD_NAME.ReadOnly:= not SecurityManager.IsUserIQMS;
end;


procedure TFrmIQUDComboListDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
  // QryUserDefList.CheckBrowseMode;
end;

function TFrmIQUDComboListDlg.GetKeyFieldName: string;
begin
  // Result:= (Owner as TIQUDComboBox).KeyFieldName
  Result := FKeyFieldName;
end;

function TFrmIQUDComboListDlg.GetKeyTableName: string;
begin
  //Result:= (Owner as TIQUDComboBox).KeyTableName
  Result := FKeyTableName;
end;

procedure TFrmIQUDComboListDlg.EnsureUser_Def_List_Populated;
var
  AColExists: Boolean;
begin
  // 08/26/2014 Avoid VCL conflicts
  AColExists := TableFieldExists('user_def_list', 'attribute');

  if (FAttribute > '') and AColExists then
    FUser_Def_List_ID:= SelectValueFmtAsFloat(
      'select id from user_def_list where table_name = ''%s'' and ' +
      'field_name = ''%s'' and Upper(attribute) = Upper(''%s'')',
      [ KeyTableName, KeyFieldName, FAttribute ])
  else
    FUser_Def_List_ID:= SelectValueFmtAsFloat(
      'select id from user_def_list where table_name = ''%s'' and field_name = ''%s''',
      [ KeyTableName, KeyFieldName ]);

  if FUser_Def_List_ID > 0 then
     EXIT;

  FUser_Def_List_ID:= GetNextID('user_def_list');
  ExecuteCommandFmt('insert into user_def_list( id, table_name, field_name, is_drop_down_list ) values (%f, ''%s'', ''%s'', ''S'')',
            [ FUser_Def_List_ID, KeyTableName, KeyFieldName ]);

  if (FAttribute > '') and AColExists then
    ExecuteCommandFmt(
      'UPDATE user_def_list SET attribute = Upper(''%s'') WHERE id = %.0f',
      [FAttribute, FUser_Def_List_ID]);
end;

procedure TFrmIQUDComboListDlg.QryUser_Def_List_DetailBeforePost(DataSet: TDataSet);
var
  ALength:integer;
begin
  ALength := SelectValueFmtAsInteger(
    'select data_length from all_tab_columns where table_name = ''%s'' and column_name = ''%s''',
    [KeyTableName, KeyFieldName]);
  if ALength > 0 then
  begin
    if Length(QryUser_Def_List_DetailTEXT.asString) > ALength then
      raise exception.create(Format( IQMS.WebVcl.ResourceStrings.cTXT0000337 + '%d', [ ALength ]));
  end;

  if QryUser_Def_List_DetailID.asFloat = 0 then
     QryUser_Def_List_DetailID.asFloat:= GetNextID('user_def_list_detail');
end;

procedure TFrmIQUDComboListDlg.QryUser_Def_List_DetailNewRecord(
  DataSet: TDataSet);
begin
  QryUser_Def_List_DetailID.AsLargeInt := GetNextID('USER_DEF_LIST_DETAIL');
  QryUser_Def_List_DetailUSER_DEF_LIST_ID.AsLargeInt := Trunc(FUser_Def_List_ID);
  QryUser_Def_List_DetailSEQ.AsInteger := SelectValueFmtAsInteger(
    'select max(seq) from user_def_list_detail where user_def_list_id = %f',
    [FUser_Def_List_ID]) + 1;
end;

procedure TFrmIQUDComboListDlg.sbtnSortClick(Sender: TObject);
var
  AList: TStringList;
  I: Integer;
begin
  QryUser_Def_List_Detail.CheckBrowseMode;

  if QryUser_Def_List_Detail.Eof and QryUser_Def_List_Detail.Bof then
     EXIT;

  if not IQConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000412) then // This option resequences the records alpha numerically. Are you sure you wish to continue?
     EXIT;

  AList:= TStringList.Create;
  try
    LoadColumnValueIntoStringList( AList,
                                         Format('select id from user_def_list_detail where user_def_list_id = %f order by text',
                                                [ FUser_Def_List_ID ]));
    for i:= 0 to AList.Count - 1 do
      ExecuteCommandFmt('update user_def_list_detail set seq = %d where id = %s', [ i+1, AList[ i ]]);
  finally
    AList.Free;
  end;

  Reopen(QryUser_Def_List_Detail);
end;

procedure TFrmIQUDComboListDlg.QryUserDefListBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'id', FUser_Def_List_ID);
end;

procedure TFrmIQUDComboListDlg.QryUser_Def_List_DetailBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'id', FUser_Def_List_ID);
end;

procedure TFrmIQUDComboListDlg.FormShow(Sender: TObject);
begin
  FFormCreated:= TRUE;
end;


procedure TFrmIQUDComboListDlg.SrcUserDefListDataChange(Sender: TObject;  Field: TField);
begin
  if QryUserDefListPKLIST_BASED.asString = 'Y' then
     PageControl1.ActivePageIndex:= 1
  else
     PageControl1.ActivePageIndex:= 0
end;


procedure TFrmIQUDComboListDlg.btnOKClick(Sender: TObject);
begin
  if QryUserDefListPKLIST_BASED.asString = 'Y' then
     ValidatePicklistSettings;

  if QryUserDefList.State in [dsEdit, dsInsert] then
     QryUserDefList.Post;
  if QryUser_Def_List_Detail.State in [dsEdit, dsInsert] then
     QryUser_Def_List_Detail.Post;

  ModalResult:= mrOK;
end;

procedure TFrmIQUDComboListDlg.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
    ABORT;
  end;
end;

procedure TFrmIQUDComboListDlg.dbchkPickListBasedClick(Sender: TObject);
begin
  if not FFormCreated then
     EXIT;

  // to update internal buffer and make on datachange to kick in
  PostMessage( Handle, iq_Notify, 1, 0 );
end;

procedure TFrmIQUDComboListDlg.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
     1: pnlTop.SetFocus;
  end;
end;

procedure TFrmIQUDComboListDlg.SeeExample1Click(Sender: TObject);
var
  AMesg: TStringList;
begin
  AMesg:= TStringList.Create;
  try
    AMesg.Add('select id as "ID", ');
    AMesg.Add('       name as "Division Name", ');
    AMesg.Add('       descrip as "Description" ');
    AMesg.Add('  from division ');
    AMesg.Add('');
    AMesg.Add('/* Note how each column is defined using ''as'' and double quotes */');
    IQShowStringList(AMesg);  // IQMsgFrm.pas
  finally
    AMesg.Free;
  end;
end;


procedure TFrmIQUDComboListDlg.sbtnVerifySQLClick(Sender: TObject);
begin
  ValidatePickListSQL;
end;

procedure TFrmIQUDComboListDlg.ValidatePickListSQL;
var
  Qry: TFDQuery;
begin
  QryUserDefList.CheckBrowseMode;

  Qry:= TFDQuery.Create(nil);
  with Qry do
  try
    ConnectionName := 'IQFD';
    SQL.Add( QryUserDefListPKLIST_SQL.asString );
    CheckAssignParams( Qry );
    Open;
  finally
    Free;
  end;
end;

procedure TFrmIQUDComboListDlg.wwDBComboBoxResultFieldDropDown(Sender: TObject);
var
  Qry: TFDQuery;
begin
  QryUserDefList.CheckBrowseMode;

  Qry:= TFDQuery.Create(nil);
  with Qry do
  try
    ConnectionName := 'IQFD';
    SQL.Add( QryUserDefListPKLIST_SQL.asString );
    CheckAssignParams( Qry );
    try
      FieldDefs.Update;
    except on E: Exception do
      begin
        IQError(Format('Unable to determine the column names - check the SQL statement and try again.'#13#13' Error: %s', [ E.Message ]));
        ABORT;
      end;
    end;

    GetFieldNames( wwDBComboBoxResultField.Items );
  finally
    Free;
  end;
end;

procedure TFrmIQUDComboListDlg.ValidatePicklistSettings;
begin
  ValidatePickListSQL;
  IQAssert( QryUserDefListPKLIST_FIELD_NAME.asString <> '', 'Result Field must be assigned - operation aborted.');
end;

procedure TFrmIQUDComboListDlg.CheckAssignParams( Qry: TFDQuery );
begin
  if Owner is TIQWebUDComboBox then
     (Owner as TIQWebUDComboBox).AssignPicklistQueryParams( Qry );
end;


end.
