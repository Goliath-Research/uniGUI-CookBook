unit wf_specific_team_base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  Mask,
  IQMS.Common.JumpConstants,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  IQUniGrid,
  uniMainMenu,
  uniGUIFrame;

type
  TFrmWorkflowSpecificTeamBase = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SrcTeam: TDataSource;
    TblTeam: TFDTable;
    TblTeamID: TBCDField;
    TblTeamNAME: TStringField;
    TblTeamTITLE: TStringField;
    TblTeamEMAIL: TStringField;
    PopupMenu1: TUniPopupMenu;
    EditeMailAddress1: TUniMenuItem;
    PkSearch: TIQWebHPick;
    IQAbout1: TIQWebAbout;
    PkSearchID: TBCDField;
    PkSearchNAME: TStringField;
    PkSearchTITLE: TStringField;
    PkSearchEMAIL: TStringField;
    TblTeamUSERID: TStringField;
    Grid: TIQUniGridControl;
    wwemail: TUniEdit;
    PkUsers: TIQWebHPick;
    PkUsersUSERNAME: TStringField;
    wwUsers: TUniEdit;
    TblTeamEPLANT_ID: TBCDField;
    TblTeamUSED_PO: TStringField;
    TblTeamUSED_DOC: TStringField;
    TblTeamUSED_CAR: TStringField;
    TblTeamUSED_APQP: TStringField;
    TblTeamUSED_ECO: TStringField;
    TblTeamUSED_PPAP: TStringField;
    TblTeamUSED_CAPA: TStringField;
    TblTeamUSED_DEV: TStringField;
    TblTeamUSED_PROD_PQ: TStringField;
    TblTeamUSED_PROC_PQ: TStringField;
    TblTeamUSED_MRB: TStringField;
    TblTeamUSED_CRM: TStringField;
    Contents1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure TblTeamBeforePost(DataSet: TDataSet);
    procedure EditeMailAddress1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush); }
    procedure wwemailDblClick(Sender: TObject);
    procedure wwUsersCustomDlg(Sender: TObject);
    procedure TblTeamUSERIDChange(Sender: TField);
    procedure TblTeamBeforeOpen(DataSet: TDataSet);
    procedure TblTeamNewRecord(DataSet: TDataSet);
    procedure TblTeamBeforeDelete(DataSet: TDataSet);
    procedure sbtnReplaceClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure IQNotifyMessage( var Msg: TMessage ); message iq_Notify;
    procedure SetUSED_ColumnName(const Value: String);
  protected
    FUSED_ColumnName: string;
  public
    { Public declarations }
    class procedure DoShow(AUSED_ColumnName: string; ATeam_Member_ID: Real = 0 );
    property USED_ColumnName : String write SetUSED_ColumnName;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.EmailUtils,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.HelpHook,
  qc_del_team_member;


class procedure TFrmWorkflowSpecificTeamBase.DoShow(AUSED_ColumnName: string; ATeam_Member_ID: Real = 0 );
var
  AForm: TFrmWorkflowSpecificTeamBase;
begin
  AForm:= TFrmWorkflowSpecificTeamBase.Create(UniGUIApplication.UniApplication);
  AForm.USED_ColumnName := UpperCase( AUSED_ColumnName );
  if ATeam_Member_ID > 0 then
     AForm.TblTeam.Locate('ID', ATeam_Member_ID, []);
  AForm.Show;
end;

procedure TFrmWorkflowSpecificTeamBase.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self, Grid]);
end;

procedure TFrmWorkflowSpecificTeamBase.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmWorkflowSpecificTeamBase.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmWorkflowSpecificTeamBase.TblTeamBeforePost(DataSet: TDataSet);
var
  AExistingTeam_Member_ID: Real;
begin
  if DataSet.State = dsInsert then
  begin
    AExistingTeam_Member_ID:= SelectValueFmtAsFloat('select id from team_member where userid = ''%s''', [ TblTeamUSERID.asString ]);
    if AExistingTeam_Member_ID > 0 then
    begin
       // do not create a new record with the same userid. Instead cancel append, assign used_po = 'Y' and position on that record
       DataSet.Cancel;
       PostMessage( self.Handle, iq_Notify, Trunc(AExistingTeam_Member_ID), 0 );
       ABORT;
    end;
  end;

  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmWorkflowSpecificTeamBase.EditeMailAddress1Click(Sender: TObject);
begin
  PromptAssignURLField( 'Email Address', 'Enter Email Address', TblTeamEMAIL );  {IQMS.Common.EmailUtils.pas}
end;

procedure TFrmWorkflowSpecificTeamBase.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid]);
end;

