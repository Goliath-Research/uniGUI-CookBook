unit qc_doc_pref;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ComCtrls,
  StdCtrls,
  Buttons,
  Db,
  Mask,
  DBCtrls,
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
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniRadioButton,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox;

type
  TQCDocPrefCargo = record
    Mode: Integer;         {0-Mine, 1-All, 2-Other Team Member}
    Team_Member_ID: Real;  {other team member}
    SortDocsNumerically: Boolean;
  end;

  TFrmQCDocPreferences = class(TUniForm)
    btnOK: TUniButton;
    btnCancel: TUniButton;
    GroupBox1: TUniGroupBox;
    rbtnMyDocs: TUniRadioButton;
    rbtnAllDocs: TUniRadioButton;
    rbtnUserDocs: TUniRadioButton;
    wwcomboMember: TUniDBLookupComboBox;
    gboxWorkPath: TUniGroupBox;
    dbeWorkPath: TUniDBEdit;
    sbtnBrowse: TUniSpeedButton;
    wwQryTeamMember: TFDQuery;
    wwQryTeamMemberID: TBCDField;
    wwQryTeamMemberNAME: TStringField;
    SrcTeam_Member: TDataSource;
    TblTeam_Member: TFDTable;
    gboxGeneral: TUniGroupBox;
    SrcParams: TDataSource;
    TblParams: TFDTable;
    dbchkManadatoryChangeDesc: TUniDBCheckBox;
    SR: TIQWebSecurityRegister;
    dbchkHideUNCPath: TUniDBCheckBox;
    dbchkShow6UserFields: TUniDBCheckBox;
    chkSortDocNum: TUniCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure sbtnBrowseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FLogged_Team_Member_ID: Real;
    FQCDocPrefCargo: TQCDocPrefCargo;
    procedure Validate;
    procedure SetLogged_Team_Member_ID(const Value: Real);
    procedure SetQCDocPrefCargo(const Value: TQCDocPrefCargo);
  public
    { Public declarations }
    class function DoShowModal(ALogged_Team_Member_ID: Real; var AQCDocPrefCargo: TQCDocPrefCargo ): Boolean;
    property Logged_Team_Member_ID : Real write SetLogged_Team_Member_ID;
    property QCDocPrefCargo: TQCDocPrefCargo write SetQCDocPrefCargo;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Qc_Doc.qc_doc_const,
  FileCtrl,
  IQMS.Common.Dialogs,
  IQMS.Common.Directory ,
  { TODO : IQSecIns not converted yet }
  //IQSecIns,
  IQMS.Common.HelpHook;

class function TFrmQCDocPreferences.DoShowModal(ALogged_Team_Member_ID: Real; var AQCDocPrefCargo: TQCDocPrefCargo ): Boolean;
var
  LFrmQCDocPreferences : TFrmQCDocPreferences;
begin
  LFrmQCDocPreferences := TFrmQCDocPreferences.Create(UniGUIApplication.UniApplication);
  with LFrmQCDocPreferences do
  begin
    Logged_Team_Member_ID := ALogged_Team_Member_ID;
    QCDocPrefCargo := AQCDocPrefCargo;
    Result:= ShowModal = mrOK;
    if Result then with   FQCDocPrefCargo do
    begin
      if rbtnMyDocs.Checked        then Mode:= QC_DOC_SHOW_MY
      else if rbtnAllDocs.Checked  then Mode:= QC_DOC_SHOW_ALL
      else if rbtnUserDocs.Checked then Mode:= QC_DOC_SHOW_OTHER
      else                              Mode:= QC_DOC_SHOW_MY;

      if Mode = QC_DOC_SHOW_OTHER  then
         Team_Member_ID:= wwQryTeamMemberID.asFloat;

      SortDocsNumerically:= chkSortDocNum.Checked;
    end;
  end;
end;

procedure TFrmQCDocPreferences.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmQuality{CHM}, iqhtmQuality{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmQCDocPreferences.FormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);

  {working directory}
  with gboxWorkPath do
  begin
    if FLogged_Team_Member_ID > 0 then
       begin
         IQAssert( TblTeam_Member.Locate('id', FLogged_Team_Member_ID, []), 'Unable to Locate Team Member ID ' + FloatToStr(FLogged_Team_Member_ID));
         Caption:= Format('  Team member %s working directory  ', [ TblTeam_Member.FieldByName('name').asString ]);
       end
    else
       begin
         dbeWorkPath.Enabled:= FALSE;
         dbeWorkPath.Color  := clBtnFace;
         sbtnBrowse.Enabled := FALSE;
         Caption:= ' Unknown team member - working directory is unavailable  ';
         TblTeam_Member.Close;
       end;
  end;

  {Buttons}
  case FQCDocPrefCargo.Mode of
    QC_DOC_SHOW_MY    : rbtnMyDocs.Checked  := TRUE;
    QC_DOC_SHOW_ALL   : rbtnAllDocs.Checked := TRUE;
    QC_DOC_SHOW_OTHER : rbtnUserDocs.Checked:= TRUE;
  else
    rbtnMyDocs.Checked:= TRUE;
  end;
  if rbtnUserDocs.Checked then
  begin
    { TODO : TUniDBLookupComboBox does not have those properties }
    //wwcomboMember.LookupValue:= SelectValueByID( 'name', 'team_member', FQCDocPrefCargo.Team_Member_ID);
    //wwcomboMember.PerformSearch;
  end;

  chkSortDocNum.Checked:= FQCDocPrefCargo.SortDocsNumerically;
{ TODO : IQSecIns not converted yet }
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmQCDocPreferences.btnOKClick(Sender: TObject);
begin
  Validate;
  if TblTeam_Member.State = dsEdit then
     TblTeam_Member.Post;
  if TblParams.State = dsEdit then
     TblParams.Post;
  ModalResult:= mrOK;
end;

procedure TFrmQCDocPreferences.Validate;
begin
  { TODO : TUniDBLookupComboBox does not have those properties }
 { if rbtnUserDocs.Checked then
     IQAssert( wwcomboMember.LookupValue > '', 'No Team Member name is selected');    }

  if FLogged_Team_Member_ID > 0 then
    if not DirectoryExists( TblTeam_Member.FieldByName('work_path').asString ) then
       IQWarning('Working directory is invalid')
end;


procedure TFrmQCDocPreferences.sbtnBrowseClick(Sender: TObject);
var
  S: string;
begin
  with TblTeam_Member do
  begin
    S:= FieldByName('work_path').asString;
    if DirBrowse( s ) then
    begin
      Edit;
      FieldByName('work_path').asString:= ExpandUNCFileName( S );
    end;
  end;

end;

procedure TFrmQCDocPreferences.SetLogged_Team_Member_ID(const Value: Real);
begin
  FLogged_Team_Member_ID := Value;
end;

procedure TFrmQCDocPreferences.SetQCDocPrefCargo(const Value: TQCDocPrefCargo);
begin
  FQCDocPrefCargo := Value;
end;

end.
