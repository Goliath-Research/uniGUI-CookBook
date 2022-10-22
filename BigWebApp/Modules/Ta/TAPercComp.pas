unit TAPercComp;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  ExtCtrls,
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
  uniLabel;

type
  TFrmTAPercentComplete = class(TUniForm)
    edPercent: TUniEdit;
    Label1: TUniLabel;
    SBUp: TUniSpeedButton;
    SBDown: TUniSpeedButton;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BitBtnOk: TUniSpeedButton;
    SBCancel: TUniSpeedButton;
    Panel3: TUniPanel;
    sb25: TUniSpeedButton;
    sb50: TUniSpeedButton;
    sb75: TUniSpeedButton;
    sb100: TUniSpeedButton;
    procedure SBCancelClick(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure SBUpClick(Sender: TObject);
    procedure SBDownClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sb25Click(Sender: TObject);
    procedure sb50Click(Sender: TObject);
    procedure sb75Click(Sender: TObject);
    procedure sb100Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FResult: boolean;
    FPercent: Real;
    FTaLaborId: Real;
    procedure SetResult(const Value: boolean);
    procedure SetPercent(const Value: Real);
    procedure SetTaLaborId(const Value: Real);
  public
    { Public declarations }
    property theResult: boolean read FResult write SetResult;
    property Percent: Real read FPercent write SetPercent;
    property TaLaborId: Real write SetTaLaborId;
  end;

function GetPercentComplete(ASource: String; ASourceID, ATA_LABOR_ID: Real; var APercent: Real): boolean;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  ta_rscstr;
{ TODO -oLema : Dependent on touchscrn }
// touchscrn;

{$R *.dfm}

function GetPercentComplete(ASource: String; ASourceID, ATA_LABOR_ID: Real; var APercent: Real): boolean;
var
  frm: TFrmTAPercentComplete;
  ADescrip: String;
begin
  frm := TFrmTAPercentComplete.Create(uniGUIApplication.UniApplication);
  frm.theResult := False;
  frm.TaLaborId := ATA_LABOR_ID;

  if ASource = 'TL' then
  begin
    ADescrip := SelectValueFmtAsString('select name from tool_task_information where id = %f', [ASourceID]);
    frm.Percent := SelectValueFmtAsFloat('select percentcomplete from tool_task_information where id = %f', [ASourceID]);
  end
  else
  begin
    ADescrip := SelectValueFmtAsString('select SubStr(RTrim(q.descrip) || decode(RTrim(q.descrip), null, null, '' /'') ' + ' || RTrim(a.descrip), 1, 100) from jobshop_rfq q, jobshop_task t, arinvt a ' +
      ' where q.id = t.jobshop_rfq_id and t.id = %f and t.arinvt_id = a.id(+)', [ASourceID]);
    frm.Percent := SelectValueFmtAsFloat('select v.percent_complete from V_JOBSHOP_RFQ_PROGRESS v, jobshop_task t ' + ' where v.jobshop_rfq_id = t.jobshop_rfq_id and t.id = %f', [ASourceID]);
  end;

  // 'Current Percent Complete for Project Task - %s = %.2f'
  frm.Caption := Format(ta_rscstr.cTXT0000130, [ADescrip, frm.Percent]);
  frm.ShowModal;
  APercent := frm.Percent;
  Result := frm.theResult;

end;


procedure TFrmTAPercentComplete.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmTAPercentComplete.UniFormShow(Sender: TObject);
begin
  edPercent.Text := FloatToStr(FPercent);
  if edPercent.Text = '' then
    edPercent.Text := '0';
end;

procedure TFrmTAPercentComplete.SBCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTAPercentComplete.BitBtnOkClick(Sender: TObject);
begin

  FPercent := StrToFloat(edPercent.Text);

  if FPercent < 0 then
  begin
    { TODO -oLema : Dependent on touchscrn }
    // touchscrn.TouchScreen_Msg_Error(ta_rscstr.cTXT0000131 {'Percentage cannot be negative'});
    SysUtils.Abort;
  end;

  if FPercent > 100 then
  begin
    { TODO -oLema : Dependent on touchscrn }
    // touchscrn.TouchScreen_Msg_Error(ta_rscstr.cTXT0000132{'Percentage cannot exceed 100.'});
    SysUtils.Abort;
  end;

  ExecuteCommandFmt('update ta_labor set complete = %f where id = %f', [FPercent, FTaLaborId]);

  FResult := true;
  Close;
end;

procedure TFrmTAPercentComplete.SBUpClick(Sender: TObject);
var
  APercent: Real;
begin
  APercent := StrToFloat(edPercent.Text);
  if Trunc(APercent) + 1 > 100 then
    exit;
  APercent := APercent + 1;
  edPercent.Text := FloatToStr(APercent);
end;

procedure TFrmTAPercentComplete.SetPercent(const Value: Real);
begin
  FPercent := Value;
end;

procedure TFrmTAPercentComplete.SetResult(const Value: boolean);
begin
  FResult := Value;
end;

procedure TFrmTAPercentComplete.SetTaLaborId(const Value: Real);
begin
  FTaLaborId := Value;
end;

procedure TFrmTAPercentComplete.SBDownClick(Sender: TObject);
var
  APercent: Real;
begin
  APercent := StrToFloat(edPercent.Text);
  if Trunc(APercent) - 1 < 0 then
    exit;
  APercent := APercent - 1;
  edPercent.Text := FloatToStr(APercent);
end;

procedure TFrmTAPercentComplete.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmTAPercentComplete.sb25Click(Sender: TObject);
begin
  edPercent.Text := '25';
end;

procedure TFrmTAPercentComplete.sb50Click(Sender: TObject);
begin
  edPercent.Text := '50';
end;

procedure TFrmTAPercentComplete.sb75Click(Sender: TObject);
begin
  edPercent.Text := '75';
end;

procedure TFrmTAPercentComplete.sb100Click(Sender: TObject);
begin
  edPercent.Text := '100';
end;

end.
