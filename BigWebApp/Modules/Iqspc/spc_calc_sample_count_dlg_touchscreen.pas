unit spc_calc_sample_count_dlg_touchscreen;

interface

uses
  spc_calc_sample_count_dlg,
  Vcl.StdCtrls,
  Vcl.Buttons, uniListBox, Vcl.Controls, IQMS.WebVcl.SecurityRegister,
  uniMultiItem, uniComboBox, uniGUIClasses, uniEdit, uniLabel, uniSplitter,
  uniButton, System.Classes, Vcl.Forms, uniGUIBaseClasses, uniPanel, uniBitBtn,
  uniSpeedButton;

type
  TFrmSPCCalcSampleCountTouchscreen = class(TFrmSPCCalcSampleCount)
    sbtnConfidenceInterval: TUniSpeedButton;
    sbtnPopulation: TUniSpeedButton;
    lstConfidencePercentile: TUniListBox;
    procedure FormCreate(Sender: TObject);
    procedure sbtnConfidenceIntervalClick(Sender: TObject);
    procedure sbtnPopulationClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lstConfidencePercentileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{TODO -oBantuK -cWebConvert : Dependency with touchscrn.pas
uses
  touchscrn;}

procedure TFrmSPCCalcSampleCountTouchscreen.FormCreate(Sender: TObject);
begin
  inherited;
  //WEB_CONVERT touchscrn.ApplyTouchscreenFont(Self);
end;

procedure TFrmSPCCalcSampleCountTouchscreen.FormShow(Sender: TObject);
begin
  inherited;

  lstConfidencePercentile.Items.Clear;
  lstConfidencePercentile.Items.AddStrings(cmbConfidencePercentile.Items);
  lstConfidencePercentile.ItemIndex := cmbConfidencePercentile.ItemIndex;
  cmbConfidencePercentile.Visible := False;
end;

procedure TFrmSPCCalcSampleCountTouchscreen.lstConfidencePercentileClick(
  Sender: TObject);
begin
  inherited;
  cmbConfidencePercentile.ItemIndex := lstConfidencePercentile.ItemIndex;
  DoControlChange(cmbConfidencePercentile);
end;

procedure TFrmSPCCalcSampleCountTouchscreen.sbtnConfidenceIntervalClick(
  Sender: TObject);
var
  AResult: Integer;
begin
  AResult := ConfidenceInterval;
  {TODO -oBantuK -cWebConvert : Dependency with touchscrn.pas
  if touchscrn.TouchScreen_KeyPad(Self, AResult) then
    ConfidenceInterval := AResult;}
end;

procedure TFrmSPCCalcSampleCountTouchscreen.sbtnPopulationClick(
  Sender: TObject);
var
  AResult: Integer;
begin
  AResult := Population;
  {TODO -oBantuK -cWebConvert : Dependency with touchscrn.pas
  if touchscrn.TouchScreen_KeyPad(Self, AResult) then
    Population := AResult;}
end;

end.
