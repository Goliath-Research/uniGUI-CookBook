unit WC_5576;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  cc_trans_analyzer;

procedure Test1;
begin
  TFrmCCTransAnalyzer.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-5576', 'Creditcard', 'cc_trans_analyzer', 'DoShow', Test1);
end.
