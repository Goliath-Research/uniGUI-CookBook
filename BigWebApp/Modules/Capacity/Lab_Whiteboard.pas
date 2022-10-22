unit Lab_Whiteboard;

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

  TFrmLabWhiteboard = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGridPlan: TIQUniGridControl;
    SrcCapacityPlan: TDataSource;
    QryMonthly: TFDQuery;
    QryMonthlyMFGTYPE: TStringField;
    QryMonthlyMFGCELL: TStringField;
    QryMonthlyMFGCELL_ID: TBCDField;
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
    QryWeeklyMFGTYPE: TStringField;
    QryWeeklyMFGCELL: TStringField;
    QryWeeklyMFGCELL_ID: TBCDField;
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
    QryDailyMFGTYPE: TStringField;
    QryDailyMFGCELL: TStringField;
    QryDailyMFGCELL_ID: TBCDField;
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
    QryMonthlyEMP_LEVEL_ID: TBCDField;
    QryMonthlyEMP_LEVEL_CODE: TStringField;
    QryWeeklyEMP_LEVEL_ID: TBCDField;
    QryWeeklyEMP_LEVEL_CODE: TStringField;
    QryDailyEMP_LEVEL_ID: TBCDField;
    QryDailyEMP_LEVEL_CODE: TStringField;
    QryMonthlySETUP_HRS_REQ_1: TFMTBCDField;
    QryMonthlySETUP_HRS_REQ_2: TFMTBCDField;
    QryMonthlySETUP_HRS_REQ_3: TFMTBCDField;
    QryMonthlySETUP_HRS_REQ_4: TFMTBCDField;
    QryMonthlySETUP_HRS_REQ_5: TFMTBCDField;
    QryMonthlySETUP_HRS_REQ_FUTURE: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_1: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_2: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_3: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_4: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_5: TFMTBCDField;
    QryWeeklySETUP_HRS_REQ_FUTURE: TFMTBCDField;
    QryDailySETUP_HRS_REQ_1: TFMTBCDField;
    QryDailySETUP_HRS_REQ_2: TFMTBCDField;
    QryDailySETUP_HRS_REQ_3: TFMTBCDField;
    QryDailySETUP_HRS_REQ_4: TFMTBCDField;
    QryDailySETUP_HRS_REQ_5: TFMTBCDField;
    QryDailySETUP_HRS_REQ_FUTURE: TFMTBCDField;
    Contents1: TUniMenuItem;
    N1: TUniMenuItem;
    QueryByMfgTypeMfgCellEmployeeLevel1: TUniMenuItem;
    QueryByMfgTypeEmployeeLevel1: TUniMenuItem;
    QryMonthlyEx: TFDQuery;
    QryMonthlyExEMP_LEVEL_CODE: TStringField;
    QryMonthlyExPeriod1: TFMTBCDField;
    QryMonthlyExPeriod2: TFMTBCDField;
    QryMonthlyExPeriod3: TFMTBCDField;
    QryMonthlyExPeriod4: TFMTBCDField;
    QryMonthlyExPeriod5: TFMTBCDField;
    QryMonthlyExHRS_REQ_FUTURE: TFMTBCDField;
    QryMonthlyExMFGTYPE: TStringField;
    QryMonthlyExMFGCELL: TStringField;
    QryMonthlyExHRS_REQ_1: TFMTBCDField;
    QryMonthlyExHRS_AVAIL_1: TFMTBCDField;
    QryMonthlyExHRS_REQ_2: TFMTBCDField;
    QryMonthlyExHRS_AVAIL_2: TFMTBCDField;
    QryMonthlyExHRS_REQ_3: TFMTBCDField;
    QryMonthlyExHRS_AVAIL_3: TFMTBCDField;
    QryMonthlyExHRS_REQ_4: TFMTBCDField;
    QryMonthlyExHRS_REQ_5: TFMTBCDField;
    QryMonthlyExHRS_AVAIL_5: TFMTBCDField;
    QryMonthlyExMFGCELL_ID: TFMTBCDField;
    QryMonthlyExHRS_AVAIL_4: TFMTBCDField;
    QryMonthlyExEMP_LEVEL_ID: TBCDField;
    QryMonthlyExSETUP_HRS_REQ_1: TFMTBCDField;
    QryMonthlyExSETUP_HRS_REQ_2: TFMTBCDField;
    QryMonthlyExSETUP_HRS_REQ_3: TFMTBCDField;
    QryMonthlyExSETUP_HRS_REQ_4: TFMTBCDField;
    QryMonthlyExSETUP_HRS_REQ_5: TFMTBCDField;
    QryMonthlyExSETUP_HRS_REQ_FUTURE: TFMTBCDField;
    QryWeeklyEx: TFDQuery;
    QryWeeklyExEMP_LEVEL_CODE: TStringField;
    QryWeeklyExMFGTYPE: TStringField;
    QryWeeklyExMFGCELL: TStringField;
    QryWeeklyExMFGCELL_ID: TFMTBCDField;
    QryWeeklyExHRS_REQ_1: TFMTBCDField;
    QryWeeklyExHRS_AVAIL_1: TFMTBCDField;
    QryWeeklyExHRS_REQ_2: TFMTBCDField;
    QryWeeklyExHRS_AVAIL_2: TFMTBCDField;
    QryWeeklyExHRS_REQ_3: TFMTBCDField;
    QryWeeklyExHRS_AVAIL_3: TFMTBCDField;
    QryWeeklyExHRS_REQ_4: TFMTBCDField;
    QryWeeklyExHRS_AVAIL_4: TFMTBCDField;
    QryWeeklyExHRS_REQ_5: TFMTBCDField;
    QryWeeklyExHRS_AVAIL_5: TFMTBCDField;
    QryWeeklyExHRS_REQ_FUTURE: TFMTBCDField;
    QryWeeklyExPeriod1: TFMTBCDField;
    QryWeeklyExPeriod2: TFMTBCDField;
    QryWeeklyExPeriod3: TFMTBCDField;
    QryWeeklyExPeriod4: TFMTBCDField;
    QryWeeklyExPeriod5: TFMTBCDField;
    QryWeeklyExEMP_LEVEL_ID: TBCDField;
    QryWeeklyExSETUP_HRS_REQ_1: TFMTBCDField;
    QryWeeklyExSETUP_HRS_REQ_2: TFMTBCDField;
    QryWeeklyExSETUP_HRS_REQ_3: TFMTBCDField;
    QryWeeklyExSETUP_HRS_REQ_4: TFMTBCDField;
    QryWeeklyExSETUP_HRS_REQ_5: TFMTBCDField;
    QryWeeklyExSETUP_HRS_REQ_FUTURE: TFMTBCDField;
    QryDailyEx: TFDQuery;
    QryDailyExEMP_LEVEL_CODE: TStringField;
    QryDailyExMFGTYPE: TStringField;
    QryDailyExMFGCELL: TStringField;
    QryDailyExMFGCELL_ID: TFMTBCDField;
    QryDailyExHRS_REQ_1: TFMTBCDField;
    QryDailyExHRS_AVAIL_1: TFMTBCDField;
    QryDailyExPeriod1: TFMTBCDField;
    QryDailyExPeriod2: TFMTBCDField;
    QryDailyExPeriod3: TFMTBCDField;
    QryDailyExPeriod4: TFMTBCDField;
    QryDailyExPeriod5: TFMTBCDField;
    QryDailyExHRS_REQ_2: TFMTBCDField;
    QryDailyExHRS_AVAIL_2: TFMTBCDField;
    QryDailyExHRS_REQ_3: TFMTBCDField;
    QryDailyExHRS_AVAIL_3: TFMTBCDField;
    QryDailyExHRS_REQ_4: TFMTBCDField;
    QryDailyExHRS_AVAIL_4: TFMTBCDField;
    QryDailyExHRS_REQ_5: TFMTBCDField;
    QryDailyExHRS_AVAIL_5: TFMTBCDField;
    QryDailyExHRS_REQ_FUTURE: TFMTBCDField;
    QryDailyExEMP_LEVEL_ID: TBCDField;
    QryDailyExSETUP_HRS_REQ_1: TFMTBCDField;
    QryDailyExSETUP_HRS_REQ_2: TFMTBCDField;
    QryDailyExSETUP_HRS_REQ_3: TFMTBCDField;
    QryDailyExSETUP_HRS_REQ_4: TFMTBCDField;
    QryDailyExSETUP_HRS_REQ_5: TFMTBCDField;
    QryDailyExSETUP_HRS_REQ_FUTURE: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] Lab_Whiteboard.pas(265): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure wwDBGridPlanDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);}
    procedure QryMonthlyBeforeOpen(DataSet: TDataSet);
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] Lab_Whiteboard.pas(265): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure wwDBGridPlanCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);}
    procedure AbortOnInsert(DataSet: TDataSet);
    procedure QryMonthlyUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] Lab_Whiteboard.pas(273): E2003 Undeclared identifier: 'TNavigateBtn'}
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
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
    procedure QueryByMfgTypeMfgCellEmployeeLevel1Click(Sender: TObject);
    procedure QueryByMfgTypeEmployeeLevel1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FNormalThreshold: Real;
    FBookedThreshold: Real;
    procedure DrawPeriodInGrid( AGrid: TIQUniGridControl; Rect: TRect; AReqHrs, AAvailHrs, ASetupHrs: Real );
    procedure DrawEmployeeTypeDetails(AGrid: TIQUniGridControl; Rect: TRect;  AEmpLevel, AMfgType, AMfgCell: string; AIncludeMfgCell: Boolean );
    procedure UpdateGridPeriodsTitles;
    function ActiveDataSet: TFDQuery;
    function GetStartDate: TDateTime;
    function GetViewType: TCapacityWhiteboardView;
    procedure MovePeriod(ADirection: Integer);
    procedure RefreshActiveDataSet;
    procedure ApplyCriteria;
    procedure LocateRecord(AMfgType: string; AMfgcell_ID, AEmp_Level_ID: Real);
  public
    { Public declarations }
    class procedure DoShow();
  end;



