unit AssyGroup_Lab_Whiteboard;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Buttons,
  vcl.Wwdbdatetimepicker,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.Hpick,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, uniMainMenu, uniDateTimePicker, uniDBDateTimePicker, IQUniGrid,
  uniGUIFrame;

type
  TFrmAssyGroupLabWhiteboard = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    gridMfgtype: TIQUniGridControl;
    Panel8: TUniPanel;
    gridEmpLevel: TIQUniGridControl;
    Splitter2: TUniSplitter;
    Panel10: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Splitter3: TUniSplitter;
    Panel11: TUniPanel;
    wwDBDateTimePickerStartDate: TUniDBDateTimePicker;
    edActualHours: TUniEdit;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Label3: TUniLabel;
    edDeltaFromActual: TUniEdit;
    Panel1: TUniPanel;
    Panel12: TUniPanel;
    Splitter4: TUniSplitter;
    Panel13: TUniPanel;
    Panel14: TUniPanel;
    gridMfgCell: TIQUniGridControl;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel15: TUniPanel;
    Panel16: TUniPanel;
    sbtnApply: TUniSpeedButton;
    Panel9: TUniPanel;
    SrcMfgtype: TDataSource;
    SrcMfgCell: TDataSource;
    SrcEmpLevel: TDataSource;
    QryMfgtype: TFDQuery;
    QryMfgCell: TFDQuery;
    QryEmpLevel: TFDQuery;
    QryMfgtypeID: TBCDField;
    QryMfgtypeBATCH: TBCDField;
    QryMfgtypeSOURCE: TStringField;
    QryMfgtypeMFGTYPE: TStringField;
    QryMfgtypeDESCRIP: TStringField;
    QryMfgCellID: TBCDField;
    QryMfgCellBATCH: TBCDField;
    QryMfgCellSOURCE: TStringField;
    QryMfgCellMFGCELL_ID: TBCDField;
    QryMfgCellMFGCELL: TStringField;
    QryMfgCellDESCRIP: TStringField;
    QryEmpLevelID: TBCDField;
    QryEmpLevelBATCH: TBCDField;
    QryEmpLevelSOURCE: TStringField;
    QryEmpLevelEMP_LEVEL_ID: TBCDField;
    QryEmpLevelCODE: TStringField;
    QryEmpLevelDESCRIP: TStringField;
    PkMfgType: TIQWebHPick;
    PkMfgTypeMFGTYPE: TStringField;
    PkMfgTypeDESCRIP: TStringField;
    PkMfgCell: TIQWebHPick;
    PkMfgCellMFGCELL: TStringField;
    PkMfgCellID: TBCDField;
    PkMfgCellMFGTYPE: TStringField;
    PkMfgCellEPLANT_ID: TBCDField;
    PkEmpLevel: TIQWebHPick;
    PkEmpLevelID: TBCDField;
    PkEmpLevelCODE: TStringField;
    PkEmpLevelDESCRIP: TStringField;
    Splitter1: TUniSplitter;
    SrcDaily: TDataSource;
    QryDaily: TFDQuery;
    QryDailyMFGTYPE: TStringField;
    QryDailyMFGCELL: TStringField;
    QryDailyMFGCELL_ID: TBCDField;
    QryDailyPeriod1: TFloatField;
    QryDailyPeriod2: TFloatField;
    QryDailyPeriod3: TFloatField;
    QryDailyPeriod4: TFloatField;
    QryDailyPeriod5: TFloatField;
    QryDailyCNTR_TYPE: TStringField;
    QryDailyEPLANT_ID: TBCDField;
    QryDailyHRS_INITIATED_1: TFMTBCDField;
    QryDailyHRS_PLANNED_1: TFMTBCDField;
    QryDailyHRS_UNSCHED_1: TFMTBCDField;
    QryDailyHRS_INITIATED_2: TFMTBCDField;
    QryDailyHRS_PLANNED_2: TFMTBCDField;
    QryDailyHRS_UNSCHED_2: TFMTBCDField;
    QryDailyHRS_INITIATED_3: TFMTBCDField;
    QryDailyHRS_PLANNED_3: TFMTBCDField;
    QryDailyHRS_UNSCHED_3: TFMTBCDField;
    QryDailyHRS_INITIATED_4: TFMTBCDField;
    QryDailyHRS_PLANNED_4: TFMTBCDField;
    QryDailyHRS_UNSCHED_4: TFMTBCDField;
    QryDailyHRS_INITIATED_5: TFMTBCDField;
    QryDailyHRS_PLANNED_5: TFMTBCDField;
    QryDailyHRS_UNSCHED_5: TFMTBCDField;
    wwDBGridPlan: TIQUniGridControl;
    Panel17: TUniPanel;
    sbtnBack: TUniSpeedButton;
    sbtnForward: TUniSpeedButton;
    wwDBGridTotals: TIQUniGridControl;
    QryTotals: TFDQuery;
    SrcTotals: TDataSource;
    QryTotalsTITLE: TStringField;
    QryTotalsPeriod1: TFMTBCDField;
    QryTotalsPeriod2: TFMTBCDField;
    QryTotalsPeriod3: TFMTBCDField;
    QryTotalsPeriod4: TFMTBCDField;
    QryTotalsPeriod5: TFMTBCDField;
    QryTotalsHrs_Initiated_1: TFMTBCDField;
    QryTotalsHrs_Initiated_2: TFMTBCDField;
    QryTotalsHrs_Initiated_3: TFMTBCDField;
    QryTotalsHrs_Initiated_4: TFMTBCDField;
    QryTotalsHrs_Initiated_5: TFMTBCDField;
    QryTotalsHrs_Planned_1: TFMTBCDField;
    QryTotalsHrs_Planned_2: TFMTBCDField;
    QryTotalsHrs_Planned_3: TFMTBCDField;
    QryTotalsHrs_Planned_4: TFMTBCDField;
    QryTotalsHrs_Planned_5: TFMTBCDField;
    QryTotalsHrs_Unsched_1: TFMTBCDField;
    QryTotalsHrs_Unsched_2: TFMTBCDField;
    QryTotalsHrs_Unsched_3: TFMTBCDField;
    QryTotalsHrs_Unsched_4: TFMTBCDField;
    QryTotalsHrs_Unsched_5: TFMTBCDField;
    QryTotalsTotal_1: TFMTBCDField;
    QryTotalsTotal_2: TFMTBCDField;
    QryTotalsTotal_3: TFMTBCDField;
    QryTotalsTotal_4: TFMTBCDField;
    QryTotalsTotal_5: TFMTBCDField;
    QryTotalsStandard_1: TFMTBCDField;
    QryTotalsStandard_2: TFMTBCDField;
    QryTotalsStandard_3: TFMTBCDField;
    QryTotalsStandard_4: TFMTBCDField;
    QryTotalsStandard_5: TFMTBCDField;
    QryTotalsDelta_1: TFMTBCDField;
    QryTotalsDelta_2: TFMTBCDField;
    QryTotalsDelta_3: TFMTBCDField;
    QryTotalsDelta_4: TFMTBCDField;
    QryTotalsDelta_5: TFMTBCDField;
    QryStandardTotalHrs: TFDQuery;
    QryStandardTotalHrsHRS_AVAIL: TFMTBCDField;
    Splitter5: TUniSplitter;
    Contents1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApplyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QryMfgtypeBeforeOpen(DataSet: TDataSet);
    { TODO -oSanketG -cWC : Need to find equivalent component for TNavigateBtn }
    {procedure navMfgTypeBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure navMfgCellBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure navEmpLevelBeforeAction(Sender: TObject; Button: TNavigateBtn);}
    procedure PkMfgCellBeforeOpen(DataSet: TDataSet);
    procedure QryDailyBeforeOpen(DataSet: TDataSet);
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] AssyGroup_Lab_Whiteboard.pas(208): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure wwDBGridPlanCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure wwDBGridPlanDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);}
    procedure sbtnForwardClick(Sender: TObject);
    procedure sbtnBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryTotalsCalcFields(DataSet: TDataSet);
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] AssyGroup_Lab_Whiteboard.pas(216): E2005 'TGridDrawState' is not a type identifier}
    {procedure wwDBGridTotalsDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);}
    procedure edActualHoursChange(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FBatch: Integer;
    FDayOffset: Integer;
    FTotalActualHours: Real;

    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure AddEmpLevel;
    procedure AddMfgCell;
    procedure AddMfgType;
    procedure ApplyCriteriaShell;
    procedure DrawPeriodInGrid(AGrid: TIQUniGridControl; Rect: TRect; AInitiated,
      APlanned, AUnsched: Real);
    procedure DrawCenterTypeDetails(AGrid: TIQUniGridControl; Rect: TRect; ACntrType,
      AMfgType, AMfgCell: string);
    procedure MovePeriod(ADirection: Integer);
    procedure RefreshQuery;
    procedure ReopenQuery;
    procedure LocateRecord(ACntrType, AMfgType: string; AMfgcell_ID: Real);
    procedure UpdateGridPeriodsTitles;
    procedure DrawTotalPeriodInGrid(AGrid: TIQUniGridControl; Rect: TRect; AInitiated,
      APlanned, AUnsched, ATotal, AStandard, ADelta: Real);
    procedure DrawTitleDetailsTotal(AGrid: TIQUniGridControl; Rect: TRect; ATitle: string);
    procedure DisplayDelatActualHours;
  public
    { Public declarations }
    class procedure DoShow( );
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg,
  IQMS.Common.HelpHook;

const
 cnstAddMfgType = 1;
 cnstAddMfgCell = 2;
 cnstAddEmpLevel = 3;

 cnstTextWidthSample = 'Standard ';


class procedure TFrmAssyGroupLabWhiteboard.DoShow();
var
  FrmAssyGroupLabWhiteboard: TFrmAssyGroupLabWhiteboard;
begin
  FrmAssyGroupLabWhiteboard := TFrmAssyGroupLabWhiteboard.Create( uniGUIApplication.UniApplication );
  FrmAssyGroupLabWhiteboard.Show;
end;

procedure TFrmAssyGroupLabWhiteboard.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, Panel3, Panel6, Panel13 ]);
end;

