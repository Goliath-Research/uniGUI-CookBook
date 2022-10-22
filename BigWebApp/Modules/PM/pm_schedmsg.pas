unit pm_schedmsg;

{ ** MRO Schedule Conflict Warning **

  This form displays, warning user that a scheduling conflict exists,
  when equipment is taken in or out of service.

  ** History **

  04/09/2010
  Added unit.  Requested by Randy.  SCR # 983.

}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel,
  uniImage,
  IQUniGrid,
  uniGUIFrame;

type
  { TFrmPMScheduleWarning }
  TFrmPMScheduleWarning = class(TUniForm)
    SrcData: TDataSource;
    QryData: TFDQuery;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnIgnore: TUniButton;
    btnCancel: TUniButton;
    Panel2: TUniPanel;
    Grid: TIQUniGridControl;
    QryDataPMEQMT_ID: TBCDField;
    QryDataCNTR_SEQ: TBCDField;
    QryDataWORKCENTER_EQNO: TStringField;
    QryDataWORKORDER_ID: TBCDField;
    QryDataPROD_START_TIME: TDateTimeField;
    QryDataPROD_END_TIME: TDateTimeField;
    QryDataMFGNO: TStringField;
    PMain: TUniPopupMenu;
    JumpToSchedule1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    QryDataCNTR_SCHED_ID: TBCDField;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Panel4: TUniPanel;
    Panel1: TUniPanel;
    lblPrompt: TUniLabel;
    Panel3: TUniPanel;
    lblStartDateLabel: TUniLabel;
    lblEndDateLabel: TUniLabel;
    imgWarning: TUniImage;
    procedure DoBeforeOpen(DataSet: TDataSet);
    procedure JumpToSchedule1Click(Sender: TObject);
    procedure PMainPopup(Sender: TObject);
  private
    { Private declarations }
    FPMEqmtID: Real;
    FStartTime,
      FEndTime: TDateTime;
  public
    { Public declarations }
    property PMEqmtID : Real write FPMEqmtID;
    property StartTime : TDateTime write FStartTime;
    property EndTime : TDateTime write FEndTime;
  end;

function DoShowSchedulingConflict(const APMEqmtID: Real; const AStartTime, AEndTime: TDateTime): Boolean;

implementation

{$R *.dfm}


uses
  IQMS.Common.Applications,
  IQMS.Common.DataLib,
  IQMS.WebVcl.Jump,
  //iqsecins,
  IQMS.WebVcl.SecurityManager,
  pm_rscstr;

function DoShowSchedulingConflict(const APMEqmtID: Real; const AStartTime, AEndTime: TDateTime): Boolean;
var
  aFrmPMScheduleWarning : TFrmPMScheduleWarning;
begin

  // if the start date is not provided, then pass a true result, and exit early.
  if (Trunc(AStartTime) = 0) then
    begin
      Result := True;
      Exit;
    end;

  aFrmPMScheduleWarning := TFrmPMScheduleWarning.Create(UniGUIApplication.UniApplication);

  aFrmPMScheduleWarning.PMEqmtID := APMEqmtID;
  aFrmPMScheduleWarning.StartTime := AStartTime;
  aFrmPMScheduleWarning.EndTime := AEndTime;

  //iqsecins.EnsureSecurityInspectorOnTopOf(Self);
  // 'Service Date Out:  %s';
  if Trunc(AStartTime) > 0 then
    aFrmPMScheduleWarning.lblStartDateLabel.Caption := Format(pm_rscstr.cTXT0000305,
      [FormatDateTime('ddddd tt', AStartTime)]);
  // 'Service Date In:  %s';
  if Trunc(AEndTime) > 0 then
    aFrmPMScheduleWarning.lblEndDateLabel.Caption := Format(pm_rscstr.cTXT0000306,
      [FormatDateTime('ddddd tt', AEndTime)]);
  ReOpen(aFrmPMScheduleWarning.QryData);
//  SecurityManager.SetVisibleIfLicensed(NIL, aFrmPMScheduleWarning.JumpToSchedule1, NIL,
//    IQAppsNames[apSchedule], aFrmPMScheduleWarning.SR);

  if (aFrmPMScheduleWarning.QryData.BOF and aFrmPMScheduleWarning.QryData.EOF) then
  begin
    Result := True;
    aFrmPMScheduleWarning.Free;
  end
  else
    Result := aFrmPMScheduleWarning.ShowModal = mrOk;
end;

{ TFrmPMScheduleWarning }

procedure TFrmPMScheduleWarning.DoBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'PMEQMT_ID', Trunc(FPMEqmtID));
  AssignQueryParamValue(DataSet, 'START_TIME', FStartTime);
  AssignQueryParamValue(DataSet, 'END_TIME', FEndTime);
  AssignQueryParamValue(DataSet, 'SQL_SWITCH',
    INTEGER(Trunc(FEndTime) > 0));
end;

procedure TFrmPMScheduleWarning.JumpToSchedule1Click(Sender: TObject);
begin
  // Jump to Schedule
  IQMS.WebVcl.Jump.JumpDirect(IQMS.Common.JumpConstants.iq_JumpToSchedule,
    QryDataCNTR_SCHED_ID.AsLargeInt);
end;

procedure TFrmPMScheduleWarning.PMainPopup(Sender: TObject);
begin
  JumpToSchedule1.Enabled := SR.Enabled['JumpToSchedule1'] and
    (QryDataCNTR_SCHED_ID.AsLargeInt > 0);
end;

end.
