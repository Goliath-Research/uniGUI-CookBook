unit inv_rf_teams;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.DBCtrls,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  Mask,
  IQMS.WebVcl.SecurityRegister,
//  IQMS.Common.UserMessages,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
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
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniComboBox,
  uniDBComboBox,
  uniPageControl,
  IQUniGrid,
  uniMainMenu,
  uniGUIFrame,
  uniDBGrid;

type
  TFrmInvRFTeams = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    gridTeam: TIQUniGridControl;
    NavMain: TUniDBNavigator;
    sbtnSearch: TUniSpeedButton;
    SrcRFTeam: TDataSource;
    QryRFTeam: TFDQuery;
    QryRFTeamCODE: TStringField;
    QryRFTeamDESCRIP: TStringField;
    QryRFTeamTYPE: TStringField;
    UpdateSQLRFTeam: TFDUpdateSQL;
    MainMenu1: TUniMainMenu;
    IQAbout1: TIQWebAbout;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PkRFTeam: TIQWebHPick;
    PkRFTeamID: TFloatField;
    PkRFTeamCODE: TStringField;
    PkRFTeamDESCRIP: TStringField;
    PkRFTeamTYPE: TStringField;
    PkInvZone: TIQWebHPick;
    PkInvZoneID: TBCDField;
    PkInvZoneCODE: TStringField;
    PkInvZoneDESCRIP: TStringField;
    PkInvZoneZONE_TYPE: TStringField;
    SR: TIQWebSecurityRegister;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel5: TUniPanel;
    SrcUsers: TDataSource;
    QryUsers: TFDQuery;
    PkUser: TIQWebHPick;
    PkUserUSERNAME: TStringField;
    PkUserEPLANT_NAME: TStringField;
    PkUserTEAM_CODE: TStringField;
    PkUserRF_TEAM_ID: TBCDField;
    QryUsersUSER_NAME: TStringField;
    QryUsersEPLANT_NAME: TStringField;
    N1: TUniMenuItem;
    WMSEquipment1: TUniMenuItem;
    pgctrlMain: TUniPageControl;
    tabForm: TUniTabSheet;
    tabGrid: TUniTabSheet;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    Panel9: TUniPanel;
    Splitter2: TUniSplitter;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    dbeItemNo: TUniDBEdit;
    dbeDescrip: TUniDBEdit;
    Splitter3: TUniSplitter;
    wwDBComboBoxTeamType: TUniDBComboBox;
    Panel10: TUniPanel;
    Panel11: TUniPanel;
    Panel12: TUniPanel;
    Splitter4: TUniSplitter;
    wwDBComboBoxFormTeamType: TUniDBComboBox;
    pnlForm: TUniPanel;
    Label5: TUniLabel;
    lblDivision: TUniLabel;
    wwDBComboDlgEplant: TUniEdit;
    wwDBLookupComboDiv: TUniDBLookupComboBox;
    wwQryDivisionLookup: TFDQuery;
    wwQryDivisionLookupNAME: TStringField;
    wwQryDivisionLookupEPLANT_NAME: TStringField;
    wwQryDivisionLookupID: TBCDField;
    pgctrlDetails: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    TabSheet3: TUniTabSheet;
    Panel4: TUniPanel;
    NavUsers: TUniDBNavigator;
    gridUsers: TIQUniGridControl;
    PkRFTeamEPLANT_NAME: TStringField;
    PkRFTeamDIVISION_NAME: TStringField;
    QryRFTeamEplantDisp: TStringField;
    Panel6: TUniPanel;
    NavZones: TUniDBNavigator;
    gridTeamZones: TIQUniGridControl;
    QryTeamZone: TFDQuery;
    SrcTeamZone: TDataSource;
    QryTeamZoneZONE_CODE: TStringField;
    QryTeamZoneZONE_DESCRIP: TStringField;
    SrcTeamEqmt: TDataSource;
    QryTeamEqmt: TFDQuery;
    QryTeamEqmtDESCRIP: TStringField;
    Panel13: TUniPanel;
    NavEqmt: TUniDBNavigator;
    gridTeamEqmt: TIQUniGridControl;
    PkWmsEquip: TIQWebHPick;
    PkWmsEquipID: TFloatField;
    PkWmsEquipDESCRIP: TStringField;
    PkWmsEquipEPLANT_NAME: TStringField;
    PkWmsEquipDIVISION_NAME: TStringField;
    PkInvZoneEPLANT_NAME: TStringField;
    PkInvZoneDIVISION_NAME: TStringField;
    QryTeamEqmtEPLANT_NAME: TStringField;
    QryTeamEqmtDIVISION_NAME: TStringField;
    QryTeamZoneEPLANT_NAME: TStringField;
    QryTeamZoneDIVISION_NAME: TStringField;
    QryRFTeamID: TBCDField;
    QryRFTeamEPLANT_ID: TBCDField;
    QryRFTeamDIVISION_ID: TBCDField;
    QryTeamZoneID: TBCDField;
    QryTeamZoneRF_TEAM_ID: TBCDField;
    QryTeamZoneINV_ZONE_ID: TBCDField;
    QryTeamEqmtID: TBCDField;
    QryTeamEqmtRF_TEAM_ID: TBCDField;
    QryTeamEqmtWMS_EQMT_ID: TBCDField;
    Contents1: TUniMenuItem;
    SrcQryDivisionLookup: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryRFTeamBeforePost(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure wwDBComboDlgInvZoneCustomDlg(Sender: TObject);
    procedure wwDBComboDlgInvZoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PkRFTeamIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure DisptachActionUser(Sender: TObject; Button: TNavigateBtn);
    procedure PkUserIQAfterHPickCreate(Sender: TObject);
    procedure WMSEquipment1Click(Sender: TObject);
    procedure sbtnToggleClick(Sender: TObject);
    procedure wwDBComboDlgEplantCustomDlg(Sender: TObject);
    procedure QryRFTeamCalcFields(DataSet: TDataSet);
    procedure AssignEplantDivisionFIlter(DataSet: TDataSet);
    procedure DisptachActionWorkZones(Sender: TObject; Button: TNavigateBtn);
    procedure DispatchActionEqmt(Sender: TObject; Button: TNavigateBtn);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gridUsersDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    procedure CheckUserExistsS_User_General(AUserName: string);
    procedure AppendUsers;
//    procedure IQRefreshWMSEquipment( var Msg: TMessage ); message iq_RefreshWMSEquipment;
    procedure AppendWorkZones;
    procedure DeleteRecords( AGrid: TIQUniGridControl; ADeleteStatement: string; APKFieldName: string = 'ID' );
    procedure AppendEqmt;
  public
    { Public declarations }
    class procedure DoShow( AID: Real = 0 );
  end;


implementation

{$R *.dfm}

uses
  inv_wms_eqmt,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SearchPickList,
  IQMS.COmmon.SetPlant,
  IQMS.Common.SysShare,
  IQMS.Common.HelpHook;


const
   cnstAppendNew = 1;

{ TFrmInvRFTeams }

class procedure TFrmInvRFTeams.DoShow( AID: Real = 0);
var
   frm : TFrmInvRFTeams;
begin
   frm := TFrmInvRFTeams.Create(uniGUIApplication.UniApplication);
   with frm do
   begin
//     IQRegFormRead(self, [ self, gridUsers, gridTeamZones, gridTeamEqmt ]);

    IQSetTablesActive(TRUE, frm);

     pgctrlMain.ActivePageIndex:= 0;
     pgctrlDetails.ActivePageIndex:= 0;
     AdjustPageControlToParent( pgctrlMain );
     lblDivision.Caption:= CheckReplaceDivisionCaption( lblDivision.Caption );  {Sys_Share.pas}

//     LocateOrPickList( frm, AID, QryRFTeam, PkRFTeam );
   end;
   frm.Show;
end;

procedure TFrmInvRFTeams.FormActivate(Sender: TObject);
begin
   IQHelp.AssignHTMLFile( iqchmWMS{CHM}, iqhtmWMS{HTM} );
end;

procedure TFrmInvRFTeams.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  IQRegFormWrite(self, [ self, gridUsers, gridTeamZones, gridTeamEqmt ]);
//  Action:= caFree;
end;

procedure TFrmInvRFTeams.gridUsersDBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
//  case Highlight of
//    FALSE:
         if PkUserRF_TEAM_ID.asFloat = QryRFTeamID.asFloat then
            Attribs.Font.Color := clGreen
         else if PkUserRF_TEAM_ID.asFloat > 0  then
            Attribs.Font.Color := clGray;
//    TRUE :
         if PkUserRF_TEAM_ID.asFloat = QryRFTeamID.asFloat then
            begin
              Attribs.Color:= clBlack;
              Attribs.Font.Color := clLime;
            end
         else if PkUserRF_TEAM_ID.asFloat > 0  then
            begin
              Attribs.Color:= clBlack;
              Attribs.Font.Color := clYellow;
            end
//    end;
end;

procedure TFrmInvRFTeams.PkRFTeamIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  SendInsertViaNavigator( NavMain, Action, ResultValue, SR );
end;

procedure TFrmInvRFTeams.PkUserIQAfterHPickCreate(Sender: TObject);
begin
  //TFrmIQSearchPickList(Sender).IQSearch1.OnCalcCellColors:= IQSearchUsersCalcCellColors;  // IQMS.WebVcl.SearchPickList.pas
end;


procedure TFrmInvRFTeams.QryRFTeamBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'rf_team');
  DataSet.FieldByName('CODE').asString:= UpperCase(DataSet.FieldByName('CODE').asString);
