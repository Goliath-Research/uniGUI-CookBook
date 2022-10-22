unit WC_7597;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  secured_confirn_restore_pktkt;

procedure Test1;
var
 Form: TFrmSecuredConfirmRestorePkTkt;
begin
   Form := TFrmSecuredConfirmRestorePkTkt.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7597', 'Packslip', 'secured_confirn_restore_pktkt', 'create', Test1);
end.
