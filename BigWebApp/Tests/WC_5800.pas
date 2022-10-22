unit WC_5800;

interface

implementation

uses
  TestReg,
  crm_ctp_param,
  uniGUIApplication;

procedure Test1;
var
  FrmCRM_CTP_Params : TFrmCRM_CTP_Params;
begin
  FrmCRM_CTP_Params := TFrmCRM_CTP_Params.create(uniGUIApplication.UniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5800', 'CRM_Quote', 'crm_ctp_param', 'DoCRMSalesConfigChoiceWhereUsed', Test1);

end.