implementation

{$R *.dfm}

uses
  CapShare,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg,
  Types;

const
     cProgressBarHeight = 24;

{ TFrmCapWhiteboard }


class procedure TFrmLabWhiteboard.DoShow();
var
  FrmLabWhiteboard: TFrmLabWhiteboard;
begin
  FrmLabWhiteboard := TFrmLabWhiteboard.Create(uniGUIApplication.uniApplication);
  FrmLabWhiteboard.Show;
end;

procedure TFrmLabWhiteboard.UniFormCreate(Sender: TObject);
var
  AFlag: Boolean;
begin
   PkType.KeyScopeField := 'MFGTYPE';
  PkTypeEx.KeyScopeField := 'MFGTYPE';

  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self, wwDBGridPlan, pnlCriteria ]);

  // init form
  { TODO -oSanketG -cWebConvert : Need to find alternative property KeyOptions in TIQUniGridControl}
  //wwDBGridPlan.KeyOptions:= [];
  wwDBDateTimePickerStartDate.DateTime:= Date;
  wwDBComboBoxViewType.ItemIndex:= 0; // monthly

  // thresholds
  FNormalThreshold    := CapShare.GetCapacityWhiteboardThreshold( 'AVAILABLE' );
  FBookedThreshold    := CapShare.GetCapacityWhiteboardThreshold( 'BOOKED' );

  // launch query
  // sbtnApplyClick(nil);
  AFlag:= False;
  IQRegBooleanScalarRead( self, 'QueryByMfgTypeEmployeeLevel', AFlag );
  if AFlag then
     QueryByMfgTypeEmployeeLevel1.Click
  else
     QueryByMfgTypeMfgCellEmployeeLevel1.Click;
