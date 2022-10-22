unit WC_8062;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  qc_doc_CompFiles;

procedure Test;
begin
  DoFileComparison('TestFile1','TestFile2');
end;

initialization

  TTestRepo.RegisterTest('WC-8062', 'Qc_Doc', 'qc_doc_CompFiles', 'FrmFileCmprSetupShowModal', Test);

end.
