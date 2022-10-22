unit WC_7882;

interface

implementation

uses
  TestReg,
  System.Variants,
  Prn_MRB_WO,
  DateUtils,
  System.SysUtils  ;

procedure Test1;
begin
  DoPrintMRB_WO(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7882', 'Print_Dialogs', 'FrmPrintMRB_WO', 'DoPrintMRB_WO', Test1);
end.