end;

procedure TFrmInvRFTeams.QryRFTeamCalcFields(DataSet: TDataSet);
begin
  if QryRFTeamEPLANT_ID.asFloat > 0 then
     QryRFTeamEplantDisp.asString:= SelectValueByID('decode(id, null, null, ''['' || id || ''] '' || name)', 'eplant', QryRFTeamEPLANT_ID.asFloat);
end;

procedure TFrmInvRFTeams.sbtnSearchClick(Sender: TObject);
begin
  with PkRFTeam do
    if Execute then
       QryRFTeam.Locate('id', GetValue('id'), [])
end;

procedure TFrmInvRFTeams.sbtnToggleClick(Sender: TObject);
begin
  if pgctrlMain.ActivePageIndex = 0 then
     pgctrlMain.ActivePageIndex:= 1
  else
     pgctrlMain.ActivePageIndex:= 0;
end;

procedure TFrmInvRFTeams.WMSEquipment1Click(Sender: TObject);
begin
  TFrmInvWMSEquipment.DoShow;  // inv_wms_eqmt.pas
end;

procedure TFrmInvRFTeams.wwDBComboDlgEplantCustomDlg(Sender: TObject);
begin
  QryRFTeam.CheckBrowseMode;
  DoChangePlantID( QryRFTeam );  {IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmInvRFTeams.wwDBComboDlgInvZoneCustomDlg(Sender: TObject);
begin
  with PkInvZone do
    if Execute then
    begin
      //QryRFTeam.Edit;
      //QryRFTeamINV_ZONE_ID.asFloat:= GetValue('id')
    end;
end;

procedure TFrmInvRFTeams.wwDBComboDlgInvZoneKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Sender is TUniEdit) and (Key = VK_DELETE) then
  begin
    //QryRFTeam.Edit;
    //QryRFTeamINV_ZONE_ID.Clear;
    //QryRFTeam.Post;
    Key:= 0;
  end;
