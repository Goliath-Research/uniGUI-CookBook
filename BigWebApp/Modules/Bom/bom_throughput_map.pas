unit bom_throughput_map;

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
  IQMS.Common.JumpConstants,
  Vcl.Menus,
  IQMS.WebVcl.About,
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
  uniDBComboBox, uniMainMenu, uniDateTimePicker, uniDBDateTimePicker, IQUniGrid,
  uniGUIFrame;

type
  TFrmBOMThroughputMap = class(TUniForm)
    pnlCarrier: TUniPanel;
    pnlLeft01: TUniPanel;
    Panel4: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    GroupBox1: TUniGroupBox;
    Splitter2: TUniSplitter;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label14: TUniLabel;
    Panel6: TUniPanel;
    DBEdit1: TUniDBEdit;
    wwDBDateTimePickStartDate: TUniDBDateTimePicker;
    DBEdit2: TUniDBEdit;
    Panel10: TUniPanel;
    sbtnRecalc: TUniSpeedButton;
    SecurityRegister1: TIQWebSecurityRegister;
    SrcStandard: TDataSource;
    QryStandard: TFDQuery;
    QryStandardASSY1_STD_QUAN: TFMTBCDField;
    QryStandardASSY1_STD_PROCESSING_TIME: TFMTBCDField;
    UpdateSQLStandard: TFDUpdateSQL;
    QryStandardID: TBCDField;
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
    QryProcessParentOpNo: TStringField;
    QryProcessPTOPER_ID: TBCDField;
    wwDBComboDlgDependentOn: TUniEdit;
    sbtnProcessDependencies: TUniSpeedButton;
    Splitter1: TUniSplitter;
    QryStandardMFG_TYPE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryStandardBeforeOpen(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);  }
    procedure QryProcessBeforeOpen(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);  }
    procedure QryProcessUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure sbtnRecalcClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QryMapBeforeOpen(DataSet: TDataSet);
    procedure sbtnHideShowCriteriaClick(Sender: TObject);
//    procedure Series1GetMarkText(Sender: TChartSeries; ValueIndex: Integer; var MarkText: String);
//    procedure QryMapCalcFields(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryProcessCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgDependentOnCustomDlg(Sender: TObject);
{ TODO -oGPatil -cWebConvert : Dependency on snd_depend_chart.pas File
    procedure sbtnProcessDependenciesClick(Sender: TObject);   }
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FPartno_ID: Real;
    FStandard_ID: Real;
    FBatch: Real;
    FColorCount: Integer;
    FColors    : Variant;
    CW: Word;
    FRestoreFPU:Boolean;
    FGanntChart:Variant;
//    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure InitVars;
    procedure SetFPartno_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow(APartno_ID: Real );
    property Partno_ID : Real write SetFPartno_ID;
//    class procedure PopulateColorArray( var AColors: Variant; var AColorCount: Integer; APartno_ID: Real; AOrigin: string = 'BOM' );
//    class function MapProcessToColor(AOpSeq: Real; AColorCount: Integer; AColors: Variant ): TColor;
    procedure LaunchChart(ABatchID:Real; AShowXAxis:Boolean);
  end;

implementation

{$R *.dfm}

uses
  bom_ptoper_depend,
  IQMS.Common.DotNetCOMInterOp,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg;
{ TODO -oGPatil -cWebConvert : Dependency on snd_depend_chart.pas File
  snd_depend_chart; }

{ TFrmBOMThroughputMap }

const
  cPredefinedCount = 6;

var
  APredefinedColors: array[0..cPredefinedCount-1, 0..2] of string = (('$CC', '$EB', '$FF'),
                                                                     ('$80', '$CC', '$FF'),
                                                                     ('$33', '$AD', '$FF'),
                                                                     ('$00', '$8A', '$E6'),
                                                                     ('$00', '$5C', '$99'),
                                                                     ('$00', '$2E', '$4C'));
(*
#CCEBFF
#E6F5FF
 #B2E0FF
 #99D6FF
#80CCFF
 #66C2FF
 #4DB8FF
#33ADFF
 #19A3FF
 #0099FF
#008AE6
 #007ACC
 #006BB2
#005C99
 #004C80
 #003D66
#002E4C
 #001F33
#000F1A
*)

