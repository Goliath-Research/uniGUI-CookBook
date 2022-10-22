unit WC_5881;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGuiApplication,
  FireDAC.Comp.Client,
  MainModule,
  ShipDays_Ship_To;

procedure TestDoShowModal;
var
  DataSet : TFdTable;
begin
  DataSet := TFdTable.Create(nil);
  try
      DataSet.Connection := UniMainModule.FDconnection1;
      DataSet.TableName := 'TERMS';
      DataSet.Open;
      TFrmShipmentDaysShipTo.DoShowShipmentDays(DataSet);
  finally
      DataSet.close;
  end;
end;

initialization
  TTestRepo.RegisterTest('WC-5881', 'Customer', 'ShipDays_Ship_To', 'DoShowShipmentDays', TestDoShowModal);
end.