procedure TFrmWorkflowSpecificTeamBase.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmWorkflowSpecificTeamBase.SBSearchClick(Sender: TObject);
begin
  with PkSearch do
  if Execute then
    TblTeam.Locate('ID', GetValue('ID'), []);
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmWorkflowSpecificTeamBase.GridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if (UpperCase(Field.FieldName) = 'EMAIL')
  then if (not Highlight) then
  begin
    AFont.Color := clBlue;
    AFont.Style := [fsUnderline];
  end;
end;    }

procedure TFrmWorkflowSpecificTeamBase.wwemailDblClick(Sender: TObject);
begin
  DoEMailClick( Grid );
end;

procedure TFrmWorkflowSpecificTeamBase.wwUsersCustomDlg(Sender: TObject);
begin
  with PkUsers do
  if Execute then
  begin
    if not (TblTeam.State in [dsEdit, dsInsert]) then TblTeam.Edit;
    TblTeamUSERID.asString := GetValue('USERNAME');
  end;
end;

procedure TFrmWorkflowSpecificTeamBase.TblTeamUSERIDChange(Sender: TField);
begin
  if TblTeamEMAIL.asString = '' then
     TblTeamEMAIL.asString:= SelectValueFmtAsString('select email from s_user_general where RTrim(user_name) = ''%s''', [ Trim(Sender.asString) ]);

  if TblTeamNAME.asString = '' then
     TblTeamNAME.asString:= ProperCase( SelectValueFmtAsString('select RTrim(first_name) || '' '' || RTrim(last_name) from pr_emp e, s_user_general u where RTrim(u.user_name) = ''%s'' and u.pr_emp_id = e.id', [ Trim(Sender.asString) ]));
end;

procedure TFrmWorkflowSpecificTeamBase.TblTeamBeforeOpen(DataSet: TDataSet);
begin
{ TODO -oGPatil -cWebConvert : Commenting this line due to Access Violation Error. Security Manager is nil
  IQAssignEPlantFilter( DataSet, TRUE ); }

  if TblTeam.Filter > '' then
     // TblTeam.Filter:= Format('(%s) and (%s)', [ TblTeam.Filter, 'USED_PO = ''Y'''])
     TblTeam.Filter:= Format('(%s) and (%s)', [ TblTeam.Filter, Format('%s = ''Y''', [ FUSED_ColumnName ]) ])
  else
     TblTeam.Filter:= Format('%s = ''Y''', [ FUSED_ColumnName ]) // 'USED_PO = ''Y''';
end;

procedure TFrmWorkflowSpecificTeamBase.IQAfterShowMessage(var Msg: TMessage);
begin
  ForceForegroundWindowB( self.Handle ); {IQMS.Common.Controls.pas}
  self.SetFocus();
end;

procedure TFrmWorkflowSpecificTeamBase.TblTeamNewRecord(DataSet: TDataSet);
begin
  // TblTeamUSED_PO.asString:= 'Y';
  TblTeam.FieldByName( FUSED_ColumnName ).asString:= 'Y';
end;


procedure TFrmWorkflowSpecificTeamBase.IQNotifyMessage(var Msg: TMessage);
var
  AExistingTeam_Member_ID: Real;
begin
  AExistingTeam_Member_ID:= Msg.WParam;
  // ExecuteCommandFmt('update team_member set used_po = ''Y'' where id = %f', [ AExistingTeam_Member_ID ]);
  ExecuteCommandFmt('update team_member set %s = ''Y'' where id = %f', [ FUSED_ColumnName, AExistingTeam_Member_ID ]);
  Reopen( TblTeam );
  TblTeam.Locate('ID', AExistingTeam_Member_ID, []);
end;

procedure TFrmWorkflowSpecificTeamBase.TblTeamBeforeDelete(DataSet: TDataSet);
var
  AID: Real;
begin
  // just toggle to 'N' and bail out
  // ExecuteCommandFmt('update team_member set used_po = ''N'' where id = %f', [ TblTeamID.asFloat ]);
  ExecuteCommandFmt('update team_member set %s = ''N'' where id = %f', [ FUSED_ColumnName, TblTeamID.asFloat ]);
  Reopen(TblTeam);
  ABORT;
end;

procedure TFrmWorkflowSpecificTeamBase.sbtnReplaceClick(Sender: TObject);
begin
  if TblTeamID.asFloat > 0 then
     TFrmDeleteTeamMember.DoExecute( TblTeamID.asFloat );   {qc_del_team_member.pas}
end;

procedure TFrmWorkflowSpecificTeamBase.SetUSED_ColumnName(const Value: String);
begin
    FUSED_ColumnName := Value;
end;

end.
