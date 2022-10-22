unit IQMS.WebVcl.RepDefEdit;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  Vcl.Buttons,
  IQMS.Common.UCRPE32,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniLabel,
  uniDBText,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniTreeView,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TRepDefEdit = class(TUniForm)
    QryAllTables: TFDQuery;
    QryAllProcs: TFDQuery;
    SrcAllProcs: TDataSource;
    QryFields: TFDQuery;
    Panel1: TUniPanel;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    TabSheet3: TUniTabSheet;
    Panel2: TUniPanel;
    DBGrid1: TUniDBGrid;
    Panel3: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    TabSheet4: TUniTabSheet;
    Panel4: TUniPanel;
    DBGrid2: TUniDBGrid;
    Panel5: TUniPanel;
    DBNavigator3: TUniDBNavigator;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlLeft02: TUniPanel;
    Panel9: TUniPanel;
    Label2: TUniLabel;
    dbeditCurrent: TUniDBEdit;
    Label3: TUniLabel;
    treeCurrent: TUniTreeView;
    Label4: TUniLabel;
    dbeditCorrespond: TUniDBEdit;
    Label6: TUniLabel;
    TreeAllTables: TUniTreeView;
    Splitter1: TUniSplitter;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label7: TUniLabel;
    Label1: TUniLabel;
    Label5: TUniLabel;
    lblLanguageCode: TUniLabel;
    Panel10: TUniPanel;
    PnlGenCtrls: TUniPanel;
    DBText1: TUniDBText;
    DBEdit1: TUniDBEdit;
    DBLookupComboBox1: TUniDBLookupComboBox;
    wwDBComboBoxLanguageCode: TUniDBComboBox;
    sbtnClearExecBeforePrint: TUniSpeedButton;
    Label8: TUniLabel;
    QryMfgType: TFDQuery;
    QryMfgTypeMFGTYPE: TStringField;
    wwDBComboBoxMfgtype: TUniDBComboBox;
    popmSelectCriteria: TUniPopupMenu;
    DefinePickistOptionalColumns1: TUniMenuItem;
    pnlBottom1: TUniPanel;
    dbchkDisablePrintBtn: TUniDBCheckBox;
    lblOwnerName: TUniLabel;
    wwDBComboDlgOwner: TUniEdit;
    PkUser: TIQWebHPick;
    PkUserUSERNAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure treeCurrentExpanding(Sender: TObject; Node: TUniTreeNode);
    procedure treeCurrentMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbeditCurrentDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbeditCorrespondDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbeditCurrentDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure treeCurrentDblClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Repdef_CriteriaAfterInsert(DataSet: TDataSet);
    procedure RepDef_FormulasAfterInsert(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnClearExecBeforePrintClick(Sender: TObject);
    function GetPath:string;
    procedure AddStoredProcedureParameters;
    procedure DefinePickistOptionalColumns1Click(Sender: TObject);
    procedure popmSelectCriteriaPopup(Sender: TObject);
    procedure wwDBComboDlgOwnerCustomDlg(Sender: TObject);
    procedure wwDBComboDlgOwnerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure LoadTreeFromDataBase( Tree: TUniTreeView; ParentNode: TUniTreeNode );
    procedure LoadTreeFromQuery( Q: TFDQuery; FieldNo: Integer; Tree:TUniTreeView; ParentNode:TUniTreeNode );
    function GetFullName( Node: TUniTreeNode ):string;
    function GetRepDef: TFDTable;
    function GetRepDef_Criteria: TFDTable;
    function GetRepDef_Formulas: TFDTable;
    procedure SaveTables;
    procedure RestTables;
    procedure CancelChangesRollBack;
    procedure ValidateCriteria;
    function GetMaxSEQ( DataSet: TDataSet ):Integer;
    procedure LoadTreeFromRunTimeLiveQuery( AQueryComponentName: string; Tree:TUniTreeView; ParentNode:TUniTreeNode );
    function GetDataSetByName( AName: string ): TDataSet;
    procedure AssignDataSource;
    procedure LoadMfgtypes;
  public
    { Public declarations }
    FOnBeforeInsert: TDataSetNotifyEvent;
    FOnAfterInsert : TDataSetNotifyEvent;
    FOnAfterInsertFormulas:TDataSetNotifyEvent;

    CRDotNetObject: Variant;
    Crpe1:TCrpe;

    property FullName[ Node: TUniTreeNode ]:string read GetFullName;
    property RepDef: TFDTable read GetRepDef;
    property RepDef_Criteria: TFDTable read GetRepDef_Criteria;
    property RepDef_Formulas: TFDTable read GetRepDef_Formulas;
  end;

implementation

uses
  IQMS.WebVcl.REPDECRW,
  IQMS.WebVcl.RepDef,
  IQMS.Common.Controls,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.ResourceStrings,
  IQMS.Common.Registry,
  IQMS.Common.DataLib,
  IQMS.WebVcl.RepDefVersions,
  IQMS.Common.MfgShare,
  IQMS.Common.DataConst,
  IQMS.WebVcl.RepDefParamPkListCols;

{$R *.DFM}

procedure TRepDefEdit.FormCreate(Sender: TObject);
begin
  AssignDataSource;

  (FDManager.FindConnection(cnstFDConnectionName) as TFDConnection).StartTransaction;

  SaveTables;

  {Show all avail procs}
  QryAllProcs.Open;

  {Currently Open}
  LoadTreeFromDataBase( TreeCurrent, TreeCurrent.Items.GetFirstNode );

  {Load standard and ud mfgtypes}
  LoadMfgtypes;

  {All Tables in DataBase}
  LoadTreeFromQuery( QryAllTables, 0, TreeAllTables, TreeAllTables.Items.GetFirstNode );

  TreeAllTables.Items.GetFirstNode.Expanded:= TRUE;
  TreeCurrent.Items.GetFirstNode.Expanded:= TRUE;
  PageControl1.ActivePage:= TabSheet1;

  //iqregfrm.IQRegFormRead(Self, [PnlLeft01, PnlLeft02]);

  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlGenCtrls);

  AddStoredProcedureParameters;
  if RepDef.FieldByName('stored_procedure').asString = 'Y' then
  begin
    TabSheet2.TabVisible:= False;
    TabSheet3.TabVisible:= False;
    TabSheet4.TabVisible:= False;
  end;

  wwDBComboDlgOwner.Enabled:= RepDef.FieldByName('ReportOwner').asString <> 'IQMS';
