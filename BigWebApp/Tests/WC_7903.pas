unit WC_7903;

interface

implementation

uses
  TestReg,
  System.SysUtils,
  Prn_tl;

procedure TestDoPrintTooling;

begin
  DoPrintTooling(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7903', 'Print_Dialogs', 'FrmPrintDocsTooling', 'DoPrintTooling', TestDoPrintTooling);
end.
