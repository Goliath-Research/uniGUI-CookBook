unit cc_purge_base;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  { TFrmCCPurgeBase }
  TFrmCCPurgeBase = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft: TUniPanel;
    PnlClient: TUniPanel;
    PnlButtonsInner: TUniPanel;
    PnlPrompt: TUniPanel;
    lblPrompt: TUniLabel;
    lblDate: TUniLabel;
    cmbDate: TUniDateTimePicker;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    lblSummary: TUniLabel;
    procedure FormCreate(Sender: TObject);
    procedure cmbDateChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure UpdateSummary;
    function GetDurationSummaryFor(ADate: TDateTime): String;
    function ProcessExec: Boolean; virtual; abstract;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


uses
  cc_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm;

{ TFrmCCPurgeBase }

procedure TFrmCCPurgeBase.FormCreate(Sender: TObject);
begin
  { TODO : Incompatible types: 'TForm' and 'TFrmCCPurgeBase' }
  //IQMS.Common.Controls.CenterForm(Self, True);
  cmbDate.DateTime := Date - (2 * IQMS.Common.Dates.TIME_OneWeek);
  cmbDate.MaxDate := Date;
  UpdateSummary;
end;

procedure TFrmCCPurgeBase.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlLeft]);
  IQMS.Common.Controls.ResizeCheckboxes(Self, PnlClient);
end;

procedure TFrmCCPurgeBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlLeft]);
end;

procedure TFrmCCPurgeBase.cmbDateChange(Sender: TObject);
begin
  UpdateSummary;
end;

procedure TFrmCCPurgeBase.UpdateSummary;
begin
  lblSummary.Caption := GetDurationSummaryFor(cmbDate.DateTime);
  lblSummary.Update;
end;

function TFrmCCPurgeBase.GetDurationSummaryFor(ADate: TDateTime): String;
var
  AYears, AMonths, ADays: Word;
  AYearsStr,
    AMonthsStr,
    ADaysStr,
    ATemp,
    AIntervalStr: String;
  A: array of String;
  i: Integer;
begin
  // Initialization
  AYears := 0;
  AMonths := 0;
  ADays := 0;
  AIntervalStr := '';
  Result := '';

  if Trunc(ADate) > Trunc(Date) then
    Exit;

  // Get intervals
  TimeElapsedB(Date, ADate, AYears, AMonths, ADays);

  // Purge data older than
  if AYears > 0 then
    // cc_rscstr.cTXT0000742 = '%d years';
    // cc_rscstr.cTXT0000747 = '1 year';
    AYearsStr := IQMS.Common.Numbers.sIIf(AYears > 1, Format(cc_rscstr.cTXT0000742,
      [AYears]), cc_rscstr.cTXT0000747);
  if AMonths > 0 then
    // cc_rscstr.cTXT0000743 = '%d months';
    // cc_rscstr.cTXT0000746 = '1 month'
    AMonthsStr := IQMS.Common.Numbers.sIIf(AMonths > 1, Format(cc_rscstr.cTXT0000743,
      [AMonths]), cc_rscstr.cTXT0000746);
  if ADays > 0 then
    // cc_rscstr.cTXT0000744 = '%d days';
    // cc_rscstr.cTXT0000745 = '1 day';
    ADaysStr := IQMS.Common.Numbers.sIIf(ADays > 1, Format(cc_rscstr.cTXT0000744, [ADays]),
      cc_rscstr.cTXT0000745);

  if (AYears > 0) then
    begin
      SetLength(A, High(A) + 2);
      A[High(A)] := AYearsStr;
    end;
  if (AMonths > 0) then
    begin
      SetLength(A, High(A) + 2);
      A[High(A)] := AMonthsStr;
    end;
  if (ADays > 0) then
    begin
      SetLength(A, High(A) + 2);
      A[High(A)] := ADaysStr;
    end;

  // Build string
  if High(A) = 0 then
    AIntervalStr := A[0]
  else if High(A) > 0 then
    for i := 0 to High(A) do
      begin
        ATemp := '';
        if (i = High(A)) and (i > 0) then
          ATemp := ', and '
        else if (i < High(A)) and (i > 0) then
          ATemp := ', ';

        AIntervalStr := AIntervalStr + ATemp + A[i];
      end;

  if (ADays = 0) and (AYears = 0) and (AMonths = 0) then
    // cc_rscstr.cTXT0000748 = 'Apply to records dated on or before today.';
    Result := cc_rscstr.cTXT0000748
  else if (ADays = 1) and (AYears = 0) and (AMonths = 0) then
    // cc_rscstr.cTXT0000749 = 'Apply to records dated on or before yesterday.';
    Result := cc_rscstr.cTXT0000749
  else if (ADays = 7) and (AYears = 0) and (AMonths = 0) then
    // cc_rscstr.cTXT0000750 = 'Apply to records older than 1 week.';
    Result := cc_rscstr.cTXT0000750
  else if (ADays = 14) and (AYears = 0) and (AMonths = 0) then
    // cc_rscstr.cTXT0000751 = 'Apply to records older than 2 weeks.';
    Result := cc_rscstr.cTXT0000751
  else if (ADays = 21) and (AYears = 0) and (AMonths = 0) then
    // cc_rscstr.cTXT0000752 = 'Apply to records older than 3 weeks.';
    Result := cc_rscstr.cTXT0000752
  else if AIntervalStr > '' then
    // cc_rscstr.cTXT0000753 = 'Apply to data older than %s';
    Result := Format(cc_rscstr.cTXT0000753, [AIntervalStr]);
end;

procedure TFrmCCPurgeBase.btnOkClick(Sender: TObject);
begin
  if ProcessExec then
    ModalResult := mrOk;
end;

end.