{ TFrmBOMThroughputMap }

class procedure TFrmBOMThroughputMap.DoShow(APartno_ID: Real);
var
  LFrmBOMThroughputMap : TFrmBOMThroughputMap;
begin
  LFrmBOMThroughputMap := TFrmBOMThroughputMap.Create(UniGUIApplication.UniApplication);
  LFrmBOMThroughputMap.FPartno_ID  := APartno_ID;
  LFrmBOMThroughputMap.Show;
end;

procedure TFrmBOMThroughputMap.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  try FGanntChart.Close; except ; end;
  FreeDNetObject_Ex( FGanntChart );
  if FRestoreFPU then RestoreFPU( CW );
  IQRegFormWrite(self, [self, pnlLeft01, wwDBGrid1]);
end;

procedure TFrmBOMThroughputMap.FormDestroy(Sender: TObject);
begin
  ExecuteCommandFmt('delete from assy1_tote_part where batch = %f', [ FBatch ]);
end;

procedure TFrmBOMThroughputMap.InitVars;
begin
  Caption:= Format('Process Throughput Map [ %s ]', [ SelectValueByID('mfgno', 'standard', FStandard_ID )]);
//  PopulateColorArray( FColors, FColorCount, FPartno_ID );
//  Series1.ColorSource:= 'Color';
end;


procedure TFrmBOMThroughputMap.QryStandardBeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('standard_id').Value := FStandard_ID;
  AssignQueryParamValue(DataSet, 'standard_id', FStandard_ID);
end;

procedure TFrmBOMThroughputMap.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
  PostMessage( TUniForm(Owner).Handle, iq_RefreshDataSets, 1, 0);
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmBOMThroughputMap.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;     }

procedure TFrmBOMThroughputMap.QryProcessBeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('partno_id').Value := FPartno_ID;
  AssignQueryParamValue(DataSet, 'partno_id', FPartno_ID);
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmBOMThroughputMap.wwDBGrid1CalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field.ReadOnly then
     ABrush.Color:= clBtnFace;
end;    }