procedure TFrmAssyGroupLabWhiteboard.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAssyGroupLabWhiteboard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Panel3, Panel6, Panel13 ]);
end;

procedure TFrmAssyGroupLabWhiteboard.FormDestroy(Sender: TObject);
begin
  ExecuteCommandFmt('delete from work_day_hrs where batch = %d', [ FBatch ]);
end;

procedure TFrmAssyGroupLabWhiteboard.FormShow(Sender: TObject);
begin
  wwDBDateTimePickerStartDate.DateTime:= Date;
  FBatch:= SelectValueAsInteger('select s_work_day_hrs.nextval from dual');

  IQSetTablesActive( true, self );
  UpdateGridPeriodsTitles;
end;

procedure TFrmAssyGroupLabWhiteboard.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    cnstAddMfgType : AddMfgType;
    cnstAddMfgCell : AddMfgCell;
    cnstAddEmpLevel: AddEmpLevel;
  end;
end;

{ TODO -oSanketG -cWC : Need to revisit, dependent on  TNavigateBtn}
{procedure TFrmAssyGroupLabWhiteboard.navEmpLevelBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
    PostMessage( Handle, iq_Notify, cnstAddEmpLevel, 0 );
    ABORT;
  end;
end;

procedure TFrmAssyGroupLabWhiteboard.navMfgCellBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
    PostMessage( Handle, iq_Notify, cnstAddMfgCell, 0 );
    ABORT;
  end;
end;

procedure TFrmAssyGroupLabWhiteboard.navMfgTypeBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
    PostMessage( Handle, iq_Notify, cnstAddMfgType, 0 );
    ABORT;
  end;
end;}

