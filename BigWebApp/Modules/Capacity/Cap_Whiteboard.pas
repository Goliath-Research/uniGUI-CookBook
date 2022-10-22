unit Cap_Whiteboard;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Mask,
  Vcl.wwDataInspector,
  Vcl.Buttons,
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
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniMainMenu, uniDateTimePicker, uniDBDateTimePicker, IQUniGrid,
  uniGUIFrame;

type
  TCapacityWhiteboardView = (cwMonthly, cwWeekly, cwDaily );

  TFrmCapWhiteboard = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGridPlan: TIQUniGridControl;
    SrcCapacityPlan: TDataSource;
    QryMonthly: TFDQuery;
    QryMonthlyCNTR_TYPE: TStringField;
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
    QryMonthlyHRS_REQ_FUTURE: TFMTBCDField;
    QryMonthlyPeriod1: TFMTBCDField;
    QryMonthlyPeriod2: TFMTBCDField;
    QryMonthlyPeriod3: TFMTBCDField;
    QryMonthlyPeriod4: TFMTBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    QryMonthlyHRS_REQ_5: TFMTBCDField;
    QryMonthlyHRS_AVAIL_5: TFMTBCDField;
    QryMonthlyPeriod5: TFMTBCDField;
    QryWeekly: TFDQuery;
    QryWeeklyCNTR_TYPE: TStringField;
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
    QryWeeklyHRS_REQ_FUTURE: TFMTBCDField;
    QryWeeklyPeriod1: TFMTBCDField;
    QryWeeklyPeriod2: TFMTBCDField;
    QryWeeklyPeriod3: TFMTBCDField;
    QryWeeklyPeriod4: TFMTBCDField;
    QryWeeklyPeriod5: TFMTBCDField;
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
    QryDailyCNTR_TYPE: TStringField;
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
    QryDailyHRS_REQ_FUTURE: TFMTBCDField;
    QryDailyPeriod1: TFMTBCDField;
    QryDailyPeriod2: TFMTBCDField;
    QryDailyPeriod3: TFMTBCDField;
    QryDailyPeriod4: TFMTBCDField;
    QryDailyPeriod5: TFMTBCDField;
    bbtnSearch: TUniSpeedButton;
    Bevel1: TUniPanel;
    QryMonthlyMFGCELL_DESCRIP: TStringField;
    QryWeeklyMFGCELL_DESCRIP: TStringField;
    QryDailyMFGCELL_DESCRIP: TStringField;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] Cap_Whiteboard.pas(159): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure wwDBGridPlanDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);}
    procedure QryMonthlyBeforeOpen(DataSet: TDataSet);
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] Cap_Whiteboard.pas(162): E2005 'TGridDrawState' is not a type identifier}
    {procedure wwDBGridPlanCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);}
    procedure AbortOnInsert(DataSet: TDataSet);
    procedure QryMonthlyUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    { TODO -oSanketG -cWebConvert : Need to revisit ,[dcc32 Error] Cap_Whiteboard.pas(167): E2003 Undeclared identifier: 'TNavigateBtn'}
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnApplyClick(Sender: TObject);
    procedure sbtnBackClick(Sender: TObject);
    procedure sbtnForwardClick(Sender: TObject);
    procedure bbtnSearchClick(Sender: TObject);
    procedure wwDBComboBoxViewTypeChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FNormalThreshold: Real;
    FBookedThreshold: Real;
    procedure DrawPeriodInGrid(AGrid: TIQUniGridControl; Rect: TRect; AReqHrs, AAvailHrs: Real);
    procedure DrawCenterTypeDetails(AGrid: TIQUniGridControl; Rect: TRect;  ACenterType, AMfgType, AMfgCell: string);
    procedure UpdateGridPeriodsTitles;
    function ActiveDataSet: TFDQuery;
    function GetStartDate: TDateTime;
    function GetViewType: TCapacityWhiteboardView;
    procedure MovePeriod(ADirection: Integer);
    procedure RefreshActiveDataSet;
    procedure ApplyCriteria;
  public
    { Public declarations }
    class procedure DoShow();
  end;



implementation

{$R *.dfm}

uses
  CapShare,
  IQMS.Common.Graphics,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg,
  Types;

{ TFrmCapWhiteboard }


