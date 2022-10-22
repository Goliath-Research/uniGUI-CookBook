unit WC_6807;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  M_Filter;

procedure Test1;
var
 Form: TFrmM_Filter;
begin
  Form := TFrmM_Filter.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-6807', 'Iqmeter', 'M_Filter', 'Create', Test1);
end.
