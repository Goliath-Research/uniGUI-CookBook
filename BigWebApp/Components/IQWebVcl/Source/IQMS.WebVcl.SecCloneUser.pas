unit IQMS.WebVcl.SecCloneUser;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmSecInsCloneUserSettings = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Bevel1: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel4: TUniPanel;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    edUserName: TUniEdit;
    sbtnSearch: TUniSpeedButton;
    chkSecurityRoles: TUniCheckBox;
    chkWMSProfile: TUniCheckBox;
    chkEPlantMembership: TUniCheckBox;
    chkGeneral: TUniCheckBox;
    chkLibraryTeam: TUniCheckBox;
    PKClone: TIQWebHPick;
    PKCloneUSERNAME: TStringField;
    chkPOLimit: TUniCheckBox;
    chkRMAInvLimit: TUniCheckBox;
    chkExclInvTrans: TUniCheckBox;
    chkCRMCustAccess: TUniCheckBox;
    chkAccessEPlants: TUniCheckBox;
    chkPayGroups: TUniCheckBox;
    chkSmartPage: TUniCheckBox;
    chkSPReports: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure PKCloneBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FTrgUserName: string;
    FSrcUserName: string;
    procedure CloneAccessibleEPlants;
    procedure CloneLibraryTeam;
    procedure CloneSecurityRoles;
    procedure CloneWMSProfile;
    procedure CloneCRMCustAccess;
    procedure CloneEPlantMembership;
    procedure CloneExcludeInvTrans;
    procedure CloneGeneral;
    procedure ClonePOLimit;
    procedure CloneRmaInvLimit;
    procedure ClonePayGroups;
    procedure CloneSmartPageWorkspace;
    procedure CloneSmartPageReports;
  public
    { Public declarations }
    class function DoShowModal(AOwner: TComponent; ATrgUserName: string): Boolean;
    property TrgUserName:string read FTrgUserName write FTrgUserName;
  end;


implementation

{$R *.dfm}


uses
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.ResourceStrings;

{ TFrmSecInsCloneUserSettings }

class function TFrmSecInsCloneUserSettings.DoShowModal(AOwner: TComponent;
  ATrgUserName: string): Boolean;
begin
  with self.Create(uniGUIApplication.UniApplication) do
    begin
      TrgUserName:=ATrgUserName;
      Result := ShowModal = mrOK;
    end;
end;

procedure TFrmSecInsCloneUserSettings.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, chkSecurityRoles, chkWMSProfile, chkEPlantMembership, chkGeneral,
    chkPOLimit, chkRMAInvLimit, chkExclInvTrans, chkCRMCustAccess, chkAccessEPlants, chkLibraryTeam,
    chkPayGroups, chkSmartPage, chkSPReports]);
end;

procedure TFrmSecInsCloneUserSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, chkSecurityRoles, chkWMSProfile, chkEPlantMembership, chkGeneral,
    chkPOLimit, chkRMAInvLimit, chkExclInvTrans, chkCRMCustAccess, chkAccessEPlants, chkLibraryTeam,
    chkPayGroups, chkSmartPage, chkSPReports]);
end;

procedure TFrmSecInsCloneUserSettings.btnOKClick(Sender: TObject);
begin
  IQAssert(edUserName.Text > '', IQMS.WebVcl.ResourceStrings.cTXT0000382);
  // 'User Name must be specified - operation aborted';

  if not IQConfirmYN(Format(IQMS.WebVcl.ResourceStrings.cTXT0000381, [edUserName.Text])) then
    // 'Selected settings such as roles, memberships etc will be reset to match %s settings. Do you wish to continue?';
    EXIT;

  FSrcUserName := UpperCase(Trim(edUserName.Text));

  if chkSecurityRoles.Checked then
    CloneSecurityRoles;

  if chkWMSProfile.Checked then
    CloneWMSProfile;

  if chkEPlantMembership.Checked then
    CloneEPlantMembership;

  if chkGeneral.Checked then
    CloneGeneral;

  if chkPOLimit.Checked then
    ClonePOLimit;

  if chkRMAInvLimit.Checked then
    CloneRmaInvLimit;

  if chkExclInvTrans.Checked then
    CloneExcludeInvTrans;

  if chkCRMCustAccess.Checked then
    CloneCRMCustAccess;

  if chkAccessEPlants.Checked then
    CloneAccessibleEPlants;

  if chkLibraryTeam.Checked then
    CloneLibraryTeam;

  if chkPayGroups.Checked then
    ClonePayGroups;

  if chkSmartPage.Checked then
    CloneSmartPageWorkspace;

  if chkSPReports.Checked then
    CloneSmartPageReports;

  ModalResult := mrOK;
