program IQSlit;

uses
  Vcl.Forms,
  SysUtils,
  slit_opt in 'slit_opt.pas' {FrmSlitOpt},
  DB_DM in '..\iqshare\DB_DM.pas' {DB_DataModule: TDataModule},
  slit_add_item in 'slit_add_item.pas' {FrmSlitAddItem},
  IQSlit_TLB in 'IQSlit_TLB.pas',
  IQSlit_COM in 'IQSlit_COM.pas' {IQShell: CoClass},
  slit_launcher in 'slit_launcher.pas' {FrmSlitLaunch},
  slit_params in 'slit_params.pas' {FrmSlitParams};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSlitLaunch, FrmSlitLaunch);
  Application.ShowMainForm:= FindCmdLineSwitch('STANDALONE', ['/', '-'], TRUE ); // SysUtils
  Application.Run;
end.
