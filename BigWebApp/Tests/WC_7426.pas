unit WC_7426;

interface

implementation

uses
  TestReg,
  System.Variants,
  MCRates;

procedure TestDoMultiCurrencyModal;
begin
  DoMultiCurrencyModal;
end;

procedure TestDoMultiCurrency;
begin
  DoMultiCurrency;
end;

initialization

  TTestRepo.RegisterTest('WC-7426', 'Multicur ', 'FrmMCrates ', 'DoMultiCurrencyModal', TestDoMultiCurrencyModal, 1);
  TTestRepo.RegisterTest('WC-7426', 'Multicur ', 'FrmMCrates ', 'DoMultiCurrency', TestDoMultiCurrency, 2);
end.
