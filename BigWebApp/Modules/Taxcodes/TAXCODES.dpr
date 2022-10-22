program TaxCodes;

uses
  Forms,
  Tax_DM in 'Tax_DM.pas' {DM_Tax: TDataModule},
  TaxMain in 'TaxMain.pas' {FormTaxMain},
  Unit1 in 'Unit1.pas' {Form1},
  DB_DM in '\IQWin\IQShare\Db_dm.pas' {DB_DataModule: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDB_DataModule, DB_DataModule);
  Application.Run;
end.
