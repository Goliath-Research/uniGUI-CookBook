unit shipman_purgelog;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  shipman_purge_base,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  UniGUIApplication,
  uniDateTimePicker,
  uniLabel, Vcl.Graphics, uniImage, uniSplitter, uniButton, uniBitBtn;

type
  TFrmShipmanPurgeLog = class(TFrmShipmanPurgeBase)
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
    chkPurgeLabels: TUniCheckBox;
    procedure cmbArchiveDateChange(Sender: TObject);
    procedure DoCheckboxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SetControls;
    procedure UpdateArchiveSummary;
    function Archive(var ACount: Integer): Boolean;
    function Purge(var ACount: Integer): Boolean;
    function PurgeLabels(var ACount: Integer): Boolean;
  protected
    { Protected declarations }
    function ProcessExec: Boolean; override;
  public
    { Public declarations }
  end;

  function DoShipmanPurgeLog: Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.ProgressDialog,
  IQMS.Common.Controls;

function DoShipmanPurgeLog: Boolean;
var
  LFrmShipmanPurgeLog : TFrmShipmanPurgeLog;
begin
  LFrmShipmanPurgeLog :=  TFrmShipmanPurgeLog.Create(UniGUIApplication.UniApplication);
   LFrmShipmanPurgeLog.cmbArchiveDate.Datetime := Date - 90;
   LFrmShipmanPurgeLog.cmbDate.Datetime := Date - 365;
   LFrmShipmanPurgeLog.UpdateArchiveSummary;
   LFrmShipmanPurgeLog.UpdateSummary;
   Result := LFrmShipmanPurgeLog.ShowModal = mrOk;
end;

{ TFrmShipmanPurgeLog }

procedure TFrmShipmanPurgeLog.FormCreate(Sender: TObject);
begin
  inherited;
  SetControls;
end;

function TFrmShipmanPurgeLog.ProcessExec: Boolean;
var
   b1,b2,b3: Boolean;
   i: Integer;
   S: String;
