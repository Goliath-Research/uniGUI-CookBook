unit fore_lab_cap_whiteboard;

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
  Grids,
  DBGrids,
  ExtCtrls,
  DB,
  Wwdbigrd,
  Wwdbgrid,
  DBCtrls,
  Menus,
  IQMS.WebVcl.About,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  StdCtrls,
  wwDataInspector,
  Buttons,
  IQMS.WebVcl.Hpick,
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
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniMainMenu, uniDateTimePicker, uniDBDateTimePicker, IQUniGrid,
  uniGUIFrame;

type
  TCapacityWhiteboardView = (cwMonthly, cwWeekly, cwDaily );

  TFrmForeLabCapWhiteboard = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGridPlan: TIQUniGridControl;
    SrcCapacityPlan: TDataSource;
    QryMonthly: TFDQuery;
    QryMonthlyMFGTYPE: TStringField;
    QryMonthlyMFGCELL: TStringField;
    QryMonthlyHRS_REQ_1: TFMTBCDField;
    QryMonthlyHRS_AVAIL_1: TFMTBCDField;
    QryMonthlyHRS_REQ_2: TFMTBCDField;
    QryMonthlyHRS_AVAIL_2: TFMTBCDField;
    QryMonthlyHRS_REQ_3: TFMTBCDField;
    QryMonthlyHRS_AVAIL_3: TFMTBCDField;
    QryMonthlyHRS_REQ_4: TFMTBCDField;
    QryMonthlyHRS_AVAIL_4: TFMTBCDField;
    QryMonthlyHRS_REQ_FUTURE: TFMTBCDField;
    QryMonthlyPeriod1: TFloatField;
    QryMonthlyPeriod2: TFloatField;
    QryMonthlyPeriod3: TFloatField;
    QryMonthlyPeriod4: TFloatField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryMonthlyHRS_REQ_5: TFMTBCDField;
    QryMonthlyHRS_AVAIL_5: TFMTBCDField;
    QryMonthlyPeriod5: TFloatField;
    QryWeekly: TFDQuery;
    pnlCriteria: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    sbtnApply: TUniSpeedButton;
    Label1: TUniLabel;
    wwDBDateTimePickerStartDate: TUniDBDateTimePicker;
    wwDBComboBoxViewType: TUniDBComboBox;
    Label2: TUniLabel;
    QryDaily: TFDQuery;
    sbtnBack: TUniSpeedButton;
    sbtnForward: TUniSpeedButton;
    Panel3: TUniPanel;
    Shape1: TUniPanel;
    Shape4: TUniPanel;
    Shape3: TUniPanel;
    bbtnSearch: TUniSpeedButton;
    Bevel1: TUniPanel;
    PkType: TIQWebHPick;
    PkTypeMFGTYPE: TStringField;
    PkTypeMFGCELL: TStringField;
    PkTypeMFGCELL_ID: TBCDField;
    QryMonthlyEMP_LEVEL_CODE: TStringField;
    PkTypeEMP_LEVEL_CODE: TStringField;
    PkTypeEMP_LEVEL_ID: TBCDField;
    QryMonthlySETUP_HRS_REQ_1: TFMTBCDField;
    QryMonthlySETUP_HRS_REQ_2: TFMTBCDField;
    QryMonthlySETUP_HRS_REQ_3: TFMTBCDField;
    QryMonthlySETUP_HRS_REQ_4: TFMTBCDField;
    QryMonthlySETUP_HRS_REQ_5: TFMTBCDField;
    QryMonthlySETUP_HRS_REQ_FUTURE: TFMTBCDField;
    Contents1: TUniMenuItem;
    QryDailyMFGTYPE: TStringField;
    QryDailyMFGCELL: TStringField;
    QryDailyMFGCELL_ID: TBCDField;
    QryDailyEMP_LEVEL_ID: TBCDField;
    QryDailyEMP_LEVEL_CODE: TStringField;
    QryDailyHRS_REQ_1: TFMTBCDField;
    QryDailyHRS_AVAIL_1: TFMTBCDField;
    QryDailySETUP_HRS_REQ_1: TFMTBCDField;
    QryDailyHRS_REQ_2: TFMTBCDField;
    QryDailyHRS_AVAIL_2: TFMTBCDField;
    QryDailySETUP_HRS_REQ_2: TFMTBCDField;
    QryDailyHRS_REQ_3: TFMTBCDField;
    QryDailyHRS_AVAIL_3: TFMTBCDField;
    QryDailySETUP_HRS_REQ_3: TFMTBCDField;
    QryDailyHRS_REQ_4: TFMTBCDField;
    QryDailyHRS_AVAIL_4: TFMTBCDField;
    QryDailySETUP_HRS_REQ_4: TFMTBCDField;
    QryDailyHRS_REQ_5: TFMTBCDField;
    QryDailyHRS_AVAIL_5: TFMTBCDField;
    QryDailySETUP_HRS_REQ_5: TFMTBCDField;
    QryDailyHRS_REQ_FUTURE: TFMTBCDField;
    QryDailySETUP_HRS_REQ_FUTURE: TFMTBCDField;
    QryWeeklyMFGTYPE: TStringField;
    QryWeeklyMFGCELL: TStringField;
    QryWeeklyMFGCELL_ID: TBCDField;
    QryWeeklyEMP_LEVEL_ID: TBCDField;
    QryWeeklyEMP_LEVEL_CODE: TStringField;
    QryWeeklyHRS_REQ_1: TFMTBCDField;
    QryWeeklyHRS_AVAIL_1: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_1: TFMTBCDField;
    QryWeeklyHRS_REQ_2: TFMTBCDField;
    QryWeeklyHRS_AVAIL_2: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_2: TFMTBCDField;
    QryWeeklyHRS_REQ_3: TFMTBCDField;
    QryWeeklyHRS_AVAIL_3: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_3: TFMTBCDField;
    QryWeeklyHRS_REQ_4: TFMTBCDField;
    QryWeeklyHRS_AVAIL_4: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_4: TFMTBCDField;
    QryWeeklyHRS_REQ_5: TFMTBCDField;
    QryWeeklyHRS_AVAIL_5: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_5: TFMTBCDField;
    QryWeeklyHRS_REQ_FUTURE: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_FUTURE: TFMTBCDField;
    QryWeeklyPeriod1: TFloatField;
    QryWeeklyPeriod2: TFloatField;
    QryWeeklyPeriod3: TFloatField;
    QryWeeklyPeriod4: TFloatField;
    QryWeeklyPeriod5: TFloatField;
    QryDailyPeriod1: TFloatField;
    QryDailyPeriod2: TFloatField;
    QryDailyPeriod3: TFloatField;
    QryDailyPeriod4: TFloatField;
    QryDailyPeriod5: TFloatField;
    QryMonthlyMFGCELL_ID: TBCDField;
    QryMonthlyEMP_LEVEL_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBGridPlanDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure QryMonthlyBeforeOpen(DataSet: TDataSet);
    procedure wwDBGridPlanCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure AbortOnInsert(DataSet: TDataSet);
    procedure QryMonthlyUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnApplyClick(Sender: TObject);
    procedure sbtnBackClick(Sender: TObject);
    procedure sbtnForwardClick(Sender: TObject);
    procedure bbtnSearchClick(Sender: TObject);
    procedure wwDBComboBoxViewTypeChange(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FNormalThreshold: Real;
    FBookedThreshold: Real;
    FFore_Head_ID: Real;
    procedure DrawPeriodInGrid( AGrid: TIQUniGridControl; Rect: TRect; AReqHrs, AAvailHrs, ASetupHrs: Real );
    procedure DrawEmployeeTypeDetails(AGrid: TIQUniGridControl; Rect: TRect;  AEmpLevel, AMfgType, AMfgCell: string);
    procedure UpdateGridPeriodsTitles;
    function ActiveDataSet: TFDQuery;
    function GetStartDate: TDateTime;
    function GetViewType: TCapacityWhiteboardView;
    procedure MovePeriod(ADirection: Integer);
    procedure RefreshActiveDataSet;
    procedure ApplyCriteria;
  public
    { Public declarations }
    property Fore_Head_ID: Real read FFore_Head_ID write FFore_Head_ID;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  Types,
  IQMS.Common.Numbers,
  IQMS.Common.Miscellaneous,
  IQMS.Common.PanelMsg,
  CapShare,
  IQMS.Common.HelpHook,
  IQMS.Common.Graphics;

const
     cProgressBarHeight = 24;


{ TFrmCapWhiteboard }

procedure TFrmForeLabCapWhiteboard.UniFormCreate(Sender: TObject);
begin


  IQRegFormRead(self, [ self, wwDBGridPlan, pnlCriteria ]);

  // init form
  { TODO -oSanketG -cWebConvert : Need to find alternative property for KeyOptions in TIQUniGridControl }
  //wwDBGridPlan.KeyOptions:= [];
  wwDBDateTimePickerStartDate.DateTime := Date;
  wwDBComboBoxViewType.ItemIndex:= 0; // monthly

  // thresholds
  FNormalThreshold    := CapShare.GetCapacityWhiteboardThreshold( 'AVAILABLE' );
  FBookedThreshold    := CapShare.GetCapacityWhiteboardThreshold( 'BOOKED' );

  // launch query
  sbtnApplyClick(nil);
end;

procedure TFrmForeLabCapWhiteboard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGridPlan, pnlCriteria ]);
end;


