unit WC_6269;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  FireDAC.Comp.Client,
  MainModule,
  InvChangeItemNo;

procedure Test;
var
  DataSet : TFDTable;
begin
  DataSet := TFDTable.Create(nil);
  DataSet.Connection := UniMainModule.FDConnection1;
  Dataset.TableName := 'ARINVT_AUTO_MRP_DIV';
  DataSet.Open;
  DoChangeItemno(DataSet);
end;

initialization
  TTestRepo.RegisterTest('WC-6269', 'Inv',  'InvChangeItemNo', 'DoChangeItemno', Test);
end.
