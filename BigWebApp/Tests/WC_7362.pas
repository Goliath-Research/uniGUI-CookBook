unit WC_7362;

interface

implementation

uses
  TestReg,
  System.Variants,
  jc_posted_trans;

procedure Test1;
begin
  TFrmJobCostPostedTrans.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-7362', 'Jc', 'FrmJobCostPostedTrans', 'DoShow', Test1);
end.
