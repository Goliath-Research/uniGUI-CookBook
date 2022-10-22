program MemTableVCL;

uses
  Vcl.Forms,
  Master_Detail in 'Master_Detail.pas' {Master_DetailForm},
  Main in 'Main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
