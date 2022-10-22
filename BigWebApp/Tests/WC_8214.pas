unit WC_8214;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MainModule,
  UniGUIApplication,
  q_where_used;

procedure TestTTFrmQuoteWhereUsed;
begin
  TFrmQuoteWhereUsed.DoShow(25);
end;

initialization

  TTestRepo.RegisterTest('WC-8214', 'Quote', 'q_where_used', 'DoShow', TestTTFrmQuoteWhereUsed);

end.
