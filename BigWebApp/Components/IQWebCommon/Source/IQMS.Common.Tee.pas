// 08-18-2016 Axis are not implemented in UniGUI?
//
unit IQMS.Common.Tee;

interface

uses
  Winapi.Windows, Vcl.Forms, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls,
  // VclTee.Chart, VclTee.TeEngine, VclTee.Series,
  Vcl.StdCtrls,uniListBox,uniChart,uniGUIForm,uniPanel;

procedure AssignListBoxLegend(ListBox: TUniListBox; Series: TUniChartSeries);
procedure DrawListBoxLegend(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);

procedure AssignListBoxChartLegend(ListBox: TUniListBox; AChart: TUniChart);
procedure DrawListBoxChartLegend(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);

/// <summary> Draw a gray today bar, aligned to the bottom axis.  The
/// BottomAxis of the chart must be by date and time. Optionally, a red
/// line can be shown for the current time.
/// </summary>
/// <remarks>
/// This method should be called in the OnBeforeDrawSeries event of the
/// chart.
/// </remarks>
procedure DrawBottomAxisTodayBar(AChart: TUniCustomChart; AShowTodayLine: Boolean);


type
  TIQWebChartPagingTool = class(TComponent)
  private
    FChart: TUniCustomChart;
    FScrollPercentage: Real;
//    function AnySeriesBothAxis(Axis: TUniChartAbstractAxes; var OtherAxis: TUniChartAbstractAxes): Boolean;
    function GetDelta: Double;
    procedure DoScroll(const ADelta: Double);
  public
    constructor Create(AChart: TUniCustomChart);
    class procedure DoScrollRight(AChart: TUniCustomChart);
    class procedure DoScrollLeft(AChart: TUniCustomChart);
    procedure ScrollRight;
    procedure ScrollLeft;
    property Chart: TUniCustomChart read FChart;
    property ScrollPercent: Real read FScrollPercentage write FScrollPercentage;
  end;

implementation

// 08-18-2016
// remove once TUniChartSeries properties are moved to public
type
  TLocalUniChartSeries = class(TUniChartSeries)
  public
    property Title;
    property Colors;
  end;

procedure AssignListBoxLegend(ListBox: TUniListBox; Series: TUniChartSeries);
{ TChart OnAfterDraw assign legend to listbox: "AssignListBoxLegend( ListBox1, Series1 )" }
var
  I,Count: Integer;

begin
  ListBox.Items.Clear;

  for I := 0 to Series.ComponentCount-1 do
    ListBox.Items.AddObject(TLocalUniChartSeries(Series.ValuesList[I]).Title, Series.ValuesList[I]);
end;