procedure TFrmBOMThroughputMap.QryProcessUpdateRecord(ASender: TDataSet;  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  if ARequest in [arDelete, arInsert, arUpdate] then
  begin
    ExecuteCommandFmt('update sndop set setuphrs = %.6f where id = %f',
             [ ASender.FieldByName('setuphrs').asFloat,
               ASender.FieldByName('id').asFloat ]);

    ExecuteCommandFmt('update ptoper               '+
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

procedure TFrmBOMThroughputMap.sbtnRecalcClick(Sender: TObject);
var
  AStartDate: TDateTime;
  AFinishDate: TDateTime;
  AMfgcell_ID: Real;
  hMsg       : TPanelMesg;
begin
  hMsg:= hPleaseWait('');
  try
    QryStandard.CheckBrowseMode;
    QryProcess.CheckBrowseMode;

    if wwDBDateTimePickStartDate.Text > '' then
       AStartDate:= wwDBDateTimePickStartDate.DateTime
    else
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
              '  assy1_tote.eval_processes( v );  '+
              'end;                               ',
              [  QryStandardASSY1_STD_QUAN.asFloat,
                 FPartno_ID,
                 FBatch,
                 FormatDateTime('mm/dd/yyyy hh:nn:ss', AStartDate)]);

    // get last date
    AFinishDate:= SelectValueFmtAsFloat('select max(c.end_time)                                            '+
                            '  from assy1_tote_part a, assy1_tote_process b, assy1_tote_data c '+
                            ' where a.batch = %f                                               '+
                            '   and a.id = b.assy1_tote_part_id                                '+
                            '   and b.id = c.assy1_tote_process_id                             ',
                            [ FBatch ]);

    AMfgcell_ID:= SelectValueByID('mfgcell_id', 'standard', FStandard_ID );

    // update standard
    QryStandard.Edit;
    QryStandardASSY1_STD_PROCESSING_TIME.asFloat:= SelectValueFmtAsFloat('select IQCalendar.Prod_Hrs_Between( 1,                                          '+
                                                             '                                    to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+
                                                             '                                    to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+
                                                             '                                    1,                                          '+  // default calendar
                                                             '                                    %s ) from dual                              ',
                                                             [ FormatDateTime('mm/dd/yyyy hh:nn:ss', AStartDate ),
                                                               FormatDateTime('mm/dd/yyyy hh:nn:ss', AFinishDate ),
                                                               IQMS.Common.StringUtils.FloatToStr0asNull( AMfgcell_ID, 'null') ]);
    QryStandard.Post;

    // 05-08-2012 ASSY1 - BOM Tree report not populating cycle time - CRM# 629134
    ExecuteCommandFmt('declare                                                                           '+
              '  v_partno_id        number::= %f;                                                '+
              '  v_cycletm_disp_bom number;                                                      '+
              '  v_standard_id      number::= %f;                                                '+
              '  v_mfg_type         varchar2(10)::= ''%s'';                                      '+
              'begin                                                                             '+
              '  v_cycletm_disp_bom::= 1 / Mfg_UOM.CycleTM_To_Default_UOM( 1, v_mfg_type ) / appdef_sndop.get_hrs_part_through_processes( 1000, v_partno_id ); '+
              '  update standard set cycletm_disp = v_cycletm_disp_bom where id = v_standard_id; '+
              'end;                                                                              ',
               [ FPartno_ID,
                 QryStandardID.asFloat,
                 QryStandardMFG_TYPE.asString ]);

    // refresh the query and the chart
  //  DBChart1.BottomAxis.Visible:= wwDBDateTimePickStartDate.Text > '';
    Reopen(QryMap);
 //   DBChart1.RefreshData;

    LaunchChart( FBatch, wwDBDateTimePickStartDate.Text > '' );
  finally
    hMsg.Free;
  end;
end;

procedure TFrmBOMThroughputMap.SetFPartno_ID(const Value: Real);
begin
  FPartno_ID := Value;
end;

procedure TFrmBOMThroughputMap.UniFormShow(Sender: TObject);
begin
  FRestoreFPU := false;
  FStandard_ID:= SelectValueByID('standard_id', 'partno', FPartno_ID );
  FBatch:= GetNextID('assy1_tote_part');

  IQRegFormRead(self, [self, pnlLeft01, wwDBGrid1]);
  IQSetTablesActive(TRUE, self);

  InitVars;
  PostMessage( Handle, iq_Notify, 1, 0 );  // recalc
end;

procedure TFrmBOMThroughputMap.QryMapBeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('batch').Value := FBatch;
  AssignQueryParamValue(DataSet, 'batch', FBatch);
end;

procedure TFrmBOMThroughputMap.sbtnHideShowCriteriaClick(Sender: TObject);
begin
  pnlLeft01.Left:= 0;
end;
{
procedure TFrmBOMThroughputMap.Series1GetMarkText(Sender: TChartSeries;  ValueIndex: Integer; var MarkText: String);
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

procedure TFrmBOMThroughputMap.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    1: sbtnRecalc.Click;
  end;
end;

procedure TFrmBOMThroughputMap.QryMapCalcFields(DataSet: TDataSet);
begin
 QryMapColor.asFloat:= MapProcessToColor( QryMapOPSEQ.asFloat, FColorCount, FColors  );
end;

class procedure TFrmBOMThroughputMap.PopulateColorArray( var AColors: Variant; var AColorCount: Integer; APartno_ID: Real; AOrigin: string = 'BOM' );
var
  I, J       : Integer;

  function HexColorToInt( A: array of string): Integer;
  begin
    Result:= RGB( StrToInt(A[ 0 ]), StrToInt(A[ 1 ]), StrToInt(A[ 2 ]) );
  end;

begin
  if AOrigin = 'QUOTE' then
     AColorCount:= Trunc( SelectValueFmtAsFloat('select count(*) from qptoper, qsndop where qptoper.qinvt_id = %f and qptoper.qsndop_id = qsndop.id and qsndop.op_class = ''AS''', [ APartno_ID ]))
  else
     AColorCount:= Trunc( SelectValueFmtAsFloat('select count(*) from ptoper, sndop where ptoper.partno_id = %f and ptoper.sndop_id = sndop.id and sndop.op_class = ''AS''', [ APartno_ID ]));

  AColors:= VarArrayCreate([0, AColorCount], varVariant);

  with TFDQuery.Create(nil) do
  try
    Connection := MainModule.FDConnection;
    if AOrigin = 'QUOTE' then
       SQL.Add(Format('select qptoper.opseq from qptoper, qsndop where qptoper.qinvt_id = %.0f and qptoper.qsndop_id = qsndop.id and qsndop.op_class = ''AS'' order by qptoper.opseq', [ APartno_ID ]))
    else
       SQL.Add(Format('select ptoper.opseq from ptoper, sndop where ptoper.partno_id = %.0f and ptoper.sndop_id = sndop.id  and sndop.op_class = ''AS'' order by ptoper.opseq', [ APartno_ID ]));
    Open;
    I:= 0;
    J:= 0;
    while not Eof do
    begin
      AColors[ I ]:= VarArrayOf([ FieldByName('opseq').asFloat,               //sndop sequence
                                  HexColorToInt( APredefinedColors[ J ]) ]);  //color for gantt

      Inc(I);
      Inc(J);
      if J > cPredefinedCount - 1 then J:= 0;
      Next;
    end;
  finally
    Free;
  end;
end;


class function TFrmBOMThroughputMap.MapProcessToColor(AOpSeq: Real; AColorCount: Integer; AColors: Variant ): TColor;
var
  I: Integer;
begin
  for I:= 0 to AColorCount - 1 do
    if AColors[ I ][ 0 ] = AOpSeq then
    begin
      Result:= AColors[ I ][ 1 ];
      EXIT;
    end;
  Result:= clWindow;
end;
}
procedure TFrmBOMThroughputMap.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBOMThroughputMap.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmBOMThroughputMap.QryProcessCalcFields(DataSet: TDataSet);
var
  ACount: Real;
begin
  ACount:= SelectValueFmtAsFloat('select count(*) from ptoper_depend where ptoper_id = %f', [ QryProcessPTOPER_ID.asFloat ]);
  if ACount > 1 then
     QryProcessParentOpNo.asString:= '<Multiple>'
  else if ACount = 1 then
     QryProcessParentOpNo.asString:= SelectValueFmtAsString('select decode( d.parent_id, -1, ''<START>'', s.opno) from sndop s, ptoper_depend d, ptoper p '+
                                                 ' where d.ptoper_id = %f and d.parent_id = p.id(+) and p.sndop_id = s.id(+)',
                                                 [ QryProcessPTOPER_ID.asFloat ]);
end;

procedure TFrmBOMThroughputMap.wwDBComboDlgDependentOnCustomDlg(Sender: TObject);
begin
  TFrmBomPtOperDepend.DoShowModal(QryProcessPTOPER_ID.asFloat );  // bom_ptoper_depend.pas
  RefreshDataSetByID(QryProcess, 'ptoper_id');
end;

procedure TFrmBOMThroughputMap.LaunchChart(ABatchID:Real; AShowXAxis:Boolean);
const
  DOTNETDLL = 'IQMS.Charts';
  DOTNETCOMTYPE = 'IQMS.Charts.BOMChart';
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
    try
      if not VarIsEmpty(FGanntChart) then
        FGanntChart.Close;

      CreateDNetCOM( FGanntChart, DOTNETDLL, DOTNETCOMTYPE );
    except
      CreateDNetCOM( FGanntChart, DOTNETDLL, DOTNETCOMTYPE );
    end;

    FGanntChart.Configure( SecurityManager.UserName, // IQMS.Common.Miscellaneous.pas, IQMS.WebVcl.SecurityManager.pas
                       SecurityManager.Password,
                       IQGetServerName( 'IQFD' ),
                       ABatchID,
                       siif(AShowXAxis, 'Y', 'N') );

    FGanntChart.Show;

    FGanntChart.CloseConnection;

    FGanntChart.Activate;
  finally
    if Assigned( h ) then h.Free;
  end;
end;


{ TODO -oGPatil -cWebConvert : Dependency on snd_depend_chart.pas File
procedure TFrmBOMThroughputMap.sbtnProcessDependenciesClick(
  Sender: TObject);
begin
  TFrmSndopDependenciesChart.DoShowModal( self, FPartno_ID );  // snd_depend_chart.pas
end;   }

end.
