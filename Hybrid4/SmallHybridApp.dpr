program SmallHybridApp;

uses
  SvcMgr,
  ServiceModule in 'ServiceModule.pas' {UniServiceModule: TUniGUIService},
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  Mainm in 'Mainm.pas' {MainmForm: TUnimForm},
  Services in 'Services.pas',
  _dLoginForm in '_dLoginForm.pas' {dLoginForm: TUniLoginForm},
  _mLoginForm in '_mLoginForm.pas' {mLoginForm: TUnimLoginForm},
  _dUsersForm in '_dUsersForm.pas' {dUsersForm: TUniForm},
  _mUsersForm in '_mUsersForm.pas' {mUsersForm: TUnimForm},
  _dOrdersForm in '_dOrdersForm.pas' {dOrdersForm: TUniForm},
  _mOrdersForm in '_mOrdersForm.pas' {mOrdersForm: TUnimForm},
  _dSalesReportForm in '_dSalesReportForm.pas' {dSalesReportForm: TUniForm},
  _mSalesReportForm in '_mSalesReportForm.pas' {mSalesReportForm: TUnimForm},
  Interfaces in 'Interfaces.pas',
  Registration in 'Registration.pas',
  SalesReportDM in 'SalesReportDM.pas' {frDataModule: TDataModule};

{$R *.res}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TUniServiceModule, UniServiceModule);
  Application.Run;
end.
