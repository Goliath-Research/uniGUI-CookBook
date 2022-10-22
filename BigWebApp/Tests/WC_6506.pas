unit WC_6506;

interface

implementation

uses
  TestReg,
  dbtexcel_prnoptions,
  Dialogs,
  System.Classes,
  UniGUIApplication,
  vcl.Forms;

procedure Test;
var
  res : boolean;
  Options: TExcelPrintOptions;
  DialogCheckBoxVisible: Boolean;
  Owner: TComponent;
begin
  Options := TExcelPrintOptions.Create(TForm(UniGUIApplication.UniApplication));
  Options.LoadFromRegistry('Chart Wizard Excel Export Options');
  DialogCheckBoxVisible := True;
  res := TFrmDbtExcelPrintOptions.DoShowModal(Options, DialogCheckBoxVisible);
  if res then
    Showmessage('Success');
end;

initialization

  TTestRepo.RegisterTest('WC-6506', 'Iqdbtrans', 'dbtexcel_prnoptions', 'DoShowModal', Test);

end.
