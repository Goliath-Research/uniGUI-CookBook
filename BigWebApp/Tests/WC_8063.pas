unit WC_8063;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  qc_doc_CompFilesSetup;

procedure Test;
begin
  FrmFileCmprSetupShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8063', 'Qc_Doc', 'qc_doc_CompFilesSetup', 'FrmFileCmprSetupShowModal', Test);

end.