class procedure TFrmCapWhiteboard.DoShow();
var
  FrmCapWhiteboard: TFrmCapWhiteboard;
begin
  FrmCapWhiteboard := TFrmCapWhiteboard.Create(UniGUIApplication.UniApplication);
  FrmCapWhiteboard.Show;
end;

procedure TFrmCapWhiteboard.UniFormCreate(Sender: TObject);
begin
  PkCenterType.KeyScopeField := 'CNTR_TYPE';

  IQRegFormRead(self, [ self, wwDBGridPlan, pnlCriteria ]);

  // init form
  { TODO -oSanketG -cWebConvert : Need to find alternative KeyOptions in TIQUniGridControl}
  //wwDBGridPlan.KeyOptions:= [];
  wwDBDateTimePickerStartDate.DateTime:= Date;
  wwDBComboBoxViewType.ItemIndex:= 0; // monthly

  // thresholds
  FNormalThreshold    := CapShare.GetCapacityWhiteboardThreshold( 'AVAILABLE' );
  FBookedThreshold    := CapShare.GetCapacityWhiteboardThreshold( 'BOOKED' );

  // launch query
  sbtnApplyClick(nil);
end;

procedure TFrmCapWhiteboard.FormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  UpdateGridPeriodsTitles;
end;

procedure TFrmCapWhiteboard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGridPlan, pnlCriteria ]);
end;

{ TODO -oSanketG -cWebConvert : Need to revisit ,
[dcc32 Error] Cap_Whiteboard.pas(252): E2005 'TGridDrawState' is not a type identifier}
{procedure TFrmCapWhiteboard.wwDBGridPlanDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if (Field.FieldName = 'Period1') then
     DrawPeriodInGrid( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_1').asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_1').asFloat )

  else if (Field.FieldName = 'Period2') then
     DrawPeriodInGrid( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_2').asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_2').asFloat )

  else if (Field.FieldName = 'Period3') then
     DrawPeriodInGrid( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_3').asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_3').asFloat )

  else if (Field.FieldName = 'Period4') then
     DrawPeriodInGrid( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_4').asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_4').asFloat )

  else if (Field.FieldName = 'Period5') then
     DrawPeriodInGrid( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('HRS_REQ_5').asFloat, ActiveDataSet.FieldByName('HRS_AVAIL_5').asFloat )

  else if Field.FieldName = 'CNTR_TYPE' then
     DrawCenterTypeDetails( wwDBGridPlan, Rect, ActiveDataSet.FieldByName('CNTR_TYPE').asString, ActiveDataSet.FieldByName('MFGTYPE').asString,  ActiveDataSet.FieldByName('MFGCELL_DESCRIP').asString )

  else
     wwDBGridPlan.DefaultDrawDataCell( Rect, Field, State );
end;}


