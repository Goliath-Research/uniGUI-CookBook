unit WC_7844;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  System.Generics.Collections,
  po_archive_batch;

procedure Test;
var
  AList : TList<Int64>;
begin
  AList := TList<Int64>.Create;
  TFrmPOArchiveBatch.DoShowModal(AList);
end;

initialization

  TTestRepo.RegisterTest('WC-7844', 'Po', 'po_archive_batch', 'DoShowModal', Test);

end.
