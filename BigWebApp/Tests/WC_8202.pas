unit WC_8202;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MainModule,
  UniGUIApplication,
  Quote_UOM;

procedure TestTTMatEdit;
begin
  GetQuote_UOM;
end;

initialization

  TTestRepo.RegisterTest('WC-8202', 'Quote', 'Quote_UOM', 'GetQuote_UOM', TestTTMatEdit);

end.
