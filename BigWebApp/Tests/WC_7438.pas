unit WC_7438;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FireDAC.Comp.Client,
  MainModule,
  Fob;

procedure TestTFrmFob;
var
  DataSet : TFdTable;
begin
  DataSet := TFdTable.Create(nil);
  try
      DataSet.Connection := UniMainModule.FDconnection1;
      DataSet.TableName := 'FOB';
      DataSet.Open;
      DoFob(DataSet);
  finally
      DataSet.close;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-7438', 'OE', 'Fob', 'DoFob', TestTFrmFob);

end.
