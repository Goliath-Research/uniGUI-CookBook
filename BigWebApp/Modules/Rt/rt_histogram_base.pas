unit rt_histogram_base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.wwDataInspector,
  Mask,
  Vcl.Buttons,
  { TODO -oathite -cWebConvert : unit not found IQMS.Common.UserMessages, }
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  VclTee.TeeGDIPlus,
  VCLTee.TeEngine,
  VCLTee.Series,
  VCLTee.GanttCh,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  VCLTee.DBChart,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.ExtCtrls;

type
  TFrmRTHistogramBase = class(TUniForm)
    pnlCarrier: TUniPanel;
    pnlClient01: TUniPanel;
    Panel6: TUniPanel;
    sbtnApply: TUniSpeedButton;
    wwDBComboBoxCriteria: TUniDBComboBox;
    StatusBar1: TUniStatusBar;
    Bevel1: TUniPanel;
    pnlGraph: TUniPanel;
    DBChart1: TDBChart;
    SrcHistogram: TDataSource;
    QryHistogram: TFDQuery;
    QryHistogramID: TBCDField;
    QryHistogramDAYPROD_ID: TBCDField;
    QryHistogramPROD_DATE: TDateTimeField;
    QryHistogramSHIFT: TBCDField;
    QryHistogramSTART_TIME: TDateTimeField;
    QryHistogramEND_TIME: TDateTimeField;
    QryHistogramEVENT: TStringField;
    QryHistogramSTATE: TStringField;
    QryHistogramCOLOR: TFMTBCDField;
    QryHistogramHIST_ILLUM_RT_ID: TBCDField;
    Series1: TGanttSeries;
    Panel3: TUniPanel;
    Shape1: TUniPanel;
    Shape2: TUniPanel;
    Shape4: TUniPanel;
    Shape5: TUniPanel;
    sbtnZoomIn: TUniSpeedButton;
    sbtnZoomOut: TUniSpeedButton;
    Bevel2: TUniPanel;
    sbtnReset: TUniSpeedButton;
    TimerZoomIn: TUniTimer;
    TimerZoomOut: TUniTimer;
    QryHistogramY_ANCHOR: TFMTBCDField;
    QryHistogramRAW_END_TIME: TDateTimeField;
    QryHistogramROWNUM: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApplyClick(Sender: TObject);
    procedure QryHistogramBeforeOpen(DataSet: TDataSet);
    procedure Series1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbtnResetClick(Sender: TObject);
    procedure TimerZoomInTimer(Sender: TObject);
    procedure TimerZoomOutTimer(Sender: TObject);
    procedure sbtnZoomInMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbtnZoomOutMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure wwDBComboBoxCriteriaCloseUp(Sender: TObject);
  private
    FIllum_RT_ID: Real;
    FProd_Date: TDateTime;
    FShift: Real;
    FChartNeedsReset: Boolean;
    FSelectedValueIndex: Integer;

    procedure SetIllum_RT_ID(const Value: Real);
    procedure SetProd_Date(const Value: TDateTime);
    procedure SetShift(const Value: Real);
    procedure InitFormVars( AResetChart: Boolean = FALSE );
    procedure ZoomIn;
    procedure ZoomOut;
    procedure CenterChartVertically;
    procedure SetDisplayMode(const Value: Integer);
    { Private declarations }
  protected
    { TODO -oathite -cWebConvert : Depends on IQMS.Common.UserMessages
    procedure IQNotify( var Msg: TMessage ); message iq_Notify; }
  public
    { Public declarations }
    property Illum_RT_ID: Real read FIllum_RT_ID write SetIllum_RT_ID;
    property Prod_Date: TDateTime read FProd_Date write SetProd_Date;
    property Shift: Real read FShift write SetShift;

    class procedure DoShow(  ADisplayMode: Integer );
    property DisplayMode: Integer write SetDisplayMode;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls,
  { TODO -oathite -cWebConvert : Depends on rt_histogram_detail
  rt_histogram_detail, }
  { TODO -oathite -cWebConvert : Depends on rt_histogram_criteria
  rt_histogram_criteria, }
  IQMS.Common.HelpHook;

