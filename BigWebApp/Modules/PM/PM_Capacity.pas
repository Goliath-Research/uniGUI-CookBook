unit pm_capacity;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Types,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Vcl.wwDataInspector,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  pm_types,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, IQUniGrid, uniGUIFrame;

type
  { TFrmPMCapacity }
  TFrmPMCapacity = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGridPlan: TIQUniGridControl;
    SrcCapacityPlan: TDataSource;
    QryMonthly: TFDQuery;
    QryMonthlyMFGTYPE: TStringField;
    QryMonthlyMFGCELL: TStringField;
    QryMonthlyMFGCELL_ID: TBCDField;
    QryMonthlyPAST_DUE: TFMTBCDField;
    QryMonthlyHRS_REQ_1: TFMTBCDField;
    QryMonthlyHRS_AVAIL_1: TFMTBCDField;
    QryMonthlyHRS_REQ_2: TFMTBCDField;
    QryMonthlyHRS_AVAIL_2: TFMTBCDField;
    QryMonthlyHRS_REQ_3: TFMTBCDField;
    QryMonthlyHRS_AVAIL_3: TFMTBCDField;
    QryMonthlyHRS_REQ_4: TFMTBCDField;
    QryMonthlyHRS_AVAIL_4: TFMTBCDField;
    QryMonthlyPeriod1: TBCDField;
    QryMonthlyPeriod2: TBCDField;
    QryMonthlyPeriod3: TBCDField;
    QryMonthlyPeriod4: TBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryMonthlyHRS_REQ_5: TFMTBCDField;
    QryMonthlyHRS_AVAIL_5: TFMTBCDField;
    QryMonthlyPeriod5: TBCDField;
    QryWeekly: TFDQuery;
    QryWeeklyMFGTYPE: TStringField;
    QryWeeklyMFGCELL: TStringField;
    QryWeeklyMFGCELL_ID: TBCDField;
    QryWeeklyPAST_DUE: TFMTBCDField;
    QryWeeklyHRS_REQ_1: TFMTBCDField;
    QryWeeklyHRS_AVAIL_1: TFMTBCDField;
    QryWeeklyHRS_REQ_2: TFMTBCDField;
    QryWeeklyHRS_AVAIL_2: TFMTBCDField;
    QryWeeklyHRS_REQ_3: TFMTBCDField;
    QryWeeklyHRS_AVAIL_3: TFMTBCDField;
    QryWeeklyHRS_REQ_4: TFMTBCDField;
    QryWeeklyHRS_AVAIL_4: TFMTBCDField;
    QryWeeklyHRS_REQ_5: TFMTBCDField;
    QryWeeklyHRS_AVAIL_5: TFMTBCDField;
    QryWeeklyPeriod1: TBCDField;
    QryWeeklyPeriod2: TBCDField;
    QryWeeklyPeriod3: TBCDField;
    QryWeeklyPeriod4: TBCDField;
    QryWeeklyPeriod5: TBCDField;
    pnlCriteria: TUniPanel;
    PnlToolbar2: TUniPanel;
    Splitter1: TUniSplitter;
    PnlToolbar1: TUniPanel;
    sbtnApply: TUniSpeedButton;
    Label1: TUniLabel;
    wwDBDateTimePickerStartDate: TUniDBDateTimePicker;
    wwDBComboBoxViewType: TUniDBComboBox;
    Label2: TUniLabel;
    QryDaily: TFDQuery;
    sbtnBack: TUniSpeedButton;
    sbtnForward: TUniSpeedButton;
    QryDailyMFGTYPE: TStringField;
    QryDailyMFGCELL: TStringField;
    QryDailyMFGCELL_ID: TBCDField;
    QryDailyPAST_DUE: TFMTBCDField;
    QryDailyHRS_REQ_1: TFMTBCDField;
    QryDailyHRS_AVAIL_1: TFMTBCDField;
    QryDailyHRS_REQ_2: TFMTBCDField;
    QryDailyHRS_AVAIL_2: TFMTBCDField;
    QryDailyHRS_REQ_3: TFMTBCDField;
    QryDailyHRS_AVAIL_3: TFMTBCDField;
    QryDailyHRS_REQ_4: TFMTBCDField;
    QryDailyHRS_AVAIL_4: TFMTBCDField;
    QryDailyHRS_REQ_5: TFMTBCDField;
    QryDailyHRS_AVAIL_5: TFMTBCDField;
    QryDailyPeriod1: TBCDField;
    QryDailyPeriod2: TBCDField;
    QryDailyPeriod3: TBCDField;
    QryDailyPeriod4: TBCDField;
    QryDailyPeriod5: TBCDField;
    bbtnSearch: TUniSpeedButton;
    Bevel1: TUniPanel;
    PkMfgCell: TIQWebHPick;
    PkMfgCellMFGTYPE: TStringField;
    PkMfgCellMFGCELL: TStringField;
    QryMonthlyMFGCELL_DESCRIP: TStringField;
    QryWeeklyMFGCELL_DESCRIP: TStringField;
    QryDailyMFGCELL_DESCRIP: TStringField;
    PkMfgCellMFGCELL_DESCRIP: TStringField;
    PkMfgCellID: TBCDField;
    N1: TUniMenuItem;
    UpdateCapacitySchedule1: TUniMenuItem;
    SecurityRegister1: TIQWebSecurityRegister;
    sbtnAddWorkorder: TUniSpeedButton;
    Bevel2: TUniPanel;
    popmMainGrid: TUniPopupMenu;
    ViewWorkorders1: TUniMenuItem;
    sbtnViewWorkorders: TUniSpeedButton;
    PMCapacityParameters1: TUniMenuItem;
    Contents1: TUniMenuItem;
    Panel3: TUniPanel;
    shpAvailable: TUniPanel;
    shpOverBooked: TUniPanel;
    shpBooked: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
{ TODO -oGPatil -cWebConvert : TGridDrawState and TNavigateBtn not present in UniGui
    procedure wwDBGridPlanDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure wwDBGridPlanCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush); }

    procedure QryMonthlyBeforeOpen(DataSet: TDataSet);
    procedure AbortOnInsert(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnApplyClick(Sender: TObject);
    procedure sbtnBackClick(Sender: TObject);
    procedure sbtnForwardClick(Sender: TObject);
    procedure bbtnSearchClick(Sender: TObject);
    procedure wwDBComboBoxViewTypeChange(Sender: TObject);
    procedure UpdateCapacitySchedule1Click(Sender: TObject);
    procedure sbtnAddWorkorderClick(Sender: TObject);
    procedure ViewWorkorders1Click(Sender: TObject);
    procedure PMCapacityParameters1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure QryMonthlyUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FNormalThreshold: Real;
    FBookedThreshold: Real;
    FLockHandle: string;

    procedure DrawPeriodInGrid(AGrid: TIQUniGridControl; Rect: TRect;
      AReqHrs, AAvailHrs: Real);
    procedure DrawMfgCellDetails(AGrid: TIQUniGridControl; Rect: TRect;
      AMfgCell, AMfgType, AMfgCell_Descrip: string);
    procedure UpdateGridPeriodsTitles;
    function ActiveDataSet: TFDQuery;
    function GetStartDate: TDateTime;
    function GetViewType: TPMCapacityView;
    procedure MovePeriod(ADirection: Integer);
    procedure RefreshActiveDataSet;
    procedure ApplyCriteria;
    procedure DecrementSemaphore(ALockHandle: string);
    procedure IncrementSemaphore(var ALockHandle: string);
    function CanAccess: Boolean;
    procedure FinilizeCapacityUpdate;
    procedure PrepareForCapacityUpdate;
    function GetSelectedPeriod: Integer;
    procedure IQRefreshDataSets(var Msg: TMessage); message iq_RefreshDataSets;
    procedure LoadThresholds;
  public
    { Public declarations }
    class procedure DoShow;
  end;
implementation

{$R *.dfm}


uses
  capshare,
  IQMS.Common.Graphics,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Locks,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  pm_add_sched,
  pm_period_wo,
  pm_rscstr,
  Vcl.DBCtrls,
  pm_capacity_params;

class procedure TFrmPMCapacity.DoShow;
var
  LFrmPMCapacity : TFrmPMCapacity;
begin
  LFrmPMCapacity := TFrmPMCapacity.Create(UniGUIApplication.UniApplication);
  LFrmPMCapacity.Show;
end;

procedure TFrmPMCapacity.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, wwDBGridPlan, pnlCriteria]);
end;