end;

procedure TRepDefEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // RestTables;
end;

procedure TRepDefEdit.FormDestroy(Sender: TObject);
begin
  //if (DBase <> NIL) and DBase.InTransaction then
  //   DBase.RollBack;
  CancelChangesRollBack;
  RestTables;
end;

function CustomSortCurrentOpenDataSets( Node1, Node2: TUniTreeNode; Data: Integer): Integer; stdcall;
begin
  if LongInt( Node1.Data ) = 0 then
     Result:= -1
  else
     Result:= 1;
end;

procedure TRepDefEdit.SaveTables;
begin
  with RepDef_Criteria do
  begin
    FOnAfterInsert := AfterInsert;
    AfterInsert    := Repdef_CriteriaAfterInsert;
    FOnBeforeInsert:= BeforeInsert;
    BeforeInsert   := NIL;
  end;

  with RepDef_Formulas do
  begin
    FOnAfterInsertFormulas:= AfterInsert;
    AfterInsert:= RepDef_FormulasAfterInsert;
  end;
end;

procedure TRepDefEdit.RestTables;
begin
  with RepDef_Criteria do
  begin
    AfterInsert := FOnAfterInsert;
    BeforeInsert:= FOnBeforeInsert;
  end;

  with RepDef_Formulas do
    AfterInsert:= FOnAfterInsertFormulas;

  RepDef_Criteria.Refresh;
  RepDef_Formulas.Refresh;
end;

function TRepDefEdit.GetRepDef: TFDTable;
begin
  Result:= TfrmRepDef(Owner).RepDef;
end;

function TRepDefEdit.GetRepDef_Criteria: TFDTable;
begin
  Result:= TfrmRepDef(Owner).RepDef_Criteria;
end;

function TRepDefEdit.GetRepDef_Formulas: TFDTable;
begin
  Result:= TfrmRepDef(Owner).RepDef_Formulas;
end;

procedure TRepDefEdit.LoadTreeFromQuery( Q: TFDQuery; FieldNo: Integer; Tree:TUniTreeView; ParentNode:TUniTreeNode );
var
  o:TUniTreeNode;
  i:integer;