procedure TFrmForeLabCapWhiteboard.wwDBGridPlanDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if (Field.FieldName = 'Period1') then
     DrawPeriodInGrid( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_1').asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_1').asFloat, ActiveDataSet.FieldByName('SETUP_HRS_REQ_1').asFloat )

  else if (Field.FieldName = 'Period2') then
     DrawPeriodInGrid( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_2').asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_2').asFloat, ActiveDataSet.FieldByName('SETUP_HRS_REQ_2').asFloat )

  else if (Field.FieldName = 'Period3') then
     DrawPeriodInGrid( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_3').asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_3').asFloat, ActiveDataSet.FieldByName('SETUP_HRS_REQ_3').asFloat )

  else if (Field.FieldName = 'Period4') then
     DrawPeriodInGrid( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_4').asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_4').asFloat, ActiveDataSet.FieldByName('SETUP_HRS_REQ_4').asFloat )

  else if (Field.FieldName = 'Period5') then
     DrawPeriodInGrid( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_5').asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_5').asFloat, ActiveDataSet.FieldByName('SETUP_HRS_REQ_5').asFloat )

  else if Field.FieldName = 'EMP_LEVEL_CODE' then
     DrawEmployeeTypeDetails( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('EMP_LEVEL_CODE').asString, ActiveDataSet.FieldByName('MFGTYPE').asString,  ActiveDataSet.FieldByName('MFGCELL').asString )

  else
     { TODO -oSanketG -cWebConvert : Need to find alternative method for DefaultDrawDataCell in TIQUniGridControl }
     //wwDBGridPlan.DefaultDrawDataCell( Rect, Field, State );
