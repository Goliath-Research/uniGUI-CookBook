unit WC_6257;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FrmCostInvolved;

procedure Test1;
var
   aResult : Boolean;
begin
  aResult:=TFrmCostInvolvedCalcCopy.Execute(  1 );
end;

procedure Test2;
var
   aResult : Boolean;
begin
  aResult:=TFrmCostInvolvedCalcCopy.IsMfgItem(  1 );
end;

procedure Test3;
var
   aResult : Boolean;
begin
  aResult:=TFrmCostInvolvedCalcCopy.IsFutureCostExist(  1 );
end;

procedure Test4;
var
   aResult : Boolean;
begin
  aResult:=TFrmCostInvolvedCalcCopy.IsSoftBlend(  161459 );
end;




initialization

  TTestRepo.RegisterTest('WC-6257', 'Inv', 'FrmCostInvolved', 'Execute', Test1, 1);
  TTestRepo.RegisterTest('WC-6257', 'Inv', 'FrmCostInvolved', 'IsMfgItem', Test2, 1);
  TTestRepo.RegisterTest('WC-6257', 'Inv', 'FrmCostInvolved', 'IsFutureCostExist', Test3, 1);
  TTestRepo.RegisterTest('WC-6257', 'Inv', 'FrmCostInvolved', 'IsSoftBlend', Test4, 1);

end.