procedure TFrmAssyGroupLabWhiteboard.PkMfgCellBeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('batch').asInteger:= FBatch;
  AssignQueryParamValue(DataSet, 'batch', FBatch);
end;

procedure TFrmAssyGroupLabWhiteboard.QryDailyBeforeOpen(DataSet: TDataSet);
begin
  //with DataSet as TFDQuery do
  //begin
  //  ParamByName('start_date').asDateTime:= wwDBDateTimePickerStartDate.Date + FDayOffset;
  //  ParamByName('batch').asInteger:= FBatch;
  //end;
  AssignQueryParamValue(DataSet, 'start_date', wwDBDateTimePickerStartDate.DateTime + FDayOffset);
  AssignQueryParamValue(DataSet, 'batch', FBatch);
end;

procedure TFrmAssyGroupLabWhiteboard.QryMfgtypeBeforeOpen(DataSet: TDataSet);
begin
  //TFDQuery(DataSet).ParamByName('batch').asInteger:= FBatch;
  AssignQueryParamValue(DataSet, 'batch', FBatch);
end;

procedure TFrmAssyGroupLabWhiteboard.sbtnApplyClick(Sender: TObject);
var
  hMesg: TPanelMesg;
begin
  IQAssert( wwDBDateTimePickerStartDate.DateTime > 0, 'Start Date must be specified - operation aborted.');

  hMesg:= hPleaseWait('');
  try
    ApplyCriteriaShell;
  finally
    hMesg.Free;
  end;
end;

procedure TFrmAssyGroupLabWhiteboard.sbtnBackClick(Sender: TObject);
begin
  FDayOffset:= FDayOffset - 1;
  MovePeriod( -1 {move 1 period back} );
end;

procedure TFrmAssyGroupLabWhiteboard.sbtnForwardClick(Sender: TObject);
begin
  FDayOffset:= FDayOffset + 1;
  MovePeriod( +1 {move 1 period forward} );
end;

{ TODO -oSanketG -cWC : Need to revisit ,
[dcc32 Error] AssyGroup_Lab_Whiteboard.pas(404): E2003 Undeclared identifier: 'wwDBGridPlanCalcCellColors'}
{procedure TFrmAssyGroupLabWhiteboard.wwDBGridPlanCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field = QryDailyCNTR_TYPE then
     ABrush.Color:= clInfoBk;
end;}

{ TODO -oSanketG -cWC : Need to revisit ,
[dcc32 Error] AssyGroup_Lab_Whiteboard.pas(414): E2003 Undeclared identifier: 'wwDBGridPlanDrawDataCell'}
{procedure TFrmAssyGroupLabWhiteboard.wwDBGridPlanDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if (Field.FieldName = 'Period1') then
     DrawPeriodInGrid( wwDBGridPlan,
                       Rect,
                       QryDaily.FieldByName('HRS_INITIATED_1').asFloat,
                       QryDaily.FieldByName('HRS_PLANNED_1').asFloat,
                       QryDaily.FieldByName('HRS_UNSCHED_1').asFloat )

  else if (Field.FieldName = 'Period2') then
     DrawPeriodInGrid( wwDBGridPlan,
                       Rect,
                       QryDaily.FieldByName('HRS_INITIATED_2').asFloat,
                       QryDaily.FieldByName('HRS_PLANNED_2').asFloat,
                       QryDaily.FieldByName('HRS_UNSCHED_2').asFloat )

  else if (Field.FieldName = 'Period3') then
     DrawPeriodInGrid( wwDBGridPlan,
                       Rect,
                       QryDaily.FieldByName('HRS_INITIATED_3').asFloat,
                       QryDaily.FieldByName('HRS_PLANNED_3').asFloat,
                       QryDaily.FieldByName('HRS_UNSCHED_3').asFloat )

  else if (Field.FieldName = 'Period4') then
     DrawPeriodInGrid( wwDBGridPlan,
                       Rect,
                       QryDaily.FieldByName('HRS_INITIATED_4').asFloat,
                       QryDaily.FieldByName('HRS_PLANNED_4').asFloat,
                       QryDaily.FieldByName('HRS_UNSCHED_4').asFloat )

  else if (Field.FieldName = 'Period5') then
     DrawPeriodInGrid( wwDBGridPlan,
                       Rect,
                       QryDaily.FieldByName('HRS_INITIATED_5').asFloat,
                       QryDaily.FieldByName('HRS_PLANNED_5').asFloat,
                       QryDaily.FieldByName('HRS_UNSCHED_5').asFloat )

  else if Field.FieldName = 'CNTR_TYPE' then
     DrawCenterTypeDetails( wwDBGridPlan,
                            Rect,
                            QryDaily.FieldByName('CNTR_TYPE').asString,
                            QryDaily.FieldByName('MFGTYPE').asString,
                            QryDaily.FieldByName('MFGCELL').asString )

  else
     wwDBGridPlan.DefaultDrawDataCell( Rect, Field, State );

end;}

