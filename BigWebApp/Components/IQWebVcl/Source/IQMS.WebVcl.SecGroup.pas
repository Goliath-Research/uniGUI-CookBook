unit IQMS.WebVcl.SecGroup;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Data.DB,
  vcl.dbctrls,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  Vcl.Wwdatsrc,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmSecurityGroups = class(TUniForm)
    pnlLeftMain: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    pnlGroupsTop: TUniPanel;
    Splitter2: TUniSplitter;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    wwDBGridGroups: TIQUniGridControl;
    NavGroup: TUniDBNavigator;
    pnlAssignedRoles: TUniPanel;
    Splitter3: TUniSplitter;
    Panel14: TUniPanel;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    Panel9: TUniPanel;
    NavGroupRoles: TUniDBNavigator;
    Panel10: TUniPanel;
    NavSubGroup: TUniDBNavigator;
    Panel11: TUniPanel;
    Panel12: TUniPanel;
    Panel13: TUniPanel;
    wwDBGridRoles: TIQUniGridControl;
    wwDBGridSubGroups: TIQUniGridControl;
    SrcGroup: TDataSource;
    QryGroup: TFDQuery;
    UpdateSQLGroup: TFDUpdateSQL;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryGroupID: TBCDField;
    QryGroupGROUP_NAME: TStringField;
    QryGroupDESCRIP: TStringField;
    sbtnSearch: TUniSpeedButton;
    PkGroup: TIQWebHPick;
    PkGroupID: TBCDField;
    PkGroupGROUP_NAME: TStringField;
    PkGroupDESCRIP: TStringField;
    SrcGroupRoles: TDataSource;
    QryGroupRoles: TFDQuery;
    QryGroupRolesID: TBCDField;
    QryGroupRolesS_GROUP_ID: TBCDField;
    QryGroupRolesGRANTED_ROLE_NAME: TStringField;
    wwDBComboDlgRoleName: TUniEdit;
    UpdateSQLGroupRole: TFDUpdateSQL;
    PkRole: TIQWebHPick;
    PkRoleROLE_NAME: TStringField;
    SrcSubGroup: TDataSource;
    QrySubGroup: TFDQuery;
    UpdateSQLSubGroup: TFDUpdateSQL;
    QrySubGroupID: TBCDField;
    QrySubGroupS_GROUP_ID: TBCDField;
    QrySubGroupGRANTED_S_GROUP_ID: TBCDField;
    QrySubGroupGrantedGroupName: TStringField;
    QrySubGroupGrantedGroupDescrip: TStringField;
    wwDBComboDlgGroupName: TUniEdit;
    SrcOverviewGroups: TDataSource;
    QryOverviewGroups: TFDQuery;
    QryOverviewGroupsID: TBCDField;
    QryOverviewGroupsGROUP_NAME: TStringField;
    Splitter4: TUniSplitter;
    SrcOverviewRoles: TDataSource;
    QryOverviewRoles: TFDQuery;
    QryOverviewRolesGRANTED_ROLE_NAME: TStringField;
    popmGroupOverview: TUniPopupMenu;
    GotoGroup1: TUniMenuItem;
    wwDBGrid1: TIQUniGridControl;
    Contents1: TUniMenuItem;
    pnlGroupOverview: TUniPanel;
    wwDBGrid2: TIQUniGridControl;
    popmGroups: TUniPopupMenu;
    AssignedUser1: TUniMenuItem;
    CloneGroup1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryGroupBeforePost(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure sbtnSearchClick(Sender: TObject);
    procedure QryGroupRolesNewRecord(DataSet: TDataSet);
    procedure QryGroupRolesBeforePost(DataSet: TDataSet);
    procedure wwDBComboDlgRoleNameCustomDlg(Sender: TObject);
    procedure wwDBComboDlgGroupNameCustomDlg(Sender: TObject);
    procedure QrySubGroupBeforePost(DataSet: TDataSet);
    procedure GotoGroup1Click(Sender: TObject);
    procedure QryGroupBeforeDelete(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AssignedUser1Click(Sender: TObject);
    procedure CloneGroup1Click(Sender: TObject);
    procedure popmGroupsPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QrySubGroupCalcFields(DataSet: TDataSet);
    procedure QryGroupBeforeRefresh(DataSet: TDataSet);
  private
    procedure UpdateGroupHierarchy;
    procedure CheckCircularReference;
    procedure CheckConfirmDeleteWhenUsersAssignedToGroup(AGroup_ID: Real);
    procedure CloneSecurityGroupShell(AGroup_ID: Real);
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal( AOwner: TComponent );
    class procedure DoShow( AOwner: TComponent );
    constructor Create( AOwner: TComponent ); override;
  end;

var
  FrmSecurityGroups: TFrmSecurityGroups;

implementation

{$R *.dfm}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.MsgConf,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecGroupClone,
  IQMS.WebVcl.SecGroupUsers,
  IQMS.WebVcl.ResourceStrings;


{ TFrmSecurityGroups }

constructor TFrmSecurityGroups.Create(AOwner: TComponent);
begin
  inherited;
  IQSetTablesActive( TRUE, self );
end;

class procedure TFrmSecurityGroups.DoShowModal(AOwner: TComponent);
begin
  with self.Create(AOwner) do
  try
    ShowModal;
  finally
    Release;
  end;
end;

class procedure TFrmSecurityGroups.DoShow( AOwner: TComponent );
begin
  self.Create(AOwner).Show;
end;

procedure TFrmSecurityGroups.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self, pnlLeftMain, pnlGroupsTop, pnlAssignedRoles, pnlGroupOverview,
                         wwDBGridGroups, wwDBGridRoles, wwDBGridSubGroups, wwDBGrid2, wwDBGrid1 ]);