begin
  if chkArchive.Checked and (Trunc(cmbArchiveDate.Datetime) = 0) then
      raise Exception.Create('Please select an archive date.');

  if chkPurge.Checked and (Trunc(cmbDate.Datetime) = 0) then
      raise Exception.Create('Please select a purge date.');

  // Initialize
  b1 := False;
  b2 := False;
  b3 := False;
  i  := 0;

  // Process
  if chkArchive.Checked then
     begin
       b1 := Archive(i);
       if b1 then
          S := Format('Archived %d records.',[i]);
     end;

  if chkPurge.Checked then
     begin
       b2 := Purge(i);
       if b2 then
          S := S + #13 + Format('Purged %d log records.',[i]);
     end;

  if chkPurgeLabels.Checked then
     begin
       b3 := PurgeLabels(i);
       if b3 then
          S := S + #13 + Format('Purged %d package labels.',[i]);
     end;

  Result := b1 or b2 or b3;

  if Result then
     IQInformation(Format('Done.'#13'%s',[S]))
  else
     IQInformation('There are no records within the specified range.');
end;

function TFrmShipmanPurgeLog.Archive(var ACount: Integer): Boolean;
var
   hPrg: TIQWebProgressDialog; // in isprogressdlg.pas
   i: Integer;
   ADate: TDateTime;
   ADateStr: String;
begin
   try
      // Initialization
      Result := False;
      hPrg := NIL;
      ACount := 0;

      ADate := Trunc(cmbArchiveDate.Datetime);
      if ADate = 0 then
         raise Exception.Create('Please select an archive date.');

      ADateStr := FormatDateTime('mm/dd/yyyy', ADate);

      ACount := Trunc(SelectValueFmtAsFloat('select count(*) from shipment_log'#13 +
                              'where trunc(created) <= to_date(''%s'', ''mm/dd/rrrr'')',
                              [ADateStr]));
      if ACount = 0 then
         Exit;

      // Hide the form
      Self.Hide;

      // Create the Progress Dialog box
      hPrg := hProgressDlg( ACount {Max Value},
       'Archiving ...' {Status Text});

      // Cycle
      with TFDQuery.Create(NIL) do
      try
         Connection := UNiMainModule.FDConnection1;
         SQL.Add('select id from shipment_log');
         SQL.Add(Format('where trunc(created) <= to_date(''%s'', ''mm/dd/rrrr'')',
          [ADateStr]));
         SQL.Add('order by id');
         Open;
         while not EOF do
          begin

            // Check to see if user pressed Cancel button
            if hPrg.CheckProgressAborted then
               Break;

            // Archive the record
            ExecuteCommandFmt('update shipment_log set archived = ''Y'' where id = %.0f',
             [FieldByName('ID').AsFloat]);

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
      if Assigned(hPrg) then FreeAndNil(hPrg);
   end;

end;

function TFrmShipmanPurgeLog.Purge(var ACount: Integer): Boolean;
var
   hPrg: TIQWebProgressDialog; // in isprogressdlg.pas
   i: Integer;
   ADate: TDateTime;
   ADateStr: String;
begin
   try
      // Initialization
      Result := False;
      hPrg := NIL;
      ACount := 0;

      ADate := Trunc(cmbDate.Datetime);
      if ADate = 0 then
         raise Exception.Create('Please select a purge date.');

      ADateStr := FormatDateTime('mm/dd/yyyy', ADate);

      ACount := Trunc(SelectValueFmtAsFloat('select count(*) from shipment_log'#13 +
                              'where trunc(created) <= to_date(''%s'', ''mm/dd/rrrr'')',
                              [ADateStr]));
      if ACount = 0 then
         Exit;

      // Hide the form
      Self.Hide;

      // Create the Progress Dialog box
      hPrg := hProgressDlg(ACount {Max Value},
       'Purging ...' {Status Text});

      // Cycle
      with TFDQuery.Create(NIL) do
      try
         Connection := UniMainModule.FDConnection1;
         SQL.Add('select id from shipment_log');
         SQL.Add(Format('where trunc(created) <= to_date(''%s'', ''mm/dd/rrrr'')',
          [ADateStr]));
         SQL.Add('order by id');
         Open;
         while not EOF do
          begin

            // Check to see if user pressed Cancel button
            if hPrg.CheckProgressAborted then
               Break;

            // Delete the record
            ExecuteCommandFmt('delete from shipment_log where id = %.0f',
             [FieldByName('ID').AsFloat]);

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
      if Assigned(hPrg) then FreeAndNil(hPrg);
   end;

end;

function TFrmShipmanPurgeLog.PurgeLabels(var ACount: Integer): Boolean;
var
   hPrg: TIQWebProgressDialog; // in isprogressdlg.pas
   i: Integer;
   ADate: TDateTime;
   ADateStr: String;
begin
   try
      // Initialization
      Result := False;
      hPrg := NIL;
      ACount := 0;

      ADate := Trunc(cmbDate.Datetime);
      if ADate = 0 then
         raise Exception.Create('Please select a purge date.');

      ADateStr := FormatDateTime('mm/dd/yyyy', ADate);

      ACount := Trunc(SelectValueFmtAsFloat('select count(*) from shipment_packages'#13 +
                              'where trunc(shipped_date) <= to_date(''%s'', ''mm/dd/rrrr'')',
                              [ADateStr]));
      if ACount = 0 then
         Exit;

      // Hide the form
      Self.Hide;

      // Create the Progress Dialog box
      hPrg := hProgressDlg( ACount {Max Value},
       'Purging ...' {Status Text});

      // Cycle
      with TFDQuery.Create(NIL) do
      try
         Connection := UniMainModule.FDConnection1;
         SQL.Add('select id from shipment_packages');
         SQL.Add(Format('where trunc(shipped_date) <= to_date(''%s'', ''mm/dd/rrrr'')',
          [ADateStr]));
         SQL.Add('order by id');
         Open;
         while not EOF do
          begin

            // Check to see if user pressed Cancel button
            if hPrg.CheckProgressAborted then
               Break;

            // Delete the record
            ExecuteCommandFmt('update shipment_packages set ' +
              ' label_blob = null, ' +
              ' postal_code_image = null, ' +
              ' tracking_number_image = null, ' +
              ' world_ease_maxicode = null ' +
              ' where id = %.0f',
             [FieldByName('ID').AsFloat]);

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
      if Assigned(hPrg) then FreeAndNil(hPrg);
   end;

end;

procedure TFrmShipmanPurgeLog.cmbArchiveDateChange(Sender: TObject);
begin
  UpdateArchiveSummary;
end;

procedure TFrmShipmanPurgeLog.UpdateArchiveSummary;
begin
  lblArchiveSummary.Caption := GetDurationSummaryFor(cmbArchiveDate.Datetime);
  lblArchiveSummary.Update;
end;

procedure TFrmShipmanPurgeLog.SetControls;
begin
  Application.ProcessMessages;
  IQMS.Common.Controls.IQEnableControl([lblArchiveDate, cmbArchiveDate, lblArchiveSummary],
   chkArchive.Checked);
  IQMS.Common.Controls.IQEnableControl([lblDate,cmbDate,lblSummary],
   chkPurge.Checked or chkPurgeLabels.Checked);

  imgPurgeEnabled.Visible  := chkPurge.Checked or chkPurgeLabels.Checked;
  imgPurgeDisabled.Visible := not (chkPurge.Checked or chkPurgeLabels.Checked);

  imgArchiveEnabled.Visible  := chkArchive.Checked;
  imgArchiveDisabled.Visible := not chkArchive.Checked;

end;

procedure TFrmShipmanPurgeLog.DoCheckboxClick(Sender: TObject);
begin
  inherited;
  SetControls;
end;

end.