end;


procedure TFrmForeLabCapWhiteboard.DrawPeriodInGrid( AGrid: TIQUniGridControl; Rect: TRect; AReqHrs, AAvailHrs, ASetupHrs: Real );
var
  ARectLabelReq    : TRect;
  ARectLabelAvail  : TRect;
  ARectLabelSetup  : TRect;

  ARectTextReq     : TRect;
  ARectTextAvail   : TRect;
  ARectTextSetup   : TRect;

  ARectBar         : TRect;
  ARectProgress    : TRect;
  ARectProgressText: TRect;

  ABarWidth        : Integer;
  AProgress        : Real;

  AUpperTextHeight : Integer;
  ALeftColumnWidth : Integer;

  ABarColor: TColor;
  ABarGradientLightColor: TColor;

  function NumToStr( AValue: Real ): string;
  begin
    if AValue = 0 then
       Result:= ''
    else
       Result:= Format('%.2f', [ AValue ]);
  end;

begin
  if AAvailHrs = 0 then
     AProgress:= 0
  else
     AProgress:= IQRoundEx(AReqHrs / AAvailHrs * 100);

  // prepare
  AUpperTextHeight:=  (Rect.Bottom - Rect.Top) - cProgressBarHeight; // div 6 * 4;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  //ALeftColumnWidth:=  AGrid.Canvas.TextWidth('99.99% ') + 4;

  // Label Req
  ARectLabelReq.TopLeft:= Rect.TopLeft;
  ARectLabelReq.Bottom := ARectLabelReq.Top + AUpperTextHeight div 3;
  ARectLabelReq.Right  := ARectLabelReq.Left + ALeftColumnWidth - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectLabelReq, ARectLabelReq.Left + 1, ARectLabelReq.Top + 1, 'Req ' );

  // Text Req
  ARectTextReq.Top     := ARectLabelReq.Top;
  ARectTextReq.Left    := ARectLabelReq.Right + 2;
  ARectTextReq.Bottom  := ARectLabelReq.Bottom;
  ARectTextReq.Right   := Rect.Right - 1;

  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  {if AReqHrs > AAvailHrs then
     AGrid.Canvas.Font.Color:= clRed;
  AGrid.Canvas.TextRect( ARectTextReq, ARectTextReq.Left + 1, ARectTextReq.Top + 1, NumToStr( AReqHrs ));
  AGrid.Canvas.Font.Color:= clBlack;}

  // Label Avail
  ARectLabelAvail.Left   := Rect.Left;
  ARectLabelAvail.Top    := ARectTextReq.Bottom + 1;
  ARectLabelAvail.Bottom := Rect.Top + AUpperTextHeight div 3 * 2;
  ARectLabelAvail.Right  := ARectLabelAvail.Left + ALeftColumnWidth - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectLabelAvail, ARectLabelAvail.Left + 1, ARectLabelAvail.Top + 1, 'Avail ' );

  // Text Avail
  ARectTextAvail.Top     := ARectLabelAvail.Top;
  ARectTextAvail.Left    := ARectLabelAvail.Right + 2;
  ARectTextAvail.Bottom  := ARectLabelAvail.Bottom;
  ARectTextAvail.Right   := Rect.Right - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectTextAvail, ARectTextAvail.Left + 1, ARectTextAvail.Top + 1, NumToStr( AAvailHrs ));

  // Label SetupHrs
  ARectLabelSetup.Left   := Rect.Left;
  ARectLabelSetup.Top    := ARectLabelAvail.Bottom + 1;
  ARectLabelSetup.Bottom := Rect.Top + AUpperTextHeight;
  ARectLabelSetup.Right  := ARectLabelSetup.Left + ALeftColumnWidth - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectLabelSetup, ARectLabelSetup.Left + 1, ARectLabelSetup.Top + 1, 'Setup ' );

  // Text SetupHrs
  ARectTextSetup.Top    := ARectLabelSetup.Top;
  ARectTextSetup.Left   := ARectLabelSetup.Right + 2;
  ARectTextSetup.Bottom := ARectLabelSetup.Bottom;
  ARectTextSetup.Right  := Rect.Right - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectTextSetup, ARectTextSetup.Left + 1, ARectTextSetup.Top + 1, NumToStr( ASetupHrs ));

  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  // vertical separator line
  {AGrid.Canvas.Pen.Color:= clSilver;
  AGrid.Canvas.MoveTo( ARectLabelSetup.Left + ALeftColumnWidth, Rect.Top );
  AGrid.Canvas.LineTo( ARectLabelSetup.Left + ALeftColumnWidth, Rect.Top + AUpperTextHeight + 2);

  // horizontal separator line
  AGrid.Canvas.Pen.Color:= clSilver;
  AGrid.Canvas.MoveTo( Rect.Left,  Rect.Top + AUpperTextHeight + 2);
  AGrid.Canvas.LineTo( Rect.Right, Rect.Top + AUpperTextHeight + 2);}

  // Text Percent
  ARectProgressText.Top   := Rect.Top + AUpperTextHeight + 5;
  ARectProgressText.Left  := Rect.Left;
  ARectProgressText.Bottom:= Rect.Bottom - 3;
  ARectProgressText.Right := ARectProgressText.Left + ALeftColumnWidth;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectProgressText, ARectProgressText.Left + 1, ARectProgressText.Top + 1, Format('%.0f%% ', [ AProgress ]));

  // progress bar background
  ARectBar.Left := Rect.Left + ALeftColumnWidth + 2;
  ARectBar.Top := Rect.Top + AUpperTextHeight + 6;
  ARectBar.Right := Rect.Right - 3;
  ARectBar.Bottom := Rect.Bottom - 4;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  {AGrid.Canvas.Brush.Color := cl3DLight;
  AGrid.Canvas.FillRect(ARectBar);}
  CopyRect(ARectProgress, ARectBar);
  InflateRect(ARectProgress, -1, -1);

  // calculate the width of the progress bar
  ABarWidth:= Trunc((ARectProgress.Right - ARectProgress.Left + 1) / 100 * AProgress);
  if ABarWidth = 0 then
     ARectProgress.Right:= ARectProgress.Left  // + 1
  else if ARectProgress.Left + ABarWidth > ARectProgress.Right then
     // do nothing - keep current ARectProgress.Right
  else
     ARectProgress.Right:= ARectProgress.Left + ABarWidth;

  // progress bar color
  if AProgress = 0 then
    begin
      ABarColor := clBlack;
      ABarGradientLightColor := clBlack;
    end

  else if AProgress <= FNormalThreshold then
    begin
      ABarColor := clGreen;
      ABarGradientLightColor := 40704;
    end

  else if AProgress <= FBookedThreshold then
    begin
      ABarColor := clYellow;
      ABarGradientLightColor := 7995391;
    end

  else
    begin
      ABarColor := clRed;
      ABarGradientLightColor := 2960895;
    end;

  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  {// Color the progress bar
  AGrid.Canvas.Brush.Color := ABarColor;
  //AGrid.Canvas.FillRect(ARectProgress);
  IQMS.Common.Graphics.DrawGradient(AGrid.Canvas, ARectProgress, [ABarGradientLightColor, ABarColor]);

  // Frame the entire bar for clarity
  AGrid.Canvas.Brush.Color := clGray;
  AGrid.Canvas.FrameRect(ARectBar);}
