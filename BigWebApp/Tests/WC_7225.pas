unit WC_7225;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  Tl_letterparams;

procedure TestTFrmTLLetterParams;
 var
   AToolingReportName, AQuoteReportName, ATemplateName: String;
begin
  AToolingReportName := 'test';
  AQuoteReportName := 'test';
  ATemplateName := 'test';
  GetTLLetterParams(AToolingReportName, AQuoteReportName, ATemplateName);
end;

initialization

  TTestRepo.RegisterTest('WC-7225', 'Iqtool', 'Tl_letterparams', 'GetTLLetterParams', TestTFrmTLLetterParams);

end.
