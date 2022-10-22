unit VGroup;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame;

type
  TFrmVGroup = class(TUniForm)
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    SrcPage_Group: TDataSource;
    TblPage_Group: TFDTable;
    TblPage_GroupID: TBCDField;
    TblPage_GroupNAME: TStringField;
    TblPage_GroupEPLANT_ID: TBCDField;
    Panel1: TUniPanel;
    Panel4: TUniPanel;
    Panel3: TUniPanel;
    SrcPage_Group_Detail: TDataSource;
    wwDBGrid1: TIQUniGridControl;
    wwDBGrid2: TIQUniGridControl;
    wwDBLookupComboEqno: TUniDBLookupComboBox;
    sbtnAdd: TUniSpeedButton;
    QryPage_Group_Detail: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryPage_Group_DetailID: TBCDField;
    QryPage_Group_DetailPAGE_GROUP_ID: TBCDField;
    QryPage_Group_DetailWORK_CENTER_ID: TBCDField;
    QryPage_Group_DetailEQNO: TStringField;
    QryPage_Group_DetailCNTR_DESC: TStringField;
    QryWorkCenter: TFDQuery;
    QryWorkCenterID: TBCDField;
    QryWorkCenterEQNO: TStringField;
    QryWorkCenterCNTR_DESC: TStringField;
    QryWorkCenterEPLANT_ID: TBCDField;
    QryPage_Group_DetailEqno_Disp: TStringField;
    QryPage_Group_DetailCntr_Desc_Disp: TStringField;
    ImageList1: TUniImageList;
    SecurityRegister1: TIQWebSecurityRegister;
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure sbtnAddClick(Sender: TObject);
    procedure QryPage_Group_DetailNewRecord(DataSet: TDataSet);
    procedure QryPage_Group_DetailAfterPost(DataSet: TDataSet);
    procedure wwDBGrid2TitleButtonClick(Sender: TObject;
      AFieldName: String);
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] VGroup.pas(84): E2003 Undeclared identifier: 'TwwTitleImageAttributes'}
    {procedure wwDBGrid2CalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);}
    { TODO -oSanketG -cWebConvert : Need to find suitable component to replace TNavigatBtn,
    [dcc32 Error] VGroup.pas(86): E2003 Undeclared identifier: 'TNavigateBtn' }
    {procedure DBNavigator2BeforeAction(Sender: TObject;
      Button: TNavigateBtn);}
    procedure FormShow(Sender: TObject);
    procedure QryPage_Group_DetailCalcFields(DataSet: TDataSet);
    procedure wwDBLookupComboEqnoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    FSortFieldName: string;
    FSortAscending: Boolean;
    procedure SortGridBy(AFieldName: string);
  public
    { Public declarations }
    class procedure Configure;
  end;



implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  VWrkCntr_Pk,
  IQMS.Common.Numbers
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSecIns
  ;


class procedure TFrmVGroup.Configure;
var
  FrmVGroup: TFrmVGroup;
begin
  FrmVGroup := TFrmVGroup.Create(uniGUIApplication.uniApplication);
  FrmVGroup.ShowModal;
end;

procedure TFrmVGroup.FormCreate(Sender: TObject);
var
  S: string;
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1, wwDBGrid2 ]);

  S:= '';
  IQRegStringScalarRead( self, 'SortFieldName', S );
  if S = '' then S:= 'EQNO_DISP';
  SortGridBy( S );
end;

procedure TFrmVGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1, wwDBGrid2 ]);
  IQRegStringScalarWrite( self, 'SortFieldName', FSortFieldName );
end;

procedure TFrmVGroup.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmVGroup.AssignEPlantFilter(DataSet: TDataSet);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit, dependent on SecurityManager }
  //IQAssignEPlantFilter( DataSet );
end;

procedure TFrmVGroup.sbtnAddClick(Sender: TObject);
var
  AList: TStringList;
  I    : Integer;
