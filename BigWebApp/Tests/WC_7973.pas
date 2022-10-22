unit WC_7973;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIDialogs,
  System.StrUtils,
  ProdManu;

procedure Test1;
var
  AProdDate:TDateTime;
  AShift:Integer;
  AMfgCell:string;
begin
  AProdDate := 3-4-2016;
  AShift := 1;
  AMfgCell := 'INJECTION';
  ShowMessage(IfThen( GetNewProdManual(AProdDate, AShift, AMfgCell ), 'OK', 'Cancel'));
end;

initialization

  TTestRepo.RegisterTest('WC-7973', 'Prod', 'FrmProdNewManualRepDialog', 'GetNewProdManual', Test1);
end.
