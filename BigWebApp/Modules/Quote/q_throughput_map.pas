unit q_throughput_map;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Buttons,
  Mask,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
{ TODO -oGPatil -cWebConvert : Dependency
  IQMS.Common.UserMessages, }
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  IQMS.Common.Miscellaneous,
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
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmQuoteThroughputMap = class(TUniForm)
    pnlCarrier: TUniPanel;
    pnlLeft01: TUniPanel;
    Panel4: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    GroupBox1: TUniGroupBox;
    Splitter2: TUniSplitter;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    Label14: TUniLabel;
    Panel6: TUniPanel;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    Panel10: TUniPanel;
    sbtnRecalc: TUniSpeedButton;
    SecurityRegister1: TIQWebSecurityRegister;
    SrcQuote: TDataSource;
    QryQuote: TFDQuery;
    QryQuoteASSY1_STD_QUAN: TFMTBCDField;
    QryQuoteASSY1_STD_PROCESSING_TIME: TFMTBCDField;
    UpdateSQLStandard: TFDUpdateSQL;
    QryQuoteID: TBCDField;
    SrcProcess: TDataSource;
    QryProcess: TFDQuery;
    QryProcessOPSEQ: TBCDField;
    QryProcessOPNO: TStringField;
    QryProcessOPDESC: TStringField;
    QryProcessUOM: TStringField;
    QryProcessCYCLETM_DISP: TBCDField;
    QryProcessMOVE_SIZE: TFMTBCDField;
    QryProcessMOVE_TIME: TFMTBCDField;
    QryProcessSETUPHRS: TBCDField;
    QryProcessPTOPER_ROWID: TStringField;
    wwDBComboBoxUOM: TUniDBComboBox;
    QryProcessID: TBCDField;
    DataSource1: TDataSource;
    QryMap: TFDQuery;
    QryMapOPNO: TStringField;
    QryMapOPSEQ: TBCDField;
    QryMapSTART_TIME: TDateTimeField;
    QryMapEND_TIME: TDateTimeField;
    QryMapDURATION: TFMTBCDField;
    QryMapQTY: TFMTBCDField;
    QryMapPRODHRS: TFMTBCDField;
    QryMapSETUPHRS: TFMTBCDField;
    QryMapY_VALUE: TFMTBCDField;
    Bevel1: TUniPanel;
    QryMapID: TBCDField;
    QryMapRECNO: TFMTBCDField;
    QryMapColor: TFloatField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    sbtnProcessDependencies1: TUniSpeedButton;
    QryProcessPTOPER_ID: TBCDField;
    wwDBComboDlgDependentOn: TUniEdit;
    QryProcessParentOpNo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryQuoteBeforeOpen(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryProcessBeforeOpen(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TGridDrawState and TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);   }
    procedure QryProcessUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure sbtnRecalcClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QryMapBeforeOpen(DataSet: TDataSet);
//    procedure Series1GetMarkText(Sender: TChartSeries; ValueIndex: Integer; var MarkText: String);
//    procedure QryMapCalcFields(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure sbtnProcessDependencies1Click(Sender: TObject);
    procedure wwDBComboDlgDependentOnCustomDlg(Sender: TObject);
    procedure QryProcessCalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FQinvt_ID: Real;
    FQuote_ID: Real;
    FBatch: Real;
    FColorCount: Integer;
    FColors    : Variant;
    CW: Word;
    FRestoreFPU:Boolean;
    FGanntChart:Variant;
//    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure InitVars;
    procedure LaunchChart(ABatchID: Real; AShowXAxis: Boolean);
    procedure SetQinvt_ID(const Value: Real);
  public
    { Public declarations }
    property Qinvt_ID: Real write SetQinvt_ID;
    class procedure DoShow(AQinvt_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DotNetCOMInterOp,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg;
{ TODO -oGPatil -cWebConvert : Dependency
  q_ptoper_depend,
  qsnd_depend_chart,
  IQMS.Common.DNetInteropConst;  }

{ TFrmQuoteThroughputMap }

class procedure TFrmQuoteThroughputMap.DoShow( AQinvt_ID: Real);
var
  LFrmQuoteThroughputMap : TFrmQuoteThroughputMap;
begin
  LFrmQuoteThroughputMap := TFrmQuoteThroughputMap.Create(UniGUIApplication.UniApplication);
  LFrmQuoteThroughputMap.Qinvt_ID := AQinvt_ID;
  LFrmQuoteThroughputMap.FQuote_ID:= SelectValueByID('quote_id', 'qinvt', AQinvt_ID );
  LFrmQuoteThroughputMap.FBatch:= GetNextID('assy1_tote_part');
  LFrmQuoteThroughputMap.Show;
end;

procedure TFrmQuoteThroughputMap.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  try FGanntChart.Close; except ; end;
  FreeDNetObject_Ex( FGanntChart );
  if FRestoreFPU then RestoreFPU( CW );
  IQRegFormWrite(self, [self, pnlLeft01, wwDBGrid1]);
end;

procedure TFrmQuoteThroughputMap.FormDestroy(Sender: TObject);
begin
  ExecuteCommandFmt('delete from assy1_tote_part where batch = %f', [ FBatch ]);
end;

procedure TFrmQuoteThroughputMap.InitVars;
begin
  Caption:= Format('Process Throughput Map [ %s ]', [ SelectValueByID('rfq', 'quote', FQuote_ID )]);
  //TFrmBOMThroughputMap.PopulateColorArray( FColors, FColorCount, FQinvt_ID, 'QUOTE' );
  //Series1.ColorSource:= 'Color';
  //DBChart1.BottomAxis.Visible:= TRUE;
end;


procedure TFrmQuoteThroughputMap.QryQuoteBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('quote_id').Value := FQuote_ID;
end;

procedure TFrmQuoteThroughputMap.ApplyUpdates(DataSet: TDataSet);
begin
//  PostMessage( TUniForm(Owner).Handle, iq_RefreshDataSets, 1, 0);
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmQuoteThroughputMap.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;  }

