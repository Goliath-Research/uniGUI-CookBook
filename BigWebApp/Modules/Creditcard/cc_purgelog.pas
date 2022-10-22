unit cc_purgelog;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  cc_purge_base,
  UniGUIApplication,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  Vcl.Graphics,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniDateTimePicker,
  uniLabel, uniImage, uniSplitter, uniButton, uniBitBtn;

type
  TFrmCCPurgeLog = class(TFrmCCPurgeBase)
    chkPurge: TUniCheckBox;
    chkArchive: TUniCheckBox;
    lblArchiveDate: TUniLabel;
    cmbArchiveDate: TUniDateTimePicker;
    lblArchiveSummary: TUniLabel;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    imgArchiveEnabled: TUniImage;
    imgPurgeEnabled: TUniImage;
    imgPurgeDisabled: TUniImage;
    imgArchiveDisabled: TUniImage;
    procedure cmbArchiveDateChange(Sender: TObject);
    procedure DoCheckboxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FArcustoID: Int64;
    procedure SetControls;
    procedure UpdateArchiveSummary;
    function Archive(var ACount: Integer): Boolean;
    function Purge(var ACount: Integer): Boolean;
    procedure SetCaption;
    procedure SetArcustoID(const Value: Int64);
  protected
    { Protected declarations }
    function ProcessExec: Boolean; override;
  public
    { Public declarations }
    property ArcustoID: Int64 write SetArcustoID;
  end;

function DoCCPurgeLog : Boolean;
function DoCCPurgeLogForCustomer(AArcustoID: Int64): Boolean;

implementation

{$R *.dfm}


uses
  cc_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.ProgressDialog,
  IQMS.Common.RegFrm;

function DoCCPurgeLog : Boolean;
var
  LFrmCCPurgeLog : TFrmCCPurgeLog;
begin
  LFrmCCPurgeLog := TFrmCCPurgeLog.Create(UniGUIApplication.UniApplication);
  with LFrmCCPurgeLog do
  begin
    ArcustoID := 0;
    cmbArchiveDate.DateTime := Date - 90;
    cmbDate.DateTime := Date - 365;
    UpdateArchiveSummary;
    UpdateSummary;
    Result := ShowModal = mrOk;
  end;
end;

function DoCCPurgeLogForCustomer(AArcustoID: Int64): Boolean;
var
  LFrmCCPurgeLog : TFrmCCPurgeLog;
begin
  LFrmCCPurgeLog := TFrmCCPurgeLog.Create(UniGUIApplication.UniApplication);
  with LFrmCCPurgeLog do
  begin
    ArcustoID := AArcustoID;
    cmbArchiveDate.DateTime := Date - 90;
    cmbDate.DateTime := Date - 365;
    UpdateArchiveSummary;
    UpdateSummary;
    Result := ShowModal = mrOk;
  end;
end;

function TFrmCCPurgeLog.ProcessExec: Boolean;
var
  b1, b2: Boolean;
  i: Integer;
  S: string;