end;

procedure TFrmLabWhiteboard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGridPlan, pnlCriteria ]);
  IQRegBooleanScalarWrite( self, 'QueryByMfgTypeEmployeeLevel', QueryByMfgTypeEmployeeLevel1.Checked );
end;

{ TODO -oSanketG -cWebConvert : Need to revisit ,
[dcc32 Error] Lab_Whiteboard.pas(381): E2003 Undeclared identifier: 'wwDBGridPlanDrawDataCell'}
(*procedure TFrmLabWhiteboard.wwDBGridPlanDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if (Field.FieldName = 'Period1') then
     DrawPeriodInGrid( wwDBGridPlan,
                       Rect,
                       ActiveDataSet.FieldByName('HRS_REQ_1').asFloat,
                       ActiveDataSet.FieldByName('HRS_AVAIL_1').asFloat,
                       ActiveDataSet.FieldByName('SETUP_HRS_REQ_1').asFloat )

  else if (Field.FieldName = 'Period2') then
     DrawPeriodInGrid( wwDBGridPlan,
                       Rect,
                       ActiveDataSet.FieldByName('HRS_REQ_2').asFloat,
                       ActiveDataSet.FieldByName('HRS_AVAIL_2').asFloat,
                       ActiveDataSet.FieldByName('SETUP_HRS_REQ_2').asFloat )

  else if (Field.FieldName = 'Period3') then
     DrawPeriodInGrid( wwDBGridPlan,
                       Rect,
                       ActiveDataSet.FieldByName('HRS_REQ_3').asFloat,
                       ActiveDataSet.FieldByName('HRS_AVAIL_3').asFloat,
                       ActiveDataSet.FieldByName('SETUP_HRS_REQ_3').asFloat )

  else if (Field.FieldName = 'Period4') then
     DrawPeriodInGrid( wwDBGridPlan,
                       Rect,
                       ActiveDataSet.FieldByName('HRS_REQ_4').asFloat,
                       ActiveDataSet.FieldByName('HRS_AVAIL_4').asFloat,
                       ActiveDataSet.FieldByName('SETUP_HRS_REQ_4').asFloat )

  else if (Field.FieldName = 'Period5') then
     DrawPeriodInGrid( wwDBGridPlan,
                       Rect,
                       ActiveDataSet.FieldByName('HRS_REQ_5').asFloat,
                       ActiveDataSet.FieldByName('HRS_AVAIL_5').asFloat,
                       ActiveDataSet.FieldByName('SETUP_HRS_REQ_5').asFloat )

  else if Field.FieldName = 'EMP_LEVEL_CODE' then
     DrawEmployeeTypeDetails( wwDBGridPlan,
                              Rect,
                              ActiveDataSet.FieldByName('EMP_LEVEL_CODE').asString,
                              ActiveDataSet.FieldByName('MFGTYPE').asString,
                              ActiveDataSet.FieldByName('MFGCELL').asString,
                              QueryByMfgTypeMfgCellEmployeeLevel1.Checked )

  else
     { TODO -oSanketG -cWebConvert : Need to find alternative method DefaultDrawDataCell in TIQUniGridControl}
     //wwDBGridPlan.DefaultDrawDataCell( Rect, Field, State );
end;*)


