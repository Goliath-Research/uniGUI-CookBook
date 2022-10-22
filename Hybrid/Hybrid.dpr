{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module'

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
  Hybrid;

uses
  uniGUIISAPI,
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  Mainm in 'Mainm.pas' {MainmForm: TUnimForm},
  Services in 'Services.pas',
  dServices in 'dServices.pas',
  mServices in 'mServices.pas',
  _dLoginForm in '_dLoginForm.pas' {dLoginForm: TUniLoginForm},
  _mLoginForm in '_mLoginForm.pas' {mLoginForm: TUnimLoginForm},
  _dUsersForm in '_dUsersForm.pas' {dUsersForm: TUniForm},
  _mUsersForm in '_mUsersForm.pas' {mUsersForm: TUnimForm},
  _dOrdersForm in '_dOrdersForm.pas' {dOrdersForm: TUniForm},
  _mOrdersForm in '_mOrdersForm.pas' {mOrdersForm: TUnimForm},
  _dSalesReportForm in '_dSalesReportForm.pas' {dSalesReportForm: TUniForm},
  _mSalesReportForm in '_mSalesReportForm.pas' {mSalesReportForm: TUnimForm},
  reportDM in 'reportDM.pas' {frDataModule: TDataModule};

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
{$endif}
end.
