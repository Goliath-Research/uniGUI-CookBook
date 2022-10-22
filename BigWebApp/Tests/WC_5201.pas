unit WC_5201;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ArPrepTax;

procedure TestDoARTaxBreakDown;
begin
  DoARTaxBreakDown(13875, 3423);
end;

procedure TestDoARPostTaxBreakDown;
begin
  DoARPostTaxBreakDown(13875, 3423);
end;

procedure TestDoARVoidTaxBreakDown;
begin
  DoARVoidTaxBreakDown(13875, 3423);
end;

procedure TestDoAPPrepostTaxBreakDown;
begin
  DoAPPrepostTaxBreakDown(13875, 3423);
end;

procedure TestDoAPInvoiceTaxBreakDown;
begin
  DoAPInvoiceTaxBreakDown(13875, 3423);
end;

procedure TestDoAPVoidTaxBreakDown;
begin
  DoAPVoidTaxBreakDown(13875, 3423);
end;

procedure TestDoOETaxBreakDown;
begin
  DoOETaxBreakDown(13875, 3423);
end;

procedure TestDoOEHistTaxBreakDown;
begin
  DoOEHistTaxBreakDown(13875, 3423);
end;

procedure TestDoPOTaxBreakDown;
begin
  DoPOTaxBreakDown(13875, 3423);
end;

procedure TestDoPOHistTaxBreakDown;
begin
  DoPOHistTaxBreakDown(13875, 3423);
end;

procedure TestDoAPPrepostUseTaxBreakDown;
begin
  DoAPPrepostUseTaxBreakDown(13875, 3423);
end;

procedure TestDoAPInvoiceUseTaxBreakDown;
begin
  DoAPInvoiceUseTaxBreakDown(13875, 3423);
end;

procedure TestDoAPVoidUseTaxBreakDown;
begin
  DoAPVoidUseTaxBreakDown(13875, 3423);
end;

procedure TestDoQuoteTaxBreakDown;
begin
  DoQuoteTaxBreakDown(13875, 3423);
end;


initialization

  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoARTaxBreakDown', TestDoARTaxBreakDown, 1);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoARPostTaxBreakDown', TestDoARPostTaxBreakDown, 2);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoARVoidTaxBreakDown', TestDoARVoidTaxBreakDown, 3);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoAPPrepostTaxBreakDown', TestDoAPPrepostTaxBreakDown, 4);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoAPInvoiceTaxBreakDown', TestDoAPInvoiceTaxBreakDown, 5 );
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoAPVoidTaxBreakDown', TestDoAPVoidTaxBreakDown, 6);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoOETaxBreakDown', TestDoOETaxBreakDown, 7);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoOEHistTaxBreakDown', TestDoOEHistTaxBreakDown, 8);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoPOTaxBreakDown', TestDoPOTaxBreakDown, 9);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoPOHistTaxBreakDown', TestDoPOHistTaxBreakDown, 10);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoAPPrepostUseTaxBreakDown', TestDoAPPrepostUseTaxBreakDown, 11);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoAPInvoiceUseTaxBreakDown', TestDoAPInvoiceUseTaxBreakDown, 12);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoAPVoidUseTaxBreakDown', TestDoAPVoidUseTaxBreakDown, 13);
  TTestRepo.RegisterTest('WC-5201', 'Ar', 'ArPrepTax', 'DoQuoteTaxBreakDown', TestDoQuoteTaxBreakDown, 14);
end.
