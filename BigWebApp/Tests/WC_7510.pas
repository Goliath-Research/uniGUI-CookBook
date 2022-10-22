unit WC_7510;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  FireDAC.Comp.Client,
  MainModule,
  oe_uom_conversion;

procedure Test;
var
  DataSet : TFDTable;
begin
  DataSet := TFDTable.Create(nil);
  DataSet.Connection := UniMainModule.FDConnection1;
  Dataset.TableName := 'ARINVT_AUTO_MRP_DIV';
  DataSet.Open;
  TFrmOeUomConversion.DoShow(DataSet);
end;

initialization

  TTestRepo.RegisterTest('WC-7510', 'OE', 'oe_uom_conversion', 'GetOE_UOM', Test);

end.
