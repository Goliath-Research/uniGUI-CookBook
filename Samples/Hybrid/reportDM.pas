unit reportDM;

interface

uses
  SysUtils, Classes, frxClass, frxExportPDF, frxDBSet;

type
  TfrDataModule = class(TDataModule)
    frxReport: TfrxReport;
    frxSales: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
    function ExportReport: string;
  end;

implementation

uses
  ServerModule;

{$R *.dfm}

function TfrDataModule.ExportReport : string;
begin
  frxReport.PrintOptions.ShowDialog := False;
  frxReport.ShowProgress := false;

  frxReport.EngineOptions.SilentMode := True;
  frxReport.EngineOptions.EnableThreadSafe := True;
  frxReport.EngineOptions.DestroyForms := False;
  frxReport.EngineOptions.UseGlobalDataSetList := False;

  frxPDFExport.Background := True;
  frxPDFExport.ShowProgress := False;
  frxPDFExport.ShowDialog := False;
  frxPDFExport.DefaultPath := '';
  frxPDFExport.FileName := UniServerModule.NewCacheFileUrl(False, 'pdf', '', '', Result);

  frxReport.PreviewOptions.AllowEdit := False;

  if not (frxReport.PrepareReport and frxReport.Export(frxPDFExport)) then
    Result := '';
end;

end.
