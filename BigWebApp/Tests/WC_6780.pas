unit WC_6780;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  SchMaint;

procedure TestTFrmSchemaMaint;
begin
  DoArcustoSchema;
end;

initialization

  TTestRepo.RegisterTest('WC-6780', 'Iqimp', 'SchMaint', 'DoArcustoSchema', TestTFrmSchemaMaint);

end.