procedure TFrmAssyGroupLabWhiteboard.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmAssyGroupLabWhiteboard.AddMfgType;
var
  I: Integer;

  procedure _CheckAdd( Value: string );
  begin
    if SelectValueFmtAsInteger('select 1 from gtt_criteria where batch = %d and source = ''MFGTYPE'' and csource_id = ''%s''',
                               [ FBatch,
                                 Value ] ) = 1 then
       EXIT;

    ExecuteCommandFmt('insert into gtt_criteria( batch, source, csource_id ) values( %d, ''MFGTYPE'', ''%s'')',
                      [ FBatch,
                        Value ]);
  end;

begin
  with PkMfgType do
  begin
    if ExecuteEx('mfgtype') then
      for I:= 0 to ResultList.Count - 1 do
        _CheckAdd( ResultList[ I ]);
  end;
  QryMfgType.Refresh;
end;

procedure TFrmAssyGroupLabWhiteboard.AddMfgCell;
var
  I: Integer;
  Bk: TBookmark;

  procedure _CopyToBDETable;
  begin
    if QryMfgType.Eof and QryMfgType.Bof then
       EXIT;

    ExecuteCommandFmt('delete from gtt_criteria where batch = %d and source = ''MFGTYPE''', [ FBatch ]);
    with QryMfgType do
    begin
      bk:= QryMfgType.GetBookMark;
      DisableControls;
      try
        First;
        while not Eof do
        begin
          ExecuteCommandFmt('insert into gtt_criteria( batch, source, csource_id ) values( %d, ''MFGTYPE'', ''%s'')',
                    [ FBatch, QryMfgTypeMFGTYPE.asString ]);
          Next;
        end;
      finally
        QryMfgType.GotoBookMark(bk);
        QryMfgType.FreeBookMark(bk);
        EnableControls;
      end;
    end;
  end;

  procedure _CheckAdd( Value: Integer );
  begin
    if SelectValueFmtAsInteger('select 1 from gtt_criteria where batch = %d and source = ''MFGCELL'' and nsource_id = %d',
                               [ FBatch,
                                 Value ] ) = 1 then
       EXIT;

    ExecuteCommandFmt('insert into gtt_criteria( batch, source, nsource_id ) values( %d, ''MFGCELL'', %d )',
                      [ FBatch,
                        Value ]);
  end;

begin
  // because HPick is BDE based wee need to copy gtt_criteria
  _CopyToBDETable;

  with PkMfgCell do
  begin
    if ExecuteEx('id') then
      for I:= 0 to ResultList.Count - 1 do
        _CheckAdd( StrToInt(ResultList[ I ]));
  end;
  QryMfgCell.Refresh;
end;


procedure TFrmAssyGroupLabWhiteboard.AddEmpLevel;
var
  I: Integer;

  procedure _CheckAdd( Value: Integer );
  begin
    if SelectValueFmtAsInteger('select 1 from gtt_criteria where batch = %d and source = ''EMP_LEVEL'' and nsource_id = %d',
                               [ FBatch,
                                 Value ] ) = 1 then
       EXIT;

    ExecuteCommandFmt('insert into gtt_criteria( batch, source, nsource_id ) values( %d, ''EMP_LEVEL'', %d )',
                      [ FBatch,
                        Value ]);
  end;

begin
  with PkEmpLevel do
  begin
    if ExecuteEx('id') then
      for I:= 0 to ResultList.Count - 1 do
        _CheckAdd( StrToInt(ResultList[ I ]));
  end;
  QryEmpLevel.Refresh;
end;


procedure TFrmAssyGroupLabWhiteboard.ApplyCriteriaShell;
begin
  ExecuteCommandFmt('begin                                             '+
                    '  iqcapacity.load_sandbox_workorders_labor( %d ); '+
                    'end;                                              ',
                    [ FBatch ]);

  FDayOffset:= 0;
  edDeltaFromActual.Text:= '';
  FTotalActualHours:= 0;
  edDeltaFromActual.Brush.Color:= clBtnFace;
  ReopenQuery;
end;


