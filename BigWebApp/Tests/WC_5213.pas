unit WC_5213;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  InvCode,
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
  MainModule,
  IQMS.Common.DataConst;

var
  AQry  : TFDQuery;
  ATable: TFDTable;


procedure OpenData;
begin

  ATable := TFDTable.Create(nil);
  ATable.TableName:='INVOICE_CODE';
  ATable.ConnectionName := cnstFDConnectionName;
  ATable.Open();

  AQry := TFDQuery.Create(nil);
  AQry.ConnectionName := cnstFDConnectionName;
  AQry.SQL.Text :='select inv_prefix, descrip, id from INVOICE_CODE order by  inv_prefix';
  AQry.Open();

end;

procedure CloseData;
begin
  ATable.Close;
  ATable.Free;

  AQry.Close;
  AQry.Free;
end;

procedure Test1;
begin
  OpenData;
  DoInvoiceCode( ATable, AQry )

end;

initialization

  TTestRepo.RegisterTest('WC-5213', 'Ar', 'InvCode', 'DoInvoiceCode', Test1);

end.
