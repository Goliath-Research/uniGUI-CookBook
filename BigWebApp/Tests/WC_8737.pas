unit WC_8737;

interface

implementation

uses
  TestReg,
  System.Variants,
  Taxmain;

procedure Test1;
begin
  DoTaxCode;
end;

initialization

  TTestRepo.RegisterTest('WC-8737', 'Taxcodes', 'FormTaxMain', 'DoTaxCode', Test1);
end.
