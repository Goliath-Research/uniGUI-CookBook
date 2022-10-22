unit tl_calc_task_dates;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.DateControls,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniDateTimePicker,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel, uniRadioGroup;

type
  TFrmTLCalcTaskDates = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    lblStartDate: TUniLabel;
    cmbStartDate: TUniDateTimePicker;
    lblFinishDate: TUniLabel;
    cmbFinishDate: TUniDateTimePicker;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    rgSequence: TUniRadioGroup;
    cmbStartTime: TIQWebTimeComboBox;
    cmbFinishTime: TIQWebTimeComboBox;
    procedure rgSequenceClick(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
    strict private
      { Private declarations }
      FToolRfqID: Real;
      procedure Execute_From_Start;
      procedure Execute_From_Finish;
      function GetStartDateTime: TDateTime;
      procedure SetStartDateTime(const Value: TDateTime);
      function GetFinishDateTime: TDateTime;
      procedure SetFinishDateTime(const Value: TDateTime);
      procedure UpdateDates(const AToolTaskInfoID: Real;
        const AStart,
        AFinish: TDateTime);
      procedure SetControls;
  private
    procedure SetToolRfqID(const Value: Real);
    public
      { Public declarations }
      procedure Execute;

      property StartDateTime: TDateTime read GetStartDateTime
        write SetStartDateTime;
      property FinishDateTime: TDateTime read GetFinishDateTime
        write SetFinishDateTime;
      property ToolRfqID : Real write SetToolRfqID;
  end;

function DoCalculateTaskDates(AToolRfqID: Real; AStartDate, AFinishDate: TDateTime): Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg;

function DoCalculateTaskDates(AToolRfqID: Real; AStartDate, AFinishDate: TDateTime): Boolean;
var
  LFrmTLCalcTaskDates : TFrmTLCalcTaskDates;
begin
  LFrmTLCalcTaskDates :=  TFrmTLCalcTaskDates.Create(UniGUIApplication.UniApplication);
  LFrmTLCalcTaskDates.ToolRfqID := AToolRfqID;
  LFrmTLCalcTaskDates.StartDateTime := AStartDate;
  LFrmTLCalcTaskDates.FinishDateTime := AFinishDate;
  Result := LFrmTLCalcTaskDates.ShowModal = mrOk;
  if Result then
    LFrmTLCalcTaskDates.Execute;
end;

procedure TFrmTLCalcTaskDates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmTLCalcTaskDates.Execute;
begin
  case rgSequence.ItemIndex of
    0:
      Execute_From_Start;
    1:
      Execute_From_Finish;
  end;
end;

procedure TFrmTLCalcTaskDates.Execute_From_Start;
var
  hMsg: TPanelMesg;
  ADuration: Real;
  AStartDate, AFinishDate: TDateTime;
begin
  if (FToolRfqID = 0) then
    Exit;

  hMsg := hPleaseWait('');
  try
    ExecuteCommandParam(
      'BEGIN'#13 +
      '  project_calendar.update_task_dates_from_start(:p_tool_rfq_id,'#13 +
      '                                                :p_start_date);'#13 +
      'END;',
      ['P_TOOL_RFQ_ID;F', 'P_START_DATE;D'],
      [FToolRfqID, StartDateTime]);
  finally
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
  end;
end;

procedure TFrmTLCalcTaskDates.Execute_From_Finish;
var
  hMsg: TPanelMesg;
  ADuration: Real;
  AStartDate, AFinishDate: TDateTime;
begin
  if (FToolRfqID > 0) then
    begin
      hMsg := hPleaseWait('');
      try
        ExecuteCommandParam(
          'BEGIN'#13 +
          '  project_calendar.update_task_dates_from_finish(:p_tool_rfq_id,'#13 +
          '                                                 :p_initial_date);'#13 +
          'END;',
          ['P_TOOL_RFQ_ID;F', 'P_INITIAL_DATE;D'],
          [FToolRfqID, FinishDateTime]);
      finally
        if Assigned(hMsg) then
          FreeAndNil(hMsg);
      end;
    end;
end;

function TFrmTLCalcTaskDates.GetStartDateTime: TDateTime;
begin
  Result := Trunc(cmbStartDate.Datetime) + Frac(cmbStartTime.Time);
end;

procedure TFrmTLCalcTaskDates.SetStartDateTime(const Value: TDateTime);
begin
  cmbStartDate.Datetime := Trunc(Value);
  cmbStartTime.Time := Frac(Value);
end;

procedure TFrmTLCalcTaskDates.SetToolRfqID(const Value: Real);
begin
  FToolRfqID := Value;
end;

function TFrmTLCalcTaskDates.GetFinishDateTime: TDateTime;
begin
  Result := Trunc(cmbFinishDate.Datetime) + Frac(cmbFinishTime.Time);
end;

procedure TFrmTLCalcTaskDates.SetFinishDateTime(const Value: TDateTime);
begin
  cmbFinishDate.Datetime := Trunc(Value);
  cmbFinishTime.Time := Frac(Value);
end;

procedure TFrmTLCalcTaskDates.UniFormCreate(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  SetControls;
end;

procedure TFrmTLCalcTaskDates.UpdateDates(const AToolTaskInfoID: Real;
  const AStart, AFinish: TDateTime);
begin
  if (AToolTaskInfoID > 0) and
    (Trunc(AStart) > 0) and
    (Trunc(AFinish) > 0) then
    ExecuteCommandParam(
      'UPDATE tool_task_information '#13 +
      '   SET startdate = :STARTDATE, '#13 +
      '       finishdate = :FINISHDATE '#13 +
      ' WHERE id = :ID',
      ['STARTDATE;D', 'FINISHDATE;D', 'ID;F'],
      [AStart, AFinish, AToolTaskInfoID]);
end;

procedure TFrmTLCalcTaskDates.rgSequenceClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SetControls;
end;

procedure TFrmTLCalcTaskDates.SetControls;
begin
  IQMS.Common.Controls.IQEnableControl([lblStartDate, cmbStartDate, cmbStartTime],
    rgSequence.ItemIndex = 0);
  IQMS.Common.Controls.IQEnableControl([lblFinishDate, cmbFinishDate, cmbFinishTime],
    rgSequence.ItemIndex = 1);
end;

procedure TFrmTLCalcTaskDates.Help1Click(Sender: TObject);
begin
  // IQMS.Common.HelpHook.pas
  IQHelp.AssignHTMLFile(iqchmTOOLING { CHM } , iqhtmTOOLING { HTM } );
  IQHelp.HelpContext(Self.HelpContext);
end;

end.
