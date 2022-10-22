unit WC_7888;

interface

implementation

uses
  TestReg,
  System.Variants,
  Prn_PS,
  DateUtils,
  System.SysUtils  ;

procedure Test1;
begin
  DoPrintPS(DateTimeToStr(now), DateTimeToStr(now-1));
end;

procedure Test2;
begin
  DoPrintPS_Silent(DateTimeToStr(now), DateTimeToStr(now-1));
end;

initialization

  TTestRepo.RegisterTest('WC-7888', 'Print_Dialogs', 'FrmPrintDocsPS', 'DoPrintPS', Test1, 1);
  TTestRepo.RegisterTest('WC-7888', 'Print_Dialogs', 'FrmPrintDocsPS', 'DoPrintPS_Silent', Test1, 2);
end.
