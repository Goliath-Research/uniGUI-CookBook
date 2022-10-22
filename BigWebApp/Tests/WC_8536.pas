unit WC_8536;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  std_labor_assy1;

procedure Test1;
begin
  TFrmStdLaborHrsAssy1.Create(UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8536', 'Shop_Su', 'FrmStdLaborHrsAssy1', 'Create', Test1);
end.
