unit WC_7543;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  System.StrUtils,
  NonConfChk;

procedure Test1;
begin
  CheckLocationForNonConform(166761);
end;

procedure Test2;
begin
  ShowMessage(IfThen(  CheckLocationForNonConform2( 166761 ), 'OK', 'Cancel'));
end;

initialization

  TTestRepo.RegisterTest('WC-7543', 'Packslip', 'NonConfChk', 'CheckLocationForNonConform', Test1, 1);
  TTestRepo.RegisterTest('WC-7543', 'Packslip', 'NonConfChk', 'CheckLocationForNonConform2', Test2, 2);

end.
