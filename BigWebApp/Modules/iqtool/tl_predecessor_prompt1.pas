unit tl_predecessor_prompt1;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniRadioGroup;

type
  TFrmTLPredecessorPrompt1 = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlPrompt: TUniPanel;
    PnlOptions: TUniPanel;
    lblPrompt: TUniLabel;
    rgOptions: TUniRadioGroup;
    chkDoNotShow: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FID: Real;
    FTaskPredecessorID: Real;
    FTaskPredecessor: String;
    FTaskPredecessorEnd: TDateTime;
    FTaskCurrent: String;
    FTaskCurrentStart: TDateTime;
    procedure UpdateTaskInfo;
    procedure UpdateCaptions;
    function CanShow: Boolean;
    procedure SetID(const Value: Real);
    procedure SetTaskCurrent(const Value: String);
    procedure SetTaskCurrentStart(const Value: TDateTime);
  public
    { Public declarations }
    function Option: Byte;
    property ID : Real write SetID;
    property TaskCurrent : String write SetTaskCurrent;
    property TaskCurrentStart: TDateTime write SetTaskCurrentStart;

  end;

  function PromptAddPredecessor(const AToolTaskInfoID: Real;
   const ATaskDescription: String; const ACurTaskStart: TDateTime;
   var APredecessorID: Real): Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  iqtool_rscstr,
  tl_regconst;

function PromptAddPredecessor(const AToolTaskInfoID: Real;
 const ATaskDescription: String; const ACurTaskStart: TDateTime;
 var APredecessorID: Real): Boolean;
var
  LFrmTLPredecessorPrompt1 : TFrmTLPredecessorPrompt1;
begin
  APredecessorID := 0;
  Result := True; // default - just add it

  LFrmTLPredecessorPrompt1 := TFrmTLPredecessorPrompt1.Create(UniGUIApplication.UniApplication);
  LFrmTLPredecessorPrompt1.Id := AToolTaskInfoID;
  LFrmTLPredecessorPrompt1.TaskCurrent := ATaskDescription;
  LFrmTLPredecessorPrompt1.TaskCurrentStart := ACurTaskStart;
   if LFrmTLPredecessorPrompt1.CanShow then
      begin
        Result := LFrmTLPredecessorPrompt1.ShowModal = mrOk;
        if Result and (LFrmTLPredecessorPrompt1.Option = 0) then
           APredecessorID := LFrmTLPredecessorPrompt1.FTaskPredecessorID;
      end;
end;

procedure TFrmTLPredecessorPrompt1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // cTXT0000147 = 'The start date for ? is adjacent the finish date of ?.'
  IQMS.Common.RegFrm.SetDialogCheckBoxResult(tl_regconst.PREDECESSOR_PROMPT1,
    chkDoNotShow.Checked, mrYes, iqtool_rscstr.cTXT0000147);
end;

function TFrmTLPredecessorPrompt1.CanShow: Boolean;
var
   ADate1, ADate2: TDateTime;
begin
  Result := False;
  if FID = 0 then
     Exit;
{ TODO : Could not convert variant of type null into variant of type olestr error
  chkDoNotShow.Checked := IQMS.Common.RegFrm.DoNotShowDialogAgain(tl_regconst.PREDECESSOR_PROMPT1);    }

  if chkDoNotShow.Checked then
     Exit;

  // 08/18/2010 Account for FTaskPredecessorID.  It must be > 0.
  // 08/27/2010 The finish_date must also be provided.
  Result := (FTaskPredecessorID > 0) and
            (FTaskPredecessorEnd > 0) and
            (FTaskCurrentStart >= FTaskPredecessorEnd);
  if not Result then Exit;

  Result := SelectValueFmtAsInteger(
    'SELECT 1                                 '#13 +
    'FROM tool_predecessor                    '#13 +
    'WHERE tool_task_info_id = %.0f AND       '#13 +
    '      predecessor_id = %.0f              ',
    [FID, FTaskPredecessorID]) = 0;

end;

procedure TFrmTLPredecessorPrompt1.UniFormCreate(Sender: TObject);
begin
  UpdateTaskInfo;
  UpdateCaptions;
end;

procedure TFrmTLPredecessorPrompt1.UpdateCaptions;
begin
  if FID = 0 then
     Exit;

  //Alternative message: 'You entered a start date for %s that is close to the finish date of %s.',
  lblPrompt.Caption := Format(
    // 'The start date for %s is adjacent the finish date of %s',
    iqtool_rscstr.cTXT0000144,
    [FTaskCurrent, FTaskPredecessor]);

  rgOptions.Items.Clear;
  // 'Link the tasks.  %s will follow %s.'
  rgOptions.Items.Add(Format(iqtool_rscstr.cTXT0000145,
   [FTaskCurrent, FTaskPredecessor]));
  // 'Change the date without adding a link.'
  rgOptions.Items.Add(iqtool_rscstr.cTXT0000146);
  rgOptions.ItemIndex := 0;
end;

procedure TFrmTLPredecessorPrompt1.UpdateTaskInfo;
var
   AData: Variant;
begin
  if FID = 0 then
     Exit;
  FTaskPredecessorEnd := 0;
  FTaskPredecessor := '';
  // Note:  This does not return the default predecessor in the tree view
  //        sequence.  It does return the prior task based on the finish
  //        date.  Parent tasks are excluded from the results.
  FTaskPredecessorID := SelectValueFmtAsInt64(
    'SELECT iqms.project_predecessor.adjacent_predecessor_id(id)'#13 +
    'FROM tool_task_information'#13 +
    'WHERE id = %.0f',
    [FID]);
  if FTaskPredecessorID = 0 then
     Exit;

  // Get informational fields about the predecessor
  AData := SelectValueArrayFmt(
    'SELECT name, finishdate '#13 +
    'FROM tool_task_information '#13 +
    'WHERE id = %.0f AND'#13 +
    '      finishdate IS NOT NULL',
    [FTaskPredecessorID]);

  if System.Variants.VarArrayDimCount(AData) > 0 then
     begin
       FTaskPredecessor := System.Variants.VarToStr(AData[0]);
       // The data field should never be NULL, but as a matter of
       // course, I check to prevent a variant conversion error.
       if not System.Variants.VarIsNull(AData[1]) then
          FTaskPredecessorEnd := System.Variants.VarToDateTime(AData[1]);
     end
  else FTaskPredecessorID := 0; // reset, so this form does not display

end;

function TFrmTLPredecessorPrompt1.Option: Byte;
begin
  Result := rgOptions.ItemIndex;
end;

procedure TFrmTLPredecessorPrompt1.SetID(const Value: Real);
begin
  FID := Value;
end;

procedure TFrmTLPredecessorPrompt1.SetTaskCurrent(const Value: String);
begin
  FTaskCurrent := Value;
end;

procedure TFrmTLPredecessorPrompt1.SetTaskCurrentStart(const Value: TDateTime);
begin
  FTaskCurrentStart := Value;
end;

end.