end;

procedure TFrmInvRFTeams.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvRFTeams.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmInvRFTeams.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmInvRFTeams.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;

procedure TFrmInvRFTeams.CheckUserExistsS_User_General( AUserName: string );
begin
  if SelectValueFmtAsFloat('select 1 from s_user_general where RTrim(user_name) = ''%s''', [AUserName]) = 0 then
     ExecuteCommandFmt('insert into s_user_general (user_name) values (''%s'')', [ AUserName ]);
end;


procedure TFrmInvRFTeams.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( HelpContext );
end;

procedure TFrmInvRFTeams.DispatchActionEqmt(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
      begin
        IQCheckRefresh(Sender, Button);
        ABORT;
      end;
    nbInsert:
      begin
        AppendEqmt;
        ABORT;
      end;
    nbDelete:
      begin
        DeleteRecords( gridTeamEqmt, 'delete from rf_team_eqmt where id = %s' );
        ABORT;
      end;
  end;
end;

procedure TFrmInvRFTeams.DisptachActionUser(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
      begin
        RefreshDataSetByID( QryUsers, 'user_name' );
        ABORT;
      end;
    nbInsert:
      begin
        AppendUsers;
        ABORT;
      end;
    nbDelete:
      begin
        DeleteRecords( gridUsers, 'update s_user_general set rf_team_id = null where user_name = ''%s''', 'USER_NAME');
        ABORT;
      end;
  end;
end;


procedure TFrmInvRFTeams.DisptachActionWorkZones(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
      begin
        IQCheckRefresh(Sender, Button);
        ABORT;
      end;
    nbInsert:
      begin
        AppendWorkZones;
        ABORT;
      end;
    nbDelete:
      begin
        DeleteRecords( gridTeamZones, 'delete from rf_team_zone where id = %s' );
        ABORT;
      end;
  end;
end;

procedure TFrmInvRFTeams.AppendUsers;
var
  I: Integer;
begin
  QryRFTeam.CheckBrowseMode;
  if QryRFTeamID.asFloat = 0 then EXIT;

  with PkUser do
   if ExecuteEx('USERNAME') then
   begin
      for I:= 0 to ResultList.Count - 1 do
      begin
        CheckUserExistsS_User_General( ResultList[ I ] );
        ExecuteCommandFmt('update s_user_general set rf_team_id = %f where user_name = ''%s''', [ QryRFTeamID.asFloat, ResultList[ I ] ]);
      end;
      RefreshDataSetByID( QryUsers, 'user_name' );
   end;
end;

procedure TFrmInvRFTeams.AppendWorkZones;
var
  I: Integer;
begin
  QryRFTeam.CheckBrowseMode;
  if QryRFTeamID.asFloat = 0 then
     EXIT;

  with PkInvZone do
   if ExecuteEx('ID') then
   begin
      for I:= 0 to ResultList.Count - 1 do
      begin
        if SelectValueFmtAsFloat('select 1 from rf_team_zone where rf_team_id = %f and inv_zone_id = %s', [ QryRFTeamID.asFloat, ResultList[ I ] ]) = 0 then
           ExecuteCommandFmt('insert into rf_team_zone (rf_team_id, inv_zone_id) values (%f, %s)', [ QryRFTeamID.asFloat, ResultList[ I ] ]);
      end;
      RefreshDataSetByID( QryTeamZone );
   end;
end;

procedure TFrmInvRFTeams.AppendEqmt;
var
  I: Integer;
begin
  QryRFTeam.CheckBrowseMode;
  if QryRFTeamID.asFloat = 0 then
     EXIT;

  with PkWmsEquip do
   if ExecuteEx('ID') then
   begin
      for I:= 0 to ResultList.Count - 1 do
      begin
        if SelectValueFmtAsFloat('select 1 from rf_team_eqmt where rf_team_id = %f and wms_eqmt_id = %s', [ QryRFTeamID.asFloat, ResultList[ I ] ]) = 0 then
           ExecuteCommandFmt('insert into rf_team_eqmt (rf_team_id, wms_eqmt_id) values (%f, %s)', [ QryRFTeamID.asFloat, ResultList[ I ] ]);
      end;
      RefreshDataSetByID( QryTeamEqmt );
   end;
end;


procedure TFrmInvRFTeams.DeleteRecords( AGrid: TIQUniGridControl; ADeleteStatement: string; APKFieldName: string = 'ID' );
var
  I: Integer;
  ADataSet: TDataSet;

  procedure _remove;
  begin
    ExecuteCommandFmt( ADeleteStatement, [ ADataSet.FieldByName( APKFieldName ).asString ]);
  end;

begin
  ADataSet:= AGrid.DataSource.DataSet;

  if ADataSet.Eof and ADataSet.Bof then EXIT;
  if not IQConfirmYN('Remove/Disassociate selected records from the WMS Team?') then EXIT;

  ADataSet.DisableControls;
  try
    if AGrid.DBGrid.SelectedRows.Count > 0 then
       for I:= 0 to AGrid.DBGrid.SelectedRows.Count - 1 do
       begin
         ADataSet.GotoBookmark( AGrid.DBGrid.SelectedRows.Items[ I ]);
         _remove;
       end
    else
       _remove;
  finally
    begin
       RefreshDataSetByID( ADataSet, APKFieldName );
       ADataSet.EnableControls;
    end;
  end;
end;

procedure TFrmInvRFTeams.AssignEplantDivisionFIlter(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    if Params.FindParam('eplant_id') <> nil then
       ParamByName('eplant_id').Value := QryRFTeamEPLANT_ID.asFloat;

    if Params.FindParam('division_id') <> nil then
       ParamByName('division_id').Value := QryRFTeamDIVISION_ID.asFloat;
  end;
end;



end.
