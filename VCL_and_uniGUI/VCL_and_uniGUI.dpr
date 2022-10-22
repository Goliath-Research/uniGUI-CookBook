program VCL_and_uniGUI;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  Services in 'Services.pas',
  Registration in 'Registration.pas',
  _MyFormWeb in '_MyFormWeb.pas' {MyFormWeb: TUniForm},
  _MyFormVCL in '_MyFormVCL.pas' {MyFormVCL};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.CreateForm(TMyFormVCL, MyFormVCL);
  Application.Run;
end.
