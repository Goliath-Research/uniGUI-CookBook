program MemTableUniGUI;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Master_Detail in 'Master_Detail.pas' {Master_DetailForm: TUniForm},
  Main in 'Main.pas' {MainForm: TUniForm},
  Master_DetailDM in '..\Common\Master_DetailDM.pas' {DM: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