end;

procedure TFrmSecInsCloneUserSettings.sbtnSearchClick(Sender: TObject);
begin
  with PKClone do
    if Execute then
      edUserName.Text := GetValue('username');
end;

procedure TFrmSecInsCloneUserSettings.CloneSecurityRoles;
begin
  ExecuteCommandFmt(
    'delete from s_users where user_name = ''%s''',
    [FTrgUserName]);
  ExecuteCommandFmt(
    'insert into s_users (user_name, role_name, s_group_id)                    ' +
    'select ''%s'', role_name, s_group_id from s_users where user_name = ''%s''',
    [FTrgUserName, FSrcUserName]);
end;

procedure TFrmSecInsCloneUserSettings.CloneWMSProfile;
begin
  ExecuteCommandFmt(
    'delete from rf_profile where userid = ''%s''',
    [FTrgUserName]);
  ExecuteCommandFmt(
    'insert into rf_profile                                                       ' +
    '     ( userid, module_name, topic, to_prompt, source_id, source, attribute ) ' +
    'select                                                                       ' +
    '       ''%s'', module_name, topic, to_prompt, source_id, source, attribute   ' +
    ' from rf_profile where userid = ''%s''                                       ',
    [FTrgUserName, FSrcUserName]);
end;

procedure TFrmSecInsCloneUserSettings.CloneEPlantMembership;
begin
  ExecuteCommandFmt(
    'update s_user_general                                                              ' +
    '   set eplant_id = (select eplant_id from s_user_general where user_name = ''%s'') ' +
    ' where user_name = ''%s''                                                          ',
    [FSrcUserName, FTrgUserName]);
end;

procedure TFrmSecInsCloneUserSettings.CloneGeneral;
var
  AProfile: string;
begin
  // s_user_general
  ExecuteCommandFmt(
    'declare                                                                      ' +
    '  v_rec s_user_general%%rowtype;                                             ' +
    '  v_src_user_name varchar2(35)::= ''%s'';                                    ' +
    '  v_trg_user_name varchar2(35)::= ''%s'';                                    ' +
    'begin                                                                        ' +
    '  select * into v_rec from s_user_general where user_name = v_src_user_name; ' +
    '                                                                             ' +
    '  update s_user_general                                                      ' +
    '     set auto_shut_time              = v_rec.auto_shut_time,                 ' +
    '         auto_shut_action_code       = v_rec.auto_shut_action_code,          ' +
    '         web_master                  = v_rec.web_master,                     ' +
    // '         phone_number                = v_rec.phone_number,                   '+
    '         auto_shut_shopdata          = v_rec.auto_shut_shopdata,             ' +
    '         language_code               = v_rec.language_code,                  ' +
    '         sec_prevent_same_user_login = v_rec.sec_prevent_same_user_login,    ' +
    '         sec_allow_non_dba_sec_ins   = v_rec.sec_allow_non_dba_sec_ins,      ' +
    '         is_mobile_user              = v_rec.is_mobile_user,                 ' +
    '         ship_manager_warning        = v_rec.ship_manager_warning            ' +
    // '         pr_emp_id                   = v_rec.pr_emp_id                       '+
    '   where user_name = v_trg_user_name;                                        ' +
    'end;                                                                         ',
    [FSrcUserName, FTrgUserName]);

  // security profile
  AProfile := SelectValueFmtAsString(
    'select profile from dba_users where username = ''%s''',
    [FSrcUserName]);
  ExecuteCommandFmt(
    'ALTER USER "%s" PROFILE %s', [FTrgUserName, AProfile]);
end;

