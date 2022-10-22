program SQLiteVCL;

uses
  Vcl.Forms,
  Master_Detail in 'Master_Detail.pas' {Master_DetailForm},
  Main in 'Main.pas' {MainForm},
  Master_DetailDM in '..\Common\Master_DetailDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
