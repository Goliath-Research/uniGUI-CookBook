unit WC_6860;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  pra_params;

procedure Test1;
var
 Form: TFrmPRAParams;
begin
  Form := TFrmPRAParams.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-6860', 'Iqpra', 'pra_params', 'create', Test1);
end.