procedure TFrmSecInsCloneUserSettings.ClonePOLimit;
begin
  // s_user_general
  ExecuteCommandFmt(
    'declare                                                                      ' +
    '  v_rec s_user_general%%rowtype;                                             ' +
    '  v_src_user_name varchar2(35)::= ''%s'';                                    ' +
    '  v_trg_user_name varchar2(35)::= ''%s'';                                    ' +
    'begin                                                                        ' +
    '  select * into v_rec from s_user_general where user_name = v_src_user_name; ' +
    '                                                                             ' +
    '  update s_user_general                                                      ' +
    '     set                                                                     ' +
    '         po_approver                 = v_rec.po_approver,                    ' +
    '         po_cant_incr_cost           = v_rec.po_cant_incr_cost,              ' +
    '         dont_change_poap            = v_rec.dont_change_poap,               ' +
    '         po_buyer                    = v_rec.po_buyer,                       ' +
    '         po_can_deny                 = v_rec.po_can_deny,                    ' +
    '         receipt_tolerance           = v_rec.receipt_tolerance,              ' +
    '         ap_tolerance                = v_rec.ap_tolerance                    ' +
    '   where user_name = v_trg_user_name;                                        ' +
    'end;                                                                         ',
    [FSrcUserName, FTrgUserName]);

  // s_user_po_type
  ExecuteCommandFmt(
    'delete from s_user_po_type where user_name = ''%s''',
    [FTrgUserName]);
  ExecuteCommandFmt(
    'insert into s_user_po_type                        ' +
    '     ( po_type_id, limit, user_name, is_default ) ' +
    'select                                            ' +
    '       po_type_id, limit, ''%s'', is_default      ' +
    '  from s_user_po_type                             ' +
    ' where user_name = ''%s''                         ',
    [FTrgUserName, FSrcUserName]);
end;

procedure TFrmSecInsCloneUserSettings.CloneRmaInvLimit;
begin
  // s_user_general
  ExecuteCommandFmt(
    'declare                                                                      ' +
    '  v_rec s_user_general%%rowtype;                                             ' +
    '  v_src_user_name varchar2(35)::= ''%s'';                                    ' +
    '  v_trg_user_name varchar2(35)::= ''%s'';                                    ' +
    'begin                                                                        ' +
    '  select * into v_rec from s_user_general where user_name = v_src_user_name; ' +
    '                                                                             ' +
    '  update s_user_general                                                      ' +
    '     set                                                                     ' +
    '         rma_limit                   = v_rec.rma_limit,                      ' +
    '         inv_adj_limit               = v_rec.inv_adj_limit                   ' +
    '   where user_name = v_trg_user_name;                                        ' +
    'end;                                                                         ',
    [FSrcUserName, FTrgUserName]);
end;

procedure TFrmSecInsCloneUserSettings.CloneExcludeInvTrans;
begin

  // user_exclude_trans
  ExecuteCommandFmt(
    'delete from user_exclude_trans where user_name = ''%s''',
    [FTrgUserName]);

  ExecuteCommandFmt(
    'insert into user_exclude_trans                    ' +
    '     ( user_name, trans_in_out, exclusion_type )  ' +
    'select                                            ' +
    '       ''%s'', trans_in_out, exclusion_type       ' +
    '  from user_exclude_trans                         ' +
    ' where user_name = ''%s''                         ',
    [FTrgUserName, FSrcUserName]);
end;

procedure TFrmSecInsCloneUserSettings.CloneCRMCustAccess;
begin

  // s_user_crm_customers
  ExecuteCommandFmt(
    'delete from s_user_crm_customers where user_name = ''%s''',
    [FTrgUserName]);

  ExecuteCommandFmt(
    'insert into s_user_crm_customers                  ' +
    '     ( user_name, arcusto_id )                    ' +
    'select                                            ' +
    '       ''%s'', arcusto_id                         ' +
    '  from s_user_crm_customers                       ' +
    ' where user_name = ''%s''                         ',
    [FTrgUserName, FSrcUserName]);
end;

procedure TFrmSecInsCloneUserSettings.CloneAccessibleEPlants;
begin
  CloneEPlantMembership;

  // s_user_eplants
  ExecuteCommandFmt(
    'delete from s_user_eplants where user_name = ''%s''',
    [FTrgUserName]);

  ExecuteCommandFmt(
    'insert into s_user_eplants                        ' +
    '     ( user_name, eplant_id )                     ' +
    'select                                            ' +
    '       ''%s'', eplant_id                          ' +
    '  from s_user_eplants                             ' +
    ' where user_name = ''%s''                         ',
    [FTrgUserName, FSrcUserName]);
end;

procedure TFrmSecInsCloneUserSettings.CloneLibraryTeam;
var
  ASrcTeam_Member_ID: Real;
  ATrgTeam_Member_ID: Real;
  AEMail: string;
  AName: string;