procedure TFrmLabWhiteboard.DrawPeriodInGrid( AGrid: TIQUniGridControl; Rect: TRect; AReqHrs, AAvailHrs, ASetupHrs: Real );
var
  ARectLabelReq    : TRect;
  ARectLabelAvail  : TRect;
  ARectLabelSetup  : TRect;

  ARectTextReq     : TRect;
  ARectTextAvail   : TRect;
  ARectTextSetup   : TRect;

  ARectProgress    : TRect;
  ARectProgressText: TRect;

  ABarWidth        : Integer;
  AProgress        : Real;

  AUpperTextHeight : Integer;
  ALeftColumnWidth : Integer;

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
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
  //ALeftColumnWidth:=  AGrid.Canvas.TextWidth('99.99% ') + 4;

  // Label Req
  ARectLabelReq.TopLeft:= Rect.TopLeft;
  ARectLabelReq.Bottom := ARectLabelReq.Top + AUpperTextHeight div 3;
  ARectLabelReq.Right  := ARectLabelReq.Left + ALeftColumnWidth - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectLabelReq, ARectLabelReq.Left + 1, ARectLabelReq.Top + 1, 'Req ' );

  // Text Req
  ARectTextReq.Top     := ARectLabelReq.Top;
  ARectTextReq.Left    := ARectLabelReq.Right + 2;
  ARectTextReq.Bottom  := ARectLabelReq.Bottom;
  ARectTextReq.Right   := Rect.Right - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
  {if AReqHrs > AAvailHrs then
     AGrid.Canvas.Font.Color:= clRed;
  AGrid.Canvas.TextRect( ARectTextReq, ARectTextReq.Left + 1, ARectTextReq.Top + 1, NumToStr( AReqHrs ));
  AGrid.Canvas.Font.Color:= clBlack;}

  // Label Avail
  ARectLabelAvail.Left   := Rect.Left;
  ARectLabelAvail.Top    := ARectTextReq.Bottom + 1;
  ARectLabelAvail.Bottom := Rect.Top + AUpperTextHeight div 3 * 2;
  ARectLabelAvail.Right  := ARectLabelAvail.Left + ALeftColumnWidth - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectLabelAvail, ARectLabelAvail.Left + 1, ARectLabelAvail.Top + 1, 'Avail ' );

  // Text Avail
  ARectTextAvail.Top     := ARectLabelAvail.Top;
  ARectTextAvail.Left    := ARectLabelAvail.Right + 2;
  ARectTextAvail.Bottom  := ARectLabelAvail.Bottom;
  ARectTextAvail.Right   := Rect.Right - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectTextAvail, ARectTextAvail.Left + 1, ARectTextAvail.Top + 1, NumToStr( AAvailHrs ));

  // Label SetupHrs
  ARectLabelSetup.Left   := Rect.Left;
  ARectLabelSetup.Top    := ARectLabelAvail.Bottom + 1;
  ARectLabelSetup.Bottom := Rect.Top + AUpperTextHeight;
  ARectLabelSetup.Right  := ARectLabelSetup.Left + ALeftColumnWidth - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectLabelSetup, ARectLabelSetup.Left + 1, ARectLabelSetup.Top + 1, 'Setup ' );

  // Text SetupHrs
  ARectTextSetup.Top    := ARectLabelSetup.Top;
  ARectTextSetup.Left   := ARectLabelSetup.Right + 2;
  ARectTextSetup.Bottom := ARectLabelSetup.Bottom;
  ARectTextSetup.Right  := Rect.Right - 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
  //AGrid.Canvas.TextRect( ARectTextSetup, ARectTextSetup.Left + 1, ARectTextSetup.Top + 1, NumToStr( ASetupHrs ));

  // vertical separator line
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
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
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] Lab_Whiteboard.pas(381): E2003 Undeclared identifier: 'wwDBGridPlanDrawDataCell'}
//  AGrid.Canvas.TextRect( ARectProgressText, ARectProgressText.Left + 1, ARectProgressText.Top + 1, Format('%.0f%% ', [ AProgress ]));

  // progress bar background
  ARectProgress.Left  := Rect.Left + ALeftColumnWidth + 2;  // ARectProgressText.Right + 3;
  ARectProgress.Top   := Rect.Top + AUpperTextHeight + 6;
  ARectProgress.Right := Rect.Right - 3;
  ARectProgress.Bottom:= Rect.Bottom - 3;
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] Lab_Whiteboard.pas(381): E2003 Undeclared identifier: 'wwDBGridPlanDrawDataCell'}
  {AGrid.Canvas.Brush.Color:= cl3DLight;
  AGrid.Canvas.FillRect(ARectProgress);}

  // calculate the width of the progress bar
  ABarWidth:= Trunc((ARectProgress.Right - ARectProgress.Left + 1) / 100 * AProgress);
  if ABarWidth = 0 then
     ARectProgress.Right:= ARectProgress.Left  // + 1
  else if ARectProgress.Left + ABarWidth > ARectProgress.Right then
     // do nothing - keep current ARectProgress.Right
  else
     ARectProgress.Right:= ARectProgress.Left + ABarWidth;

  // progress bar color
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
  {if AProgress = 0 then
     AGrid.Canvas.Brush.Color:= clBlack

  else if AProgress <= FNormalThreshold then
     AGrid.Canvas.Brush.Color:= clGreen

  else if AProgress <= FBookedThreshold then
     AGrid.Canvas.Brush.Color:= clYellow

  else
     AGrid.Canvas.Brush.Color:= clRed;

  // finally!
  AGrid.Canvas.FillRect(ARectProgress);}