{ TFrmRTHistogramBase }

class procedure TFrmRTHistogramBase.DoShow( ADisplayMode: Integer );
var
  LFrmRTHistogramBase : TFrmRTHistogramBase;
begin
  if IQMS.Common.Controls.FindFormByClassType(self) <> nil then
     { TODO -oathite -cWebConvert : Depends on IQMS.Common.UserMessages
     IQMS.Common.Controls.PostMessageToForm( self, iq_Notify,  ADisplayMode, 0) }
  else
  begin
    LFrmRTHistogramBase := TFrmRTHistogramBase.Create(uniGUIApplication.UniApplication);
    LFrmRTHistogramBase.DisplayMode := ADisplayMode;
    LFrmRTHistogramBase.Show;
  end;
end;

procedure TFrmRTHistogramBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

{ TODO -oathite -cWebConvert : Depends on IQMS.Common.UserMessages }
(*
procedure TFrmRTHistogramBase.IQNotify(var Msg: TMessage);
begin
  Illum_RT_ID:= Msg.LParam; {illum_rt_id}

  if (Prod_Date = 0) and (wwDBComboBoxCriteria.ItemIndex = 0) then
     InitFormVars( TRUE );

  sbtnApply.Click;
end;*)

procedure TFrmRTHistogramBase.SetDisplayMode(const Value: Integer);
begin
  wwDBComboBoxCriteria.ItemIndex:= Value;
end;

procedure TFrmRTHistogramBase.SetIllum_RT_ID(const Value: Real);
begin
  FChartNeedsReset:= FIllum_RT_ID <> Value;
  FIllum_RT_ID := Value;
  StatusBar1.Panels[ 0 ].Text:= Format('ID: %.0f', [ Value ]);
end;

procedure TFrmRTHistogramBase.SetProd_Date(const Value: TDateTime);
var
  S: string;
begin
  FProd_Date:= Value;
  if FProd_Date = 0 then
     S:= 'N/A'
  else
     S:= DateToStr( FProd_Date );
  StatusBar1.Panels[ 1 ].Text:= Format('Date: %s', [ S ]);
end;

procedure TFrmRTHistogramBase.SetShift(const Value: Real);
var
  S: string;
begin
  FShift:= Value;
  if FShift = 0 then
     S:= 'N/A'
  else
     S:= FloatToStr(FShift);
  StatusBar1.Panels[ 2 ].Text:= Format('Shift: %s', [ S ]);
end;

procedure TFrmRTHistogramBase.InitFormVars( AResetChart: Boolean = FALSE );
var
  A: Variant;
  AProd_Date: TDateTime;
  AShift: Real;
begin
  case wwDBComboBoxCriteria.ItemIndex of
    0: {current prod date and shift}
       begin
         Prod_Date:= 0;
         Shift    := 0;
         A:= SelectValueArrayFmt( 'select m.prod_date, m.prod_shift from hist_illum_rt h, v_mfgcell_param_all m where h.id = %f and NVL(h.mfgcell_id, -1) = m.mfgcell_id(+)', [ Illum_RT_ID ]);
         if VarArrayDimCount( A ) > 0 then
         begin
           if not VarIsNull(A[0]) then
              Prod_Date:= Trunc(A[0]);
           Shift:= A[1];
         end;
       end;

    1: {entire prod run}
       begin
         Prod_Date:= 0;
         Shift    := 0;
       end;

    2: {production date and shift}
       begin
         AProd_Date:= FProd_Date;
         AShift    := FShift;
         { TODO -oathite -cWebConvert : Depends on rt_histogram_criteria
         if TFrmRTHistogramCriteria.DoShowModal( self, AProd_Date, AShift ) then // rt_histogram_criteria.pas
         begin
           Prod_Date:= AProd_Date;
           Shift    := AShift;
         end; }
       end;
  end;

  if AResetChart then
     FChartNeedsReset:= TRUE;