procedure TFrmCapWhiteboard.DrawPeriodInGrid( AGrid: TIQUniGridControl; Rect: TRect; AReqHrs, AAvailHrs: Real );
var
  ARectLabelReq    : TRect;
  ARectLabelAvail  : TRect;

  ARectTextReq     : TRect;
  ARectTextAvail   : TRect;

  ARectBar: TRect;
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
  AUpperTextHeight:= (Rect.Bottom - Rect.Top) div 2;
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //ALeftColumnWidth:=  AGrid.Canvas.TextWidth('99.99% ') + 4;

  // Label Req
  ARectLabelReq.TopLeft:= Rect.TopLeft;
  ARectLabelReq.Bottom := ARectLabelReq.Top + AUpperTextHeight div 2;
  ARectLabelReq.Right  := ARectLabelReq.Left + ALeftColumnWidth - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectLabelReq, ARectLabelReq.Left + 1, ARectLabelReq.Top + 1, 'Req ' );

  // Text Req
  ARectTextReq.Top     := ARectLabelReq.Top;
  ARectTextReq.Left    := ARectLabelReq.Right + 2;
  ARectTextReq.Bottom  := ARectLabelReq.Bottom;
  ARectTextReq.Right   := Rect.Right - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectTextReq, ARectTextReq.Left + 1, ARectTextReq.Top + 1, NumToStr( AReqHrs ));

  // Label Avail
  ARectLabelAvail.Left   := Rect.Left;
  ARectLabelAvail.Top    := ARectTextReq.Bottom + 1;
  ARectLabelAvail.Bottom := Rect.Top + AUpperTextHeight;
  ARectLabelAvail.Right  := ARectLabelAvail.Left + ALeftColumnWidth - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectLabelAvail, ARectLabelAvail.Left + 1, ARectLabelAvail.Top + 1, 'Avail ' );

  // Text Avail
  ARectTextAvail.Top     := ARectLabelAvail.Top;
  ARectTextAvail.Left    := ARectLabelAvail.Right + 2;
  ARectTextAvail.Bottom  := ARectLabelAvail.Bottom;
  ARectTextAvail.Right   := Rect.Right - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectTextAvail, ARectTextAvail.Left + 1, ARectTextAvail.Top + 1, NumToStr( AAvailHrs ));

  // vertical separator line
  {AGrid.Canvas.Pen.Color:= clSilver;
  AGrid.Canvas.MoveTo( ARectLabelAvail.Left + ALeftColumnWidth, Rect.Top );
  AGrid.Canvas.LineTo( ARectLabelAvail.Left + ALeftColumnWidth, Rect.Top + AUpperTextHeight + 2);

  // horizontal separator line
  AGrid.Canvas.Pen.Color:= clSilver;
  AGrid.Canvas.MoveTo( Rect.Left,  Rect.Top + AUpperTextHeight + 2);
  AGrid.Canvas.LineTo( Rect.Right, Rect.Top + AUpperTextHeight + 2);}

  // Text Percent
  ARectProgressText.Top   := Rect.Top + AUpperTextHeight + 5;
  ARectProgressText.Left  := Rect.Left;
  ARectProgressText.Bottom:= Rect.Bottom - 3;
  ARectProgressText.Right := ARectProgressText.Left + ALeftColumnWidth;
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectProgressText, ARectProgressText.Left + 1, ARectProgressText.Top + 1, Format('%.0f%% ', [ AProgress ]));

  // progress bar background
  ARectBar.Left := Rect.Left + ALeftColumnWidth + 2;
  ARectBar.Top := Rect.Top + AUpperTextHeight + 6;
  ARectBar.Right := Rect.Right - 3;
  ARectBar.Bottom := Rect.Bottom - 4;
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
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

  // Color the progress bar
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //AGrid.Canvas.Brush.Color := ABarColor;
  //AGrid.Canvas.FillRect(ARectProgress);
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //IQMS.Common.Graphics.DrawGradient(AGrid.Canvas, ARectProgress, [ABarGradientLightColor, ABarColor]);

  // Frame the entire bar for clarity
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  {AGrid.Canvas.Brush.Color := clGray;
  AGrid.Canvas.FrameRect(ARectBar);}
end;

procedure TFrmCapWhiteboard.DrawCenterTypeDetails( AGrid: TIQUniGridControl; Rect: TRect; ACenterType, AMfgType, AMfgCell: string );
var
  ARectCenterType: TRect;
  ARectMfgType   : TRect;
  ARectMfgCell   : TRect;
begin
  // Change font style
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //AGrid.Canvas.Font.Style:= AGrid.Canvas.Font.Style + [fsBold];

  // Center Type
  ARectCenterType.TopLeft:= Rect.TopLeft;
  ARectCenterType.Right  := Rect.Right;
  ARectCenterType.Bottom := ARectCenterType.Top + (Rect.Bottom - Rect.Top) div 3;
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectCenterType, ARectCenterType.Left + 1, ARectCenterType.Top + 1, ACenterType);

  // Change font color and style
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  {AGrid.Canvas.Font.Color:= clGray;
  AGrid.Canvas.Font.Style:= AGrid.Canvas.Font.Style - [fsBold];}

  // MfgType
  ARectMfgType.Top    := ARectCenterType.Bottom + 1;
  ARectMfgType.Left   := Rect.Left;
  ARectMfgType.Right  := Rect.Right;
  ARectMfgType.Bottom := Rect.Bottom - (Rect.Bottom - Rect.Top) div 3;
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectMfgType, ARectMfgType.Left + 1, ARectMfgType.Top + 1, AMfgType);

  // MfgCell
  ARectMfgCell.Top    := ARectMfgType.Bottom + 1;
  ARectMfgCell.Left   := Rect.Left;
  ARectMfgCell.Right  := Rect.Right;
  ARectMfgCell.Bottom := Rect.Bottom;
  { TODO -oSanketG -cWebConvert : Need to find alternative Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectMfgCell, ARectMfgCell.Left + 1, ARectMfgCell.Top + 1, AMfgCell);