function TFrmPMCapacity.CanAccess: Boolean;
begin
  try
    IncrementSemaphore(FLockHandle); { Shared mode }
  except
    on E: Exception do
      begin
        Application.ShowException(E);
        Result := FALSE;
        EXIT;
      end;
  end;

  DecrementSemaphore(FLockHandle); { Shared mode }
  Result := TRUE;
end;

procedure TFrmPMCapacity.IncrementSemaphore(var ALockHandle: string);
begin
(* TODO -oGPatil -cWebConvert : Dependency on db_dm.pas  File
  with DB_DataModule do
    if not AcquireIQLock(ALockHandle, IQMS_PM_CAPACITY, IQLOCK_SHARED) then
      begin
        ALockHandle := '';
        // 'Failed to acquire shared lock.'#13#13 +
        // 'Update Capacity Schedule process is currently in progress. Please try again later'
        raise Exception.Create(pm_rscstr.cTXT0000280);
      end;  *)
end;

procedure TFrmPMCapacity.DecrementSemaphore(ALockHandle: string);
var
  S: string;
begin
(* TODO -oGPatil -cWebConvert : Dependency on db_dm.pas  File
  with DB_DataModule do
    if ALockHandle > '' then
      begin
        S := IQUnLock(ALockHandle);
        if S <> '' then
          { 'Cannot unlock existing lock. Please terminate this ' +
            'application to give other users access.' }
          IQWarning(S + #13 + pm_rscstr.cTXT0000281);
      end;   *)
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmPMCapacity.wwDBGridPlanDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if (Field.FieldName = 'Period1') then
    DrawPeriodInGrid(wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_1')
      .asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_1').asFloat)

  else if (Field.FieldName = 'Period2') then
    DrawPeriodInGrid(wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_2')
      .asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_2').asFloat)

  else if (Field.FieldName = 'Period3') then
    DrawPeriodInGrid(wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_3')
      .asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_3').asFloat)

  else if (Field.FieldName = 'Period4') then
    DrawPeriodInGrid(wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_4')
      .asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_4').asFloat)

  else if (Field.FieldName = 'Period5') then
    DrawPeriodInGrid(wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_5')
      .asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_5').asFloat)

  else if Field.FieldName = 'MFGCELL' then
    DrawMfgCellDetails(wwDBGridPlan, Rect, ActiveDataSet.FieldByName('MFGCELL')
      .asString, ActiveDataSet.FieldByName('MFGTYPE').asString,
      ActiveDataSet.FieldByName('MFGCELL_DESCRIP').asString)

  else
    wwDBGridPlan.DefaultDrawDataCell(Rect, Field, State);
end;         }

procedure TFrmPMCapacity.DrawPeriodInGrid(AGrid: TIQUniGridControl; Rect: TRect;
  AReqHrs, AAvailHrs: Real);
var
  ARectLabelReq: TRect;
  ARectLabelAvail: TRect;

  ARectTextReq: TRect;
  ARectTextAvail: TRect;

  ARectBar: TRect;
  ARectProgress: TRect;
  ARectProgressText: TRect;

  ABarWidth: Integer;
  AProgress: Real;

  AUpperTextHeight: Integer;
  ALeftColumnWidth: Integer;

  ABarColor: TColor;
  ABarGradientLightColor: TColor;

  function NumToStr(AValue: Real): string;
  begin
    if AValue = 0 then
      Result := ''
    else
      Result := Format('%.2f', [AValue]);
  end;

begin
  if AAvailHrs = 0 then
    AProgress := 0
  else
    AProgress := IQRoundEx(AReqHrs / AAvailHrs * 100);

  // prepare
  AUpperTextHeight := (Rect.Bottom - Rect.Top) div 2;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain Canvas
  ALeftColumnWidth := AGrid.Canvas.TextWidth('99.99% ') + 4;

  // Label Req
  ARectLabelReq.TopLeft := Rect.TopLeft;
  ARectLabelReq.Bottom := ARectLabelReq.Top + AUpperTextHeight div 2;
  ARectLabelReq.Right := ARectLabelReq.Left + ALeftColumnWidth - 1;
  // pm_rscstr.cTXT0000282 = 'Req'
  AGrid.Canvas.TextRect(ARectLabelReq, ARectLabelReq.Left + 1,
    ARectLabelReq.Top + 1, pm_rscstr.cTXT0000282 + ' ');

  // Text Req
  ARectTextReq.Top := ARectLabelReq.Top;
  ARectTextReq.Left := ARectLabelReq.Right + 2;
  ARectTextReq.Bottom := ARectLabelReq.Bottom;
  ARectTextReq.Right := Rect.Right - 1;
  AGrid.Canvas.TextRect(ARectTextReq, ARectTextReq.Left + 1,
    ARectTextReq.Top + 1, NumToStr(AReqHrs));

  // Label Avail
  ARectLabelAvail.Left := Rect.Left;
  ARectLabelAvail.Top := ARectTextReq.Bottom + 1;
  ARectLabelAvail.Bottom := Rect.Top + AUpperTextHeight;
  ARectLabelAvail.Right := ARectLabelAvail.Left + ALeftColumnWidth - 1;
  // pm_rscstr.cTXT0000283 = 'Avail
  AGrid.Canvas.TextRect(ARectLabelAvail, ARectLabelAvail.Left + 1,
    ARectLabelAvail.Top + 1, pm_rscstr.cTXT0000283 + ' ');

  // Text Avail
  ARectTextAvail.Top := ARectLabelAvail.Top;
  ARectTextAvail.Left := ARectLabelAvail.Right + 2;
  ARectTextAvail.Bottom := ARectLabelAvail.Bottom;
  ARectTextAvail.Right := Rect.Right - 1;
  AGrid.Canvas.TextRect(ARectTextAvail, ARectTextAvail.Left + 1,
    ARectTextAvail.Top + 1, NumToStr(AAvailHrs));

  // vertical separator line
  AGrid.Canvas.Pen.Color := clSilver;
  AGrid.Canvas.MoveTo(ARectLabelAvail.Left + ALeftColumnWidth, Rect.Top);
  AGrid.Canvas.LineTo(ARectLabelAvail.Left + ALeftColumnWidth,
    Rect.Top + AUpperTextHeight + 2);

  // horizontal separator line
  AGrid.Canvas.Pen.Color := clSilver;
  AGrid.Canvas.MoveTo(Rect.Left, Rect.Top + AUpperTextHeight + 2);
  AGrid.Canvas.LineTo(Rect.Right, Rect.Top + AUpperTextHeight + 2);

  // Text Percent
  ARectProgressText.Top := Rect.Top + AUpperTextHeight + 5;
  ARectProgressText.Left := Rect.Left;
  ARectProgressText.Bottom := Rect.Bottom - 3;
  ARectProgressText.Right := ARectProgressText.Left + ALeftColumnWidth;
  AGrid.Canvas.TextRect(ARectProgressText, ARectProgressText.Left + 1,
    ARectProgressText.Top + 1, Format('%.0f%% ', [AProgress]));

  // progress bar background
  ARectBar.Left := Rect.Left + ALeftColumnWidth + 2;
  ARectBar.Top := Rect.Top + AUpperTextHeight + 6;
  ARectBar.Right := Rect.Right - 3;
  ARectBar.Bottom := Rect.Bottom - 4;
  AGrid.Canvas.Brush.Color := cl3DLight;
  AGrid.Canvas.FillRect(ARectBar);    }
  CopyRect(ARectProgress, ARectBar);
  InflateRect(ARectProgress, - 1, - 1);

{  ARectProgress.Left := Rect.Left + ALeftColumnWidth + 2;
  // ARectProgressText.Right + 3;
  ARectProgress.Top := Rect.Top + AUpperTextHeight + 6;
  ARectProgress.Right := Rect.Right - 3;
  ARectProgress.Bottom := Rect.Bottom - 3;
  AGrid.Canvas.Brush.Color := cl3DLight;
  AGrid.Canvas.FillRect(ARectProgress);
}
  // calculate the width of the progress bar
  ABarWidth := Trunc((ARectProgress.Right - ARectProgress.Left + 1) / 100 *
    AProgress);
  if ABarWidth = 0 then
    ARectProgress.Right := ARectProgress.Left // + 1
  else if ARectProgress.Left + ABarWidth > ARectProgress.Right then
    // do nothing - keep current ARectProgress.Right
  else
    ARectProgress.Right := ARectProgress.Left + ABarWidth;

{  // progress bar color
  if AProgress = 0 then
    AGrid.Canvas.Brush.Color := clBlack

  else if AProgress <= FNormalThreshold then
    AGrid.Canvas.Brush.Color := clGreen

  else if AProgress <= FBookedThreshold then
    AGrid.Canvas.Brush.Color := clYellow

  else
    AGrid.Canvas.Brush.Color := clRed;
}
  // progress bar color
  if AProgress = 0 then
    begin
      ABarColor := clBlack;
      ABarGradientLightColor := clBlack;
    end
  else if AReqHrs < AAvailHrs then
    begin
      // Green
      ABarColor := shpAvailable.Brush.Color;
      ABarGradientLightColor := 40704;
    end
  else if AReqHrs = AAvailHrs then
    begin
      // Yellow
      ABarColor := 63993;
      ABarGradientLightColor := 7995391;
    end
  else
    begin
      // Red
      ABarColor := clRed;
      ABarGradientLightColor := 2960895;
    end;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain Canvas
  // Color the progress bar
  AGrid.Canvas.Brush.Color := ABarColor;
  // AGrid.Canvas.FillRect(ARectProgress);
  IQMS.Common.Graphics.DrawGradient(AGrid.Canvas, ARectProgress,
    [ABarGradientLightColor, ABarColor]);

  // Frame the entire bar for clarity
  AGrid.Canvas.Brush.Color := clGray;
  AGrid.Canvas.FrameRect(ARectBar);   }
end;

procedure TFrmPMCapacity.DrawMfgCellDetails(AGrid: TIQUniGridControl; Rect: TRect;
  AMfgCell, AMfgType, AMfgCell_Descrip: string);
var
  ARectCenterType: TRect;
  ARectMfgType: TRect;
  ARectMfgCell: TRect;
begin
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain Canvas
  // Change font style
  AGrid.Canvas.Font.Style := AGrid.Canvas.Font.Style + [fsBold];

  // Mfgcell
  ARectCenterType.TopLeft := Rect.TopLeft;
  ARectCenterType.Right := Rect.Right;
  ARectCenterType.Bottom := ARectCenterType.Top +
    (Rect.Bottom - Rect.Top) div 3;
  AGrid.Canvas.TextRect(ARectCenterType, ARectCenterType.Left + 1,
    ARectCenterType.Top + 1, AMfgCell);

  // Change font color and style
  AGrid.Canvas.Font.Color := clGray;
  AGrid.Canvas.Font.Style := AGrid.Canvas.Font.Style - [fsBold];

  // MfgType
  ARectMfgType.Top := ARectCenterType.Bottom + 1;
  ARectMfgType.Left := Rect.Left;
  ARectMfgType.Right := Rect.Right;
  ARectMfgType.Bottom := Rect.Bottom - (Rect.Bottom - Rect.Top) div 3;
  AGrid.Canvas.TextRect(ARectMfgType, ARectMfgType.Left + 1,
    ARectMfgType.Top + 1, AMfgType);

  // MfgCell_Descrip
  ARectMfgCell.Top := ARectMfgType.Bottom + 1;
  ARectMfgCell.Left := Rect.Left;
  ARectMfgCell.Right := Rect.Right;
  ARectMfgCell.Bottom := Rect.Bottom;
  AGrid.Canvas.TextRect(ARectMfgCell, ARectMfgCell.Left + 1,
    ARectMfgCell.Top + 1, AMfgCell_Descrip);   }
end;

procedure TFrmPMCapacity.QryMonthlyBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'START_DATE', GetStartDate());
end;

procedure TFrmPMCapacity.QryMonthlyUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  AAction := eaApplied;
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmPMCapacity.wwDBGridPlanCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then
    EXIT;

  if (Field = ActiveDataSet.FieldByName('PAST_DUE')) and (Field.asFloat > 0)
  then
    AFont.Color := clRed;

  if Field = ActiveDataSet.FieldByName('MFGCELL') then
    ABrush.Color := clInfoBk;
end;   }