procedure TFrmAssyGroupLabWhiteboard.DrawPeriodInGrid( AGrid: TIQUniGridControl; Rect: TRect; AInitiated, APlanned, AUnsched: Real );
var
  ARectLabelInit    : TRect;
  ARectLabelPlan    : TRect;
  ARectLabelUnsched : TRect;

  ARectTextInit     : TRect;
  ARectTextPlan     : TRect;
  ARectTextUnsched  : TRect;

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
  // prepare
  AUpperTextHeight:=  Rect.Bottom - Rect.Top;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //ALeftColumnWidth:=  AGrid.Canvas.TextWidth(cnstTextWidthSample ) + 4;

  // Label Initiated
  ARectLabelInit.TopLeft:= Rect.TopLeft;
  ARectLabelInit.Bottom := ARectLabelInit.Top + AUpperTextHeight div 3;
  ARectLabelInit.Right  := ARectLabelInit.Left + ALeftColumnWidth - 1;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //AGrid.Canvas.TextRect( ARectLabelInit, ARectLabelInit.Left + 1, ARectLabelInit.Top + 1, 'Initiated ' );

  // Text Initiated
  ARectTextInit.Top     := ARectLabelInit.Top;
  ARectTextInit.Left    := ARectLabelInit.Right + 2;
  ARectTextInit.Bottom  := ARectLabelInit.Bottom;
  ARectTextInit.Right   := Rect.Right - 1;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  {AGrid.Canvas.TextRect( ARectTextInit, ARectTextInit.Left + 1, ARectTextInit.Top + 1, NumToStr( AInitiated ));
  AGrid.Canvas.Font.Color:= clBlack;}

  // Label Planned
  ARectLabelPlan.Left   := Rect.Left;
  ARectLabelPlan.Top    := ARectTextInit.Bottom + 1;
  ARectLabelPlan.Bottom := Rect.Top + AUpperTextHeight div 3 * 2;
  ARectLabelPlan.Right  := ARectLabelPlan.Left + ALeftColumnWidth - 1;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //AGrid.Canvas.TextRect( ARectLabelPlan, ARectLabelPlan.Left + 1, ARectLabelPlan.Top + 1, 'Planned ' );

  // Text Planned
  ARectTextPlan.Top     := ARectLabelPlan.Top;
  ARectTextPlan.Left    := ARectLabelPlan.Right + 2;
  ARectTextPlan.Bottom  := ARectLabelPlan.Bottom;
  ARectTextPlan.Right   := Rect.Right - 1;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //AGrid.Canvas.TextRect( ARectTextPlan, ARectTextPlan.Left + 1, ARectTextPlan.Top + 1, NumToStr( APlanned ));

  // Label Unsched
  ARectLabelUnsched.Left   := Rect.Left;
  ARectLabelUnsched.Top    := ARectLabelPlan.Bottom + 1;
  ARectLabelUnsched.Bottom := Rect.Top + AUpperTextHeight;
  ARectLabelUnsched.Right  := ARectLabelUnsched.Left + ALeftColumnWidth - 1;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //AGrid.Canvas.TextRect( ARectLabelUnsched, ARectLabelUnsched.Left + 1, ARectLabelUnsched.Top + 1, 'Unsched ' );

  // Text SetupHrs
  ARectTextUnsched.Top    := ARectLabelUnsched.Top;
  ARectTextUnsched.Left   := ARectLabelUnsched.Right + 2;
  ARectTextUnsched.Bottom := ARectLabelUnsched.Bottom;
  ARectTextUnsched.Right  := Rect.Right - 1;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  {AGrid.Canvas.TextRect( ARectTextUnsched, ARectTextUnsched.Left + 1, ARectTextUnsched.Top + 1, NumToStr( AUnsched ));

  // vertical separator line
  AGrid.Canvas.Pen.Color:= clSilver;
  AGrid.Canvas.MoveTo( ARectLabelUnsched.Left + ALeftColumnWidth, Rect.Top );
  AGrid.Canvas.LineTo( ARectLabelUnsched.Left + ALeftColumnWidth, Rect.Top + AUpperTextHeight + 2);}
end;


procedure TFrmAssyGroupLabWhiteboard.DrawCenterTypeDetails(AGrid: TIQUniGridControl; Rect: TRect;  ACntrType, AMfgType, AMfgCell: string );
var
  ARow_1_Rect: TRect;
  ARow_2_Rect: TRect;
  ARow_3_Rect: TRect;
begin
  // Change font style
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //AGrid.Canvas.Font.Style:= AGrid.Canvas.Font.Style + [fsBold];

  // 1 row
  ARow_1_Rect.TopLeft:= Rect.TopLeft;
  ARow_1_Rect.Right  := Rect.Right;
  ARow_1_Rect.Bottom := ARow_1_Rect.Top + (Rect.Bottom - Rect.Top ) div 3;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //AGrid.Canvas.TextRect( ARow_1_Rect, ARow_1_Rect.Left + 1, ARow_1_Rect.Top + 1, ACntrType );

  // Change font color and style
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //AGrid.Canvas.Font.Style:= AGrid.Canvas.Font.Style - [fsBold];

  // 2 row
  ARow_2_Rect.Top    := ARow_1_Rect.Bottom + 1;
  ARow_2_Rect.Left   := Rect.Left;
  ARow_2_Rect.Right  := Rect.Right;
  ARow_2_Rect.Bottom := ARow_2_Rect.Top + (Rect.Bottom - Rect.Top ) div 3;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //AGrid.Canvas.TextRect( ARow_2_Rect, ARow_2_Rect.Left + 1, ARow_2_Rect.Top + 1, '  Mfg Type: ' + AMfgType);

  // 3 row
  ARow_3_Rect.Top    := ARow_2_Rect.Bottom + 1;
  ARow_3_Rect.Left   := Rect.Left;
  ARow_3_Rect.Right  := Rect.Right;
  ARow_3_Rect.Bottom := Rect.Bottom;
  ARow_3_Rect.Bottom := ARow_3_Rect.Top + (Rect.Bottom - Rect.Top ) div 3;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //AGrid.Canvas.TextRect( ARow_3_Rect, ARow_3_Rect.Left + 1, ARow_3_Rect.Top + 1, '  Mfg Cell: ' + AMfgCell );
end;


procedure TFrmAssyGroupLabWhiteboard.MovePeriod( ADirection: Integer );
begin
  // wwDBDateTimePickerStartDate.Date:= wwDBDateTimePickerStartDate.Date + ADirection;  // +1/-1
  RefreshQuery;