procedure TFrmQuoteThroughputMap.QryProcessBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('qinvt_id').Value := FQinvt_ID;
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmQuoteThroughputMap.wwDBGrid1CalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field.ReadOnly then
     ABrush.Color:= clBtnFace;
end;   }

procedure TFrmQuoteThroughputMap.QryProcessUpdateRecord(ASender: TDataSet;  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  if ARequest in [arUpdate, arInsert, arDelete] then
  begin
    ExecuteCommandFmt('update qsndop set setuphrs = %.6f where id = %f',
             [ ASender.FieldByName('setuphrs').asFloat,
               ASender.FieldByName('id').asFloat ]);

    ExecuteCommandFmt('update qptoper              '+
              '   set uom = ''%s'',        '+
              '       cycletm_disp = %.6f, '+
              '       move_size = %.6f,    '+
              '       move_time = %.6f     '+
              ' where rowid = ''%s''       ',
              [ ASender.FieldByName('uom').asString,
                ASender.FieldByName('cycletm_disp').asFloat,
                ASender.FieldByName('move_size').asFloat,
                ASender.FieldByName('move_time').asFloat,
                ASender.FieldByName('ptoper_rowid').asString ]);
  end;

  AAction := eaApplied;
end;

procedure TFrmQuoteThroughputMap.sbtnRecalcClick(Sender: TObject);
var
  AStartDate: TDateTime;
  AFinishDate: TDateTime;
  AMfgcell_ID: Real;
  hMsg       : TPanelMesg;
begin
  hMsg:= hPleaseWait('');
  try
    QryQuote.CheckBrowseMode;
    QryProcess.CheckBrowseMode;
    AStartDate:= Now;

    // create the map
    ExecuteCommandFmt('declare                            '+
              '  v     assy1_tote.cargo_rec;      '+
              'begin                              '+
              '  v.qty               ::= %.6f;    '+
              '  v.partno_id         ::= %f;      '+
              '  v.batch             ::= %f;      '+
              '  v.first_process_date::= to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''); '+
              '                                   '+
              '  assy1_tote.eval_quote_processes( v );  '+
              'end;                               ',
              [  QryQuoteASSY1_STD_QUAN.asFloat,
                 FQinvt_ID,
                 FBatch,
                 FormatDateTime('mm/dd/yyyy hh:nn:ss', AStartDate)]);

    // get last date
    AFinishDate:= SelectValueFmtAsFloat('select max(c.end_time)                                            '+
                            '  from assy1_tote_part a, assy1_tote_process b, assy1_tote_data c '+
                            ' where a.batch = %f                                               '+
                            '   and a.id = b.assy1_tote_part_id                                '+
                            '   and b.id = c.assy1_tote_process_id                             '+
                            ' order by c.id desc                                               ',
                            [ FBatch ]);

    AMfgcell_ID:= SelectValueByID('mfgcell_id', 'quote', FQuote_ID );

    // update standard
    QryQuote.Edit;
    QryQuoteASSY1_STD_PROCESSING_TIME.asFloat:= SelectValueFmtAsFloat('select IQCalendar.Prod_Hrs_Between( 1,                                          '+
                                                             '                                    to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+
                                                             '                                    to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+
                                                             '                                    1,                                          '+  // default calendar
                                                             '                                    %s ) from dual                              ',
                                                             [ FormatDateTime('mm/dd/yyyy hh:nn:ss', AStartDate ),
                                                               FormatDateTime('mm/dd/yyyy hh:nn:ss', AFinishDate ),
                                                               IQMS.Common.StringUtils.FloatToStr0asNull( AMfgcell_ID, 'null') ]);
    QryQuote.Post;

    // refresh the query and the chart
    Reopen(QryMap);
   // DBChart1.RefreshData;

    LaunchChart( FBatch, false );
  finally
    hMsg.Free;
  end;
end;


procedure TFrmQuoteThroughputMap.SetQinvt_ID(const Value: Real);
begin
  FQinvt_ID := Value;
end;

procedure TFrmQuoteThroughputMap.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self, pnlLeft01, wwDBGrid1]);
  IQSetTablesActive(TRUE, self);

  InitVars;