procedure TFrmPMCapacity.AbortOnInsert(DataSet: TDataSet);
begin
  ABORT;
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmPMCapacity.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
    begin
      ApplyCriteria;
      ABORT;
    end;
end;  }

procedure TFrmPMCapacity.RefreshActiveDataSet; // obsolete
var
  ACntrType, AMfgType: string;
  AMfgCell_ID: Real;
begin
  AMfgType := ActiveDataSet.FieldByName('MFGTYPE').asString;
  AMfgCell_ID := ActiveDataSet.FieldByName('MFGCELL_ID').asFloat;
  Reopen(ActiveDataSet);
  if AMfgCell_ID > 0 then
    ActiveDataSet.Locate('MFGTYPE;MFGCELL_ID',
      VarArrayOf([AMfgType, AMfgCell_ID]), [])
  else if AMfgType > '' then
    ActiveDataSet.Locate('MFGTYPE', VarArrayOf([AMfgType]), []);
  UpdateGridPeriodsTitles;
end;

procedure TFrmPMCapacity.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPMCapacity.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmPMCapacity.UpdateGridPeriodsTitles;
var
  AStart_Date: TDateTime;

  function GetColumnTitle(ADate1, ADate2: TDateTime): string;
  begin
    Result := Format(pm_rscstr.cTXT0000284 { 'From %s~Through %s' } ,
      [DateToStr(ADate1), DateToStr(ADate2)]);
  end;

