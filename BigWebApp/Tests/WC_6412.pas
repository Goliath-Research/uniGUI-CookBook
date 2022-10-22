unit WC_6412;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  price_breaks_buying;

procedure Test1;
begin
  TFrmPriceBreaksBuying.DoShowModal(147145, 147145);
end;

initialization

  TTestRepo.RegisterTest('WC-6412', 'Inv', 'price_breaks_buying', 'DoShowModal', Test1);

end.
