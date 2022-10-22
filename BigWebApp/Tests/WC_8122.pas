unit WC_8122;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FireDAC.Comp.Client,
  MainModule,
  AuxEquip;

procedure Test1;
VAR
  MyTable: TFdTable;
begin
  MyTable := TFdTable.create(nil);
  try
    MyTable.connection := UniMainModule.FDconnection1;
    MyTable.TableName := 'Aux';
    MyTable.Open;
    DoAuxEquip(MyTable);
  finally
    MyTable.free;
  end;

end;

initialization

TTestRepo.RegisterTest('WC-8122', 'Quote', 'AuxEquip', 'DoAuxEquip', Test1);

end.