begin
  AStart_Date := GetStartDate();
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain ColumnByName
  case GetViewType of
    cwMonthly:
      begin
        wwDBGridPlan.ColumnByName('Period1').DisplayLabel :=
          GetColumnTitle(AStart_Date, AStart_Date + 28 - 1);
        wwDBGridPlan.ColumnByName('Period2').DisplayLabel :=
          GetColumnTitle(AStart_Date + 28, AStart_Date + 56 - 1);
        wwDBGridPlan.ColumnByName('Period3').DisplayLabel :=
          GetColumnTitle(AStart_Date + 56, AStart_Date + 84 - 1);
        wwDBGridPlan.ColumnByName('Period4').DisplayLabel :=
          GetColumnTitle(AStart_Date + 84, AStart_Date + 112 - 1);
        wwDBGridPlan.ColumnByName('Period5').DisplayLabel :=
          GetColumnTitle(AStart_Date + 112, AStart_Date + 140 - 1);
      end;
    cwWeekly:
      begin
        wwDBGridPlan.ColumnByName('Period1').DisplayLabel :=
          GetColumnTitle(AStart_Date, AStart_Date + 7 - 1);
        wwDBGridPlan.ColumnByName('Period2').DisplayLabel :=
          GetColumnTitle(AStart_Date + 7, AStart_Date + 14 - 1);
        wwDBGridPlan.ColumnByName('Period3').DisplayLabel :=
          GetColumnTitle(AStart_Date + 14, AStart_Date + 21 - 1);
        wwDBGridPlan.ColumnByName('Period4').DisplayLabel :=
          GetColumnTitle(AStart_Date + 21, AStart_Date + 28 - 1);
        wwDBGridPlan.ColumnByName('Period5').DisplayLabel :=
          GetColumnTitle(AStart_Date + 28, AStart_Date + 35 - 1);
      end;
    cwDaily:
      begin
        wwDBGridPlan.ColumnByName('Period1').DisplayLabel :=
          GetColumnTitle(AStart_Date, AStart_Date);
        wwDBGridPlan.ColumnByName('Period2').DisplayLabel :=
          GetColumnTitle(AStart_Date + 1, AStart_Date + 1);
        wwDBGridPlan.ColumnByName('Period3').DisplayLabel :=
          GetColumnTitle(AStart_Date + 2, AStart_Date + 2);
        wwDBGridPlan.ColumnByName('Period4').DisplayLabel :=
          GetColumnTitle(AStart_Date + 3, AStart_Date + 3);
        wwDBGridPlan.ColumnByName('Period5').DisplayLabel :=
          GetColumnTitle(AStart_Date + 4, AStart_Date + 4);
      end;
  end;  }
