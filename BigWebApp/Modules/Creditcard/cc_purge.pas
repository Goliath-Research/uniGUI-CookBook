unit cc_purge;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  cc_purge_base,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  UniGUIApplication,
  Vcl.Buttons, uniGUIClasses, uniDateTimePicker, uniLabel, uniSplitter,
  uniButton, uniBitBtn, Vcl.Forms, uniGUIBaseClasses, uniPanel;

type
  TFrmCCPurge = class(TFrmCCPurgeBase)
  private
    { Private declarations }
  protected
    { Protected declarations }
    function ProcessExec: Boolean; override;
  public
    { Public declarations }
  end;

function DoCCPurge : Boolean;

implementation

{$R *.dfm}


uses
  cc_log,
  cc_rscstr,
  cc_types,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.ProgressDialog;

function DoCCPurge : Boolean;
var
  LFrmCCPurge : TFrmCCPurge;
begin
  LFrmCCPurge := TFrmCCPurge.Create(UniGUIApplication.UniApplication);
  with LFrmCCPurge do
  begin
    Result := ShowModal = mrOk;
  end;
end;

{ TFrmCCPurge }

function TFrmCCPurge.ProcessExec: Boolean;
var
  hPrg: TIQWebProgressDialog; // in isprogressdlg.pas
  AMax: Integer;
  ADate: TDateTime;
  ADateStr: String;
begin
  try
    // Initialization
    Result := False;
    hPrg := NIL;
    AMax := 0;

    ADate := Trunc(cmbDate.DateTime);
    if ADate = 0 then
      // cc_rscstr.cTXT0000762 = 'Please select a date.';
      raise Exception.Create(cc_rscstr.cTXT0000762);

    ADateStr := FormatDateTime('mm/dd/yyyy', ADate);
    // TTransactionStatus = (ccsUnknown, ccsSettled, ccsVoided, ccsChargeBack,
    // ccsSettlementError, ccsDeclined);

    AMax := Trunc(SelectValueFmtAsFloat(
      'SELECT COUNT(*) FROM credit_card_trans'#13 +
      'WHERE TRUNC(authorized_date) <= TO_DATE(''%s'', ''mm/dd/rrrr'')'#13 +
      ' AND NVL(status, 0) IN (%d,%d,%d,%d)',
      [ADateStr, Ord(ccsSettled), Ord(ccsVoided), Ord(ccsChargeBack),
      Ord(ccsDeclined)]));
    if AMax = 0 then
      begin
        // cc_rscstr.cTXT0000763 = 'There are no records to purge.';
        IQInformation(cc_rscstr.cTXT0000763);
        Exit;
      end;

    // Hide the form
    Self.Hide;

    // Create the Progress Dialog box
    // cc_rscstr.cTXT0000764 = 'Purging...';
    hPrg := hProgressDlg( AMax { Max Value } ,
      cc_rscstr.cTXT0000764 { Status Text } );

    // Cycle
    with TFDQuery.Create(NIL) do
      try
        Connection := UniMainModule.FDConnection1;
        SQL.Add('SELECT id FROM credit_card_trans');
        SQL.Add(Format
          ('WHERE TRUNC(authorized_date) <= TO_DATE(''%s'', ''mm/dd/rrrr'')',
          [ADateStr]));
        SQL.Add(Format(' AND NVL(status, 0) IN (%d,%d,%d,%d)',
          [Ord(ccsSettled), Ord(ccsVoided), Ord(ccsChargeBack),
          Ord(ccsDeclined)]));
        SQL.Add('ORDER BY id');
        Open;
        while not EOF do
          begin

            // Check to see if user pressed Cancel button
            if hPrg.CheckProgressAborted then
              Break;

            // Delete the record
            ExecuteCommandFmt(
              'DELETE FROM credit_card_trans WHERE id = %d',
              [FieldByName('ID').AsLargeInt]);

            // Next record
            Next;

            // Step progress bar
            hPrg.StepProgress;

          end;

      finally
        Free;
      end;

    Result := AMax > 0;

    if Result then
      // cc_rscstr.cTXT0000765 = 'Settled transactions purged.';
      // cc_rscstr.cTXT0000766 = 'Date: %s';
      // cc_rscstr.cTXT0000767 = 'Record count: %d';
      WriteToLog(0, lsPurge, ltUnknown,
        Format(
        cc_rscstr.cTXT0000765 + NL +
        cc_rscstr.cTXT0000766 + NL +
        cc_rscstr.cTXT0000767,
        [FormatDateTime('ddddd', cmbDate.DateTime), AMax]));

  finally
    // Free the Progress Dialog box
    if Assigned(hPrg) then
      FreeAndNil(hPrg);
  end;

  if AMax > 0 then
    // cc_rscstr.cTXT0000768 = 'Done.  Purged %d records.';
    IQInformation(Format(cc_rscstr.cTXT0000768, [AMax]));
end;

end.
