unit WC_6519;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  dbtfld;

procedure test1;
var
 ADataType: String;
 ALength: SmallInt;
 APrecision: SmallInt;
 AScale: SmallInt;
 ADefinition: String ;
begin
   ADataType := 'test';
   ALength := 34;
   APrecision := 3;
   AScale := 4;
   ADefinition := 'test';

  DoDefineField('test',ADataType,ALength,APrecision,AScale,ADefinition);
end;

initialization

  TTestRepo.RegisterTest('WC-6519', 'Iqdbtrans', 'dbtfld', 'DoDefineField', test1);

end.