end;

procedure TFrmPMCapacity.FormShow(Sender: TObject);
begin
  UpdateGridPeriodsTitles;
end;

function TFrmPMCapacity.ActiveDataSet: TFDQuery;
begin
  case GetViewType of
    cwMonthly:
      Result := QryMonthly;
    cwWeekly:
      Result := QryWeekly;
    cwDaily:
      Result := QryDaily;
  end;
end;

function TFrmPMCapacity.GetStartDate: TDateTime;
var
  ADate: TDateTime;
begin
  // for Monthly and Weekly views return beginning of the week. For Daily - the actual "Begin Date" they selected
  ADate := wwDBDateTimePickerStartDate.Datetime;
  if GetViewType <> cwDaily then
    Result := SelectValueFmtAsFloat
      ('select iqcalendar.SundayOf(to_date(''%s'', ''mm/dd/yyyy'')) from dual',
      [FormatDateTime('mm/dd/yyyy', ADate)])
  else
    Result := ADate;
end;

function TFrmPMCapacity.GetViewType: TPMCapacityView;
begin
  case wwDBComboBoxViewType.ItemIndex of
    0:
      Result := cwMonthly;
    1:
      Result := cwWeekly;
    2:
      Result := cwDaily;
  end;
end;

procedure TFrmPMCapacity.sbtnApplyClick(Sender: TObject);
var
  hMesg: TPanelMesg;