// Set ListBox to OwnerDrwFixed and OnDrawItem call:
// "DrawListBoxLegend( Control, Index, Rect, State )"
procedure DrawListBoxLegend(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  ColorRect: TRect;
  W: Integer;
begin
//  W := Rect.Bottom - Rect.Top - 5;
//  ColorRect := System.Classes.Rect(Rect.Left + 1, Rect.Top + 1, W, Rect.Bottom - 1);
//  with (Control as TUniListBox).Canvas do { draw on control canvas, not on the form }
//  begin
//    FillRect(Rect); { clear the rectangle }
//
//    Brush.Color := TColor(LongInt(TListBox(Control).Items.Objects[index]));
//    { Get Color from Objects array }
//    FillRect(ColorRect); { Draw Color Rect }
//
//    Brush.Color := clBlack;
//    FrameRect(ColorRect); { frame around it }
//
//    if not(odSelected in State) then
//      Brush.Color := clWindow
//    else
//      Brush.Color := clNavy;
//    TextOut(Rect.Left + W + 5, Rect.Top, (Control as TListBox).Items[index]) { display the text }
//  end;
end;

{ For cases where we need to display legend of diff graphs }
procedure AssignListBoxChartLegend(ListBox: TUniListBox; AChart: TUniChart);
var
  I: Integer;
begin
  ListBox.Items.Clear;
  with AChart do
    for I := 0 to SeriesList.Count - 1 do
      ListBox.Items.AddObject(TLocalUniChartSeries(SeriesList[I]).Title, SeriesList[I]);
end;

procedure DrawListBoxChartLegend(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  ColorRect: TRect;
  W: Integer;
begin
//  W := Rect.Bottom - Rect.Top - 5;
//  ColorRect := System.Classes.Rect(Rect.Left + 1, Rect.Top + 1, W, Rect.Bottom - 1);
//
//  with (Control as TUniListBox).Canvas do { draw on control canvas, not on the form }
//  begin
//    FillRect(Rect); { clear the rectangle }
//
//    // Brush.Color := TColor(LongInt(TListBox(Control).Items.Objects[index]));
//
//    { Get Color from Objects array }
//    FillRect(ColorRect); { Draw Color Rect }
//
//    Brush.Color := clBlack;
//    FrameRect(ColorRect); { frame around it }
//
//    if not(odSelected in State) then
//      Brush.Color := clWindow
//    else
//      Brush.Color := clNavy;
//
//    TextOut(Rect.Left + W + 5, Rect.Top, (Control as TListBox).Items[index]) { display the text }
//  end;
end;

procedure DrawBottomAxisTodayBar(AChart: TUniCustomChart; AShowTodayLine: Boolean);
var
  ADrawLeft, ADrawMiddle, ADrawRight: Integer;
begin
  // Note: This method is called before drawing the series on the chart
  // in order to ensure lines draw behind the series.

  // Today Bar

// 08-18-2016 Axis are not implemented in UniGUI?
//  if (AChart.BottomAxis.Minimum <= Trunc(Date)) and
//    (AChart.BottomAxis.Maximum >= Trunc(Date) + 1) then
//  begin
//    // Get the bar left and right position based on the current day
//    ADrawLeft := AChart.BottomAxis.CalcPosValue(Trunc(Date));
//    ADrawRight := AChart.BottomAxis.CalcPosValue(Trunc(Date) + 1);
//
//    // Prepare Pen and Brush
//    AChart.Canvas.Pen.Color := clSilver;
//    AChart.Canvas.Pen.Width := 1;
//    AChart.Canvas.Pen.Style := TPenStyle.psDot;
//    AChart.Canvas.Brush.Color := clSilver;
//    AChart.Canvas.Brush.Style := bsSolid;
//
//    // Draw the gray rectangle
//    AChart.Canvas.Rectangle(
//      ADrawLeft,
//      AChart.LeftAxis.IStartPos,
//      ADrawRight,
//      AChart.LeftAxis.IEndPos);
//  end;
//
//  // Today line
//  if AShowTodayLine and
//    (AChart.BottomAxis.Minimum <= Now) and
//    (AChart.BottomAxis.Maximum >= Now) then
//  begin
//    // Get the chart position based on the current date/time
//    ADrawMiddle := AChart.BottomAxis.CalcPosValue(Now);
//
//    // Prepare Pen
//    AChart.Canvas.Pen.Color := clRed;
//    AChart.Canvas.Pen.Width := 2;
//    AChart.Canvas.Pen.Style := TPenStyle.psSolid;
//
//    // Draw the red line
//    AChart.Canvas.DoVertLine(
//      ADrawMiddle,
//      AChart.LeftAxis.IStartPos,
//      AChart.LeftAxis.IEndPos);
//  end;
end;

{ TChartPagingTool }

constructor TIQWebChartPagingTool.Create(AChart: TUniCustomChart);
begin
  inherited Create(TUniPanel(AChart.Owner));
  FChart := AChart;
  FScrollPercentage := 10;
end;

class procedure TIQWebChartPagingTool.DoScrollLeft(AChart: TUniCustomChart);
begin
  with TIQWebChartPagingTool.Create(AChart) do
    try
      ScrollLeft;
    finally
      Free;
    end;
end;

class procedure TIQWebChartPagingTool.DoScrollRight(AChart: TUniCustomChart);
begin
  with TIQWebChartPagingTool.Create(AChart) do
    try
      ScrollRight;
    finally
      Free;
    end;
end;

//function TIQWebChartPagingTool.AnySeriesBothAxis(Axis: TUniChartAbstractAxes; // TChartAxis;
//  var OtherAxis: TUniChartAbstractAxes) : Boolean; //  TChartAxis): Boolean;
//var
//  t: Integer;
//begin
//  Result := False;

//  for t := 0 to FChart.SeriesCount - 1 do
//    if FChart[t].AssociatedToAxis(Axis) then
//    begin
//      if Axis.Horizontal then
//      begin
//        if FChart[t].HorizAxis = aBothHorizAxis then
//        begin
//          if Axis = FChart.TopAxis then
//            OtherAxis := FChart.BottomAxis
//          else
//            OtherAxis := FChart.TopAxis;
//          Result := True;
//        end;
//      end
//      else
//      begin
//        if FChart[t].VertAxis = aBothVertAxis then
//        begin
//          if Axis = FChart.LeftAxis then
//            OtherAxis := FChart.RightAxis
//          else
//            OtherAxis := FChart.LeftAxis;
//          Result := True;
//        end;
//      end;
//    end;
//end;

procedure TIQWebChartPagingTool.DoScroll(const ADelta: Double);
var
  tmp: Boolean;
  tmpMin: Double;
  tmpMax: Double;
//  tmpAxis2: TUniChartAbstractAxes; // TChartAxis;
begin
  tmp := True;

//  if Assigned(TUniCustomChart(FChart).OnAllowScroll) then
//  begin
//    tmpMin := TUniCustomChart(FChart).BottomAxis.Minimum + ADelta;
//    tmpMax := TUniCustomChart(FChart).BottomAxis.Maximum + ADelta;
//    TUniCustomChart(FChart).OnAllowScroll(TUniCustomChart(FChart).BottomAxis, tmpMin, tmpMax, tmp);
//  end;
//
//  if tmp then
//  begin
//    TUniCustomChart(FChart).BottomAxis.Scroll(ADelta, False);
//
//    if AnySeriesBothAxis(TUniCustomChart(FChart).BottomAxis, tmpAxis2) then
//      tmpAxis2.Scroll(ADelta, False);
//
//    with TUniCustomChart(TUniCustomChart(FChart).BottomAxis.ParentChart) do
//      if Assigned(OnScroll) then
//        OnScroll(TUniCustomChart(FChart).BottomAxis.ParentChart);
//  end;
end;

function TIQWebChartPagingTool.GetDelta: Double;
begin
  Result:= 0;
//  Result := (FChart.BottomAxis.Maximum - FChart.BottomAxis.Minimum) *
//    ScrollPercent / 100.0;
end;

procedure TIQWebChartPagingTool.ScrollLeft;
begin
  DoScroll(GetDelta);
  // FChart.CancelMouse := True;
end;

procedure TIQWebChartPagingTool.ScrollRight;
begin
  DoScroll(-GetDelta);
  // FChart.CancelMouse := True;
end;

end.
