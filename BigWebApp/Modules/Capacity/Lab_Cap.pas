unit Lab_Cap;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Data.DB,
  Vcl.DBGrids,
  Vcl.Menus,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  VclTee.TeeGDIPlus,
  VCLTee.TeEngine,
  VCLTee.Series,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  VCLTee.DBChart,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl, uniMainMenu, Vcl.ExtCtrls, IQUniGrid, uniGUIFrame;

type
  TFrmLaborCapacity = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    pnlMfgType: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    pgctrlDetails: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Splitter2: TUniSplitter;
    pgctrlWeekly: TUniPageControl;
    TabSheet2: TUniTabSheet;
    pgctrlDaily: TUniPageControl;
    TabSheet3: TUniTabSheet;
    Splitter3: TUniSplitter;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SrcMfgType: TDataSource;
    QryMfgType: TFDQuery;
    QryMfgTypeMFGTYPE: TStringField;
    QryMfgTypeMFGCELL: TStringField;
    gridWeek: TUniDBGrid;
    gridDay: TUniDBGrid;
    gridDetail: TUniDBGrid;
    SrcLabor_Week: TDataSource;
    QryLabor_Week: TFDQuery;
    QryLabor_WeekWEEK: TBCDField;
    QryLabor_WeekWEEK_START: TDateTimeField;
    QryLabor_WeekSHIFT_HRS: TFMTBCDField;
    QryLabor_WeekLABOR_HRS: TFMTBCDField;
    QryLabor_WeekSETUPHRS: TFMTBCDField;
    QryLabor_WeekMFGTYPE: TStringField;
    QryLabor_WeekMFGCELL: TStringField;
    SrcLabor_Day: TDataSource;
    SrcDetail: TDataSource;
    QryDetail: TFDQuery;
    QryDetailSHIFT: TBCDField;
    QryDetailSHIFT_HRS: TFMTBCDField;
    QryDetailLABOR_HRS: TFMTBCDField;
    QryDetailSETUPHRS: TFMTBCDField;
    IQRepDef1: TIQWebRepDef;
    IQAbout1: TIQWebAbout;
    STDLabourCapacity1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    QryLabor_WeekAVAIL_LABOR_HRS: TFMTBCDField;
    QryDetailAVAIL_LABOR_HRS: TFMTBCDField;
    QryLabor_WeekPercent: TFloatField;
    QryDetailPercent: TFloatField;
    N1: TUniMenuItem;
    QryLabor_Day: TFDQuery;
    QryLabor_DayMFGTYPE: TStringField;
    QryLabor_DayMFGCELL: TStringField;
    QryLabor_DayPROD_DATE: TDateTimeField;
    QryLabor_DaySHIFT_HRS: TFMTBCDField;
    QryLabor_DayLABOR_HRS: TFMTBCDField;
    QryLabor_DaySETUPHRS: TFMTBCDField;
    QryLabor_DayAVAIL_LABOR_HRS: TFMTBCDField;
    QryLabor_DayPercent: TFloatField;
    Contents1: TUniMenuItem;
    TabSheet4: TUniTabSheet;
    chartDaysTot: TDBChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    Series1: TLineSeries;
    TabSheet5: TUniTabSheet;
    chartWeekTot: TDBChart;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    LineSeries5: TLineSeries;
    TabSheet6: TUniTabSheet;
    chartDetails: TDBChart;
    LineSeries6: TLineSeries;
    LineSeries7: TLineSeries;
    LineSeries8: TLineSeries;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    QryMfgTypeEMP_LEVEL_ID: TBCDField;
    QryMfgTypeEMP_LEVEL_CODE: TStringField;
    QryLabor_WeekEMP_LEVEL_ID: TBCDField;
    QryLabor_DayEMP_LEVEL_ID: TBCDField;
    QryDetailEMP_LEVEL_ID: TBCDField;
    IQSearch1: TIQUniGridControl;
    pnlTopToolBar: TUniPanel;
    sbtnOnlyScheduledWorkorder: TUniSpeedButton;
    QryMfgTypeSched_Only: TStringField;
    QryLabor_WeekSched_Only: TStringField;
    QryLabor_DaySched_Only: TStringField;
    QryDetailSched_Only: TStringField;
    QueryByMfgTypeMfgCellEmployeeLevel1: TUniMenuItem;
    QueryByMfgTypeEmployeeLevel1: TUniMenuItem;
    N2: TUniMenuItem;
    QryMfgTypeEx: TFDQuery;
    QryMfgTypeExMFGTYPE: TStringField;
    QryMfgTypeExMFGCELL: TStringField;
    QryMfgTypeExEMP_LEVEL_CODE: TStringField;
    QryMfgTypeExEMP_LEVEL_ID: TBCDField;
    QryMfgTypeExSched_Only: TStringField;
    QryLabor_WeekEx: TFDQuery;
    QryLabor_WeekExMFGTYPE: TStringField;
    QryLabor_WeekExMFGCELL: TStringField;
    QryLabor_WeekExWEEK: TBCDField;
    QryLabor_WeekExWEEK_START: TDateTimeField;
    QryLabor_WeekExSHIFT_HRS: TFMTBCDField;
    QryLabor_WeekExLABOR_HRS: TFMTBCDField;
    QryLabor_WeekExSETUPHRS: TFMTBCDField;
    QryLabor_WeekExAVAIL_LABOR_HRS: TFMTBCDField;
    QryLabor_WeekExPercent: TFloatField;
    QryLabor_WeekExEMP_LEVEL_ID: TBCDField;
    QryLabor_WeekExSched_Only: TStringField;
    QryLabor_DayEx: TFDQuery;
    QryLabor_DayExMFGTYPE: TStringField;
    QryLabor_DayExMFGCELL: TStringField;
    QryLabor_DayExPROD_DATE: TDateTimeField;
    QryLabor_DayExSHIFT_HRS: TFMTBCDField;
    QryLabor_DayExLABOR_HRS: TFMTBCDField;
    QryLabor_DayExSETUPHRS: TFMTBCDField;
    QryLabor_DayExAVAIL_LABOR_HRS: TFMTBCDField;
    QryLabor_DayExPercent: TFloatField;
    QryLabor_DayExEMP_LEVEL_ID: TBCDField;
    QryLabor_DayExSched_Only: TStringField;
    QryDetailEx: TFDQuery;
    QryDetailExSHIFT: TBCDField;
    QryDetailExSHIFT_HRS: TFMTBCDField;
    QryDetailExLABOR_HRS: TFMTBCDField;
    QryDetailExSETUPHRS: TFMTBCDField;
    QryDetailExAVAIL_LABOR_HRS: TFMTBCDField;
    QryDetailExPercent: TFloatField;
    QryDetailExEMP_LEVEL_ID: TBCDField;
    QryDetailExSched_Only: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure STDLabourCapacity1Click(Sender: TObject);
    procedure QryLabor_WeekCalcFields(DataSet: TDataSet);
    procedure gridDayDblClick(Sender: TObject);
    //procedure gridWeekDrawColumnCell(Sender: TObject; const Rect: TRect;
    //  DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure SrcLabor_WeekDataChange(Sender: TObject; Field: TField);
    procedure SrcLabor_DayDataChange(Sender: TObject; Field: TField);
    procedure SrcMfgTypeDataChange(Sender: TObject; Field: TField);
    procedure pgctrlWeeklyChange(Sender: TObject);
    procedure pgctrlDailyChange(Sender: TObject);
    procedure pgctrlDetailsChange(Sender: TObject);
    procedure sbtnOnlyScheduledWorkorderClick(Sender: TObject);
    procedure QryMfgTypeCalcFields(DataSet: TDataSet);
    procedure QueryByMfgTypeMfgCellEmployeeLevel1Click(Sender: TObject);
    procedure QueryByMfgTypeEmployeeLevel1Click(Sender: TObject);
  private
    { Private declarations }
    procedure IQRefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean;  var HintInfo: THintInfo );
    function GetQryMfgTypeDS: TFDQuery;
    procedure ReassignDataSources;

    property QryMfgTypeDS: TFDQuery read GetQryMfgTypeDS;
  public
    { Public declarations }
    class procedure DoShow;
  end;