begin
  if not CanAccess then
    EXIT;

  // Validate
  // 'Please specify a Start Date.'
  IQAssert(wwDBDateTimePickerStartDate.Datetime > 0, pm_rscstr.cTXT0000285);
  // 'Please select a View type.'
  IQAssert(wwDBComboBoxViewType.ItemIndex > - 1, pm_rscstr.cTXT0000286);

  hMesg := hPleaseWait('');
  try
    ApplyCriteria;
  finally
    hMesg.Free;
  end;
end;

procedure TFrmPMCapacity.ApplyCriteria;
var
  AIsOpen: Boolean;
  AMfgType: string;
  AMfgCell_ID: Real;
begin
  AIsOpen := ActiveDataSet.Active;

  if AIsOpen then
    begin
      AMfgType := ActiveDataSet.FieldByName('MFGTYPE').asString;
      AMfgCell_ID := ActiveDataSet.FieldByName('MFGCELL_ID').asFloat;
    end;

  Reopen(ActiveDataSet);
  SrcCapacityPlan.DataSet := ActiveDataSet;
  UpdateGridPeriodsTitles;

  if AIsOpen and not (ActiveDataSet.Eof and ActiveDataSet.Bof) then
    begin
      if AMfgCell_ID > 0 then
        ActiveDataSet.Locate('MFGTYPE;MFGCELL_ID',
          VarArrayOf([AMfgType, AMfgCell_ID]), [])
      else if AMfgType > '' then
        ActiveDataSet.Locate('MFGTYPE', VarArrayOf([AMfgType]), []);
    end;