end;

procedure TFrmForeLabCapWhiteboard.DrawEmployeeTypeDetails( AGrid: TIQUniGridControl; Rect: TRect;  AEmpLevel, AMfgType, AMfgCell: string );
var
  ARow_1_Rect: TRect;
  ARow_2_Rect: TRect;
  ARow_3_Rect: TRect;
begin
  // Change font style
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  //AGrid.Canvas.Font.Style:= AGrid.Canvas.Font.Style + [fsBold];

  // 1 row
  ARow_1_Rect.TopLeft:= Rect.TopLeft;
  ARow_1_Rect.Right  := Rect.Right;
  ARow_1_Rect.Bottom := ARow_1_Rect.Top + (Rect.Bottom - Rect.Top - cProgressBarHeight) div 3;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARow_1_Rect, ARow_1_Rect.Left + 1, ARow_1_Rect.Top + 1, AMfgType );

  // 2 row
  ARow_2_Rect.Top    := ARow_1_Rect.Bottom + 1;
  ARow_2_Rect.Left   := Rect.Left;
  ARow_2_Rect.Right  := Rect.Right;
  ARow_2_Rect.Bottom := ARow_2_Rect.Top + (Rect.Bottom - Rect.Top - cProgressBarHeight) div 3;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARow_2_Rect, ARow_2_Rect.Left + 1, ARow_2_Rect.Top + 1, AMfgCell);

  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl
  // Change font color and style
  AGrid.Canvas.Font.Style:= AGrid.Canvas.Font.Style - [fsBold];}

  // 3 row
  ARow_3_Rect.Top    := ARow_2_Rect.Bottom + 1;
  ARow_3_Rect.Left   := Rect.Left;
  ARow_3_Rect.Right  := Rect.Right;
  ARow_3_Rect.Bottom := Rect.Bottom;
  ARow_3_Rect.Bottom := ARow_3_Rect.Top + (Rect.Bottom - Rect.Top - cProgressBarHeight) div 3;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARow_3_Rect, ARow_3_Rect.Left + 1, ARow_3_Rect.Top + 1, AEmpLevel );
