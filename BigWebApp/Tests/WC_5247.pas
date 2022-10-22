unit WC_5247;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  assy_location_data;

procedure Test1;
var
 Form: TFrmAssyLocationData;
begin
  Form := TFrmAssyLocationData.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5247', 'AssyData', 'assy_location_data', 'create', Test1);
end.
