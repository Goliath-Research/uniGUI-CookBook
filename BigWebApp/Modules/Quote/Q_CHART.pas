unit Q_Chart;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  VclTee.TeeGDIPlus,
  VCLTee.TeEngine,
  VCLTee.Series,
  VCLTee.GanttCh,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  IQMS.WebVcl.About,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  UniChart,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer, uniMainMenu;

type
  TFrmQChart = class(TUniForm)
    ToolPanel1: TUniPanel;
    sbtnRotate: TUniSpeedButton;
    Timer1: TUniTimer;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Bevel1: TUniPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure sbtnRotateClick(Sender: TObject);
    procedure sbtnRotateMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbtnRotateMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
  protected
    procedure lboxCurrentDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure ChartAfterDraw(Sender: TObject);
  private
    { Private declarations }
    Fpanels:TList;
    procedure FreeSeries(Chart:TUniChart);
    procedure FreeCharts(Panel:TUniPanel);
    procedure CreatePie(Chart:TUniChart; nId:Real);
    procedure FreePanels;
    procedure AssignListBox(Panel:TUniPanel);
    procedure AssignTChart(Panel:TUniPanel; nId:Real);
    procedure LoadCharts(nId:Real);
{ TODO -oGPatil -cWebConvert : Adress Access Violation Error
    procedure PositionPanels;   }
    procedure SetID(const Value: Real);
  public
    { Public declarations }
    property ID : Real write SetID;
  end;

procedure DoQ_Chart(AId:Real);

implementation
{$R *.DFM}
uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.Tee,
  quote_rscstr,
  uniMultiItem,
  uniListBox;


procedure DoQ_Chart(AId:Real);
var
  LFrmQChart : TFrmQChart;
begin
  LFrmQChart := TFrmQChart.Create(UniGUIApplication.UniApplication);
  LFrmQChart.ID := AId;
  LFrmQChart.ShowModal;
end;

procedure TFrmQChart.FormResize(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Adress Access Violation Error
  PositionPanels;   }
end;

procedure TFrmQChart.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
{ TODO -oGPatil -cWebConvert : Adress Access Violation Error
  PositionPanels;  }
end;                                     

procedure TFrmQChart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmQChart.LoadCharts(nId:Real);
var
  Panel:TUniPanel;
begin
  if Fpanels <> nil then FreePanels;
  Fpanels := TList.Create;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select id from qset_price where quote_id = %f', [nId]));
    Open;
    while not eof do
    begin
      Panel := TUniPanel.Create(self);
      Panel.Parent := self;
      Fpanels.Add(Panel);
      AssignTChart(Panel, FieldByName('ID').asFloat);
      AssignListBox(Panel);
      Next;
    end;
  finally
    Free;
  end;
end;

{ TODO -oGPatil -cWebConvert : Adress Access Violation Error
procedure TFrmQChart.PositionPanels;
var
  i, j, nWidth, nHeight, nLeft, nColumns, nRows:Integer;
begin
  if FPanels = nil then Exit;
  j := 1;
  ScrollInView(ToolPanel1);

  nColumns:= Trunc( ClientWidth / Sqrt((ClientWidth * (ClientHeight - ToolPanel1.Height) / FPanels.Count )) + 1);
  nWidth  := ClientWidth div nColumns;
  if FPanels.Count mod nColumns = 0 then
     nRows:= FPanels.Count div nColumns
  else
     nRows:= Trunc( FPanels.Count/nColumns + 1);
  nHeight := (ClientHeight - ToolPanel1.Height) div nRows;
  for i := 1 to FPanels.Count do
  with TUniPanel(FPanels[i - 1]) do
  begin
    nLeft := i mod nColumns - 1;
    if nLeft < 0 then nLeft := nColumns - 1;
    Width  := nWidth;
    Height := nHeight;
    Left   := nWidth  * nLeft;
    Top    := ToolPanel1.Height + nHeight * (j - 1);
    if (i mod nColumns) = 0 then Inc(j);
  end
end;  }

procedure TFrmQChart.FreePanels;
var
  i:Integer;
begin
  with Fpanels do
  for i := 0 to (Count - 1) do
  begin
    FreeCharts(TUniPanel(Fpanels[i]));
    TUniPanel(Fpanels[i]).Free;
  end;
  Fpanels.Free;
end;

procedure TFrmQChart.FreeCharts(Panel:TUniPanel);
var
  i:Integer;
begin
  with Panel do
    for i := 0 to (ControlCount - 1) do
    begin
      if Controls[i] is TUniChart then FreeSeries(TUniChart(Controls[i]));
      Controls[i].Free;
    end;
end;

procedure TFrmQChart.FreeSeries(Chart:TUniChart);
var
  i:Integer;
begin
{ TODO -oGPatil -cWebConvert : TUniChart does not contain SeriesCount
  for i:= 0 to Chart.SeriesCount -1 do
    with  Chart.Series[ i ] do free; }
end;

procedure TFrmQChart.AssignTChart(Panel:TUniPanel; nId:Real);
var
  Chart:TUniChart;
  cTitle:String;
begin
  Chart := TUniChart.Create(self);
  cTitle := Format('%d', [Trunc(SelectValueFmtAsFloat('select quan from qset_price where id = %f', [nId]))]);
  with Chart do
  begin
    Parent := Panel;
    Align  := alClient;
{ TODO -oGPatil -cWebConvert : TUniChart does not contain respective properties
    OnAfterDraw := ChartAfterDraw;
    Legend.TextStyle := ltsRightPercent;
    Legend.Visible := False;
    Title.Text.Add(cTitle);
    Chart3dPercent := 6;
    MarginBottom   := 2;
    MarginLeft     := 2;
    MarginRight    := 2;
    MarginTop      := 0;   }
  end;
  CreatePie(Chart, nId);