begin
  {Delete whatever is there}
  for i := 0 to ParentNode.Count-1 do
   ParentNode.Item[i].Destroy;
//  ParentNode.DeleteChildren;

  {Reload}
  Q.Open;
  Tree.Items.BeginUpdate;
  try
    while not Q.Eof do
    begin
      o:= Tree.Items.AddChild( ParentNode,  Q.Fields[ FieldNo ].asString );
      if o.Parent = Tree.Items.GetFirstNode then
         Tree.Items.AddChild( o, '');   {Dummy record to get + on the left}
      Q.Next;
    end;
  finally
    Tree.Items.EndUpdate;
  end;
  Q.Close;
end;

procedure TRepDefEdit.LoadTreeFromDataBase( Tree: TUniTreeView; ParentNode: TUniTreeNode );
var
  I    : Integer;
  o    : TUniTreeNode;
  AName: string;
begin
  with (FDManager.FindConnection(cnstFDConnectionName) as TFDConnection) do
  try
    Tree.Items.BeginUpdate;

    for I:= 0 to DatasetCount - 1 do
      if (DataSets[I] is TFDTable) then with DataSets[I] as TFDTable do
         begin
           if Pos( 'REPDEF', TableName ) = 0 then
           begin
             AName:= StrTran( TableName, 'IQMS.', '');
             o:= Tree.Items.AddChild( ParentNode, AName );
             o.Data:= Pointer(0);           {to indicate TFDtable}
             Tree.Items.AddChild( o, '');   {Dummy record to get + on the left}
           end
         end
      else if (DataSets[I] is TFDQuery) and not( DataSets[I] is TIQWebHPick) and (DataSets[I].Name > '') then with DataSets[I] as TFDQuery do
         begin
           AName:= Name;
           o:= Tree.Items.AddChild( ParentNode, AName );
           o.Data:= Pointer(1);           {to indicate TFDuery}
           Tree.Items.AddChild( o, '');   {Dummy record to get + on the left}
         end;
  finally
    Tree.Items.EndUpdate;
  end;
//  treeCurrent.CustomSort(@CustomSortCurrentOpenDataSets, 0);
end;

procedure TRepDefEdit.treeCurrentExpanding(Sender: TObject;
  Node: TUniTreeNode);
begin
  if Node.Level = 1 then
    case LongInt( Node.Data ) of
      0: with QryFields do
         begin
           Close;
           Params[ 0 ].asString:= UpperCase( Node.Text );
           LoadTreeFromQuery( QryFields, 0, TUniTreeView(Sender), Node );
         end;

      1: LoadTreeFromRunTimeLiveQuery( Node.Text, TUniTreeView(Sender), Node );
    end;
end;

procedure TRepDefEdit.treeCurrentMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with (Sender as TUniTreeView) do
    if Selected.Level = 2 then
      BeginDrag( FALSE );
end;

procedure TRepDefEdit.dbeditCurrentDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= Source = TreeCurrent;
end;

procedure TRepDefEdit.dbeditCorrespondDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= Source = TreeAllTables;
end;

function TRepDefEdit.GetFullName( Node: TUniTreeNode ):string;
begin
  Result:= Node.Text;
  while (Node.Parent <> NIL) and (Node.Parent.Text <> 'IQMS') do
  begin
    Node:= Node.Parent;
    Result:= Node.Text + '.' + Result;
  end;
end;

procedure TRepDefEdit.dbeditCurrentDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  with (Sender as TUniDBEdit).DataSource.DataSet as TFDTable do
  begin
    if State = dsBrowse then
      Edit;
    FieldByName( (Sender as TUniDBEdit).DataField ).asString:= FullName[ (Source as TUniTreeView).Selected ];
  end;
end;

procedure TRepDefEdit.treeCurrentDblClick(Sender: TObject);
begin
  with (Sender as TUniTreeView) do
  if Selected.Level = 2 then
  begin
    RepDef.Edit;
    if Sender = TreeCurrent then
      RepDef.FieldByName( 'CURR_REC_COL_NAME' ).asString:= FullName[ Selected ]
    else
      RepDef.FieldByName( 'CRW_MATCH_COL_NAME' ).asString:= FullName[ Selected ];
  end;
end;