begin
  if chkArchive.Checked and (Trunc(cmbArchiveDate.DateTime) = 0) then
    // cc_rscstr.cTXT0000754 = 'Please select an archive date.';
    raise Exception.Create(cc_rscstr.cTXT0000754);

  if chkPurge.Checked and (Trunc(cmbDate.DateTime) = 0) then
    // cc_rscstr.cTXT0000755 = 'Please select a purge date.';
    raise Exception.Create(cc_rscstr.cTXT0000755);

  // Initialize
  b1 := False;
  b2 := False;
  i := 0;

  // Process
  if chkArchive.Checked then
    begin
      b1 := Archive(i);
      if b1 then
        // cc_rscstr.cTXT0000756 = 'Archived %d records.';
        S := Format(cc_rscstr.cTXT0000756, [i]);
    end;

  if chkPurge.Checked then
    begin
      b2 := Purge(i);
      if b2 then
        // cc_rscstr.cTXT0000757 = 'Purged %d records.';
        S := S + #13 + Format(cc_rscstr.cTXT0000757, [i]);
    end;

  Result := b1 or b2;

  if Result then
    // cc_rscstr.cTXT0000758 = 'Done.';
    IQInformation(Format(cc_rscstr.cTXT0000758 + #13'%s', [S]))
  else
    // cc_rscstr.cTXT0000759 =
    // 'There are no records within the specified range.';
    IQInformation(cc_rscstr.cTXT0000759);
end;

function TFrmCCPurgeLog.Archive(var ACount: Integer): Boolean;
var
  hPrg: TIQWebProgressDialog; // in isprogressdlg.pas
  ADate: TDateTime;
  ADateStr: string;
begin
  try
    // Initialization
    Result := False;
    hPrg := nil;
    ACount := 0;

    ADate := Trunc(cmbArchiveDate.DateTime);
    if ADate = 0 then
      // cc_rscstr.cTXT0000754 = 'Please select an archive date.';
      raise Exception.Create(cc_rscstr.cTXT0000754);

    ADateStr := FormatDateTime('mm/dd/yyyy', ADate);

    if FArcustoID > 0 then
      ACount := SelectValueFmtAsInteger(
        'SELECT COUNT(*) FROM credit_card_log'#13 +
        'WHERE arcusto_id = %d AND TRUNC(created) <= TO_DATE(''%s'', ' +
        '''mm/dd/rrrr'')', [FArcustoID, ADateStr])
    else
      ACount := SelectValueFmtAsInteger(
        'SELECT COUNT(*) FROM credit_card_log'#13 +
        'WHERE TRUNC(created) <= TO_DATE(''%s'', ''mm/dd/rrrr'')',
        [ADateStr]);
    if ACount = 0 then
      Exit;

    // Hide the form
    Self.Hide;

    // Create the Progress Dialog box
    // cc_rscstr.cTXT0000760 = 'Archiving ...';
    hPrg := hProgressDlg( ACount { Max Value } ,
      cc_rscstr.cTXT0000760 { Status Text } );

    // Cycle
    with TFDQuery.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        SQL.Add('SELECT id FROM credit_card_log');
        SQL.Add(Format('WHERE TRUNC(created) <= TO_DATE(''%s'', ''mm/dd/rrrr'')',
          [ADateStr]));
        if FArcustoID > 0 then
          SQL.Add(Format('AND arcusto_id = %d', [FArcustoID]));
        SQL.Add('ORDER BY id');
        Open;
        while not EOF do
          begin
            // Check to see if user pressed Cancel button
            if hPrg.CheckProgressAborted then
              Break;

            // Archive the record
            ExecuteCommandFmt(
              'UPDATE credit_card_log SET pk_hide = ''Y'' WHERE id = %d',
              [FieldByName('ID').AsLargeInt]);

            // Next record
            Next;

            // Step progress bar
            hPrg.StepProgress;

          end;

      finally
        Free;
      end;

    Result := ACount > 0;

  finally
    // Free the Progress Dialog box
    if Assigned(hPrg) then
      FreeAndNil(hPrg);
  end;

end;

function TFrmCCPurgeLog.Purge(var ACount: Integer): Boolean;
var
  hPrg: TIQWebProgressDialog; // in isprogressdlg.pas
  ADate: TDateTime;
  ADateStr: string;
begin
  try
    // Initialization
    Result := False;
    hPrg := nil;
    ACount := 0;

    ADate := Trunc(cmbDate.DateTime);
    if ADate = 0 then
      // cc_rscstr.cTXT0000755 = 'Please select a purge date.';
      raise Exception.Create(cc_rscstr.cTXT0000755);

    ADateStr := FormatDateTime('mm/dd/yyyy', ADate);

    if FArcustoID > 0 then
      ACount := SelectValueFmtAsInteger(
        'SELECT COUNT(*) FROM credit_card_log'#13 +
        'WHERE arcusto_id = %d AND TRUNC(created) <= TO_DATE(''%s'', ' +
        '''mm/dd/rrrr'')',
        [FArcustoID, ADateStr])
    else
      ACount := SelectValueFmtAsInteger(
        'SELECT COUNT(*) FROM credit_card_log'#13 +
        'WHERE TRUNC(created) <= TO_DATE(''%s'', ''mm/dd/rrrr'')',
        [ADateStr]);

    if ACount = 0 then
      Exit;

    // Hide the form
    Self.Hide;

    // Create the Progress Dialog box
    // cc_rscstr.cTXT0000761 = 'Purging ...';
    hPrg := hProgressDlg( ACount { Max Value } ,
      cc_rscstr.cTXT0000761 { Status Text } );

    // Cycle
    with TFDQuery.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        SQL.Add('SELECT id FROM credit_card_log');
        SQL.Add(Format('WHERE TRUNC(created) <= TO_DATE(''%s'', ''mm/dd/rrrr'')',
          [ADateStr]));
        if FArcustoID > 0 then
          SQL.Add(Format('AND arcusto_id = %d', [FArcustoID]));
        SQL.Add('ORDER BY id');
        Open;
        while not EOF do
          begin

            // Check to see if user pressed Cancel button
            if hPrg.CheckProgressAborted then
              Break;

            // Delete the record
            ExecuteCommandFmt(
            'DELETE FROM credit_card_log WHERE id = %d',
             [FieldByName('ID').AsLargeInt]);

            // Next record
            Next;

            // Step progress bar
            hPrg.StepProgress;

          end;

      finally
        Free;
      end;

    Result := ACount > 0;

  finally
    // Free the Progress Dialog box
    if Assigned(hPrg) then
      FreeAndNil(hPrg);
  end;

end;

procedure TFrmCCPurgeLog.cmbArchiveDateChange(Sender: TObject);
begin
  UpdateArchiveSummary;
end;

procedure TFrmCCPurgeLog.UpdateArchiveSummary;
begin
  lblArchiveSummary.Caption := GetDurationSummaryFor(cmbArchiveDate.DateTime);
  lblArchiveSummary.Update;
end;

procedure TFrmCCPurgeLog.SetArcustoID(const Value: Int64);
begin
  FArcustoID := Value;
end;

procedure TFrmCCPurgeLog.SetCaption;
var
  AOriginalCaption, ACompany: string;
begin
  // Credit Card Transaction Log
  if FArcustoID > 0 then
    begin
      AOriginalCaption := Self.Caption;
      ACompany := SelectValueFmtAsString(
        'SELECT company FROM arcusto WHERE id = %d',
        [FArcustoID]);
      Self.Caption := Format('%s [%s]', [AOriginalCaption, ACompany]);
    end;
end;

procedure TFrmCCPurgeLog.SetControls;
begin
  Application.ProcessMessages;
  IQMS.Common.Controls.IQEnableControl([lblArchiveDate, cmbArchiveDate, lblArchiveSummary],
    chkArchive.Checked);
  IQMS.Common.Controls.IQEnableControl([lblDate, cmbDate, lblSummary], chkPurge.Checked);

  imgPurgeEnabled.Visible := chkPurge.Checked;
  imgPurgeDisabled.Visible := not chkPurge.Checked;

  imgArchiveEnabled.Visible := chkArchive.Checked;
  imgArchiveDisabled.Visible := not chkArchive.Checked;

end;

procedure TFrmCCPurgeLog.DoCheckboxClick(Sender: TObject);
begin
  inherited;
  SetControls;
end;

procedure TFrmCCPurgeLog.FormShow(Sender: TObject);
begin
  inherited;
  SetCaption;
  SetControls;
end;

end.
