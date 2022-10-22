unit WC_7126;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  spc_gage_stability;

procedure Test1;
var
 Form: TFrmSPCGageStability;
begin
   Form := TFrmSPCGageStability.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7126', 'Iqspc', 'spc_gage_stability', 'create', Test1);
end.
