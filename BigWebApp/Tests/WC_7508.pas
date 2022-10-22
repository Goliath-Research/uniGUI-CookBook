unit WC_7508;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  oe_sec_conf_rel_dates_past;

procedure Test1;
var
 Form: TFrmSecuredConfirmReleaseDatesPast;
begin
   Form := TFrmSecuredConfirmReleaseDatesPast.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7508', 'Oe', 'oe_sec_conf_rel_dates_past', 'create', Test1);
end.