begin
  AList:= TStringList.Create;
  try
    if TFrmWorkCenterPkList.Execute( AList ) then  {VWrkCntr_Pk.pas}
    begin
       for I:= 0 to AList.Count - 1 do
         ExecuteCommandFmt('insert into page_group_detail           '+
                   '      ( page_group_id, work_center_id ) '+
                   ' select %f, %s from dual                '+
                   '  MINUS                                 '+
                   ' select page_group_id, work_center_id   '+
                   '   from page_group_detail               '+
                   '  where page_group_id = %f              ',
                   [ TblPage_GroupID.asFloat,
                     AList[ I ],
                     TblPage_GroupID.asFloat ]);

       RefreshDataSetByID( QryPage_Group_Detail );
    end;
  finally
    AList.Free;
  end;
end;

procedure TFrmVGroup.QryPage_Group_DetailNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('id').asFloat:= GetNextID('PAGE_GROUP_DETAIL');
  DataSet.FieldByName('page_group_id').asFloat:= TblPage_GroupID.asFloat;
end;

procedure TFrmVGroup.QryPage_Group_DetailAfterPost(DataSet: TDataSet);
begin
  try
    FDManager.FindConnection('IQFD').ApplyUpdates([ TFDQuery( DataSet )]);
  except on E: Exception do
    begin
      TFDQuery(DataSet).CancelUpdates;
      raise;
    end;
  end;
end;

procedure TFrmVGroup.QryPage_Group_DetailCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('work_center_id').asFloat > 0 then
  begin
    QryPage_Group_DetailEqno_Disp.asString:= SelectValueByID('eqno', 'work_center', DataSet.FieldByName('work_center_id').asFloat );
    QryPage_Group_DetailCntr_Desc_Disp.asString:= SelectValueByID('cntr_desc', 'work_center', DataSet.FieldByName('work_center_id').asFloat );
  end;
end;

procedure TFrmVGroup.wwDBGrid2TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  if (CompareText(AFieldName, 'Eqno_Disp') = 0 )
     or
     (CompareText(AFieldName, 'CNTR_DESC_disp') = 0) then
    SortGridBy( AFieldName );
end;

procedure TFrmVGroup.wwDBLookupComboEqnoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if modified then
  begin
    QryPage_Group_Detail.Edit;
    QryPage_Group_DetailWORK_CENTER_ID.asFloat:= LookupTable.FieldByName('id').asFloat;
  end;
end;

procedure TFrmVGroup.SortGridBy( AFieldName: string );
var
  ID: Real;
  I : Integer;
  J : Integer;
begin
  ID:= 0;
  if QryPage_Group_Detail.Active then
  begin
    QryPage_Group_Detail.CheckBrowseMode;
    ID:= QryPage_Group_Detail.FieldByName('ID').asFloat;
  end;

  with QryPage_Group_Detail do
  begin
    Close;

    I:= SQL.IndexOf( '-- do not remove this line' );
    for J:= SQL.Count - 1 downto I+1 do
      SQL.Delete( J );

    if FSortFieldName = AFieldName then
       FSortAscending:= not FSortAscending
    else
       FSortAscending:= TRUE;

    FSortFieldName:= AFieldName;

    if CompareText( FSortFieldName, 'EQNO_DISP') = 0 then
       SQL.Add( 'order by eqno' )
    else
       SQL.Add( 'order by cntr_desc' );

    if not FSortAscending then
       SQL.Add( 'desc' );

    Open;

    if ID > 0 then
       Locate('ID', ID, []);
  end;
end;

{ TODO -oSanketG -cWebConvert : Need to revisit ,
[dcc32 Error] VGroup.pas(277): E2005 'TwwTitleImageAttributes' is not a type identifier}
{procedure TFrmVGroup.wwDBGrid2CalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
  if Field.FieldName = FSortFieldName then
     TitleImageAttributes.ImageIndex:= IIf( FSortAscending, 0, 1 )
  else
     TitleImageAttributes.ImageIndex:= -1
end;}

{ TODO -oSanketG -cWebConvert : Need to revisit ,
[dcc32 Error] VGroup.pas(286): E2005 'TNavigateBtn' is not a type identifier}
{procedure TFrmVGroup.DBNavigator2BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
     RefreshDataSetByID( QryPage_Group_Detail );
     ABORT;
  end;
end;}

procedure TFrmVGroup.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit, dependent on IQSecIns }
  //EnsureSecurityInspectorOnTopOf( self ); // IQSecIns.pas
end;


end.