end;

procedure TFrmForeLabCapWhiteboard.QryMonthlyBeforeOpen(DataSet: TDataSet);
begin
//  with DataSet as TFDQuery do
//  begin
//    ParamByName('start_date').asDateTime:= GetStartDate();
//    ParamByName('fore_head_id').asFloat := FFore_Head_ID;
//  end;
  AssignQueryParamValue(DataSet, 'start_date'  , GetStartDate(), ftDate);
  AssignQueryParamValue(DataSet, 'fore_head_id', FFore_Head_ID, ftBCD);
end;

procedure TFrmForeLabCapWhiteboard.wwDBGridPlanCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field = ActiveDataSet.FieldByName('EMP_LEVEL_CODE') then
     ABrush.Color:= clInfoBk;
end;

procedure TFrmForeLabCapWhiteboard.AbortOnInsert(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmForeLabCapWhiteboard.QryMonthlyUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  AAction := eaApplied;
end;

procedure TFrmForeLabCapWhiteboard.CheckRefresh(Sender: TObject;  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    ApplyCriteria;
    ABORT;
  end;
end;

procedure TFrmForeLabCapWhiteboard.RefreshActiveDataSet; // obsolete
var
  AMfgType     : string;
  AMfgCell_ID  : Real;
  AEmp_Level_ID: Real;
begin
  AEmp_Level_ID:= ActiveDataSet.FieldByName('EMP_LEVEL_ID').asFloat;
  AMfgType   := ActiveDataSet.FieldByName('MFGTYPE').asString;
  AMfgCell_ID:= ActiveDataSet.FieldByName('MFGCELL_ID').AsFloat;
  Reopen( ActiveDataSet );
  if AMfgCell_ID > 0 then
     ActiveDataSet.Locate( 'EMP_LEVEL_ID;MFGTYPE;MFGCELL_ID', VarArrayOf([AEmp_Level_ID, AMfgType, AMfgCell_ID]), [])
  else
     ActiveDataSet.Locate( 'EMP_LEVEL_ID;MFGTYPE', VarArrayOf([AEmp_Level_ID, AMfgType]), []);
  UpdateGridPeriodsTitles;
end;

procedure TFrmForeLabCapWhiteboard.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmForeLabCapWhiteboard.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmForeLabCapWhiteboard.UpdateGridPeriodsTitles;
var
  AStart_Date: TDateTime;

  function GetColumnTitle( ADate1, ADate2: TDateTime ): string;
  begin
    Result:= Format('From %s~Thru %s', [ DateToStr( ADate1 ), DateToStr( ADate2 ) ]);
  end;

begin
  AStart_Date:= GetStartDate();

  case GetViewType of
    cwMonthly:
      begin
        { TODO -oSanketG -cWebConvert : Need to find alternative property for ColumnByName in TIQUniGridControl}
        {wwDBGridPlan.ColumnByName('Period1').DisplayLabel:= GetColumnTitle(AStart_Date,      AStart_Date +  28 - 1);
        wwDBGridPlan.ColumnByName('Period2').DisplayLabel:= GetColumnTitle(AStart_Date + 28, AStart_Date +  56 - 1);
        wwDBGridPlan.ColumnByName('Period3').DisplayLabel:= GetColumnTitle(AStart_Date + 56, AStart_Date +  84 - 1);
        wwDBGridPlan.ColumnByName('Period4').DisplayLabel:= GetColumnTitle(AStart_Date + 84, AStart_Date + 112 - 1);
        wwDBGridPlan.ColumnByName('Period5').DisplayLabel:= GetColumnTitle(AStart_Date + 112,AStart_Date + 140 - 1);}
      end;
    cwWeekly :
      begin
        { TODO -oSanketG -cWebConvert : Need to find alternative property for ColumnByName in TIQUniGridControl}
        {wwDBGridPlan.ColumnByName('Period1').DisplayLabel:= GetColumnTitle(AStart_Date,      AStart_Date +  7 - 1);
        wwDBGridPlan.ColumnByName('Period2').DisplayLabel:= GetColumnTitle(AStart_Date + 7,  AStart_Date + 14 - 1);
        wwDBGridPlan.ColumnByName('Period3').DisplayLabel:= GetColumnTitle(AStart_Date + 14, AStart_Date + 21 - 1);
        wwDBGridPlan.ColumnByName('Period4').DisplayLabel:= GetColumnTitle(AStart_Date + 21, AStart_Date + 28 - 1);
        wwDBGridPlan.ColumnByName('Period5').DisplayLabel:= GetColumnTitle(AStart_Date + 28, AStart_Date + 35 - 1);}
      end;
    cwDaily  :
      begin
        { TODO -oSanketG -cWebConvert : Need to find alternative property for ColumnByName in TIQUniGridControl}
        {wwDBGridPlan.ColumnByName('Period1').DisplayLabel:= GetColumnTitle(AStart_Date,      AStart_Date    );
        wwDBGridPlan.ColumnByName('Period2').DisplayLabel:= GetColumnTitle(AStart_Date + 1,  AStart_Date + 1);
        wwDBGridPlan.ColumnByName('Period3').DisplayLabel:= GetColumnTitle(AStart_Date + 2,  AStart_Date + 2);
        wwDBGridPlan.ColumnByName('Period4').DisplayLabel:= GetColumnTitle(AStart_Date + 3,  AStart_Date + 3);
        wwDBGridPlan.ColumnByName('Period5').DisplayLabel:= GetColumnTitle(AStart_Date + 4,  AStart_Date + 4);}
      end;
  end;
end;

procedure TFrmForeLabCapWhiteboard.FormShow(Sender: TObject);
begin
  // caption
  self.Caption:= Format('Forecast Labor Whiteboard Capacity Plan: %s', [ SelectValueByID('name', 'fore_head', FFore_Head_ID)]);
  IQSetTablesActive( TRUE, self );
  UpdateGridPeriodsTitles;
end;

function TFrmForeLabCapWhiteboard.ActiveDataSet: TFDQuery;
begin
  case GetViewType of
    cwMonthly: Result:= QryMonthly;
    cwWeekly : Result:= QryWeekly;
    cwDaily  : Result:= QryDaily;
  end;
end;

function TFrmForeLabCapWhiteboard.GetStartDate: TDateTime;
var
  ADate: TDateTime;
begin
  // for Monthly and Weekly views return beginning of the week. For Daily - the actual "Begin Date" they selected
  ADate:= wwDBDateTimePickerStartDate.DateTime;
  if GetViewType <> cwDaily then
     Result:= SelectValueFmtAsFloat('select iqcalendar.SundayOf(to_date(''%s'', ''mm/dd/yyyy'')) from dual', [ FormatDateTime( 'mm/dd/yyyy', ADate)])
  else
     Result:= ADate;
end;

function TFrmForeLabCapWhiteboard.GetViewType: TCapacityWhiteboardView;
begin
  case wwDBComboBoxViewType.ItemIndex of
    0: Result:= cwMonthly;
    1: Result:= cwWeekly;
    2: Result:= cwDaily;
  end;
end;

procedure TFrmForeLabCapWhiteboard.sbtnApplyClick(Sender: TObject);
var
  hMesg: TPanelMesg;
begin
  // Validate
  IQAssert( wwDBDateTimePickerStartDate.DateTime > 0, 'Begin Date must be specified - operation aborted.');
  IQAssert( wwDBComboBoxViewType.ItemIndex > -1,  'View type must be specified - operation aborted.');

  hMesg:= hPleaseWait('');
  try
    ApplyCriteria;
  finally
    hMesg.Free;
  end;
end;


procedure TFrmForeLabCapWhiteboard.ApplyCriteria;
var
  AIsOpen: Boolean;
  AMfgType: string;
  AEmp_Level_ID: Real;
  AMfgCell_ID: Real;
begin
  AIsOpen:= ActiveDataSet.Active;

  if AIsOpen then
  begin
    AEmp_Level_ID:= ActiveDataSet.FieldByName('EMP_LEVEL_ID').asFloat;
    AMfgType   := ActiveDataSet.FieldByName('MFGTYPE').asString;
    AMfgCell_ID:= ActiveDataSet.FieldByName('MFGCELL_ID').AsFloat;
  end;

  Reopen( ActiveDataSet );
  SrcCapacityPlan.DataSet:= ActiveDataSet;
  UpdateGridPeriodsTitles;

  if not AIsOpen then
     EXIT;

  // first get in range by locating the mfgtype
  if not ActiveDataSet.Locate( 'MFGTYPE', AMfgType, []) then
     EXIT;

  while not ActiveDataSet.Eof and (AMfgType = ActiveDataSet.FieldByName('MFGTYPE').asString ) do
  begin
    if (AMfgCell_ID > 0) and (AEmp_Level_ID > 0) then
       begin
         if (AMfgCell_ID = ActiveDataSet.FieldByName('MFGCELL_ID').AsFloat) and (AEmp_Level_ID = ActiveDataSet.FieldByName('EMP_LEVEL_ID').asFloat) then
            BREAK;
       end

    else if (AMfgCell_ID > 0) and (AEmp_Level_ID = 0) then
       begin
         if (AMfgCell_ID = ActiveDataSet.FieldByName('MFGCELL_ID').AsFloat) and ( ActiveDataSet.FieldByName('EMP_LEVEL_ID').asFloat = 0) then
            BREAK;
       end

    else if (AMfgCell_ID = 0) and (AEmp_Level_ID > 0) then
       begin
         if (ActiveDataSet.FieldByName('MFGCELL_ID').AsFloat = 0) and (AEmp_Level_ID = ActiveDataSet.FieldByName('EMP_LEVEL_ID').asFloat) then
            BREAK;
       end

    else if (AMfgCell_ID = 0) and (AEmp_Level_ID = 0) then
       begin
         if (0 = ActiveDataSet.FieldByName('MFGCELL_ID').AsFloat) and (0 = ActiveDataSet.FieldByName('EMP_LEVEL_ID').asFloat) then
            BREAK;
       end;


    ActiveDataSet.Next;
  end;

  // if AMfgCell_ID > 0 then
  //    ActiveDataSet.Locate( 'MFGTYPE;MFGCELL_ID;EMP_LEVEL_ID', VarArrayOf([ AMfgType, AMfgCell_ID, AEmp_Level_ID]), [])
  // else
  //    ActiveDataSet.Locate( 'MFGTYPE;EMP_LEVEL_ID', VarArrayOf([ AMfgType, AEmp_Level_ID]), []);
end;

procedure TFrmForeLabCapWhiteboard.sbtnBackClick(Sender: TObject);
begin
  MovePeriod( -1 {move 1 period back} );
end;

procedure TFrmForeLabCapWhiteboard.sbtnForwardClick(Sender: TObject);
begin
  MovePeriod( +1 {move 1 period forward} );
end;

procedure TFrmForeLabCapWhiteboard.MovePeriod( ADirection: Integer );
var
  ADelta: Real;
begin
  case GetViewType of
    cwMonthly: ADelta:= 28 * ADirection;
    cwWeekly : ADelta:= 7 * ADirection;
    cwDaily  : ADelta:= 1 * ADirection;
  end;

  wwDBDateTimePickerStartDate.DateTime:= wwDBDateTimePickerStartDate.DateTime + ADelta;

  ApplyCriteria;
end;


procedure TFrmForeLabCapWhiteboard.bbtnSearchClick(Sender: TObject);
begin
  with PkType do
    if Execute then
    begin
      if GetValue('MfgCell_ID') > 0 then
         ActiveDataSet.Locate( 'EMP_LEVEL_ID;MFGTYPE;MFGCELL_ID', VarArrayOf([ GetValue('EMP_LEVEL_ID'), GetValue('MFGTYPE'), GetValue('MFGCELL_ID')]), [])
      else
         ActiveDataSet.Locate( 'EMP_LEVEL_ID;MFGTYPE', VarArrayOf([ GetValue('EMP_LEVEL_ID'), GetValue('MFGTYPE') ]), [])
    end
end;

procedure TFrmForeLabCapWhiteboard.wwDBComboBoxViewTypeChange(Sender: TObject);
begin
  QryMonthly.Close;
  QryWeekly.Close;
  QryDaily.Close;
end;

procedure TFrmForeLabCapWhiteboard.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmForeLabCapWhiteboard.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmForecast{CHM}, iqhtmForecast{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