procedure TRepDefEdit.btnCancelClick(Sender: TObject);
begin
  CancelChangesRollBack;
  Close;
end;

procedure TRepDefEdit.CancelChangesRollBack;
begin
  if RepDef.State in [dsEdit, dsInsert] then
    RepDef.Cancel;
  if RepDef_Criteria.State in [dsEdit, dsInsert] then
    RepDef_Criteria.Cancel;
  if RepDef_Formulas.State in [dsEdit, dsInsert] then
    RepDef_Formulas.Cancel;
  if (FDManager.FindConnection(cnstFDConnectionName) as TFDConnection).InTransaction then
     (FDManager.FindConnection(cnstFDConnectionName) as TFDConnection).RollBack;
end;

procedure TRepDefEdit.btnOKClick(Sender: TObject);
begin
  ValidateCriteria;
  if RepDef.State in [dsEdit, dsInsert] then
    RepDef.Post;
  if RepDef_Criteria.State in [dsEdit, dsInsert] then
    RepDef_Criteria.Post;
  if RepDef_Formulas.State in [dsEdit, dsInsert] then
    RepDef_Formulas.Post;
  if (FDManager.FindConnection(cnstFDConnectionName) as TFDConnection) <> NIL then
     (FDManager.FindConnection(cnstFDConnectionName) as TFDConnection).Commit;
  Close;
end;

procedure TRepDefEdit.ValidateCriteria;
var
  CurrentRecEmpy : Boolean;
  CRWMatchRecEmpy: Boolean;
  OperNotFound   : Boolean;
begin
  {RepDef}
  with RepDef do
  begin
    CurrentRecEmpy := Empty( FieldByName('CURR_REC_COL_NAME').AsString  );
    CRWMatchRecEmpy:= Empty( FieldByName('CRW_MATCH_COL_NAME').AsString );
    if CurrentRecEmpy <> CRWMatchRecEmpy then
      // 'Missing Current Record Column Name Indentifier or Matching CRW Column Name Indentifier'
      raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000255);
  end;

  {RepDef Criteria}
  with RepDef_Criteria do
  begin
    OperNotFound:= FALSE;
    //Last;
    //if FieldByName('BINARY_OPERATOR').asString <> '' then
    //begin
    //  Edit;
    //  FieldByName('BINARY_OPERATOR').asString:= '';
    //end;
    First;
    while not Eof do
    begin
      if OperNotFound then
         // 'Missing Operator.  Please Check AND/OR column in Selection Criteria Grid.'
         raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000256 );

      if FieldByName('BINARY_OPERATOR').asString = '' then
         OperNotFound:= TRUE;
      Next;
    end;
  end; {with RepDef_Criteria}

  {Repdef Formulas}
  if RepDef_Formulas.State in [dsEdit, dsInsert ] then
     RepDef_Formulas.Post;
end;

procedure TRepDefEdit.Repdef_CriteriaAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('SEQ').asInteger:= GetMaxSEQ( DataSet )+1;
    FieldByName('UNARY_OPERATOR').asString:= '=';
    FieldByName('BINARY_OPERATOR').asString:= 'AND';
  end;
end;

procedure TRepDefEdit.RepDef_FormulasAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('SEQ').asInteger:= GetMaxSEQ( DataSet )+1;
    FieldByName('FORM_TYPE').asString:= 'NUMBER';
  end;
end;


function TRepDefEdit.GetMaxSEQ( DataSet: TDataSet ):Integer;
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName := 'IQFD';
    SQL.Add(Format('Select Max(SEQ) from %s where app_id = ''%s'' and RepName = ''%s'' ',
                   [TFDTable(DataSet).TableName, RepDef.FieldByName('APP_ID').asString , RepDef.FieldByName('REPNAME').asString] ));
    Open;
    Result:= Fields[ 0 ].asInteger;
  finally
    Free;
  end;
end;

procedure TRepDefEdit.DBGrid1EditButtonClick(Sender: TObject);
begin
  with TCRWColumns.Create(self) do
  try
    TreeCRWColumns.Items.Assign( TreeAllTables.Items );
    TreeCRWColumns.Items.GetFirstNode.Expanded:= TRUE;
    TreeCRWColumns.OnNodeExpand:= TreeCurrentExpanding;

    if ShowModal = mrOK then with Repdef_Criteria, TreeCRWColumns.Selected do
    begin
       if State = dsBrowse then Edit;
       FieldByName('CRW_COL_NAME').asString:= Parent.Text + '.'+ Text;
    end;
  finally
    Free;
  end;
