program LocalSQLVCL;

uses
  Vcl.Forms,
  FactTable in 'FactTable.pas' {FactTableForm},
  Main in 'Main.pas' {MainForm},
  LocalSQLDM in '..\Common\LocalSQLDM.pas' {DM: TDataModule},
  FactTableQuery in 'FactTableQuery.pas' {FactTableQueryForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFactTableQueryForm, FactTableQueryForm);
  Application.Run;
end.
