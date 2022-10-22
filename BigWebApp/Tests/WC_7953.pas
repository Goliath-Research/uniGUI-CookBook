unit WC_7953;

interface

implementation

uses
  TestReg,
  System.Variants,
  IQMS.PrintLabels.lmedit;

procedure Test1;
begin
  DoLabelMaintenance;
end;

initialization

  TTestRepo.RegisterTest('WC-7953', 'Print_Labels', 'Iqlmedit', 'DoLabelMaintenance', Test1);
end.
