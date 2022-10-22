unit shipman_purge_base;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Phys,
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
  TFrmShipmanPurgeBase = class(TUniForm)
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
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.Numbers;

{ TFrmShipmanPurgeBase }

procedure TFrmShipmanPurgeBase.FormCreate(Sender: TObject);
begin

  IQMS.Common.Controls.ResizeCheckboxes(Self, PnlClient);

  cmbDate.Datetime := Date - (2 * IQMS.Common.Dates.TIME_OneWeek);
  cmbDate.MaxDate := Date;
  UpdateSummary;
end;

procedure TFrmShipmanPurgeBase.cmbDateChange(Sender: TObject);
begin
  UpdateSummary;
end;

procedure TFrmShipmanPurgeBase.UpdateSummary;
begin
  lblSummary.Caption := GetDurationSummaryFor(cmbDate.Datetime);
  lblSummary.Update;
end;

function TFrmShipmanPurgeBase.GetDurationSummaryFor(ADate: TDateTime): String;
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
     AYearsStr := IQMS.Common.Numbers.sIIf(AYears > 1, Format('%d years', [AYears]), '1 year');
  if AMonths > 0 then
     AMonthsStr := IQMS.Common.Numbers.sIIf(AMonths > 1, Format('%d months', [AMonths]), '1 month');
  if ADays > 0 then
     ADaysStr := IQMS.Common.Numbers.sIIf(ADays > 1, Format('%d days', [ADays]), '1 day');

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
     Result := 'Apply to records dated on or before today.'
  else if (ADays = 1) and (AYears = 0) and (AMonths = 0) then
     Result := 'Apply to records dated on or before yesterday.'
  else if (ADays = 7) and (AYears = 0) and (AMonths = 0) then
     Result := 'Apply to records older than 1 week.'
  else if (ADays = 14) and (AYears = 0) and (AMonths = 0) then
     Result := 'Apply to records older than 2 weeks.'
  else if (ADays = 21) and (AYears = 0) and (AMonths = 0) then
     Result := 'Apply to records older than 3 weeks.'
  else if AIntervalStr > '' then
     Result := Format('Apply to data older than %s', [AIntervalStr]);

end;

procedure TFrmShipmanPurgeBase.btnOkClick(Sender: TObject);
begin
  if ProcessExec then
     ModalResult := mrOk;
end;

end.
