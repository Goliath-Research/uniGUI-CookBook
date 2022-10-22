unit EmpJob;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
  Mask,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
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
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator;

type
  TFrmEmpJobs = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    JobDescriptions1: TUniMenuItem;
    N1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    SrcEmp: TDataSource;
    QryEmp: TFDQuery;
    QryEmpEMPNO: TStringField;
    QryEmpFIRST_NAME: TStringField;
    QryEmpLAST_NAME: TStringField;
    QryEmpID: TBCDField;
    Splitter1: TUniSplitter;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    NavJobs: TUniDBNavigator;
    PkJobs: TIQWebHPick;
    PkJobsID: TBCDField;
    PkJobsDESCRIP: TStringField;
    SR: TIQWebSecurityRegister;
    IQAbout1: TIQWebAbout;
    IQSearch2: TIQUniGridControl;
    SrcEmpJobs: TDataSource;
    QryEmpJobs: TFDQuery;
    QryEmpJobsID: TBCDField;
    QryEmpJobsPR_EMP_ID: TBCDField;
    QryEmpJobsHR_JOB_DESCRIP_ID: TBCDField;
    QryEmpJobsCERT_LEVEL: TBCDField;
    QryEmpJobsCERT_EXPIRE_DATE: TDateTimeField;
    QryEmpJobsDESCRIP: TStringField;
    UpdateSQL1: TFDUpdateSQL;
    wwDBJobs: TUniEdit;
    CertDate: TUniDBDateTimePicker;
    Contents1: TUniMenuItem;
    procedure wwDBJobsCustomDlg(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure JobDescriptions1Click(Sender: TObject);
    procedure QryEmpJobsAfterPost(DataSet: TDataSet);
    procedure QryEmpJobsBeforePost(DataSet: TDataSet);
    procedure QryEmpJobsBeforeEdit(DataSet: TDataSet);
    procedure NavJobsBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure QryEmpJobsBeforeInsert(DataSet: TDataSet);
    procedure QryEmpJobsBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    FInserting : boolean;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);override;
  end;

procedure DoEmployeeJobs(AOwner: TComponent);


var
  FrmEmpJobs: TFrmEmpJobs;

implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.HelpHook,
  HrJobs;
{$R *.DFM}

procedure DoEmployeeJobs(AOwner: TComponent);
begin
   TFrmEmpJobs.Create( AOwner ).Show;
end;

constructor TFrmEmpJobs.Create(AOwner:TComponent);
begin
  inherited;
  IQSetTablesActive( true, self );
  IQRegFormRead( self, [self]);
  wwDBJobs.Parent  := IQSearch2.wwDbGrid;
  CertDate.Parent  := IQSearch2.wwDbGrid;
  wwDBJobs.Visible := False;
  CertDate.Visible := False;
end;

procedure TFrmEmpJobs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
  Action := caFree;
end;

procedure TFrmEmpJobs.wwDBJobsCustomDlg(Sender: TObject);
begin
  with PkJobs do
  if Execute then
  begin
    if not (QryEmpJobs.State in [dsEdit, dsInsert]) then QryEmpJobs.Edit;
    QryEmpJobsHR_JOB_DESCRIP_ID.asFloat := GetValue('ID');
    QryEmpJobsDESCRIP.asString := GetValue('DESCRIP');
  end;
end;

procedure TFrmEmpJobs.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmEmpJobs.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEmpJobs.JobDescriptions1Click(Sender: TObject);
begin
  DoHRJobs(self, 0);
//  Com_Exec( 'IQHR', [ SHOW_JOB_DESCRIP, 0 ]);    {HR_Const, IQComExe.pas}
end;

procedure TFrmEmpJobs.QryEmpJobsAfterPost(DataSet: TDataSet);
begin
    if FInserting then
    begin
      ExecuteCommandFmt('insert into hr_emp_skills (pmskill_id, pr_emp_id) ' +
                ' select pmskill_id, %f ' +
                '  from HR_JOB_DESCRIP_SKILLS ' +
                ' where HR_JOB_DESCRIP_ID = %f ' +
                '   and pmskill_id not in (select pmskill_id from hr_emp_skills where pr_emp_id = %f)',
                [QryEmpID.asFloat, QryEmpJobsHR_JOB_DESCRIP_ID.asFloat, QryEmpID.asFloat]);
    end;

{
  try
    QryEmpJobs.DataBase.ApplyUpdates( [ QryEmpJobs ]);
    if FInserting then
    begin
      ExecuteCommandFmt('insert into hr_emp_skills (pmskill_id, pr_emp_id) ' +
                ' select pmskill_id, %f ' +
                '  from HR_JOB_DESCRIP_SKILLS ' +
                ' where HR_JOB_DESCRIP_ID = %f ' +
                '   and pmskill_id not in (select pmskill_id from hr_emp_skills where pr_emp_id = %f)',
                [QryEmpID.asFloat, QryEmpJobsHR_JOB_DESCRIP_ID.asFloat, QryEmpID.asFloat]);
    end;
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryEmpJobs.Close;
      QryEmpJobs.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmEmpJobs.QryEmpJobsBeforePost(DataSet: TDataSet);
begin
  QryEmpJobsPR_EMP_ID.asFloat := QryEmpID.asFloat;
  if QryEmpJobsID.asFloat = 0 then
    QryEmpJobsID.asFloat := GetNextID('PR_EMP_JOB');

end;

procedure TFrmEmpJobs.QryEmpJobsBeforeEdit(DataSet: TDataSet);
begin
  FInserting := false;
  if QryEmpID.asFloat = 0 then
    raise Exception.Create('A job must be attached to a valid employee. Please create one first.');
end;

procedure TFrmEmpJobs.NavJobsBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryEmpJobsID.asFloat;
    QryEmpJobs.Close;
    QryEmpJobs.Open;
    QryEmpJobs.Locate('ID', AId, []);
    Abort;
  end;
end;

procedure TFrmEmpJobs.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_MN{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmEmpJobs.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 14030 );
end;

procedure TFrmEmpJobs.QryEmpJobsBeforeInsert(DataSet: TDataSet);
begin
  FInserting := false;
  if QryEmpID.asFloat = 0 then
    raise Exception.Create('A job must be attached to a valid employee. Please create one first.');
  FInserting := true;
end;

procedure TFrmEmpJobs.QryEmpJobsBeforeDelete(DataSet: TDataSet);
begin
  FInserting := false;
end;

end.
