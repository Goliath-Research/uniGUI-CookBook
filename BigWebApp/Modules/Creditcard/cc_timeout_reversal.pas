unit cc_timeout_reversal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.JumpConstants,
  cc_epayment,
  Vcl.Graphics,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniLabel, uniImage;

type
  { TFrmCCTimeOutReversal }
  TFrmCCTimeOutReversal = class(TUniForm)
    PnlPrompt: TUniPanel;
    lblPrompt: TUniLabel;
    PnlStatus: TUniPanel;
    PnlImage: TUniPanel;
    PnlMain: TUniPanel;
    imgWarning: TUniImage;
    lblCountDown: TUniLabel;
    lblSecondsRemainingLabel: TUniLabel;
    CountDownTimer: TUniTimer;
    lblProcessingReversal: TUniLabel;
    lblTriesLabel: TUniLabel;
    lblTries: TUniLabel;
    lblStatusLabel: TUniLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CountDownTimerTimer(Sender: TObject);
  private
    { Private declarations }
    FRunning: Boolean;
    FTries: Integer;
    FSuccess: Boolean;
    FStart: TDateTime;
    FEPaymentIntegrator: TEPaymentProcessor;
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    procedure ProcExec;
    procedure ProcReversal;
    procedure StartCountDown;
    procedure SetEPaymentIntegrator(const Value: TEPaymentProcessor);
  public
    { Public declarations }
    class procedure DoShow(AEPaymentIntegrator: TEPaymentProcessor);
    procedure Start;
    property EPaymentIntegrator: TEPaymentProcessor read FEPaymentIntegrator write SetEPaymentIntegrator;
  end;

const
  // FirstData sets a minimum value of 35 seconds
  C_INTERVAL_SEC: Integer = 35;
  C_MAX_TRIES: Integer = 3;

implementation

{$R *.dfm}


uses
  cc_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.Screen;

{ TFrmCCTimeOutReversal }

class procedure TFrmCCTimeOutReversal.DoShow(AEPaymentIntegrator: TEPaymentProcessor);
var
  LFrmCCTimeOutReversal : TFrmCCTimeOutReversal;
begin
  LFrmCCTimeOutReversal := TFrmCCTimeOutReversal.Create(UniGUIApplication.UniApplication);
  with LFrmCCTimeOutReversal do
  begin
    EPaymentIntegrator := AEPaymentIntegrator;
    ShowModal;
  end;
end;

procedure TFrmCCTimeOutReversal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // cc_rscstr.cTXT0000034 =
  // 'A transaction is being processed.  Are you sure you want ' +
  // 'to exit?';
  if not FSuccess and ((FTries < C_MAX_TRIES) or FRunning or CountDownTimer.Enabled) then
    CanClose := IQMS.Common.Dialogs.IQConfirmYN(cc_rscstr.cTXT0000034);
end;

procedure TFrmCCTimeOutReversal.FormShow(Sender: TObject);
begin
  IQMS.Common.Screen.ApplySystemFont(Self);
  lblCountDown.Font.Name := Self.Font.Name;
  lblTries.Font.Name := Self.Font.Name;
  FTries := 0;
  FSuccess := False;
  { TODO : Incompatible types: 'TForm' and 'TFrmCCTimeOutReversal' }
  //CenterForm(Self, True);
  PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmCCTimeOutReversal.IQAfterShowMessage(var Msg: TMessage);
begin
  Application.ProcessMessages;
  Self.BringToFront;
  Start;
end;

procedure TFrmCCTimeOutReversal.SetEPaymentIntegrator(
  const Value: TEPaymentProcessor);
begin
  FEPaymentIntegrator := Value;
end;

procedure TFrmCCTimeOutReversal.Start;
begin
  StartCountDown;
end;

procedure TFrmCCTimeOutReversal.StartCountDown;
begin
  lblSecondsRemainingLabel.Enabled := True;
  lblCountDown.Enabled := True;
  lblCountDown.Caption := IntToStr(C_INTERVAL_SEC);

  if FTries > 0 then
    begin
      if FTries = C_MAX_TRIES - 1 then
        // cc_rscstr.cTXT0000041 = 'Reversal attempt failed.  Waiting to resend final attempt.';
        lblProcessingReversal.Caption := cc_rscstr.cTXT0000041
      else
        // cc_rscstr.cTXT0000040 = 'Reversal attempt failed.  Waiting to resend.';
        lblProcessingReversal.Caption := cc_rscstr.cTXT0000040;
      lblProcessingReversal.Invalidate;
    end;
  CountDownTimer.Interval := 1000;
  FStart := Now;
  CountDownTimer.Enabled := True;
end;

procedure TFrmCCTimeOutReversal.CountDownTimerTimer(Sender: TObject);
var
  ARemaining: Integer;
begin
  ARemaining := Round(C_INTERVAL_SEC - ((Now - FStart) * 86400));
  if ARemaining <= 0 then
    begin
      lblCountDown.Caption := '0';
      CountDownTimer.Enabled := False;
      ProcExec;
    end
  else
    lblCountDown.Caption := IntToStr(ARemaining);
end;

procedure TFrmCCTimeOutReversal.ProcExec;
begin
  if FSuccess then
    Close;

  // Start processing
  FRunning := True;
  try
    lblSecondsRemainingLabel.Enabled := False;
    lblCountDown.Enabled := False;
    Invalidate;
    Application.ProcessMessages;
    ProcReversal;
    Inc(FTries);
    lblTries.Caption := IntToStr(FTries);
  finally
    FRunning := False;
  end;

  // If unsuccessful, run it again
  if not FSuccess then
    begin
      if FTries < C_MAX_TRIES then
        StartCountDown
      else
        begin
          // If we have already reached the maximum number of tries, there is
          // nothing else to do except inform the user and close the form.
          // cc_rscstr.cTXT0000035 = 'Failed.';
          lblProcessingReversal.Caption := cc_rscstr.cTXT0000035;
          // cc_rscstr.cTXT0000039 = 'The maximum number of reversal attempts have been made.  ' +
          // 'Please contact your gateway for assistance.';
          IQMS.Common.Dialogs.IQWarning(cc_rscstr.cTXT0000039);
          Close;
        end
    end
  else
    Close;
end;

procedure TFrmCCTimeOutReversal.ProcReversal;
var
  AEPaymentProcessor: TEPaymentProcessor;
  ACreditCardAccountID: Integer;
begin
  { If a merchant doesn‘t receive a response to an authorization request
    (Authorization, Sale, Refund, or Completion) or receives Response Code 911
    on an authorization request (Authorization, Sale, Refund, or Completion),
    the merchant must submit a TIMEOUT REVERSAL transaction. The assumption by
    the merchant should always be that the transaction that timed out was
    actually approved, and therefore needs to be reversed in order to correct
    the Open-to-buy for the cardholder. }

  // cc_rscstr.cTXT0000036 =
  // 'Processing time-out reversal.  Please do not close this window.';
  // lblPrompt.Caption := cc_rscstr.cTXT0000036;
  lblProcessingReversal.Caption := cc_rscstr.cTXT0000036;
  lblProcessingReversal.Invalidate;
  Application.ProcessMessages;

  if Assigned(FEPaymentIntegrator) then
    FEPaymentIntegrator.SendTimeOutReversal;

  FSuccess := FEPaymentIntegrator.TimeOutReversalStatus.Resolved;
end;

end.
