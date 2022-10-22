unit WC_7919;

interface

implementation

uses
  TestReg,
  System.Variants,
  System.SysUtils,
  DateUtils,
  prn_wo_direct_staging;

procedure TestDoShow;
begin
  TFrmPrintWODirectedStaging.DoShow(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7919', 'Print_Dialogs', 'FrmPrintWODirectedStaging', 'DoShow', TestDoShow);
end.
