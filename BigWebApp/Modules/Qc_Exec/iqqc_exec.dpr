program iqqc_exec;

uses
  Forms,
  SysUtils,
  qcexec_launcher in 'qcexec_launcher.pas' {FrmQCExecLauncher},
  Db_dm in '..\Iqshare\DB_DM.pas' {DB_DataModule: TDataModule},
  qcexec_eco in 'qcexec_eco.pas' {FrmQCEECO},
  qcexec_doc in 'qcexec_doc.pas' {FrmQCEDocCtrl},
  qcexec_apqp in 'qcexec_apqp.pas' {FrmQCEAPQP},
  qcexec_car in 'qcexec_car.pas' {FrmQCECAR},
  iqqc_exec_TLB in 'iqqc_exec_TLB.pas',
  qcexec_com in 'qcexec_com.pas' {IQShell: CoClass},
  qcexec_share in 'qcexec_share.pas',
  qcexec_const in 'qcexec_const.pas';

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Quality Control Executive';
  Application.CreateForm(TFrmQCExecLauncher, FrmQCExecLauncher);
  Application.ShowMainForm:= FindCmdLineSwitch('STANDALONE', ['-', '/'], TRUE ); // SysUtils
  Application.Run;
end.
