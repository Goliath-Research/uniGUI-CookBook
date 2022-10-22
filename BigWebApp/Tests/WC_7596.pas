unit WC_7596;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  secured_confirm_restore_pktkt;

procedure Test1;
var
 Form: TFrmSecuredConfirmRestorePkTkt;
begin
   Form := TFrmSecuredConfirmRestorePkTkt.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-7596', 'Packslip', 'secured_confirm_restore_pktkt', 'create', Test1);
end.
