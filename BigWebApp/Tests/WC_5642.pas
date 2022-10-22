unit WC_5642;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  crm_drill_arinvoice;

procedure TestDoShowArinvtPurchases;
begin
  DoShowArinvtPurchases('08092-102',20174);
end;

initialization

  TTestRepo.RegisterTest('WC-5642', 'Crm', 'crm_drill_arinvoice ', 'DoShowArinvtPurchases', TestDoShowArinvtPurchases);

end.
