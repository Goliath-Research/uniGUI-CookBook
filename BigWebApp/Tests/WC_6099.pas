unit WC_6099;

interface

implementation

uses
  TestReg,
  System.Variants,
  AvDtlWO;

procedure Test1;
begin
  DoCreate(34251, 3-2-2001);
end;

initialization

  TTestRepo.RegisterTest('WC-6099', 'Fgavail', 'FrmFGAvailDetailWO', 'DoCreate', Test1);
end.
