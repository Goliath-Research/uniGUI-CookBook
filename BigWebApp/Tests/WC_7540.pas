unit WC_7540;

interface

implementation

uses
  TestReg,
  System.Variants,
  NewLocat;

procedure Test1;
var
  AFGMultiID: Real;
begin
  AFGMultiID := 187242;
  GetNewLocationByArinvt(147536,
                         AFGMultiID,
                         154);
end;

procedure Test2;
var
  AFGMultiID: Real;
begin
  AFGMultiID := 187242;
  GetNewLocationByArinvt_B(147536,
                           AFGMultiID,
                           36,
                           154);
end;

procedure Test3;
var
  AFGMultiID: Real;
begin
  AFGMultiID := 187242;
 GetNewLocationDefaultLotByArinvt(147536,
                                  AFGMultiID,
                                  'Test',
                                  3-2-2011,
                                  154);
end;

initialization

  TTestRepo.RegisterTest('WC-7540', 'Packslip', 'FrmNewLocByArinvt', 'GetNewLocationByArinvt', Test1, 1);
  TTestRepo.RegisterTest('WC-7540', 'Packslip', 'FrmNewLocByArinvt', 'GetNewLocationByArinvt_B', Test2, 2);
  TTestRepo.RegisterTest('WC-7540', 'Packslip', 'FrmNewLocByArinvt', 'GetNewLocationDefaultLotByArinvt', Test3, 3);
end.
