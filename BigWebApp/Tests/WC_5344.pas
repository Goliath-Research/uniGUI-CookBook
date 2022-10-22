unit WC_5344;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Bom_Misc,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.Client,
  MainModule;

var
  TestTable: TFDTable;

procedure addSQL;
begin
  TestTable := TFDTable.Create(nil);
  TestTable.Connection := UniMainModule.FDConnection1;
  TestTable.TableName := 'PARAMS' ;
  TestTable.Open;
end;

procedure TestTFrmBomMiscParam;
begin
  addSQL;
  DoBomMiscParam(TestTable);
end;

initialization

  TTestRepo.RegisterTest('WC-5344', 'Bom', 'Bom_Misc', 'DoBomMiscParam', TestTFrmBomMiscParam);

end.
