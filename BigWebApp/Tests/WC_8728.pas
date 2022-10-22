unit WC_8728;

interface

implementation

uses
  TestReg,
  uniGUIDialogs,
  Germany_Form;

procedure Test1;
var
  aCustomerFile,aVendorFile,aGLFile,aGLAcctFile,aVatFile: String;
  aGlYearId,aEplantId: Real;

begin
aEplantId := 0;
  GetGermanyInfo(aCustomerFile,aVendorFile,aGLFile,aGLAcctFile,aVatFile,aGlYearId,aEplantId);
end;

initialization

TTestRepo.RegisterTest('WC-8728', 'Tax Reporting Tool', 'Germany_Form',
  'GetGermanyInfo', Test1);

end.