end;

procedure TFrmSecurityGroups.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  IQRegFormWrite( self, [ self, pnlLeftMain, pnlGroupsTop, pnlAssignedRoles, pnlGroupOverview,
                          wwDBGridGroups, wwDBGridRoles, wwDBGridSubGroups, wwDBGrid2, wwDBGrid1 ]);
end;

procedure TFrmSecurityGroups.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSecurityGroups.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmSecurityGroups.QryGroupBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 's_group' );
end;

procedure TFrmSecurityGroups.QryGroupBeforeRefresh(DataSet: TDataSet);
begin
  IQCheckRefresh( NavGroup, nbRefresh );
end;

procedure TFrmSecurityGroups.ApplyUpdates(DataSet: TDataSet);
begin
  //IQApplyUpdateToTable(DataSet);
  UpdateGroupHierarchy;
end;

procedure TFrmSecurityGroups.sbtnSearchClick(Sender: TObject);
begin
  with PkGroup do
    if Execute then
       QryGroup.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmSecurityGroups.QryGroupRolesNewRecord(DataSet: TDataSet);
begin
  IQMS.Common.DataLib.ClearFieldValues(DataSet);
  DataSet.FieldByName('S_GROUP_ID').asFloat:= QryGroupID.asFloat;
end;

procedure TFrmSecurityGroups.QryGroupRolesBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 's_group_roles' );
end;

procedure TFrmSecurityGroups.wwDBComboDlgRoleNameCustomDlg(Sender: TObject);
begin
  with PkRole do
    if Execute then
    begin
      QryGroupRoles.Edit;
      QryGroupRolesGRANTED_ROLE_NAME.asString:= GetValue('role_name');
    end;
end;

procedure TFrmSecurityGroups.wwDBComboDlgGroupNameCustomDlg(Sender: TObject);
begin
  with PkGroup do
    if Execute then
    begin
      QrySubGroup.Edit;
      QrySubGroupGRANTED_S_GROUP_ID.asFloat:= GetValue('id');
      QrySubGroupGrantedGroupName.asString:= GetValue('group_name');
      QrySubGroupGrantedGroupDescrip.asString:= GetValue('descrip');
    end;
end;

procedure TFrmSecurityGroups.UpdateGroupHierarchy;
begin
  Reopen(QryOverviewGroups);
  Reopen(QryOverviewRoles);
end;

procedure TFrmSecurityGroups.CheckCircularReference;
var
  AParentNodes: TStringList;
  ASubNodes   : TStringList;
  I           : Integer;
begin
  AParentNodes:= TStringList.Create;
  ASubNodes   := TStringList.Create;
  try
    {Load the chain of all the nodes above current node}
    LoadColumnValueIntoStringList( AParentNodes,
                                         IQFormat( 'select distinct s_group_id from s_group_roles start with granted_s_group_id = %f connect by prior s_group_id = granted_s_group_id', [ QrySubGroupS_GROUP_ID.asFloat ]));
    {Append current node to the list of parents}
    AParentNodes.Add( QrySubGroupS_GROUP_ID.asString );

    {Load all the subnodes of the node we are trying to append}
    LoadColumnValueIntoStringList( ASubNodes,
                                         IQFormat('select granted_s_group_id from s_group_roles '+
                                                  ' where granted_s_group_id is not null ' +
                                                  ' start with s_group_id = %f '+
                                                  ' connect by s_group_id = prior granted_s_group_id', [ QrySubGroupGRANTED_S_GROUP_ID.asFloat ]));

    {Append new subgroup node to the list of subnodes}
    ASubNodes.Add( QrySubGroupGRANTED_S_GROUP_ID.asString );

    {Check each subnode against parent nodes. If one found - report circular reference}
    for I:= 0 to ASubNodes.Count - 1 do
      IQAssert( AParentNodes.IndexOf( ASubNodes[ I ]) = -1, 'Circular reference detected - operation aborted.' );
  finally
    AParentNodes.Free;
    ASubNodes.Free;
  end;
end;

procedure TFrmSecurityGroups.QrySubGroupBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 's_group_roles' );
  CheckCircularReference;
end;