procedure DoLaborCapacity;



implementation

{$R *.DFM}

uses
  capacity_rscstr,
  CapShare,
  IQMS.Common.Controls,
  IQMS.Common.Cursor,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  Lab_WO
  ,StdLabor
  ;

procedure DoLaborCapacity;
var
  LFrmLaborCapacity : TFrmLaborCapacity;
begin
  LFrmLaborCapacity := TFrmLaborCapacity.create(uniGUIApplication.UniApplication);
  LFrmLaborCapacity.Show;
end;

class procedure TFrmLaborCapacity.DoShow;
var
  LFrmLaborCapacity : TFrmLaborCapacity;
begin
  LFrmLaborCapacity := TFrmLaborCapacity.create(uniGUIApplication.UniApplication);
  LFrmLaborCapacity.Show;
end;

procedure TFrmLaborCapacity.FormCreate(Sender: TObject);
var
  AFlag: Boolean;
begin
  AFlag:= False;
  IQRegBooleanScalarRead( self, 'QueryByMfgTypeEmployeeLevel', AFlag );
  if AFlag then
     QueryByMfgTypeEmployeeLevel1.Click
  else
     QueryByMfgTypeMfgCellEmployeeLevel1.Click;

  IQSetTablesActiveEx( TRUE, self, capacity_rscstr.cTXT0000006 {'Accessing Labor Capacity Planning.  Please wait.'});
  IQRegFormRead( self, [self, pnlMfgType, gridDay, gridDetail ]);
  gridDay.Cursor:= crDrill;
  pgctrlWeekly.ActivePageIndex := 0;
  pgctrlDaily.ActivePageIndex := 0;
  pgctrlDetails.ActivePageIndex := 0;

  //PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

