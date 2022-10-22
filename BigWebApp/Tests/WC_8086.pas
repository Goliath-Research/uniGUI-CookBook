unit WC_8086;

interface

implementation

uses
  TestReg,
  qc_doc_where_used;

procedure Test1;
begin
  TFrmQcDocWhereUsed.DoShowModal(1164);
end;

initialization

  TTestRepo.RegisterTest('WC-8086', 'Qc_Doc', 'qc_doc_where_used', 'DoShowModal', Test1);

end.