end;

procedure TFrmAssyGroupLabWhiteboard.RefreshQuery;
var
  AIsOpen: Boolean;
  ACntrType: string;
  AMfgType: string;
  AMfgCell_ID: Real;
begin
  AIsOpen:= QryDaily.Active;

  if AIsOpen then
  begin
    ACntrType  := QryDaily.FieldByName('CNTR_TYPE').asString;
    AMfgType   := QryDaily.FieldByName('MFGTYPE').asString;
    AMfgCell_ID:= QryDaily.FieldByName('MFGCELL_ID').asFloat;
  end;

  ReopenQuery;

  if not AIsOpen then
     EXIT;

  LocateRecord( ACntrType, AMfgType, AMfgcell_ID );
end;


procedure TFrmAssyGroupLabWhiteboard.LocateRecord( ACntrType, AMfgType: string; AMfgCell_ID: Real );
begin
  if not QryDaily.Locate( 'CNTR_TYPE', ACntrType, []) then
     EXIT;

  while not QryDaily.Eof and (ACntrType = QryDaily.FieldByName('CNTR_TYPE').asString ) do
  begin
    if AMfgCell_ID > 0 then
       begin
         if (AMfgType = QryDaily.FieldByName('MFGTYPE').asString) and (AMfgCell_ID = QryDaily.FieldByName('MFGCELL_ID').asInteger) then
            BREAK;
       end

    else if AMfgCell_ID = 0 then
       begin
         if (AMfgType = QryDaily.FieldByName('MFGTYPE').asString) then
            BREAK;
       end;

    QryDaily.Next;
  end;
end;

procedure TFrmAssyGroupLabWhiteboard.UpdateGridPeriodsTitles;
var
  AStart_Date: TDateTime;

  function GetColumnTitle( ADate1, ADate2: TDateTime ): string;
  begin
    // Result:= Format('From %s~Thru %s', [ DateToStr( ADate1 ), DateToStr( ADate2 ) ]);
    Result:= Format('%s', [ DateToStr( ADate1 ) ]);
  end;

begin
  AStart_Date:= wwDBDateTimePickerStartDate.DateTime + FDayOffset;
  { TODO -oSanketG -cWC : Need to find alternative for ColumnByName in TIQUniGridControl }
  {wwDBGridPlan.ColumnByName('Period1').DisplayLabel:= GetColumnTitle(AStart_Date,      AStart_Date    );
  wwDBGridPlan.ColumnByName('Period2').DisplayLabel:= GetColumnTitle(AStart_Date + 1,  AStart_Date + 1);
  wwDBGridPlan.ColumnByName('Period3').DisplayLabel:= GetColumnTitle(AStart_Date + 2,  AStart_Date + 2);
  wwDBGridPlan.ColumnByName('Period4').DisplayLabel:= GetColumnTitle(AStart_Date + 3,  AStart_Date + 3);
  wwDBGridPlan.ColumnByName('Period5').DisplayLabel:= GetColumnTitle(AStart_Date + 4,  AStart_Date + 4);}
end;

procedure TFrmAssyGroupLabWhiteboard.ReopenQuery;
begin
  QryDaily.Close;
  QryDaily.Open;

  QryTotals.Close;
  QryTotals.Open;

  UpdateGridPeriodsTitles;
end;


procedure TFrmAssyGroupLabWhiteboard.QryTotalsCalcFields(DataSet: TDataSet);
var
  Bk: TBookMark;
  AActHrs: Real;

  procedure _Sum( AName: string );
  var
    I: Integer;
    AFieldName: string;
  begin
    for I:= 1 to 5 do
    begin
      AFieldName:= Format('%s_%d', [ AName, I ]);
      QryTotals.FieldByName( AFieldName ).asBCD:= QryTotals.FieldByName( AFieldName ).asBCD
                                                  +
                                                  QryDaily.FieldByName( AFieldName ).asBCD;
    end;
  end;

  procedure _SumTotal;
  var
    I: Integer;
    AFieldName: string;
  begin
    for I:= 1 to 5 do
    begin
      AFieldName:= Format('total_%d', [ I ]);
      QryTotals.FieldByName( AFieldName ).asBCD:= QryTotals.FieldByName( AFieldName ).asBCD
                                                  +
                                                  QryTotals.FieldByName( Format('hrs_initiated_%d', [ I ]) ).asBCD
                                                  +
                                                  QryTotals.FieldByName( Format('hrs_planned_%d', [ I ]) ).asBCD
                                                  +
                                                  QryTotals.FieldByName( Format('hrs_unsched_%d', [ I ]) ).asBCD
    end;
  end;

  procedure _AssignStandard;
  var
    I: Integer;
    ADayOfWeek: Integer;
  begin
    with QryStandardTotalHrs do
    begin
      for I:= 1 to 5 do
      begin
        Close;
        ADayOfWeek:= SelectValueFmtAsInteger('select iqcalendar.day_of_week( to_date( ''%s'', ''mm/dd/yyyy hh24:mi:ss'' )) from dual',
                                             [ FormatDateTime( 'mm/dd/yyyy hh:nn:ss', wwDBDateTimePickerStartDate.DateTime + FDayOffset + I - 1 )]);

        ParamByName('batch').asInteger:= FBatch;
        ParamByName('day').asInteger:= ADayOfWeek;
        Open;

        QryTotals.FieldByName( Format('standard_%d', [ I ])).asBCD:= QryStandardTotalHrsHRS_AVAIL.asBCD;
      end;
    end;
  end;

  procedure _AssignDelta;
  var
    I: Integer;
    AFieldName: string;
  begin
    for I:= 1 to 5 do
    begin
      AFieldName:= Format('delta_%d', [ I ]);
      QryTotals.FieldByName( AFieldName ).asBCD:= QryTotals.FieldByName( Format('standard_%d', [I])).asBCD
                                                  -
                                                  QryTotals.FieldByName( Format('total_%d', [I])).asBCD;
    end;
  end;