//  PostMessage( Handle, iq_Notify, 1, 0 );  // recalc
end;

procedure TFrmQuoteThroughputMap.QryMapBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('batch').Value := FBatch;
end;

{
procedure TFrmQuoteThroughputMap.Series1GetMarkText(Sender: TChartSeries;  ValueIndex: Integer; var MarkText: String);
begin
  if not QryMap.Locate('recno', ValueIndex+1, []) then
     EXIT;

  MarkText:= Format('Production Hours: %f'#13+
                    'Setup Hours: %f'#13+
                    'Slack Hours: %f'#13+
                    'Total Hours: %f'#13,
                    [ QryMapPRODHRS.asFloat,
                      QryMapSETUPHRS.asFloat,
                      QryMapDURATION.asFloat - (QryMapPRODHRS.asFloat + QryMapSETUPHRS.asFloat),
                      QryMapDURATION.asFloat ]);
end;

procedure TFrmQuoteThroughputMap.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    1: sbtnRecalc.Click;
  end;
end;

procedure TFrmQuoteThroughputMap.QryMapCalcFields(DataSet: TDataSet);
begin
 QryMapColor.asFloat:= TFrmBOMThroughputMap.MapProcessToColor( QryMapOPSEQ.asFloat, FColorCount, FColors  );
end;
}
procedure TFrmQuoteThroughputMap.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmQuoteThroughputMap.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmQuoteThroughputMap.LaunchChart(ABatchID:Real; AShowXAxis:Boolean);
const
  DOTNETDLL = 'IQMS.Charts';
  DOTNETCOMTYPE = 'IQMS.Charts.QuoteChart';
var
  h:TPanelMesg;
begin
  if not FRestoreFPU then
  begin
    DisableFPUExceptions( CW );
    FRestoreFPU:= true;
  end;

  h:= hPleaseWait( 'Loading Chart. Please Wait...' );
  try
{ TODO -oGPatil -cWebConvert : Undeclared Identifier
    try
      if not VarIsEmpty(FGanntChart) then
        FGanntChart.Close;


      CreateDNetCOM( FGanntChart, DOTNETDLL, DOTNETCOMTYPE, DNetVersion4_0_30319 );
    except
      CreateDNetCOM( FGanntChart, DOTNETDLL, DOTNETCOMTYPE, DNetVersion4_0_30319 );
    end;  }

    FGanntChart.Configure( SecurityManager.UserName, // IQMS.Common.Miscellaneous.pas, IQMS.WebVcl.SecurityManager.pas
                           SecurityManager.Password,
                           IQGetServerName( 'IQFD' ),
                           ABatchID,
                           siif( AShowXAxis, 'Y', 'N' ) );

    FGanntChart.Show;

    FGanntChart.CloseConnection;
  finally
    if Assigned( h ) then h.Free;
  end;
end;


procedure TFrmQuoteThroughputMap.sbtnProcessDependencies1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency qsnd_depend_chart.pas
  TFrmQSndopDependenciesChart.DoShowModal( self, FQinvt_ID ); // qsnd_depend_chart.pas }
end;

procedure TFrmQuoteThroughputMap.wwDBComboDlgDependentOnCustomDlg(
  Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency q_ptoper_depend.pas
  TFrmQuotePtOperDepend.DoShowModal(self, QryProcessPTOPER_ID.asFloat );  // q_ptoper_depend.pas    }
  RefreshDataSetByID(QryProcess, 'ptoper_id');
end;

procedure TFrmQuoteThroughputMap.QryProcessCalcFields(DataSet: TDataSet);
var
  ACount: Real;
begin
  ACount:= SelectValueFmtAsFloat('select count(*) from qptoper_depend where ptoper_id = %f', [ QryProcessPTOPER_ID.asFloat ]);
  if ACount > 1 then
     QryProcessParentOpNo.asString:= '<Multiple>'
  else if ACount = 1 then
     QryProcessParentOpNo.asString:= SelectValueFmtAsString('select decode( d.parent_id, -1, ''<START>'', s.opno) from qsndop s, qptoper_depend d, qptoper p '+
                                                 ' where d.ptoper_id = %f and d.parent_id = p.id(+) and p.qsndop_id = s.id(+)',
                                                 [ QryProcessPTOPER_ID.asFloat ]);
end;

end.
