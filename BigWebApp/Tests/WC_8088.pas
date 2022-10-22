unit WC_8088;

interface

implementation

uses
  TestReg,
  qc_opendialog_multi,
  System.Classes;

procedure Test1;
var
  Doc_Library_ID: Real;
  FilesList: TList;
begin
  FilesList := TList.create();
  Doc_Library_ID := 150;
  TFrmQCDocFileOpenDialogMulti.DoShowModal(Doc_Library_ID, FilesList);
end;

initialization

  TTestRepo.RegisterTest('WC-8088', 'Qc_Doc', 'qc_opendialog_multi', 'DoShowModal', Test1);
end.
