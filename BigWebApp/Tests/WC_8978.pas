unit WC_8978;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  wc_sec_conf_exceed_rt_lic;

procedure Test1;
var
 Form: TFrmSecConfExceedRTLic;
begin
   Form := TFrmSecConfExceedRTLic.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8978', 'Oe', 'wc_sec_conf_exceed_rt_lic', 'create', Test1);
end.
