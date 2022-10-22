unit WC_5616;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  crm_aka1;

procedure Test1;
var
   AArcustoID: Int64 ;
begin
   AArcustoID:=100;
  TFrmCRMEditCustomerAka.DoShow(AArcustoID);
end;

initialization

  TTestRepo.RegisterTest('WC-5616', 'CRM', 'crm_aka1', 'DoShow', Test1);

end.
