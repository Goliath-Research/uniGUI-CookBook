unit WC_8087;

interface

implementation

uses
  TestReg,
  qc_opendialog;

procedure Test1;
var
  External_Doc_ID: Real;
  DocFileCargo: TQCDocFileCargo;
begin
  External_Doc_ID := 1164;
  TFrmQCDocFileOpenDialog.DoShowModal( External_Doc_ID, DocFileCargo );
end;

initialization

  TTestRepo.RegisterTest('WC-8087', 'Qc_Doc', 'FrmPSTkChkQty', 'DoShowModalDialogCheckBox', Test1);
end.
