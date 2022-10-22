unit WC_7538;

interface

implementation

uses
  TestReg,
  MandatoryColumns,
  uniGUIApplication,
  Data.DB,
  FireDAC.Comp.Client,
  Mainmodule;

procedure Test1;
var
  LDataSet: TFDQuery;
  Table: string;
begin
  LDataset := TFDQuery.create(nil);
  with LDataset do
  begin
    Close;
    Connection := UniMainModule.FDConnection1;
    SQL.Text := 'select * from BOL';
    Open;
  end;
  Table := 'ARINVT';
  AssignUserDefinedMandatoryFields(LDataSet, Table);
end;

initialization

  TTestRepo.RegisterTest('WC-7538', 'Packslip', 'MandatoryColumns', 'AssignUserDefinedMandatoryFields', Test1);

end.
