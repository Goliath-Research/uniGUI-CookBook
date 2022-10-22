unit WC_6365;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  inv_sec_conf_hide_match_rfq;

procedure Test1;
var
 Form: TFrmSecuredConfirmHideMatchRFQ;
begin
   Form := TFrmSecuredConfirmHideMatchRFQ.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-6365', 'Inv', 'inv_sec_conf_hide_match_rfq', 'create', Test1);
end.
