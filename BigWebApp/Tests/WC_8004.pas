unit WC_8004;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  prw_sec_conf_calc_vol;

procedure Test1;
var
 Form: TFrmPRWSecConfCalcVolume;
begin
   Form := TFrmPRWSecConfCalcVolume.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8004', 'Prw', 'prw_sec_conf_calc_vol', 'create', Test1);
end.
