unit spc_calc_sample_count_dlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uniGUIForm,
  IQMS.WebVcl.SecurityRegister,
  uniMultiItem,
  uniComboBox,
  uniGUIClasses,
  uniEdit,
  uniLabel,
  uniSplitter,
  uniButton,
  uniGUIBaseClasses,
  uniGUIApplication,
  uniPanel;

type
  { TFrmSPCCalcSampleCount }
  TFrmSPCCalcSampleCount = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    edtConfidenceInterval: TUniEdit;
    edtPopulation: TUniEdit;
    edtResult: TUniEdit;
    cmbConfidencePercentile: TUniComboBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    lblPercentSign: TUniLabel;
    SR: TIQWebSecurityRegister;
    procedure btnCalcClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPopulationExit(Sender: TObject);
    procedure edtConfidenceIntervalExit(Sender: TObject);
    procedure DoControlChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPopulation: Integer;
    FSampleCount: Integer;
    procedure LoadConfidenceLevelComboBox;
    function Validate: Boolean;
    procedure Calculate;
    {TODO -oBantuK -cWebConvert : Dependency with spc.pas
    function GetConfidencePercentile: TConfidencePercentile;
    procedure SetConfidencePercentile(const Value: TConfidencePercentile);}
    function GetConfidenceInterval: Integer;
    procedure SetConfidenceInterval(const Value: Integer);
    function GetPopulation: Integer;
    procedure SetPopulation(const Value: Integer);
    procedure SetButtons;
  public
    { Public declarations }
    class function DoShowModal(const AOwner: TComponent;
      {TODO -oBantuK -cWebConvert : Dependency with spc.pas
      var AConfidencePercentile: TConfidencePercentile;}
      var AConfidenceInterval: Integer; var APopulation: Integer;
      var ASampleCount: Integer): Boolean;
    {TODO -oBantuK -cWebConvert : Dependency with spc.pas
    property ConfidencePercentile: TConfidencePercentile
      read GetConfidencePercentile write SetConfidencePercentile;}
    property ConfidenceInterval: Integer read GetConfidenceInterval
      write SetConfidenceInterval;
    property Population: Integer read GetPopulation write SetPopulation;
    property SampleCount: Integer read FSampleCount;
  end;

function DoCalculateSampleCount(
  {TODO -oBantuK -cWebConvert : Dependency with spc.pas
  var AConfidencePercentile: TConfidencePercentile;}
  var AConfidenceInterval: Integer; var APopulation: Integer;
  var ASampleCount: Integer;
  const ATouchScreen: Boolean = False): Boolean;

implementation

{$R *.dfm}


{ TODO -oBantuK -cWebConvert : Wait till following two files are added to
  IQWeb project. Once available we can uncomment them out
uses
  iqctrl,
  iqmesg,
  iqmisc,
  iqsecins,
  iqstring,
  spc_calc_sample_count_dlg_touchscreen,
  spc_rscstr,
  spc_statistics;}
uses
  IQMS.Common.StringUtils,
  spc_rscstr,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  spc_calc_sample_count_dlg_touchscreen;

function DoCalculateSampleCount(
  { TODO -oBantuK -cWebConvert : Dependency with spc.pas
  var AConfidencePercentile: TConfidencePercentile;}
  var AConfidenceInterval: Integer; var APopulation: Integer;
  var ASampleCount: Integer; const ATouchScreen: Boolean): Boolean;
begin
  ASampleCount := 0;
  if ATouchScreen then
    Result := TFrmSPCCalcSampleCountTouchscreen.DoShowModal(UniApplication,
      {WEB_CONVERT AConfidencePercentile,}
      AConfidenceInterval, APopulation, ASampleCount)
  else
    Result := TFrmSPCCalcSampleCount.DoShowModal(UniApplication, {WEB_CONVERT AConfidencePercentile,}
      AConfidenceInterval, APopulation, ASampleCount);
end;
{ TFrmSPCCalcSampleCount }
class function TFrmSPCCalcSampleCount.DoShowModal(const AOwner: TComponent;
  { TODO -oBantuK -cWebConvert : Dependency with spc.pas
  var AConfidencePercentile: TConfidencePercentile;}
  var AConfidenceInterval: Integer; var APopulation: Integer;
  var ASampleCount: Integer): Boolean;
begin
  with Self.Create(AOwner) do
    try
      Result := ShowModal = mrOK;
      if Result then
        begin
          { TODO -oBantuK -cWebConvert : Dependency with spc.pas
          AConfidencePercentile := ConfidencePercentile;}
          AConfidenceInterval := ConfidenceInterval;
          APopulation := Population;
          ASampleCount := SampleCount;
        end;
    finally
      Release;
    end;
end;

procedure TFrmSPCCalcSampleCount.FormShow(Sender: TObject);
begin
  SetButtons;
  { TODO -oBantuK -cWebConvert : Dependency with iqsecins.pas
  iqsecins.EnsureSecurityInspectorOnTopOf(Self);}
  if cmbConfidencePercentile.CanFocus then
    cmbConfidencePercentile.SetFocus;
end;