end;

procedure TFrmRTHistogramBase.sbtnApplyClick(Sender: TObject);
begin
  Reopen(QryHistogram);
  DBChart1.RefreshData;

  if FChartNeedsReset then
  begin
     DBChart1.UndoZoom;
     FChartNeedsReset:= FALSE;
  end;
end;

procedure TFrmRTHistogramBase.QryHistogramBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('illum_rt_id').Value := Illum_RT_ID;
  //   ParamByName('prod_date').Value := Prod_Date;
  //   ParamByName('shift').Value := Shift;
  //
  //   if wwDBComboBoxCriteria.ItemIndex = 1 then
  //      ParamByName('entire_run').Value := 1
  //   else
  //      ParamByName('entire_run').Value := 0;
  // end;
  AssignQueryParamValue( DataSet, 'illum_rt_id', Illum_RT_ID);
  AssignQueryParamValue( DataSet, 'prod_date',   Prod_Date);
  AssignQueryParamValue( DataSet, 'shift',       Shift);
  if wwDBComboBoxCriteria.ItemIndex = 1 then
     AssignQueryParamValue( DataSet, 'entire_run', 1)
  else
     AssignQueryParamValue( DataSet, 'entire_run', 0)
end;

procedure TFrmRTHistogramBase.Series1Click(Sender: TChartSeries; ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbLeft then EXIT;
  { TODO -oathite -cWebConvert : Depends on rt_histogram_detail
  if (ValueIndex >= 0) and QryHistogram.Locate( 'rownum', ValueIndex + 1, []) then
     TTFrmRTHistogramDetail.DoShow( self, QryHistogramID.asFloat );   // rt_histogram_detail.pas  }
end;

procedure TFrmRTHistogramBase.sbtnResetClick(Sender: TObject);
begin
  DBChart1.UndoZoom;
  CenterChartVertically;
end;

procedure TFrmRTHistogramBase.ZoomIn;
var
  ARect: TRect;
begin
  ARect.Left  := 40;
  ARect.Top   := 5;
  ARect.Right := DBChart1.Width - 40;
  ARect.Bottom:= DBChart1.Height - 5;
  DBChart1.ZoomRect( ARect );
  CenterChartVertically;
end;

procedure TFrmRTHistogramBase.ZoomOut;
begin
  DBChart1.ZoomRect( Rect( -5, -5, DBChart1.Width + 5, DBChart1.Height + 5 ));
  CenterChartVertically;
end;

procedure TFrmRTHistogramBase.CenterChartVertically;
begin
  with DBChart1.LeftAxis do
  begin
    Automatic:= FALSE;
    Maximum:= 1;
    Minimum:= 1;
    DBChart1.RefreshData;
  end;
end;

procedure TFrmRTHistogramBase.TimerZoomInTimer(Sender: TObject);
begin
  ZoomIn;
end;

procedure TFrmRTHistogramBase.TimerZoomOutTimer(Sender: TObject);
begin
  ZoomOut;
end;

procedure TFrmRTHistogramBase.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);
  FormStyle:= fsStayOnTop;
end;

procedure TFrmRTHistogramBase.wwDBComboBoxCriteriaCloseUp(Sender: TObject);
begin
  InitFormVars( TRUE );
end;

procedure TFrmRTHistogramBase.sbtnZoomInMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TimerZoomIn.Enabled:= TRUE;
end;

procedure TFrmRTHistogramBase.sbtnZoomOutMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TimerZoomOut.Enabled:= TRUE;
end;

procedure TFrmRTHistogramBase.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TimerZoomOut.Enabled:= FALSE;
  TimerZoomIn.Enabled := FALSE;
end;


procedure TFrmRTHistogramBase.FormActivate(Sender: TObject);
begin
   IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmRT{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.

