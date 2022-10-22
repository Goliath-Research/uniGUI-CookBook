unit WC_5348;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Bom_QPB,
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


procedure TestBom_QPB;
var
  QueryBom_QPB: TFDQuery;
begin
  QueryBom_QPB := TFDQuery.Create(nil);
  try
  QueryBom_QPB.Connection := UniMainModule.FDConnection1;
  QueryBom_QPB.SQL.Text := 'select * from partno p, arinvt a where p.id = 52536 and a.id = p.arinvt_id' ;
  QueryBom_QPB.Open();
  DoPartNoQtyBreaks(QueryBom_QPB);
  finally
    QueryBom_QPB.free;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-5348', 'Bom', 'Bom_QPB', 'DoPartNoQtyBreaks', TestBom_QPB);

end.