end;

procedure TFrmPMCapacity.sbtnBackClick(Sender: TObject);
begin
  if not CanAccess then
    EXIT;

  MovePeriod( - 1 { move 1 period back } );
end;

procedure TFrmPMCapacity.sbtnForwardClick(Sender: TObject);
begin
  if not CanAccess then
    EXIT;

  MovePeriod( + 1 { move 1 period forward } );
end;

procedure TFrmPMCapacity.MovePeriod(ADirection: Integer);
var
  ADelta: Real;
begin
  case GetViewType of
    cwMonthly:
      ADelta := 28 * ADirection;
    cwWeekly:
      ADelta := 7 * ADirection;
    cwDaily:
      ADelta := 1 * ADirection;
  end;

  wwDBDateTimePickerStartDate.Datetime := wwDBDateTimePickerStartDate.Datetime + ADelta;

  ApplyCriteria;
end;

procedure TFrmPMCapacity.bbtnSearchClick(Sender: TObject);
begin
  if not CanAccess then
    EXIT;

  with PkMfgCell do
    if Execute then
      begin
        if GetValue('ID') > 0 then
          ActiveDataSet.Locate('MFGTYPE;MFGCELL_ID',
            VarArrayOf([GetValue('MFGTYPE'), GetValue('ID')]), [])
        else if GetValue('MFGTYPE') > '' then
          ActiveDataSet.Locate('MFGTYPE', VarArrayOf([GetValue('MFGTYPE')]), [])
      end
end;

procedure TFrmPMCapacity.wwDBComboBoxViewTypeChange(Sender: TObject);
begin
  QryMonthly.Close;
  QryWeekly.Close;
  QryDaily.Close;
end;

procedure TFrmPMCapacity.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [self, wwDBGridPlan, pnlCriteria]);

  // init form
  { TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain keyoptions
  wwDBGridPlan.KeyOptions := [];  }
  wwDBDateTimePickerStartDate.Datetime := Date;
  wwDBComboBoxViewType.ItemIndex := 1; // Weekly

  LoadThresholds;

  if not CanAccess then
    begin
      PostMessage(Handle, wm_Command, Exit1.Command, 0); { Call "Exit" }
      EXIT;
    end;

  // launch query
  sbtnApplyClick(nil);
end;

procedure TFrmPMCapacity.UpdateCapacitySchedule1Click(Sender: TObject);
var
  hMesg: TPanelMesg;
begin
  { 'This option updates MRO Capacity Schedule. Are you sure you want to continue?' }
  if not IQConfirmYN(pm_rscstr.cTXT0000287) then
    EXIT;

  hMesg := hPleaseWait('');
  try
    PrepareForCapacityUpdate;
    ExecuteCommand('begin iqpm_capacity.do_main; end;');
  finally
    hMesg.Free;
    FinilizeCapacityUpdate;
  end;

  sbtnApplyClick(nil);
end;

procedure TFrmPMCapacity.PrepareForCapacityUpdate;
var
  AUserName: string;