procedure TFrmSecurityGroups.QrySubGroupCalcFields(DataSet: TDataSet);
begin
  QrySubGroupGrantedGroupName.asString:= SelectValueFmtAsString('select group_name from s_group where id = %f', [QrySubGroupGRANTED_S_GROUP_ID.AsFloat]);
  QrySubGroupGrantedGroupDescrip.asString:= SelectValueFmtAsString('select descrip from s_group where id = %f', [QrySubGroupGRANTED_S_GROUP_ID.AsFloat]);
end;

procedure TFrmSecurityGroups.GotoGroup1Click(Sender: TObject);
begin
  if QryOverviewGroups.Eof and QryOverviewGroups.Bof then EXIT;

  QryGroup.Locate('ID', QryOverviewGroupsID.asFloat, []);
end;

procedure TFrmSecurityGroups.QryGroupBeforeDelete(DataSet: TDataSet);
begin
  QryGroup.CheckBrowseMode;
  CheckConfirmDeleteWhenUsersAssignedToGroup( QryGroupID.asFloat );
end;


procedure TFrmSecurityGroups.CheckConfirmDeleteWhenUsersAssignedToGroup( AGroup_ID: Real );
var
  AMesg        : string;
  I            : Integer;
  AParentNodes : TStringList;
  ADirectList  : TStringList;
  AInDirectList: TStringList;
  ATextList    : TStringList;

  procedure LoadUserNamesAssignedToGroup( AGroup_ID: Real; var AUserNamesList: TStringList );
  var
    AList: TStringList;
    I: Integer;
  begin
    AList:= TStringList.Create;
    try
      LoadColumnValueIntoStringList( AList,     {pas}
                                     IQFormat( 'select user_name from s_users where s_group_id = %f', [ AGroup_ID ]));
      for I:= 0 to AList.Count - 1 do
        if AUSerNamesList.IndexOf(AList[ I ]) = -1 then
           AUSerNamesList.Add( AList[ I ]);
    finally
      AList.Free;
    end;
  end;

  procedure ConstructTextList( ATitle: string; ANamesList: TStringList );
  begin
    if (ANamesList.Count > 0) then
    begin
       ATextList.Add('');
       ATextList.Add(IQFormat( ATitle, [ ANamesList.Count ]));
       ATextList.AddStrings( ANamesList );
    end;
  end;

begin
  AParentNodes := TStringList.Create;
  try
    ATextList := TStringList.Create;
    try
      ADirectList := TStringList.Create;
      try
        AInDirectList := TStringList.Create;
        try
          { Load names hooked up directly to the passed group }
          LoadUserNamesAssignedToGroup(AGroup_ID, ADirectList);

          { Load the chain of all the nodes above current node }
          LoadColumnValueIntoStringList(AParentNodes,
            IQFormat('select distinct s_group_id from s_group_roles start with granted_s_group_id = %f connect by prior s_group_id = granted_s_group_id',
            [AGroup_ID]));

          { Load names hooked INDIRECTLY up to the passed group }
          for I := 0 to AParentNodes.Count - 1 do
            LoadUserNamesAssignedToGroup(StrToFloat(AParentNodes[I]), AInDirectList);

          if (ADirectList.Count = 0) and (AInDirectList.Count = 0) then
            EXIT;

          ConstructTextList('The following are %d user(s) attached directly to the group:',
            ADirectList);
          ConstructTextList('The following are %d user(s) attached indirectly to the group:',
            AInDirectList);

          AMesg := IQFormat('Are you sure you want to delete the group ''%s'' ?'#13#13 +
            '%s',
            [SelectValueFmtAsString('select group_name from s_group where id = %f', [AGroup_ID]),
            ATextList.Text]);

          if not TFrmShowConfirmStr.IQShowConfirmStrEx(AMesg, 'Warning', mtWarning) then { IQMsgConf.pas }
            ABORT;
        finally
          ATextList.Free;
        end;
      finally
        AInDirectList.Free;
      end;
    finally
      ADirectList.Free;
    end;
  finally
    AParentNodes.Free;
  end;
end;

procedure TFrmSecurityGroups.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmSecurityGroups.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP {CHM}, iqhtmSETUPch6{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmSecurityGroups.AssignedUser1Click(Sender: TObject);
begin
  TTFrmSecGroupUsers.DoShowModal( QryGroupID.asFloat ); // IQSecGroupUsers.pas
end;

procedure TFrmSecurityGroups.popmGroupsPopup(Sender: TObject);
begin
  CloneGroup1.Enabled:= QryGroupID.asFloat > 0;
end;

procedure TFrmSecurityGroups.CloneGroup1Click(Sender: TObject);
begin
  if QryGroupID.asFloat > 0 then
     CloneSecurityGroupShell( QryGroupID.asFloat );
end;

procedure TFrmSecurityGroups.CloneSecurityGroupShell( AGroup_ID: Real );
var
  ANewGroup_ID: Real;
begin
  if TFrmSecurityGroupClone.DoShowModal(  AGroup_ID, ANewGroup_ID ) then   // IQSecGroupClone.pas
  begin
    Reopen(QryGroup);
    QryGroup.Locate('id', ANewGroup_ID, []);
  end;
end;


end.
