unit WC_5986;

interface

implementation

uses
  TestReg,
  System.Variants,
  Dsp_Reverse,
  uniGUIApplication;

procedure Test1;
var
  FrmDispoReverseProduction: TFrmDispoReverseProduction;
begin
  FrmDispoReverseProduction := TFrmDispoReverseProduction.create(uniGUIApplication.UniApplication);

end;

initialization

  TTestRepo.RegisterTest('WC-5986', 'Dispo', 'Dsp_Reverse', 'FormCreate', Test1, 1);
end.