begin
(* TODO -oGPatil -cWebConvert : Dependency on db_dm.pas  File
  with DB_DataModule do
    begin
      if AcquireIQLock(FLockHandle, IQMS_PM_CAPACITY, IQLOCK_EXCLUSIVE) then
        EXIT;

      AUserName :=
        Trim(SelectValueFmtAsString
        ('select user_name from iqsemaphore where lock_name = ''%s''',
        [IQMS.Common.Locks.IQMS_PM_CAPACITY]));
      if AUserName > '' then
        { 'Failed to acquire exclusive lock. Possible cause:  someone else (%s)
          is using MRO Capacity Schedule module. '#13'Please try again later.' }
        raise Exception.CreateFmt(pm_rscstr.cTXT0000288, [AUserName])
      else
        { 'Failed to acquire exclusive lock. Possible cause:  someone else
          is using MRO Capacity Schedule module. '#13'Please try again later.' }
        raise Exception.Create(pm_rscstr.cTXT0000289);
    end;  *)
end;

procedure TFrmPMCapacity.FinilizeCapacityUpdate;
var
  S: string;
begin
{ TODO -oGPatil -cWebConvert : Dependency on db_dm.pas  File
  with DB_DataModule do
    S := IQUnLock(FLockHandle);      }
  if S > '' then
    { 'Cannot to release exclusive lock. Terminate to allow other users to run
      MRO Capacity Schedule module' }
    IQWarning(S + #13 + pm_rscstr.cTXT0000290);
end;

procedure TFrmPMCapacity.sbtnAddWorkorderClick(Sender: TObject);
var
  AList: TStringList;
  AStartDate: TDateTime;
  I: Integer;
  hMesg: TPanelMesg;
begin
  AList := TStringList.Create;
  try
    if not TFrmPMAddSched.DoShowModal(AList, AStartDate) then
    // pm_add_sched.pas
      EXIT;

    hMesg := hPleaseWait('');
    try
      for I := 0 to AList.Count - 1 do
        begin
          { 'Processing Work Order # %s ...' }
          hMesg.Mesg := Format(pm_rscstr.cTXT0000291, [AList[I]]);
          // update the start date
          ExecuteCommandFmt
            ('update pmwo set start_date = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'') where id = %s',
            [FormatDateTime('mm/dd/yyyy hh:nn:ss', AStartDate), AList[I]]);
          // populate pm_day_hrs
          ExecuteCommandFmt
            ('begin iqpm_capacity.add_wo_to_capacity_sched( %s ); end;',
            [AList[I]]);
        end;

      PostMessage(self.Handle, iq_RefreshDataSets, 0, 0);
    finally
      hMesg.Free;
    end;
  finally
    AList.Free;
  end;
end;

function TFrmPMCapacity.GetSelectedPeriod: Integer;
begin
  Result := - 1;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain GetActiveField and ColumnByName
  if not Assigned(wwDBGridPlan.GetActiveField()) then
    EXIT;

  if CompareText(wwDBGridPlan.GetActiveField.FieldName, 'PAST_DUE') = 0 then
    Result := 0
  else if CompareText(wwDBGridPlan.GetActiveField.FieldName, 'Period1') = 0 then
    Result := 1
  else if CompareText(wwDBGridPlan.GetActiveField.FieldName, 'Period2') = 0 then
    Result := 2
  else if CompareText(wwDBGridPlan.GetActiveField.FieldName, 'Period3') = 0 then
    Result := 3
  else if CompareText(wwDBGridPlan.GetActiveField.FieldName, 'Period4') = 0 then
    Result := 4
  else if CompareText(wwDBGridPlan.GetActiveField.FieldName, 'Period5') = 0 then
    Result := 5;    }
end;

procedure TFrmPMCapacity.ViewWorkorders1Click(Sender: TObject);
var
  APeriod: Integer;
  ATitle: string;
begin
  APeriod := GetSelectedPeriod;
  if APeriod = - 1 then
    begin
      // The period is undefined.  Please click in the grid to select a period.
      IQWarning(pm_rscstr.cTXT0000292);
      EXIT;
    end;

{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain GetActiveField and ColumnByName
  if Assigned(wwDBGridPlan.GetActiveField()) then
    ATitle := IQMS.Common.StringUtils.StrTran(
      wwDBGridPlan.ColumnByName(
      wwDBGridPlan.GetActiveField.FieldName).DisplayLabel, '~', '-');  }

  TFrmPMPeriodWorkorders.DoShow(ActiveDataSet.FieldByName('mfgcell_id').asFloat, GetViewType, GetStartDate,
    APeriod, ATitle); // pm_period_wo.pas
end;

procedure TFrmPMCapacity.IQRefreshDataSets(var Msg: TMessage);
begin
  ApplyCriteria;
end;

procedure TFrmPMCapacity.PMCapacityParameters1Click(Sender: TObject);
begin
  if TFrmPM_Capacity_Params.DoShowModal then // pm_capacity_params.pas
    begin
      LoadThresholds;
      ApplyCriteria;
    end;
end;

procedure TFrmPMCapacity.LoadThresholds;
begin
  FNormalThreshold := capshare.GetCapacityWhiteboardThreshold('PM_AVAILABLE');
  FBookedThreshold := capshare.GetCapacityWhiteboardThreshold('PM_BOOKED');
end;

procedure TFrmPMCapacity.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(1021167)
end;

end.
