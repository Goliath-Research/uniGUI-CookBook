unit WC_8739;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  tax_usage_types;

procedure Test1;
begin
  DoTaxUsageTypes;
end;

initialization

  TTestRepo.RegisterTest('WC-8739', 'Taxcodes', 'tax_usage_types', 'DoTaxUsageTypes', Test1, 1);

end.