begin
  with QryDaily do
  begin
    if State = dsInactive then EXIT;

    Bk:= GetBookMark;
    DisableControls;
    try
      First;
      while not Eof do
      begin
        _Sum('hrs_initiated');
        _Sum('hrs_planned');
        _Sum('hrs_unsched');
        Next;
      end;
    finally
      GotoBookMark( Bk );
      FreeBookMark( Bk );
      EnableControls;
    end;
  end;

  _SumTotal;

  _AssignStandard;

  _AssignDelta;

  if (FDayOffset = 0) then
  begin
    FTotalActualHours:= QryTotals.FieldByName('total_1').asFloat;
    DisplayDelatActualHours;
  end;
end;

{ TODO -oSanketG -cWC : Need to revisit ,
[dcc32 Error] AssyGroup_Lab_Whiteboard.pas(916): E2003 Undeclared identifier: 'wwDBGridTotalsDrawDataCell'}
{procedure TFrmAssyGroupLabWhiteboard.wwDBGridTotalsDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if (Field.FieldName = 'Period1') then
     DrawTotalPeriodInGrid( wwDBGridTotals,
                            Rect,
                            QryTotals.FieldByName('HRS_INITIATED_1').asFloat,
                            QryTotals.FieldByName('HRS_PLANNED_1').asFloat,
                            QryTotals.FieldByName('HRS_UNSCHED_1').asFloat,
                            QryTotals.FieldByName('TOTAL_1').asFloat,
                            QryTotals.FieldByName('STANDARD_1').asFloat,
                            QryTotals.FieldByName('DELTA_1').asFloat )

  else if (Field.FieldName = 'Period2') then
     DrawTotalPeriodInGrid( wwDBGridTotals,
                            Rect,
                            QryTotals.FieldByName('HRS_INITIATED_2').asFloat,
                            QryTotals.FieldByName('HRS_PLANNED_2').asFloat,
                            QryTotals.FieldByName('HRS_UNSCHED_2').asFloat,
                            QryTotals.FieldByName('TOTAL_2').asFloat,
                            QryTotals.FieldByName('STANDARD_2').asFloat,
                            QryTotals.FieldByName('DELTA_2').asFloat )

  else if (Field.FieldName = 'Period3') then
     DrawTotalPeriodInGrid( wwDBGridTotals,
                            Rect,
                            QryTotals.FieldByName('HRS_INITIATED_3').asFloat,
                            QryTotals.FieldByName('HRS_PLANNED_3').asFloat,
                            QryTotals.FieldByName('HRS_UNSCHED_3').asFloat,
                            QryTotals.FieldByName('TOTAL_3').asFloat,
                            QryTotals.FieldByName('STANDARD_3').asFloat,
                            QryTotals.FieldByName('DELTA_3').asFloat )

  else if (Field.FieldName = 'Period4') then
     DrawTotalPeriodInGrid( wwDBGridTotals,
                            Rect,
                            QryTotals.FieldByName('HRS_INITIATED_4').asFloat,
                            QryTotals.FieldByName('HRS_PLANNED_4').asFloat,
                            QryTotals.FieldByName('HRS_UNSCHED_4').asFloat,
                            QryTotals.FieldByName('TOTAL_4').asFloat,
                            QryTotals.FieldByName('STANDARD_4').asFloat,
                            QryTotals.FieldByName('DELTA_4').asFloat )

  else if (Field.FieldName = 'Period5') then
     DrawTotalPeriodInGrid( wwDBGridTotals,
                            Rect,
                            QryTotals.FieldByName('HRS_INITIATED_5').asFloat,
                            QryTotals.FieldByName('HRS_PLANNED_5').asFloat,
                            QryTotals.FieldByName('HRS_UNSCHED_5').asFloat,
                            QryTotals.FieldByName('TOTAL_5').asFloat,
                            QryTotals.FieldByName('STANDARD_5').asFloat,
                            QryTotals.FieldByName('DELTA_5').asFloat )


  else if Field.FieldName = 'TITLE' then
     DrawTitleDetailsTotal( wwDBGridTotals,
                            Rect,
                            QryTotals.FieldByName('TITLE').asString )

  else
     wwDBGridPlan.DefaultDrawDataCell( Rect, Field, State );
end;}