begin
  ASrcTeam_Member_ID := SelectValueFmtAsFloat(
    'select id from team_member where userid = ''%s''',
    [FSrcUserName]);

  if ASrcTeam_Member_ID = 0 then
    EXIT;

  ATrgTeam_Member_ID := SelectValueFmtAsFloat(
    'select id from team_member where userid = ''%s''',
    [FTrgUserName]);
  if ATrgTeam_Member_ID = 0 then
  begin
    ATrgTeam_Member_ID := GetNextID('team_member');

    AEMail := SelectValueFmtAsString(
      'select email from s_user_general where RTrim(user_name) = ''%s''',
      [Trim(FTrgUserName)]);

    AName := ProperCase(SelectValueFmtAsString(
      'select RTrim(first_name) || '' '' || RTrim(last_name) from pr_emp e, s_user_general u where RTrim(u.user_name) = ''%s'' and u.pr_emp_id = e.id',
      [Trim(FTrgUserName)]));

    ExecuteCommandFmt(
      'insert into team_member                                                                   ' +
      '     ( id, userid, name, email, work_path, used_doc, used_car, used_apqp, used_eco, used_ppap,   ' +
      '       eplant_id, used_capa, used_dev, used_prod_pq, used_proc_pq, used_mrb, used_po,     ' +
      '       used_crm, used_audit, type, out_of_office )                                        ' +
      'select                                                                                    ' +
      '       %f, ''%s'', ''%s'', ''%s'', work_path, used_doc, used_car, used_apqp, used_eco, used_ppap, ' +
      '       eplant_id, used_capa, used_dev, used_prod_pq, used_proc_pq, used_mrb, used_po,     ' +
      '       used_crm, used_audit, type, out_of_office                                          ' +
      '  from team_member where id = %f                                                          ',
      [ATrgTeam_Member_ID, FTrgUserName, AName, AEMail, ASrcTeam_Member_ID]);
  end;

  ExecuteCommandFmt(
    'delete from doc_team where team_member_id = %f', [ATrgTeam_Member_ID]);

  ExecuteCommandFmt(
    'insert into doc_team                               ' +
    '     ( doc_library_id, team_member_id, type, seq ) ' +
    'select                                             ' +
    '       doc_library_id, %f, type, seq               ' +
    '  from doc_team                                    ' +
    ' where team_member_id = %f                         ',
    [ATrgTeam_Member_ID, ASrcTeam_Member_ID]);
end;

procedure TFrmSecInsCloneUserSettings.PKCloneBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'username', FTrgUserName);
end;

procedure TFrmSecInsCloneUserSettings.ClonePayGroups;
begin
  ExecuteCommandFmt(
    'delete from S_USER_PAYGROUP where user_name = ''%s''',
    [FTrgUserName]);
  ExecuteCommandFmt(
    'insert into S_USER_PAYGROUP          ' +
    '     ( user_name, pr_paygroup_id )   ' +
    'select                               ' +
    '       ''%s'', pr_paygroup_id        ' +
    '  from S_USER_PAYGROUP               ' +
    ' where user_name = ''%s''            ',
    [FTrgUserName, FSrcUserName]);
end;

procedure TFrmSecInsCloneUserSettings.CloneSmartPageReports;
begin
  ExecuteCommandFmt(
    'delete from repdef_spage where user_name = ''%s''',
    [FTrgUserName]);

  ExecuteCommandFmt(
    'insert into repdef_spage                          ' +
    '       ( app_id, user_name, repname )             ' +
    'select app_id, ''%s'', repname                    ' +
    '  from repdef_spage                               ' +
    '  where user_name = ''%s''                        ',
    [FTrgUserName, FSrcUserName]);
end;

procedure TFrmSecInsCloneUserSettings.CloneSmartPageWorkspace;
begin
  // s_user_general
  ExecuteCommandFmt(
    'declare                                                                      ' +
    '  v_rec s_user_general%%rowtype;                                             ' +
    '  v_src_user_name varchar2(35)::= ''%s'';                                    ' +
    '  v_trg_user_name varchar2(35)::= ''%s'';                                    ' +
    'begin                                                                        ' +
    '  select * into v_rec from s_user_general where user_name = v_src_user_name; ' +
    '                                                                             ' +
    '  update s_user_general                                                      ' +
    '     set                                                                     ' +
    '         sp_workspace                = v_rec.sp_workspace                    ' +
    '   where user_name = v_trg_user_name;                                        ' +
    'end;                                                                         ',
    [FSrcUserName, FTrgUserName]);
end;

end.
