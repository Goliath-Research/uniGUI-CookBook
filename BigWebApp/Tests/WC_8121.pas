unit WC_8121;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FireDAC.Comp.Client,
  MainModule,
  Add_Edit;

procedure Test1;
VAR
  MyTable: TFdTable;
begin
  MyTable := TFdTable.create(nil);
  try
    MyTable.connection := UniMainModule.FDconnection1;
    MyTable.TableName := 'QINVT';
    MyTable.Open;
    TAddEdit.DoShowModal(14,'PL',MyTable);
  finally
    MyTable.free;
  end;

end;

procedure TestTAddEdit;
begin
  TAddEdit.DoShowModal(14);
end;

initialization

  TTestRepo.RegisterTest('WC-8121', 'Quote', 'Add_Edit', 'DoShowModal', Test1);

end.
