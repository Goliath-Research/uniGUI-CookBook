unit PM_clonetaskprompt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  FireDAC.UI.Intf,
  Data.db,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TCloneTaskRecord = record
    CurrentPM_TASK_ID: Int64;
    CurrentTaskNo: string;
    CurrentTaskDescrip: string;
    NewTaskNo: string;
    NewTaskDescrip: string;
    IncludeSkills: Boolean;
    IncludeInternalDoc: Boolean;
    IncludeExternalDoc: Boolean;
    IncludeEMailCorr: Boolean;
    EPLANT_ID: Int64;
  end;

  { TFrmCloneTaskPrompt }
  TFrmCloneTaskPrompt = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlHeaderEditLeft: TUniPanel;
    lblTask: TUniLabel;
    lblDescription: TUniLabel;
    PnlHeaderEdit: TUniPanel;
    chkIncludeSkills: TUniCheckBox;
    chkIncludeInternalDocs: TUniCheckBox;
    chkIncludeExternalDocs: TUniCheckBox;
    chkIncludeEMailCorr: TUniCheckBox;
    Label1: TUniLabel;
    edtCurrentTask: TUniEdit;
    edtNewTask: TUniEdit;
    edtNewTaskDescription: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FInternalCloneTaskRecord: TCloneTaskRecord;
    function IsPMTaskUnique: Boolean;
    procedure CopyTaskRecord(const ASource: TCloneTaskRecord; var ATarget: TCloneTaskRecord);
    procedure ApplyTaskRecordToScreen(ASource: TCloneTaskRecord);
    procedure ApplyScreenToTaskRecord(var ATarget: TCloneTaskRecord);
  public
    { Public declarations }
  end;

function DoClonePMTaskPrompt(var ACloneTaskRecord: TCloneTaskRecord): Boolean;

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  pm_rscstr;

function DoClonePMTaskPrompt(var ACloneTaskRecord: TCloneTaskRecord): Boolean;
var
  LFrmCloneTaskPrompt : TFrmCloneTaskPrompt;
begin
  LFrmCloneTaskPrompt := TFrmCloneTaskPrompt.Create(UniGUIApplication.UniApplication);
  Result := LFrmCloneTaskPrompt.ShowModal = mrOk;
  if Result then
    begin
      LFrmCloneTaskPrompt.ApplyScreenToTaskRecord(ACloneTaskRecord);
    end;
end;

procedure TFrmCloneTaskPrompt.FormShow(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlHeaderEdit);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlHeaderEdit);
  IQMS.Common.RegFrm.IQRegFormRead(Self, [chkIncludeSkills, chkIncludeInternalDocs,
    chkIncludeExternalDocs, chkIncludeEMailCorr]);
end;

procedure TFrmCloneTaskPrompt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [chkIncludeSkills, chkIncludeInternalDocs,
    chkIncludeExternalDocs, chkIncludeEMailCorr]);
end;

procedure TFrmCloneTaskPrompt.CopyTaskRecord(const ASource: TCloneTaskRecord;
  var ATarget: TCloneTaskRecord);
begin
  ATarget.CurrentPM_TASK_ID := ASource.CurrentPM_TASK_ID;
  ATarget.CurrentTaskNo := ASource.CurrentTaskNo;
  ATarget.CurrentTaskDescrip := ASource.CurrentTaskDescrip;
  ATarget.NewTaskNo := ASource.NewTaskNo;
  ATarget.NewTaskDescrip := ASource.NewTaskDescrip;
  ATarget.IncludeSkills := ASource.IncludeSkills;
  ATarget.IncludeInternalDoc := ASource.IncludeInternalDoc;
  ATarget.IncludeExternalDoc := ASource.IncludeExternalDoc;
  ATarget.IncludeEMailCorr := ASource.IncludeEMailCorr;
  ATarget.EPLANT_ID := ASource.EPLANT_ID;
end;

procedure TFrmCloneTaskPrompt.ApplyTaskRecordToScreen(
  ASource: TCloneTaskRecord);
begin
  CopyTaskRecord(ASource, FInternalCloneTaskRecord);
  edtCurrentTask.Text := ASource.CurrentTaskNo;
  edtNewTask.Text := ASource.NewTaskNo;
  edtNewTaskDescription.Text := ASource.NewTaskDescrip;
  chkIncludeSkills.Checked := ASource.IncludeSkills;
  chkIncludeInternalDocs.Checked := ASource.IncludeInternalDoc;
  chkIncludeExternalDocs.Checked := ASource.IncludeExternalDoc;
  chkIncludeEMailCorr.Checked := ASource.IncludeEMailCorr;
end;

procedure TFrmCloneTaskPrompt.ApplyScreenToTaskRecord(
  var ATarget: TCloneTaskRecord);
begin
  CopyTaskRecord(FInternalCloneTaskRecord, ATarget);
  ATarget.NewTaskNo := edtNewTask.Text;
  ATarget.NewTaskDescrip := edtNewTaskDescription.Text;
  ATarget.IncludeSkills := chkIncludeSkills.Checked;
  ATarget.IncludeInternalDoc := chkIncludeInternalDocs.Checked;
  ATarget.IncludeExternalDoc := chkIncludeExternalDocs.Checked;
  ATarget.IncludeEMailCorr := chkIncludeEMailCorr.Checked;
end;

procedure TFrmCloneTaskPrompt.btnOkClick(Sender: TObject);
begin
  if Trim(edtNewTask.Text) = '' then
    // 'Task number is required.  Please enter a task number.';
    raise Exception.Create(pm_rscstr.cTXT0000164);

  if not IsPMTaskUnique then
    // 'Task, %s, already exists.  Please enter a unique Task name.'
    raise Exception.CreateFmt(pm_rscstr.cTXT0000246,
      [IQMS.Common.StringUtils.FixStr(edtNewTask.Text)]);

  ModalResult := mrOk;
end;

function TFrmCloneTaskPrompt.IsPMTaskUnique: Boolean;
begin
  // 09/09/2009 this method checks to see if a MRO Task (PMTASKS)
  // is unique.  We must also account for EPlant.  This function
  // returns True if the task is unique.  The function returns
  // False if the task name has already been used on another
  // record.
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT 1');
      SQL.Add('  FROM pmtasks');
      SQL.Add(Format(' WHERE id <> %d',
        [FInternalCloneTaskRecord.CurrentPM_TASK_ID]));
      SQL.Add('   AND UPPER (TRIM (taskno)) = UPPER (TRIM (:TASKNO))');
      if (FInternalCloneTaskRecord.EPLANT_ID > 0) then
        SQL.Add(Format('   AND eplant_id = %d',
          [FInternalCloneTaskRecord.EPLANT_ID]))
      else
        SQL.Add('   AND eplant_id is NULL');
      SQL.Add('   AND ROWNUM < 2');
      with ParamByName('TASKNO') do
        begin
          DataType := ftString;
          ParamType := ptInput;
          Value := edtNewTask.Text;
        end;
      Open;
      Result := (Bof and Eof);
    finally
      Free;
    end;
end;

end.