procedure TFrmSPCCalcSampleCount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmSPCCalcSampleCount.edtConfidenceIntervalExit(Sender: TObject);
begin
  { spc_rscstr.cTXT000000763 =
    'Confidence interval is a percentage and must be a positive number
    between 1 and 100.'; }
  IQAssert(ConfidenceInterval in [1 .. 100], spc_rscstr.cTXT000000763);
end;

procedure TFrmSPCCalcSampleCount.edtPopulationExit(Sender: TObject);
begin
  // spc_rscstr.cTXT000000762 = 'Population must be a positive number.'
  IQAssert(Population >= 0, spc_rscstr.cTXT000000762);
end;

procedure TFrmSPCCalcSampleCount.btnCalcClick(Sender: TObject);
begin
  Calculate;
end;

procedure TFrmSPCCalcSampleCount.btnOkClick(Sender: TObject);
begin
  // spc_rscstr.cTXT000000856 = 'Please select a Confidence Percentile.';
  IQAssert(cmbConfidencePercentile.ItemIndex > - 1, spc_rscstr.cTXT000000856);
  // spc_rscstr.cTXT000000857 = 'Please enter a Confidence Interval.';
  IQAssert(edtConfidenceInterval.Text > '', spc_rscstr.cTXT000000857);
  // spc_rscstr.cTXT000000858 = 'Please enter a Populate value.';
  IQAssert(edtPopulation.Text > '', spc_rscstr.cTXT000000858);
  if (edtResult.Text = '') then
    begin
      // spc_rscstr.cTXT000000761 =
      // 'Do you want to calculate the sample count?'
      if IQMS.Common.Dialogs.IQConfirmYN(spc_rscstr.cTXT000000761) then
        Calculate
      else
        ModalResult := mrCancel;
      Exit;
    end;
  ModalResult := mrOK;
end;

function TFrmSPCCalcSampleCount.GetConfidenceInterval: Integer;
begin
  Result := 0;
  if not iqstring.IsEmpty(edtConfidenceInterval.Text) then
    System.SysUtils.TryStrToInt(edtConfidenceInterval.Text, Result);
end;

procedure TFrmSPCCalcSampleCount.SetConfidenceInterval(const Value: Integer);
begin
  edtConfidenceInterval.Text := IntToStr(Value);
end;

function TFrmSPCCalcSampleCount.GetPopulation: Integer;
begin
  Result := 0;
  if not iqstring.IsEmpty(edtPopulation.Text) then
    System.SysUtils.TryStrToInt(edtPopulation.Text, Result);
end;

procedure TFrmSPCCalcSampleCount.SetPopulation(const Value: Integer);
begin
  if Value <= 0 then
    edtPopulation.Text := ''
  else
    edtPopulation.Text := IntToStr(Value);
end;

procedure TFrmSPCCalcSampleCount.UniFormCreate(Sender: TObject);
begin
  FSampleCount := 0;
  LoadConfidenceLevelComboBox;
  { TODO -oBantuK -cWebConvert : Dependency with IQCTRL.pas file
  iqctrl.CenterForm(Self, True);}
end;

{ TODO -oBantuK -cWebConvert : Dependency with spc.pas
function TFrmSPCCalcSampleCount.GetConfidencePercentile: TConfidencePercentile;
begin
  // TConfidencePercentile is declared in spc.pas
  Result := TConfidencePercentile(cmbConfidencePercentile.ItemIndex);
end;

procedure TFrmSPCCalcSampleCount.SetConfidencePercentile
  (const Value: TConfidencePercentile);
begin
  cmbConfidencePercentile.ItemIndex := Ord(Value);
end;
}

procedure TFrmSPCCalcSampleCount.Calculate;
var
  //WEB_CONVERT AConfidencePercentile: TConfidencePercentile;
  AInterval: Real;
  APopulation: Integer;
begin
  if not Validate then
    Exit;
  //WEB_CONVERT AConfidencePercentile := GetConfidencePercentile;
  AInterval := StrToFloat(edtConfidenceInterval.Text);
  APopulation := StrToInt(edtPopulation.Text);
  {WEB_CONVERT FSampleCount := spc_statistics.CalculateSampleSize(AConfidencePercentile,
    AInterval, APopulation);}
  edtResult.Text := IntToStr(FSampleCount);
  SetButtons;
end;

procedure TFrmSPCCalcSampleCount.LoadConfidenceLevelComboBox;
var
  //WEB_CONVERT AItem, ADefault: TConfidencePercentile;
  AIndex: Integer;
begin
  //WEB_CONVERT ADefault := spc.GetDefaultConfidencePercentile;
  AIndex := - 1;
  try
    cmbConfidencePercentile.Items.BeginUpdate;
    cmbConfidencePercentile.Items.Clear;
    {TODO -oBantuK -cWebConvert : Dependency with spc.pas
    for AItem := low(ConfidencePercentileStr)
      to high(ConfidencePercentileStr) do
      begin
        cmbConfidencePercentile.Items.Add(ConfidencePercentileStr[AItem]);
        if (ADefault = AItem) then
          AIndex := Ord(AItem);
      end;
      }
    cmbConfidencePercentile.ItemIndex := AIndex;
  finally
    cmbConfidencePercentile.Items.EndUpdate;
  end;
end;

function TFrmSPCCalcSampleCount.Validate: Boolean;
begin
  Result := (cmbConfidencePercentile.ItemIndex > - 1) and
    (edtConfidenceInterval.Text > '') and (edtPopulation.Text > '');
end;

procedure TFrmSPCCalcSampleCount.DoControlChange(Sender: TObject);
begin
  edtResult.Text := '';
  FSampleCount := 0;
  if (cmbConfidencePercentile.ItemIndex > - 1) and
    (edtConfidenceInterval.Text > '') and (edtPopulation.Text > '') then
    Calculate;
  SetButtons;
end;

procedure TFrmSPCCalcSampleCount.SetButtons;
begin
  btnOk.Enabled := Validate and (FSampleCount > 0);
end;

end.