procedure TFrmLaborCapacity.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Action:= caFree;
  IQRegFormWrite( self, [self, pnlMfgType, gridDay, gridDetail ]);
  IQRegBooleanScalarWrite( self, 'QueryByMfgTypeEmployeeLevel', QueryByMfgTypeEmployeeLevel1.Checked );
end;

procedure TFrmLaborCapacity.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmLaborCapacity.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmLaborCapacity.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmLaborCapacity.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmLaborCapacity.IQAfterShowMessage( var Msg: TMessage );
begin
  CheckMatReqRecalc(self);
end;

procedure TFrmLaborCapacity.IQRefreshDataSets( var Msg: TMessage );
var
  ABkMrk: TBookMark;
begin
  // 02/14/2008 (Byron) These 2 lines prevent a screen-repaint problem
  Application.ProcessMessages;
  Invalidate;

  //ABkMrk:= QryMfgTypeDS.GetBookMark;  // 01-18-2016 fireDAC brings back wrong Bookmark. Disable this for now
  try
    IQSetTablesActive( FALSE, self );
    IQSetTablesActiveEx( TRUE, self, capacity_rscstr.cTXT0000001 {'Refreshing data.  Please wait.'} );
    //QryMfgTypeDS.GotoBookMark( ABkMrk );
  finally
    //QryMfgTypeDS.FreeBookMark( ABkMrk );
  end;
end;

procedure TFrmLaborCapacity.STDLabourCapacity1Click(Sender: TObject);
begin
  //DoSetStdLaborHrs( self ); {StdLabor.pas}
end;

procedure TFrmLaborCapacity.QryLabor_WeekCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if FieldByName( 'AVAIL_LABOR_HRS' ).asFloat = 0 then
       FieldByName('Percent').asFloat:= 0
    else
       FieldByName('Percent').asFloat:= (FieldByName('LABOR_HRS').asFloat / FieldByName( 'AVAIL_LABOR_HRS' ).asFloat)*100;

    FieldByName('Sched_Only').asString:= QryMfgTypeDS.FieldByName('Sched_Only').asString;
  end;
end;

procedure TFrmLaborCapacity.gridDayDblClick(Sender: TObject);
begin
  DoShowLaborCap_WO_Details( (Sender as TUniDBGrid).DataSource );  {Lab_WO.pas}
end;
{
procedure TFrmLaborCapacity.gridWeekDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  AState:TGridDrawState;
begin
  AState:= State;
  with Sender as TUniDBGrid, DataSource.DataSet do
  begin
    if FieldByName('LABOR_HRS').asFloat + FieldByName('SETUPHRS').asFloat > FieldByName('AVAIL_LABOR_HRS').asFloat then
      if not (gdFocused in  AState) then
         Canvas.Font.Color:= clRed
      else
         begin
           Canvas.Font.Color := clYellow;
           Canvas.Brush.Color:= clBlack;
         end;
    DefaultDrawColumnCell( Rect, DataCol, Column, AState );
  end;
end;
}
procedure TFrmLaborCapacity.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
  Application.OnShowHint:= DoOnShowHint;
end;

procedure TFrmLaborCapacity.Contents1Click(Sender: TObject);
begin
     DoHelp( iqchmMFG, iqhtmSCHED, '1072321' );  {in IQMS.Common.HelpHook.pas}
