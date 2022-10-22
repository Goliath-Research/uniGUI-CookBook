unit WC_5815;

interface

implementation

uses
  TestReg,
  crm_soconfig_multidlg;

procedure Test1;
var
  LOptionID, LChoiceID: Real;
  LOperator: String;
begin
  DoSoConfigMultiDlg(80, LOptionID, LChoiceID, LOperator);
end;

initialization

  TTestRepo.RegisterTest('WC-5815', 'CRM_Quote', 'crm_soconfig_multidlg', 'DoSoConfigMultiDlg', Test1);

end.
