unit WC_8065;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  qc_doc_cert_train;

procedure Test;
begin
  TFrmQcDocCertTraining.DoShowModal(20,1164);
end;

initialization

  TTestRepo.RegisterTest('WC-8065', 'Qc_Doc', 'qc_doc_cert_train', 'DoShowModal', Test);

end.
