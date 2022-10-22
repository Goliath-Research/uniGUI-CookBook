unit WC_8132;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MainModule,
  UniGUIApplication,
  QPriceBreaks;

procedure TestTTFrmQuotePriceBreaks;
begin
  DoQPriceBreaks(25);
end;

initialization

  TTestRepo.RegisterTest('WC-8132', 'Quote', 'QPriceBreaks', 'DoQPriceBreaks', TestTTFrmQuotePriceBreaks);

end.