end;

procedure TFrmQChart.ChartAfterDraw(Sender: TObject);
var
  ListBox:TUniListBox;
  i:integer;
begin
  for i:= 0 to TUniChart(Sender).Parent.ControlCount - 1 do
    if TUniChart(Sender).Parent.Controls[i] is TUniListBox then
      ListBox := TUniListBox(TUniChart(Sender).Parent.Controls[i]);
{ TODO -oGPatil -cWebConvert : TUniChart does not contain respective properties
  AssignListBoxLegend( ListBox, TUniChart(Sender).Series[0]);  }
end;

procedure TFrmQChart.AssignListBox(Panel:TUniPanel);
var
  ListBox:TUniListBox;
  cTitle:String;
begin
  ListBox := TUniListBox.Create(self);
  with ListBox do
  begin
    Parent     := Panel;
    Align      := alBottom;
{ TODO -oGPatil -cWebConvert : TUniListBox does not contain respective properties
    Style      := lbOwnerDrawFixed;
    OnDrawItem := lboxCurrentDrawItem;   }
    Height := 55;
  end;
end;

procedure TFrmQChart.lboxCurrentDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  DrawListBoxLegend( Control, Index, Rect, State );
end;

procedure TFrmQChart.CreatePie(Chart:TUniChart; nId:Real);
var
  AOther: Real;
begin
  with TPieSeries.Create(self) do
  begin
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TCustomAxisPanel' and 'TUniChart'
    ParentChart := Chart;  }
    with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add(IQFormat('select * from qset_price where id = %f', [nId]));
      Open;

      if FieldByName('TOT_RAWMAT_COST_NO_MU').asFloat <> 0 then
         // Add(FieldByName('TOT_RAWMAT_COST_NO_MU').asFloat, 'Mat. Cost ', clRed);
         Add( FieldByName('TOT_RAWMAT_COST_NO_MU').asFloat /  FieldByNAme('QUAN').asFloat / FieldByName('TOT_PRICE_PER').asFloat * 100,
              'Mat. Cost ',
              clRed);

      if FieldByName('TOT_PROD_COST_NO_MU').asFloat <> 0 then
         // Add(FieldByName('TOT_PROD_COST_NO_MU').asFloat, 'Prod. Cost', clBlue);
         Add( FieldByName('TOT_PROD_COST_NO_MU').asFloat /  FieldByNAme('QUAN').asFloat / FieldByName('TOT_PRICE_PER').asFloat * 100,
              'Prod. Cost',
              clBlue );

      if (FieldByName('TOT_PRICE').asFloat - FieldByName('TOT_COST_NO_MU').asFloat) <> 0 then
         Add( (FieldByName('TOT_PRICE').asFloat - FieldByName('TOT_COST_NO_MU').asFloat ) / FieldByNAme('QUAN').asFloat / FieldByName('TOT_PRICE_PER').asFloat * 100,
              'Profit    ',
              clGreen);

      AOther:= 100
               - FieldByName('TOT_RAWMAT_COST_NO_MU').asFloat /  FieldByNAme('QUAN').asFloat  / FieldByName('TOT_PRICE_PER').asFloat * 100
               - FieldByName('TOT_PROD_COST_NO_MU').asFloat /  FieldByNAme('QUAN').asFloat    / FieldByName('TOT_PRICE_PER').asFloat * 100
               - ( FieldByName('TOT_PRICE').asFloat - FieldByName('TOT_COST_NO_MU').asFloat ) / FieldByNAme('QUAN').asFloat / FieldByName('TOT_PRICE_PER').asFloat * 100;
      if AOther < 0 then
         AOther:= 0;

      if AOther > 0 then
         Add( AOther,
              'Other Cost',
              clYellow );

    finally
      Free;
    end;
    if Count = 0 then
    begin
      Add(1, ' ', clWhite);
      Marks.Style := smsLabel;
    end
    else Marks.Style := smsLabelPercent;
    PercentFormat := '#00.00 %';
    Marks.Visible := false;
  end;
end;

procedure TFrmQChart.Timer1Timer(Sender: TObject);
begin
  sbtnRotateClick(NIL);
end;

procedure TFrmQChart.sbtnRotateClick(Sender: TObject);
var
  i:Integer;
begin
  for i:= 0 to ComponentCount - 1 do
  if Components[i] is TChartSeries then
    with Components[i] as TPieSeries do
       RotationAngle:= (RotationAngle + 1) mod 360;
end;

procedure TFrmQChart.sbtnRotateMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer1.Enabled:= TRUE;
end;

procedure TFrmQChart.sbtnRotateMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer1.Enabled:= FALSE;
end;

procedure TFrmQChart.SetID(const Value: Real);
begin
  LoadCharts(Value);
  Caption := Format( quote_rscstr.cTXT000000048 {'RFQ # %s'},
  [SelectValueFmtAsString('select rfq from quote where id = %f', [Value])]);
end;

procedure TFrmQChart.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmQUOTE{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmQChart.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmQChart.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmQChart.Contents1Click(Sender: TObject);
begin
  IqHelp.HelpContext(1171349);
end;

end.