procedure TFrmAssyGroupLabWhiteboard.DrawTotalPeriodInGrid( AGrid: TIQUniGridControl; Rect: TRect; AInitiated, APlanned, AUnsched, ATotal, AStandard, ADelta: Real );
var
  ARectLabelInit    : TRect;
  ARectLabelPlan    : TRect;
  ARectLabelUnsched : TRect;

  ARectTextInit     : TRect;
  ARectTextPlan     : TRect;
  ARectTextUnsched  : TRect;

  AEntireTextHeight : Integer;
  ALeftColumnWidth  : Integer;
  ASingleLineHeight : Integer;
  AThisTop          : Integer;
  AFontColor        : TColor;

  function NumToStr( AValue: Real ): string;
  begin
    if AValue = 0 then
       Result:= ''
    else
       Result:= Format('%.2f', [ AValue ]);
  end;

  function _DisplayLabelAndValue( ATop: Integer; ACaption, AValue: string; AFontColor: TColor = clBlack ): Integer;
  var
    ARectLabel: TRect;
    ARectText : TRect;
  begin
    // Label
    { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
    //AGrid.Canvas.Font.Color:= clBlack;
    ARectLabel.Top    := ATop;
    ARectLabel.Left   := Rect.Left;
    ARectLabel.Bottom := ARectLabel.Top + ASingleLineHeight;
    ARectLabel.Right  := ARectLabel.Left + ALeftColumnWidth - 1;
    { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
    //AGrid.Canvas.TextRect( ARectLabel, ARectLabel.Left + 1, ARectLabel.Top + 1, ACaption );

    // Value
    { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
    //AGrid.Canvas.Font.Color:= AFontColor;
    ARectText.Top     := ARectLabel.Top;
    ARectText.Left    := ARectLabel.Right + 2;
    ARectText.Bottom  := ARectLabel.Bottom;
    ARectText.Right   := Rect.Right - 1;
    { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
    {AGrid.Canvas.TextRect( ARectText, ARectText.Left + 1, ARectText.Top + 1, AValue );
    AGrid.Canvas.Font.Color:= clBlack;}

    Result:= ARectLabel.Bottom + 1; // return next pair top
  end;

begin
  // prepare
  AEntireTextHeight:= Rect.Bottom - Rect.Top;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //ALeftColumnWidth := AGrid.Canvas.TextWidth( cnstTextWidthSample ) + 4;
  ASingleLineHeight:= AEntireTextHeight div 6;


  AThisTop:= _DisplayLabelAndValue( Rect.Top, 'Initiated ', NumToStr( AInitiated ));
  AThisTop:= _DisplayLabelAndValue( AThisTop, 'Planned ',   NumToStr( APlanned ));
  AThisTop:= _DisplayLabelAndValue( AThisTop, 'Unsched ',   NumToStr( AUnsched ));

  // horizontal line to separate grand totals
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  {AGrid.Canvas.Pen.Color:= clSilver;
  AGrid.Canvas.MoveTo( Rect.Left, AThisTop );
  AGrid.Canvas.LineTo( Rect.Left + Rect.Width - 1, AThisTop );}
  Inc(AThisTop);

  AThisTop:= _DisplayLabelAndValue( AThisTop, 'Total ',    NumToStr( ATotal ));
  AThisTop:= _DisplayLabelAndValue( AThisTop, 'Standard ', NumToStr( AStandard ));

  // color delta
  if ADelta < 0 then AFontColor:= clRed else AFontColor:= clGreen;
  AThisTop:= _DisplayLabelAndValue( AThisTop, 'Delta ', NumToStr( ADelta ), AFontColor);

  // vertical separator line
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  {AGrid.Canvas.Pen.Color:= clSilver;
  AGrid.Canvas.MoveTo( Rect.Left + ALeftColumnWidth, Rect.Top );
  AGrid.Canvas.LineTo( Rect.Left + ALeftColumnWidth, Rect.Top + AEntireTextHeight + 2);}
end;


procedure TFrmAssyGroupLabWhiteboard.DrawTitleDetailsTotal( AGrid: TIQUniGridControl; Rect: TRect; ATitle: string );
var
  ARow_1_Rect: TRect;
begin
  // Change font style
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //AGrid.Canvas.Font.Style:= AGrid.Canvas.Font.Style + [fsBold];

  // 1 row
  ARow_1_Rect.TopLeft:= Rect.TopLeft;
  ARow_1_Rect.Right  := Rect.Right;
  ARow_1_Rect.Bottom := ARow_1_Rect.Top + (Rect.Bottom - Rect.Top ) div 6;
  { TODO -oSanketG -cWC : Need to find alternative for Canvas in TIQUniGridControl }
  //AGrid.Canvas.TextRect( ARow_1_Rect, ARow_1_Rect.Left + 1, ARow_1_Rect.Top + 1, ATitle );
end;

procedure TFrmAssyGroupLabWhiteboard.DisplayDelatActualHours;
var
  ADeltaActual: Real;
  AColor: TColor;
  AActHrs:Real;
begin
  edDeltaFromActual.Brush.Color:= clBtnFace;
  edDeltaFromActual.Font.Color := clBlack;
  edDeltaFromActual.Clear;

  if not (IsStringValidFloat( edActualHours.Text, AActHrs ) and (AActHrs > 0)) then
     EXIT;

  ADeltaActual:= AActHrs - FTotalActualHours;
  if ADeltaActual < 0 then
     AColor:= clRed
  else
     AColor:= clGreen;
  edDeltaFromActual.Brush.Color:= clWhite;
  edDeltaFromActual.Font.Color := AColor;
  edDeltaFromActual.Text:= Format( '%.2f', [ ADeltaActual ]);
end;

procedure TFrmAssyGroupLabWhiteboard.edActualHoursChange(Sender: TObject);
begin
  if QryTotals.Active then
     DisplayDelatActualHours
end;


procedure TFrmAssyGroupLabWhiteboard.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmASSY1{CHM}, iqhtmASSY1{HTM} );  {IQMS.Common.HelpHook.pas}
end;


procedure TFrmAssyGroupLabWhiteboard.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;


end.