end;

procedure TFrmLabWhiteboard.DrawEmployeeTypeDetails(AGrid: TIQUniGridControl; Rect: TRect;  AEmpLevel, AMfgType, AMfgCell: string; AIncludeMfgCell: Boolean );
var
  ARow_1_Rect: TRect;
  ARow_2_Rect: TRect;
  ARow_3_Rect: TRect;
begin
  // Change font style
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
  //AGrid.Canvas.Font.Style:= AGrid.Canvas.Font.Style + [fsBold];

  // 1 row
  ARow_1_Rect.TopLeft:= Rect.TopLeft;
  ARow_1_Rect.Right  := Rect.Right;
  ARow_1_Rect.Bottom := ARow_1_Rect.Top + (Rect.Bottom - Rect.Top - cProgressBarHeight) div 3;
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
//  AGrid.Canvas.TextRect( ARow_1_Rect, ARow_1_Rect.Left + 1, ARow_1_Rect.Top + 1, AMfgType );

  // 2 row
  ARow_2_Rect.Top    := ARow_1_Rect.Bottom + 1;
  ARow_2_Rect.Left   := Rect.Left;
  ARow_2_Rect.Right  := Rect.Right;
  ARow_2_Rect.Bottom := ARow_2_Rect.Top + (Rect.Bottom - Rect.Top - cProgressBarHeight) div 3;
  if AIncludeMfgCell then
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
//     AGrid.Canvas.TextRect( ARow_2_Rect, ARow_2_Rect.Left + 1, ARow_2_Rect.Top + 1, AMfgCell);

  // Change font color and style
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
//  AGrid.Canvas.Font.Style:= AGrid.Canvas.Font.Style - [fsBold];

  // 3 row
  ARow_3_Rect.Top    := ARow_2_Rect.Bottom + 1;
  ARow_3_Rect.Left   := Rect.Left;
  ARow_3_Rect.Right  := Rect.Right;
  ARow_3_Rect.Bottom := Rect.Bottom;
  ARow_3_Rect.Bottom := ARow_3_Rect.Top + (Rect.Bottom - Rect.Top - cProgressBarHeight) div 3;
  { TODO -oSanketG -cWebConvert : Need to find alternative property Canvas in TIQUniGridControl}