end;

procedure TFrmCapWhiteboard.QryMonthlyBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('start_date').asDateTime:= GetStartDate();
  AssignQueryParamValue(DataSet, 'start_date', GetStartDate());
end;

{ TODO -oSanketG -cWebConvert : Need to revisit ,
[dcc32 Error] Cap_Whiteboard.pas(476): E2003 Undeclared identifier: 'wwDBGridPlanCalcCellColors'}
{procedure TFrmCapWhiteboard.wwDBGridPlanCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if (Field = ActiveDataSet.FieldByName('PAST_DUE')) and (Field.asFloat > 0) then
     AFont.Color:= clRed;

  if Field = ActiveDataSet.FieldByName('CNTR_TYPE') then
     ABrush.Color:= clInfoBk;
end;}

procedure TFrmCapWhiteboard.AbortOnInsert(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmCapWhiteboard.QryMonthlyUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  AAction := eaApplied;
end;

{procedure TFrmCapWhiteboard.CheckRefresh(Sender: TObject;  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    ApplyCriteria;
    ABORT;
  end;
end;}

procedure TFrmCapWhiteboard.RefreshActiveDataSet; // obsolete
var
  ACntrType, AMfgType: string;
  AMfgCell_ID: Real;
begin
  ACntrType  := ActiveDataSet.FieldByName('CNTR_TYPE').asString;
  AMfgType   := ActiveDataSet.FieldByName('MFGTYPE').asString;
  AMfgCell_ID:= ActiveDataSet.FieldByName('MFGCELL_ID').asFloat;
  Reopen( ActiveDataSet );
  if AMfgCell_ID > 0 then
     ActiveDataSet.Locate( 'CNTR_TYPE;MFGTYPE;MFGCELL_ID', VarArrayOf([ACntrType, AMfgType, AMfgCell_ID]), [])
  else
     ActiveDataSet.Locate( 'CNTR_TYPE;MFGTYPE', VarArrayOf([ACntrType, AMfgType]), []);
  UpdateGridPeriodsTitles;
end;

procedure TFrmCapWhiteboard.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCapWhiteboard.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;


procedure TFrmCapWhiteboard.UpdateGridPeriodsTitles;
var
  AStart_Date: TDateTime;

  function GetColumnTitle( ADate1, ADate2: TDateTime ): string;
  begin
    Result:= Format('From %s~Thru %s', [ DateToStr( ADate1 ), DateToStr( ADate2 ) ]);
  end;

begin
  AStart_Date:= GetStartDate();
  { TODO -oSanketG -cWebConvert : Need to find alternative property ColumnByName in TIQUniGridControl}
  {case GetViewType of
    cwMonthly:
      begin
        wwDBGridPlan.ColumnByName('Period1').DisplayLabel:= GetColumnTitle(AStart_Date,      AStart_Date +  28 - 1);
        wwDBGridPlan.ColumnByName('Period2').DisplayLabel:= GetColumnTitle(AStart_Date + 28, AStart_Date +  56 - 1);
        wwDBGridPlan.ColumnByName('Period3').DisplayLabel:= GetColumnTitle(AStart_Date + 56, AStart_Date +  84 - 1);
        wwDBGridPlan.ColumnByName('Period4').DisplayLabel:= GetColumnTitle(AStart_Date + 84, AStart_Date + 112 - 1);
        wwDBGridPlan.ColumnByName('Period5').DisplayLabel:= GetColumnTitle(AStart_Date + 112,AStart_Date + 140 - 1);
      end;
    cwWeekly :
      begin
        wwDBGridPlan.ColumnByName('Period1').DisplayLabel:= GetColumnTitle(AStart_Date,      AStart_Date +  7 - 1);
        wwDBGridPlan.ColumnByName('Period2').DisplayLabel:= GetColumnTitle(AStart_Date + 7,  AStart_Date + 14 - 1);
        wwDBGridPlan.ColumnByName('Period3').DisplayLabel:= GetColumnTitle(AStart_Date + 14, AStart_Date + 21 - 1);
        wwDBGridPlan.ColumnByName('Period4').DisplayLabel:= GetColumnTitle(AStart_Date + 21, AStart_Date + 28 - 1);
        wwDBGridPlan.ColumnByName('Period5').DisplayLabel:= GetColumnTitle(AStart_Date + 28, AStart_Date + 35 - 1);
      end;
    cwDaily  :
      begin
        wwDBGridPlan.ColumnByName('Period1').DisplayLabel:= GetColumnTitle(AStart_Date,      AStart_Date    );
        wwDBGridPlan.ColumnByName('Period2').DisplayLabel:= GetColumnTitle(AStart_Date + 1,  AStart_Date + 1);
        wwDBGridPlan.ColumnByName('Period3').DisplayLabel:= GetColumnTitle(AStart_Date + 2,  AStart_Date + 2);
        wwDBGridPlan.ColumnByName('Period4').DisplayLabel:= GetColumnTitle(AStart_Date + 3,  AStart_Date + 3);
        wwDBGridPlan.ColumnByName('Period5').DisplayLabel:= GetColumnTitle(AStart_Date + 4,  AStart_Date + 4);
      end;
  end; }
end;

function TFrmCapWhiteboard.ActiveDataSet: TFDQuery;
begin
  case GetViewType of
    cwMonthly: Result:= QryMonthly;
    cwWeekly : Result:= QryWeekly;
    cwDaily  : Result:= QryDaily;
  end;
end;

function TFrmCapWhiteboard.GetStartDate: TDateTime;
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

function TFrmCapWhiteboard.GetViewType: TCapacityWhiteboardView;
begin
  case wwDBComboBoxViewType.ItemIndex of
    0: Result:= cwMonthly;
    1: Result:= cwWeekly;
    2: Result:= cwDaily;
  end;
end;

procedure TFrmCapWhiteboard.sbtnApplyClick(Sender: TObject);
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


procedure TFrmCapWhiteboard.ApplyCriteria;
var
  AIsOpen: Boolean;
  ACntrType, AMfgType: string;
  AMfgCell_ID: Real;
begin
  AIsOpen:= ActiveDataSet.Active;

  if AIsOpen then
  begin
    ACntrType  := ActiveDataSet.FieldByName('CNTR_TYPE').asString;
    AMfgType   := ActiveDataSet.FieldByName('MFGTYPE').asString;
    AMfgCell_ID:= ActiveDataSet.FieldByName('MFGCELL_ID').asFloat;
  end;

  Reopen( ActiveDataSet );
  SrcCapacityPlan.DataSet:= ActiveDataSet;
  UpdateGridPeriodsTitles;

  if AIsOpen then
  begin
    if AMfgCell_ID > 0 then
       ActiveDataSet.Locate( 'CNTR_TYPE;MFGTYPE;MFGCELL_ID', VarArrayOf([ACntrType, AMfgType, AMfgCell_ID]), [])
    else
       ActiveDataSet.Locate( 'CNTR_TYPE;MFGTYPE', VarArrayOf([ACntrType, AMfgType]), []);
  end;
end;

procedure TFrmCapWhiteboard.sbtnBackClick(Sender: TObject);
begin
  MovePeriod( -1 {move 1 period back} );
end;

procedure TFrmCapWhiteboard.sbtnForwardClick(Sender: TObject);
begin
  MovePeriod( +1 {move 1 period forward} );
end;

procedure TFrmCapWhiteboard.MovePeriod( ADirection: Integer );
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


procedure TFrmCapWhiteboard.bbtnSearchClick(Sender: TObject);
begin
  with PkCenterType do
    if Execute then
    begin
      if GetValue('MfgCell_ID') > 0 then
         ActiveDataSet.Locate( 'CNTR_TYPE;MFGTYPE;MFGCELL_ID', VarArrayOf([ GetValue('CNTR_TYPE'), GetValue('MFGTYPE'), GetValue('MFGCELL_ID')]), [])
      else
         ActiveDataSet.Locate( 'CNTR_TYPE;MFGTYPE', VarArrayOf([ GetValue('CNTR_TYPE'), GetValue('MFGTYPE') ]), [])
    end
end;

procedure TFrmCapWhiteboard.wwDBComboBoxViewTypeChange(Sender: TObject);
begin
  QryMonthly.Close;
  QryWeekly.Close;
  QryDaily.Close;
end;

procedure TFrmCapWhiteboard.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCapWhiteboard.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.
