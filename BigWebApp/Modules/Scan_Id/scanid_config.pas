unit scanid_config;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  MMSystem,
  scanid_rscstr,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl, Vcl.ComCtrls;

type
  TTempSettings = record
    PrintCopies: Integer;
    LogFile: String;
    AlarmFile_TimeOut: String;
    AlarmFile_Fatal: String;
    AlarmFile_General: String;
    LogMode: Boolean;
    LogAll: Boolean;
    UseLblHierarchy: Boolean;
  end;

type
  TFrmScanIDConfig = class(TUniForm)
    pcMain: TUniPageControl;
    Panel2: TUniPanel;
    OpenDialog1: TOpenDialog;
    TabGeneral: TUniTabSheet;
    OpenDialog2: TOpenDialog;
    gbAlarms: TUniGroupBox;
    lblUseWav: TUniLabel;
    edtWaveFile: TUniEdit;
    sbtnBrowse_FatalAlarm: TUniSpeedButton;
    sbtnPlay_FatalAlarm: TUniSpeedButton;
    OpenDialog3: TOpenDialog;
    sbtnClear_FatalAlarm: TUniSpeedButton;
    Label11: TUniLabel;
    edtGeneralErrorAlarmFile: TUniEdit;
    sbtnBrowse_GeneralAlarm: TUniSpeedButton;
    sbtnPlay_GeneralAlarm: TUniSpeedButton;
    sbtnClear_GeneralAlarm: TUniSpeedButton;
    Bevel1: TUniPanel;
    GroupBox1: TUniGroupBox;
    lblLogFileName: TUniLabel;
    sbtnBrowseLog: TUniSpeedButton;
    sbtnOpenLog: TUniSpeedButton;
    chkLogMode: TUniCheckBox;
    edtLogFileName: TUniEdit;
    chkLogAll: TUniCheckBox;
    Bevel2: TUniPanel;
    gbPrint: TUniGroupBox;
    Label5: TUniLabel;
    edtPrintCopies: TUniEdit;
    Panel1: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    grpLabels: TUniGroupBox;
    chkUseLblH: TUniCheckBox;
    udPrintCopies: TUpDown;
    procedure btnOkClick(Sender: TObject);
    procedure sbtnBrowse_FatalAlarmClick(Sender: TObject);
    procedure sbtnPlay_FatalAlarmClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnBrowseLogClick(Sender: TObject);
    procedure sbtnOpenLogClick(Sender: TObject);
    procedure sbtnClear_FatalAlarmClick(Sender: TObject);
    procedure sbtnBrowse_GeneralAlarmClick(Sender: TObject);
    procedure sbtnPlay_GeneralAlarmClick(Sender: TObject);
    procedure sbtnClear_GeneralAlarmClick(Sender: TObject);
    procedure chkLogModeClick(Sender: TObject);
    procedure edtLogFileNameChange(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    TempSettings: TTempSettings;
    procedure GetOptions;
    procedure SaveOptions;

    procedure SetControls;

  public
    { Public declarations }
    FFormActive: Boolean;
  end;

function DoScanIDConfig(): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  scanid_settings,
  scanid_share;

function DoScanIDConfig(): Boolean;
var
  LFrmScanIDConfig: TFrmScanIDConfig;
begin
  LFrmScanIDConfig := TFrmScanIDConfig.Create(uniGUIApplication.UniApplication);
  with LFrmScanIDConfig do
  begin
    Result := ShowModal = mrOk;
    Result := TRUE;
  end;

end;
procedure TFrmScanIDConfig.UniFormCreate(Sender: TObject);
begin
FFormActive := FALSE;
IQRegFormRead(Self, [Self]);
  GetOptions;
  pcMain.ActivePageIndex := 0;
end;

procedure TFrmScanIDConfig.FormShow(Sender: TObject);
begin
  FFormActive := TRUE;
  SetControls;
end;

procedure TFrmScanIDConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FFormActive := FALSE;
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmScanIDConfig.GetOptions;
begin
  // TempSettings.PrintCopies          := ScanIDSettings.PrintCopies;

  TempSettings.LogFile := ScanIDSettings.LogFile;
  TempSettings.LogAll := ScanIDSettings.LogAll;
  edtLogFileName.Text := ScanIDSettings.LogFile;
  TempSettings.LogMode := ScanIDSettings.LogMode;
  chkUseLblH.Checked := ScanIDSettings.UseLblHierarchy;
  chkLogMode.Checked := TempSettings.LogMode;
  chkLogAll.Checked := TempSettings.LogAll;

  TempSettings.AlarmFile_Fatal := ScanIDSettings.AlarmFile_Fatal;
  edtWaveFile.Text := TempSettings.AlarmFile_Fatal;

  TempSettings.AlarmFile_General := ScanIDSettings.AlarmFile_General;
  edtGeneralErrorAlarmFile.Text := TempSettings.AlarmFile_General;

  // udPrintCopies.Position              := ScanIDSettings.PrintCopies;

end;

procedure TFrmScanIDConfig.SaveOptions;
var
  i: Integer;
begin
  // Return the settings from the TTempSettings record to the ScanIDSettings object

  // ScanIDSettings.PlayAlarm               := chkPlayAlarm.Checked;
  ScanIDSettings.AlarmFile_Fatal := TempSettings.AlarmFile_Fatal;
  ScanIDSettings.AlarmFile_General := TempSettings.AlarmFile_General;

  // ScanIDSettings.PrintCopies             := udPrintCopies.Position;

  ScanIDSettings.LogFile := edtLogFileName.Text;
  ScanIDSettings.LogMode := chkLogMode.Checked;
  ScanIDSettings.LogAll := chkLogAll.Checked;
  ScanIDSettings.UseLblHierarchy := chkUseLblH.Checked;

  if (ScanIDSettings.LogMode = TRUE) and
    (ScanIDSettings.LogAll <> TempSettings.LogAll) then
  begin
    if (ScanIDSettings.LogAll = TRUE) then
      WriteLineToLog(Format('[%s] %s', [PadR(FormatDateTime('ddddd tt', Now),
        22), scanid_rscstr.cTXT0000004 { 'Log All Activity Invoked' } ]),
        ScanIDSettings.LogFile)
    else
      WriteLineToLog(Format('[%s] %s', [PadR(FormatDateTime('ddddd tt', Now),
        22), scanid_rscstr.cTXT0000005 { 'Logging Only Errors' } ]),
        ScanIDSettings.LogFile);
  end;
end;

procedure TFrmScanIDConfig.btnOkClick(Sender: TObject);
begin
  SaveOptions;
end;

procedure TFrmScanIDConfig.sbtnBrowse_FatalAlarmClick(Sender: TObject);
begin
  with OpenDialog2 do
    if Execute then
    begin
      edtWaveFile.Text := FileName;
      TempSettings.AlarmFile_Fatal := FileName;
    end;
end;

procedure TFrmScanIDConfig.sbtnPlay_FatalAlarmClick(Sender: TObject);
var
  ACur: String;
begin
  try
    ACur := ScanIDSettings.AlarmFile_Fatal;
    ScanIDSettings.AlarmFile_Fatal := edtWaveFile.Text;
    Alarm_Fatal;
  finally
    ScanIDSettings.AlarmFile_Fatal := ACur;
  end;
end;

procedure TFrmScanIDConfig.sbtnClear_FatalAlarmClick(Sender: TObject);
begin
  edtWaveFile.Clear;
  TempSettings.AlarmFile_Fatal := '';
end;

procedure TFrmScanIDConfig.sbtnBrowse_GeneralAlarmClick(Sender: TObject);
begin
  with OpenDialog2 do
    if Execute then
    begin
      edtGeneralErrorAlarmFile.Text := FileName;
      TempSettings.AlarmFile_General := FileName;
    end;

end;

procedure TFrmScanIDConfig.sbtnPlay_GeneralAlarmClick(Sender: TObject);
var
  ACur: String;
begin
  try
    ACur := ScanIDSettings.AlarmFile_General;
    ScanIDSettings.AlarmFile_General := edtGeneralErrorAlarmFile.Text;
    Alarm_General;
  finally
    ScanIDSettings.AlarmFile_General := ACur;
  end;

end;

procedure TFrmScanIDConfig.sbtnClear_GeneralAlarmClick(Sender: TObject);
begin
  edtGeneralErrorAlarmFile.Clear;
  TempSettings.AlarmFile_General := '';
end;

procedure TFrmScanIDConfig.sbtnBrowseLogClick(Sender: TObject);
begin
  with OpenDialog3 do
    if Execute then
    begin
      edtLogFileName.Text := FileName;
      TempSettings.LogFile := FileName;
    end;
end;

procedure TFrmScanIDConfig.sbtnOpenLogClick(Sender: TObject);
begin
  if FileExists(edtLogFileName.Text) then
    ExecuteProgram(edtLogFileName.Text, SW_SHOWDEFAULT, '');
end;

procedure TFrmScanIDConfig.chkLogModeClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SetControls;
end;

procedure TFrmScanIDConfig.SetControls;
var
  AEnabled: Boolean;
begin
  // Log file
  Application.ProcessMessages;
  AEnabled := chkLogMode.Checked;
  IQEnableControl(lblLogFileName, AEnabled);
  IQEnableControl(edtLogFileName, AEnabled);
  IQEnableControl(sbtnBrowseLog, AEnabled);
  IQEnableControl(sbtnOpenLog, AEnabled);
  chkLogAll.Enabled := AEnabled;

  // Log File Name
  AEnabled := FileExists(edtLogFileName.Text);
  sbtnOpenLog.Enabled := AEnabled and chkLogMode.Checked;

end;

procedure TFrmScanIDConfig.edtLogFileNameChange(Sender: TObject);
begin
  if FFormActive = FALSE then
    Exit;
  SetControls;
end;

end.
