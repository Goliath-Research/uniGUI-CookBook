unit spc_chartwiz_chart_bitmap;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Chart,
  UniChart,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniProgressBar, Vcl.Controls;

type
  TFrmSPCChartWizExportChartBmp = class(TUniForm)
    PnlProgress: TUniPanel;
    PnlChartParent: TUniPanel;
    ProgressBar1: TUniProgressBar;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetShowProgress: Boolean;
    procedure SetShowProgress(const Value: Boolean);
    function GetMaxProgress: Integer;
    function GetProgressPosition: Integer;
    procedure SetMaxProgress(const Value: Integer);
    procedure SetProgressPosition(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure ApplyChart(AChart: TUniChart; AProgress: Integer);
    property MaxProgress: Integer read GetMaxProgress write SetMaxProgress;
    property ShowProgress: Boolean read GetShowProgress write SetShowProgress;
    property ProgressPosition: Integer read GetProgressPosition
      write SetProgressPosition;
  end;

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.FormFocus;

{ TFrmSPCChartWizExportChartBmp }

procedure TFrmSPCChartWizExportChartBmp.FormCreate(Sender: TObject);
begin
  //IQMS.Common.Controls.CenterForm(Self, True);
end;

procedure TFrmSPCChartWizExportChartBmp.FormShow(Sender: TObject);
begin

  //IQMS.Common.FormFocus.ForceFormFocus(Self);
end;

procedure TFrmSPCChartWizExportChartBmp.ApplyChart(AChart: TUniChart;
  AProgress: Integer);
begin
  if Assigned(AChart) then
    AChart.Parent := PnlChartParent;
  if (AProgress > - 1) then
    ProgressBar1.Position := AProgress;
  AChart.Left := 1;
  AChart.Top := 1;
  IQMS.Common.Controls.CenterControlsHorizInWindowB(PnlChartParent, [AChart]);
  AChart.Update;
  Self.Update;
end;

function TFrmSPCChartWizExportChartBmp.GetShowProgress: Boolean;
begin
  Result := PnlProgress.Visible;
end;

procedure TFrmSPCChartWizExportChartBmp.SetShowProgress(const Value: Boolean);
begin
  PnlProgress.Visible := Value;
end;

function TFrmSPCChartWizExportChartBmp.GetMaxProgress: Integer;
begin
  Result := ProgressBar1.Max;
end;

procedure TFrmSPCChartWizExportChartBmp.SetMaxProgress(const Value: Integer);
begin
  ProgressBar1.Max := Value;
end;

function TFrmSPCChartWizExportChartBmp.GetProgressPosition: Integer;
begin
  Result := ProgressBar1.Position;
end;

procedure TFrmSPCChartWizExportChartBmp.SetProgressPosition(
  const Value: Integer);
begin
  ProgressBar1.Position := Value;
end;

end.
