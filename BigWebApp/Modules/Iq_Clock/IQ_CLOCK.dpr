program IQ_Clock;

uses
  Forms,
  IQMS.Common.ResourceStrings,
  Lgmsgbx in '..\iqshare\Lgmsgbx.pas' {FrmMsgBox},
  Clockbas in '..\iqshare\Clockbas.pas' {FrmClockbas},
  TAClokIO in '..\ta\TAClokIO.pas' {FrmClockInOut},
  DB_DM in '..\iqshare\DB_DM.pas' {DB_DataModule: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  with Application do Title:= IQMS.Common.ResourceStrings.cTXT0000290; {'IQClock'}
  Application.Title := 'IQ Clock';
  Application.CreateForm(TFrmClockInOut, FrmClockInOut);
  Application.Run;
end.