end;

procedure TFrmLaborCapacity.SrcMfgTypeDataChange(Sender: TObject;
  Field: TField);
begin
  pgctrlWeeklyChange( NIL );
end;

procedure TFrmLaborCapacity.SrcLabor_WeekDataChange(Sender: TObject;
  Field: TField);
begin
  pgctrlDailyChange( NIL );
end;

procedure TFrmLaborCapacity.SrcLabor_DayDataChange(Sender: TObject;
  Field: TField);
begin
  pgctrlDetailsChange( NIL );
end;

procedure TFrmLaborCapacity.pgctrlWeeklyChange(Sender: TObject);
begin
  if pgctrlWeekly.ActivePage.PageIndex = 1 then
     chartWeekTot.RefreshData;
end;

procedure TFrmLaborCapacity.pgctrlDailyChange(Sender: TObject);
begin
  if pgctrlDaily.ActivePage.PageIndex = 1 then
     chartDaysTot.RefreshData;
end;

procedure TFrmLaborCapacity.pgctrlDetailsChange(Sender: TObject);
begin
  if pgctrlDetails.ActivePage.PageIndex = 1 then
     chartDetails.RefreshData;
end;


procedure TFrmLaborCapacity.DoOnShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  with HintInfo do
    if HintControl = sbtnOnlyScheduledWorkorder then
    begin
      case sbtnOnlyScheduledWorkorder.Down of
        False: HintStr:= 'Showing all workorders.'#13'Click to show only scheduled workorders.';
        True : HintStr:= 'Showing only scheduled workorders.'#13'Click to consider all workorders.';
      end;
    end;
end;

procedure TFrmLaborCapacity.sbtnOnlyScheduledWorkorderClick(Sender: TObject);
begin
  PostMessage( Handle, iq_RefreshDataSets, 0, 0 );
end;

procedure TFrmLaborCapacity.QryMfgTypeCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('Sched_Only').asString:= IQMS.Common.StringUtils.BoolToYN(sbtnOnlyScheduledWorkorder.Down);
end;

function TFrmLaborCapacity.GetQryMfgTypeDS: TFDQuery;
begin
  if QueryByMfgTypeMfgCellEmployeeLevel1.Checked then
     Result:= QryMfgType
  else
     Result:= QryMfgTypeEx
end;

procedure TFrmLaborCapacity.QueryByMfgTypeEmployeeLevel1Click(Sender: TObject);
begin
  QueryByMfgTypeEmployeeLevel1.Checked:= TRUE;
  ReassignDataSources;
  //IQMS.Common.Controls.EnsureWWColumnRemoved( IQSearch1.wwDBGrid, 'MFGCELL');
end;

procedure TFrmLaborCapacity.QueryByMfgTypeMfgCellEmployeeLevel1Click(
  Sender: TObject);
begin
  QueryByMfgTypeMfgCellEmployeeLevel1.Checked:= TRUE;
  ReassignDataSources;
  //IQMS.Common.Controls.EnsureWWColumnExists( IQSearch1.wwDBGrid, 'MFGCELL', 'Mfg Cell', 15 );
end;

procedure TFrmLaborCapacity.ReassignDataSources;
begin
  IQSetTablesActive( FALSE, self );
  try
    if QueryByMfgTypeMfgCellEmployeeLevel1.Checked then
       begin
         SrcMfgType.DataSet   := QryMfgType;
         SrcLabor_Week.DataSet:= QryLabor_Week;
         SrcLabor_Day.DataSet := QryLabor_Day;
         SrcDetail.DataSet    := QryDetail;
       end
    else
       begin
         SrcMfgType.DataSet   := QryMfgTypeEx;
         SrcLabor_Week.DataSet:= QryLabor_WeekEx;
         SrcLabor_Day.DataSet := QryLabor_DayEx;
         SrcDetail.DataSet    := QryDetailEx;
       end;

    // allow the tables to open
    SrcMfgType.DataSet.Tag   := 0;
    SrcLabor_Week.DataSet.Tag:= 0;
    SrcLabor_Day.DataSet.Tag := 0;
    SrcDetail.DataSet.Tag    := 0;
  finally
    IQSetTablesActiveEx( TRUE, self, capacity_rscstr.cTXT0000001 {'Refreshing data.  Please wait.'} );
  end;
end;



end.
