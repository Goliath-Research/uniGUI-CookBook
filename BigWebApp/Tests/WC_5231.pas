unit WC_5231;

interface

implementation

uses
  TestReg,
  System.Variants,
  assy_data_get_ser;

procedure Test1;
var
  ID: Real;
  SerialNo, TableName: string;
begin
  ID:= 0;
  TFrmAssyDataGetSerialNumber.DoShowModal(ID, SerialNo, TableName);
end;

initialization

  TTestRepo.RegisterTest('WC-5231', 'AssyData', 'assy_data_get_ser', 'DoShowModal', Test1);
end.