//  AGrid.Canvas.TextRect( ARow_3_Rect, ARow_3_Rect.Left + 1, ARow_3_Rect.Top + 1, AEmpLevel );
end;

procedure TFrmLabWhiteboard.QryMonthlyBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('start_date').asDateTime:= GetStartDate();
  AssignQueryParamValue(DataSet, 'start_date', GetStartDate());
end;

{ TODO -oSanketG -cWebConvert : Need to revisit ,
[dcc32 Error] Lab_Whiteboard.pas(625): E2003 Undeclared identifier: 'wwDBGridPlanCalcCellColors'}
{procedure TFrmLabWhiteboard.wwDBGridPlanCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field = ActiveDataSet.FieldByName('EMP_LEVEL_CODE') then
     ABrush.Color:= clInfoBk;
end;}

procedure TFrmLabWhiteboard.AbortOnInsert(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmLabWhiteboard.QryMonthlyUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  AAction := eaApplied;
end;
{ TODO -oSanketG -cWebConvert : Need to revisit }
{procedure TFrmLabWhiteboard.CheckRefresh(Sender: TObject;  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    ApplyCriteria;
    ABORT;
  end;
end;}

procedure TFrmLabWhiteboard.RefreshActiveDataSet; // obsolete
var
  AMfgType     : string;
  AMfgCell_ID  : Real;
  AEmp_Level_ID: Real;
begin
  AEmp_Level_ID:= ActiveDataSet.FieldByName('EMP_LEVEL_ID').asFloat;
  AMfgType   := ActiveDataSet.FieldByName('MFGTYPE').asString;
  AMfgCell_ID:= ActiveDataSet.FieldByName('MFGCELL_ID').asFloat;
  Reopen( ActiveDataSet );

  if QueryByMfgTypeMfgCellEmployeeLevel1.Checked and (AMfgCell_ID > 0) then
     ActiveDataSet.Locate( 'EMP_LEVEL_ID;MFGTYPE;MFGCELL_ID', VarArrayOf([AEmp_Level_ID, AMfgType, AMfgCell_ID]), [])
  else
     ActiveDataSet.Locate( 'EMP_LEVEL_ID;MFGTYPE', VarArrayOf([AEmp_Level_ID, AMfgType]), []);

  UpdateGridPeriodsTitles;
end;

procedure TFrmLabWhiteboard.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmLabWhiteboard.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmLabWhiteboard.UpdateGridPeriodsTitles;
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
  end;}
end;

procedure TFrmLabWhiteboard.FormShow(Sender: TObject);
begin
  UpdateGridPeriodsTitles;
end;

function TFrmLabWhiteboard.ActiveDataSet: TFDQuery;
begin
  case GetViewType of
    cwMonthly:
      if QueryByMfgTypeMfgCellEmployeeLevel1.Checked then
         Result:= QryMonthly
      else
         Result:= QryMonthlyEx;
    cwWeekly :
      if QueryByMfgTypeMfgCellEmployeeLevel1.Checked then
         Result:= QryWeekly
      else
         Result:= QryWeeklyEx;
    cwDaily  :
      if QueryByMfgTypeMfgCellEmployeeLevel1.Checked then
         Result:= QryDaily
      else
         Result:= QryDailyEx;
  end;
end;

function TFrmLabWhiteboard.GetStartDate: TDateTime;
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

function TFrmLabWhiteboard.GetViewType: TCapacityWhiteboardView;
begin
  case wwDBComboBoxViewType.ItemIndex of
    0: Result:= cwMonthly;
    1: Result:= cwWeekly;
    2: Result:= cwDaily;
  end;
end;

procedure TFrmLabWhiteboard.sbtnApplyClick(Sender: TObject);
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


procedure TFrmLabWhiteboard.ApplyCriteria;
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
    AMfgCell_ID:= ActiveDataSet.FieldByName('MFGCELL_ID').asFloat;
  end;

  Reopen( ActiveDataSet );
  SrcCapacityPlan.DataSet:= ActiveDataSet;
  UpdateGridPeriodsTitles;

  if not AIsOpen then
     EXIT;

  LocateRecord( AMfgType, AMfgcell_ID, AEmp_Level_ID );
end;

procedure TFrmLabWhiteboard.sbtnBackClick(Sender: TObject);
begin
  MovePeriod( -1 {move 1 period back} );
end;

procedure TFrmLabWhiteboard.sbtnForwardClick(Sender: TObject);
begin
  MovePeriod( +1 {move 1 period forward} );
end;

procedure TFrmLabWhiteboard.MovePeriod( ADirection: Integer );
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


procedure TFrmLabWhiteboard.bbtnSearchClick(Sender: TObject);
var
  APkList: TIQWebHPick;
begin
  if QueryByMfgTypeMfgCellEmployeeLevel1.Checked then
     APkList:= PkType
  else
     APkList:= PkTypeEx;

  with APkList do
    if Execute then
    begin
      // if QueryByMfgTypeMfgCellEmployeeLevel1.Checked and (GetValue('MfgCell_ID') > 0) then
      //    ActiveDataSet.Locate( 'EMP_LEVEL_ID;MFGTYPE;MFGCELL_ID', VarArrayOf([ GetValue('EMP_LEVEL_ID'), GetValue('MFGTYPE'), GetValue('MFGCELL_ID')]), [])
      // else
      //    ActiveDataSet.Locate( 'EMP_LEVEL_ID;MFGTYPE', VarArrayOf([ GetValue('EMP_LEVEL_ID'), GetValue('MFGTYPE') ]), [])
      LocateRecord( GetValue('MFGTYPE'), GetValue('MFGCELL_ID'), GetValue('EMP_LEVEL_ID'));
    end
end;

procedure TFrmLabWhiteboard.wwDBComboBoxViewTypeChange(Sender: TObject);
begin
  QryMonthly.Close;
  QryMonthlyEx.Close;

  QryWeekly.Close;
  QryWeeklyEx.Close;

  QryDaily.Close;
  QryDailyEx.Close;
end;

procedure TFrmLabWhiteboard.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmLabWhiteboard.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmLabWhiteboard.QueryByMfgTypeEmployeeLevel1Click(Sender: TObject);
begin
  QueryByMfgTypeEmployeeLevel1.Checked:= TRUE;
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQMS.Common.Ctrl.AssignWWColumnTitle( wwDBGridPlan, 'EMP_LEVEL_CODE', 'MfgType ~ Employee Level');
  sbtnApplyClick( nil );
end;

procedure TFrmLabWhiteboard.QueryByMfgTypeMfgCellEmployeeLevel1Click(
  Sender: TObject);
begin
  QueryByMfgTypeMfgCellEmployeeLevel1.Checked:= TRUE;
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQMS.Common.Ctrl.AssignWWColumnTitle( wwDBGridPlan, 'EMP_LEVEL_CODE', 'MfgType / Mfgcell ~ Employee Level');
  sbtnApplyClick( nil );
end;

procedure TFrmLabWhiteboard.LocateRecord( AMfgType: string; AMfgcell_ID, AEmp_Level_ID: Real );
begin
  if not ActiveDataSet.Locate( 'MFGTYPE', AMfgType, []) then
     EXIT;

  while not ActiveDataSet.Eof and (AMfgType = ActiveDataSet.FieldByName('MFGTYPE').asString ) do
  begin
    if (AMfgCell_ID > 0) and (AEmp_Level_ID > 0) then
       begin
         if (AMfgCell_ID = ActiveDataSet.FieldByName('MFGCELL_ID').asFloat) and (AEmp_Level_ID = ActiveDataSet.FieldByName('EMP_LEVEL_ID').asFloat) then
            BREAK;
       end

    else if (AMfgCell_ID > 0) and (AEmp_Level_ID = 0) then
       begin
         if (AMfgCell_ID = ActiveDataSet.FieldByName('MFGCELL_ID').asFloat) and ( ActiveDataSet.FieldByName('EMP_LEVEL_ID').asFloat = 0) then
            BREAK;
       end

    else if (AMfgCell_ID = 0) and (AEmp_Level_ID > 0) then
       begin
         if (ActiveDataSet.FieldByName('MFGCELL_ID').asFloat <= 0) and (AEmp_Level_ID = ActiveDataSet.FieldByName('EMP_LEVEL_ID').asFloat) then
            BREAK;
       end

    else if (AMfgCell_ID = 0) and (AEmp_Level_ID = 0) then
       begin
         if (0 = ActiveDataSet.FieldByName('MFGCELL_ID').asFloat) and (0 = ActiveDataSet.FieldByName('EMP_LEVEL_ID').asFloat) then
            BREAK;
       end;


    ActiveDataSet.Next;
  end;
end;

end.