end;

procedure TRepDefEdit.sbtnClearExecBeforePrintClick(Sender: TObject);
begin
  if not (RepDef.State in [dsEdit, dsInsert]) then
    RepDef.Edit;
  RepDef.FieldByName('BEFORE_PRINT').asString:= '';
end;

function TRepDefEdit.GetPath:string;
begin
  Result:= '';
  with TIQWebRegistry.Create do
  try
    RootKey:= HKEY_LOCAL_MACHINE;
    if OpenKey('\Software\IQMS\IQWin32', FALSE) then
      if ValueExists( 'REPORTS' ) then
        Result:= StrTran( ReadString( 'REPORTS' ) + '\', '\\', '\');
  finally
    Free;
  end;
end;

Procedure TRepDefEdit.AddStoredProcedureParameters;
var
  RepName : String;
  DebugStr: String;
  App_ID: String;
  //T: TStrings;
  keepProcessing: Boolean;
  ValidReport   : Boolean;
  ParamType     : String;
  FileName      : String;
  S             : String;
  Seq           : Integer;
  AParamName    : String;

  Procedure AddParameters;
  var
    i  : Integer;
    CW : Word;
  begin
    CheckDisableFPUExceptions( CW );
    try
      try
        DebugStr:= 'Check Create Report Object';
        CheckCreateReportObject( Crpe1, CRDotNetObject, self );

        // set the report name & enumerate the report's parameters
        DebugStr:= 'Assign Path and RepName';
        SetReportName( Crpe1, CRDotNetObject, FileName );

        DebugStr:= 'Check Configure .NET Report';
        CheckConfigureDNetRpt( CRDotNetObject );

        DebugStr:= 'Get Params Count';
        Seq := 1;
        for i:=0 to GetParamsCount( Crpe1, CRDotNetObject ) - 1 do  // T.COunt
        begin
          DebugStr:= 'Get Param Name';
          AParamName:= GetParamNameAtIndex( Crpe1, CRDotNetObject, i );
          if not ( ( AParamName = 'CRW_CURSOR') or ( AParamName = 'V_EPLANT_ID') ) then  // T[i]
          begin
            S := Uppercase(Copy(AParamName, 1, 5));
            if S = 'V_STR' then
              ParamType := 'ARINVT.CUSER1'
            else if S = 'V_NUM' then
              ParamType := 'ARINVT.ID'
            else if S = 'V_DAT' then
              ParamType := 'ARINVT.LDATE';

            ExecuteCommandFmt('insert into repdef_criteria (app_id, repname, seq, crw_col_name, descrip, binary_operator) ' +
                  'values (''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s'')', [App_Id, RepName, Seq, ParamType, AParamName, 'AND']);
            Seq := Seq + 1;
          end;
        end;
      except on E: Exception do
        raise Exception.CreateFmt('%s (RepdefEd Action: %s)', [ E.Message, DebugStr ]);
      end;
    finally
      CheckFreeCRDotNetObject( CRDotNetObject );
      CheckRestoreFPU( CW );
      CheckFreeCRPEObject( Crpe1 );
    end;
  end;

begin
  // retrieve some needed information
  RepName := RepDef.FieldByName('repname').asString;
  FileName := GetPath + RepName;
  App_ID := RepDef.FieldByName('APP_ID').asString;

  // exit if this is not a Stored Procedure report
  if RepDef.FieldByName('stored_procedure').asString <>'Y' then
    EXIT;

  // exit if there are already parameters in the database
  if not ( SelectValueFmtAsString( 'select to_char(count(*)) from repdef_criteria where app_id = ''%s'' and repname = ''%s''', [App_Id, RepName] ) = '0' ) then
    EXIT;

  // add the Parameters
  AddParameters;
end;


function TRepDefEdit.GetDataSetByName( AName: string ): TDataSet;
var
  i: Integer;
begin
   Result:= NIL;
   with (FDManager.FindConnection(cnstFDConnectionName) as TFDConnection) do
     for i:= 0 to DatasetCount - 1 do if (CompareText( DataSets[ i ].Name, AName ) = 0) then
     begin
       Result:= DataSets[i];
       Break;
     end;
end;


procedure TRepDefEdit.LoadTreeFromRunTimeLiveQuery( AQueryComponentName: string; Tree: TUniTreeView; ParentNode: TUniTreeNode );
var
  AQuery: TDataSet;
  I     : Integer;
  o     : TUniTreeNode;
begin
  {Delete whatever is there}

  for i := 0 to ParentNode.Count-1 do
   ParentNode.Item[i].Destroy;
//  ParentNode.DeleteChildren;

  AQuery:= GetDataSetByName( AQueryComponentName );
  if not Assigned( AQuery ) then
     EXIT;

  with AQuery do
  try
    Tree.Items.BeginUpdate;
    for I:= 0 to FieldCount - 1 do
      Tree.Items.AddChild( ParentNode,  Fields[ I ].FieldName );
  finally
    Tree.Items.EndUpdate;
  end;
end;

procedure TRepDefEdit.AssignDataSource;
begin
  {Jan-17-2006 - Reports Catalog support}
  DBText1.DataSource:= TFRmRepDef(Owner).SrcRepDef;
  DBEdit1.DataSource:= TFRmRepDef(Owner).SrcRepDef;
  DBLookupComboBox1.DataSource:= TFRmRepDef(Owner).SrcRepDef;

  DBNavigator1.DataSource:= TFRmRepDef(Owner).SrcRepDef_Criteria;
  DBGrid1.DataSource:= DBNavigator1.DataSource;

  DBNavigator3.DataSource:= TFRmRepDef(Owner).SrcRepDefFormulas;
  DBGrid2.DataSource:= DBNavigator3.DataSource;
end;

procedure TRepDefEdit.LoadMfgtypes;
var
  I: Integer;
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    // load predefined
    for I:= 0 to High(IQMS.Common.MfgShare.IQPredefinedMfgType) do
      AList.Add( IQMS.Common.MfgShare.IQPredefinedMfgType[ I ]);

    // load used defined
    Reopen(QryMfgType);
    with QryMfgType do while not Eof do
    begin
      if AList.IndexOf( FieldByName('mfgtype').asString ) = -1 then
         AList.Add( FieldByName('mfgtype').asString );
      Next;
    end;
    QryMfgType.Close;

    // sort and assign to dropdown
    AList.Sort;
    wwDBComboBoxMfgtype.Items.Assign( AList );
  finally
    AList.Free;
  end;
end;

procedure TRepDefEdit.DefinePickistOptionalColumns1Click(Sender: TObject);
begin
  RepDef_Criteria.CheckBrowseMode;
  TFrmRepDefParamPkListCols.DoShowModal( self,                                    // repdef_param_pklist_cols.pas
                                         RepDef.FieldByName('APP_ID').asString,
                                         RepDef.FieldByName('REPNAME').asString,
                                         RepDef_Criteria.FieldByName('CRW_COL_NAME').asString );
end;

procedure TRepDefEdit.popmSelectCriteriaPopup(Sender: TObject);
begin
  RepDef_Criteria.CheckBrowseMode;
  DefinePickistOptionalColumns1.Enabled:= (RepDef.FieldByName('APP_ID').asString > '')
                                           and
                                          (RepDef.FieldByName('REPNAME').asString > '')
                                           and
                                          (RepDef_Criteria.FieldByName('CRW_COL_NAME').asString > '');
end;


procedure TRepDefEdit.wwDBComboDlgOwnerCustomDlg(Sender: TObject);
begin
  with PkUser do
    if Execute then
    begin
       ExecuteCommandParam( 'update repdef_repository '+
                    '   set owner = :owner    '+
                    'where repname = :repname ',
                    [ 'REPNAME', 'OWNER' ],
                    [ GetValue('username'),
                      RepDef.FieldByName('REPNAME').asString ]);
       Repdef.Refresh;
    end;
end;


procedure TRepDefEdit.wwDBComboDlgOwnerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Delete then
  begin
    ExecuteCommandParam( 'update repdef_repository '+
                 '   set owner = null      '+
                 'where repname = :repname ',
                 [ 'REPNAME' ],
                 [ RepDef.FieldByName('REPNAME').asString ]);
    Repdef.Refresh;
    TUniEdit(Sender).Text:= '';
    Key:= 0;
  end;
end;

end.
